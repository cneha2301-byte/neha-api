@BizomWebAPI @CE @OutletsManagement @StockAtOutlet @SalesOperations
Feature: Stock At Outlet HTML Page Validation
  As a Bizom web API consumer
  I want to validate the stock at outlet page
  So that I can ensure outlet stock details render correctly for different scenarios

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get stock at outlet without access token
    When I send the GET request to "outlets_stock_at_outlet" endpoint with path parameters
      |Path|Value|
      |outletId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get stock at outlet with invalid access token
    And I send the GET request to "outlets_stock_at_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|outletId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get stock at outlet with expired access token
    And I send the GET request to "outlets_stock_at_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|outletId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get stock at outlet with malformed access token
    And I send the GET request to "outlets_stock_at_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|outletId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get stock at outlet with valid access token
    And I send the GET request to "outlets_stock_at_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And the HTML response should contain element "h3" with content "Stock At Outlet"
    And verify response time is less than "2500" milliseconds
    And I store the response as "stock_at_outlet_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate stock at outlet page structure
    And I send the GET request to "outlets_stock_at_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And the HTML response should contain element "h3" with content "Stock At Outlet"
    And the HTML response should contain element "table"
    And verify response time is less than "2500" milliseconds

  @Positive @ContentValidation
  Scenario: TC_07 Validate stock at outlet table headers
    And I send the GET request to "outlets_stock_at_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And the HTML response should contain element "h3" with content "Stock At Outlet"
    And the HTML response should contain element "th"
    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: TC_08 Performance test for stock at outlet page
    And I send the GET request to "outlets_stock_at_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And the HTML response should contain element "h3" with content "Stock At Outlet"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: TC_09 Concurrent access test for stock at outlet page
    And I send the GET request to "outlets_stock_at_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And the HTML response should contain element "h3" with content "Stock At Outlet"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_10 Get stock at outlet with invalid query parameters
    And I send the GET request to "outlets_stock_at_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
      |invalid_param|invalid_value|outletId|2|
    Then I should see the response code as "200"
    And the HTML response should contain element "h3" with content "Stock At Outlet"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_11 Get stock at outlet with special characters in query parameters
    And I send the GET request to "outlets_stock_at_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
      |test_param|<script>alert('XSS')</script>|outletId|2|
    Then I should see the response code as "200"
    And the HTML response should contain element "h3" with content "Stock At Outlet"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_12 Get stock at outlet with SQL injection attempt
    And I send the GET request to "outlets_stock_at_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
      |test_param|'; DROP TABLE outlets; --|outletId|2|
    Then I should see the response code as "200"
    And the HTML response should contain element "h3" with content "Stock At Outlet"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: TC_13 Get stock at outlet with maximum query parameters
    And I send the GET request to "outlets_stock_at_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
      |param1|value1|outletId|2|
      |param2|value2|outletId|2|
      |param3|value3|outletId|2|
      |param4|value4|outletId|2|
      |param5|value5|outletId|2|
    Then I should see the response code as "200"
    And the HTML response should contain element "h3" with content "Stock At Outlet"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_14 Get stock at outlet with invalid endpoint
    And I send the GET request to "outlets_stock_at_outlet_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_15 Validate stock at outlet business logic
    And I send the GET request to "outlets_stock_at_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And the HTML response should contain element "h3" with content "Stock At Outlet"
    And verify response time is less than "2500" milliseconds

  @Positive @Regression
  Scenario: TC_16 Regression test for stock at outlet page
    And I send the GET request to "outlets_stock_at_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And the HTML response should contain element "h3" with content "Stock At Outlet"
    And verify response time is less than "2500" milliseconds

  @Positive @Functional
  Scenario: TC_17 Validate stock at outlet page completeness
    And I send the GET request to "outlets_stock_at_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And the HTML response should contain element "h3" with content "Stock At Outlet"
    And the HTML response should contain element "table"
    And verify response time is less than "2500" milliseconds

  @Positive @LoadTesting
  Scenario: TC_18 Load testing for stock at outlet page
    And I send the GET request to "outlets_stock_at_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And the HTML response should contain element "h3" with content "Stock At Outlet"
    And verify response time is less than "3000" milliseconds

  @Negative @Timeout
  Scenario: TC_19 Test stock at outlet page timeout handling
    And I send the GET request to "outlets_stock_at_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And the HTML response should contain element "h3" with content "Stock At Outlet"
    And verify response time is less than "5000" milliseconds

  @Negative @Boundary
  Scenario: TC_20 Get stock at outlet for non-existent outlet
    And I send the GET request to "outlets_stock_at_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|99999|
    Then I should see the response code as "200"
    And the HTML response should contain element "h3" with content "Stock At Outlet"
    And the HTML response should contain element "table"
    And verify response time is less than "2500" milliseconds

