@DepoMarginsManagement @OS @SaveMultipleDepomargins
#need to add  correct data on json payload as this data are not reflecting on database
Feature: Save Multiple Depo Margins API Testing
  As a system user
  I want to test the saveMultipleDepomargins endpoint
  So that I can ensure proper saving of multiple depo margin configurations

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
  Scenario: TC_01 Save multiple depo margins without access token
    And I post the request with "POST_saveMultipleDepomargins" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token||
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Save multiple depo margins with invalid access token
    And I post the request with "POST_saveMultipleDepomargins" payload with dynamic access token and query parameters
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
  Scenario: TC_03 Save multiple depo margins with expired access token
    And I post the request with "POST_saveMultipleDepomargins" payload with dynamic access token and query parameters
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
  Scenario: TC_04 Save multiple depo margins with malformed access token
    And I post the request with "POST_saveMultipleDepomargins" payload with dynamic access token and query parameters
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
  Scenario: TC_05 Save multiple depo margins with valid request
    And I post the request with "POST_saveMultipleDepomargins" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
    And I store the response as "savemultipledepomargins_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate save multiple depo margins response structure
    And I post the request with "POST_saveMultipleDepomargins" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|

  @Positive @Performance
  Scenario: TC_07 Performance test for save multiple depo margins endpoint
    And I post the request with "POST_saveMultipleDepomargins" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @Validation
  Scenario: TC_08 Save multiple depo margins with invalid fromentitytype_erpid
    And I modify fields with random values and remove fields in "POST_saveMultipleDepomargins" payload
      |JPath|Value|
      |$.Depomargins.Depomargin[0].fromentitytype_erpid|abc|
    And I post the request with "POST_saveMultipleDepomargins" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_09 Save multiple depo margins with empty fromentitytype_erpid
    And I modify fields with random values and remove fields in "POST_saveMultipleDepomargins" payload
      |JPath|Value|
      |$.Depomargins.Depomargin[0].fromentitytype_erpid||
    And I post the request with "POST_saveMultipleDepomargins" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_10 Save multiple depo margins with invalid fromentitytype
    And I modify fields with random values and remove fields in "POST_saveMultipleDepomargins" payload
      |JPath|Value|
      |$.Depomargins.Depomargin[0].fromentitytype|invalid|
    And I post the request with "POST_saveMultipleDepomargins" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_11 Save multiple depo margins with invalid marginpercent
    And I modify fields with random values and remove fields in "POST_saveMultipleDepomargins" payload
      |JPath|Value|
      |$.Depomargins.Depomargin[0].marginpercent|abc|
    And I post the request with "POST_saveMultipleDepomargins" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_12 Save multiple depo margins with negative marginpercent
    And I modify fields with random values and remove fields in "POST_saveMultipleDepomargins" payload
      |JPath|Value|
      |$.Depomargins.Depomargin[0].marginpercent|-10.00|
    And I post the request with "POST_saveMultipleDepomargins" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_13 Save multiple depo margins with marginpercent over 100
    And I modify fields with random values and remove fields in "POST_saveMultipleDepomargins" payload
      |JPath|Value|
      |$.Depomargins.Depomargin[0].marginpercent|150.00|
    And I post the request with "POST_saveMultipleDepomargins" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_14 Save multiple depo margins with empty body
    And I send empty body with "POST_saveMultipleDepomargins" request
    And I post the request with "POST_saveMultipleDepomargins" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_15 Save multiple depo margins with empty Depomargin array
    And I modify fields with random values and remove fields in "POST_saveMultipleDepomargins" payload
      |JPath|Value|
      |$.Depomargins.Depomargin|[]|
    And I post the request with "POST_saveMultipleDepomargins" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_16 Save multiple depo margins with invalid toentitytype
    And I modify fields with random values and remove fields in "POST_saveMultipleDepomargins" payload
      |JPath|Value|
      |$.Depomargins.Depomargin[0].toentitytype|invalid|
    And I post the request with "POST_saveMultipleDepomargins" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_17 Save multiple depo margins with invalid endpoint
    And I post the request with "POST_saveMultipleDepomargins_invalid" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Positive @DataValidation
  Scenario: TC_18 Validate save multiple depo margins response contains mandatory keys
    And I post the request with "POST_saveMultipleDepomargins" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
    And validating the response contains the following values
      |Value|
      |result|
      |reason|

  @Positive @ArrayValidation
  Scenario: TC_19 Save multiple depo margins with multiple entries
    And I post the request with "POST_saveMultipleDepomargins" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Positive @Regression
  Scenario: TC_20 Regression test for save multiple depo margins endpoint
    And I post the request with "POST_saveMultipleDepomargins" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Positive @Concurrency
  Scenario: TC_21 Concurrent access test for save multiple depo margins endpoint
    And I post the request with "POST_saveMultipleDepomargins" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Positive @LoadTesting
  Scenario: TC_22 Load testing for save multiple depo margins endpoint
    And I post the request with "POST_saveMultipleDepomargins" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @Timeout
  Scenario: TC_23 Test save multiple depo margins endpoint timeout handling
    And I post the request with "POST_saveMultipleDepomargins" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Positive @EndToEnd
  Scenario: TC_24 End-to-end save multiple depo margins workflow
    And I post the request with "POST_saveMultipleDepomargins" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
    And I store the response as "savemultipledepomargins_response" name using full path

  @Negative @Validation
  Scenario: TC_25 Save multiple depo margins with zero marginpercent
    And I modify fields with random values and remove fields in "POST_saveMultipleDepomargins" payload
      |JPath|Value|
      |$.Depomargins.Depomargin[0].marginpercent|0.00|
    And I post the request with "POST_saveMultipleDepomargins" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds


