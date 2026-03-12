@BizomWebAPI @TasksManagement @GetTaskActivityForm @TaskManagement @innovation
Feature: Get Task Activity Form API Testing
  As a system user
  I want to test the get task activity form endpoint
  So that I can ensure proper functionality and data retrieval for task activity form management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|application/json, text/javascript, */*; q=0.01|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get task activity form without access token
    When I send the GET request to "GET_GetTaskActivityForm" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |taskIds|DB:tasks:id: id=1 LIMIT 1|
    Then I should see the response code as "403"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get task activity form with invalid access token
    And I send the GET request to "GET_GetTaskActivityForm" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
      |taskIds|DB:tasks:id: id=1 LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.error.code|404|
      |$.error.message|"data not found"|

  @Negative @Security
  Scenario: Get task activity form with expired access token
    And I send the GET request to "GET_GetTaskActivityForm" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
      |taskIds|DB:tasks:id: id=1 LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.error.code|404|
      |$.error.message|"data not found"|

  @Negative @Security
  Scenario: Get task activity form with malformed access token
    And I send the GET request to "GET_GetTaskActivityForm" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
      |taskIds|DB:tasks:id: id=1 LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.error.code|404|
      |$.error.message|"data not found"|

  @Positive @Smoke
  Scenario: Get task activity form with valid access token and task ID
    And I send the GET request to "GET_GetTaskActivityForm" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |taskIds|DB:tasks:id: id=1 LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.error.code|404|
      |$.error.message|"data not found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.error|object|
      |$.error.code|number|
      |$.error.message|string|
      |$.data|array|
    And I store the response as "task_activity_form_response" name using full path

  @Positive @DataValidation
  Scenario: Validate task activity form response structure
    And I send the GET request to "GET_GetTaskActivityForm" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |taskIds|DB:tasks:id: id=1 LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.error.code|404|
      |$.error.message|"data not found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.error|object|
      |$.error.code|number|
      |$.error.message|string|
      |$.data|array|

  @Positive @DataValidation
  Scenario: Validate task activity form error response structure
    And I send the GET request to "GET_GetTaskActivityForm" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |taskIds|DB:tasks:id: id=1 LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.error|object|
      |$.error.code|number|
      |$.error.message|string|
      |$.data|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.error.code|404|
      |$.error.message|"data not found"|
      |$.data|[]|

  @Positive @QueryParameter
  Scenario: Get task activity form with different task ID
    And I send the GET request to "GET_GetTaskActivityForm" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |taskIds|DB:tasks:id: id=2 LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.error.code|404|
      |$.error.message|"data not found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

  @Positive @QueryParameter
  Scenario: Get task activity form with static task ID
    And I send the GET request to "GET_GetTaskActivityForm" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |taskIds|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.error.code|404|
      |$.error.message|"data not found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

  @Positive @Performance
  Scenario: Performance test for task activity form endpoint
    And I send the GET request to "GET_GetTaskActivityForm" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |taskIds|DB:tasks:id: id=1 LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.error.code|404|
      |$.error.message|"data not found"|

  @Positive @Concurrency
  Scenario: Concurrent access test for task activity form endpoint
    And I send the GET request to "GET_GetTaskActivityForm" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |taskIds|DB:tasks:id: id=1 LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.error.code|404|
      |$.error.message|"data not found"|

  @Negative @Validation
  Scenario: Get task activity form with invalid task ID
    And I send the GET request to "GET_GetTaskActivityForm" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |taskIds|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.error.code|404|
      |$.error.message|"data not found"|

  @Negative @Validation
  Scenario: Get task activity form with non-existent task ID
    And I send the GET request to "GET_GetTaskActivityForm" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |taskIds|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.error.code|404|
      |$.error.message|"data not found"|

  @Negative @Validation
  Scenario: Get task activity form with negative task ID
    And I send the GET request to "GET_GetTaskActivityForm" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |taskIds|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.error.code|404|
      |$.error.message|"data not found"|

  @Negative @Validation
  Scenario: Get task activity form with string task ID
    And I send the GET request to "GET_GetTaskActivityForm" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |taskIds|invalid_task_id|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get task activity form without taskIds parameter
    And I send the GET request to "GET_GetTaskActivityForm" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get task activity form with SQL injection in task ID
    And I send the GET request to "GET_GetTaskActivityForm" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |taskIds|1'; DROP TABLE tasks; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: Get task activity form with invalid endpoint
    And I send the GET request to "GET_GetTaskActivityForm_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |taskIds|DB:tasks:id: id=1 LIMIT 1|
    Then I should see the response code as "404"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate task activity form business logic
    And I send the GET request to "GET_GetTaskActivityForm" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |taskIds|DB:tasks:id: id=1 LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.error.code|404|
      |$.error.message|"data not found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.error|object|
      |$.error.code|number|
      |$.error.message|string|
      |$.data|array|

  @Positive @DataIntegrity
  Scenario: Validate task activity form data integrity
    And I send the GET request to "GET_GetTaskActivityForm" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |taskIds|DB:tasks:id: id=1 LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.error.code|404|
      |$.error.message|"data not found"|
      |$.data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.error|object|
      |$.error.code|number|
      |$.error.message|string|
      |$.data|array|

  @Positive @Regression
  Scenario: Regression test for task activity form endpoint
    And I send the GET request to "GET_GetTaskActivityForm" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |taskIds|DB:tasks:id: id=1 LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.error.code|404|
      |$.error.message|"data not found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.error|object|
      |$.error.code|number|
      |$.error.message|string|
      |$.data|array|

  @Positive @Functional
  Scenario: Validate task activity form response completeness
    And I send the GET request to "GET_GetTaskActivityForm" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |taskIds|DB:tasks:id: id=1 LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.error.code|404|
      |$.error.message|"data not found"|
      |$.data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.error|object|
      |$.error.code|number|
      |$.error.message|string|
      |$.data|array|
    And validating the response contains the following values
      |Value|
      |Result|
      |error|
      |code|
      |message|
      |data|

  @Positive @ArrayValidation
  Scenario: Validate task activity form array structure
    And I send the GET request to "GET_GetTaskActivityForm" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |taskIds|DB:tasks:id: id=1 LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.error.code|404|
      |$.error.message|"data not found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
    And validating the response contains the following values
      |Value|
      |Result|
      |error|
      |data|

  @Positive @ContentValidation
  Scenario: Validate task activity form content structure
    And I send the GET request to "GET_GetTaskActivityForm" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |taskIds|DB:tasks:id: id=1 LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.error.code|404|
      |$.error.message|"data not found"|
    And validating the response contains the following values
      |Value|
      |Result|
      |error|
      |code|
      |message|
      |data|

  @Positive @LoadTesting
  Scenario: Load testing for task activity form endpoint
    And I send the GET request to "GET_GetTaskActivityForm" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |taskIds|DB:tasks:id: id=1 LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.error.code|404|
      |$.error.message|"data not found"|

  @Negative @Timeout
  Scenario: Test task activity form endpoint timeout handling
    And I send the GET request to "GET_GetTaskActivityForm" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |taskIds|DB:tasks:id: id=1 LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.error.code|404|
      |$.error.message|"data not found"|

  @Positive @EndToEnd
  Scenario: End-to-end task activity form data retrieval workflow
    And I send the GET request to "GET_GetTaskActivityForm" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |taskIds|DB:tasks:id: id=1 LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.error.code|404|
      |$.error.message|"data not found"|
      |$.data|[]|
    And I store the response as "task_activity_form_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.error|object|
      |$.error.code|number|
      |$.error.message|string|
      |$.data|array|
    And validating the response contains the following values
      |Value|
      |Result|
      |error|
      |code|
      |message|
      |data|

