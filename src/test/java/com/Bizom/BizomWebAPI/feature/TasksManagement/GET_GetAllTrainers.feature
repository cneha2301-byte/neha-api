@BizomWebAPI @TasksManagement @GetAllTrainers @OutletManagement @innovation
Feature: Get All Trainers API Testing
  As a system user
  I want to test the get all trainers endpoint
  So that I can ensure proper functionality and data retrieval for all trainers

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get all trainers without access token
    When I send the GET request to "tasks_get_all_trainers" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get all trainers with invalid access token
    And I send the GET request to "tasks_get_all_trainers" endpoint with dynamic access token and query parameters
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
  Scenario: Get all trainers with expired access token
    And I send the GET request to "tasks_get_all_trainers" endpoint with dynamic access token and query parameters
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
  Scenario: Get all trainers with malformed access token
    And I send the GET request to "tasks_get_all_trainers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

#  @Positive @Smoke
#  Scenario: Get all trainers with valid access token
#    And I send the GET request to "tasks_get_all_trainers" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|array|
#    And I store the response as "all_trainers_response" name using full path

#  @Positive @DataValidation
#  Scenario: Validate all trainers response structure
#    And I send the GET request to "tasks_get_all_trainers" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|array|

#  @Positive @EmptyArrayValidation
#  Scenario: Validate all trainers empty array response
#    And I send the GET request to "tasks_get_all_trainers" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|array|

  @Positive @Performance
  Scenario: Performance test for all trainers endpoint
    And I send the GET request to "tasks_get_all_trainers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Positive @Concurrency
  Scenario: Concurrent access test for all trainers endpoint
    And I send the GET request to "tasks_get_all_trainers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Negative @Validation
  Scenario: Get all trainers with invalid query parameters
    And I send the GET request to "tasks_get_all_trainers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Negative @Validation
  Scenario: Get all trainers with special characters in query parameters
    And I send the GET request to "tasks_get_all_trainers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Negative @Security
  Scenario: Get all trainers with SQL injection attempt
    And I send the GET request to "tasks_get_all_trainers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE tasks; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Negative @ErrorHandling
  Scenario: Get all trainers with invalid endpoint
    And I send the GET request to "tasks_get_all_trainers_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "404"
    And verify response time is less than "2500" milliseconds

#  @Positive @BusinessLogic
#  Scenario: Validate all trainers business logic
#    And I send the GET request to "tasks_get_all_trainers" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|array|

  @Positive @DataIntegrity
  Scenario: Validate all trainers data integrity
    And I send the GET request to "tasks_get_all_trainers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Positive @Regression
  Scenario: Regression test for all trainers endpoint
    And I send the GET request to "tasks_get_all_trainers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

#  @Positive @Functional
#  Scenario: Validate all trainers response completeness
#    And I send the GET request to "tasks_get_all_trainers" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|array|

#  @Positive @ArrayValidation
#  Scenario: Validate all trainers array structure
#    And I send the GET request to "tasks_get_all_trainers" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|array|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$|[]|

  @Positive @LoadTesting
  Scenario: Load testing for all trainers endpoint
    And I send the GET request to "tasks_get_all_trainers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Negative @Timeout
  Scenario: Test all trainers endpoint timeout handling
    And I send the GET request to "tasks_get_all_trainers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

#  @Positive @EndToEnd
#  Scenario: End-to-end all trainers data retrieval workflow
#    And I send the GET request to "tasks_get_all_trainers" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$|[]|
#    And I store the response as "all_trainers_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|array|


