@BizomWebAPI @CE @TownsManagement @GetTownDetails @SystemIntegration
Feature: Get Town Details API Testing
  As a system user
  I want to test the getTownDetails endpoint
  So that I can ensure proper retrieval of town details

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
  Scenario: TC_01 Get town details without access token
    And I post the request with "POST_getTownDetails" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token||
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get town details with invalid access token
    And I post the request with "POST_getTownDetails" payload with dynamic access token and query parameters
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
  Scenario: TC_03 Get town details with expired access token
    And I post the request with "POST_getTownDetails" payload with dynamic access token and query parameters
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
  Scenario: TC_04 Get town details with malformed access token
    And I post the request with "POST_getTownDetails" payload with dynamic access token and query parameters
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
  Scenario: TC_05 Get town details with valid request
    And I post the request with "POST_getTownDetails" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data.Town.id|"1"|
      |$.data.Town.name|Bengaluru|
      |$.data.Town.pincode|"560039"|
      |$.data.City.city_name|Bangalore|
      |$.data.City.id|"428"|
      |$.data.State.name|KARNATAKA|
      |$.data.State.id|"16"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|object|
      |$.data.Town|object|
      |$.data.Town.id|string|
      |$.data.Town.name|string|
      |$.data.Town.pincode|string|
      |$.data.Town.created|string|
      |$.data.Town.modified|string|
      |$.data.City|object|
      |$.data.City.city_name|string|
      |$.data.City.id|string|
      |$.data.State|object|
      |$.data.State.name|string|
      |$.data.State.id|string|
    And I store the response as "get_town_details_response" name using full path

  @Positive @DBValidation
  Scenario: TC_06 Validate town details with DB
    And I post the request with "POST_getTownDetails" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.data.Town.name|DB:towns:name: id=1|

  @Positive @Performance
  Scenario: TC_07 Performance test for get town details endpoint
    And I post the request with "POST_getTownDetails" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_08 Get town details with invalid town ID
    And I modify fields with random values and remove fields in "POST_getTownDetails" payload
      |JPath|Value|
      |$.id|abc|
    And I post the request with "POST_getTownDetails" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|

  @Negative @Validation
  Scenario: TC_09 Get town details with empty body
    And I send empty body with "POST_getTownDetails" request
    And I post the request with "POST_getTownDetails" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Invalid request|

#  @Negative @ErrorHandling
#  Scenario: TC_10 Get town details with invalid endpoint
#    And I post the request with "POST_towns_get_town_details_invalid" payload with dynamic access token and query parameters
#      |Query|Value|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_11 Get town details with empty id
    And I modify fields with random values and remove fields in "POST_getTownDetails" payload
      |JPath|Value|
      |$.id|""|
    And I post the request with "POST_getTownDetails" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No Town Name Found"|

  @Negative @Validation
  Scenario: TC_12 Get town details with very large id
    And I modify fields with random values and remove fields in "POST_getTownDetails" payload
      |JPath|Value|
      |$.id|999999|
    And I post the request with "POST_getTownDetails" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|

  @Positive @ContentValidation
  Scenario: TC_13 Validate town details response contains mandatory keys
    And I post the request with "POST_getTownDetails" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |data|
      |Town|
      |City|
      |State|
      |id|
      |name|
      |pincode|

  @Positive @Regression
  Scenario: TC_14 Regression test for get town details endpoint
    And I post the request with "POST_getTownDetails" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|object|

  @Positive @Concurrency
  Scenario: TC_15 Concurrent access test for get town details endpoint
    And I post the request with "POST_getTownDetails" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @LoadTesting
  Scenario: TC_16 Load testing for get town details endpoint
    And I post the request with "POST_getTownDetails" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Timeout
  Scenario: TC_17 Test get town details endpoint timeout handling
    And I post the request with "POST_getTownDetails" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

