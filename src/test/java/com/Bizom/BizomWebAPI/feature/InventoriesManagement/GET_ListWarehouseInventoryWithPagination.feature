@BizomWebAPI @OS @InventoriesManagement @Inventories @UserAccessManagement
Feature: List Warehouse Inventory With Pagination API Testing
  As a system user
  I want to test the list warehouse inventory with pagination endpoint
  So that I can ensure proper functionality and data retrieval for warehouse inventory with pagination management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get list warehouse inventory with pagination without access token
    When I send the GET request to "inventories_list_warehouse_inventory_with_pagination" endpoint with path parameters
      |Path|Value|
      |warehouseId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get list warehouse inventory with pagination with invalid access token
    And I send the GET request to "inventories_list_warehouse_inventory_with_pagination" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|warehouseId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get list warehouse inventory with pagination with expired access token
    And I send the GET request to "inventories_list_warehouse_inventory_with_pagination" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|warehouseId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get list warehouse inventory with pagination with malformed access token
    And I send the GET request to "inventories_list_warehouse_inventory_with_pagination" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|warehouseId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

#  @Positive @Smoke
#  Scenario: Get list warehouse inventory with pagination for warehouse ID 1 with valid access token
#    And I send the GET request to "inventories_list_warehouse_inventory_with_pagination" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|15|
#      |$.iTotalDisplayRecords|15|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.sEcho|number|
#      |$.iTotalRecords|number|
#      |$.iTotalDisplayRecords|number|
#      |$.aaData|array|
#      |$.aaData[0]|object|
#      |$.aaData[0].alertlevel|string|
#      |$.aaData[0].availableinventory|string|
#      |$.aaData[0].batch_id|string|
#      |$.aaData[0].batch_name|string|
#      |$.aaData[0].price|string|
#      |$.aaData[0].skucode|string|
#      |$.aaData[0].skunit_id|string|
#      |$.aaData[0].skunit_name|string|
#      |$.aaData[0].unitcase|string|
#      |$.aaData[0].unitspercase|string|
#      |$.aaData[0].totalamount|number|
#    And I store the response as "list_warehouse_inventory_with_pagination_response" name using full path

  @Positive @Functional
  Scenario: Get list warehouse inventory with pagination for warehouse ID 3 with valid access token
    And I send the GET request to "inventories_list_warehouse_inventory_with_pagination" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|1|
      |$.iTotalDisplayRecords|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
      |$.aaData[0]|object|
      |$.aaData[0].alertlevel|string|
      |$.aaData[0].availableinventory|string|
      |$.aaData[0].batch_id|string|
      |$.aaData[0].batch_name|string|
      |$.aaData[0].price|string|
      |$.aaData[0].skucode|string|
      |$.aaData[0].skunit_id|string|
      |$.aaData[0].skunit_name|string|
      |$.aaData[0].unitcase|string|
      |$.aaData[0].unitspercase|string|
      |$.aaData[0].totalamount|number|

#  @Positive @DataValidation
#  Scenario: Validate list warehouse inventory with pagination response structure for warehouse ID 1
#    And I send the GET request to "inventories_list_warehouse_inventory_with_pagination" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|15|
#      |$.iTotalDisplayRecords|15|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.sEcho|number|
#      |$.iTotalRecords|number|
#      |$.iTotalDisplayRecords|number|
#      |$.aaData|array|
#      |$.aaData[0]|object|
#      |$.aaData[0].alertlevel|string|
#      |$.aaData[0].availableinventory|string|
#      |$.aaData[0].batch_id|string|
#      |$.aaData[0].batch_name|string|
#      |$.aaData[0].price|string|
#      |$.aaData[0].skucode|string|
#      |$.aaData[0].skunit_id|string|
#      |$.aaData[0].skunit_name|string|
#      |$.aaData[0].unitcase|string|
#      |$.aaData[0].unitspercase|string|
#      |$.aaData[0].totalamount|number|

#  @Positive @DataValidation
#  Scenario: Validate list warehouse inventory with pagination specific data values for warehouse ID 1
#    And I send the GET request to "inventories_list_warehouse_inventory_with_pagination" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|15|
#      |$.iTotalDisplayRecords|15|
#      |$.aaData[0].alertlevel|"100"|
#      |$.aaData[0].availableinventory|"0"|
#      |$.aaData[0].batch_id|""|
#      |$.aaData[0].batch_name|""|
#      |$.aaData[0].price|"81.90000"|
#      |$.aaData[0].skucode|"Cuba"|
#      |$.aaData[0].skunit_id|"1"|
#      |$.aaData[0].skunit_name|"Cafe Cuba"|
#      |$.aaData[0].unitcase|"2.0000000000"|
#      |$.aaData[0].unitspercase|"24"|
#      |$.aaData[0].totalamount|0|

  @Positive @DataValidation
  Scenario: Validate list warehouse inventory with pagination for warehouse ID 3 specific data values
    And I send the GET request to "inventories_list_warehouse_inventory_with_pagination" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|1|
      |$.iTotalDisplayRecords|1|
      |$.aaData[0].alertlevel|"0"|
      |$.aaData[0].availableinventory|"0"|
      |$.aaData[0].batch_id|""|
      |$.aaData[0].batch_name|""|
      |$.aaData[0].price|"11.00000"|
      |$.aaData[0].skucode|""|
      |$.aaData[0].skunit_id|"18"|
      |$.aaData[0].skunit_name|"50-50"|
      |$.aaData[0].unitcase|"1.0000000000"|
      |$.aaData[0].unitspercase|"1"|
      |$.aaData[0].totalamount|0|

