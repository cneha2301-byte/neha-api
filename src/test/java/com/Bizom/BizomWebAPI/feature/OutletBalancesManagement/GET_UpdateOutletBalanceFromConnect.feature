@BizomWebAPI @CE @OutletBalancesManagement @OutletBalances @UpdateOutletBalanceFromConnect @SystemOperations
Feature: Outlet Balances - Update Outlet Balance From Connect
  Validates /outletbalances/updateOutletBalanceFromConnect endpoint responses and behaviors.

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Update outlet balance from connect without access token
    When I send the GET request to "outletbalances_update_from_connect" endpoint
    Then I should see the response code as "200"
     And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Update outlet balance from connect with invalid access token
    And I send the GET request to "outletbalances_update_from_connect" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Update outlet balance from connect with expired access token
    And I send the GET request to "outletbalances_update_from_connect" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Update outlet balance from connect with malformed access token
    And I send the GET request to "outletbalances_update_from_connect" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Update outlet balance from connect with valid access token
    And I send the GET request to "outletbalances_update_from_connect" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|array|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
    And I store the response as "update_outlet_balance_from_connect_response" name using full path

  @Positive @Performance
  Scenario: TC_06 Performance test for update outlet balance from connect endpoint
    And I send the GET request to "outletbalances_update_from_connect" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @Headers
  Scenario: TC_07 Validate response key presence for update outlet balance from connect
    And I send the GET request to "outletbalances_update_from_connect" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
    And verify response time is less than "2500" milliseconds

  @Positive @DataValidation
  Scenario: TC_08 Validate response structure and types for update outlet balance from connect
    And I send the GET request to "outletbalances_update_from_connect" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|array|

  @Positive @Regression
  Scenario: TC_09 Regression check for update outlet balance from connect endpoint
    And I send the GET request to "outletbalances_update_from_connect" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @Idempotency
  Scenario: TC_10 Consistent response on consecutive calls for update outlet balance from connect
    And I send the GET request to "outletbalances_update_from_connect" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And I store the response as "update_outlet_balance_from_connect_first" name using full path
    And I send the GET request to "outletbalances_update_from_connect" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

#  @Negative @ErrorHandling
#  Scenario: TC_11 Invalid endpoint path should return not found for update outlet balance from connect
#    And I send the GET request to "outletbalances_update_from_connect_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_12 Update outlet balance from connect with additional unknown query param
    And I send the GET request to "outletbalances_update_from_connect" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |unknown_param|unknown_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_13 Update outlet balance from connect with special characters in query parameters
    And I send the GET request to "outletbalances_update_from_connect" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Security
  Scenario: TC_14 Update outlet balance from connect with SQL injection attempt
    And I send the GET request to "outletbalances_update_from_connect" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE outlets; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Boundary
  Scenario: TC_15 Update outlet balance from connect with maximum query parameters
    And I send the GET request to "outletbalances_update_from_connect" endpoint with dynamic access token and query parameters
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
      |$.Result|true|

  @Positive @LoadTesting
  Scenario: TC_16 Load testing for update outlet balance from connect endpoint
    And I send the GET request to "outletbalances_update_from_connect" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|


