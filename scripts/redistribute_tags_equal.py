#!/usr/bin/env python3
"""
Script to redistribute feature files equally across 5 tags.

This script will:
1. Find all feature files
2. Distribute them equally across 5 tags
3. Update each file with the appropriate tag
"""

import os
import re
from pathlib import Path

# The 5 tags for equal distribution
TAGS = [
    '@CoreBusinessOperations',
    '@MasterDataManagement',
    '@ConfigurationSettings',
    '@ReportsAnalytics',
    '@SupportingFunctions'
]

def get_all_feature_files():
    """Get all feature files in the BizomWebAPI directory."""
    base_dir = Path('src/test/java/com/Bizom/BizomWebAPI/feature')
    if not base_dir.exists():
        print(f"Error: Directory {base_dir} does not exist")
        return []
    
    feature_files = sorted(list(base_dir.rglob('*.feature')))
    return feature_files

def get_current_tags(line):
    """Extract current tags from the first line of a feature file."""
    # First, split by spaces
    tags = line.strip().split()
    filtered_tags = []
    
    for tag in tags:
        # Check if tag contains multiple @ symbols (concatenated tags)
        if '@' in tag and tag.count('@') > 1:
            # Split concatenated tags like "@SupportingFunctions@ActivitiesManagement"
            parts = tag.split('@')
            for i, part in enumerate(parts[1:], 1):  # Skip first empty part
                sub_tag = f'@{part}'
                if sub_tag == '@BizomWebAPI':
                    filtered_tags.append(sub_tag)
                elif sub_tag not in TAGS:
                    filtered_tags.append(sub_tag)
        elif tag == '@BizomWebAPI':
            filtered_tags.append(tag)
        elif tag not in TAGS:
            # Keep non-category tags
            filtered_tags.append(tag)
        # Skip all category tags - we'll replace them with the new one
    
    return filtered_tags

def update_feature_file(file_path, new_category_tag):
    """Update a feature file with the new category tag."""
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            lines = f.readlines()
        
        if not lines:
            return False
        
        # Get the first line (tags line)
        first_line = lines[0].rstrip()
        
        # Extract existing tags (this removes ALL category tags)
        existing_tags = get_current_tags(first_line)
        
        # Build new tag line: @BizomWebAPI @[CategoryTag] @[ModuleName] @[FeatureName] ...
        # Find module name from path
        path_parts = Path(file_path).parts
        try:
            feature_idx = path_parts.index('feature')
            if feature_idx + 1 < len(path_parts):
                module_name = path_parts[feature_idx + 1]
                module_tag = f'@{module_name}'
            else:
                module_tag = ''
        except (ValueError, IndexError):
            module_tag = ''
        
        # Build new tags - start with @BizomWebAPI and new category tag
        new_tags = ['@BizomWebAPI', new_category_tag]
        
        # Add module tag if not already present
        if module_tag and module_tag not in existing_tags:
            new_tags.append(module_tag)
        
        # Add other existing tags (excluding @BizomWebAPI and ALL category tags)
        for tag in existing_tags:
            if tag != '@BizomWebAPI' and tag not in TAGS and tag not in new_tags:
                new_tags.append(tag)
        
        new_first_line = ' '.join(new_tags) + '\n'
        
        # Check if update is needed
        current_line = lines[0].rstrip()
        expected_line = new_first_line.rstrip()
        
        # Always update if the line is different
        if current_line == expected_line:
            return False
        
        # Update the first line
        lines[0] = new_first_line
        
        # Write back
        with open(file_path, 'w', encoding='utf-8') as f:
            f.writelines(lines)
        
        return True
        
    except Exception as e:
        print(f"Error processing {file_path}: {e}")
        return False

def main():
    """Main function to redistribute tags equally."""
    feature_files = get_all_feature_files()
    total_files = len(feature_files)
    
    if total_files == 0:
        print("No feature files found!")
        return
    
    print(f"Found {total_files} feature files")
    print(f"Distributing across {len(TAGS)} tags...")
    
    # Calculate distribution
    files_per_tag = total_files // len(TAGS)
    remainder = total_files % len(TAGS)
    
    print(f"\nTarget distribution:")
    for i, tag in enumerate(TAGS):
        count = files_per_tag + (1 if i < remainder else 0)
        print(f"  {tag}: {count} files")
    
    # Distribute files sequentially
    tag_index = 0
    files_for_current_tag = 0
    target_count = files_per_tag + (1 if tag_index < remainder else 0)
    
    updated_count = 0
    tag_counts = {tag: 0 for tag in TAGS}
    
    for feature_file in feature_files:
        current_tag = TAGS[tag_index]
        
        # Always update to ensure exactly one category tag
        if update_feature_file(feature_file, current_tag):
            updated_count += 1
            print(f"Updated: {feature_file.name} -> {current_tag}")
        
        # Count this file for the current tag
        tag_counts[current_tag] += 1
        
        files_for_current_tag += 1
        
        # Move to next tag if we've reached the target count
        if files_for_current_tag >= target_count:
            tag_index += 1
            if tag_index < len(TAGS):
                files_for_current_tag = 0
                target_count = files_per_tag + (1 if tag_index < remainder else 0)
    
    print(f"\n=== Final Distribution ===")
    for tag in TAGS:
        print(f"{tag}: {tag_counts[tag]} files")
    
    print(f"\nTotal updated: {updated_count} files")
    print(f"Total files processed: {len(feature_files)} files")

if __name__ == '__main__':
    main()