#  @Positive @Performance
#  Scenario: Performance test for list warehouse inventory with pagination endpoint
#    And I send the GET request to "inventories_list_warehouse_inventory_with_pagination" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|15|
#      |$.iTotalDisplayRecords|15|

#  @Positive @Concurrency
#  Scenario: Concurrent access test for list warehouse inventory with pagination endpoint
#    And I send the GET request to "inventories_list_warehouse_inventory_with_pagination" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|15|
#      |$.iTotalDisplayRecords|15|

  @Negative @Validation
  Scenario: Get list warehouse inventory with pagination with invalid warehouse ID - alphabetic characters
    And I send the GET request to "inventories_list_warehouse_inventory_with_pagination" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.aaData|[]|

#  @Negative @Validation
#  Scenario: Get list warehouse inventory with pagination with invalid warehouse ID - special characters
#    And I send the GET request to "inventories_list_warehouse_inventory_with_pagination" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|@#$%|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.aaData|[]|

  @Negative @Validation
  Scenario: Get list warehouse inventory with pagination with non-existent warehouse ID
    And I send the GET request to "inventories_list_warehouse_inventory_with_pagination" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.aaData|[]|

  @Negative @Validation
  Scenario: Get list warehouse inventory with pagination with negative warehouse ID
    And I send the GET request to "inventories_list_warehouse_inventory_with_pagination" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.aaData|[]|

  @Negative @Validation
  Scenario: Get list warehouse inventory with pagination with zero warehouse ID
    And I send the GET request to "inventories_list_warehouse_inventory_with_pagination" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.aaData|[]|

#  @Negative @Security
#  Scenario: Get list warehouse inventory with pagination with SQL injection attempt in warehouse ID
#    And I send the GET request to "inventories_list_warehouse_inventory_with_pagination" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|'; DROP TABLE warehouses; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.aaData|[]|

#  @Negative @Security
#  Scenario: Get list warehouse inventory with pagination with XSS attempt in warehouse ID
#    And I send the GET request to "inventories_list_warehouse_inventory_with_pagination" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.aaData|[]|

  @Negative @Boundary
  Scenario: Get list warehouse inventory with pagination with very large warehouse ID
    And I send the GET request to "inventories_list_warehouse_inventory_with_pagination" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|999999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.aaData|[]|

  @Negative @ErrorHandling
  Scenario: Get list warehouse inventory with pagination with invalid endpoint
    And I send the GET request to "inventories_list_warehouse_inventory_with_pagination_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "404"
    And verify response time is less than "2500" milliseconds

#  @Positive @BusinessLogic
#  Scenario: Validate list warehouse inventory with pagination business logic
#    And I send the GET request to "inventories_list_warehouse_inventory_with_pagination" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|15|
#      |$.iTotalDisplayRecords|15|

#  @Positive @DataIntegrity
#  Scenario: Validate list warehouse inventory with pagination data integrity
#    And I send the GET request to "inventories_list_warehouse_inventory_with_pagination" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|15|
#      |$.iTotalDisplayRecords|15|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.sEcho|number|
#      |$.iTotalRecords|number|
#      |$.iTotalDisplayRecords|number|
#      |$.aaData|array|
#      |$.aaData[0]|object|
#      |$.aaData[0].alertlevel|string|
#      |$.aaData[0].availableinventory|string|
#      |$.aaData[0].batch_id|string|
#      |$.aaData[0].batch_name|string|
#      |$.aaData[0].price|string|
#      |$.aaData[0].skucode|string|
#      |$.aaData[0].skunit_id|string|
#      |$.aaData[0].skunit_name|string|
#      |$.aaData[0].unitcase|string|
#      |$.aaData[0].unitspercase|string|
#      |$.aaData[0].totalamount|number|

#  @Positive @Regression
#  Scenario: Regression test for list warehouse inventory with pagination endpoint
#    And I send the GET request to "inventories_list_warehouse_inventory_with_pagination" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|15|
#      |$.iTotalDisplayRecords|15|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.sEcho|number|
#      |$.iTotalRecords|number|
#      |$.iTotalDisplayRecords|number|
#      |$.aaData|array|
#      |$.aaData[0]|object|

