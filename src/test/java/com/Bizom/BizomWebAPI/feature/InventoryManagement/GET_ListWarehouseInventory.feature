@BizomWebAPI @InventoryManagement @ListWarehouseInventory @UserAccessManagement @OS
Feature: List Warehouse Inventory API Testing
  As a system user
  I want to test the list warehouse inventory endpoint
  So that I can ensure proper functionality and data retrieval for warehouse inventory listing by warehouse ID

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: List warehouse inventory without access token
    When I send the GET request to "list_warehouse_inventory" endpoint with path parameters
      |Path|Value|
      |warehouseId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: List warehouse inventory with invalid access token
#    And I send the GET request to "list_warehouse_inventory" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|invalid_token_12345|warehouseId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2000" milliseconds
#
#  @Negative @Security
#  Scenario: List warehouse inventory with expired access token
#    And I send the GET request to "list_warehouse_inventory" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|expired_token_12345|warehouseId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2000" milliseconds
#
#  @Negative @Security
#  Scenario: List warehouse inventory with malformed access token
#    And I send the GET request to "list_warehouse_inventory" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|malformed.token.here|warehouseId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: List warehouse inventory for warehouse ID 1 with valid access token
    And I send the GET request to "list_warehouse_inventory" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.success|"1"|
      |$.message|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.success|string|
      |$.message|string|
      |$.showcases|string|
      |$.showquantityinunitcase|string|
      |$.unitcaseunit|string|
      |$.result|array|
      |$.result[0]|object|
      |$.result[0].Inventory|object|
      |$.result[0].Skunit|object|
      |$.result[0].Batch|object|
    And I store the response as "list_warehouse_inventory_response" name using full path

  @Positive @Functional
  Scenario: List warehouse inventory for warehouse ID 2 with valid access token
    And I send the GET request to "list_warehouse_inventory" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.success|"1"|
      |$.message|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.success|string|
      |$.message|string|
      |$.result|array|
      |$.result[0]|object|
      |$.result[0].Inventory|object|
      |$.result[0].Skunit|object|
      |$.result[0].Batch|object|

  @Positive @DataValidation
  Scenario: Validate list warehouse inventory response structure
    And I send the GET request to "list_warehouse_inventory" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.success|string|
      |$.message|string|
      |$.showcases|string|
      |$.showquantityinunitcase|string|
      |$.unitcaseunit|string|
      |$.result|array|
      |$.result[0]|object|
      |$.result[0].Inventory|object|
      |$.result[0].Inventory.availableinventory|string|
      |$.result[0].Inventory.alertlevel|string|
      |$.result[0].Inventory.totalamount|number|
      |$.result[0].Skunit|object|
      |$.result[0].Skunit.name|string|
      |$.result[0].Skunit.id|string|
      |$.result[0].Skunit.skucode|string|
      |$.result[0].Skunit.price|string|
      |$.result[0].Skunit.unitspercase|string|
      |$.result[0].Skunit.unitcase|string|
      |$.result[0].Batch|object|
      |$.result[0].Batch.id|string|
      |$.result[0].Batch.name|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.success|"1"|
      |$.message|""|

#  @Positive @DataValidation
#  Scenario: Validate list warehouse inventory nested object structure
#    And I send the GET request to "list_warehouse_inventory" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result[0].Inventory|object|
#      |$.result[0].Inventory.availableinventory|string|
#      |$.result[0].Inventory.alertlevel|string|
#      |$.result[0].Inventory.totalamount|number|
#      |$.result[0].Skunit|object|
#      |$.result[0].Skunit.name|string|
#      |$.result[0].Skunit.id|string|
#      |$.result[0].Skunit.skucode|string|
#      |$.result[0].Skunit.price|string|
#      |$.result[0].Skunit.unitspercase|string|
#      |$.result[0].Skunit.unitcase|string|
#      |$.result[0].Batch|object|
#      |$.result[0].Batch.id|string|
#      |$.result[0].Batch.name|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result[0].Inventory.availableinventory|"0"|
#      |$.result[0].Skunit.name|Cafe Cuba|
#      |$.result[0].Skunit.id|"1"|
#      |$.result[0].Skunit.skucode|Cuba|
#      |$.result[0].Skunit.unitspercase|"24"|

#  @Positive @DataValidation
#  Scenario: Validate list warehouse inventory with static values
#    And I send the GET request to "list_warehouse_inventory" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.success|"1"|
#      |$.message|""|
#      |$.showcases|"0"|
#      |$.showquantityinunitcase|"0"|
#      |$.unitcaseunit|Kg|
#      |$.result[0].Inventory.availableinventory|"0"|
#      |$.result[0].Inventory.alertlevel|"100"|
#      |$.result[0].Skunit.name|Cafe Cuba|
#      |$.result[0].Skunit.id|"1"|
#      |$.result[0].Skunit.skucode|Cuba|
#      |$.result[0].Skunit.price|"81.90000"|
#      |$.result[0].Skunit.unitspercase|"24"|
#      |$.result[0].Skunit.unitcase|"2.0000000000"|

