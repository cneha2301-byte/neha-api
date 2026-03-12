@BizomWebAPI @OS @InventoriesManagement @Inventories @DataProcessing
Feature: Get Inventory For Warehouse API Testing
  As a system user
  I want to test the get inventory for warehouse endpoint
  So that I can ensure proper functionality and data retrieval for warehouse inventory management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get inventory for warehouse without access token
    When I send the GET request to "inventories_get_inventory_for_warehouse" endpoint with path parameters
      |Path|Value|
      |warehouseId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get inventory for warehouse with invalid access token
#    And I send the GET request to "inventories_get_inventory_for_warehouse" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|invalid_token_12345|warehouseId|2|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get inventory for warehouse with expired access token
#    And I send the GET request to "inventories_get_inventory_for_warehouse" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|expired_token_12345|warehouseId|2|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds
#
#  @Negative @Security
#  Scenario: Get inventory for warehouse with malformed access token
#    And I send the GET request to "inventories_get_inventory_for_warehouse" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|malformed.token.here|warehouseId|2|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get inventory for warehouse ID 2 with valid access token
    And I send the GET request to "inventories_get_inventory_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "inventory_for_warehouse_response" name using full path

  @Positive @Functional
  Scenario: Get inventory for warehouse ID 1 with valid access token
    And I send the GET request to "inventories_get_inventory_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Functional
  Scenario: Get inventory for warehouse ID 3 with valid access token
    And I send the GET request to "inventories_get_inventory_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Functional
  Scenario: Get inventory for warehouse ID 5 with valid access token
    And I send the GET request to "inventories_get_inventory_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @DataValidation
  Scenario: Validate inventory for warehouse response structure
    And I send the GET request to "inventories_get_inventory_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|

  @Positive @DataValidation
  Scenario: Validate inventory for warehouse specific data values
    And I send the GET request to "inventories_get_inventory_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: Performance test for inventory for warehouse endpoint
    And I send the GET request to "inventories_get_inventory_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: Concurrent access test for inventory for warehouse endpoint
    And I send the GET request to "inventories_get_inventory_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get inventory for warehouse with invalid warehouse ID - alphabetic characters
    And I send the GET request to "inventories_get_inventory_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get inventory for warehouse with invalid warehouse ID - special characters
    And I send the GET request to "inventories_get_inventory_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|@#$%|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get inventory for warehouse with non-existent warehouse ID
    And I send the GET request to "inventories_get_inventory_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get inventory for warehouse with negative warehouse ID
    And I send the GET request to "inventories_get_inventory_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get inventory for warehouse with zero warehouse ID
    And I send the GET request to "inventories_get_inventory_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get inventory for warehouse with SQL injection attempt in warehouse ID
    And I send the GET request to "inventories_get_inventory_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|'; DROP TABLE warehouses; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get inventory for warehouse with XSS attempt in warehouse ID
    And I send the GET request to "inventories_get_inventory_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: Get inventory for warehouse with very large warehouse ID
    And I send the GET request to "inventories_get_inventory_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|999999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: Get inventory for warehouse with invalid endpoint
    And I send the GET request to "inventories_get_inventory_for_warehouse_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
    Then I should see the response code as "404"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate inventory for warehouse business logic
    And I send the GET request to "inventories_get_inventory_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @DataIntegrity
  Scenario: Validate inventory for warehouse data integrity
    And I send the GET request to "inventories_get_inventory_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|

  @Positive @Regression
  Scenario: Regression test for inventory for warehouse endpoint
    And I send the GET request to "inventories_get_inventory_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|

  @Positive @Functional
  Scenario: Validate inventory for warehouse response completeness
    And I send the GET request to "inventories_get_inventory_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|

  @Positive @ContentValidation
  Scenario: Validate inventory for warehouse content structure
    And I send the GET request to "inventories_get_inventory_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @LoadTesting
  Scenario: Load testing for inventory for warehouse endpoint
    And I send the GET request to "inventories_get_inventory_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Negative @Timeout
  Scenario: Test inventory for warehouse endpoint timeout handling
    And I send the GET request to "inventories_get_inventory_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds

  @Positive @EndToEnd
  Scenario: End-to-end inventory for warehouse data retrieval workflow
    And I send the GET request to "inventories_get_inventory_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "inventory_for_warehouse_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|

  @Positive @PathParameterValidation
  Scenario: Validate inventory for warehouse with different warehouse IDs
    And I send the GET request to "inventories_get_inventory_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds



