@BizomWebAPI @OS @OrdersManagement @Orders @ReRunOrder @WorkflowAutomation
Feature: Orders - ReRun Order Process
  This feature validates the /orders/reRun/{orderId} endpoint which restarts the order process.

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Re-run order without access token
    When I send the GET request to "orders_rerun" endpoint with path parameters
      |Path|Value|
      |orderId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users "
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_02 Re-run order with invalid access token
    And I send the GET request to "orders_rerun" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|orderId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title " "
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_03 Re-run order with expired access token
    And I send the GET request to "orders_rerun" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|orderId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title " "
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_04 Re-run order with malformed access token
    And I send the GET request to "orders_rerun" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|orderId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title " "
    And verify response time is less than "2000" milliseconds

  @Positive @Smoke @PathParam
  Scenario: TC_05 Re-run order for order ID 1 with valid access token
    And I send the GET request to "orders_rerun" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Process restarted.|
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: TC_06 Re-run order with non-numeric order ID
    And I send the GET request to "orders_rerun" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: TC_07 Re-run order with non-existent order ID
    And I send the GET request to "orders_rerun" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

#  @Negative @ErrorHandling
#  Scenario: TC_08 Re-run order with invalid endpoint
#    And I send the GET request to "orders_rerun_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|orderId|1|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: TC_09 Performance test for re-run order endpoint
    And I send the GET request to "orders_rerun" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Regression
  Scenario: TC_10 Regression test for re-run order endpoint
    And I send the GET request to "orders_rerun" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

