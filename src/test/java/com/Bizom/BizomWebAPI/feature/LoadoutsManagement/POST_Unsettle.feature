@BizomWebAPI @OS @LoadoutsManagement @LoadoutsUnsettle @SystemIntegration
Feature: Unsettle Loadout API Testing
  As a system user
  I want to test the unsettle endpoint
  So that I can ensure proper unsettlement functionality for loadouts

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
  Scenario: TC_01 Unsettle loadout without access token
    And I post the request with "POST_unsettle" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token||
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_02 Unsettle loadout with invalid access token
#    And I post the request with "POST_unsettle" payload with dynamic access token and query parameters
#      |Query|Value|
#      |access_token|invalid_token_12345|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_03 Unsettle loadout with expired access token
#    And I post the request with "POST_unsettle" payload with dynamic access token and query parameters
#      |Query|Value|
#      |access_token|expired_token_12345|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_04 Unsettle loadout with malformed access token
#    And I post the request with "POST_unsettle" payload with dynamic access token and query parameters
#      |Query|Value|
#      |access_token|malformed.token.here|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds

#  @Positive @Smoke
#  Scenario: TC_05 Unsettle loadout with valid request
#    And I post the request with "POST_unsettle" payload with dynamic access token and query parameters
#      |Query|Value|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Reason|"Loadout Not Settled"|
#    And I store the response as "unsettle_response" name using full path

#  @Positive @DataValidation
#  Scenario: TC_06 Validate unsettle loadout response Reason field
#    And I post the request with "POST_unsettle" payload with dynamic access token and query parameters
#      |Query|Value|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Reason|"Loadout Not Settled"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Reason|string|

#  @Positive @Performance
#  Scenario: TC_07 Performance test for unsettle loadout endpoint
#    And I post the request with "POST_unsettle" payload with dynamic access token and query parameters
#      |Query|Value|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Reason|"Loadout Not Settled"|

#  @Negative @Validation
#  Scenario: TC_08 Unsettle loadout with invalid userid
#    And I modify fields with random values and remove fields in "POST_unsettle" payload
#      |JPath|Value|
#      |$.userid|abc|
#    And I post the request with "POST_unsettle" payload with dynamic access token and query parameters
#      |Query|Value|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Reason|"Loadout Not Settled"|

#  @Negative @Validation
#  Scenario: TC_09 Unsettle loadout with invalid warehouseid
#    And I modify fields with random values and remove fields in "POST_unsettle" payload
#      |JPath|Value|
#      |$.warehouseid|abc|
#    And I post the request with "POST_unsettle" payload with dynamic access token and query parameters
#      |Query|Value|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Reason|"Wrong warehouse data passed."|

#  @Negative @Validation
#  Scenario: TC_10 Unsettle loadout with empty body
#    And I send empty body with "POST_unsettle" request
#    And I post the request with "POST_unsettle" payload with dynamic access token and query parameters
#      |Query|Value|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "500"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Validation
#  Scenario: TC_11 Unsettle loadout with non-existent userid
#    And I modify fields with random values and remove fields in "POST_unsettle" payload
#      |JPath|Value|
#      |$.userid|999999|
#    And I post the request with "POST_unsettle" payload with dynamic access token and query parameters
#      |Query|Value|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Reason|"Loadout Not Settled"|

#  @Negative @Validation
#  Scenario: TC_12 Unsettle loadout with non-existent warehouseid
#    And I modify fields with random values and remove fields in "POST_unsettle" payload
#      |JPath|Value|
#      |$.warehouseid|999999|
#    And I post the request with "POST_unsettle" payload with dynamic access token and query parameters
#      |Query|Value|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Reason|"Wrong warehouse data passed."|

#  @Negative @Validation
#  Scenario: TC_13 Unsettle loadout with zero userid
#    And I modify fields with random values and remove fields in "POST_unsettle" payload
#      |JPath|Value|
#      |$.userid|0|
#    And I post the request with "POST_unsettle" payload with dynamic access token and query parameters
#      |Query|Value|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Reason|"Loadout Not Settled"|

