@BizomWebAPI @TasksManagement @GetTasks @OutletManagement @innovation
Feature: Get Tasks API Testing
  As a system user
  I want to test the get tasks endpoint
  So that I can ensure proper functionality and data retrieval for tasks management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get tasks without access token
    When I send the GET request to "tasks_gettasks" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get tasks with invalid access token
    And I send the GET request to "tasks_gettasks" endpoint with dynamic access token and query parameters
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
  Scenario: TC_03 Get tasks with expired access token
    And I send the GET request to "tasks_gettasks" endpoint with dynamic access token and query parameters
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
  Scenario: TC_04 Get tasks with malformed access token
    And I send the GET request to "tasks_gettasks" endpoint with dynamic access token and query parameters
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
  Scenario: TC_05 Get tasks with valid access token
    And I send the GET request to "tasks_gettasks" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And I store the response as "get_tasks_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate get tasks response structure
    And I send the GET request to "tasks_gettasks" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Taskmaster|array|
      |$.Tasks|array|
      |$.Taskstatuses|object|
      |$.Outlets|array|
      |$.taskSubTaskMapping|array|
      |$.totalpages|number|

  @Positive @DataValidation
  Scenario: TC_07 Validate get tasks Taskmaster array structure
    And I send the GET request to "tasks_gettasks" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Taskmaster|array|
      |$.Taskmaster[0].id|string|
      |$.Taskmaster[0].summary|string|
      |$.Taskmaster[0].description|string|
      |$.Taskmaster[0].fordate|string|
      |$.Taskmaster[0].haspictures|boolean|
      |$.Taskmaster[0].hasmultipleoutletselection|boolean|
      |$.Taskmaster[0].createdbyuser_id|string|
      |$.Taskmaster[0].is_active|string|
      |$.Taskmaster[0].created|string|
      |$.Taskmaster[0].modified|string|
      |$.Taskmaster[0].tasktype|string|
      |$.Taskmaster[0].taskcategory|string|
      |$.Taskmaster[0].color|null|
      |$.Taskmaster[0].activityform_id|string|
      |$.Taskmaster[0].perdayactivity|boolean|
      |$.Taskmaster[0].startdate_enabled|string|
      |$.Taskmaster[0].taskActivityFormMapping|object|

  @Positive @DataValidation
  Scenario: TC_08 Validate get tasks Taskmaster array elements
    And I send the GET request to "tasks_gettasks" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Taskmaster[0].id|string|
      |$.Taskmaster[0].summary|string|
      |$.Taskmaster[0].description|string|
      |$.Taskmaster[0].haspictures|boolean|
      |$.Taskmaster[0].hasmultipleoutletselection|boolean|
      |$.Taskmaster[0].perdayactivity|boolean|
      |$.Taskmaster[0].taskActivityFormMapping|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @Positive @DataValidation
  Scenario: TC_09 Validate get tasks Taskstatuses object
    And I send the GET request to "tasks_gettasks" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Taskstatuses|object|
      |$.Taskstatuses["1"]|string|
      |$.Taskstatuses["2"]|string|
      |$.Taskstatuses["3"]|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @Positive @DataValidation
  Scenario: TC_10 Validate get tasks complete structure
    And I send the GET request to "tasks_gettasks" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Taskmaster|array|
      |$.Tasks|array|
      |$.Taskstatuses|object|
      |$.Outlets|array|
      |$.taskSubTaskMapping|array|
      |$.totalpages|number|

  @Positive @FieldValidation
  Scenario: TC_11 Validate get tasks Taskmaster fields
    And I send the GET request to "tasks_gettasks" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Taskmaster[0].id|string|
      |$.Taskmaster[0].summary|string|
      |$.Taskmaster[0].description|string|
      |$.Taskmaster[0].fordate|string|
      |$.Taskmaster[0].haspictures|boolean|
      |$.Taskmaster[0].hasmultipleoutletselection|boolean|
      |$.Taskmaster[0].createdbyuser_id|string|
      |$.Taskmaster[0].is_active|string|
      |$.Taskmaster[0].created|string|
      |$.Taskmaster[0].modified|string|
      |$.Taskmaster[0].tasktype|string|
      |$.Taskmaster[0].taskcategory|string|
      |$.Taskmaster[0].color|null|
      |$.Taskmaster[0].activityform_id|string|
      |$.Taskmaster[0].perdayactivity|boolean|
      |$.Taskmaster[0].startdate_enabled|string|
      |$.Taskmaster[0].taskActivityFormMapping|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @Positive @Performance
  Scenario: TC_12 Performance test for get tasks endpoint
    And I send the GET request to "tasks_gettasks" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Taskmaster|array|
      |$.Tasks|array|
      |$.Taskstatuses|object|

  @Positive @Concurrency
  Scenario: TC_13 Concurrent access test for get tasks endpoint
    And I send the GET request to "tasks_gettasks" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Taskmaster|array|
      |$.Tasks|array|
      |$.Taskstatuses|object|

  @Negative @Validation
  Scenario: TC_14 Get tasks without fordate parameter
    And I send the GET request to "tasks_gettasks" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_15 Get tasks with invalid fordate format
    And I send the GET request to "tasks_gettasks" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|invalid-date|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_16 Get tasks with special characters in fordate
    And I send the GET request to "tasks_gettasks" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_17 Get tasks with SQL injection attempt in fordate
    And I send the GET request to "tasks_gettasks" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|'; DROP TABLE tasks; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Negative @ErrorHandling
