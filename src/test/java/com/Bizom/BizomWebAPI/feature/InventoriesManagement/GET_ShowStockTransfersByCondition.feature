@BizomWebAPI @OS @InventoriesManagement @ShowStockTransfersByCondition
Feature: Show Stock Transfers By Condition API Testing
  As a system user
  I want to test the showstocktransfersbycondition endpoint
  So that I can ensure proper functionality and data retrieval for stock transfers by condition

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

  @Negative @Security
  Scenario: TC_01 Show stock transfers by condition without access token
    When I send the GET request to "inventories_showstocktransfersbycondition" endpoint with path parameters
      |Path|Value|
      |fromDate|2021-04-27|
      |toDate|2025-12-04|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Show stock transfers by condition with invalid access token
    And I send the GET request to "inventories_showstocktransfersbycondition" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|fromDate|2021-04-27|
      |||toDate|2025-12-04|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users" 
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Show stock transfers by condition with expired access token
    And I send the GET request to "inventories_showstocktransfersbycondition" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|fromDate|2021-04-27|
      |||toDate|2025-12-04|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Show stock transfers by condition with malformed access token
    And I send the GET request to "inventories_showstocktransfersbycondition" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|fromDate|2021-04-27|
      |||toDate|2025-12-04|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Show stock transfers by condition with valid request
    And I send the GET request to "inventories_showstocktransfersbycondition" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|2021-04-27|
      |||toDate|2025-12-04|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
    And I store the response as "show_stock_transfers_by_condition_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate show stock transfers by condition response structure
    And I send the GET request to "inventories_showstocktransfersbycondition" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|2021-04-27|
      |||toDate|2025-12-04|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Positive @ParameterVariation
  Scenario: TC_07 Show stock transfers by condition with different date range
    And I send the GET request to "inventories_showstocktransfersbycondition" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|2022-01-01|
      |||toDate|2022-12-31|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Positive @Boundary
  Scenario: TC_08 Show stock transfers by condition with same fromDate and toDate
    And I send the GET request to "inventories_showstocktransfersbycondition" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|2025-12-04|
      |||toDate|2025-12-04|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Negative @Validation
  Scenario: TC_09 Show stock transfers by condition with invalid date format
    And I send the GET request to "inventories_showstocktransfersbycondition" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|2021/04/27|
      |||toDate|2025/12/04|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|

  @Negative @Validation
  Scenario: TC_10 Show stock transfers by condition with reversed date range
    And I send the GET request to "inventories_showstocktransfersbycondition" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|2025-12-04|
      |||toDate|2021-04-27|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|array|

  @Negative @ErrorHandling
  Scenario: TC_11 Show stock transfers by condition with invalid endpoint
    And I send the GET request to "inventories_showstocktransfersbycondition_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|2021-04-27|
      |||toDate|2025-12-04|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

