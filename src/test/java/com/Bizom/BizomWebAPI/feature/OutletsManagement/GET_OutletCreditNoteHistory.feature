@BizomWebAPI @CE @OutletsManagement @OutletCreditNoteHistory
Feature: This feature file contains testcases for GET endpoint get_outlet_creditnote_history
  As a system user
  I want to test the outlet credit note history endpoint
  So that I can ensure proper functionality and data retrieval for outlet credit note history

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
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

  @Positive @Smoke
  Scenario: TC_01 Get outlet credit note history with valid request
    And I send the GET request to "outlets_get_outlet_creditnote_history" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
      |||startDate|19-10-2024|
      |||endDate|10-11-2025|
      |warehouse_id|2||    |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain element "table"
    And the HTML response should contain element "th"
    And I store the response as "outlet_creditnote_history_response" name using full path

  @Positive @DataValidation
  Scenario: TC_02 Validate outlet credit note history HTML table structure
    And I send the GET request to "outlets_get_outlet_creditnote_history" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
      |||startDate|19-10-2024|
      |||endDate|10-11-2025|
      |warehouse_id|2||    |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain element "table"
    And the HTML response should contain element "th" with content "Id"

  @Positive @Performance
  Scenario: TC_03 Performance test for outlet credit note history endpoint
    And I send the GET request to "outlets_get_outlet_creditnote_history" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
      |||startDate|19-10-2024|
      |||endDate|10-11-2025|
      |warehouse_id|2||    |
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the HTML response should contain element "table"

  @Positive @EndToEnd
   Scenario: TC_04 End-to-end outlet credit note history data retrieval workflow
    And I send the GET request to "outlets_get_outlet_creditnote_history" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
      |||startDate|19-10-2024|
      |||endDate|10-11-2025|
      |warehouse_id|2||    |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain element "table"
    And the HTML response should contain element "th" with content "Id"

  @Negative @Security
  Scenario: TC_05 Get outlet credit note history without access token
    When I send the GET request to "outlets_get_outlet_creditnote_history" endpoint with path parameters
      |Path|Value|
      |outletId|1|
      |startDate|19-10-2024|
      |endDate|10-11-2025|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_06 Get outlet credit note history with invalid access token
    And I send the GET request to "outlets_get_outlet_creditnote_history" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|outletId|1|
      |||startDate|19-10-2024|
      |||endDate|10-11-2025|
      |warehouse_id|2||    |
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_07 Get outlet credit note history with expired access token
    And I send the GET request to "outlets_get_outlet_creditnote_history" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|outletId|1|
      |||startDate|19-10-2024|
      |||endDate|10-11-2025|
      |warehouse_id|2||    |
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_08 Get outlet credit note history with malformed access token
    And I send the GET request to "outlets_get_outlet_creditnote_history" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|outletId|1|
      |||startDate|19-10-2024|
      |||endDate|10-11-2025|
      |warehouse_id|2||    |
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_09 Get outlet credit note history with invalid date format
    And I send the GET request to "outlets_get_outlet_creditnote_history" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
      |||startDate|invalid-date|
      |||endDate|10-11-2025|
      |warehouse_id|2||    |
    Then I should see the response code as "200"
    And the HTML response should contain page title ""
    And verify response time is less than "2500" milliseconds


  @Negative @Validation
  Scenario: TC_10 Get outlet credit note history with missing warehouse ID
    And I send the GET request to "outlets_get_outlet_creditnote_history" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
      |||startDate|19-10-2024|
      |||endDate|10-11-2025|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain element "table"

