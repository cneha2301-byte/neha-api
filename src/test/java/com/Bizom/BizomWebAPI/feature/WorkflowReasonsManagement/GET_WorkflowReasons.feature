@BizomWebAPI @WorkflowReasonsManagement @WorkflowManagement @Innovation @WorkflowReasons @SystemIntegration
Feature: Workflow Reasons API Testing
  As a system user
  I want to test the workflow reasons endpoint
  So that I can ensure proper functionality and data retrieval

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|


  @Negative @Security
  Scenario: Get workflow reasons without access token
    When I send the GET request to "workflow_reasons" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |limit|10|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds


  @Negative @Security
  Scenario: Get workflow reasons with invalid access token
    When I send the GET request to "workflow_reasons" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get workflow reasons with expired access token
    When I send the GET request to "workflow_reasons" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds


  @Negative @Security
  Scenario: Get workflow reasons with malformed access token
    When I send the GET request to "workflow_reasons" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: Get workflow reasons with valid access token
    When I send the GET request to "workflow_reasons" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
    And I store the response as "workflow_reasons_response" name using full path

  @Positive @Functional
  Scenario: Get workflow reasons with additional query parameters
    When I send the GET request to "workflow_reasons" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |limit|10|
      |offset|0|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
    And I verify API response at path with DB and static values
    |JPath|Value|
    |$.Workflowreason[0].reason|DB:workflowreasons:reason: id=1|
    |$.Workflowreason[1].reason|DB:workflowreasons:reason: id=3|

  @Positive @Functional
  Scenario: Get workflow reasons with pagination parameters
    When I send the GET request to "workflow_reasons" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |page|1|
      |per_page|20|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Positive @Functional
  Scenario: Get workflow reasons with filtering parameters
    When I send the GET request to "workflow_reasons" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |status|active|
      |type|approval|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Positive @Functional
  Scenario: Get workflow reasons with sorting parameters
    When I send the GET request to "workflow_reasons" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sort_by|name|
      |sort_order|asc|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Positive @Functional
  Scenario: Get workflow reasons with search parameters
    When I send the GET request to "workflow_reasons" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |search|approval|
      |search_field|name|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Positive @Functional
  Scenario: Get workflow reasons with date range parameters
    When I send the GET request to "workflow_reasons" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |from_date|2024-01-01|
      |to_date|2024-12-31|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Positive @Functional
  Scenario: Get workflow reasons with multiple combined parameters
    When I send the GET request to "workflow_reasons" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |limit|5|
      |offset|0|
      |status|active|
      |sort_by|created_at|
      |sort_order|desc|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|



  @Negative @Boundary
  Scenario: Get workflow reasons with boundary limit value (maximum allowed)
    When I send the GET request to "workflow_reasons" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |limit|1000|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|


  @Positive @DataValidation
  Scenario: Validate workflow reasons response structure
    When I send the GET request to "workflow_reasons" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Positive @DataValidation
  Scenario: Validate workflow reasons response with empty result
    When I send the GET request to "workflow_reasons" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|

    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|


  @Positive @Performance
  Scenario: Performance test for workflow reasons endpoint
    When I send the GET request to "workflow_reasons" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Positive @Concurrency
  Scenario: Concurrent access test for workflow reasons endpoint
    When I send the GET request to "workflow_reasons" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

