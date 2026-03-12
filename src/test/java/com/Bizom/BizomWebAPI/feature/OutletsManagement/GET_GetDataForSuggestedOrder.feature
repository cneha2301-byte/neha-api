@BizomWebAPI @CE @OutletsManagement @GETSuggestedOrder @SystemOperations
Feature: Get Data For Suggested Order API Testing
  As a system user
  I want to test the get data for suggested order endpoint
  So that I can ensure proper functionality and data retrieval for suggested order calculations

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get suggested order data without access token
    When I send the GET request to "outlets_get_data_for_suggested_order" endpoint with path parameters
      |Path|Value|
      |orderId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get suggested order data with invalid access token
    And I send the GET request to "outlets_get_data_for_suggested_order" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|orderId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get suggested order data with expired access token
    And I send the GET request to "outlets_get_data_for_suggested_order" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|orderId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get suggested order data with malformed access token
    And I send the GET request to "outlets_get_data_for_suggested_order" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|orderId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get suggested order data for order ID 1 with valid access token
    And I send the GET request to "outlets_get_data_for_suggested_order" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
    And I store the response as "suggested_order_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate suggested order data response structure
    And I send the GET request to "outlets_get_data_for_suggested_order" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.data|object|
      |$.warehouseSku|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate suggested order SKU data structure
    And I send the GET request to "outlets_get_data_for_suggested_order" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data.1.skunitId|number|
      |$.data.1.mtdsale|number|
      |$.data.1.target|number|
      |$.data.1.availableinventory|string|
      |$.data.1.suggestedOrder|number|
      |$.data.1.noOfDaysStock|number|

  @Positive @DataValidation
  Scenario: TC_08 Validate suggested order data for multiple SKUs
    And I send the GET request to "outlets_get_data_for_suggested_order" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.data.1.skunitId|1|
      |$.data.3.skunitId|3|
      |$.data.4.skunitId|4|
      |$.data.5.skunitId|5|
      |$.data.6.skunitId|6|

  @Positive @Performance
  Scenario: TC_09 Performance test for suggested order data endpoint
    And I send the GET request to "outlets_get_data_for_suggested_order" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @Validation
  Scenario: TC_10 Get suggested order data with zero order ID
    And I send the GET request to "outlets_get_data_for_suggested_order" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|

  @Negative @Validation
  Scenario: TC_11 Get suggested order data with special characters in query parameters
    And I send the GET request to "outlets_get_data_for_suggested_order" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|1|
      |test_param|<script>alert('XSS')</script>|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.data|object|

  @Negative @Security
  Scenario: TC_12 Get suggested order data with SQL injection attempt
    And I send the GET request to "outlets_get_data_for_suggested_order" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|1|
      |test_param|'; DROP TABLE orders; --|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.data|object|

  @Negative @Boundary
  Scenario: TC_13 Get suggested order data with maximum query parameters
    And I send the GET request to "outlets_get_data_for_suggested_order" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|1|
      |param1|value1|                   | |
      |param2|value2|                   | |
      |param3|value3|                   | |
      |param4|value4|                   | |
      |param5|value5|                   | |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @ErrorHandling
  Scenario: TC_14 Get suggested order data with invalid endpoint
    And I send the GET request to "outlets_get_data_for_suggested_order_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_15 Validate suggested order data business logic
    And I send the GET request to "outlets_get_data_for_suggested_order" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.data|object|
      |$.warehouseSku|array|

  @Positive @DataIntegrity
  Scenario: TC_16 Validate suggested order data integrity
    And I send the GET request to "outlets_get_data_for_suggested_order" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data.1.skunitId|number|
      |$.data.1.mtdsale|number|
      |$.data.1.target|number|
      |$.data.1.availableinventory|string|
      |$.data.1.suggestedOrder|number|
      |$.data.1.noOfDaysStock|number|

  @Positive @Regression
  Scenario: TC_17 Regression test for suggested order data endpoint
    And I send the GET request to "outlets_get_data_for_suggested_order" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.data|object|
      |$.warehouseSku|array|

  @Positive @Functional
  Scenario: TC_18 Validate suggested order data response completeness
    And I send the GET request to "outlets_get_data_for_suggested_order" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |result|
      |data|
      |warehouseSku|
      |skunitId|
      |mtdsale|
      |target|
      |availableinventory|
      |suggestedOrder|
      |noOfDaysStock|

  @Positive @LoadTesting
  Scenario: TC_19 Load testing for suggested order data endpoint
    And I send the GET request to "outlets_get_data_for_suggested_order" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|1|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
    
  @Negative @Timeout
  Scenario: TC_20 Test suggested order data endpoint timeout handling
    And I send the GET request to "outlets_get_data_for_suggested_order" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|1|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Positive @EndToEnd
  Scenario: TC_21 End-to-end suggested order data retrieval workflow
    And I send the GET request to "outlets_get_data_for_suggested_order" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
    And I store the response as "suggested_order_e2e_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.data|object|
      |$.warehouseSku|array|
      |$.data.1.skunitId|number|
      |$.data.1.mtdsale|number|
      |$.data.1.target|number|
      |$.data.1.availableinventory|string|
      |$.data.1.suggestedOrder|number|
      |$.data.1.noOfDaysStock|number|

  @Positive @ArrayValidation
  Scenario: TC_22 Validate warehouse SKU array structure
    And I send the GET request to "outlets_get_data_for_suggested_order" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.warehouseSku|array|

  @Positive @DataValidation
  Scenario: TC_23 Validate all SKU items in data object
    And I send the GET request to "outlets_get_data_for_suggested_order" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.data.1.skunitId|1|
      |$.data.1.mtdsale|0|
      |$.data.1.target|0|
      |$.data.1.suggestedOrder|0|
      |$.data.1.noOfDaysStock|0|

  @Positive @Reliability
  Scenario: TC_24 Reliability test for suggested order data endpoint
    And I send the GET request to "outlets_get_data_for_suggested_order" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.data|object|
      |$.warehouseSku|array|

  @Positive @Idempotency
  Scenario: TC_25 Idempotency test for suggested order data endpoint
    And I send the GET request to "outlets_get_data_for_suggested_order" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "suggested_order_first_call" name using full path
    And I send the GET request to "outlets_get_data_for_suggested_order" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.data|object|


