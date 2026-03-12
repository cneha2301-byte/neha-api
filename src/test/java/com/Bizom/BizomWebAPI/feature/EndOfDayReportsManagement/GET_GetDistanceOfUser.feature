@BizomWebAPI @CE @EndOfDayReportsManagement @EndOfDayReports @GetDistanceOfUser @IntegrationServices
Feature: Get Distance Of User API Testing
  As a Bizom web API consumer
  I want to validate the get distance of user endpoint
  So that I can ensure user travel summaries are reported correctly

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get distance of user without access token
    When I send the GET request to "endofdayreports_get_distance_of_user" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |userId|1|
      |fromDate|01-10-2024|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get distance of user with invalid access token
    And I send the GET request to "endofdayreports_get_distance_of_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
      |userId|1|
      |fromDate|01-10-2024|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get distance of user with expired access token
    And I send the GET request to "endofdayreports_get_distance_of_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
      |userId|1|
      |fromDate|01-10-2024|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get distance of user with malformed access token
    And I send the GET request to "endofdayreports_get_distance_of_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
      |userId|1|
      |fromDate|01-10-2024|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get distance of user with valid access token
    And I send the GET request to "endofdayreports_get_distance_of_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |userId|1|
      |fromDate|01-10-2024|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|UserNot travelled|
      |$.data|[]|
    And I store the response as "getDistanceOfUser_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate get distance of user response structure
    And I send the GET request to "endofdayreports_get_distance_of_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |userId|1|
      |fromDate|01-10-2024|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|

  @Positive @Performance
  Scenario: TC_07 Performance test for get distance of user endpoint
    And I send the GET request to "endofdayreports_get_distance_of_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |userId|1|
      |fromDate|01-10-2024|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: TC_08 Concurrent access test for get distance of user endpoint
    And I send the GET request to "endofdayreports_get_distance_of_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |userId|1|
      |fromDate|01-10-2024|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_09 Get distance of user with invalid date format
    And I send the GET request to "endofdayreports_get_distance_of_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |userId|1|
      |fromDate|2024/10/01|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|UserNot travelled|
      |$.data|[]|

  @Negative @Validation
  Scenario: TC_10 Get distance of user with special characters in user id
    And I send the GET request to "endofdayreports_get_distance_of_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |userId|<script>alert('XSS')</script>|
      |fromDate|01-10-2024|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_11 Get distance of user with SQL injection attempt
    And I send the GET request to "endofdayreports_get_distance_of_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |userId|'; DROP TABLE users; --|
      |fromDate|01-10-2024|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: TC_12 Get distance of user with maximum query parameters
    And I send the GET request to "endofdayreports_get_distance_of_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |userId|1|
      |fromDate|01-10-2024|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_13 Get distance of user with invalid endpoint
    And I send the GET request to "endofdayreports_get_distance_of_user_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |userId|1|
      |fromDate|01-10-2024|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Regression
  Scenario: TC_14 Regression test for get distance of user endpoint
    And I send the GET request to "endofdayreports_get_distance_of_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |userId|1|
      |fromDate|01-10-2024|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|UserNot travelled|
      |$.data|[]|

  @Positive @LoadTesting
  Scenario: TC_15 Load testing for get distance of user endpoint
    And I send the GET request to "endofdayreports_get_distance_of_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |userId|1|
      |fromDate|01-10-2024|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Negative @Timeout
  Scenario: TC_16 Timeout handling for get distance of user endpoint
    And I send the GET request to "endofdayreports_get_distance_of_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |userId|1|
      |fromDate|01-10-2024|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds

  @Positive @EndToEnd
  Scenario: TC_17 End-to-end get distance of user workflow
    And I send the GET request to "endofdayreports_get_distance_of_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |userId|1|
      |fromDate|01-10-2024|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|UserNot travelled|
      |$.data|[]|
    And I store the response as "getDistanceOfUser_response" name using full path

