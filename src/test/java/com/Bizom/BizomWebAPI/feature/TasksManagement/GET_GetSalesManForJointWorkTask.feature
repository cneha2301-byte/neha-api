@BizomWebAPI @TasksManagement @GetSalesManForJointWorkTask @OutletManagement @innovation
#This API have notice in responce so for a time being we are not testing this API
Feature: Get Sales Man For Joint Work Task API Testing
  As a system user
  I want to test the get sales man for joint work task endpoint
  So that I can ensure proper functionality and data retrieval for sales man for joint work task management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get sales man for joint work task without access token
    When I send the GET request to "tasks_getsalesmanforjointworktask" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |fordate|2024-10-07|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get sales man for joint work task with invalid access token
    And I send the GET request to "tasks_getsalesmanforjointworktask" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
      |fordate|2024-10-07|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get sales man for joint work task with expired access token
    And I send the GET request to "tasks_getsalesmanforjointworktask" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
      |fordate|2024-10-07|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get sales man for joint work task with malformed access token
    And I send the GET request to "tasks_getsalesmanforjointworktask" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
      |fordate|2024-10-07|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get sales man for joint work task with valid access token
    And I send the GET request to "tasks_getsalesmanforjointworktask" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2024-10-07|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
    And I store the response as "get_sales_man_for_joint_work_task_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate get sales man for joint work task response structure
    And I send the GET request to "tasks_getsalesmanforjointworktask" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2024-10-07|
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
      |$.data|object|

#  @Positive @DataValidation
#  Scenario: TC_07 Validate get sales man for joint work task data object structure
#    And I send the GET request to "tasks_getsalesmanforjointworktask" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |fordate|2024-10-07|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.data.selected_salesman|array|
#      |$.data.selected_users_by_other|null|
#      |$.data.statuses|null|
#      |$.data.parent_task|object|
#      |$.data.user_targets_achievements|array|

  @Positive @DataValidation
  Scenario: TC_08 Validate get sales man for joint work task nested arrays and objects
    And I send the GET request to "tasks_getsalesmanforjointworktask" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2024-10-07|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data.selected_salesman|array|
      |$.data.parent_task|object|
      |$.data.user_targets_achievements|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|

#  @Positive @DataValidation
#  Scenario: TC_09 Validate get sales man for joint work task null fields
#    And I send the GET request to "tasks_getsalesmanforjointworktask" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |fordate|2024-10-07|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.data.selected_users_by_other|null|
#      |$.data.statuses|null|

#  @Positive @DataValidation
#  Scenario: TC_10 Validate get sales man for joint work task complete structure
#    And I send the GET request to "tasks_getsalesmanforjointworktask" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |fordate|2024-10-07|
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
#      |$.data|object|
#      |$.data.selected_salesman|array|
#      |$.data.selected_users_by_other|null|
#      |$.data.statuses|null|
#      |$.data.parent_task|object|
#      |$.data.user_targets_achievements|array|

  @Positive @Performance
  Scenario: TC_11 Performance test for get sales man for joint work task endpoint
    And I send the GET request to "tasks_getsalesmanforjointworktask" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2024-10-07|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|object|

  @Positive @Concurrency
  Scenario: TC_12 Concurrent access test for get sales man for joint work task endpoint
    And I send the GET request to "tasks_getsalesmanforjointworktask" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2024-10-07|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|object|

  @Negative @Validation
  Scenario: TC_13 Get sales man for joint work task without fordate parameter
    And I send the GET request to "tasks_getsalesmanforjointworktask" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_14 Get sales man for joint work task with invalid fordate format
    And I send the GET request to "tasks_getsalesmanforjointworktask" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|invalid-date|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_15 Get sales man for joint work task with special characters in fordate
    And I send the GET request to "tasks_getsalesmanforjointworktask" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_16 Get sales man for joint work task with SQL injection attempt in fordate
    And I send the GET request to "tasks_getsalesmanforjointworktask" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|'; DROP TABLE tasks; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_17 Get sales man for joint work task with invalid endpoint
    And I send the GET request to "tasks_getsalesmanforjointworktask_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2024-10-07|
    Then I should see the response code as "404"
    And verify response time is less than "2500" milliseconds

#  @Positive @BusinessLogic
#  Scenario: TC_18 Validate get sales man for joint work task business logic
#    And I send the GET request to "tasks_getsalesmanforjointworktask" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |fordate|2024-10-07|
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
#      |$.data|object|
#      |$.data.selected_salesman|array|
#      |$.data.selected_users_by_other|null|
#      |$.data.statuses|null|
#      |$.data.parent_task|object|
#      |$.data.user_targets_achievements|array|

#  @Positive @DataIntegrity
#  Scenario: TC_19 Validate get sales man for joint work task data integrity
#    And I send the GET request to "tasks_getsalesmanforjointworktask" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |fordate|2024-10-07|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.reason|string|
#      |$.data|object|
#      |$.data.selected_salesman|array|
#      |$.data.selected_users_by_other|null|
#      |$.data.statuses|null|
#      |$.data.parent_task|object|
#      |$.data.user_targets_achievements|array|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|""|

#  @Positive @Regression
#  Scenario: TC_20 Regression test for get sales man for joint work task endpoint
#    And I send the GET request to "tasks_getsalesmanforjointworktask" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |fordate|2024-10-07|
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
#      |$.data|object|
#      |$.data.selected_salesman|array|
#      |$.data.selected_users_by_other|null|
#      |$.data.statuses|null|
#      |$.data.parent_task|object|
#      |$.data.user_targets_achievements|array|

#  @Positive @Functional
#  Scenario: TC_21 Validate get sales man for joint work task response completeness
#    And I send the GET request to "tasks_getsalesmanforjointworktask" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |fordate|2024-10-07|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.reason|string|
#      |$.data|object|
#      |$.data.selected_salesman|array|
#      |$.data.selected_users_by_other|null|
#      |$.data.statuses|null|
#      |$.data.parent_task|object|
#      |$.data.user_targets_achievements|array|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|""|
#    And I store the response as "get_sales_man_for_joint_work_task_response" name using full path
#    And validating the response contains the following values
#      |Value|
#      |result|
#      |reason|
#      |data|
#      |selected_salesman|
#      |selected_users_by_other|
#      |statuses|
#      |parent_task|
#      |user_targets_achievements|

  @Positive @ArrayValidation
  Scenario: TC_22 Validate get sales man for joint work task array fields
    And I send the GET request to "tasks_getsalesmanforjointworktask" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2024-10-07|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data.selected_salesman|array|
      |$.data.user_targets_achievements|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|

  @Positive @Boundary
  Scenario: TC_23 Get sales man for joint work task with different date values
    And I send the GET request to "tasks_getsalesmanforjointworktask" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2024-01-01|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|object|

#  @Positive @EndToEnd
#  Scenario: TC_24 End-to-end get sales man for joint work task data retrieval workflow
#    And I send the GET request to "tasks_getsalesmanforjointworktask" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |fordate|2024-10-07|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|""|
#    And I store the response as "get_sales_man_for_joint_work_task_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.reason|string|
#      |$.data|object|
#      |$.data.selected_salesman|array|
#      |$.data.selected_users_by_other|null|
#      |$.data.statuses|null|
#      |$.data.parent_task|object|
#      |$.data.user_targets_achievements|array|

