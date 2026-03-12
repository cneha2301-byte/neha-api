@BizomWebAPI @NotVisitedReasonsManagement @GetReasons @WorkflowAutomation @Innovation
Feature: Get Not Visited Reasons API Testing
  As a system user
  I want to test the get not visited reasons endpoint
  So that I can ensure proper functionality and data retrieval for not visited reasons management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get not visited reasons without access token
    When I send the GET request to "notvisitedreasons_getreasons" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get not visited reasons with invalid access token
    And I send the GET request to "notvisitedreasons_getreasons" endpoint with dynamic access token and query parameters
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
  Scenario: Get not visited reasons with expired access token
    And I send the GET request to "notvisitedreasons_getreasons" endpoint with dynamic access token and query parameters
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
  Scenario: Get not visited reasons with malformed access token
    And I send the GET request to "notvisitedreasons_getreasons" endpoint with dynamic access token and query parameters
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
  Scenario: Get not visited reasons with valid access token
    And I send the GET request to "notvisitedreasons_getreasons" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
      |$.Notvisitedreason|null|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Notvisitedreason|null|

  @Positive @DataValidation
  Scenario: Validate not visited reasons response structure
    And I send the GET request to "notvisitedreasons_getreasons" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Notvisitedreason|null|

  @Positive @Functional
  Scenario: Validate not visited reasons response with different scenarios
    And I send the GET request to "notvisitedreasons_getreasons" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Notvisitedreason|null|

  @Negative @Validation
  Scenario: Get not visited reasons with invalid query parameters
    And I send the GET request to "notvisitedreasons_getreasons" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Negative @Validation
  Scenario: Get not visited reasons with special characters in query parameters
    And I send the GET request to "notvisitedreasons_getreasons" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Negative @Security
  Scenario: Get not visited reasons with SQL injection attempt
    And I send the GET request to "notvisitedreasons_getreasons" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE notvisitedreasons; --|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Negative @Boundary
  Scenario: Get not visited reasons with maximum query parameters
    And I send the GET request to "notvisitedreasons_getreasons" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Negative @ErrorHandling
  Scenario: Get not visited reasons with invalid endpoint
    And I send the GET request to "notvisitedreasons_getreasons_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "404"
    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance test for not visited reasons endpoint
    And I send the GET request to "notvisitedreasons_getreasons" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @Positive @Regression
  Scenario: Regression test for not visited reasons endpoint
    And I send the GET request to "notvisitedreasons_getreasons" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
      |$.Notvisitedreason|null|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Notvisitedreason|null|

  @Positive @Smoke
  Scenario: Get not visited reasons with valid access token - DB validation
    And I send the GET request to "notvisitedreasons_getreasons" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
      |$.Notvisitedreason|null|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Notvisitedreason|null|


