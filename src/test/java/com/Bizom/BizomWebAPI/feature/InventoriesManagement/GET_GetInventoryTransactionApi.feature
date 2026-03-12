@BizomWebAPI @OS @InventoriesManagement @Inventories @DataProcessing
Feature: Get Inventory Transaction API Testing
  As a system user
  I want to test the get inventory transaction API endpoint
  So that I can ensure proper functionality and data retrieval for inventory transaction management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get inventory transaction API without access token
    When I send the GET request to "inventories_get_inventory_transaction_api" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get inventory transaction API with invalid access token
#    And I send the GET request to "inventories_get_inventory_transaction_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|invalid_token_12345|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get inventory transaction API with expired access token
#    And I send the GET request to "inventories_get_inventory_transaction_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|expired_token_12345|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds
#
#  @Negative @Security
#  Scenario: Get inventory transaction API with malformed access token
#    And I send the GET request to "inventories_get_inventory_transaction_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|malformed.token.here|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds
#
#  @Positive @Smoke
#  Scenario: Get inventory transaction API with valid access token
#    And I send the GET request to "inventories_get_inventory_transaction_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Response.Result|"true"|
#      |$.Response.Reason||
#      |$.Response.Inventorytransactions|[]|
#    And I store the response as "inventory_transaction_api_response" name using full path
#
#  @Positive @DataValidation
#  Scenario: Validate inventory transaction API response structure
#    And I send the GET request to "inventories_get_inventory_transaction_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Response.Result|"true"|
#      |$.Response.Reason||
#      |$.Response.Inventorytransactions|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Response|object|
#      |$.Response.Result|string|
#      |$.Response.Reason|string|
#      |$.Response.Inventorytransactions|array|
#
#  @Positive @DataValidation
#  Scenario: Validate inventory transaction API specific data values
#    And I send the GET request to "inventories_get_inventory_transaction_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Response.Result|"true"|
#      |$.Response.Reason||
#      |$.Response.Inventorytransactions|[]|
#
#  @Positive @DataValidation
#  Scenario: Validate inventory transaction API with static values
#    And I send the GET request to "inventories_get_inventory_transaction_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Response.Result|"true"|
#      |$.Response.Reason||
#      |$.Response.Inventorytransactions|[]|
#
#  @Positive @Performance
#  Scenario: Performance test for inventory transaction API endpoint
#    And I send the GET request to "inventories_get_inventory_transaction_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Response.Result|"true"|
#      |$.Response.Reason||
#      |$.Response.Inventorytransactions|[]|
#
#  @Positive @Concurrency
#  Scenario: Concurrent access test for inventory transaction API endpoint
#    And I send the GET request to "inventories_get_inventory_transaction_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Response.Result|"true"|
#      |$.Response.Reason||
#      |$.Response.Inventorytransactions|[]|
#
#  @Negative @Validation
#  Scenario: Get inventory transaction API with invalid query parameters
#    And I send the GET request to "inventories_get_inventory_transaction_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |invalid_param|invalid_value|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Response.Result|"true"|
#      |$.Response.Reason||
#      |$.Response.Inventorytransactions|[]|
#
#  @Negative @Validation
#  Scenario: Get inventory transaction API with special characters in query parameters
#    And I send the GET request to "inventories_get_inventory_transaction_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Response.Result|"true"|
#      |$.Response.Reason||
#      |$.Response.Inventorytransactions|[]|
#
#  @Negative @Security
#  Scenario: Get inventory transaction API with SQL injection attempt
#    And I send the GET request to "inventories_get_inventory_transaction_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|'; DROP TABLE inventories; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Response.Result|"true"|
#      |$.Response.Reason||
#      |$.Response.Inventorytransactions|[]|
#
#  @Negative @Boundary
#  Scenario: Get inventory transaction API with maximum query parameters
#    And I send the GET request to "inventories_get_inventory_transaction_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |param1|value1|
#      |param2|value2|
#      |param3|value3|
#      |param4|value4|
#      |param5|value5|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Response.Result|"true"|
#      |$.Response.Reason||
#      |$.Response.Inventorytransactions|[]|
#
#  @Negative @ErrorHandling
#  Scenario: Get inventory transaction API with invalid endpoint
#    And I send the GET request to "inventories_get_inventory_transaction_api_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds
#
#  @Positive @BusinessLogic
#  Scenario: Validate inventory transaction API business logic
#    And I send the GET request to "inventories_get_inventory_transaction_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Response.Result|"true"|
#      |$.Response.Reason||
#      |$.Response.Inventorytransactions|[]|
#
#  @Positive @DataIntegrity
#  Scenario: Validate inventory transaction API data integrity
#    And I send the GET request to "inventories_get_inventory_transaction_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Response.Result|"true"|
#      |$.Response.Reason||
#      |$.Response.Inventorytransactions|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Response|object|
#      |$.Response.Result|string|
#      |$.Response.Reason|string|
#      |$.Response.Inventorytransactions|array|
#
#  @Positive @Regression
#  Scenario: Regression test for inventory transaction API endpoint
#    And I send the GET request to "inventories_get_inventory_transaction_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Response.Result|"true"|
#      |$.Response.Reason||
#      |$.Response.Inventorytransactions|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Response|object|
#      |$.Response.Result|string|
#      |$.Response.Reason|string|
#      |$.Response.Inventorytransactions|array|
#
#  @Positive @Functional
#  Scenario: Validate inventory transaction API response completeness
#    And I send the GET request to "inventories_get_inventory_transaction_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Response.Result|"true"|
#      |$.Response.Reason||
#      |$.Response.Inventorytransactions|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Response|object|
#      |$.Response.Result|string|
#      |$.Response.Reason|string|
#      |$.Response.Inventorytransactions|array|
#
#  @Positive @NestedObjectValidation
#  Scenario: Validate inventory transaction API nested response structure
#    And I send the GET request to "inventories_get_inventory_transaction_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Response.Result|"true"|
#      |$.Response.Reason||
#      |$.Response.Inventorytransactions|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Response|object|
#      |$.Response.Result|string|
#      |$.Response.Reason|string|
#      |$.Response.Inventorytransactions|array|
#
#  @Positive @ContentValidation
#  Scenario: Validate inventory transaction API content structure
#    And I send the GET request to "inventories_get_inventory_transaction_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Response.Result|"true"|
#      |$.Response.Reason||
#      |$.Response.Inventorytransactions|[]|
#    And validating the response contains the following values
#      |Value|
#      |Response|
#      |Result|
#      |Reason|
#      |Inventorytransactions|
#
#  @Positive @LoadTesting
#  Scenario: Load testing for inventory transaction API endpoint
#    And I send the GET request to "inventories_get_inventory_transaction_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "3000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Response.Result|"true"|
#      |$.Response.Reason||
#      |$.Response.Inventorytransactions|[]|
#
#  @Negative @Timeout
#  Scenario: Test inventory transaction API endpoint timeout handling
#    And I send the GET request to "inventories_get_inventory_transaction_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "5000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Response.Result|"true"|
#      |$.Response.Reason||
#      |$.Response.Inventorytransactions|[]|
#
#  @Positive @EndToEnd
#  Scenario: End-to-end inventory transaction API data retrieval workflow
#    And I send the GET request to "inventories_get_inventory_transaction_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Response.Result|"true"|
#      |$.Response.Reason||
#      |$.Response.Inventorytransactions|[]|
#    And I store the response as "inventory_transaction_api_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Response|object|
#      |$.Response.Result|string|
#      |$.Response.Reason|string|
#      |$.Response.Inventorytransactions|array|

#  @Positive @EmptyArrayValidation
#  Scenario: Validate inventory transaction API empty array response
#    And I send the GET request to "inventories_get_inventory_transaction_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Response.Result|"true"|
#      |$.Response.Reason||
#      |$.Response.Inventorytransactions|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Response|object|
#      |$.Response.Result|string|
#      |$.Response.Reason|string|
#      |$.Response.Inventorytransactions|array|



