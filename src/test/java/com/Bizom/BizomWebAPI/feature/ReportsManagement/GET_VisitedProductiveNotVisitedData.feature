@BizomWebAPI @ReportsManagement @VisitedProductiveNotVisitedData @OrderManagement
Feature: Visited Productive Not Visited Data API Testing
  As a system user
  I want to test the visited productive not visited data endpoint
  So that I can ensure proper functionality and data retrieval for visited productive not visited data reports

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get visited productive not visited data without access token
    When I send the GET request to "reports_visited_productive_not_visited_data" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get visited productive not visited data with invalid access token
    And I send the GET request to "reports_visited_productive_not_visited_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get visited productive not visited data with expired access token
    And I send the GET request to "reports_visited_productive_not_visited_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get visited productive not visited data with malformed access token
    And I send the GET request to "reports_visited_productive_not_visited_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get visited productive not visited data with valid access token
    And I send the GET request to "reports_visited_productive_not_visited_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "visited_productive_not_visited_data_response" name using full path

  @Positive @DataValidation
  Scenario: Validate visited productive not visited data response structure
    And I send the GET request to "reports_visited_productive_not_visited_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|

  @Positive @Performance
  Scenario: Performance test for visited productive not visited data endpoint
    And I send the GET request to "reports_visited_productive_not_visited_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: Concurrent access test for visited productive not visited data endpoint
    And I send the GET request to "reports_visited_productive_not_visited_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get visited productive not visited data with invalid query parameters
    And I send the GET request to "reports_visited_productive_not_visited_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get visited productive not visited data with special characters in query parameters
    And I send the GET request to "reports_visited_productive_not_visited_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get visited productive not visited data with SQL injection attempt
    And I send the GET request to "reports_visited_productive_not_visited_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE reports; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: Get visited productive not visited data with maximum query parameters
    And I send the GET request to "reports_visited_productive_not_visited_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: Get visited productive not visited data with invalid endpoint
    And I send the GET request to "reports_visited_productive_not_visited_data_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "404"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate visited productive not visited data business logic
    And I send the GET request to "reports_visited_productive_not_visited_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|

  @Positive @DataIntegrity
  Scenario: Validate visited productive not visited data data integrity
    And I send the GET request to "reports_visited_productive_not_visited_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|

  @Positive @Regression
  Scenario: Regression test for visited productive not visited data endpoint
    And I send the GET request to "reports_visited_productive_not_visited_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|

  @Positive @Functional
  Scenario: Validate visited productive not visited data response completeness
    And I send the GET request to "reports_visited_productive_not_visited_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|

#  @Positive @ContentValidation
#  Scenario: Validate visited productive not visited data content structure
#    And I send the GET request to "reports_visited_productive_not_visited_data" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response contains the following values
#      |Value|
#      |response|

  @Positive @LoadTesting
  Scenario: Load testing for visited productive not visited data endpoint
    And I send the GET request to "reports_visited_productive_not_visited_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|

  @Negative @Timeout
  Scenario: Test visited productive not visited data endpoint timeout handling
    And I send the GET request to "reports_visited_productive_not_visited_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|

  @Positive @EndToEnd
  Scenario: End-to-end visited productive not visited data data retrieval workflow
    And I send the GET request to "reports_visited_productive_not_visited_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "visited_productive_not_visited_data_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|

  @Positive @StatusCodeValidation
  Scenario: Validate visited productive not visited data status code
    And I send the GET request to "reports_visited_productive_not_visited_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @ResponseTimeValidation
  Scenario: Validate visited productive not visited data response time
    And I send the GET request to "reports_visited_productive_not_visited_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds

  @Positive @ResponseValidation
  Scenario: Validate visited productive not visited data response exists
    And I send the GET request to "reports_visited_productive_not_visited_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|

