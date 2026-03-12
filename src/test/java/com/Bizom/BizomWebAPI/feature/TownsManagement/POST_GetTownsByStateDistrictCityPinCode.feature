@BizomWebAPI @CE @TownsManagement @GetTownsByStateDistrictCityPinCode @SystemIntegration
Feature: Get Towns By State District City PinCode API Testing
  As a system user
  I want to test the getTownsByStateDistrictCityPinCode endpoint
  So that I can ensure proper retrieval of towns filtered by city

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
  Scenario: TC_01 Get towns by state/district/city/pincode without access token
    And I post the request with "POST_getTownsByStateDistrictCityPinCode" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token||
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get towns by state/district/city/pincode with invalid access token
    And I post the request with "POST_getTownsByStateDistrictCityPinCode" payload with dynamic access token and query parameters
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
  Scenario: TC_03 Get towns by state/district/city/pincode with expired access token
    And I post the request with "POST_getTownsByStateDistrictCityPinCode" payload with dynamic access token and query parameters
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
  Scenario: TC_04 Get towns by state/district/city/pincode with malformed access token
    And I post the request with "POST_getTownsByStateDistrictCityPinCode" payload with dynamic access token and query parameters
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
  Scenario: TC_05 Get towns by state/district/city/pincode with valid request
    And I post the request with "POST_getTownsByStateDistrictCityPinCode" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data.1|Bengaluru|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|object|
      |$.data.1|string|
    And I store the response as "get_towns_by_state_district_city_pincode_response" name using full path

  @Positive @Performance
  Scenario: TC_06 Performance test for get towns by state/district/city/pincode endpoint
    And I post the request with "POST_getTownsByStateDistrictCityPinCode" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: TC_07 Get towns by state/district/city/pincode with empty city ID
    And I modify fields with random values and remove fields in "POST_getTownsByStateDistrictCityPinCode" payload
      |JPath|Value|
      |$.cityId|""|
    And I post the request with "POST_getTownsByStateDistrictCityPinCode" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No Town Name Found|
      |$.data|{}|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|object|

  @Negative @Validation
  Scenario: TC_08 Get towns by state/district/city/pincode with empty body
    And I send empty body with "POST_getTownsByStateDistrictCityPinCode" request
    And I post the request with "POST_getTownsByStateDistrictCityPinCode" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Invalid request|
      |$.data|{}|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|object|

#  @Negative @ErrorHandling
#  Scenario: TC_09 Get towns by state/district/city/pincode with invalid endpoint
#    And I post the request with "POST_getTownsByStateDistrictCityPinCode_invalid" payload with dynamic access token and query parameters
#      |Query|Value|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds

  @Positive @DBValidation
  Scenario: TC_10 Validate get towns by state/district/city/pincode response with DB
    And I post the request with "POST_getTownsByStateDistrictCityPinCode" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.data.1|DB:towns:name: id=1|

  @Positive @ContentValidation
  Scenario: TC_11 Validate get towns by state/district/city/pincode response contains mandatory keys
    And I post the request with "POST_getTownsByStateDistrictCityPinCode" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |data|
      |1|

  @Positive @Regression
  Scenario: TC_12 Regression test for get towns by state/district/city/pincode endpoint
    And I post the request with "POST_getTownsByStateDistrictCityPinCode" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data.1|Bengaluru|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|object|
      |$.data.1|string|

  @Positive @Concurrency
  Scenario: TC_13 Concurrent access test for get towns by state/district/city/pincode endpoint
    And I post the request with "POST_getTownsByStateDistrictCityPinCode" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @LoadTesting
  Scenario: TC_14 Load testing for get towns by state/district/city/pincode endpoint
    And I post the request with "POST_getTownsByStateDistrictCityPinCode" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Timeout
  Scenario: TC_15 Test get towns by state/district/city/pincode endpoint timeout handling
    And I post the request with "POST_getTownsByStateDistrictCityPinCode" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|


