@BizomWebAPI @ReportsManagement @GetAgeingReport @SystemIntegration
Feature: Get Ageing Report API Testing
  As a system user
  I want to test the getageingreport endpoint
  So that I can ensure proper functionality and data retrieval for ageing reports

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
  Scenario: TC_01 Get ageing report without access token
    And I post the request with "POST_getAgeingReport" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token||
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get ageing report with invalid access token
    And I post the request with "POST_getAgeingReport" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get ageing report with expired access token
    And I post the request with "POST_getAgeingReport" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get ageing report with malformed access token
    And I post the request with "POST_getAgeingReport" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401| 
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get ageing report with valid request
    And I post the request with "POST_getAgeingReport" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain element "table"
    And the HTML response should contain element "thead"
    And the HTML response should contain element "tbody"
    And I store the response as "ageing_report_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate ageing report HTML structure
    And I post the request with "POST_getAgeingReport" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain element "table"
    And the HTML response should contain element "thead"
    And the HTML response should contain element "tbody"
    And the HTML response should contain element "th" with content "Outlet Id"


  @Positive @Performance
  Scenario: TC_07 Performance test for ageing report endpoint
    And I post the request with "POST_getAgeingReport" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the HTML response should contain element "table"
    And the HTML response should contain element "thead"
    And the HTML response should contain element "tbody"

  @Negative @Validation
  Scenario: TC_08 Get ageing report with invalid zone
    And I modify fields with random values and remove fields in "POST_getAgeingReport" payload
      |JPath|Value|
      |$.zone|abc|
    And I post the request with "POST_getAgeingReport" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain element "table"

  @Negative @Validation
  Scenario: TC_09 Get ageing report with empty body
    And I send empty body with "POST_getAgeingReport" request
    And I post the request with "POST_getAgeingReport" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Negative @ErrorHandling
#  Scenario: TC_10 Get ageing report with invalid endpoint
#    And I post the request with "POST_getAgeingReport_invalid" payload with dynamic access token and query parameters
#      |Query|Value|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_11 Get ageing report with invalid warehouse
    And I modify fields with random values and remove fields in "POST_getAgeingReport" payload
      |JPath|Value|
      |$.warehouse|abc|
    And I post the request with "POST_getAgeingReport" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain element "table"

  @Negative @Validation
  Scenario: TC_12 Get ageing report with invalid area
    And I modify fields with random values and remove fields in "POST_getAgeingReport" payload
      |JPath|Value|
      |$.area|abc|
    And I post the request with "POST_getAgeingReport" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain element "table"

  @Negative @Validation
  Scenario: TC_13 Get ageing report with non-existent zone
    And I modify fields with random values and remove fields in "POST_getAgeingReport" payload
      |JPath|Value|
      |$.zone|999999|
    And I post the request with "POST_getAgeingReport" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain element "table"

  @Positive @Regression
  Scenario: TC_14 Regression test for ageing report endpoint
    And I post the request with "POST_getAgeingReport" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain element "table"
    And the HTML response should contain element "thead"
    And the HTML response should contain element "tbody"
    And the HTML response should contain element "th" with content "Outlet Id"
    And validating the response contains the following values
       |Value|
       |Outlet Name|
       |Current|

  @Positive @Concurrency
  Scenario: TC_15 Concurrent access test for ageing report endpoint
    And I post the request with "POST_getAgeingReport" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain element "table"
    And the HTML response should contain element "thead"
    And the HTML response should contain element "tbody"

  @Positive @LoadTesting
  Scenario: TC_16 Load testing for ageing report endpoint
    And I post the request with "POST_getAgeingReport" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the HTML response should contain element "table"
    And the HTML response should contain element "thead"
    And the HTML response should contain element "tbody"

  @Negative @Timeout
  Scenario: TC_17 Test ageing report endpoint timeout handling
    And I post the request with "POST_getAgeingReport" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the HTML response should contain element "table"
    And the HTML response should contain element "thead"
    And the HTML response should contain element "tbody"

  @Positive @EndToEnd
  Scenario: TC_18 End-to-end ageing report data retrieval workflow
    And I post the request with "POST_getAgeingReport" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      | Outlet Id |
      | Outlet Name |
      | Current |
      | 1-30 |
      | Total |
