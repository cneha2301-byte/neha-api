@BizomWebAPI @OS @InventoriesManagement @GetInventoryAndSkuForWare @DataProcessing
Feature: Get Inventory And SKU For Warehouse API Testing
  As a system user
  I want to test the get inventory and SKU for warehouse endpoint
  So that I can ensure proper functionality and data retrieval for inventory and SKU data by warehouse

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get inventory and SKU for warehouse without access token
    When I send the GET request to "inventories_getinventoryandskuforware" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |warehouseId|1|
      |isorder|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get inventory and SKU for warehouse with invalid access token
#    And I send the GET request to "inventories_getinventoryandskuforware" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|invalid_token_12345|
#      |warehouseId|1|
#      |isorder|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds
#
#  @Negative @Security
#  Scenario: Get inventory and SKU for warehouse with expired access token
#    And I send the GET request to "inventories_getinventoryandskuforware" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|expired_token_12345|
#      |warehouseId|1|
#      |isorder|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get inventory and SKU for warehouse with malformed access token
#    And I send the GET request to "inventories_getinventoryandskuforware" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|malformed.token.here|
#      |warehouseId|1|
#      |isorder|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get inventory and SKU for warehouse with valid access token
    And I send the GET request to "inventories_getinventoryandskuforware" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|1|
      |isorder|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|Data found!|
    And I store the response as "getInventoryAndSkuForWare_response" name using full path

  @Positive @DataValidation
  Scenario: Validate inventory and SKU for warehouse response structure
    And I send the GET request to "inventories_getinventoryandskuforware" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|1|
      |isorder|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|Data found!|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|
      |$.error.message|string|
      |$.inventory|array|
      |$.skunits|array|
      |$.pricing|array|

  @Positive @DataValidation
  Scenario: Validate inventory array structure and content
    And I send the GET request to "inventories_getinventoryandskuforware" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|1|
      |isorder|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|Data found!|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.inventory|array|
      |$.inventory[0]|object|
      |$.inventory[0].warehouse_id|number|
      |$.inventory[0].warehouse_name|string|
      |$.inventory[0].skunit_id|string|
      |$.inventory[0].mrp|string|
      |$.inventory[0].price|string|
      |$.inventory[0].availableinventory|number|

  @Positive @DataValidation
  Scenario: Validate skunits array structure and content
    And I send the GET request to "inventories_getinventoryandskuforware" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|1|
      |isorder|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|Data found!|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.skunits|array|
      |$.skunits[0]|object|
      |$.skunits[0].id|string|
      |$.skunits[0].name|string|
      |$.skunits[0].mrp|string|
      |$.skunits[0].price|string|
      |$.skunits[0].active|string|

  @Positive @DataValidation
  Scenario: Validate pricing array structure and content
    And I send the GET request to "inventories_getinventoryandskuforware" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|1|
      |isorder|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|Data found!|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.pricing|array|
      |$.pricing[0]|object|
      |$.pricing[0].skunit_id|number|
      |$.pricing[0].warehouse_id|number|
      |$.pricing[0].mrp|string|
      |$.pricing[0].price|string|

  @Positive @Functional
  Scenario: Get inventory and SKU for warehouse with different warehouse ID
    And I send the GET request to "inventories_getinventoryandskuforware" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|2|
      |isorder|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Positive @Functional
  Scenario: Get inventory and SKU for warehouse with isorder set to 0
    And I send the GET request to "inventories_getinventoryandskuforware" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|1|
      |isorder|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @Validation
  Scenario: Get inventory and SKU for warehouse with invalid warehouse ID
    And I send the GET request to "inventories_getinventoryandskuforware" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|abc|
      |isorder|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get inventory and SKU for warehouse with non-existent warehouse ID
    And I send the GET request to "inventories_getinventoryandskuforware" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|999999|
      |isorder|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get inventory and SKU for warehouse with invalid isorder parameter
    And I send the GET request to "inventories_getinventoryandskuforware" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|1|
      |isorder|invalid|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get inventory and SKU for warehouse with missing warehouseId parameter
    And I send the GET request to "inventories_getinventoryandskuforware" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |isorder|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get inventory and SKU for warehouse with missing isorder parameter
    And I send the GET request to "inventories_getinventoryandskuforware" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get inventory and SKU for warehouse with special characters in query parameters
    And I send the GET request to "inventories_getinventoryandskuforware" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|1|
      |isorder|1|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @Security
  Scenario: Get inventory and SKU for warehouse with SQL injection attempt
    And I send the GET request to "inventories_getinventoryandskuforware" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|1|
      |isorder|1|
      |test_param|'; DROP TABLE inventories; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @Boundary
  Scenario: Get inventory and SKU for warehouse with maximum query parameters
    And I send the GET request to "inventories_getinventoryandskuforware" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|1|
      |isorder|1|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @ErrorHandling
  Scenario: Get inventory and SKU for warehouse with invalid endpoint
    And I send the GET request to "inventories_getinventoryandskuforware_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|1|
      |isorder|1|
    Then I should see the response code as "404"
    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: Performance test for inventory and SKU for warehouse endpoint
    And I send the GET request to "inventories_getinventoryandskuforware" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|1|
      |isorder|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|Data found!|

  @Positive @Concurrency
  Scenario: Concurrent access test for inventory and SKU for warehouse endpoint
    And I send the GET request to "inventories_getinventoryandskuforware" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|1|
      |isorder|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|Data found!|

  @Positive @BusinessLogic
  Scenario: Validate inventory and SKU for warehouse business logic
    And I send the GET request to "inventories_getinventoryandskuforware" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|1|
      |isorder|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|Data found!|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.inventory|array|
      |$.skunits|array|
      |$.pricing|array|

  @Positive @DataIntegrity
  Scenario: Validate inventory and SKU for warehouse data integrity
    And I send the GET request to "inventories_getinventoryandskuforware" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|1|
      |isorder|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|Data found!|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|
      |$.error.message|string|
      |$.inventory|array|
      |$.inventory[0].warehouse_id|number|
      |$.inventory[0].skunit_id|string|
      |$.skunits|array|
      |$.skunits[0].id|string|
      |$.skunits[0].name|string|
      |$.pricing|array|
      |$.pricing[0].skunit_id|number|

  @Positive @Regression
  Scenario: Regression test for inventory and SKU for warehouse endpoint
    And I send the GET request to "inventories_getinventoryandskuforware" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|1|
      |isorder|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|Data found!|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|
      |$.inventory|array|
      |$.skunits|array|
      |$.pricing|array|

  @Positive @ArrayValidation
  Scenario: Validate inventory and SKU for warehouse array structure and content
    And I send the GET request to "inventories_getinventoryandskuforware" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|1|
      |isorder|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|Data found!|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.inventory|array|
      |$.inventory[0]|object|
      |$.inventory[0].warehouse_id|number|
      |$.inventory[0].warehouse_name|string|
      |$.skunits|array|
      |$.skunits[0]|object|
      |$.skunits[0].id|string|
      |$.skunits[0].name|string|
      |$.pricing|array|
      |$.pricing[0]|object|

  @Positive @ContentValidation
  Scenario: Validate inventory and SKU for warehouse content structure
    And I send the GET request to "inventories_getinventoryandskuforware" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|1|
      |isorder|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|Data found!|
    And validating the response contains the following values
      |Value|
      |inventory|
      |skunits|
      |pricing|
      |warehouse_id|
      |skunit_id|

  @Positive @LoadTesting
  Scenario: Load testing for inventory and SKU for warehouse endpoint
    And I send the GET request to "inventories_getinventoryandskuforware" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|1|
      |isorder|1|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|Data found!|

  @Negative @Timeout
  Scenario: Test inventory and SKU for warehouse endpoint timeout handling
    And I send the GET request to "inventories_getinventoryandskuforware" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|1|
      |isorder|1|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|Data found!|

  @Positive @EndToEnd
  Scenario: End-to-end inventory and SKU for warehouse data retrieval workflow
    And I send the GET request to "inventories_getinventoryandskuforware" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|1|
      |isorder|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|Data found!|
    And I store the response as "getInventoryAndSkuForWare_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|
      |$.error.message|string|
      |$.inventory|array|
      |$.skunits|array|
      |$.pricing|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.inventory[0].warehouse_id|1|
      |$.inventory[0].warehouse_name|SLV Traders|


