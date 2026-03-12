@BizomWebAPI @TourBudgetsManagement @GetTourBudget @SystemIntegration @innovation
Feature: Get Tour Budget API Testing
  As a system user
  I want to test the getTourBudget endpoint
  So that I can ensure proper functionality and data retrieval for tour budgets

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
  Scenario: TC_01 Get tour budget without access token
    When I send the GET request to "GET_getTourBudget" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |startDate|2022-01-12|
      |endDate|2025-03-01|
      |userId|13|
      |language|en|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get tour budget with invalid access token
    And I send the GET request to "GET_getTourBudget" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
      |startDate|2022-01-12|
      |endDate|2025-03-01|
      |userId|13|
      |language|en|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get tour budget with expired access token
    And I send the GET request to "GET_getTourBudget" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
      |startDate|2022-01-12|
      |endDate|2025-03-01|
      |userId|13|
      |language|en|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get tour budget with malformed access token
    And I send the GET request to "GET_getTourBudget" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
      |startDate|2022-01-12|
      |endDate|2025-03-01|
      |userId|13|
      |language|en|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_05 Get tour budget with empty access token
    And I send the GET request to "GET_getTourBudget" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token||
      |startDate|2022-01-12|
      |endDate|2025-03-01|
      |userId|13|
      |language|en|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_06 Get tour budget with valid request
    And I send the GET request to "GET_getTourBudget" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startDate|2022-01-12|
      |endDate|2025-03-01|
      |userId|13|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And I store the response as "tourbudget_response" name using full path

  @Positive @DataValidation
  Scenario: TC_07 Validate tour budget response structure
    And I send the GET request to "GET_getTourBudget" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startDate|2022-01-12|
      |endDate|2025-03-01|
      |userId|13|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.tourTypes|array|
      |$.tourBudget|array|

  @Positive @DataValidation
  Scenario: TC_08 Validate tour types array structure
    And I send the GET request to "GET_getTourBudget" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startDate|2022-01-12|
      |endDate|2025-03-01|
      |userId|13|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.tourTypes|array|
      |$.tourTypes[0].id|string|
      |$.tourTypes[0].name|string|
      |$.tourTypes[0].parententity|string|
      |$.tourTypes[0].active|string|

  @Positive @DataValidation
  Scenario: TC_09 Validate tour budget array structure
    And I send the GET request to "GET_getTourBudget" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startDate|2022-01-12|
      |endDate|2025-03-01|
      |userId|13|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.tourBudget|array|
      |$.tourBudget[0].id|string|
      |$.tourBudget[0].user_id|string|
      |$.tourBudget[0].fromdate|string|
      |$.tourBudget[0].todate|string|
      |$.tourBudget[0].state|string|
      |$.tourBudget[0].value|string|

  @Positive @DataValidation
  Scenario: TC_10 Validate nested tourBudgetData array
    And I send the GET request to "GET_getTourBudget" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startDate|2022-01-12|
      |endDate|2025-03-01|
      |userId|13|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.tourBudget[0].tourBudgetData|array|
      |$.tourBudget[0].tourBudgetData[0].id|string|
      |$.tourBudget[0].tourBudgetData[0].tourtype_id|string|
      |$.tourBudget[0].tourBudgetData[0].entity_id|string|
      |$.tourBudget[0].tourBudgetData[0].value|string|

  @Positive @Performance
  Scenario: TC_11 Performance test for tour budget endpoint
    And I send the GET request to "GET_getTourBudget" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startDate|2022-01-12|
      |endDate|2025-03-01|
      |userId|13|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_12 Get tour budget with invalid startDate format
    And I send the GET request to "GET_getTourBudget" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startDate|invalid-date|
      |endDate|2025-03-01|
      |userId|13|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_13 Get tour budget with invalid endDate format
    And I send the GET request to "GET_getTourBudget" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startDate|2022-01-12|
      |endDate|invalid-date|
      |userId|13|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_14 Get tour budget with endDate before startDate
    And I send the GET request to "GET_getTourBudget" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startDate|2025-03-01|
      |endDate|2022-01-12|
      |userId|13|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_15 Get tour budget with invalid userId
    And I send the GET request to "GET_getTourBudget" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startDate|2022-01-12|
      |endDate|2025-03-01|
      |userId|abc|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_16 Get tour budget with non-existent userId
    And I send the GET request to "GET_getTourBudget" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startDate|2022-01-12|
      |endDate|2025-03-01|
      |userId|999999|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_17 Get tour budget with empty userId
    And I send the GET request to "GET_getTourBudget" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startDate|2022-01-12|
      |endDate|2025-03-01|
      |userId||
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_18 Get tour budget with empty language
    And I send the GET request to "GET_getTourBudget" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startDate|2022-01-12|
      |endDate|2025-03-01|
      |userId|13|
      |language||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_19 Get tour budget with invalid language
    And I send the GET request to "GET_getTourBudget" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startDate|2022-01-12|
      |endDate|2025-03-01|
      |userId|13|
      |language|xyz|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_20 Get tour budget without startDate parameter
    And I send the GET request to "GET_getTourBudget" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |endDate|2025-03-01|
      |userId|13|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_21 Get tour budget without endDate parameter
    And I send the GET request to "GET_getTourBudget" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startDate|2022-01-12|
      |userId|13|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_22 Get tour budget without userId parameter
    And I send the GET request to "GET_getTourBudget" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startDate|2022-01-12|
      |endDate|2025-03-01|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Negative @ErrorHandling
#  Scenario: TC_23 Get tour budget with invalid endpoint
#    And I send the GET request to "GET_getTourBudget_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |startDate|2022-01-12|
#      |endDate|2025-03-01|
#      |userId|13|
#      |language|en|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @DataValidation
  Scenario: TC_24 Validate tour budget response contains mandatory keys
    And I send the GET request to "GET_getTourBudget" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startDate|2022-01-12|
      |endDate|2025-03-01|
      |userId|13|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |tourTypes|
      |tourBudget|

  @Positive @Concurrency
  Scenario: TC_25 Concurrent access test for tour budget endpoint
    And I send the GET request to "GET_getTourBudget" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startDate|2022-01-12|
      |endDate|2025-03-01|
      |userId|13|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @LoadTesting
  Scenario: TC_26 Load testing for tour budget endpoint
    And I send the GET request to "GET_getTourBudget" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startDate|2022-01-12|
      |endDate|2025-03-01|
      |userId|13|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Timeout
  Scenario: TC_27 Test tour budget endpoint timeout handling
    And I send the GET request to "GET_getTourBudget" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startDate|2022-01-12|
      |endDate|2025-03-01|
      |userId|13|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @Regression
  Scenario: TC_28 Regression test for tour budget endpoint
    And I send the GET request to "GET_getTourBudget" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startDate|2022-01-12|
      |endDate|2025-03-01|
      |userId|13|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.tourTypes|array|
      |$.tourBudget|array|

  @Positive @EndToEnd
  Scenario: TC_29 End-to-end tour budget data retrieval workflow
    And I send the GET request to "GET_getTourBudget" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startDate|2022-01-12|
      |endDate|2025-03-01|
      |userId|13|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.tourTypes|array|
      |$.tourBudget|array|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |tourTypes|
      |tourBudget|
    And I store the response as "tourbudget_response" name using full path

  @Positive @Boundary
  Scenario: TC_30 Get tour budget with same startDate and endDate
    And I send the GET request to "GET_getTourBudget" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startDate|2022-01-12|
      |endDate|2022-01-12|
      |userId|13|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|


