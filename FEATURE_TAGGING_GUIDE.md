# Feature File Tagging System - Quick Reference Guide

## Overview
All feature files in the BizomWebAPI test suite are now categorized into 5 main tags for organized test execution.

## The 5 Category Tags

### 1. @CoreBusinessOperations
**Focus**: Core business transactions and operations
- Orders, Payments, Sales Returns
- Inventory Management
- Stock Transfers, Load Ins/Outs
- Invoice Requests, Bank Receipts

**Example**: `@BizomWebAPI @CoreBusinessOperations @OrdersManagement @ListOrders`

### 2. @MasterDataManagement
**Focus**: Master data entities and configurations
- Outlets, Users, Warehouses
- Products (SKUs), Brands, Categories
- Beats, Areas, Locations
- Reasons, Tour Budgets
- All reference/master data

**Example**: `@BizomWebAPI @MasterDataManagement @ReasonsManagement @GetReasonTypeData`

### 3. @ConfigurationSettings
**Focus**: System configuration and administrative functions
- Settings, Approvals, Configurations
- Claim Settings, Leave Configurations
- Mappings, Templates
- Type Masters

**Example**: `@BizomWebAPI @ConfigurationSettings @SettingsManagement @AllSettings`

### 4. @ReportsAnalytics
**Focus**: Reporting, analytics, and data visualization
- Reports, Report Groups
- Dashboards
- End of Day Reports
- Custom Reports

**Example**: `@BizomWebAPI @ReportsAnalytics @ReportsManagement @GetOrder`

### 5. @SupportingFunctions
**Focus**: Supporting business functions and auxiliary features
- Activities, Claims, Discounts, Schemes
- Merchandising, Competitor Management
- Complaints, Checks, Calls
- Assets, Background Processes

**Example**: `@BizomWebAPI @SupportingFunctions @ClaimsManagement @GetClaims`

## Tag Structure

### Standard Format
```gherkin
@BizomWebAPI @[CategoryTag] @[ModuleName] @[FeatureName]
Feature: [Feature Description]
```

### Tag Order
1. `@BizomWebAPI` - Always first (suite identifier)
2. `@[CategoryTag]` - One of the 5 category tags
3. `@[ModuleName]` - Management directory name
4. `@[FeatureName]` - Specific feature/test name

## Test Execution

### Run by Category
```bash
# Run all Core Business Operations tests
mvn test -Dcucumber.filter.tags="@CoreBusinessOperations"

# Run all Master Data Management tests
mvn test -Dcucumber.filter.tags="@MasterDataManagement"

# Run all Configuration & Settings tests
mvn test -Dcucumber.filter.tags="@ConfigurationSettings"

# Run all Reports & Analytics tests
mvn test -Dcucumber.filter.tags="@ReportsAnalytics"

# Run all Supporting Functions tests
mvn test -Dcucumber.filter.tags="@SupportingFunctions"
```

### Run Multiple Categories
```bash
# Run Core Business Operations AND Master Data Management
mvn test -Dcucumber.filter.tags="@CoreBusinessOperations or @MasterDataManagement"

# Run all tests (all categories)
mvn test -Dcucumber.filter.tags="@BizomWebAPI"
```

### Run Specific Module
```bash
# Run all tests in OrdersManagement (regardless of category)
mvn test -Dcucumber.filter.tags="@OrdersManagement"

# Run specific feature
mvn test -Dcucumber.filter.tags="@GetOrder"
```

## Adding New Feature Files

When creating a new feature file:

1. **Identify the Management Directory**
   - Check which management folder your feature belongs to

2. **Determine the Category Tag**
   - Refer to `.cursor/rules/feature-file-tagging-system.mdc` for the complete mapping
   - Or use the script: `python3 scripts/update_feature_tags.py` (it will auto-tag new files)

3. **Add Tags in Correct Order**
   ```gherkin
   @BizomWebAPI @[CategoryTag] @[ModuleName] @[FeatureName]
   Feature: [Description]
   ```

4. **Example for New Feature**
   ```gherkin
   @BizomWebAPI @MasterDataManagement @ReasonsManagement @GetNewReason
   Feature: Get New Reason API Testing
   ```

## Maintenance

### Update Existing Files
If you need to update tags on existing files, run:
```bash
python3 scripts/update_feature_tags.py
```

This script will:
- Scan all feature files
- Identify management directories
- Add appropriate category tags
- Skip files that already have the correct tags

### Documentation
- **Complete Mapping**: `.cursor/rules/feature-file-tagging-system.mdc`
- **Update Script**: `scripts/update_feature_tags.py`

## Statistics

- **Total Feature Files**: 502
- **Updated Files**: 483
- **Already Tagged**: 19
- **Categories**: 5

## Benefits

1. **Organized Execution**: Run tests by business function
2. **Parallel Execution**: Execute different categories in parallel
3. **Focused Testing**: Test specific areas without running entire suite
4. **Maintainability**: Clear categorization for future features
5. **Scalability**: Easy to add new features with proper tags

