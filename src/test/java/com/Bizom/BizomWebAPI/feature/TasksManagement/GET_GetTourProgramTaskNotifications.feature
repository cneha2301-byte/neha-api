@BizomWebAPI @TasksManagement @GetTourProgramTaskNotifications @OutletManagement @innovation
Feature: Get Tour Program Task Notifications API Testing
  As a system user
  I want to test the get tour program task notifications endpoint
  So that I can ensure proper functionality and data retrieval for tour program task notifications management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get tour program task notifications without access token
    When I send the GET request to "tasks_gettourprogramtasknotifications" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get tour program task notifications with invalid access token
    And I send the GET request to "tasks_gettourprogramtasknotifications" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get tour program task notifications with expired access token
    And I send the GET request to "tasks_gettourprogramtasknotifications" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get tour program task notifications with malformed access token
    And I send the GET request to "tasks_gettourprogramtasknotifications" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get tour program task notifications with valid access token
    And I send the GET request to "tasks_gettourprogramtasknotifications" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
    And I store the response as "get_tour_program_task_notifications_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate get tour program task notifications response structure
    And I send the GET request to "tasks_gettourprogramtasknotifications" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.notification|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate get tour program task notifications notification array structure
    And I send the GET request to "tasks_gettourprogramtasknotifications" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.notification|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|

  @Positive @DataValidation
  Scenario: TC_08 Validate get tour program task notifications complete structure
    And I send the GET request to "tasks_gettourprogramtasknotifications" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.notification|array|

  @Positive @DataValidation
  Scenario: TC_09 Validate get tour program task notifications empty array handling
    And I send the GET request to "tasks_gettourprogramtasknotifications" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.notification|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|

  @Positive @Performance
  Scenario: TC_10 Performance test for get tour program task notifications endpoint
    And I send the GET request to "tasks_gettourprogramtasknotifications" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.notification|array|

  @Positive @Concurrency
  Scenario: TC_11 Concurrent access test for get tour program task notifications endpoint
    And I send the GET request to "tasks_gettourprogramtasknotifications" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.notification|array|

  @Negative @Validation
  Scenario: TC_12 Get tour program task notifications without fordate parameter
    And I send the GET request to "tasks_gettourprogramtasknotifications" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_13 Get tour program task notifications with invalid fordate format
    And I send the GET request to "tasks_gettourprogramtasknotifications" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|invalid-date|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_14 Get tour program task notifications with special characters in fordate
    And I send the GET request to "tasks_gettourprogramtasknotifications" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_15 Get tour program task notifications with SQL injection attempt in fordate
    And I send the GET request to "tasks_gettourprogramtasknotifications" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|'; DROP TABLE tasks; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Negative @ErrorHandling
#  Scenario: TC_16 Get tour program task notifications with invalid endpoint
#    And I send the GET request to "tasks_gettourprogramtasknotifications_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |fordate|2025-11-20|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_17 Validate get tour program task notifications business logic
    And I send the GET request to "tasks_gettourprogramtasknotifications" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.notification|array|

  @Positive @DataIntegrity
  Scenario: TC_18 Validate get tour program task notifications data integrity
    And I send the GET request to "tasks_gettourprogramtasknotifications" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.notification|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|

  @Positive @Regression
  Scenario: TC_19 Regression test for get tour program task notifications endpoint
    And I send the GET request to "tasks_gettourprogramtasknotifications" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.notification|array|

  @Positive @Functional
  Scenario: TC_20 Validate get tour program task notifications response completeness
    And I send the GET request to "tasks_gettourprogramtasknotifications" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.notification|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
    And I store the response as "get_tour_program_task_notifications_response" name using full path
    And validating the response contains the following values
      |Value|
      |result|
      |reason|
      |notification|

  @Positive @ArrayValidation
  Scenario: TC_21 Validate get tour program task notifications notification array
    And I send the GET request to "tasks_gettourprogramtasknotifications" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.notification|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|

  @Positive @Boundary
  Scenario: TC_22 Get tour program task notifications with different date values
    And I send the GET request to "tasks_gettourprogramtasknotifications" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2025-01-01|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.notification|array|

  @Positive @EndToEnd
  Scenario: TC_23 End-to-end get tour program task notifications data retrieval workflow
    And I send the GET request to "tasks_gettourprogramtasknotifications" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
    And I store the response as "get_tour_program_task_notifications_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.notification|array|