#  @Negative @Validation
#  Scenario: TC_14 Unsettle loadout with zero warehouseid
#    And I modify fields with random values and remove fields in "POST_unsettle" payload
#      |JPath|Value|
#      |$.warehouseid|0|
#    And I post the request with "POST_unsettle" payload with dynamic access token and query parameters
#      |Query|Value|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Reason|"Loadout Not Settled"|

#  @Negative @Validation
#  Scenario: TC_15 Unsettle loadout with negative userid
#    And I modify fields with random values and remove fields in "POST_unsettle" payload
#      |JPath|Value|
#      |$.userid|-1|
#    And I post the request with "POST_unsettle" payload with dynamic access token and query parameters
#      |Query|Value|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Reason|"Loadout Not Settled"|

#  @Negative @Validation
#  Scenario: TC_16 Unsettle loadout with negative warehouseid
#    And I modify fields with random values and remove fields in "POST_unsettle" payload
#      |JPath|Value|
#      |$.warehouseid|-1|
#    And I post the request with "POST_unsettle" payload with dynamic access token and query parameters
#      |Query|Value|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Reason|"Wrong warehouse data passed."|

#  @Negative @ErrorHandling
#  Scenario: TC_17 Unsettle loadout with invalid endpoint
#    And I post the request with "POST_unsettle_invalid" payload with dynamic access token and query parameters
#      |Query|Value|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "405"
#    And verify response time is less than "2500" milliseconds

  @Positive @DataValidation
  Scenario: TC_18 Validate unsettle loadout Reason field data type
    And I post the request with "POST_unsettle" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Reason|string|

#  @Positive @Concurrency
#  Scenario: TC_19 Concurrent access test for unsettle loadout endpoint
#    And I post the request with "POST_unsettle" payload with dynamic access token and query parameters
#      |Query|Value|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Reason|"Loadout Not Settled"|

#  @Positive @LoadTesting
#  Scenario: TC_20 Load testing for unsettle loadout endpoint
#    And I post the request with "POST_unsettle" payload with dynamic access token and query parameters
#      |Query|Value|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "3000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Reason|"Loadout Not Settled"|

#  @Negative @Timeout
#  Scenario: TC_21 Test unsettle loadout endpoint timeout handling
#    And I post the request with "POST_unsettle" payload with dynamic access token and query parameters
#      |Query|Value|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "5000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Reason|"Loadout Not Settled"|

#  @Positive @Regression
#  Scenario: TC_22 Regression test for unsettle loadout endpoint
#    And I post the request with "POST_unsettle" payload with dynamic access token and query parameters
#      |Query|Value|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Reason|"Loadout Not Settled"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Reason|string|

#  @Positive @EndToEnd
#  Scenario: TC_23 End-to-end unsettle loadout workflow
#    And I post the request with "POST_unsettle" payload with dynamic access token and query parameters
#      |Query|Value|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Reason|"Loadout Not Settled"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Reason|string|
#    And I store the response as "unsettle_response" name using full path

#  @Positive @Boundary
#  Scenario: TC_24 Unsettle loadout with very large userid
#    And I modify fields with random values and remove fields in "POST_unsettle" payload
#      |JPath|Value|
#      |$.userid|2147483647|
#    And I post the request with "POST_unsettle" payload with dynamic access token and query parameters
#      |Query|Value|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Reason|"Loadout Not Settled"|

#  @Positive @Boundary
#  Scenario: TC_25 Unsettle loadout with very large warehouseid
#    And I modify fields with random values and remove fields in "POST_unsettle" payload
#      |JPath|Value|
#      |$.warehouseid|2147483647|
#    And I post the request with "POST_unsettle" payload with dynamic access token and query parameters
#      |Query|Value|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Reason|"Wrong warehouse data passed."|

