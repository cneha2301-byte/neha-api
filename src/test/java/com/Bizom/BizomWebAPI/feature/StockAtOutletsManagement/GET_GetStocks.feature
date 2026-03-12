@BizomWebAPI @StockAtOutletsManagement @GetStocks @SystemIntegration @Innovation
Feature: Get Stocks at Outlets API Testing
  As a system user
  I want to test the getstocks endpoint
  So that I can ensure proper functionality and data retrieval for stocks at outlets

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
  Scenario: TC_01 Get stocks at outlets without access token
    When I send the GET request to "stockatoutlets_getstocks" endpoint with path parameters
      |Path|Value|
      |startDate|2023-08-17|
      |endDate|2025-08-19|
      |warehouseId|2|
      |outletId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get stocks at outlets with invalid access token
    And I send the GET request to "stockatoutlets_getstocks" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|startDate|2023-08-17|
      |||endDate|2025-08-19|
      |||warehouseId|2|
      |||outletId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"     
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get stocks at outlets with expired access token
    And I send the GET request to "stockatoutlets_getstocks" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|startDate|2023-08-17|
      |||endDate|2025-08-19|
      |||warehouseId|2|
      |||outletId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get stocks at outlets with malformed access token
    And I send the GET request to "stockatoutlets_getstocks" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|startDate|2023-08-17|
      |||endDate|2025-08-19|
      |||warehouseId|2|
      |||outletId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get stocks at outlets with valid request
    And I send the GET request to "stockatoutlets_getstocks" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|startDate|2023-08-17|
      |||endDate|2025-08-19|
      |||warehouseId|2|
      |||outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.stockatoutlets|array|
    And I store the response as "stocks_at_outlets_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate stocks at outlets response structure
    And I send the GET request to "stockatoutlets_getstocks" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|startDate|2023-08-17|
      |||endDate|2025-08-19|
      |||warehouseId|2|
      |||outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
      |$.stockatoutlets|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.stockatoutlets|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate stocks at outlets with different date range
    And I send the GET request to "stockatoutlets_getstocks" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|startDate|2024-01-01|
      |||endDate|2024-12-31|
      |||warehouseId|2|
      |||outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.stockatoutlets|array|

  @Positive @DataValidation
  Scenario: TC_08 Validate stocks at outlets with different warehouse ID
    And I send the GET request to "stockatoutlets_getstocks" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|startDate|2023-08-17|
      |||endDate|2025-08-19|
      |||warehouseId|1|
      |||outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.stockatoutlets|array|

  @Positive @DataValidation
  Scenario: TC_09 Validate stocks at outlets with different outlet ID
    And I send the GET request to "stockatoutlets_getstocks" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|startDate|2023-08-17|
      |||endDate|2025-08-19|
      |||warehouseId|2|
      |||outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.stockatoutlets|array|

  @Positive @Performance
  Scenario: TC_10 Performance test for stocks at outlets endpoint
    And I send the GET request to "stockatoutlets_getstocks" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|startDate|2023-08-17|
      |||endDate|2025-08-19|
      |||warehouseId|2|
      |||outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Positive @DataIntegrity
  Scenario: TC_11 Validate stocks at outlets data integrity
    And I send the GET request to "stockatoutlets_getstocks" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|startDate|2023-08-17|
      |||endDate|2025-08-19|
      |||warehouseId|2|
      |||outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.stockatoutlets|array|

  @Positive @Functional
  Scenario: TC_12 Validate stocks at outlets response completeness
    And I send the GET request to "stockatoutlets_getstocks" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|startDate|2023-08-17|
      |||endDate|2025-08-19|
      |||warehouseId|2|
      |||outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.stockatoutlets|array|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |stockatoutlets|

  @Positive @ArrayValidation
  Scenario: TC_13 Validate stocks at outlets array structure
    And I send the GET request to "stockatoutlets_getstocks" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|startDate|2023-08-17|
      |||endDate|2025-08-19|
      |||warehouseId|2|
      |||outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.stockatoutlets|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.stockatoutlets|[]|

  @Positive @EndToEnd
  Scenario: TC_14 End-to-end stocks at outlets data retrieval workflow
    And I send the GET request to "stockatoutlets_getstocks" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|startDate|2023-08-17|
      |||endDate|2025-08-19|
      |||warehouseId|2|
      |||outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "stocks_at_outlets_response" name using full path
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
      |$.stockatoutlets|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.stockatoutlets|array|



