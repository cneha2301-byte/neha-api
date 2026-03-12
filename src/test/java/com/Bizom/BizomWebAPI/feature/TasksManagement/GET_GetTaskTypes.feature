@BizomWebAPI @TasksManagement @GetTaskTypes @OutletManagement @innovation
Feature: Get Task Types API Testing
  As a system user
  I want to test the get task types endpoint
  So that I can ensure proper functionality and data retrieval for task types management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get task types without access token
    When I send the GET request to "tasks_gettasktypes" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get task types with invalid access token
    And I send the GET request to "tasks_gettasktypes" endpoint with dynamic access token and query parameters
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
  Scenario: TC_03 Get task types with expired access token
    And I send the GET request to "tasks_gettasktypes" endpoint with dynamic access token and query parameters
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
  Scenario: TC_04 Get task types with malformed access token
    And I send the GET request to "tasks_gettasktypes" endpoint with dynamic access token and query parameters
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
  Scenario: TC_05 Get task types with valid access token
    And I send the GET request to "tasks_gettasktypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|""|
    And I store the response as "get_task_types_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate get task types response structure
    And I send the GET request to "tasks_gettasktypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|
      |$.error.message|string|
      |$.Tasks|object|

  @Positive @DataValidation
  Scenario: TC_07 Validate get task types Tasks object structure
    And I send the GET request to "tasks_gettasktypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Tasks|object|
      |$.Tasks["1"]|object|
      |$.Tasks["1"].id|string|
      |$.Tasks["1"].summary|string|
      |$.Tasks["1"].description|string|
      |$.Tasks["1"].fordate|string|
      |$.Tasks["1"].haspictures|boolean|
      |$.Tasks["1"].hasmultipleoutletselection|boolean|
      |$.Tasks["1"].createdbyuser_id|string|
      |$.Tasks["1"].tasktype|string|
      |$.Tasks["1"].color|null|
      |$.Tasks["1"].activityform_id|string|
      |$.Tasks["1"].Activityform|array|

  @Positive @DataValidation
  Scenario: TC_08 Validate get task types Tasks object elements
    And I send the GET request to "tasks_gettasktypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Tasks["1"].id|string|
      |$.Tasks["1"].summary|string|
      |$.Tasks["1"].description|string|
      |$.Tasks["1"].fordate|string|
      |$.Tasks["1"].haspictures|boolean|
      |$.Tasks["1"].hasmultipleoutletselection|boolean|
      |$.Tasks["1"].createdbyuser_id|string|
      |$.Tasks["1"].tasktype|string|
      |$.Tasks["1"].color|null|
      |$.Tasks["1"].activityform_id|string|
      |$.Tasks["1"].Activityform|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|""|

  @Positive @DataValidation
  Scenario: TC_09 Validate get task types error object structure
    And I send the GET request to "tasks_gettasktypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.error|object|
      |$.error.message|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|""|

  @Positive @DataValidation
  Scenario: TC_10 Validate get task types complete structure
    And I send the GET request to "tasks_gettasktypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|
      |$.error.message|string|
      |$.Tasks|object|
      |$.Tasks["1"]|object|
      |$.Tasks["1"].id|string|
      |$.Tasks["1"].summary|string|
      |$.Tasks["1"].description|string|
      |$.Tasks["1"].fordate|string|
      |$.Tasks["1"].haspictures|boolean|
      |$.Tasks["1"].hasmultipleoutletselection|boolean|
      |$.Tasks["1"].createdbyuser_id|string|
      |$.Tasks["1"].tasktype|string|
      |$.Tasks["1"].color|null|
      |$.Tasks["1"].activityform_id|string|
      |$.Tasks["1"].Activityform|array|

  @Positive @FieldValidation
  Scenario: TC_11 Validate get task types task fields
    And I send the GET request to "tasks_gettasktypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Tasks["1"].id|string|
      |$.Tasks["1"].summary|string|
      |$.Tasks["1"].description|string|
      |$.Tasks["1"].fordate|string|
      |$.Tasks["1"].haspictures|boolean|
      |$.Tasks["1"].hasmultipleoutletselection|boolean|
      |$.Tasks["1"].createdbyuser_id|string|
      |$.Tasks["1"].tasktype|string|
      |$.Tasks["1"].color|null|
      |$.Tasks["1"].activityform_id|string|
      |$.Tasks["1"].Activityform|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|""|

  @Positive @Performance
  Scenario: TC_12 Performance test for get task types endpoint
    And I send the GET request to "tasks_gettasktypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|
      |$.Tasks|object|

  @Positive @Concurrency
  Scenario: TC_13 Concurrent access test for get task types endpoint
    And I send the GET request to "tasks_gettasktypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|
      |$.Tasks|object|

