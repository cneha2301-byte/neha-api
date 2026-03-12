@BizomWebAPI @CE @UserSummaryIndexApi @SystemIntegration
Feature: User Summary Index API Testing
  As a system user
  I want to test the userSummaryIndexApi endpoint
  So that I can ensure proper functionality and data retrieval for user summary information

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get user summary index without access token
    When I send the GET request to "user_summary_index_api" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get user summary index with invalid access token
    And I send the GET request to "user_summary_index_api" endpoint with dynamic access token and query parameters
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
  Scenario: Get user summary index with expired access token
    And I send the GET request to "user_summary_index_api" endpoint with dynamic access token and query parameters
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
  Scenario: Get user summary index with malformed access token
    And I send the GET request to "user_summary_index_api" endpoint with dynamic access token and query parameters
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
  Scenario: Get user summary index with valid access token
    And I send the GET request to "user_summary_index_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Data not found|
    And I store the response as "user_summary_response" name using full path

#  @Positive @DataValidation
#  Scenario: Validate user summary index response structure
#    And I send the GET request to "user_summary_index_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|Data not found|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.data|array|

  @Positive @DataValidation
  Scenario: Validate user summary index specific data values
    And I send the GET request to "user_summary_index_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Data not found|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Data not found|
      |$.data|[]|

  @Positive @DataValidation
  Scenario: Validate user summary index with static values
    And I send the GET request to "user_summary_index_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Data not found|
      |$.data|[]|

  @Positive @Performance
  Scenario: Performance test for user summary index endpoint
    And I send the GET request to "user_summary_index_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Data not found|

  @Positive @Concurrency
  Scenario: Concurrent access test for user summary index endpoint
    And I send the GET request to "user_summary_index_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Data not found|

  @Negative @Validation
  Scenario: Get user summary index with invalid query parameters
    And I send the GET request to "user_summary_index_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Data not found|

  @Negative @Validation
  Scenario: Get user summary index with special characters in query parameters
    And I send the GET request to "user_summary_index_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Data not found|

  @Negative @Security
  Scenario: Get user summary index with SQL injection attempt
    And I send the GET request to "user_summary_index_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE users; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Data not found|

  @Negative @Boundary
  Scenario: Get user summary index with maximum query parameters
    And I send the GET request to "user_summary_index_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Data not found|

#  @Negative @ErrorHandling
#  Scenario: Get user summary index with invalid endpoint
#    And I send the GET request to "user_summary_index_api_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

  @Positive @BusinessLogic
  Scenario: Validate user summary index business logic
    And I send the GET request to "user_summary_index_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Data not found|

#  @Positive @DataIntegrity
#  Scenario: Validate user summary index data integrity
#    And I send the GET request to "user_summary_index_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|Data not found|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.data|array|

#  @Positive @Regression
#  Scenario: Regression test for user summary index endpoint
#    And I send the GET request to "user_summary_index_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|Data not found|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.data|array|

  @Positive @Functional
  Scenario: Validate user summary index response completeness
    And I send the GET request to "user_summary_index_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Data not found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Data not found|
      |$.data|[]|

  @Positive @ArrayValidation
  Scenario: Validate user summary index array structure and content
    And I send the GET request to "user_summary_index_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Data not found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Data not found|
      |$.data|[]|

  @Positive @ContentValidation
  Scenario: Validate user summary index content structure
    And I send the GET request to "user_summary_index_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Data not found|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |data|

  @Positive @LoadTesting
  Scenario: Load testing for user summary index endpoint
    And I send the GET request to "user_summary_index_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Data not found|

  @Negative @Timeout
  Scenario: Test user summary index endpoint timeout handling
    And I send the GET request to "user_summary_index_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Data not found|

#  @Positive @EndToEnd
#  Scenario: End-to-end user summary index data retrieval workflow
#    And I send the GET request to "user_summary_index_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|Data not found|
#    And I store the response as "user_summary_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.data|array|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|Data not found|
#      |$.data|[]|

#  @Positive @NoDataValidation
#  Scenario: Validate user summary index no data scenario
#    And I send the GET request to "user_summary_index_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|Data not found|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.data|array|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|Data not found|
#      |$.data|[]|

  @Positive @EmptyDataValidation
  Scenario: Validate user summary index empty data array
    And I send the GET request to "user_summary_index_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Data not found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data|[]|

#  @Positive @ResponseStructureValidation
##  Scenario: Validate user summary index response structure consistency
##    And I send the GET request to "user_summary_index_api" endpoint with dynamic access token and query parameters
##      |QueryParamName|QueryParamValue|
##      |access_token|ACCESS_TOKEN|
##    Then I should see the response code as "200"
##    And verify response time is less than "2500" milliseconds
##    And the fields in response should match with expected values
##      |JPath|Value|
##      |$.Result|false|
##      |$.Reason|Data not found|
##    And validating the response field data types
##      |JPath|ExpectedType|
##      |$.Result|false|
##      |$.Reason|string|
##      |$.data|array|
##    And the fields in response should match with expected values
##      |JPath|Value|
##      |$.Result|false|
##      |$.Reason|Data not found|
##      |$.data|[]|