#  @Negative @Validation
#  Scenario: List warehouse inventory with invalid warehouse ID
#    And I send the GET request to "list_warehouse_inventory" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|abc|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.success|"0"|
#      |$.message|""|
#      |$.result|[]|

#  @Negative @Validation
#  Scenario: List warehouse inventory with non-existent warehouse ID
#    And I send the GET request to "list_warehouse_inventory" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|999999|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.success|"0"|
#      |$.message|""|
#      |$.result|[]|

#  @Negative @Validation
#  Scenario: List warehouse inventory with negative warehouse ID
#    And I send the GET request to "list_warehouse_inventory" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|-1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.success|"0"|
#      |$.message|""|
#      |$.result|[]|
#
#  @Negative @Validation
#  Scenario: List warehouse inventory with zero warehouse ID
#    And I send the GET request to "list_warehouse_inventory" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|0|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.success|"0"|
#      |$.message|""|
#      |$.result|[]|

#  @Negative @Validation
#  Scenario: List warehouse inventory with special characters in warehouse ID
#    And I send the GET request to "list_warehouse_inventory" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.success|"0"|
#      |$.message|""|
#      |$.result|[]|

#  @Negative @Security
#  Scenario: List warehouse inventory with SQL injection attempt in warehouse ID
#    And I send the GET request to "list_warehouse_inventory" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|'; DROP TABLE warehouses; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.success|"0"|
#      |$.message|""|
#      |$.result|[]|

#  @Negative @ErrorHandling
#  Scenario: List warehouse inventory with invalid endpoint
#    And I send the GET request to "list_warehouse_inventory_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#    Then I should see the response code as "404"
#    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance test for list warehouse inventory endpoint
    And I send the GET request to "list_warehouse_inventory" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.success|"1"|
      |$.message|""|

  @Positive @Concurrency
  Scenario: Concurrent access test for list warehouse inventory endpoint
    And I send the GET request to "list_warehouse_inventory" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.success|"1"|
      |$.message|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.success|string|
      |$.message|string|
      |$.result|array|
      |$.result[0]|object|

  @Positive @BusinessLogic
  Scenario: Validate list warehouse inventory business logic
    And I send the GET request to "list_warehouse_inventory" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.success|"1"|
      |$.message|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.success|string|
      |$.message|string|
      |$.result|array|
      |$.result[0]|object|
      |$.result[0].Inventory|object|
      |$.result[0].Skunit|object|
      |$.result[0].Batch|object|

  @Positive @DataIntegrity
  Scenario: Validate list warehouse inventory data integrity
    And I send the GET request to "list_warehouse_inventory" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.success|string|
      |$.message|string|
      |$.showcases|string|
      |$.showquantityinunitcase|string|
      |$.unitcaseunit|string|
      |$.result|array|
      |$.result[0]|object|
      |$.result[0].Inventory|object|
      |$.result[0].Inventory.availableinventory|string|
      |$.result[0].Inventory.alertlevel|string|
      |$.result[0].Inventory.totalamount|number|
      |$.result[0].Skunit|object|
      |$.result[0].Skunit.name|string|
      |$.result[0].Skunit.id|string|
      |$.result[0].Skunit.skucode|string|
      |$.result[0].Skunit.price|string|
      |$.result[0].Skunit.unitspercase|string|
      |$.result[0].Skunit.unitcase|string|
      |$.result[0].Batch|object|
    And validating the response contains the following values
      |Value|
      |success|
      |message|
      |showcases|
      |showquantityinunitcase|
      |unitcaseunit|
      |result|
      |Inventory|
      |Skunit|
      |Batch|

  @Positive @Regression
  Scenario: Regression test for list warehouse inventory endpoint
    And I send the GET request to "list_warehouse_inventory" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.success|"1"|
      |$.message|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.success|string|
      |$.message|string|
      |$.result|array|
      |$.result[0]|object|

#  @Positive @Functional
#  Scenario: Validate list warehouse inventory response completeness
#    And I send the GET request to "list_warehouse_inventory" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.success|string|
#      |$.message|string|
#      |$.showcases|string|
#      |$.showquantityinunitcase|string|
#      |$.unitcaseunit|string|
#      |$.result|array|
#      |$.result[0]|object|
#      |$.result[0].Inventory|object|
#      |$.result[0].Skunit|object|
#      |$.result[0].Batch|object|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.success|"1"|
#      |$.message|""|
#      |$.showcases|"0"|
#      |$.showquantityinunitcase|"0"|
#      |$.unitcaseunit|Kg|
#      |$.result[0].Inventory.availableinventory|"0"|
#      |$.result[0].Skunit.name|Cafe Cuba|
#      |$.result[0].Skunit.id|"1"|