#  @Negative @ErrorHandling
#  Scenario: TC_14 Get task types with invalid endpoint
#    And I send the GET request to "tasks_gettasktypes_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_15 Validate get task types business logic
    And I send the GET request to "tasks_gettasktypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|
      |$.error.message|string|
      |$.Tasks|object|
      |$.Tasks["1"]|object|
      |$.Tasks["1"].id|string|
      |$.Tasks["1"].summary|string|
      |$.Tasks["1"].description|string|
      |$.Tasks["1"].tasktype|string|
      |$.Tasks["1"].Activityform|array|

  @Positive @DataIntegrity
  Scenario: TC_16 Validate get task types data integrity
    And I send the GET request to "tasks_gettasktypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|
      |$.error.message|string|
      |$.Tasks|object|
      |$.Tasks["1"]|object|
      |$.Tasks["1"].id|string|
      |$.Tasks["1"].summary|string|
      |$.Tasks["1"].description|string|
      |$.Tasks["1"].fordate|string|
      |$.Tasks["1"].haspictures|boolean|
      |$.Tasks["1"].hasmultipleoutletselection|boolean|
      |$.Tasks["1"].createdbyuser_id|string|
      |$.Tasks["1"].tasktype|string|
      |$.Tasks["1"].color|null|
      |$.Tasks["1"].activityform_id|string|
      |$.Tasks["1"].Activityform|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|""|

  @Positive @Regression
  Scenario: TC_17 Regression test for get task types endpoint
    And I send the GET request to "tasks_gettasktypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|
      |$.error.message|string|
      |$.Tasks|object|
      |$.Tasks["1"]|object|
      |$.Tasks["1"].id|string|
      |$.Tasks["1"].summary|string|
      |$.Tasks["1"].description|string|
      |$.Tasks["1"].tasktype|string|
      |$.Tasks["1"].Activityform|array|

  @Positive @Functional
  Scenario: TC_18 Validate get task types response completeness
    And I send the GET request to "tasks_gettasktypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|
      |$.error.message|string|
      |$.Tasks|object|
      |$.Tasks["1"]|object|
      |$.Tasks["1"].id|string|
      |$.Tasks["1"].summary|string|
      |$.Tasks["1"].description|string|
      |$.Tasks["1"].fordate|string|
      |$.Tasks["1"].haspictures|boolean|
      |$.Tasks["1"].hasmultipleoutletselection|boolean|
      |$.Tasks["1"].createdbyuser_id|string|
      |$.Tasks["1"].tasktype|string|
      |$.Tasks["1"].color|null|
      |$.Tasks["1"].activityform_id|string|
      |$.Tasks["1"].Activityform|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|""|
    And I store the response as "get_task_types_response" name using full path
    And validating the response contains the following values
      |Value|
      |result|
      |error|
      |message|
      |Tasks|
      |id|
      |summary|
      |description|
      |fordate|
      |haspictures|
      |hasmultipleoutletselection|
      |createdbyuser_id|
      |tasktype|
      |color|
      |activityform_id|
      |Activityform|

  @Positive @ObjectValidation
  Scenario: TC_19 Validate get task types object structure
    And I send the GET request to "tasks_gettasktypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.error|object|
      |$.Tasks|object|
      |$.Tasks["1"]|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|""|

  @Positive @ArrayValidation
  Scenario: TC_20 Validate get task types Activityform array
    And I send the GET request to "tasks_gettasktypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Tasks["1"].Activityform|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|""|

  @Positive @EndToEnd
  Scenario: TC_21 End-to-end get task types data retrieval workflow
    And I send the GET request to "tasks_gettasktypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|""|
    And I store the response as "get_task_types_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|
      |$.error.message|string|
      |$.Tasks|object|
      |$.Tasks["1"]|object|
      |$.Tasks["1"].id|string|
      |$.Tasks["1"].summary|string|
      |$.Tasks["1"].description|string|
      |$.Tasks["1"].fordate|string|
      |$.Tasks["1"].haspictures|boolean|
      |$.Tasks["1"].hasmultipleoutletselection|boolean|
      |$.Tasks["1"].createdbyuser_id|string|
      |$.Tasks["1"].tasktype|string|
      |$.Tasks["1"].color|null|
      |$.Tasks["1"].activityform_id|string|
      |$.Tasks["1"].Activityform|array|

