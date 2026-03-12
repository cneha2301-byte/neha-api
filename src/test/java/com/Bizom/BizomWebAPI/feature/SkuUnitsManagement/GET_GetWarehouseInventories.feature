@BizomWebAPI @SkuUnitsManagement @SkuUnitWarehouseInventories @ProductManagement @OS
Feature: Get Warehouse Inventories API Testing
  As a system user
  I want to test the get warehouse inventories endpoint
  So that I can ensure proper functionality and data retrieval for warehouse inventories with products and SKU information

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

#  @Negative @Security
#  Scenario: TC_01 Get warehouse inventories without access token
#    When I send the GET request to "skunits_get_warehouse_inventories" endpoint with query parameters
#      |QueryParamName|QueryParamValue|
#      |warehouseId|2|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: TC_02 Get warehouse inventories with invalid access token
#    And I send the GET request to "skunits_get_warehouse_inventories" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|invalid_token_12345|
#      |warehouseId|2|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2000" milliseconds
#
#  @Negative @Security
#  Scenario: TC_03 Get warehouse inventories with expired access token
#    And I send the GET request to "skunits_get_warehouse_inventories" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|expired_token_12345|
#      |warehouseId|2|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2000" milliseconds
#
#  @Negative @Security
#  Scenario: TC_04 Get warehouse inventories with malformed access token
#    And I send the GET request to "skunits_get_warehouse_inventories" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|malformed.token.here|
#      |warehouseId|2|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2000" milliseconds
#
#  @Positive @Smoke
#  Scenario: TC_05 Get warehouse inventories with valid access token and warehouse ID 2
#    And I send the GET request to "skunits_get_warehouse_inventories" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |warehouseId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.Warehouses[0].warehouse_id|2|
#      |$.Warehouses[0].warehouse_name|"SLV DISTRIBUTOR"|
#      |$.Warehouses[0].Products[0].Skunit.id|"1"|
#
#    And I store the response as "getWarehouseInventories_response" name using full path
#
#  @Positive @DataValidation
#  Scenario: TC_06 Validate warehouse inventories response structure
#    And I send the GET request to "skunits_get_warehouse_inventories" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |warehouseId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And verifies the field is present in the response
#      |JPath|
#      |$.Result|
#      |$.Reason|
#      |$.Warehouses|
#      |$.Warehouses[0].warehouse_id|
#      |$.Warehouses[0].warehouse_name|
#      |$.Warehouses[0].warehouse_erp_id|
#      |$.Warehouses[0].Products|
#      |$.Warehouses[0].Products[0].Skunit|
#      |$.Warehouses[0].Products[0].Skunit.id|
#      |$.Warehouses[0].Products[0].Skunit.mrp|
#      |$.Warehouses[0].Products[0].Skunit.price|
#      |$.Warehouses[0].Products[0].Skunit.availableinventory|
#      |$.Warehouses[0].Products[0].Skunit.sku_price|
#      |$.Warehouses[0].Products[0].Skunit.sku_inventory|
#    And I store the response as "getWarehouseInventories_response" name using full path
#
#  @Positive @DataValidation
#  Scenario: TC_07 Validate warehouse inventories data types
#    And I send the GET request to "skunits_get_warehouse_inventories" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |warehouseId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Warehouses|array|
#      |$.Warehouses[0].warehouse_id|number|
#      |$.Warehouses[0].warehouse_name|string|
#      |$.Warehouses[0].warehouse_erp_id|string|
#      |$.Warehouses[0].Products|array|
#      |$.Warehouses[0].Products[0].Skunit|object|
#      |$.Warehouses[0].Products[0].Skunit.id|string|
#      |$.Warehouses[0].Products[0].Skunit.mrp|string|
#      |$.Warehouses[0].Products[0].Skunit.price|string|
#      |$.Warehouses[0].Products[0].Skunit.availableinventory|number|
#      |$.Warehouses[0].Products[0].Skunit.sku_price|array|
#      |$.Warehouses[0].Products[0].Skunit.sku_inventory|array|
#    And I store the response as "getWarehouseInventories_response" name using full path
#
#  @Positive @Functional
#  Scenario: TC_08 Get warehouse inventories with different warehouse ID
#    And I send the GET request to "skunits_get_warehouse_inventories" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |warehouseId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.Warehouses[0].warehouse_id|1|
#      |$.Warehouses[0].warehouse_name|"SLV Traders"|
#      |$.Warehouses[0].warehouse_erp_id|"trp123"|
#
#  @Positive @DataValidation
#  Scenario: TC_09 Validate warehouse inventories response with expected values
#    And I send the GET request to "skunits_get_warehouse_inventories" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |warehouseId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.Warehouses[0].warehouse_id|2|
#      |$.Warehouses[0].warehouse_name|"SLV DISTRIBUTOR"|
#      |$.Warehouses[0].warehouse_erp_id|"trp133"|
#      |$.Warehouses[0].Products[0].Skunit.id|"1"|
#      |$.Warehouses[0].Products[0].Skunit.mrp|"11.00000"|
#      |$.Warehouses[0].Products[0].Skunit.price|"2.00000"|
#    And I store the response as "getWarehouseInventories_response" name using full path
#
#  @Negative @Validation
#  Scenario: TC_10 Get warehouse inventories with missing warehouseId parameter
#    And I send the GET request to "skunits_get_warehouse_inventories" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "500"
#    And verify response time is less than "2000" milliseconds
#
#  @Negative @Validation
#  Scenario: TC_11 Get warehouse inventories with invalid warehouseId format
#    And I send the GET request to "skunits_get_warehouse_inventories" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |warehouseId|invalid|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And I store the response as "getWarehouseInventories_response" name using full path
#
#  @Negative @Validation
#  Scenario: TC_12 Get warehouse inventories with non-existent warehouseId
#    And I send the GET request to "skunits_get_warehouse_inventories" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |warehouseId|999999|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And I store the response as "getWarehouseInventories_response" name using full path
#
  @Negative @ErrorHandling
  Scenario: TC_13 Get warehouse inventories with invalid endpoint
    And I send the GET request to "skunits_get_warehouse_inventories_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds
#
#  @Positive @Performance
#  Scenario: TC_14 Performance test for get warehouse inventories endpoint
#    And I send the GET request to "skunits_get_warehouse_inventories" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |warehouseId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds
#    And I store the response as "getWarehouseInventories_response" name using full path
#
#  @DBvalidation
#  Scenario: TC_15 Get warehouse inventories - verify response data with DB
#    And I send the GET request to "skunits_get_warehouse_inventories" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |warehouseId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.Warehouses[0].warehouse_id|2|
#      |$.Warehouses[0].warehouse_name|"SLV DISTRIBUTOR"|
#      |$.Warehouses[0].Products[0].Skunit.id|"1"|
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.Warehouses[0].warehouse_name|DB:warehouses:name: id=2 LIMIT 1|
#      |$.Warehouses[0].warehouse_erp_id|DB:warehouses:erp_id: id=2 LIMIT 1|
#
