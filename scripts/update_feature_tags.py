#!/usr/bin/env python3
"""
Script to update feature files with category tags based on their management directory.

Usage:
    python scripts/update_feature_tags.py

This script will:
1. Scan all feature files in src/test/java/com/Bizom/BizomWebAPI/feature/
2. Identify the management directory for each feature file
3. Add the appropriate category tag based on the tagging system
4. Update the feature file with the new tag structure
"""

import os
import re
from pathlib import Path

# Tag mapping based on management directory
TAG_MAPPING = {
    # CoreBusinessOperations
    'OrdersManagement': '@CoreBusinessOperations',
    'PaymentsManagement': '@CoreBusinessOperations',
    'SalesmanSalesReturnsManagement': '@CoreBusinessOperations',
    'InventoriesManagement': '@CoreBusinessOperations',
    'InventoryManagement': '@CoreBusinessOperations',
    'StockTransfersManagement': '@CoreBusinessOperations',
    'LoadInsManagement': '@CoreBusinessOperations',
    'LoadoutsManagement': '@CoreBusinessOperations',
    'DistributorTransfersManagement': '@CoreBusinessOperations',
    'InvoiceRequestsManagement': '@CoreBusinessOperations',
    'BankReceiptsManagement': '@CoreBusinessOperations',
    'BanksManagement': '@CoreBusinessOperations',
    
    # MasterDataManagement
    'OutletsManagement': '@MasterDataManagement',
    'OutletCategoriesManagement': '@MasterDataManagement',
    'OutletTypesManagement': '@MasterDataManagement',
    'OutletContactsManagement': '@MasterDataManagement',
    'OutletBalancesManagement': '@MasterDataManagement',
    'OutletTargetsManagement': '@MasterDataManagement',
    'EnrolledOutletsManagement': '@MasterDataManagement',
    'AgeingOutletsManagement': '@MasterDataManagement',
    'UserManagement': '@MasterDataManagement',
    'RolesManagement': '@MasterDataManagement',
    'WarehousesManagement': '@MasterDataManagement',
    'WarehouseTypesManagement': '@MasterDataManagement',
    'WarehouseCategoriesManagement': '@MasterDataManagement',
    'WarehouseAssetsManagement': '@MasterDataManagement',
    'SKUnitsManagement': '@MasterDataManagement',
    'SkuUnitsManagement': '@MasterDataManagement',
    'SKUnitsGroupingsManagement': '@MasterDataManagement',
    'SkuUnitsGroupingsManagement': '@MasterDataManagement',
    'SkuLinesManagement': '@MasterDataManagement',
    'SkuEntityPrioritiesManagement': '@MasterDataManagement',
    'SkuGstSlabsManagement': '@MasterDataManagement',
    'SkuVisibilitiesManagement': '@MasterDataManagement',
    'BrandsManagement': '@MasterDataManagement',
    'SubbrandsManagement': '@MasterDataManagement',
    'CategoriesManagement': '@MasterDataManagement',
    'SubcategoriesManagement': '@MasterDataManagement',
    'VariantsManagement': '@MasterDataManagement',
    'SizesManagement': '@MasterDataManagement',
    'UnitsManagement': '@MasterDataManagement',
    'BeatsManagement': '@MasterDataManagement',
    'BeatDetailsManagement': '@MasterDataManagement',
    'BeatJumpsManagement': '@MasterDataManagement',
    'BeatTypesManagement': '@MasterDataManagement',
    'AreasManagement': '@MasterDataManagement',
    'AreaCategoriesManagement': '@MasterDataManagement',
    'CitiesManagement': '@MasterDataManagement',
    'DistrictsManagement': '@MasterDataManagement',
    'TownsManagement': '@MasterDataManagement',
    'VillagesManagement': '@MasterDataManagement',
    'StatesManagement': '@MasterDataManagement',
    'CountriesManagement': '@MasterDataManagement',
    'TransportersManagement': '@MasterDataManagement',
    'VehiclesManagement': '@MasterDataManagement',
    'ReasonsManagement': '@MasterDataManagement',
    'WorkflowReasonsManagement': '@MasterDataManagement',
    'TourBudgetsManagement': '@MasterDataManagement',
    'CompaniesManagement': '@MasterDataManagement',
    'BusinessTypesManagement': '@MasterDataManagement',
    'BusinessUnitsManagement': '@MasterDataManagement',
    'ChannelsManagement': '@MasterDataManagement',
    'SegmentsManagement': '@MasterDataManagement',
    'SegmentRulesManagement': '@MasterDataManagement',
    'SegmentChangeRequestsManagement': '@MasterDataManagement',
    'PopsManagement': '@MasterDataManagement',
    'PopsStrataManagement': '@MasterDataManagement',
    'MSLsManagement': '@MasterDataManagement',
    'ShelfsManagement': '@MasterDataManagement',
    'SecondaryDisplayTypesManagement': '@MasterDataManagement',
    'VisitingTypesManagement': '@MasterDataManagement',
    'DeliveryShiftsManagement': '@MasterDataManagement',
    'ShiftsManagement': '@MasterDataManagement',
    'ShiftTimingsManagement': '@MasterDataManagement',
    'StagesManagement': '@MasterDataManagement',
    'LanguagesManagement': '@MasterDataManagement',
    'CurrencyListManagement': '@MasterDataManagement',
    'CreditLevelsManagement': '@MasterDataManagement',
    'EntityTagsManagement': '@MasterDataManagement',
    'EntityWisePropertiesManagement': '@MasterDataManagement',
    'MenusManagement': '@MasterDataManagement',
    'AppTabSequencesManagement': '@MasterDataManagement',
    
    # ConfigurationSettings
    'SettingsManagement': '@ConfigurationSettings',
    'ClaimApprovalsManagement': '@ConfigurationSettings',
    'ClaimLimitConfigurationsManagement': '@ConfigurationSettings',
    'UserClaimTypesManagement': '@ConfigurationSettings',
    'SaleReturnApprovalConfigurationsManagement': '@ConfigurationSettings',
    'LeaveConfigurationsManagement': '@ConfigurationSettings',
    'LeaveTypesManagement': '@ConfigurationSettings',
    'DisclaimersManagement': '@ConfigurationSettings',
    'ManagerRolesManagement': '@ConfigurationSettings',
    'MappingsManagement': '@ConfigurationSettings',
    'InvoiceTemplateMappingsManagement': '@ConfigurationSettings',
    'BenefitCappingManagement': '@ConfigurationSettings',
    'DepoMarginsManagement': '@ConfigurationSettings',
    'AggregateTypesManagement': '@ConfigurationSettings',
    'InventoryTypesManagement': '@ConfigurationSettings',
    'PromotionTypesManagement': '@ConfigurationSettings',
    'SchemeTradeTypeMastersManagement': '@ConfigurationSettings',
    'MerchandisingShelfTypesManagement': '@ConfigurationSettings',
    'ActivityTypesManagement': '@ConfigurationSettings',
    
    # ReportsAnalytics
    'ReportsManagement': '@ReportsAnalytics',
    'ReportGroupsManagement': '@ReportsAnalytics',
    'ReportMappingsManagement': '@ReportsAnalytics',
    'DashboardsManagement': '@ReportsAnalytics',
    'DashboardManagement': '@ReportsAnalytics',
    'EndOfDayReportsManagement': '@ReportsAnalytics',
    'CustomReportsManagement': '@ReportsAnalytics',
    'ActivityFormReportManagement': '@ReportsAnalytics',
    
    # SupportingFunctions
    'ActivitiesManagement': '@SupportingFunctions',
    'ActivityFormDatasManagement': '@SupportingFunctions',
    'ClaimsManagement': '@SupportingFunctions',
    'DiscountsManagement': '@SupportingFunctions',
    'DiscountCategoriesManagement': '@SupportingFunctions',
    'SchemesManagement': '@SupportingFunctions',
    'MerchandisingManagement': '@SupportingFunctions',
    'CompetitorManagement': '@SupportingFunctions',
    'ComplaintManagement': '@SupportingFunctions',
    'ChecksManagement': '@SupportingFunctions',
    'CallsManagement': '@SupportingFunctions',
    'BidsManagement': '@SupportingFunctions',
    'CollateralsManagement': '@SupportingFunctions',
    'PayeeDetailsManagement': '@SupportingFunctions',
    'PushRegistrationsManagement': '@SupportingFunctions',
    'SyncApisManagement': '@SupportingFunctions',
    'MdmsManagement': '@SupportingFunctions',
    'BackgroundProcessesManagement': '@SupportingFunctions',
    'AssetManagement': '@SupportingFunctions',
    'General': '@SupportingFunctions',
}

