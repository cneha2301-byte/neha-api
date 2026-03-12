@BizomWebAPI @CE @EndOfDayReportsManagement @GetEndOfDayReports @EndOfDay @IntegrationServices
Feature: End Of Day Reports API Testing
  As a Bizom web API consumer
  I want to validate the end of day reports endpoint
  So that I can ensure end of day emails are triggered reliably

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Trigger end of day without access token
    When I send the GET request to "endofdayreports_endofday" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title ""
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Trigger end of day with invalid access token
    And I send the GET request to "endofdayreports_endofday" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result | "false"    |
      |$.Reason | "Sorry! presently you are inactive user or enable activity flow"   |
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Trigger end of day with expired access token
    And I send the GET request to "endofdayreports_endofday" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result | "false"    |
      |$.Reason | "Sorry! presently you are inactive user or enable activity flow"   |
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Trigger end of day with malformed access token
    And I send the GET request to "endofdayreports_endofday" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result | "false"    |
      |$.Reason | "Sorry! presently you are inactive user or enable activity flow"   |
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Trigger end of day with valid access token
    And I send the GET request to "endofdayreports_endofday" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|"Mail sent"|
    And I store the response as "endOfDayReports_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate end of day response data structure
    And I send the GET request to "endofdayreports_endofday" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|String|
      |$.Reason|string|

  @Positive @Performance
  Scenario: TC_07 Performance test for end of day reports endpoint
    And I send the GET request to "endofdayreports_endofday" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: TC_08 Concurrent access test for end of day reports endpoint
    And I send the GET request to "endofdayreports_endofday" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_09 Trigger end of day with invalid query parameter
    And I send the GET request to "endofdayreports_endofday" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|"Mail sent"|

  @Negative @Validation
  Scenario: TC_10 Trigger end of day with special characters in query parameter
    And I send the GET request to "endofdayreports_endofday" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_11 Trigger end of day with SQL injection attempt
    And I send the GET request to "endofdayreports_endofday" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE endofdayreports; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: TC_12 Trigger end of day with maximum query parameters
    And I send the GET request to "endofdayreports_endofday" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_13 Trigger end of day with invalid endpoint
    And I send the GET request to "endofdayreports_endofday_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Regression
  Scenario: TC_14 Regression test for end of day reports endpoint
    And I send the GET request to "endofdayreports_endofday" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|"Mail sent"|

  @Positive @LoadTesting
  Scenario: TC_15 Load testing for end of day reports endpoint
    And I send the GET request to "endofdayreports_endofday" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Negative @Timeout
  Scenario: TC_16 Timeout handling for end of day reports endpoint
    And I send the GET request to "endofdayreports_endofday" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds

  @Positive @EndToEnd
  Scenario: TC_17 End-to-end end of day report workflow
    And I send the GET request to "endofdayreports_endofday" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|"Mail sent"|
    And I store the response as "endOfDayReports_response" name using full path