#  @Positive @Functional
#  Scenario: Validate list warehouse inventory with pagination response completeness
#    And I send the GET request to "inventories_list_warehouse_inventory_with_pagination" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|15|
#      |$.iTotalDisplayRecords|15|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.sEcho|number|
#      |$.iTotalRecords|number|
#      |$.iTotalDisplayRecords|number|
#      |$.aaData|array|
#      |$.aaData[0]|object|
#      |$.aaData[0].alertlevel|string|
#      |$.aaData[0].availableinventory|string|
#      |$.aaData[0].batch_id|string|
#      |$.aaData[0].batch_name|string|
#      |$.aaData[0].price|string|
#      |$.aaData[0].skucode|string|
#      |$.aaData[0].skunit_id|string|
#      |$.aaData[0].skunit_name|string|
#      |$.aaData[0].unitcase|string|
#      |$.aaData[0].unitspercase|string|
#      |$.aaData[0].totalamount|number|

#  @Positive @DataTablesValidation
#  Scenario: Validate list warehouse inventory with pagination DataTables structure
#    And I send the GET request to "inventories_list_warehouse_inventory_with_pagination" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|15|
#      |$.iTotalDisplayRecords|15|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.sEcho|number|
#      |$.iTotalRecords|number|
#      |$.iTotalDisplayRecords|number|
#      |$.aaData|array|
#      |$.aaData[0]|object|

  @Positive @NestedObjectValidation
  Scenario: Validate list warehouse inventory with pagination nested object structure
    And I send the GET request to "inventories_list_warehouse_inventory_with_pagination" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData[0]|object|
      |$.aaData[0].alertlevel|string|
      |$.aaData[0].availableinventory|string|
      |$.aaData[0].batch_id|string|
      |$.aaData[0].batch_name|string|
      |$.aaData[0].price|string|
      |$.aaData[0].skucode|string|
      |$.aaData[0].skunit_id|string|
      |$.aaData[0].skunit_name|string|
      |$.aaData[0].unitcase|string|
      |$.aaData[0].unitspercase|string|
      |$.aaData[0].totalamount|number|

  @Positive @ContentValidation
  Scenario: Validate list warehouse inventory with pagination content structure
    And I send the GET request to "inventories_list_warehouse_inventory_with_pagination" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |sEcho|
      |iTotalRecords|
      |iTotalDisplayRecords|
      |aaData|
      |alertlevel|
      |availableinventory|
      |batch_id|
      |batch_name|
      |price|
      |skucode|
      |skunit_id|
      |skunit_name|
      |unitcase|
      |unitspercase|
      |totalamount|

#  @Positive @LoadTesting
#  Scenario: Load testing for list warehouse inventory with pagination endpoint
#    And I send the GET request to "inventories_list_warehouse_inventory_with_pagination" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "3000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|15|
#      |$.iTotalDisplayRecords|15|

#  @Negative @Timeout
#  Scenario: Test list warehouse inventory with pagination endpoint timeout handling
#    And I send the GET request to "inventories_list_warehouse_inventory_with_pagination" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "5000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|15|
#      |$.iTotalDisplayRecords|15|

#  @Positive @EndToEnd
#  Scenario: End-to-end list warehouse inventory with pagination data retrieval workflow
#    And I send the GET request to "inventories_list_warehouse_inventory_with_pagination" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|15|
#      |$.iTotalDisplayRecords|15|
#      |$.aaData[0].alertlevel|"100"|
#      |$.aaData[0].availableinventory|"0"|
#      |$.aaData[0].batch_id|""|
#      |$.aaData[0].batch_name|""|
#      |$.aaData[0].price|"81.90000"|
#      |$.aaData[0].skucode|"Cuba"|
#      |$.aaData[0].skunit_id|"1"|
#      |$.aaData[0].skunit_name|"Cafe Cuba"|
#      |$.aaData[0].unitcase|"2.0000000000"|
#      |$.aaData[0].unitspercase|"24"|
#      |$.aaData[0].totalamount|0|
#    And I store the response as "list_warehouse_inventory_with_pagination_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.sEcho|number|
#      |$.iTotalRecords|number|
#      |$.iTotalDisplayRecords|number|
#      |$.aaData|array|
#      |$.aaData[0]|object|
#      |$.aaData[0].alertlevel|string|
#      |$.aaData[0].availableinventory|string|
#      |$.aaData[0].batch_id|string|
#      |$.aaData[0].batch_name|string|
#      |$.aaData[0].price|string|
#      |$.aaData[0].skucode|string|
#      |$.aaData[0].skunit_id|string|
#      |$.aaData[0].skunit_name|string|
#      |$.aaData[0].unitcase|string|
#      |$.aaData[0].unitspercase|string|
#      |$.aaData[0].totalamount|number|

#  @Positive @ArrayValidation
#  Scenario: Validate list warehouse inventory with pagination array structure and content
#    And I send the GET request to "inventories_list_warehouse_inventory_with_pagination" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|15|
#      |$.iTotalDisplayRecords|15|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.aaData|array|
#      |$.aaData[0]|object|
#      |$.aaData[1]|object|
#      |$.aaData[14]|object|

  @Positive @EmptyDataValidation
  Scenario: Validate list warehouse inventory with pagination empty data response for invalid warehouse ID
    And I send the GET request to "inventories_list_warehouse_inventory_with_pagination" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.aaData|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData|array|



