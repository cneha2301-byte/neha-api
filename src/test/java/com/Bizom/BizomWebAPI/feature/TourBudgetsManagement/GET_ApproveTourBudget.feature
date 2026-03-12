@BizomWebAPI @TourBudgetsManagement @ApproveTourBudget @SystemIntegration @innovation
Feature: Approve Tour Budget API Testing
  As a system user
  I want to test the approveTourBudget endpoint
  So that I can ensure proper approval workflow for tour budgets

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
  Scenario: TC_01 Approve tour budget without access token
    When I send the GET request to "GET_approveTourBudget" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |tourBudgetId|2|
      |approveState|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Approve tour budget with invalid access token
    And I send the GET request to "GET_approveTourBudget" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
      |tourBudgetId|2|
      |approveState|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Approve tour budget with expired access token
    And I send the GET request to "GET_approveTourBudget" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
      |tourBudgetId|2|
      |approveState|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Approve tour budget with malformed access token
    And I send the GET request to "GET_approveTourBudget" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
      |tourBudgetId|2|
      |approveState|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_05 Approve tour budget with empty access token
    And I send the GET request to "GET_approveTourBudget" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token||
      |tourBudgetId|2|
      |approveState|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_06 Approve tour budget that is already approved
    And I send the GET request to "GET_approveTourBudget" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |tourBudgetId|2|
      |approveState|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
    And I store the response as "approvetourbudget_response" name using full path

  @Positive @DataValidation
  Scenario: TC_07 Validate approve tour budget response structure
    And I send the GET request to "GET_approveTourBudget" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |tourBudgetId|2|
      |approveState|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.tourBudget|object|

  @Positive @DataValidation
  Scenario: TC_08 Validate tour budget object structure
    And I send the GET request to "GET_approveTourBudget" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |tourBudgetId|2|
      |approveState|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.tourBudget.id|string|
      |$.tourBudget.user_id|string|
      |$.tourBudget.fromdate|string|
      |$.tourBudget.todate|string|
      |$.tourBudget.state|string|
      |$.tourBudget.value|string|

  @Positive @DataValidation
  Scenario: TC_09 Validate nested tourBudgetData array
    And I send the GET request to "GET_approveTourBudget" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |tourBudgetId|2|
      |approveState|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.tourBudget.tourBudgetData|array|
      |$.tourBudget.tourBudgetData[0].id|string|
      |$.tourBudget.tourBudgetData[0].tourtype_id|string|
      |$.tourBudget.tourBudgetData[0].entity_id|string|
      |$.tourBudget.tourBudgetData[0].value|string|

  @Positive @Performance
  Scenario: TC_10 Performance test for approve tour budget endpoint
    And I send the GET request to "GET_approveTourBudget" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |tourBudgetId|2|
      |approveState|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Negative @Validation
  Scenario: TC_11 Approve tour budget with invalid tourBudgetId
    And I send the GET request to "GET_approveTourBudget" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |tourBudgetId|abc|
      |approveState|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_12 Approve tour budget with non-existent tourBudgetId
    And I send the GET request to "GET_approveTourBudget" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |tourBudgetId|999999|
      |approveState|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_13 Approve tour budget with empty tourBudgetId
    And I send the GET request to "GET_approveTourBudget" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |tourBudgetId||
      |approveState|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_14 Approve tour budget with invalid approveState
    And I send the GET request to "GET_approveTourBudget" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |tourBudgetId|2|
      |approveState|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_15 Approve tour budget with empty approveState
    And I send the GET request to "GET_approveTourBudget" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |tourBudgetId|2|
      |approveState||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_16 Approve tour budget without tourBudgetId parameter
    And I send the GET request to "GET_approveTourBudget" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |approveState|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_17 Approve tour budget without approveState parameter
    And I send the GET request to "GET_approveTourBudget" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |tourBudgetId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_18 Approve tour budget with negative tourBudgetId
    And I send the GET request to "GET_approveTourBudget" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |tourBudgetId|-1|
      |approveState|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_19 Approve tour budget with zero tourBudgetId
    And I send the GET request to "GET_approveTourBudget" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |tourBudgetId|0|
      |approveState|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_20 Approve tour budget with approveState value 0
    And I send the GET request to "GET_approveTourBudget" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |tourBudgetId|2|
      |approveState|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_21 Approve tour budget with approveState value 2
    And I send the GET request to "GET_approveTourBudget" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |tourBudgetId|2|
      |approveState|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Negative @ErrorHandling
#  Scenario: TC_22 Approve tour budget with invalid endpoint
#    And I send the GET request to "GET_approveTourBudget_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |tourBudgetId|2|
#      |approveState|1|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @DataValidation
  Scenario: TC_23 Validate approve tour budget response contains mandatory keys
    And I send the GET request to "GET_approveTourBudget" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |tourBudgetId|2|
      |approveState|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |tourBudget|

  @Positive @BusinessLogic
  Scenario: TC_24 Validate already approved budget reason message
    And I send the GET request to "GET_approveTourBudget" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |tourBudgetId|2|
      |approveState|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
    And validating the response contains the following values
      |Value|
      |Budget Already Approved|

  @Positive @Concurrency
  Scenario: TC_25 Concurrent access test for approve tour budget endpoint
    And I send the GET request to "GET_approveTourBudget" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |tourBudgetId|2|
      |approveState|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @LoadTesting
  Scenario: TC_26 Load testing for approve tour budget endpoint
    And I send the GET request to "GET_approveTourBudget" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |tourBudgetId|2|
      |approveState|1|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Negative @Timeout
  Scenario: TC_27 Test approve tour budget endpoint timeout handling
    And I send the GET request to "GET_approveTourBudget" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |tourBudgetId|2|
      |approveState|1|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds

  @Positive @Regression
  Scenario: TC_28 Regression test for approve tour budget endpoint
    And I send the GET request to "GET_approveTourBudget" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |tourBudgetId|2|
      |approveState|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.tourBudget|object|

  @Positive @EndToEnd
  Scenario: TC_29 End-to-end approve tour budget workflow
    And I send the GET request to "GET_approveTourBudget" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |tourBudgetId|2|
      |approveState|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.tourBudget|object|
      |$.tourBudget.id|string|
      |$.tourBudget.user_id|string|
      |$.tourBudget.fromdate|string|
      |$.tourBudget.todate|string|
      |$.tourBudget.tourBudgetData|array|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |tourBudget|
    And I store the response as "approvetourbudget_response" name using full path

  @Positive @Boundary
  Scenario: TC_30 Approve tour budget with very large tourBudgetId
    And I send the GET request to "GET_approveTourBudget" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |tourBudgetId|2147483647|
      |approveState|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds


