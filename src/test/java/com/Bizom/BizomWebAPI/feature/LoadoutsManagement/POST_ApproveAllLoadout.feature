@BizomWebAPI @OS @LoadoutsManagement @ApproveAllLoadout @SystemIntegration
Feature: Approve All Loadout API Testing
  As a system user
  I want to test the approveallloadout endpoint
  So that I can ensure proper approval workflow for loadouts

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
  Scenario: TC_01 Approve all loadout without access token
    And I post the request with "POST_approveAllLoadout" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token||
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_02 Approve all loadout with invalid access token
#    And I post the request with "POST_approveAllLoadout" payload with dynamic access token and query parameters
#      |Query|Value|
#      |access_token|invalid_token_12345|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_03 Approve all loadout with expired access token
#    And I post the request with "POST_approveAllLoadout" payload with dynamic access token and query parameters
#      |Query|Value|
#      |access_token|expired_token_12345|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_04 Approve all loadout with malformed access token
#    And I post the request with "POST_approveAllLoadout" payload with dynamic access token and query parameters
#      |Query|Value|
#      |access_token|malformed.token.here|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Approve all loadout with valid request
    And I post the request with "POST_approveAllLoadout" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And I store the response as "approveallloadout_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate approve all loadout response structure
    And I post the request with "POST_approveAllLoadout" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @DataValidation
  Scenario: TC_07 Validate approve all loadout with DB data
    And I post the request with "POST_approveAllLoadout" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|true|

  @Positive @Performance
  Scenario: TC_08 Performance test for approve all loadout endpoint
    And I post the request with "POST_approveAllLoadout" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_09 Approve all loadout with invalid loadout ID
    And I modify fields with random values and remove fields in "POST_approveAllLoadout" payload
      |JPath|Value|
      |$.loadouts[0].id|abc|
    And I post the request with "POST_approveAllLoadout" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_10 Approve all loadout with empty body
    And I send empty body with "POST_approveAllLoadout" request
    And I post the request with "POST_approveAllLoadout" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_11 Approve all loadout with empty loadouts array
    And I modify fields with random values and remove fields in "POST_approveAllLoadout" payload
      |JPath|Value|
      |$.loadouts|[]|
    And I post the request with "POST_approveAllLoadout" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_12 Approve all loadout with non-existent loadout ID
    And I modify fields with random values and remove fields in "POST_approveAllLoadout" payload
      |JPath|Value|
      |$.loadouts[0].id|999999|
    And I post the request with "POST_approveAllLoadout" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_13 Approve all loadout with invalid warehouse ID
    And I modify fields with random values and remove fields in "POST_approveAllLoadout" payload
      |JPath|Value|
      |$.loadouts[0].warehouse_id|abc|
    And I post the request with "POST_approveAllLoadout" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_14 Approve all loadout with invalid skunit ID
    And I modify fields with random values and remove fields in "POST_approveAllLoadout" payload
      |JPath|Value|
      |$.loadouts[0].skunit_id|abc|
    And I post the request with "POST_approveAllLoadout" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_15 Approve all loadout with invalid fordate
    And I modify fields with random values and remove fields in "POST_approveAllLoadout" payload
      |JPath|Value|
      |$.fordate|invalid-date|
    And I post the request with "POST_approveAllLoadout" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_16 Approve all loadout with negative quantity
    And I modify fields with random values and remove fields in "POST_approveAllLoadout" payload
      |JPath|Value|
      |$.loadouts[0].quantity|-1|
    And I post the request with "POST_approveAllLoadout" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_17 Approve all loadout with zero quantity
    And I modify fields with random values and remove fields in "POST_approveAllLoadout" payload
      |JPath|Value|
      |$.loadouts[0].quantity|0|
    And I post the request with "POST_approveAllLoadout" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Negative @ErrorHandling
#  Scenario: TC_18 Approve all loadout with invalid endpoint
#    And I post the request with "POST_approveAllLoadout_invalid" payload with dynamic access token and query parameters
#      |Query|Value|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "405"
#    And verify response time is less than "2500" milliseconds

  @Positive @DataValidation
  Scenario: TC_19 Validate approve all loadout response contains mandatory keys
    And I post the request with "POST_approveAllLoadout" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|

  @Positive @BusinessLogic
  Scenario: TC_20 Validate approve all loadout already approved scenario
    And I post the request with "POST_approveAllLoadout" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response contains the following values
      |Value|
      |already approved|
      |Rejected|

  @Positive @Regression
  Scenario: TC_21 Regression test for approve all loadout endpoint
    And I post the request with "POST_approveAllLoadout" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @Concurrency
  Scenario: TC_22 Concurrent access test for approve all loadout endpoint
    And I post the request with "POST_approveAllLoadout" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @LoadTesting
  Scenario: TC_23 Load testing for approve all loadout endpoint
    And I post the request with "POST_approveAllLoadout" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Timeout
  Scenario: TC_24 Test approve all loadout endpoint timeout handling
    And I post the request with "POST_approveAllLoadout" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @EndToEnd
  Scenario: TC_25 End-to-end approve all loadout workflow
    And I post the request with "POST_approveAllLoadout" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
    And I store the response as "approveallloadout_response" name using full path

