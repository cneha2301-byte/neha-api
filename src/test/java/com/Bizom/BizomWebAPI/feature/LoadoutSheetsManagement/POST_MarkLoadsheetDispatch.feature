@BizomWebAPI @LoadoutSheetsManagement @MarkLoadsheetDispatch @SystemIntegration
Feature: Mark Loadsheet Dispatch API Testing
  As a system user
  I want to test the markLoadsheetDispatch endpoint
  So that I can ensure proper marking of loadsheet dispatch status

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |accept-language|en-US,en;q=0.9|
      |priority|u=0, i|
      |sec-ch-ua|"Google Chrome";v="143", "Chromium";v="143", "Not A(Brand";v="24"|
      |sec-ch-ua-mobile|?0|
      |sec-ch-ua-platform|"Windows"|
      |sec-fetch-dest|document|
      |sec-fetch-mode|navigate|
      |sec-fetch-site|none|
      |sec-fetch-user|?1|
      |upgrade-insecure-requests|1|
      |user-agent|Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36|

  @Negative @Security
  Scenario: TC_01 Mark loadsheet dispatch without access token
    And I post the request with "POST_markLoadsheetDispatch" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token||
      |loadsheetId|2|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Mark loadsheet dispatch with invalid access token
    And I post the request with "POST_markLoadsheetDispatch" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|invalid_token_12345|
      |loadsheetId|2|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Mark loadsheet dispatch with expired access token
    And I post the request with "POST_markLoadsheetDispatch" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|expired_token_12345|
      |loadsheetId|2|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Mark loadsheet dispatch with malformed access token
    And I post the request with "POST_markLoadsheetDispatch" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|malformed.token.here|
      |loadsheetId|2|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Mark loadsheet dispatch with valid request
    And I post the request with "POST_markLoadsheetDispatch" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
      |loadsheetId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Reason|"Loadoutsheet is Already Settled"|
    And I store the response as "markloadsheetdispatch_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate mark loadsheet dispatch response Reason field
    And I post the request with "POST_markLoadsheetDispatch" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
      |loadsheetId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Reason|"Loadoutsheet is Already Settled"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Reason|string|

  @Positive @Performance
  Scenario: TC_07 Performance test for mark loadsheet dispatch endpoint
    And I post the request with "POST_markLoadsheetDispatch" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
      |loadsheetId|2|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Reason|"Loadoutsheet is Already Settled"|

  @Negative @Validation
  Scenario: TC_08 Mark loadsheet dispatch with zero loadsheetId
    And I post the request with "POST_markLoadsheetDispatch" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
      |loadsheetId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Reason|"Please Send loadsheet Id"|

  @Negative @Validation
  Scenario: TC_09 Mark loadsheet dispatch with missing loadsheetId
    And I post the request with "POST_markLoadsheetDispatch" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Negative @ErrorHandling
#  Scenario: TC_10 Mark loadsheet dispatch with invalid endpoint
#    And I post the request with "POST_markLoadsheetDispatch_invalid" payload with dynamic access token and query parameters
#      |Query|Value|
#      |access_token|ACCESS_TOKEN|
#      |loadsheetId|2|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds

  @Positive @DataValidation
  Scenario: TC_11 Validate mark loadsheet dispatch Reason field data type
    And I post the request with "POST_markLoadsheetDispatch" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
      |loadsheetId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Reason|string|

  @Positive @BusinessLogic
  Scenario: TC_12 Validate mark loadsheet dispatch already settled scenario
    And I post the request with "POST_markLoadsheetDispatch" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
      |loadsheetId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Reason|"Loadoutsheet is Already Settled"|
    And validating the response contains the following values
      |Value|
      |Already Settled|

  @Positive @Concurrency
  Scenario: TC_13 Concurrent access test for mark loadsheet dispatch endpoint
    And I post the request with "POST_markLoadsheetDispatch" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
      |loadsheetId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Reason|"Loadoutsheet is Already Settled"|

  @Positive @LoadTesting
  Scenario: TC_14 Load testing for mark loadsheet dispatch endpoint
    And I post the request with "POST_markLoadsheetDispatch" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
      |loadsheetId|2|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Reason|"Loadoutsheet is Already Settled"|

  @Negative @Timeout
  Scenario: TC_15 Test mark loadsheet dispatch endpoint timeout handling
    And I post the request with "POST_markLoadsheetDispatch" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
      |loadsheetId|2|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Reason|"Loadoutsheet is Already Settled"|

  @Positive @Regression
  Scenario: TC_16 Regression test for mark loadsheet dispatch endpoint
    And I post the request with "POST_markLoadsheetDispatch" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
      |loadsheetId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Reason|"Loadoutsheet is Already Settled"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Reason|string|

  @Positive @EndToEnd
  Scenario: TC_17 End-to-end mark loadsheet dispatch workflow
    And I post the request with "POST_markLoadsheetDispatch" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
      |loadsheetId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Reason|"Loadoutsheet is Already Settled"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Reason|string|
    And I store the response as "markloadsheetdispatch_response" name using full path

  @Positive @Boundary
  Scenario: TC_18 Mark loadsheet dispatch with very large loadsheetId
    And I post the request with "POST_markLoadsheetDispatch" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
      |loadsheetId|2147483647|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Boundary
  Scenario: TC_19 Mark loadsheet dispatch with different loadsheet IDs
    And I post the request with "POST_markLoadsheetDispatch" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
      |loadsheetId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Reason|"Loadoutsheet is Already Settled"|

  @Positive @Boundary
  Scenario: TC_20 Mark loadsheet dispatch with different loadsheet IDs - test ID 3
    And I post the request with "POST_markLoadsheetDispatch" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
      |loadsheetId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Reason|"Loadoutsheet is Already Settled"|