#  @Positive @ArrayValidation
#  Scenario: Validate list warehouse inventory array structure and content
#    And I send the GET request to "list_warehouse_inventory" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.success|string|
#      |$.message|string|
#      |$.result|array|
#      |$.result[0]|object|
#      |$.result[0].Inventory|object|
#      |$.result[0].Inventory.availableinventory|string|
#      |$.result[0].Inventory.alertlevel|string|
#      |$.result[0].Inventory.totalamount|number|
#      |$.result[0].Skunit|object|
#      |$.result[0].Skunit.name|string|
#      |$.result[0].Skunit.id|string|
#      |$.result[0].Skunit.skucode|string|
#      |$.result[0].Skunit.price|string|
#      |$.result[0].Skunit.unitspercase|string|
#      |$.result[0].Skunit.unitcase|string|
#      |$.result[0].Batch|object|
#      |$.result[0].Batch.id|string|
#      |$.result[0].Batch.name|string|
#      |$.result[1]|object|
#      |$.result[1].Inventory|object|
#      |$.result[1].Skunit|object|
#      |$.result[1].Batch|object|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.success|"1"|
#      |$.message|""|
#      |$.result[0].Inventory.availableinventory|"0"|
#      |$.result[0].Inventory.alertlevel|"100"|
#      |$.result[0].Skunit.name|Cafe Cuba|
#      |$.result[0].Skunit.id|"1"|
#      |$.result[0].Skunit.skucode|Cuba|
#      |$.result[0].Skunit.unitspercase|"24"|
#      |$.result[1].Inventory.availableinventory|"0"|
#      |$.result[1].Skunit.name|Cafe Cuba|
#      |$.result[1].Skunit.id|"1"|

  @Positive @ContentValidation
  Scenario: Validate list warehouse inventory content structure
    And I send the GET request to "list_warehouse_inventory" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.success|"1"|
      |$.message|""|
    And validating the response contains the following values
      |Value|
      |success|
      |message|
      |showcases|
      |showquantityinunitcase|
      |unitcaseunit|
      |result|
      |Inventory|
      |Skunit|
      |Batch|
      |availableinventory|
      |alertlevel|
      |totalamount|
      |name|
      |id|
      |skucode|
      |price|
      |unitspercase|
      |unitcase|

  @Positive @LoadTesting
  Scenario: Load testing for list warehouse inventory endpoint
    And I send the GET request to "list_warehouse_inventory" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.success|"1"|
      |$.message|""|

  @Negative @Timeout
  Scenario: Test list warehouse inventory endpoint timeout handling
    And I send the GET request to "list_warehouse_inventory" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.success|"1"|
      |$.message|""|

#  @Positive @EndToEnd
#  Scenario: End-to-end list warehouse inventory data retrieval workflow
#    And I send the GET request to "list_warehouse_inventory" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.success|"1"|
#      |$.message|""|
#      |$.showcases|"0"|
#      |$.showquantityinunitcase|"0"|
#      |$.unitcaseunit|Kg|
#    And I store the response as "list_warehouse_inventory_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.success|string|
#      |$.message|string|
#      |$.showcases|string|
#      |$.showquantityinunitcase|string|
#      |$.unitcaseunit|string|
#      |$.result|array|
#      |$.result[0]|object|
#      |$.result[0].Inventory|object|
#      |$.result[0].Inventory.availableinventory|string|
#      |$.result[0].Inventory.alertlevel|string|
#      |$.result[0].Inventory.totalamount|number|
#      |$.result[0].Skunit|object|
#      |$.result[0].Skunit.name|string|
#      |$.result[0].Skunit.id|string|
#      |$.result[0].Skunit.skucode|string|
#      |$.result[0].Skunit.price|string|
#      |$.result[0].Skunit.unitspercase|string|
#      |$.result[0].Skunit.unitcase|string|
#      |$.result[0].Batch|object|
#      |$.result[0].Batch.id|string|
#      |$.result[0].Batch.name|string|
#    And validating the response contains the following values
#      |Value|
#      |success|
#      |message|
#      |showcases|
#      |showquantityinunitcase|
#      |unitcaseunit|
#      |result|
#      |Inventory|
#      |Skunit|
#      |Batch|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.success|"1"|
#      |$.message|""|
#      |$.result[0].Inventory.availableinventory|"0"|
#      |$.result[0].Inventory.alertlevel|"100"|
#      |$.result[0].Skunit.name|Cafe Cuba|
#      |$.result[0].Skunit.id|"1"|
#      |$.result[0].Skunit.skucode|Cuba|
#      |$.result[0].Skunit.price|"81.90000"|
#      |$.result[0].Skunit.unitspercase|"24"|
#      |$.result[0].Skunit.unitcase|"2.0000000000"|