def get_management_directory(file_path):
    """Extract management directory from file path."""
    parts = Path(file_path).parts
    try:
        # Find the index of 'feature' directory
        feature_idx = parts.index('feature')
        if feature_idx + 1 < len(parts):
            return parts[feature_idx + 1]
    except (ValueError, IndexError):
        pass
    return None

def update_feature_file(file_path):
    """Update a feature file with the appropriate category tag."""
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # Get management directory
        mgmt_dir = get_management_directory(file_path)
        if not mgmt_dir:
            print(f"Warning: Could not determine management directory for {file_path}")
            return False
        
        # Get category tag
        category_tag = TAG_MAPPING.get(mgmt_dir)
        if not category_tag:
            print(f"Warning: No tag mapping found for {mgmt_dir} in {file_path}")
            return False
        
        # Check if file already has the category tag
        if category_tag in content:
            print(f"Already tagged: {file_path}")
            return False
        
        # Pattern to match the first line with @BizomWebAPI
        pattern = r'^(@BizomWebAPI)(\s+@[^\s]+)*'
        
        def replace_tags(match):
            tags = match.group(0)
            # Check if category tag already exists
            if category_tag in tags:
                return tags
            # Add category tag after @BizomWebAPI
            return f'@BizomWebAPI {category_tag}' + tags.replace('@BizomWebAPI', '').strip()
        
        new_content = re.sub(pattern, replace_tags, content, flags=re.MULTILINE)
        
        if new_content != content:
            with open(file_path, 'w', encoding='utf-8') as f:
                f.write(new_content)
            print(f"Updated: {file_path} with {category_tag}")
            return True
        else:
            print(f"No changes needed: {file_path}")
            return False
            
    except Exception as e:
        print(f"Error processing {file_path}: {e}")
        return False

def main():
    """Main function to update all feature files."""
    base_dir = Path('src/test/java/com/Bizom/BizomWebAPI/feature')
    
    if not base_dir.exists():
        print(f"Error: Directory {base_dir} does not exist")
        return
    
    feature_files = list(base_dir.rglob('*.feature'))
    print(f"Found {len(feature_files)} feature files")
    
    updated_count = 0
    for feature_file in feature_files:
        if update_feature_file(feature_file):
            updated_count += 1
    
    print(f"\nUpdated {updated_count} feature files")

if __name__ == '__main__':
    main()

