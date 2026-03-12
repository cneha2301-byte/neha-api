@BizomWebAPI @CE @UserActivityFieldForTask @ReportingOperations
Feature: User Activity Field For Task API Testing
  As a system user
  I want to test the user activity field for task endpoint
  So that I can ensure proper functionality and data retrieval for user activity field management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get user activity field for task without access token
    When I send the GET request to "user_activity_field_for_task" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get user activity field for task with invalid access token
    And I send the GET request to "user_activity_field_for_task" endpoint with dynamic access token and query parameters
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
  Scenario: Get user activity field for task with expired access token
    And I send the GET request to "user_activity_field_for_task" endpoint with dynamic access token and query parameters
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
  Scenario: Get user activity field for task with malformed access token
    And I send the GET request to "user_activity_field_for_task" endpoint with dynamic access token and query parameters
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
  Scenario: Get user activity field for task with valid access token
    And I send the GET request to "user_activity_field_for_task" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "user_activity_field_for_task_response" name using full path

  @Positive @Functional
  Scenario: Validate user activity field for task endpoint functionality
    And I send the GET request to "user_activity_field_for_task" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: Performance test for user activity field for task endpoint
    And I send the GET request to "user_activity_field_for_task" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: Concurrent access test for user activity field for task endpoint
    And I send the GET request to "user_activity_field_for_task" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get user activity field for task with invalid query parameters
    And I send the GET request to "user_activity_field_for_task" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get user activity field for task with special characters in query parameters
    And I send the GET request to "user_activity_field_for_task" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get user activity field for task with SQL injection attempt
    And I send the GET request to "user_activity_field_for_task" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE users; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: Get user activity field for task with maximum query parameters
    And I send the GET request to "user_activity_field_for_task" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Negative @ErrorHandling
#  Scenario: Get user activity field for task with invalid endpoint
#    And I send the GET request to "user_activity_field_for_task_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

  @Positive @BusinessLogic
  Scenario: Validate user activity field for task business logic
    And I send the GET request to "user_activity_field_for_task" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @DataIntegrity
  Scenario: Validate user activity field for task data integrity
    And I send the GET request to "user_activity_field_for_task" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Regression
  Scenario: Regression test for user activity field for task endpoint
    And I send the GET request to "user_activity_field_for_task" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @LoadTesting
  Scenario: Load testing for user activity field for task endpoint
    And I send the GET request to "user_activity_field_for_task" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Negative @Timeout
  Scenario: Test user activity field for task endpoint timeout handling
    And I send the GET request to "user_activity_field_for_task" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds

  @Positive @EndToEnd
  Scenario: End-to-end user activity field for task data retrieval workflow
    And I send the GET request to "user_activity_field_for_task" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "user_activity_field_for_task_response" name using full path

  @Positive @ActivityFieldValidation
  Scenario: Validate user activity field for task data accuracy
    And I send the GET request to "user_activity_field_for_task" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @TaskManagementValidation
  Scenario: Validate user activity field for task management interface
    And I send the GET request to "user_activity_field_for_task" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @UserActivityValidation
  Scenario: Validate user activity field for task user activity handling
    And I send the GET request to "user_activity_field_for_task" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @FieldRetrievalValidation
  Scenario: Validate user activity field for task field retrieval functionality
    And I send the GET request to "user_activity_field_for_task" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @UserManagementValidation
  Scenario: Validate user activity field for task user management interface
    And I send the GET request to "user_activity_field_for_task" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @ActivityTaskValidation
  Scenario: Validate user activity field for task activity and task integration
    And I send the GET request to "user_activity_field_for_task" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @FieldManagementValidation
  Scenario: Validate user activity field for task field management capabilities
    And I send the GET request to "user_activity_field_for_task" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @SystemIntegrationValidation
  Scenario: Validate user activity field for task system integration
    And I send the GET request to "user_activity_field_for_task" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @DataRetrievalValidation
  Scenario: Validate user activity field for task data retrieval consistency
    And I send the GET request to "user_activity_field_for_task" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @EndpointStabilityValidation
  Scenario: Validate user activity field for task endpoint stability
    And I send the GET request to "user_activity_field_for_task" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

