@BizomWebAPI @OS @PaymentsManagement @GetLoadoutSheetData @SalesOperations
Feature: Get Loadout Sheet Data API Testing
  As a system user
  I want to test the get loadout sheet data endpoint
  So that I can ensure proper functionality and HTML page rendering for loadout sheet data management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get loadout sheet data without access token
    When I send the GET request to "payments_get_loadout_sheet_data" endpoint with path parameters
      |Path|Value|
      |fromdate|01-01-2022|
      |todate|01-01-2024|
      |filter|all|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get loadout sheet data with invalid access token
    And I send the GET request to "payments_get_loadout_sheet_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|fromdate|01-01-2022|
      |||todate|01-01-2024|
      |||filter|all|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get loadout sheet data with expired access token
    And I send the GET request to "payments_get_loadout_sheet_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|fromdate|01-01-2022|
      |||todate|01-01-2024|
      |||filter|all|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get loadout sheet data with malformed access token
    And I send the GET request to "payments_get_loadout_sheet_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|fromdate|01-01-2022|
      |||todate|01-01-2024|
      |||filter|all|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get loadout sheet data with valid access token
    And I send the GET request to "payments_get_loadout_sheet_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|01-01-2022|
      |||todate|01-01-2024|
      |||filter|all|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And I store the response as "loadout_sheet_data_response" name using full path

  @Positive @Functional
  Scenario: Get loadout sheet data with different date range
    And I send the GET request to "payments_get_loadout_sheet_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|01-01-2023|
      |||todate|31-12-2023|
      |||filter|all|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @Functional
  Scenario: Get loadout sheet data with different filter value
    And I send the GET request to "payments_get_loadout_sheet_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|01-01-2022|
      |||todate|01-01-2024|
      |||filter|pending|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @DataValidation
  Scenario: Validate loadout sheet data HTML response structure
    And I send the GET request to "payments_get_loadout_sheet_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|01-01-2022|
      |||todate|01-01-2024|
      |||filter|all|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @HTMLValidation
  Scenario: Validate loadout sheet data HTML page structure
    And I send the GET request to "payments_get_loadout_sheet_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|01-01-2022|
      |||todate|01-01-2024|
      |||filter|all|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @HTMLValidation
  Scenario: Validate loadout sheet data HTML page title
    And I send the GET request to "payments_get_loadout_sheet_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|01-01-2022|
      |||todate|01-01-2024|
      |||filter|all|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @HTMLValidation
  Scenario: Validate loadout sheet data HTML element existence
    And I send the GET request to "payments_get_loadout_sheet_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|01-01-2022|
      |||todate|01-01-2024|
      |||filter|all|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Negative @Validation
  Scenario: Get loadout sheet data with invalid date format
    And I send the GET request to "payments_get_loadout_sheet_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|invalid-date|
      |||todate|01-01-2024|
      |||filter|all|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Negative @Validation
  Scenario: Get loadout sheet data with invalid filter value
    And I send the GET request to "payments_get_loadout_sheet_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|01-01-2022|
      |||todate|01-01-2024|
      |||filter|invalid_filter|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

#  @Negative @Validation
#  Scenario: Get loadout sheet data with future dates
#    And I send the GET request to "payments_get_loadout_sheet_data" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|fromdate|01-01-2099|
#      |||todate|31-12-2099|
#      |||filter|all|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Content-Type|text/html; charset=UTF-8|

#  @Negative @Validation
#  Scenario: Get loadout sheet data with todate before fromdate
#    And I send the GET request to "payments_get_loadout_sheet_data" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|fromdate|01-01-2024|
#      |||todate|01-01-2022|
#      |||filter|all|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Content-Type|text/html; charset=UTF-8|

#  @Negative @ErrorHandling
#  Scenario: Get loadout sheet data with invalid endpoint
#    And I send the GET request to "payments_get_loadout_sheet_data_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|fromdate|01-01-2022|
#      |||todate|01-01-2024|
#      |||filter|all|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: Performance test for loadout sheet data endpoint
    And I send the GET request to "payments_get_loadout_sheet_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|01-01-2022|
      |||todate|01-01-2024|
      |||filter|all|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @Concurrency
  Scenario: Concurrent access test for loadout sheet data endpoint
    And I send the GET request to "payments_get_loadout_sheet_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|01-01-2022|
      |||todate|01-01-2024|
      |||filter|all|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @BusinessLogic
  Scenario: Validate loadout sheet data business logic
    And I send the GET request to "payments_get_loadout_sheet_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|01-01-2022|
      |||todate|01-01-2024|
      |||filter|all|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @Regression
  Scenario: Regression test for loadout sheet data endpoint
    And I send the GET request to "payments_get_loadout_sheet_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|01-01-2022|
      |||todate|01-01-2024|
      |||filter|all|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @Functional
  Scenario: Validate loadout sheet data response completeness
    And I send the GET request to "payments_get_loadout_sheet_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|01-01-2022|
      |||todate|01-01-2024|
      |||filter|all|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|


  @Positive @LoadTesting
  Scenario: Load testing for loadout sheet data endpoint
    And I send the GET request to "payments_get_loadout_sheet_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|01-01-2022|
      |||todate|01-01-2024|
      |||filter|all|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Negative @Timeout
  Scenario: Test loadout sheet data endpoint timeout handling
    And I send the GET request to "payments_get_loadout_sheet_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|01-01-2022|
      |||todate|01-01-2024|
      |||filter|all|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @EndToEnd
  Scenario: End-to-end loadout sheet data retrieval workflow
    And I send the GET request to "payments_get_loadout_sheet_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|01-01-2022|
      |||todate|01-01-2024|
      |||filter|all|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And I store the response as "loadout_sheet_data_response" name using full path


