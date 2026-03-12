@BizomWebAPI @SkunitsManagement @GetWarehouseInventories @InventoryManagement @OS
Feature: GetWarehouseInventories API Testing
  As a system user
  I want to test the getwarehouseinventories endpoint
  So that I can ensure proper functionality and data retrieval for warehouse inventories with SKU details

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get warehouse inventories without access token
    When I send the GET request to "skunits_get_warehouse_inventories" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |warehouseId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get warehouse inventories with invalid access token
    And I send the GET request to "skunits_get_warehouse_inventories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
      |warehouseId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get warehouse inventories with expired access token
    And I send the GET request to "skunits_get_warehouse_inventories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
      |warehouseId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get warehouse inventories with malformed access token
    And I send the GET request to "skunits_get_warehouse_inventories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
      |warehouseId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_05 Get warehouse inventories with empty access token
    And I send the GET request to "skunits_get_warehouse_inventories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token||
      |warehouseId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_06 Get warehouse inventories with valid parameters
    And I send the GET request to "skunits_get_warehouse_inventories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And I store the response as "getwarehouseinventories_response" name using full path

  @Positive @DataValidation
  Scenario: TC_07 Validate get warehouse inventories response structure
    And I send the GET request to "skunits_get_warehouse_inventories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Warehouses|array|

  @Positive @DataValidation
  Scenario: TC_08 Validate warehouse object structure in response
    And I send the GET request to "skunits_get_warehouse_inventories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Warehouses[0].warehouse_id|number|
      |$.Warehouses[0].warehouse_name|string|
      |$.Warehouses[0].warehouse_erp_id|string|
      |$.Warehouses[0].Areas|array|
      |$.Warehouses[0].Products|array|

  @Positive @DataValidation
  Scenario: TC_09 Validate Products array and Skunit object structure
    And I send the GET request to "skunits_get_warehouse_inventories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Warehouses[0].Products[0].Skunit|object|
      |$.Warehouses[0].Products[0].Skunit.id|string|
      |$.Warehouses[0].Products[0].Skunit.mrp|string|
      |$.Warehouses[0].Products[0].Skunit.price|string|
      |$.Warehouses[0].Products[0].Skunit.availableinventory|number|
      |$.Warehouses[0].Products[0].Skunit.sku_price|array|
      |$.Warehouses[0].Products[0].Skunit.sku_inventory|array|

  @Positive @DataValidation
  Scenario: TC_10 Validate Skunit nested arrays structure
    And I send the GET request to "skunits_get_warehouse_inventories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Warehouses[0].Products[0].Skunit.sku_price[0]|object|
      |$.Warehouses[0].Products[0].Skunit.sku_price[0].mrp|string|
      |$.Warehouses[0].Products[0].Skunit.sku_price[0].price|string|
      |$.Warehouses[0].Products[0].Skunit.sku_inventory[0]|object|
      |$.Warehouses[0].Products[0].Skunit.sku_inventory[0].batch_id|string|
      |$.Warehouses[0].Products[0].Skunit.sku_inventory[0].availableinventory|string|

  @Positive @DataValidation
  Scenario: TC_11 Validate response contains required fields
    And I send the GET request to "skunits_get_warehouse_inventories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Warehouses|
      |warehouse_id|
      |warehouse_name|
      |Products|
      |Skunit|

  @Negative @Validation
  Scenario: TC_12 Get warehouse inventories with invalid warehouseId
    And I send the GET request to "skunits_get_warehouse_inventories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_13 Get warehouse inventories with non-existent warehouseId
    And I send the GET request to "skunits_get_warehouse_inventories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_14 Get warehouse inventories with missing warehouseId
    And I send the GET request to "skunits_get_warehouse_inventories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "500"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_15 Get warehouse inventories with blank warehouseId
    And I send the GET request to "skunits_get_warehouse_inventories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId||
    Then I should see the response code as "500"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_16 Get warehouse inventories with invalid endpoint
    And I send the GET request to "skunits_get_warehouse_inventories_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: TC_17 Performance test for get warehouse inventories endpoint
    And I send the GET request to "skunits_get_warehouse_inventories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @BusinessLogic
  Scenario: TC_18 Get warehouse inventories with different warehouseId
    And I send the GET request to "skunits_get_warehouse_inventories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @Boundary
  Scenario: TC_19 Get warehouse inventories with zero warehouseId
    And I send the GET request to "skunits_get_warehouse_inventories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|0|
    Then I should see the response code as "500"
    And verify response time is less than "2500" milliseconds

  @Positive @Boundary
  Scenario: TC_20 Get warehouse inventories with very large warehouseId
    And I send the GET request to "skunits_get_warehouse_inventories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|2147483647|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Regression
  Scenario: TC_21 Regression test for get warehouse inventories endpoint
    And I send the GET request to "skunits_get_warehouse_inventories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Warehouses|array|
      |$.Warehouses[0]|object|
      |$.Warehouses[0].warehouse_id|number|
      |$.Warehouses[0].Products|array|
    And I store the response as "getwarehouseinventories_response" name using full path

  @Positive @DataValidation
  Scenario: TC_22 Validate warehouse specific fields in response
    And I send the GET request to "skunits_get_warehouse_inventories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |warehouse_id|
      |warehouse_name|
      |warehouse_erp_id|
      |parentdepo_id|
      |warehouse_outlet_id|
      |Areas|
      |Products|

  @Positive @DataValidation
  Scenario: TC_23 Validate Skunit specific fields in Products array
    And I send the GET request to "skunits_get_warehouse_inventories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Skunit|
      |id|
      |mrp|
      |price|
      |availableinventory|
      |sku_price|
      |sku_inventory|
      |batch_id|

