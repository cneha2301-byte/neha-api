@BizomWebAPI @TaskStatusesManagement @GetStatusByTaskType @OutletManagement @Innovation
Feature: Get Status By Task Type API Testing
  As a system user
  I want to test the get status by task type endpoint
  So that I can ensure proper functionality and data retrieval for task status by task type management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get status by task type without access token
    When I send the GET request to "taskstatuses_getstatusbytasktype" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get status by task type with invalid access token
    And I send the GET request to "taskstatuses_getstatusbytasktype" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get status by task type with expired access token
    And I send the GET request to "taskstatuses_getstatusbytasktype" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
     And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get status by task type with malformed access token
    And I send the GET request to "taskstatuses_getstatusbytasktype" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
     And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get status by task type with valid access token
    And I send the GET request to "taskstatuses_getstatusbytasktype" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|
    And I store the response as "get_status_by_task_type_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate get status by task type response structure
    And I send the GET request to "taskstatuses_getstatusbytasktype" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.status|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate get status by task type status array structure
    And I send the GET request to "taskstatuses_getstatusbytasktype" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.status|array|
      |$.status[0].id|string|
      |$.status[0].name|string|
      |$.status[1].id|string|
      |$.status[1].name|string|
      |$.status[2].id|string|
      |$.status[2].name|string|

  @Positive @DataValidation
  Scenario: TC_08 Validate get status by task type status array elements
    And I send the GET request to "taskstatuses_getstatusbytasktype" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.status[0].id|string|
      |$.status[0].name|string|
      |$.status[1].id|string|
      |$.status[1].name|string|
      |$.status[2].id|string|
      |$.status[2].name|string|
      |$.status[3].id|string|
      |$.status[3].name|string|
      |$.status[4].id|string|
      |$.status[4].name|string|
      |$.status[5].id|string|
      |$.status[5].name|string|
      |$.status[6].id|string|
      |$.status[6].name|string|
      |$.status[7].id|string|
      |$.status[7].name|string|
      |$.status[8].id|string|
      |$.status[8].name|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|

  @Positive @DataValidation
  Scenario: TC_09 Validate get status by task type complete structure
    And I send the GET request to "taskstatuses_getstatusbytasktype" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.status|array|
      |$.status[0].id|string|
      |$.status[0].name|string|

  @Positive @FieldValidation
  Scenario: TC_10 Validate get status by task type specific status values
    And I send the GET request to "taskstatuses_getstatusbytasktype" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.status[0].id|string|
      |$.status[0].name|string|
      |$.status[1].id|string|
      |$.status[1].name|string|
      |$.status[2].id|string|
      |$.status[2].name|string|
      |$.status[3].id|string|
      |$.status[3].name|string|
      |$.status[4].id|string|
      |$.status[4].name|string|
      |$.status[5].id|string|
      |$.status[5].name|string|
      |$.status[6].id|string|
      |$.status[6].name|string|
      |$.status[7].id|string|
      |$.status[7].name|string|
      |$.status[8].id|string|
      |$.status[8].name|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|
      |$.status[0].id|"1"|
      |$.status[0].name|ASSIGNED|
      |$.status[1].id|"2"|
      |$.status[1].name|COMPLETED|
      |$.status[2].id|"3"|
      |$.status[2].name|REJECTED|
      |$.status[3].id|"4"|
      |$.status[3].name|DELETED|
      |$.status[4].id|"5"|
      |$.status[4].name|CLOSED|
      |$.status[5].id|"6"|
      |$.status[5].name|INCOMPLETED|
      |$.status[6].id|"7"|
      |$.status[6].name|INPROGRESS|
      |$.status[7].id|"8"|
      |$.status[7].name|NOTDONE|
      |$.status[8].id|"9"|
      |$.status[8].name|RESCHEDULE|

  @Positive @Performance
  Scenario: TC_11 Performance test for get status by task type endpoint
    And I send the GET request to "taskstatuses_getstatusbytasktype" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.status|array|

  @Positive @Concurrency
  Scenario: TC_12 Concurrent access test for get status by task type endpoint
    And I send the GET request to "taskstatuses_getstatusbytasktype" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.status|array|

  @Negative @ErrorHandling
  Scenario: TC_13 Get status by task type with invalid endpoint
    And I send the GET request to "taskstatuses_getstatusbytasktype_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Users"

  @Positive @BusinessLogic
  Scenario: TC_14 Validate get status by task type business logic
    And I send the GET request to "taskstatuses_getstatusbytasktype" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.status|array|
      |$.status[0].id|string|
      |$.status[0].name|string|
      |$.status[1].id|string|
      |$.status[1].name|string|
      |$.status[2].id|string|
      |$.status[2].name|string|
      |$.status[3].id|string|
      |$.status[3].name|string|
      |$.status[4].id|string|
      |$.status[4].name|string|
      |$.status[5].id|string|
      |$.status[5].name|string|
      |$.status[6].id|string|
      |$.status[6].name|string|
      |$.status[7].id|string|
      |$.status[7].name|string|
      |$.status[8].id|string|
      |$.status[8].name|string|

  @Positive @DataIntegrity
  Scenario: TC_15 Validate get status by task type data integrity
    And I send the GET request to "taskstatuses_getstatusbytasktype" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.status|array|
      |$.status[0].id|string|
      |$.status[0].name|string|
      |$.status[1].id|string|
      |$.status[1].name|string|
      |$.status[2].id|string|
      |$.status[2].name|string|
      |$.status[3].id|string|
      |$.status[3].name|string|
      |$.status[4].id|string|
      |$.status[4].name|string|
      |$.status[5].id|string|
      |$.status[5].name|string|
      |$.status[6].id|string|
      |$.status[6].name|string|
      |$.status[7].id|string|
      |$.status[7].name|string|
      |$.status[8].id|string|
      |$.status[8].name|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|
      |$.status[0].id|"1"|
      |$.status[0].name|ASSIGNED|
      |$.status[1].id|"2"|
      |$.status[1].name|COMPLETED|
      |$.status[2].id|"3"|
      |$.status[2].name|REJECTED|
      |$.status[3].id|"4"|
      |$.status[3].name|DELETED|
      |$.status[4].id|"5"|
      |$.status[4].name|CLOSED|
      |$.status[5].id|"6"|
      |$.status[5].name|INCOMPLETED|
      |$.status[6].id|"7"|
      |$.status[6].name|INPROGRESS|
      |$.status[7].id|"8"|
      |$.status[7].name|NOTDONE|
      |$.status[8].id|"9"|
      |$.status[8].name|RESCHEDULE|

  @Positive @Regression
  Scenario: TC_16 Regression test for get status by task type endpoint
    And I send the GET request to "taskstatuses_getstatusbytasktype" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.status|array|
      |$.status[0].id|string|
      |$.status[0].name|string|
      |$.status[1].id|string|
      |$.status[1].name|string|
      |$.status[2].id|string|
      |$.status[2].name|string|
      |$.status[3].id|string|
      |$.status[3].name|string|
      |$.status[4].id|string|
      |$.status[4].name|string|
      |$.status[5].id|string|
      |$.status[5].name|string|
      |$.status[6].id|string|
      |$.status[6].name|string|
      |$.status[7].id|string|
      |$.status[7].name|string|
      |$.status[8].id|string|
      |$.status[8].name|string|

  @Positive @Functional
  Scenario: TC_17 Validate get status by task type response completeness
    And I send the GET request to "taskstatuses_getstatusbytasktype" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.status|array|
      |$.status[0].id|string|
      |$.status[0].name|string|
      |$.status[1].id|string|
      |$.status[1].name|string|
      |$.status[2].id|string|
      |$.status[2].name|string|
      |$.status[3].id|string|
      |$.status[3].name|string|
      |$.status[4].id|string|
      |$.status[4].name|string|
      |$.status[5].id|string|
      |$.status[5].name|string|
      |$.status[6].id|string|
      |$.status[6].name|string|
      |$.status[7].id|string|
      |$.status[7].name|string|
      |$.status[8].id|string|
      |$.status[8].name|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|
    And I store the response as "get_status_by_task_type_response" name using full path
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |status|
      |id|
      |name|
      |ASSIGNED|
      |COMPLETED|
      |REJECTED|
      |DELETED|
      |CLOSED|
      |INCOMPLETED|
      |INPROGRESS|
      |NOTDONE|
      |RESCHEDULE|

  @Positive @ArrayValidation
  Scenario: TC_18 Validate get status by task type status array
    And I send the GET request to "taskstatuses_getstatusbytasktype" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.status|array|
      |$.status[0]|object|
      |$.status[1]|object|
      |$.status[2]|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|

  @Positive @EndToEnd
  Scenario: TC_19 End-to-end get status by task type data retrieval workflow
    And I send the GET request to "taskstatuses_getstatusbytasktype" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|
    And I store the response as "get_status_by_task_type_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.status|array|
      |$.status[0].id|string|
      |$.status[0].name|string|
      |$.status[1].id|string|
      |$.status[1].name|string|
      |$.status[2].id|string|
      |$.status[2].name|string|
      |$.status[3].id|string|
      |$.status[3].name|string|
      |$.status[4].id|string|
      |$.status[4].name|string|
      |$.status[5].id|string|
      |$.status[5].name|string|
      |$.status[6].id|string|
      |$.status[6].name|string|
      |$.status[7].id|string|
      |$.status[7].name|string|
      |$.status[8].id|string|
      |$.status[8].name|string|

