@BizomWebAPI @TaskStatusesManagement @GetStatus @OutletManagement @Innovation
Feature: Get Status API Testing
  As a system user
  I want to test the get status endpoint
  So that I can ensure proper functionality and data retrieval for task status management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get status without access token
    When I send the GET request to "taskstatuses_getstatus" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get status with invalid access token
    And I send the GET request to "taskstatuses_getstatus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get status with expired access token
    And I send the GET request to "taskstatuses_getstatus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get status with malformed access token
    And I send the GET request to "taskstatuses_getstatus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get status with valid access token
    And I send the GET request to "taskstatuses_getstatus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And I store the response as "get_status_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate get status response structure
    And I send the GET request to "taskstatuses_getstatus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.status|object|

  @Positive @DataValidation
  Scenario: TC_07 Validate get status status object structure
    And I send the GET request to "taskstatuses_getstatus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.status|object|
      |$.status["1"]|string|
      |$.status["2"]|string|
      |$.status["3"]|string|
      |$.status["4"]|string|
      |$.status["5"]|string|
      |$.status["6"]|string|
      |$.status["7"]|string|
      |$.status["8"]|string|
      |$.status["9"]|string|

  @Positive @DataValidation
  Scenario: TC_08 Validate get status status values
    And I send the GET request to "taskstatuses_getstatus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.status["1"]|string|
      |$.status["2"]|string|
      |$.status["3"]|string|
      |$.status["4"]|string|
      |$.status["5"]|string|
      |$.status["6"]|string|
      |$.status["7"]|string|
      |$.status["8"]|string|
      |$.status["9"]|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @DataValidation
  Scenario: TC_09 Validate get status complete structure
    And I send the GET request to "taskstatuses_getstatus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.status|object|
      |$.status["1"]|string|
      |$.status["2"]|string|
      |$.status["3"]|string|
      |$.status["4"]|string|
      |$.status["5"]|string|
      |$.status["6"]|string|
      |$.status["7"]|string|
      |$.status["8"]|string|
      |$.status["9"]|string|

  @Positive @FieldValidation
  Scenario: TC_10 Validate get status specific status values
    And I send the GET request to "taskstatuses_getstatus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.status["1"]|string|
      |$.status["2"]|string|
      |$.status["3"]|string|
      |$.status["4"]|string|
      |$.status["5"]|string|
      |$.status["6"]|string|
      |$.status["7"]|string|
      |$.status["8"]|string|
      |$.status["9"]|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.status["1"]|ASSIGNED|
      |$.status["2"]|COMPLETED|
      |$.status["3"]|REJECTED|
      |$.status["4"]|DELETED|
      |$.status["5"]|CLOSED|
      |$.status["6"]|INCOMPLETED|
      |$.status["7"]|INPROGRESS|
      |$.status["8"]|NOTDONE|
      |$.status["9"]|RESCHEDULE|

  @Positive @Performance
  Scenario: TC_11 Performance test for get status endpoint
    And I send the GET request to "taskstatuses_getstatus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.status|object|

  @Positive @Concurrency
  Scenario: TC_12 Concurrent access test for get status endpoint
    And I send the GET request to "taskstatuses_getstatus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.status|object|

  @Negative @ErrorHandling
  Scenario: TC_13 Get status with invalid endpoint
    And I send the GET request to "taskstatuses_getstatus_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Users"

  @Positive @BusinessLogic
  Scenario: TC_14 Validate get status business logic
    And I send the GET request to "taskstatuses_getstatus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.status|object|
      |$.status["1"]|string|
      |$.status["2"]|string|
      |$.status["3"]|string|
      |$.status["4"]|string|
      |$.status["5"]|string|
      |$.status["6"]|string|
      |$.status["7"]|string|
      |$.status["8"]|string|
      |$.status["9"]|string|

  @Positive @DataIntegrity
  Scenario: TC_15 Validate get status data integrity
    And I send the GET request to "taskstatuses_getstatus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.status|object|
      |$.status["1"]|string|
      |$.status["2"]|string|
      |$.status["3"]|string|
      |$.status["4"]|string|
      |$.status["5"]|string|
      |$.status["6"]|string|
      |$.status["7"]|string|
      |$.status["8"]|string|
      |$.status["9"]|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.status["1"]|ASSIGNED|
      |$.status["2"]|COMPLETED|
      |$.status["3"]|REJECTED|
      |$.status["4"]|DELETED|
      |$.status["5"]|CLOSED|
      |$.status["6"]|INCOMPLETED|
      |$.status["7"]|INPROGRESS|
      |$.status["8"]|NOTDONE|
      |$.status["9"]|RESCHEDULE|

  @Positive @Regression
  Scenario: TC_16 Regression test for get status endpoint
    And I send the GET request to "taskstatuses_getstatus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.status|object|
      |$.status["1"]|string|
      |$.status["2"]|string|
      |$.status["3"]|string|
      |$.status["4"]|string|
      |$.status["5"]|string|
      |$.status["6"]|string|
      |$.status["7"]|string|
      |$.status["8"]|string|
      |$.status["9"]|string|

  @Positive @Functional
  Scenario: TC_17 Validate get status response completeness
    And I send the GET request to "taskstatuses_getstatus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.status|object|
      |$.status["1"]|string|
      |$.status["2"]|string|
      |$.status["3"]|string|
      |$.status["4"]|string|
      |$.status["5"]|string|
      |$.status["6"]|string|
      |$.status["7"]|string|
      |$.status["8"]|string|
      |$.status["9"]|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And I store the response as "get_status_response" name using full path
    And validating the response contains the following values
      |Value|
      |Result|
      |status|
      |ASSIGNED|
      |COMPLETED|
      |REJECTED|
      |DELETED|
      |CLOSED|
      |INCOMPLETED|
      |INPROGRESS|
      |NOTDONE|
      |RESCHEDULE|

  @Positive @ObjectValidation
  Scenario: TC_18 Validate get status object structure
    And I send the GET request to "taskstatuses_getstatus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.status|object|
      |$.status["1"]|string|
      |$.status["2"]|string|
      |$.status["3"]|string|
      |$.status["4"]|string|
      |$.status["5"]|string|
      |$.status["6"]|string|
      |$.status["7"]|string|
      |$.status["8"]|string|
      |$.status["9"]|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @EndToEnd
  Scenario: TC_19 End-to-end get status data retrieval workflow
    And I send the GET request to "taskstatuses_getstatus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And I store the response as "get_status_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.status|object|
      |$.status["1"]|string|
      |$.status["2"]|string|
      |$.status["3"]|string|
      |$.status["4"]|string|
      |$.status["5"]|string|
      |$.status["6"]|string|
      |$.status["7"]|string|
      |$.status["8"]|string|
      |$.status["9"]|string|

