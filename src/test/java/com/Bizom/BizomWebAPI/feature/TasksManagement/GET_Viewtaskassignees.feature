@BizomWebAPI @TasksManagement @TasksGetViewtaskassignees @OutletManagement @innovation
Feature: Tasks View Task Assignees API Testing
  As a system user
  I want to test the tasks view task assignees endpoint
  So that I can ensure proper functionality and HTML page rendering for viewing task assignees management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get tasks view task assignees without access token
    When I send the GET request to "tasks_viewtaskassignees" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get tasks view task assignees with invalid access token
    And I send the GET request to "tasks_viewtaskassignees" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title ""
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get tasks view task assignees with expired access token
    And I send the GET request to "tasks_viewtaskassignees" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title ""
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get tasks view task assignees with malformed access token
    And I send the GET request to "tasks_viewtaskassignees" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the HTML response should contain page title ""
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get tasks view task assignees with valid access token
    And I send the GET request to "tasks_viewtaskassignees" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Tasks"
    And I store the response as "tasks_viewtaskassignees_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate tasks view task assignees HTML response structure
    And I send the GET request to "tasks_viewtaskassignees" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @HTMLValidation
  Scenario: TC_07 Validate tasks view task assignees HTML page title
    And I send the GET request to "tasks_viewtaskassignees" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Tasks"

  @Positive @HTMLValidation
  Scenario: TC_08 Validate tasks view task assignees HTML structure
    And I send the GET request to "tasks_viewtaskassignees" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And validating the response contains the following values
      |Value|
      |html|
      |head|
      |title|
      |body|

  @Positive @Performance
  Scenario: TC_09 Performance test for tasks view task assignees endpoint
    And I send the GET request to "tasks_viewtaskassignees" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the HTML response should contain page title "Tasks"

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for tasks view task assignees endpoint
    And I send the GET request to "tasks_viewtaskassignees" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Tasks"

  @Negative @Validation
  Scenario: TC_11 Get tasks view task assignees with invalid query parameters
    And I send the GET request to "tasks_viewtaskassignees" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Tasks"

  @Negative @Validation
  Scenario: TC_12 Get tasks view task assignees with special characters in query parameters
    And I send the GET request to "tasks_viewtaskassignees" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Tasks"

  @Negative @Security
  Scenario: TC_13 Get tasks view task assignees with SQL injection attempt
    And I send the GET request to "tasks_viewtaskassignees" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE tasks; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Tasks"

  @Negative @Boundary
  Scenario: TC_14 Get tasks view task assignees with maximum query parameters
    And I send the GET request to "tasks_viewtaskassignees" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Tasks"

#  @Negative @ErrorHandling
#  Scenario: TC_15 Get tasks view task assignees with invalid endpoint
#    And I send the GET request to "tasks_viewtaskassignees_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_16 Validate tasks view task assignees business logic
    And I send the GET request to "tasks_viewtaskassignees" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Tasks"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @DataIntegrity
  Scenario: TC_17 Validate tasks view task assignees data integrity
    And I send the GET request to "tasks_viewtaskassignees" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Tasks"
    And validating the response contains the following values
      |Value|
      |Tasks|
      |html|
      |body|

  @Positive @Regression
  Scenario: TC_18 Regression test for tasks view task assignees endpoint
    And I send the GET request to "tasks_viewtaskassignees" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Tasks"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @Functional
  Scenario: TC_19 Validate tasks view task assignees response completeness
    And I send the GET request to "tasks_viewtaskassignees" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Tasks"
    And validating the response contains the following values
      |Value|
      |html|
      |head|
      |title|
      |body|
      |Tasks|
    And I store the response as "tasks_viewtaskassignees_response" name using full path

