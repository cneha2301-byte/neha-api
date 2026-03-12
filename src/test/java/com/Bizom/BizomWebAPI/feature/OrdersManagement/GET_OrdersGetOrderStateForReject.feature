@BizomWebAPI @OS @OrdersManagement @Orders @OrderStateReject @WorkflowAutomation
Feature: Orders - Get Order State For Reject
  This feature validates the /orders/getorderstateforreject/{orderId} endpoint which returns order state status for rejection checks.

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get order state for reject without access token
    When I send the GET request to "orders_get_order_state_for_reject" endpoint with path parameters
      |Path|Value|
      |orderId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users "
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_02 Get order state for reject with invalid access token
    And I send the GET request to "orders_get_order_state_for_reject" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|orderId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title " "
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_03 Get order state for reject with expired access token
    And I send the GET request to "orders_get_order_state_for_reject" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|orderId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title " "
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_04 Get order state for reject with malformed access token
    And I send the GET request to "orders_get_order_state_for_reject" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|orderId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title " "
    And verify response time is less than "2000" milliseconds

  @Positive @Smoke @PathParam
  Scenario: TC_05 Get order state for reject for order ID 1 with valid access token
    And I send the GET request to "orders_get_order_state_for_reject" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"false"|
      |$.Reason|Order rejected, please refresh screen|
    And verify response time is less than "2000" milliseconds

  @Positive @Functional @PathParam
  Scenario: TC_06 Get order state for reject for order ID 21 with valid access token
    And I send the GET request to "orders_get_order_state_for_reject" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|21|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: TC_07 Get order state for reject with invalid order ID format
    And I send the GET request to "orders_get_order_state_for_reject" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: TC_08 Get order state for reject with non-existent order ID
    And I send the GET request to "orders_get_order_state_for_reject" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

#  @Negative @ErrorHandling
#  Scenario: TC_09 Get order state for reject with invalid endpoint
#    And I send the GET request to "orders_get_order_state_for_reject_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|orderId|1|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: TC_10 Performance test for get order state for reject endpoint
    And I send the GET request to "orders_get_order_state_for_reject" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|21|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Regression
  Scenario: TC_11 Regression test for get order state for reject endpoint
    And I send the GET request to "orders_get_order_state_for_reject" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|21|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Positive @ContentValidation
  Scenario: TC_12 Validate response contains expected keys for order state reject
    And I send the GET request to "orders_get_order_state_for_reject" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|21|
    Then I should see the response code as "200"
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
    And verify response time is less than "2500" milliseconds

  @Positive @Headers
  Scenario: TC_13 Validate response headers for order state reject
    And I send the GET request to "orders_get_order_state_for_reject" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|21|
    Then I should see the response code as "200"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json; charset=UTF-8|
    And verify response time is less than "2500" milliseconds

  @Positive @ResponseStorage
  Scenario: TC_14 Store order state for reject response for further use
    And I send the GET request to "orders_get_order_state_for_reject" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|21|
    Then I should see the response code as "200"
    And I store the response as "order_state_for_reject_response" name using full path
    And verify response time is less than "2500" milliseconds

  @Positive @LoadTesting
  Scenario: TC_15 Load testing for order state reject endpoint
    And I send the GET request to "orders_get_order_state_for_reject" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|21|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Negative @Timeout
  Scenario: TC_16 Test order state reject endpoint timeout handling
    And I send the GET request to "orders_get_order_state_for_reject" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|21|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds

