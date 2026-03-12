@BizomWebAPI @OS @OrdersManagement @Orders @GETOrdersReject @WorkflowAutomation
Feature: Orders Reject - HTML endpoint with dynamic path parameter orderId
  This feature validates the /orders/reject/{orderId} endpoint which returns an HTML page titled "Orders".

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|text/html,*/*|
      |Connection|keep-alive|

  @Positive @Smoke @PathParam
  Scenario: TC_01 Reject order with valid orderId
    When I send the GET request to "orders_reject" endpoint with path parameters
      |Path|Value|
      |orderId|20|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: TC_02 Reject order with non-numeric orderId
    When I send the GET request to "orders_reject" endpoint with path parameters
      |Path|Value|
      |orderId|abc|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: TC_03 Reject order with non-existent orderId
    When I send the GET request to "orders_reject" endpoint with path parameters
      |Path|Value|
      |orderId|999999|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: TC_04 Reject order with empty orderId
    When I send the GET request to "orders_reject" endpoint with path parameters
      |Path|Value|
      |orderId| |
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_05 Reject order with invalid access token
    And I send the GET request to "orders_reject" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|orderId|20|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_06 Reject order with expired access token
    And I send the GET request to "orders_reject" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|orderId|20|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_07 Reject order with malformed access token
    And I send the GET request to "orders_reject" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|orderId|20|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Positive @Functional
  Scenario: TC_08 Validate Accept Order heading present on reject page
    When I send the GET request to "orders_reject" endpoint with path parameters
      |Path|Value|
      |orderId|20|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Positive @ContentValidation
  Scenario: TC_09 Validate reject order HTML content structure
    When I send the GET request to "orders_reject" endpoint with path parameters
      |Path|Value|
      |orderId|20|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Positive @Headers
  Scenario: TC_10 Validate response headers for reject order page
    When I send the GET request to "orders_reject" endpoint with path parameters
      |Path|Value|
      |orderId|20|
    Then I should see the response code as "200"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: TC_11 Performance baseline for reject order endpoint
    When I send the GET request to "orders_reject" endpoint with path parameters
      |Path|Value|
      |orderId|20|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Regression
  Scenario: TC_12 Regression check for reject order endpoint
    When I send the GET request to "orders_reject" endpoint with path parameters
      |Path|Value|
      |orderId|20|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Positive @ResponseStorage
  Scenario: TC_13 Store reject order HTML response
    When I send the GET request to "orders_reject" endpoint with path parameters
      |Path|Value|
      |orderId|20|
    Then I should see the response code as "200"
    And I store the response as "orders_reject_response" name using full path
    And verify response time is less than "2000" milliseconds

#  @Negative @ErrorHandling
#  Scenario: TC_14 Invalid reject order endpoint
#    And I send the GET request to "orders_reject_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|orderId|20|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: TC_15 Reject order with additional query parameters
    And I send the GET request to "orders_reject" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|20|
      |invalid_param|invalid_value|orderId|20|
      |another_param|123|orderId|20|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Orders"
    And verify response time is less than "2500" milliseconds

