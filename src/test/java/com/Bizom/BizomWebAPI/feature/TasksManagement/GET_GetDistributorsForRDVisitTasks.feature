@BizomWebAPI @TasksManagement @GetDistributorsForRDVisitTasks @OutletManagement @innovation
#This API have notice in responce so for a time being we are not testing this API
Feature: Get Distributors For RD Visit Tasks API Testing
  As a system user
  I want to test the get distributors for RD visit tasks endpoint
  So that I can ensure proper functionality and data retrieval for distributors for RD visit tasks management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get distributors for RD visit tasks without access token
    When I send the GET request to "tasks_getdistributorsforrdvisittasks" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get distributors for RD visit tasks with invalid access token
    And I send the GET request to "tasks_getdistributorsforrdvisittasks" endpoint with dynamic access token and query parameters
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
  Scenario: TC_03 Get distributors for RD visit tasks with expired access token
    And I send the GET request to "tasks_getdistributorsforrdvisittasks" endpoint with dynamic access token and query parameters
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
  Scenario: TC_04 Get distributors for RD visit tasks with malformed access token
    And I send the GET request to "tasks_getdistributorsforrdvisittasks" endpoint with dynamic access token and query parameters
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

#  @Positive @Smoke
#  Scenario: TC_05 Get distributors for RD visit tasks with valid access token
#    And I send the GET request to "tasks_getdistributorsforrdvisittasks" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |fordate|2025-11-20|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|""|
#    And I store the response as "get_distributors_for_rd_visit_tasks_response" name using full path

#  @Positive @DataValidation
#  Scenario: TC_06 Validate get distributors for RD visit tasks response structure
#    And I send the GET request to "tasks_getdistributorsforrdvisittasks" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |fordate|2025-11-20|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|""|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.reason|string|
#      |$.distributors|null|
#      |$.taskassigneeformActivityId|null|
#      |$.status_id|null|
#      |$.transactionId|null|

  @Positive @DataValidation
  Scenario: TC_07 Validate get distributors for RD visit tasks null fields
    And I send the GET request to "tasks_getdistributorsforrdvisittasks" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.distributors|null|
      |$.taskassigneeformActivityId|null|
      |$.status_id|null|
      |$.transactionId|null|

#  @Positive @DataValidation
#  Scenario: TC_08 Validate get distributors for RD visit tasks complete structure
#    And I send the GET request to "tasks_getdistributorsforrdvisittasks" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |fordate|2025-11-20|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|""|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.reason|string|
#      |$.distributors|null|
#      |$.taskassigneeformActivityId|null|
#      |$.status_id|null|
#      |$.transactionId|null|

  @Positive @Performance
  Scenario: TC_09 Performance test for get distributors for RD visit tasks endpoint
    And I send the GET request to "tasks_getdistributorsforrdvisittasks" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for get distributors for RD visit tasks endpoint
    And I send the GET request to "tasks_getdistributorsforrdvisittasks" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|

  @Negative @Validation
  Scenario: TC_11 Get distributors for RD visit tasks without fordate parameter
    And I send the GET request to "tasks_getdistributorsforrdvisittasks" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_12 Get distributors for RD visit tasks with invalid fordate format
    And I send the GET request to "tasks_getdistributorsforrdvisittasks" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|invalid-date|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_13 Get distributors for RD visit tasks with special characters in fordate
    And I send the GET request to "tasks_getdistributorsforrdvisittasks" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_14 Get distributors for RD visit tasks with SQL injection attempt in fordate
    And I send the GET request to "tasks_getdistributorsforrdvisittasks" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|'; DROP TABLE tasks; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_15 Get distributors for RD visit tasks with invalid endpoint
    And I send the GET request to "tasks_getdistributorsforrdvisittasks_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2025-11-20|
    Then I should see the response code as "404"
    And verify response time is less than "2500" milliseconds

#  @Positive @BusinessLogic
#  Scenario: TC_16 Validate get distributors for RD visit tasks business logic
#    And I send the GET request to "tasks_getdistributorsforrdvisittasks" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |fordate|2025-11-20|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|""|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.reason|string|
#      |$.distributors|null|
#      |$.taskassigneeformActivityId|null|
#      |$.status_id|null|
#      |$.transactionId|null|

#  @Positive @DataIntegrity
#  Scenario: TC_17 Validate get distributors for RD visit tasks data integrity
#    And I send the GET request to "tasks_getdistributorsforrdvisittasks" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |fordate|2025-11-20|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.reason|string|
#      |$.distributors|null|
#      |$.taskassigneeformActivityId|null|
#      |$.status_id|null|
#      |$.transactionId|null|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|""|

#  @Positive @Regression
#  Scenario: TC_18 Regression test for get distributors for RD visit tasks endpoint
#    And I send the GET request to "tasks_getdistributorsforrdvisittasks" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |fordate|2025-11-20|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|""|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.reason|string|
#      |$.distributors|null|
#      |$.taskassigneeformActivityId|null|
#      |$.status_id|null|
#      |$.transactionId|null|

#  @Positive @Functional
#  Scenario: TC_19 Validate get distributors for RD visit tasks response completeness
#    And I send the GET request to "tasks_getdistributorsforrdvisittasks" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |fordate|2025-11-20|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.reason|string|
#      |$.distributors|null|
#      |$.taskassigneeformActivityId|null|
#      |$.status_id|null|
#      |$.transactionId|null|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|""|
#    And I store the response as "get_distributors_for_rd_visit_tasks_response" name using full path
#    And validating the response contains the following values
#      |Value|
#      |result|
#      |reason|
#      |distributors|
#      |taskassigneeformActivityId|
#      |status_id|
#      |transactionId|

  @Positive @Boundary
  Scenario: TC_20 Get distributors for RD visit tasks with different date values
    And I send the GET request to "tasks_getdistributorsforrdvisittasks" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2025-01-01|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|

#  @Positive @EndToEnd
#  Scenario: TC_21 End-to-end get distributors for RD visit tasks data retrieval workflow
#    And I send the GET request to "tasks_getdistributorsforrdvisittasks" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |fordate|2025-11-20|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|""|
#    And I store the response as "get_distributors_for_rd_visit_tasks_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.reason|string|
#      |$.distributors|null|
#      |$.taskassigneeformActivityId|null|
#      |$.status_id|null|
#      |$.transactionId|null|

