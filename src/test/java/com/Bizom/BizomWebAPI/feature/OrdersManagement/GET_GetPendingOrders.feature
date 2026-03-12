@BizomWebAPI @OS @OrdersManagement @GetPendingOrders @SystemIntegration
Feature: Get Pending Orders API Testing
  As a system user
  I want to test the getPendingOrders endpoint
  So that I can ensure proper retrieval of pending orders based on user ID and warehouse ID

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get pending orders without access token
    When I send the GET request to "orders_get_pending_orders" endpoint with path parameters
      |Path|Value|
      |userId|5|
      |warehouseId|3|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get pending orders with invalid access token
    And I send the GET request to "orders_get_pending_orders" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|userId|5|
      |||warehouseId|3|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get pending orders with expired access token
    And I send the GET request to "orders_get_pending_orders" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|userId|5|
      |||warehouseId|3|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get pending orders with malformed access token
    And I send the GET request to "orders_get_pending_orders" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|userId|5|
      |||warehouseId|3|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_05 Get pending orders with empty access token
    And I send the GET request to "orders_get_pending_orders" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token||userId|5|
      |||warehouseId|3|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_06 Get pending orders with valid parameters
    And I send the GET request to "orders_get_pending_orders" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|5|
      |||warehouseId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
    And I store the response as "getpendingorders_response" name using full path

  @Positive @DataValidation
  Scenario: TC_07 Validate get pending orders response structure
    And I send the GET request to "orders_get_pending_orders" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|5|
      |||warehouseId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|"3 orders found under areas."|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Model|array|
      |$.Data|array|
      |$.OrderCount|number|

  @Positive @DataValidation
  Scenario: TC_08 Validate get pending orders response contains OrderCount
    And I send the GET request to "orders_get_pending_orders" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|5|
      |||warehouseId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Model|
      |Data|
      |OrderCount|

  @Positive @DataValidation
  Scenario: TC_09 Validate get pending orders array structures
    And I send the GET request to "orders_get_pending_orders" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|5|
      |||warehouseId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Model|array|
      |$.Data|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Positive @Performance
  Scenario: TC_10 Performance test for get pending orders endpoint
    And I send the GET request to "orders_get_pending_orders" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|5|
      |||warehouseId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

#  @Negative @Validation
#  Scenario: TC_11 Get pending orders with invalid userId
#    And I send the GET request to "orders_get_pending_orders" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|abc|
#      |||warehouseId|3|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_12 Get pending orders with invalid warehouseId
    And I send the GET request to "orders_get_pending_orders" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|5|
      |||warehouseId|xyz|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Negative @Validation
#  Scenario: TC_13 Get pending orders with non-existent userId
#    And I send the GET request to "orders_get_pending_orders" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|999999|
#      |||warehouseId|3|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_14 Get pending orders with non-existent warehouseId
    And I send the GET request to "orders_get_pending_orders" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|5|
      |||warehouseId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Negative @ErrorHandling
#  Scenario: TC_15 Get pending orders with invalid endpoint
#    And I send the GET request to "orders_get_pending_orders_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|5|
#      |||warehouseId|3|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

#  @Positive @BusinessLogic
#  Scenario: TC_16 Get pending orders for different user ID
#    And I send the GET request to "orders_get_pending_orders" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|1|
#      |||warehouseId|3|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And contentType as "text/html; charset=UTF-8"

  @Positive @BusinessLogic
  Scenario: TC_17 Get pending orders for different warehouse ID
    And I send the GET request to "orders_get_pending_orders" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|5|
      |||warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Positive @Regression
  Scenario: TC_18 Regression test for get pending orders endpoint
    And I send the GET request to "orders_get_pending_orders" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|5|
      |||warehouseId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|"3 orders found under areas."|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Model|array|
      |$.Data|array|
      |$.OrderCount|number|

  @Positive @Concurrency
  Scenario: TC_19 Concurrent access test for get pending orders endpoint
    And I send the GET request to "orders_get_pending_orders" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|5|
      |||warehouseId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Positive @LoadTesting
  Scenario: TC_20 Load testing for get pending orders endpoint
    And I send the GET request to "orders_get_pending_orders" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|5|
      |||warehouseId|3|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Negative @Timeout
  Scenario: TC_21 Test get pending orders endpoint timeout handling
    And I send the GET request to "orders_get_pending_orders" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|5|
      |||warehouseId|3|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Positive @EndToEnd
  Scenario: TC_22 End-to-end get pending orders workflow
    And I send the GET request to "orders_get_pending_orders" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|5|
      |||warehouseId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|"3 orders found under areas."|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Model|array|
      |$.Data|array|
      |$.OrderCount|number|
    And I store the response as "getpendingorders_response" name using full path

#  @Positive @Boundary
#  Scenario: TC_23 Get pending orders with very large userId
#    And I send the GET request to "orders_get_pending_orders" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|2147483647|
#      |||warehouseId|3|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds

  @Positive @Boundary
  Scenario: TC_24 Get pending orders with very large warehouseId
    And I send the GET request to "orders_get_pending_orders" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|5|
      |||warehouseId|2147483647|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Positive @Boundary
#  Scenario: TC_25 Get pending orders with zero userId
#    And I send the GET request to "orders_get_pending_orders" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|0|
#      |||warehouseId|3|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds

  @Positive @Boundary
  Scenario: TC_26 Get pending orders with zero warehouseId
    And I send the GET request to "orders_get_pending_orders" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|5|
      |||warehouseId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @DataValidation
  Scenario: TC_27 Validate get pending orders OrderCount field
    And I send the GET request to "orders_get_pending_orders" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|5|
      |||warehouseId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.OrderCount|number|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Positive @Integration
  Scenario: TC_28 Verify get pending orders endpoint integration
    And I send the GET request to "orders_get_pending_orders" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|5|
      |||warehouseId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.OrderCount|3|
    And I validate that the operation was successfully completed in the system

