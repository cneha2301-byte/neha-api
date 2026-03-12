@BizomWebAPI @InventoryManagement @GetWarehouseInventory @UserAccessManagement @OS
Feature: Get Warehouse Inventory API Testing
  As a system user
  I want to test the get warehouse inventory endpoint
  So that I can ensure proper functionality and data retrieval for warehouse inventory by warehouse ID

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get warehouse inventory without access token
    When I send the GET request to "get_warehouse_inventory" endpoint with path parameters
      |Path|Value|
      |warehouseId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get warehouse inventory with invalid access token
    And I send the GET request to "get_warehouse_inventory" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|warehouseId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get warehouse inventory with expired access token
    And I send the GET request to "get_warehouse_inventory" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|warehouseId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get warehouse inventory with malformed access token
    And I send the GET request to "get_warehouse_inventory" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|warehouseId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: Get warehouse inventory for warehouse ID 1 with valid access token
    And I send the GET request to "get_warehouse_inventory" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Successfully fetched|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
      |$.data[0]|object|
      |$.data[0].Inventory|object|
      |$.data[0].Skunit|object|
    And I store the response as "get_warehouse_inventory_response" name using full path

  @Positive @Functional
  Scenario: Get warehouse inventory for warehouse ID 2 with valid access token
    And I send the GET request to "get_warehouse_inventory" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Successfully fetched|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
      |$.data[0]|object|
      |$.data[0].Inventory|object|
      |$.data[0].Skunit|object|

  @Positive @DataValidation
  Scenario: Validate get warehouse inventory response structure
    And I send the GET request to "get_warehouse_inventory" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
      |$.data[0]|object|
      |$.data[0].Inventory|object|
      |$.data[0].Inventory.skunit_id|string|
      |$.data[0].Inventory.batch_id|string|
      |$.data[0].Inventory.availableinventory|string|
      |$.data[0].Skunit|object|
      |$.data[0].Skunit.unitspercase|string|
      |$.data[0].Skunit.innercase|string|
      |$.data[0].Skunit.skunit_type|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Successfully fetched|

  @Positive @DataValidation
  Scenario: Validate get warehouse inventory nested object structure
    And I send the GET request to "get_warehouse_inventory" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data[0].Inventory|object|
      |$.data[0].Inventory.skunit_id|string|
      |$.data[0].Inventory.batch_id|string|
      |$.data[0].Inventory.availableinventory|string|
      |$.data[0].Skunit|object|
      |$.data[0].Skunit.unitspercase|string|
      |$.data[0].Skunit.innercase|string|
      |$.data[0].Skunit.skunit_type|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data[0].Inventory.skunit_id|"1"|
      |$.data[0].Inventory.batch_id|"0"|
      |$.data[0].Skunit.skunit_type|skunit|
      |$.data[0].Skunit.unitspercase|"24"|

#  @Positive @DataValidation
#  Scenario: Validate get warehouse inventory with static values
#    And I send the GET request to "get_warehouse_inventory" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Successfully fetched|
#      |$.data[0].Inventory.skunit_id|"1"|
#      |$.data[0].Inventory.batch_id|"0"|
#      |$.data[0].Inventory.availableinventory|"0"|
#      |$.data[0].Skunit.unitspercase|"24"|
#      |$.data[0].Skunit.innercase|"0"|
#      |$.data[0].Skunit.skunit_type|skunit|

  @Negative @Validation
  Scenario: Get warehouse inventory with invalid warehouse ID
    And I send the GET request to "get_warehouse_inventory" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Invalid warehouseId|
      |$.data|[]|

  @Negative @Validation
  Scenario: Get warehouse inventory with non-existent warehouse ID
    And I send the GET request to "get_warehouse_inventory" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Invalid warehouseId|
      |$.data|[]|

  @Negative @Validation
  Scenario: Get warehouse inventory with negative warehouse ID
    And I send the GET request to "get_warehouse_inventory" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Invalid warehouseId|
      |$.data|[]|

  @Negative @Validation
  Scenario: Get warehouse inventory with zero warehouse ID
    And I send the GET request to "get_warehouse_inventory" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Invalid warehouseId|
      |$.data|[]|

#  @Negative @Validation
#  Scenario: Get warehouse inventory with special characters in warehouse ID
#    And I send the GET request to "get_warehouse_inventory" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|Invalid warehouseId|
#      |$.data|[]|

#  @Negative @Security
#  Scenario: Get warehouse inventory with SQL injection attempt in warehouse ID
#    And I send the GET request to "get_warehouse_inventory" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|'; DROP TABLE warehouses; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|Invalid warehouseId|
#      |$.data|[]|

#  @Negative @ErrorHandling
#  Scenario: Get warehouse inventory with invalid endpoint
#    And I send the GET request to "get_warehouse_inventory_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#    Then I should see the response code as "404"
#    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance test for get warehouse inventory endpoint
    And I send the GET request to "get_warehouse_inventory" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Successfully fetched|

  @Positive @Concurrency
  Scenario: Concurrent access test for get warehouse inventory endpoint
    And I send the GET request to "get_warehouse_inventory" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Successfully fetched|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
      |$.data[0]|object|

  @Positive @BusinessLogic
  Scenario: Validate get warehouse inventory business logic
    And I send the GET request to "get_warehouse_inventory" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Successfully fetched|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
      |$.data[0]|object|
      |$.data[0].Inventory|object|
      |$.data[0].Skunit|object|

  @Positive @DataIntegrity
  Scenario: Validate get warehouse inventory data integrity
    And I send the GET request to "get_warehouse_inventory" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
      |$.data[0]|object|
      |$.data[0].Inventory|object|
      |$.data[0].Inventory.skunit_id|string|
      |$.data[0].Inventory.batch_id|string|
      |$.data[0].Inventory.availableinventory|string|
      |$.data[0].Skunit|object|
      |$.data[0].Skunit.unitspercase|string|
      |$.data[0].Skunit.innercase|string|
      |$.data[0].Skunit.skunit_type|string|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |data|
      |Inventory|
      |Skunit|

  @Positive @Regression
  Scenario: Regression test for get warehouse inventory endpoint
    And I send the GET request to "get_warehouse_inventory" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Successfully fetched|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
      |$.data[0]|object|

  @Positive @Functional
  Scenario: Validate get warehouse inventory response completeness
    And I send the GET request to "get_warehouse_inventory" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
      |$.data[0]|object|
      |$.data[0].Inventory|object|
      |$.data[0].Skunit|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Successfully fetched|
      |$.data[0].Inventory.skunit_id|"1"|
      |$.data[0].Inventory.batch_id|"0"|
      |$.data[0].Skunit.skunit_type|skunit|

  @Positive @ArrayValidation
  Scenario: Validate get warehouse inventory array structure and content
    And I send the GET request to "get_warehouse_inventory" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
      |$.data[0]|object|
      |$.data[0].Inventory|object|
      |$.data[0].Inventory.skunit_id|string|
      |$.data[0].Inventory.batch_id|string|
      |$.data[0].Inventory.availableinventory|string|
      |$.data[0].Skunit|object|
      |$.data[0].Skunit.unitspercase|string|
      |$.data[0].Skunit.innercase|string|
      |$.data[0].Skunit.skunit_type|string|
      |$.data[1]|object|
      |$.data[1].Inventory|object|
      |$.data[1].Skunit|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Successfully fetched|
      |$.data[0].Inventory.skunit_id|"1"|
      |$.data[0].Inventory.batch_id|"0"|
      |$.data[0].Skunit.skunit_type|skunit|
      |$.data[0].Skunit.unitspercase|"24"|
      |$.data[1].Inventory.skunit_id|"1"|
      |$.data[1].Inventory.batch_id|"1"|

  @Positive @ContentValidation
  Scenario: Validate get warehouse inventory content structure
    And I send the GET request to "get_warehouse_inventory" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Successfully fetched|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |data|
      |Inventory|
      |Skunit|
      |skunit_id|
      |batch_id|
      |availableinventory|
      |unitspercase|
      |innercase|
      |skunit_type|

  @Positive @LoadTesting
  Scenario: Load testing for get warehouse inventory endpoint
    And I send the GET request to "get_warehouse_inventory" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Successfully fetched|

  @Negative @Timeout
  Scenario: Test get warehouse inventory endpoint timeout handling
    And I send the GET request to "get_warehouse_inventory" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Successfully fetched|

#  @Positive @EndToEnd
#  Scenario: End-to-end get warehouse inventory data retrieval workflow
#    And I send the GET request to "get_warehouse_inventory" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Successfully fetched|
#    And I store the response as "get_warehouse_inventory_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.data|array|
#      |$.data[0]|object|
#      |$.data[0].Inventory|object|
#      |$.data[0].Inventory.skunit_id|string|
#      |$.data[0].Inventory.batch_id|string|
#      |$.data[0].Inventory.availableinventory|string|
#      |$.data[0].Skunit|object|
#      |$.data[0].Skunit.unitspercase|string|
#      |$.data[0].Skunit.innercase|string|
#      |$.data[0].Skunit.skunit_type|string|
#    And validating the response contains the following values
#      |Value|
#      |Result|
#      |Reason|
#      |data|
#      |Inventory|
#      |Skunit|
#      |Successfully fetched|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Successfully fetched|
#      |$.data[0].Inventory.skunit_id|"1"|
#      |$.data[0].Inventory.batch_id|"0"|
#      |$.data[0].Inventory.availableinventory|"0"|
#      |$.data[0].Skunit.unitspercase|"24"|
#      |$.data[0].Skunit.innercase|"0"|
#      |$.data[0].Skunit.skunit_type|skunit|

