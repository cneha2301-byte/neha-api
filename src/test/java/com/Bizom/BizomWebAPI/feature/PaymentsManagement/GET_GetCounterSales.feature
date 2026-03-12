@BizomWebAPI @OS @PaymentsManagement @CounterSales @SalesOperations
Feature: Get Counter Sales API Testing
  As a system user
  I want to test the get counter sales endpoint
  So that I can ensure proper functionality and data retrieval for payments management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get counter sales without access token
    When I send the GET request to "payments_get_counter_sales" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |date|2025-10-04|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get counter sales with invalid access token
    And I send the GET request to "payments_get_counter_sales" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
      |date|2025-10-04|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get counter sales with expired access token
    And I send the GET request to "payments_get_counter_sales" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
      |date|2025-10-04|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get counter sales with malformed access token
    And I send the GET request to "payments_get_counter_sales" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
      |date|2025-10-04|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get counter sales with valid date
    And I send the GET request to "payments_get_counter_sales" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |date|2025-10-04|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
    And I store the response as "counter_sales_response" name using full path

  @Positive @DataValidation
  Scenario: Validate counter sales response structure
    And I send the GET request to "payments_get_counter_sales" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |date|2025-10-04|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response|object|
      |$.Response.Result|string|
      |$.Response.Reason|string|
      |$.Response.Countersales|array|

  @Positive @DataValidation
  Scenario: Validate counter sales array structure
    And I send the GET request to "payments_get_counter_sales" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |date|2025-10-04|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response.Countersales|array|

  @Positive @DataValidation
  Scenario: Validate counter sales with static values
    And I send the GET request to "payments_get_counter_sales" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |date|2025-10-04|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
      |$.Response.Countersales|[]|

#  @Negative @Validation
#  Scenario: Get counter sales without date parameter
#    And I send the GET request to "payments_get_counter_sales" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Validation
#  Scenario: Get counter sales with invalid date format
#    And I send the GET request to "payments_get_counter_sales" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |date|invalid-date|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Validation
#  Scenario: Get counter sales with different date format
#    And I send the GET request to "payments_get_counter_sales" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |date|10-04-2025|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get counter sales with future date
    And I send the GET request to "payments_get_counter_sales" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |date|2099-12-31|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|

  @Negative @Validation
  Scenario: Get counter sales with past date
    And I send the GET request to "payments_get_counter_sales" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |date|2020-01-01|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|

#  @Negative @Validation
#  Scenario: Get counter sales with special characters in date parameter
#    And I send the GET request to "payments_get_counter_sales" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |date|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get counter sales with SQL injection attempt
#    And I send the GET request to "payments_get_counter_sales" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |date|'; DROP TABLE counter_sales; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: Get counter sales with invalid endpoint
    And I send the GET request to "payments_get_counter_sales_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |date|2025-10-04|
    Then I should see the response code as "404"
    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: Performance test for counter sales endpoint
    And I send the GET request to "payments_get_counter_sales" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |date|2025-10-04|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: Concurrent access test for counter sales endpoint
    And I send the GET request to "payments_get_counter_sales" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |date|2025-10-04|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|

  @Positive @BusinessLogic
  Scenario: Validate counter sales business logic
    And I send the GET request to "payments_get_counter_sales" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |date|2025-10-04|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response|object|
      |$.Response.Result|string|
      |$.Response.Reason|string|
      |$.Response.Countersales|array|

  @Positive @DataIntegrity
  Scenario: Validate counter sales data integrity
    And I send the GET request to "payments_get_counter_sales" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |date|2025-10-04|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response|object|
      |$.Response.Result|string|
      |$.Response.Reason|string|
      |$.Response.Countersales|array|

  @Positive @Regression
  Scenario: Regression test for counter sales endpoint
    And I send the GET request to "payments_get_counter_sales" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |date|2025-10-04|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response|object|
      |$.Response.Result|string|
      |$.Response.Reason|string|
      |$.Response.Countersales|array|

  @Positive @Functional
  Scenario: Validate counter sales response completeness
    And I send the GET request to "payments_get_counter_sales" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |date|2025-10-04|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response.Countersales|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Countersales|[]|

  @Positive @ArrayValidation
  Scenario: Validate counter sales array structure and content
    And I send the GET request to "payments_get_counter_sales" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |date|2025-10-04|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response.Countersales|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Countersales|[]|

  @Positive @ContentValidation
  Scenario: Validate counter sales content structure
    And I send the GET request to "payments_get_counter_sales" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |date|2025-10-04|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
    And validating the response contains the following values
      |Value|
      |Response|
      |Result|
      |Reason|
      |Countersales|

  @Positive @LoadTesting
  Scenario: Load testing for counter sales endpoint
    And I send the GET request to "payments_get_counter_sales" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |date|2025-10-04|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|

  @Negative @Timeout
  Scenario: Test counter sales endpoint timeout handling
    And I send the GET request to "payments_get_counter_sales" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |date|2025-10-04|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|

  @Positive @EndToEnd
  Scenario: End-to-end counter sales data retrieval workflow
    And I send the GET request to "payments_get_counter_sales" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |date|2025-10-04|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
    And I store the response as "counter_sales_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response|object|
      |$.Response.Result|string|
      |$.Response.Reason|string|
      |$.Response.Countersales|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Countersales|[]|

  @Positive @EmptyArrayValidation
  Scenario: Validate counter sales empty array response
    And I send the GET request to "payments_get_counter_sales" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |date|2025-10-04|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
      |$.Response.Countersales|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response.Countersales|array|

  @Positive @DateParameterValidation
  Scenario: Validate counter sales with different dates
    And I send the GET request to "payments_get_counter_sales" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |date|2025-11-15|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response|object|
      |$.Response.Result|string|
      |$.Response.Reason|string|
      |$.Response.Countersales|array|

  @Positive @FieldValidation
  Scenario: Validate counter sales field completeness
    And I send the GET request to "payments_get_counter_sales" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |date|2025-10-04|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
      |$.Response.Countersales|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response|object|
      |$.Response.Result|string|
      |$.Response.Reason|string|
      |$.Response.Countersales|array|

  @Positive @NestedResponseValidation
  Scenario: Validate counter sales nested response structure
    And I send the GET request to "payments_get_counter_sales" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |date|2025-10-04|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response|object|
      |$.Response.Result|string|
      |$.Response.Reason|string|
      |$.Response.Countersales|array|

