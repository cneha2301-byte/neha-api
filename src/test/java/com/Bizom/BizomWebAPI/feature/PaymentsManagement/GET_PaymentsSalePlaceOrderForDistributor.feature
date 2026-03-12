@BizomWebAPI @OS @PaymentsManagement @Payments @PlaceOrderForDistributor @SalesOperations
Feature: Payments - Place Order For Distributor HTML endpoint
  This feature validates the /payments/sale/placeorderfordistributor endpoint which renders the Payments page.

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|text/html,*/*|
      |Connection|keep-alive|

  @Positive @Smoke @PathParam
  Scenario: TC_01 Load place order page without parameters
    When I send the GET request to "payments_sale_place_order_for_distributor" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_02 Load place order page with invalid access token
    And I send the GET request to "payments_sale_place_order_for_distributor" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Load place order page with expired access token
    And I send the GET request to "payments_sale_place_order_for_distributor" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Load place order page with malformed access token
    And I send the GET request to "payments_sale_place_order_for_distributor" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Positive @Functional
  Scenario: TC_05 Validate Payments page content for distributor order
    When I send the GET request to "payments_sale_place_order_for_distributor" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Positive @Functional
  Scenario: TC_06 Validate Payments page heading element
    When I send the GET request to "payments_sale_place_order_for_distributor" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: TC_07 Load place order page with non-numeric orderId query parameter
    And I send the GET request to "payments_sale_place_order_for_distributor" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |orderId|abc|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Payments"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: TC_08 Load place order page with zero orderId query parameter
    And I send the GET request to "payments_sale_place_order_for_distributor" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |orderId|0|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Payments"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: TC_09 Load place order page with negative orderId query parameter
    And I send the GET request to "payments_sale_place_order_for_distributor" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |orderId|-1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Payments"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: TC_10 Load place order page with blank orderId query parameter
    And I send the GET request to "payments_sale_place_order_for_distributor" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |orderId| |
    Then I should see the response code as "200"
    And the HTML response should contain page title "Payments"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: TC_11 Load place order page with special character orderId query parameter
    And I send the GET request to "payments_sale_place_order_for_distributor" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |orderId|20@#|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Payments"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: TC_12 Load place order page with additional query parameters
    And I send the GET request to "payments_sale_place_order_for_distributor" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |orderId|20|
      |invalid_param|invalid_value|
      |another_param|123|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Payments"
    And verify response time is less than "2500" milliseconds

  @Positive @Headers
  Scenario: TC_13 Validate response headers for Payments page
    When I send the GET request to "payments_sale_place_order_for_distributor" endpoint
    Then I should see the response code as "200"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: TC_14 Performance baseline for place order page
    When I send the GET request to "payments_sale_place_order_for_distributor" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @LoadTesting
  Scenario: TC_15 Load testing threshold for place order page
    When I send the GET request to "payments_sale_place_order_for_distributor" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Negative @Timeout
  Scenario: TC_16 Timeout handling for place order page
    When I send the GET request to "payments_sale_place_order_for_distributor" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds

  @Positive @ResponseStorage
  Scenario: TC_17 Store Payments page response for auditing
    When I send the GET request to "payments_sale_place_order_for_distributor" endpoint
    Then I should see the response code as "200"
    And I store the response as "payments_place_order_for_distributor" name using full path
    And verify response time is less than "2000" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_18 Invalid place order endpoint
    And I send the GET request to "payments_sale_place_order_for_distributor_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Positive @Regression
  Scenario: TC_19 Regression check for place order page
    When I send the GET request to "payments_sale_place_order_for_distributor" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

