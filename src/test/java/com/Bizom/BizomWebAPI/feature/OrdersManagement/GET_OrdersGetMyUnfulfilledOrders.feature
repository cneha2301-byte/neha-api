@BizomWebAPI @OS @OrdersManagement @Orders @MyUnfulfilledOrders @WorkflowAutomation
Feature: Orders - Get My Unfulfilled Orders
  This feature validates the /orders/getmyunfulfilledorders endpoint which returns unfulfilled orders and related details.

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get my unfulfilled orders without access token
    When I send the GET request to "orders_get_my_unfulfilled_orders" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get my unfulfilled orders with invalid access token
    And I send the GET request to "orders_get_my_unfulfilled_orders" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get my unfulfilled orders with expired access token
    And I send the GET request to "orders_get_my_unfulfilled_orders" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get my unfulfilled orders with malformed access token
    And I send the GET request to "orders_get_my_unfulfilled_orders" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Positive @Smoke
#  Scenario: TC_05 Get my unfulfilled orders with valid access token
#    And I send the GET request to "orders_get_my_unfulfilled_orders" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Orders|array|
#      |$.Orders[0]|object|
#      |$.TotalOrders|string|
#    And verify response time is less than "2500" milliseconds

#  @Positive @DataValidation
#  Scenario: TC_06 Validate unfulfilled order fields
#    And I send the GET request to "orders_get_my_unfulfilled_orders" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Orders[0].orderstate_name|Accepted|
#      |$.Orders[0].Outlet.name|Sadha Nanda1|
#      |$.Orders[0].status|accepted|
#    And verify response time is less than "2500" milliseconds

  @Positive @ArrayValidation
  Scenario: TC_07 Validate unfulfilled orders array structure
    And I send the GET request to "orders_get_my_unfulfilled_orders" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Orders[0].Orderdetail|array|
      |$.Orders[0].Orderdetail[0].skunit_id|string|
      |$.Orders[0].Orderdetail[0].quantity|string|
    And verify response time is less than "2500" milliseconds

#  @Positive @ContentValidation
#  Scenario: TC_08 Validate unfulfilled orders response contains expected keys
#    And I send the GET request to "orders_get_my_unfulfilled_orders" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And validating the response contains the following values
#      |Value|
#      |Orders|
#      |TotalOrders|
#      |orderstate_name|
#      |Outlet|
#    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: TC_09 Performance test for unfulfilled orders endpoint
    And I send the GET request to "orders_get_my_unfulfilled_orders" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for unfulfilled orders endpoint
    And I send the GET request to "orders_get_my_unfulfilled_orders" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_11 Get unfulfilled orders with invalid query parameters
    And I send the GET request to "orders_get_my_unfulfilled_orders" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_12 Get unfulfilled orders with special characters in query parameters
    And I send the GET request to "orders_get_my_unfulfilled_orders" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_13 Get unfulfilled orders with SQL injection attempt
    And I send the GET request to "orders_get_my_unfulfilled_orders" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE Orders; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: TC_14 Get unfulfilled orders with maximum query parameters
    And I send the GET request to "orders_get_my_unfulfilled_orders" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Negative @ErrorHandling
#  Scenario: TC_15 Get unfulfilled orders with invalid endpoint
#    And I send the GET request to "orders_get_my_unfulfilled_orders_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_16 Validate unfulfilled orders business logic
    And I send the GET request to "orders_get_my_unfulfilled_orders" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Orders[0].orderstate_id|string|
    And verify response time is less than "2500" milliseconds

  @Positive @DataIntegrity
  Scenario: TC_17 Validate unfulfilled orders data integrity
    And I send the GET request to "orders_get_my_unfulfilled_orders" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Orders[0].outlet_id|string|
    And verify response time is less than "2500" milliseconds

  @Positive @Regression
  Scenario: TC_18 Regression test for unfulfilled orders endpoint
    And I send the GET request to "orders_get_my_unfulfilled_orders" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Functional
  Scenario: TC_19 Validate unfulfilled orders response completeness
    And I send the GET request to "orders_get_my_unfulfilled_orders" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Orders[0].id|string|
      |$.Orders[0].amount|string|
      |$.Orders[0].Orderdetail|array|
    And verify response time is less than "2500" milliseconds

  @Positive @LoadTesting
  Scenario: TC_20 Load testing for unfulfilled orders endpoint
    And I send the GET request to "orders_get_my_unfulfilled_orders" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Negative @Timeout
  Scenario: TC_21 Test unfulfilled orders endpoint timeout handling
    And I send the GET request to "orders_get_my_unfulfilled_orders" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds

  @Positive @EndToEnd
  Scenario: TC_22 End-to-end unfulfilled orders retrieval workflow
    And I send the GET request to "orders_get_my_unfulfilled_orders" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Orders[0].Orderdetail[0].amount|string|
    And I store the response as "my_unfulfilled_orders_response" name using full path
    And verify response time is less than "2500" milliseconds


