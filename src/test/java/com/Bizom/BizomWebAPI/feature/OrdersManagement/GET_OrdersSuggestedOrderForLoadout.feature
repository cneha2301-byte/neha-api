@BizomWebAPI @OS @OrdersManagement @Orders @SuggestedOrder @SystemOperations
Feature: Orders - Suggested Order For Loadout
  This feature validates the /orders/suggestedorderforloadout/{orderId} endpoint which determines loadout suggestions.

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Suggested order for loadout without access token
    When I send the GET request to "orders_suggested_order_for_loadout" endpoint with path parameters
      |Path|Value|
      |orderId|11|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users "
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_02 Suggested order for loadout with invalid access token
    And I send the GET request to "orders_suggested_order_for_loadout" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|orderId|11|
    Then I should see the response code as "200"
    And the HTML response should contain page title " "
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_03 Suggested order for loadout with expired access token
    And I send the GET request to "orders_suggested_order_for_loadout" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|orderId|11|
    Then I should see the response code as "200"
    And the HTML response should contain page title " "
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_04 Suggested order for loadout with malformed access token
    And I send the GET request to "orders_suggested_order_for_loadout" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|orderId|11|
    Then I should see the response code as "200"
    And the HTML response should contain page title " "
    And verify response time is less than "2000" milliseconds

  @Positive @Smoke @PathParam
  Scenario: TC_05 Suggested order for loadout for order ID 11 with valid access token
    And I send the GET request to "orders_suggested_order_for_loadout" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|11|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|suggested loadout setting is disabled|
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: TC_06 Suggested order for loadout with non-numeric order ID
    And I send the GET request to "orders_suggested_order_for_loadout" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: TC_07 Suggested order for loadout with non-existent order ID
    And I send the GET request to "orders_suggested_order_for_loadout" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

#  @Negative @ErrorHandling
#  Scenario: TC_08 Suggested order for loadout with invalid endpoint
#    And I send the GET request to "orders_suggested_order_for_loadout_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|orderId|11|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: TC_09 Performance test for suggested order for loadout endpoint
    And I send the GET request to "orders_suggested_order_for_loadout" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|11|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
    And verify response time is less than "1500" milliseconds

  @Positive @Regression
  Scenario: TC_10 Regression test for suggested order for loadout endpoint
    And I send the GET request to "orders_suggested_order_for_loadout" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|11|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
    And verify response time is less than "2000" milliseconds

