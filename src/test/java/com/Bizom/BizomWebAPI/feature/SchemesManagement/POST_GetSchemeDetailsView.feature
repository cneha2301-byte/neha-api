@BizomWebAPI @PI @SchemesManagement @GetSchemeDetailsView @SystemIntegration
Feature: Get Scheme Details View API Testing
  As a system user
  I want to test the getSchemeDetailsView endpoint
  So that I can ensure proper retrieval of scheme details view in the system

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
  Scenario: TC_01 Get scheme details view without access token
    And I post the request with "POST_getSchemeDetailsView" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token||
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get scheme details view with invalid access token
    And I post the request with "POST_getSchemeDetailsView" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get scheme details view with expired access token
    And I post the request with "POST_getSchemeDetailsView" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"

    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get scheme details view with malformed access token
    And I post the request with "POST_getSchemeDetailsView" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get scheme details view with valid request
    And I post the request with "POST_getSchemeDetailsView" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "text/html; charset=UTF-8"
    And the HTML response should contain element "table"
    And the HTML response should contain element "thead"
    And the HTML response should contain element "tbody"
    And I store the response as "getschemedetailsview_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate scheme details view HTML table structure
    And I post the request with "POST_getSchemeDetailsView" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "text/html; charset=UTF-8"
    And the HTML response should contain element "table"
    And the HTML response should contain element "thead"
    And the HTML response should contain element "tbody"
    And the HTML response should contain element "tr"
    And the HTML response should contain element "th"

  @Positive @DataValidation
  Scenario: TC_07 Validate scheme details view table headers
    And I post the request with "POST_getSchemeDetailsView" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "text/html; charset=UTF-8"
    And the HTML response should contain element "table"
    And the HTML response should contain element "thead"
    And the HTML response should contain element "tbody"
    And validating the response contains the following values
      |Value|
      |Scheme Id|
      |Scheme Name|
      |Scheme Group Id|
      |Scheme Group Name|
      |SKU-wise Scheme Details|

  @Positive @DataValidation
  Scenario: TC_08 Validate scheme details view HTML page structure
    And I post the request with "POST_getSchemeDetailsView" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "text/html; charset=UTF-8"
    And the HTML response should contain element "html"
    And the HTML response should contain element "body"
    And the HTML response should contain element "table"

  @Positive @Performance
  Scenario: TC_09 Performance test for scheme details view endpoint
    And I post the request with "POST_getSchemeDetailsView" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And contentType as "text/html; charset=UTF-8"
    And the HTML response should contain element "table"
    And validating the response contains the following values
      |Value|
      |Scheme Id|
      |Scheme Name|
      |Scheme Group Id|
      |Scheme Group Name|
      |SKU-wise Scheme Details|

  @Negative @Validation
  Scenario: TC_10 Get scheme details view with invalid entityType
    And I modify fields with random values and remove fields in "POST_getSchemeDetailsView" payload
      |JPath|Value|
      |$.entityType|invalid|
    And I post the request with "POST_getSchemeDetailsView" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_11 Get scheme details view with invalid entityTypeId
    And I modify fields with random values and remove fields in "POST_getSchemeDetailsView" payload
      |JPath|Value|
      |$.entityTypeId|abc|
    And I post the request with "POST_getSchemeDetailsView" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_12 Get scheme details view with empty body
    And I send empty body with "POST_getSchemeDetailsView" request
    And I post the request with "POST_getSchemeDetailsView" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_13 Get scheme details view with missing entityType
    And I modify fields with random values and remove fields in "POST_getSchemeDetailsView" payload
      |JPath|Value|
      |$.entityType|""|
    And I post the request with "POST_getSchemeDetailsView" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_14 Get scheme details view with missing entityTypeId
    And I modify fields with random values and remove fields in "POST_getSchemeDetailsView" payload
      |JPath|Value|
      |$.entityTypeId|""|
    And I post the request with "POST_getSchemeDetailsView" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_15 Get scheme details view with non-existent entityTypeId
    And I modify fields with random values and remove fields in "POST_getSchemeDetailsView" payload
      |JPath|Value|
      |$.entityTypeId|999999|
    And I post the request with "POST_getSchemeDetailsView" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_16 Get scheme details view with invalid jsonResponse
    And I modify fields with random values and remove fields in "POST_getSchemeDetailsView" payload
      |JPath|Value|
      |$.jsonResponse|invalid|
    And I post the request with "POST_getSchemeDetailsView" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Negative @ErrorHandling
#  Scenario: TC_17 Get scheme details view with invalid endpoint
#    And I post the request with "POST_getSchemeDetailsView_invalid" payload with dynamic access token and query parameters
#      |Query|Value|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_18 Validate scheme details view with different entity types
    And I modify fields with random values and remove fields in "POST_getSchemeDetailsView" payload
      |JPath|Value|
      |$.entityType|outlets|
    And I post the request with "POST_getSchemeDetailsView" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "text/html; charset=UTF-8"
    And the HTML response should contain element "table"

  @Positive @Regression
  Scenario: TC_19 Regression test for scheme details view endpoint
    And I post the request with "POST_getSchemeDetailsView" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "text/html; charset=UTF-8"
    And the HTML response should contain element "table"
    And validating the response contains the following values
      |Value|
      |Scheme Id|
      |Scheme Name|
      |Scheme Group Id|
      |Scheme Group Name|
      |SKU-wise Scheme Details|

  @Positive @Concurrency
  Scenario: TC_20 Concurrent access test for scheme details view endpoint
    And I post the request with "POST_getSchemeDetailsView" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "text/html; charset=UTF-8"
    And the HTML response should contain element "table"

  @Positive @LoadTesting
  Scenario: TC_21 Load testing for scheme details view endpoint
    And I post the request with "POST_getSchemeDetailsView" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And contentType as "text/html; charset=UTF-8"
    And the HTML response should contain element "table"

  @Negative @Timeout
  Scenario: TC_22 Test scheme details view endpoint timeout handling
    And I post the request with "POST_getSchemeDetailsView" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And contentType as "text/html; charset=UTF-8"
    And the HTML response should contain element "table"

  @Positive @EndToEnd
  Scenario: TC_23 End-to-end scheme details view workflow
    And I post the request with "POST_getSchemeDetailsView" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "text/html; charset=UTF-8"
    And the HTML response should contain element "table"
    And the HTML response should contain element "thead"
    And the HTML response should contain element "tbody"
    And validating the response contains the following values
      |Value|
      |Scheme Id|
      |Scheme Name|
      |Scheme Group Id|
      |Scheme Group Name|
      |SKU-wise Scheme Details|

  @Positive @Boundary
  Scenario: TC_24 Get scheme details view with very large entityTypeId
    And I modify fields with random values and remove fields in "POST_getSchemeDetailsView" payload
      |JPath|Value|
      |$.entityTypeId|2147483647|
    And I post the request with "POST_getSchemeDetailsView" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Boundary
  Scenario: TC_25 Get scheme details view with jsonResponse set to 1
    And I modify fields with random values and remove fields in "POST_getSchemeDetailsView" payload
      |JPath|Value|
      |$.jsonResponse|1|
    And I post the request with "POST_getSchemeDetailsView" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