#  Scenario: TC_18 Get tasks with invalid endpoint
#    And I send the GET request to "tasks_gettasks_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |fordate|2025-11-20|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_19 Validate get tasks business logic
    And I send the GET request to "tasks_gettasks" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Taskmaster|array|
      |$.Tasks|array|
      |$.Taskstatuses|object|
      |$.Outlets|array|
      |$.taskSubTaskMapping|array|
      |$.totalpages|number|

  @Positive @DataIntegrity
  Scenario: TC_20 Validate get tasks data integrity
    And I send the GET request to "tasks_gettasks" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Taskmaster|array|
      |$.Tasks|array|
      |$.Taskstatuses|object|
      |$.Outlets|array|
      |$.taskSubTaskMapping|array|
      |$.totalpages|number|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @Positive @Regression
  Scenario: TC_21 Regression test for get tasks endpoint
    And I send the GET request to "tasks_gettasks" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Taskmaster|array|
      |$.Tasks|array|
      |$.Taskstatuses|object|
      |$.Outlets|array|
      |$.taskSubTaskMapping|array|
      |$.totalpages|number|

  @Positive @Functional
  Scenario: TC_22 Validate get tasks response completeness
    And I send the GET request to "tasks_gettasks" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Taskmaster|array|
      |$.Tasks|array|
      |$.Taskstatuses|object|
      |$.Outlets|array|
      |$.taskSubTaskMapping|array|
      |$.totalpages|number|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And I store the response as "get_tasks_response" name using full path
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Taskmaster|
      |Tasks|
      |Taskstatuses|
      |Outlets|
      |taskSubTaskMapping|
      |totalpages|

  @Positive @ArrayValidation
  Scenario: TC_23 Validate get tasks array fields
    And I send the GET request to "tasks_gettasks" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Taskmaster|array|
      |$.Tasks|array|
      |$.Outlets|array|
      |$.taskSubTaskMapping|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @Positive @ObjectValidation
  Scenario: TC_24 Validate get tasks object fields
    And I send the GET request to "tasks_gettasks" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Taskstatuses|object|
      |$.Taskmaster[0].taskActivityFormMapping|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @Positive @Boundary
  Scenario: TC_25 Get tasks with different date values
    And I send the GET request to "tasks_gettasks" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2025-01-01|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Taskmaster|array|
      |$.Tasks|array|
      |$.Taskstatuses|object|

  @Positive @EndToEnd
  Scenario: TC_26 End-to-end get tasks data retrieval workflow
    And I send the GET request to "tasks_gettasks" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And I store the response as "get_tasks_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Taskmaster|array|
      |$.Tasks|array|
      |$.Taskstatuses|object|
      |$.Outlets|array|
      |$.taskSubTaskMapping|array|
      |$.totalpages|number|

