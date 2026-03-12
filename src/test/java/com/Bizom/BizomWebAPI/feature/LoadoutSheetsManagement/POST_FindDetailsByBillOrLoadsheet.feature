@BizomWebAPI @LoadoutSheetsManagement @FindDetailsByBillOrLoadsheet @SystemIntegration
Feature: Find Details By Bill Or Loadsheet API Testing
  As a system user
  I want to test the finddetailsbybillorloadsheet endpoint
  So that I can ensure proper retrieval of loadout sheet details by bill or loadsheet number

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
  Scenario: TC_01 Find details by bill or loadsheet without access token
    And I post the request with "POST_findDetailsByBillOrLoadsheet" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token||
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Find details by bill or loadsheet with invalid access token
    And I post the request with "POST_findDetailsByBillOrLoadsheet" payload with dynamic access token and query parameters
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
  Scenario: TC_03 Find details by bill or loadsheet with expired access token
    And I post the request with "POST_findDetailsByBillOrLoadsheet" payload with dynamic access token and query parameters
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
  Scenario: TC_04 Find details by bill or loadsheet with malformed access token
    And I post the request with "POST_findDetailsByBillOrLoadsheet" payload with dynamic access token and query parameters
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
  Scenario: TC_05 Find details by bill or loadsheet with valid request
    And I post the request with "POST_findDetailsByBillOrLoadsheet" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.message|"Data Found"|
    And I store the response as "finddetailsbybillorloadsheet_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate find details by bill or loadsheet response structure
    And I post the request with "POST_findDetailsByBillOrLoadsheet" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.message|"Data Found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.message|string|
      |$.data|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate find details by bill or loadsheet data array type
    And I post the request with "POST_findDetailsByBillOrLoadsheet" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

  @Positive @Performance
  Scenario: TC_08 Performance test for find details by bill or loadsheet endpoint
    And I post the request with "POST_findDetailsByBillOrLoadsheet" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.message|"Data Found"|

  @Negative @Validation
  Scenario: TC_09 Find details by bill or loadsheet with invalid is_loadsheetno
    And I modify fields with random values and remove fields in "POST_findDetailsByBillOrLoadsheet" payload
      |JPath|Value|
      |$.is_loadsheetno|abc|
    And I post the request with "POST_findDetailsByBillOrLoadsheet" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_10 Find details by bill or loadsheet with invalid billno
    And I modify fields with random values and remove fields in "POST_findDetailsByBillOrLoadsheet" payload
      |JPath|Value|
      |$.billno|invalid|
    And I post the request with "POST_findDetailsByBillOrLoadsheet" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_11 Find details by bill or loadsheet with empty billno
    And I modify fields with random values and remove fields in "POST_findDetailsByBillOrLoadsheet" payload
      |JPath|Value|
      |$.billno|""|
    And I post the request with "POST_findDetailsByBillOrLoadsheet" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_12 Find details by bill or loadsheet with invalid warehouseoutletid
    And I modify fields with random values and remove fields in "POST_findDetailsByBillOrLoadsheet" payload
      |JPath|Value|
      |$.warehouseoutletid|abc|
    And I post the request with "POST_findDetailsByBillOrLoadsheet" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_13 Find details by bill or loadsheet with invalid warehouseid
    And I modify fields with random values and remove fields in "POST_findDetailsByBillOrLoadsheet" payload
      |JPath|Value|
      |$.warehouseid|abc|
    And I post the request with "POST_findDetailsByBillOrLoadsheet" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_14 Find details by bill or loadsheet with empty body
    And I send empty body with "POST_findDetailsByBillOrLoadsheet" request
    And I post the request with "POST_findDetailsByBillOrLoadsheet" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_15 Find details by bill or loadsheet with non-existent billno
    And I modify fields with random values and remove fields in "POST_findDetailsByBillOrLoadsheet" payload
      |JPath|Value|
      |$.billno|NONEXISTENT999999|
    And I post the request with "POST_findDetailsByBillOrLoadsheet" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_16 Find details by bill or loadsheet with non-existent warehouseoutletid
    And I modify fields with random values and remove fields in "POST_findDetailsByBillOrLoadsheet" payload
      |JPath|Value|
      |$.warehouseoutletid|999999|
    And I post the request with "POST_findDetailsByBillOrLoadsheet" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_17 Find details by bill or loadsheet with zero warehouseoutletid
    And I modify fields with random values and remove fields in "POST_findDetailsByBillOrLoadsheet" payload
      |JPath|Value|
      |$.warehouseoutletid|0|
    And I post the request with "POST_findDetailsByBillOrLoadsheet" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_18 Find details by bill or loadsheet with negative warehouseoutletid
    And I modify fields with random values and remove fields in "POST_findDetailsByBillOrLoadsheet" payload
      |JPath|Value|
      |$.warehouseoutletid|-1|
    And I post the request with "POST_findDetailsByBillOrLoadsheet" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_19 Find details by bill or loadsheet with is_loadsheetno as 1
    And I modify fields with random values and remove fields in "POST_findDetailsByBillOrLoadsheet" payload
      |JPath|Value|
      |$.is_loadsheetno|1|
    And I post the request with "POST_findDetailsByBillOrLoadsheet" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Negative @ErrorHandling
#  Scenario: TC_20 Find details by bill or loadsheet with invalid endpoint
#    And I post the request with "POST_findDetailsByBillOrLoadsheet_invalid" payload with dynamic access token and query parameters
#      |Query|Value|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds

  @Positive @DataValidation
  Scenario: TC_21 Validate find details by bill or loadsheet response contains mandatory keys
    And I post the request with "POST_findDetailsByBillOrLoadsheet" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.message|"Data Found"|
    And validating the response contains the following values
      |Value|
      |result|
      |message|
      |data|

  @Positive @ArrayValidation
  Scenario: TC_22 Validate find details by bill or loadsheet data array structure
    And I post the request with "POST_findDetailsByBillOrLoadsheet" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

  @Positive @Concurrency
  Scenario: TC_23 Concurrent access test for find details by bill or loadsheet endpoint
    And I post the request with "POST_findDetailsByBillOrLoadsheet" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.message|"Data Found"|

  @Positive @LoadTesting
  Scenario: TC_24 Load testing for find details by bill or loadsheet endpoint
    And I post the request with "POST_findDetailsByBillOrLoadsheet" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.message|"Data Found"|

  @Negative @Timeout
  Scenario: TC_25 Test find details by bill or loadsheet endpoint timeout handling
    And I post the request with "POST_findDetailsByBillOrLoadsheet" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.message|"Data Found"|

  @Positive @Regression
  Scenario: TC_26 Regression test for find details by bill or loadsheet endpoint
    And I post the request with "POST_findDetailsByBillOrLoadsheet" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.message|"Data Found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.message|string|
      |$.data|array|

  @Positive @EndToEnd
  Scenario: TC_27 End-to-end find details by bill or loadsheet workflow
    And I post the request with "POST_findDetailsByBillOrLoadsheet" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.message|"Data Found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.message|string|
      |$.data|array|
    And validating the response contains the following values
      |Value|
      |result|
      |message|
      |data|
    And I store the response as "finddetailsbybillorloadsheet_response" name using full path

  @Positive @Boundary
  Scenario: TC_28 Find details by bill or loadsheet with very long billno
    And I modify fields with random values and remove fields in "POST_findDetailsByBillOrLoadsheet" payload
      |JPath|Value|
      |$.billno|G27030240149812345678901234567890|
    And I post the request with "POST_findDetailsByBillOrLoadsheet" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Boundary
  Scenario: TC_29 Find details by bill or loadsheet with very large warehouseoutletid
    And I modify fields with random values and remove fields in "POST_findDetailsByBillOrLoadsheet" payload
      |JPath|Value|
      |$.warehouseoutletid|2147483647|
    And I post the request with "POST_findDetailsByBillOrLoadsheet" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Boundary
  Scenario: TC_30 Find details by bill or loadsheet with different warehouse IDs
    And I modify fields with random values and remove fields in "POST_findDetailsByBillOrLoadsheet" payload
      |JPath|Value|
      |$.warehouseid|1|
    And I post the request with "POST_findDetailsByBillOrLoadsheet" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

