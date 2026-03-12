@BizomWebAPI @TasksManagement @GetTaskdata @OutletManagement @innovation
Feature: Get Task Data API Testing
  As a system user
  I want to test the get task data endpoint
  So that I can ensure proper functionality and data retrieval for task data management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get task data without access token
    When I send the GET request to "tasks_gettaskdata" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get task data with invalid access token
    And I send the GET request to "tasks_gettaskdata" endpoint with dynamic access token and query parameters
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
  Scenario: TC_03 Get task data with expired access token
    And I send the GET request to "tasks_gettaskdata" endpoint with dynamic access token and query parameters
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
  Scenario: TC_04 Get task data with malformed access token
    And I send the GET request to "tasks_gettaskdata" endpoint with dynamic access token and query parameters
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
  Scenario: TC_05 Get task data with valid access token
    And I send the GET request to "tasks_gettaskdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And I store the response as "get_task_data_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate get task data response structure
    And I send the GET request to "tasks_gettaskdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Tasks|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate get task data Tasks array structure
    And I send the GET request to "tasks_gettaskdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Tasks|array|
      |$.Tasks[0].id|string|
      |$.Tasks[0].summary|string|
      |$.Tasks[0].description|string|
      |$.Tasks[0].taskcategory|string|
      |$.Tasks[0].tasktype|string|

  @Positive @DataValidation
  Scenario: TC_08 Validate get task data Tasks array elements
    And I send the GET request to "tasks_gettaskdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Tasks[0].id|string|
      |$.Tasks[0].summary|string|
      |$.Tasks[0].description|string|
      |$.Tasks[0].taskcategory|string|
      |$.Tasks[0].tasktype|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Positive @DataValidation
  Scenario: TC_09 Validate get task data complete structure
    And I send the GET request to "tasks_gettaskdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Tasks|array|
      |$.Tasks[0].id|string|
      |$.Tasks[0].summary|string|
      |$.Tasks[0].description|string|
      |$.Tasks[0].taskcategory|string|
      |$.Tasks[0].tasktype|string|

  @Positive @FieldValidation
  Scenario: TC_10 Validate get task data task fields
    And I send the GET request to "tasks_gettaskdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Tasks[0].id|string|
      |$.Tasks[0].summary|string|
      |$.Tasks[0].description|string|
      |$.Tasks[0].taskcategory|string|
      |$.Tasks[0].tasktype|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Positive @Performance
  Scenario: TC_11 Performance test for get task data endpoint
    And I send the GET request to "tasks_gettaskdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Tasks|array|

  @Positive @Concurrency
  Scenario: TC_12 Concurrent access test for get task data endpoint
    And I send the GET request to "tasks_gettaskdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Tasks|array|

  @Negative @Validation
  Scenario: TC_13 Get task data without fordate parameter
    And I send the GET request to "tasks_gettaskdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_14 Get task data with invalid fordate format
    And I send the GET request to "tasks_gettaskdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|invalid-date|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_15 Get task data with special characters in fordate
    And I send the GET request to "tasks_gettaskdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_16 Get task data with SQL injection attempt in fordate
    And I send the GET request to "tasks_gettaskdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|'; DROP TABLE tasks; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Negative @ErrorHandling
#  Scenario: TC_17 Get task data with invalid endpoint
#    And I send the GET request to "tasks_gettaskdata_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |fordate|2025-11-20|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_18 Validate get task data business logic
    And I send the GET request to "tasks_gettaskdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Tasks|array|
      |$.Tasks[0].id|string|
      |$.Tasks[0].summary|string|
      |$.Tasks[0].description|string|
      |$.Tasks[0].taskcategory|string|
      |$.Tasks[0].tasktype|string|

  @Positive @DataIntegrity
  Scenario: TC_19 Validate get task data data integrity
    And I send the GET request to "tasks_gettaskdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Tasks|array|
      |$.Tasks[0].id|string|
      |$.Tasks[0].summary|string|
      |$.Tasks[0].description|string|
      |$.Tasks[0].taskcategory|string|
      |$.Tasks[0].tasktype|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Positive @Regression
  Scenario: TC_20 Regression test for get task data endpoint
    And I send the GET request to "tasks_gettaskdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Tasks|array|
      |$.Tasks[0].id|string|
      |$.Tasks[0].summary|string|
      |$.Tasks[0].description|string|
      |$.Tasks[0].taskcategory|string|
      |$.Tasks[0].tasktype|string|

  @Positive @Functional
  Scenario: TC_21 Validate get task data response completeness
    And I send the GET request to "tasks_gettaskdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Tasks|array|
      |$.Tasks[0].id|string|
      |$.Tasks[0].summary|string|
      |$.Tasks[0].description|string|
      |$.Tasks[0].taskcategory|string|
      |$.Tasks[0].tasktype|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And I store the response as "get_task_data_response" name using full path
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Tasks|
      |id|
      |summary|
      |description|
      |taskcategory|
      |tasktype|

  @Positive @ArrayValidation
  Scenario: TC_22 Validate get task data Tasks array
    And I send the GET request to "tasks_gettaskdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Tasks|array|
      |$.Tasks[0]|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Positive @Boundary
  Scenario: TC_23 Get task data with different date values
    And I send the GET request to "tasks_gettaskdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2025-01-01|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Tasks|array|

  @Positive @EndToEnd
  Scenario: TC_24 End-to-end get task data data retrieval workflow
    And I send the GET request to "tasks_gettaskdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And I store the response as "get_task_data_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Tasks|array|
      |$.Tasks[0].id|string|
      |$.Tasks[0].summary|string|
      |$.Tasks[0].description|string|
      |$.Tasks[0].taskcategory|string|
      |$.Tasks[0].tasktype|string|

