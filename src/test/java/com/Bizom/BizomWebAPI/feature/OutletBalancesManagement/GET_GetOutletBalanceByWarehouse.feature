@BizomWebAPI @CE @OutletBalancesManagement @OutletBalances @GetOutletBalanceByWarehouse @SystemOperations
Feature: Outlet Balances - Get Outlet Balance By Warehouse
  Validates /outletbalances/getOutletBalanceByWarehouse endpoint responses and behaviors.

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get outlet balance by warehouse without access token
    When I send the GET request to "outletbalances_get_by_warehouse" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get outlet balance by warehouse with invalid access token
    And I send the GET request to "outletbalances_get_by_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get outlet balance by warehouse with expired access token
    And I send the GET request to "outletbalances_get_by_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get outlet balance by warehouse with malformed access token
    And I send the GET request to "outletbalances_get_by_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get outlet balance by warehouse with valid access token - No data case
    And I send the GET request to "outletbalances_get_by_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No data found.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Data|
    And I store the response as "outlet_balance_by_warehouse_response" name using full path

  @Positive @Performance
  Scenario: TC_06 Performance test for outlet balance by warehouse endpoint
    And I send the GET request to "outletbalances_get_by_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No data found.|

  @Positive @Headers
  Scenario: TC_07 Validate response key presence for outlet balance by warehouse
    And I send the GET request to "outletbalances_get_by_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Data|
    And verify response time is less than "2500" milliseconds

  @Positive @DataValidation
  Scenario: TC_08 Validate response structure and types for outlet balance by warehouse
    And I send the GET request to "outletbalances_get_by_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No data found.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|

  @Positive @Regression
  Scenario: TC_09 Regression check for outlet balance by warehouse endpoint
    And I send the GET request to "outletbalances_get_by_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No data found.|

  @Positive @Idempotency
  Scenario: TC_10 Consistent response on consecutive calls for outlet balance by warehouse
    And I send the GET request to "outletbalances_get_by_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No data found.|
    And I store the response as "outlet_balance_by_wh_first" name using full path
    And I send the GET request to "outletbalances_get_by_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No data found.|

#  @Negative @ErrorHandling
#  Scenario: TC_11 Invalid endpoint path should return not found
#    And I send the GET request to "outletbalances_get_by_warehouse_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_12 Get outlet balance by warehouse with additional unknown query param
    And I send the GET request to "outletbalances_get_by_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |unknown_param|unknown_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No data found.|

  @Negative @Validation
  Scenario: TC_13 Get outlet balance by warehouse with special characters in query parameters
    And I send the GET request to "outletbalances_get_by_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No data found.|

  @Negative @Security
  Scenario: TC_14 Get outlet balance by warehouse with SQL injection attempt
    And I send the GET request to "outletbalances_get_by_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE outlets; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No data found.|

  @Negative @Boundary
  Scenario: TC_15 Get outlet balance by warehouse with maximum query parameters
    And I send the GET request to "outletbalances_get_by_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No data found.|

  @Positive @LoadTesting
  Scenario: TC_16 Load testing for outlet balance by warehouse endpoint
    And I send the GET request to "outletbalances_get_by_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No data found.|


