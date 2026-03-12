@BizomWebAPI @OS @OrdersManagement @ListOrders @WorkflowAutomation
Feature: Orders - List Orders HTML endpoint
  This feature validates the /orders/listorders endpoint which returns HTML order listings.

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|text/html,*/*|
      |Connection|keep-alive|

  @PositiveScenario @Smoke
  Scenario: TC_01 List orders without access token
    When I send the GET request to "orders_list_orders" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_02 List orders with invalid access token
    And I send the GET request to "orders_list_orders" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 List orders with expired access token
    And I send the GET request to "orders_list_orders" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 List orders with malformed access token
    And I send the GET request to "orders_list_orders" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Positive @Functional
  Scenario: TC_05 Validate HTML content for orders list
    When I send the GET request to "orders_list_orders" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: TC_06 Performance baseline for list orders endpoint
    When I send the GET request to "orders_list_orders" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "1500" milliseconds

  @Positive @Headers
  Scenario: TC_07 Validate response headers for list orders
    When I send the GET request to "orders_list_orders" endpoint
    Then I should see the response code as "200"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "2000" milliseconds

#  @Negative @ErrorHandling
#  Scenario: TC_08 Invalid endpoint returns Users page
#    And I send the GET request to "orders_list_orders_invalid" endpoint
#    Then I should see the response code as "200"
#     And the HTML response should contain page title "Users"
#    And verify response time is less than "2000" milliseconds

  @Positive @Regression
  Scenario: TC_09 Regression check for list orders endpoint
    When I send the GET request to "orders_list_orders" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds


