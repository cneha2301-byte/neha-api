# New Step Definition: Data Type Validation

## Overview
I've created a new step definition `validating the response field data types` specifically for validating data types in API responses.

## Usage in Feature Files

### Before (Incorrect Usage):
```gherkin
And validating the response contains the following values
  |JPath|ExpectedType|
  |$.data[0].Warehouseskunit.id|string|
  |$.data[0].Warehouseskunit.warehouse_id|string|
```

### After (Correct Usage):
```gherkin
And validating the response field data types
  |JPath|ExpectedType|
  |$.data[0].Warehouseskunit.id|string|
  |$.data[0].Warehouseskunit.warehouse_id|string|
```

## Supported Data Types

The new step definition supports the following data types:

- **string** - Text values
- **number** - Numeric values (int, integer, float, double, long)
- **boolean** - True/false values
- **array** - List/array values
- **object** - JSON object/map values
- **null** - Null values

## Type Aliases Supported

- `int`, `integer` → `number`
- `str`, `text` → `string`
- `bool` → `boolean`
- `arr`, `list` → `array`
- `obj`, `map` → `object`

## Example Usage

```gherkin
@Positive @DataValidation
Scenario: Validate warehouse SK unit list response structure
  When I send the GET request to "warehouse_skunit_list" endpoint with path parameters
    |Path|Value|
    |warehouseId|1|
  And I send the GET request to "warehouse_skunit_list" endpoint with dynamic access token, path and query parameters
    |QueryParamName|QueryParamValue|
    |access_token|ACCESS_TOKEN|
  Then I should see the response code as "200"
  And verify response time is less than "2000" milliseconds
  And the fields in response should match with expected values
    |JPath|Value|
    |$.Result|true|
    |$.Reason|fetched successfully|
  And validating the response field data types
    |JPath|ExpectedType|
    |$.data|array|
    |$.data[0].Warehouseskunit|object|
    |$.data[0].Warehouseskunit.id|string|
    |$.data[0].Warehouseskunit.warehouse_id|string|
    |$.data[0].Warehouseskunit.skunit_id|string|
    |$.data[0].Warehouseskunit.mrp|string|
    |$.data[0].Warehouseskunit.price|string|
    |$.data[0].Warehouseskunit.vat|string|
    |$.data[0].Warehouseskunit.warehouses|object|
    |$.data[0].Warehouseskunit.skunits|object|
```

## Key Features

1. **Type Detection**: Automatically detects the actual data type of response fields
2. **Flexible Matching**: Supports common type aliases and case-insensitive matching
3. **Detailed Reporting**: Provides clear success/failure messages with actual vs expected types
4. **Error Handling**: Comprehensive error handling with descriptive failure messages
5. **Integration**: Seamlessly integrates with existing ReportManager for logging

## Implementation Details

The step definition includes three main methods:

1. **`validateResponseFieldDataTypes()`** - Main validation method
2. **`determineDataType()`** - Determines the actual data type of a value
3. **`validateDataType()`** - Compares actual vs expected types with alias support

This new step definition provides a robust way to validate data types in API responses, ensuring that the response structure matches the expected schema.
