@BizomWebAPI @CE @OutletsManagement @GetOutletsForWarehouses @InventoryOperations
Feature: Get Outlets For Warehouses API Testing
  As a system user
  I want to test the get outlets for warehouses endpoint
  So that I can ensure warehouse outlet listings are returned accurately

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get outlets for warehouses without access token
    When I send the GET request to "outlets_get_outlets_for_warehouses" endpoint with path parameters
      |Path|Value|
      |warehouseId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_02 Get outlets for warehouses with invalid access token
#    And I send the GET request to "outlets_get_outlets_for_warehouses" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|invalid_token_12345|warehouseId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_03 Get outlets for warehouses with expired access token
#    And I send the GET request to "outlets_get_outlets_for_warehouses" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|expired_token_12345|warehouseId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_04 Get outlets for warehouses with malformed access token
#    And I send the GET request to "outlets_get_outlets_for_warehouses" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|malformed.token.here|warehouseId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#    And verify response time is less than "2500" milliseconds

#  @Positive @Smoke
#  Scenario: TC_05 Get outlets for warehouses with valid access token
#    And I send the GET request to "outlets_get_outlets_for_warehouses" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.Data[0].Outlet.id|"5312"|
#      |$.Data[0].Outlet.name|"and 13"|
#    And I store the response as "outlets_warehouses_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate outlets for warehouses response structure
    And I send the GET request to "outlets_get_outlets_for_warehouses" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|
      |$.Data[0]|object|
      |$.Data[0].Outlet|object|

#  @Positive @DataValidation
#  Scenario: TC_07 Validate outlets for warehouses specific data values
#    And I send the GET request to "outlets_get_outlets_for_warehouses" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Data[1].Outlet.id|"5344"|
#      |$.Data[1].Outlet.name|"sss"|
#      |$.Data[2].Outlet.id|"5350"|
#      |$.Data[2].Outlet.outlet_level|"cash"|
#
#  @Positive @ContentValidation
#  Scenario: TC_08 Validate outlets for warehouses content structure
#    And I send the GET request to "outlets_get_outlets_for_warehouses" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response contains the following values
#      |Value|
#      |Data|
#      |and 13|
#      |sss|
#      |cus1 oldapp|
#      |cus1 kmm|

#  @Positive @ArrayValidation
#  Scenario: TC_09 Validate outlets for warehouses array object fields
#    And I send the GET request to "outlets_get_outlets_for_warehouses" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Data[2].Outlet.latitude|string|
#      |$.Data[2].Outlet.longitude|string|
#      |$.Data[2].Outlet.ownername|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Data[2].Outlet.ownername|"sadha"|
#      |$.Data[2].Outlet.pin|"562107"|
#
#  @Positive @Performance
#  Scenario: TC_10 Performance test for outlets for warehouses endpoint
#    And I send the GET request to "outlets_get_outlets_for_warehouses" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#
#  @Positive @Concurrency
#  Scenario: TC_11 Concurrent access test for outlets for warehouses endpoint
#    And I send the GET request to "outlets_get_outlets_for_warehouses" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#
#  @Positive @LoadTesting
#  Scenario: TC_12 Load testing for outlets for warehouses endpoint
#    And I send the GET request to "outlets_get_outlets_for_warehouses" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "3000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#
#  @Positive @Regression
#  Scenario: TC_13 Regression test for outlets for warehouses endpoint
#    And I send the GET request to "outlets_get_outlets_for_warehouses" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#
#  @Positive @EndToEnd
#  Scenario: TC_14 End-to-end outlets for warehouses data retrieval workflow
#    And I send the GET request to "outlets_get_outlets_for_warehouses" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#    And I store the response as "outlets_warehouses_response" name using full path
#
#  @Negative @Validation
#  Scenario: TC_15 Get outlets for warehouses with invalid query parameters
#    And I send the GET request to "outlets_get_outlets_for_warehouses" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#      |invalid_param|invalid_value| | |
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#
#  @Negative @Validation
#  Scenario: TC_16 Get outlets for warehouses using special characters in query parameters
#    And I send the GET request to "outlets_get_outlets_for_warehouses" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#      |test_param|<script>alert('XSS')</script>| | |
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#
#  @Negative @Security
#  Scenario: TC_17 Get outlets for warehouses with SQL injection attempt
#    And I send the GET request to "outlets_get_outlets_for_warehouses" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#      |test_param|'; DROP TABLE outlets; --| | |
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|

  @Negative @Boundary
  Scenario: TC_18 Get outlets for warehouses with large warehouse identifier
    And I send the GET request to "outlets_get_outlets_for_warehouses" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|9999999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_19 Get outlets for warehouses using invalid endpoint
    And I send the GET request to "outlets_get_outlets_for_warehouses_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Users"

