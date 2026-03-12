@BizomWebAPI @CE @OutletsManagement @GetOutletsAndChildOutlet @InventoryOperations
Feature: Get Outlet And Child Outlet API Testing
  As a system user
  I want to test the get outlet and child outlet endpoint
  So that I can ensure proper functionality and data retrieval for outlet and its child outlets by order ID

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get outlet and child outlet without access token
    When I send the GET request to "outlets_get_outlet_and_child_outlet" endpoint with path parameters
      |Path|Value|
      |orderId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: TC_02 Get outlet and child outlet with invalid access token
#    And I send the GET request to "outlets_get_outlet_and_child_outlet" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|invalid_token_12345|orderId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: TC_03 Get outlet and child outlet with expired access token
#    And I send the GET request to "outlets_get_outlet_and_child_outlet" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|expired_token_12345|orderId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: TC_04 Get outlet and child outlet with malformed access token
#    And I send the GET request to "outlets_get_outlet_and_child_outlet" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|malformed.token.here|orderId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get outlet and child outlet for order ID 1 with valid access token
    And I send the GET request to "outlets_get_outlet_and_child_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|
      |$.Data.panno|string|
      |$.Data.id|string|
      |$.Data.outletdata|object|
      |$.Data.outletdata.id|string|
      |$.Data.outletdata.name|string|
      |$.Data.customoutletdata|array|
      |$.Data.childOutlets|array|
      |$.Data.isEntitylimitationEnabled|boolean|

  @Positive @DataValidation
  Scenario: TC_06 Validate response fields for order ID 1
    And I send the GET request to "outlets_get_outlet_and_child_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Data.id|"1"|
      |$.Data.panno|"4321"|
      |$.Data.outletdata.id|"1"|
      |$.Data.outletdata.name|SLV Traders|
      |$.Data.customoutletdata|[]|
      |$.Data.childOutlets|[]|

  @Positive @DataValidation @DatabaseValidation
  Scenario: TC_07 Validate outlet data against database for order ID 1
    And I send the GET request to "outlets_get_outlet_and_child_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Data.outletdata.name|DB:outlets:name: id=1|

  @Negative @Validation
  Scenario: TC_08 Get outlet and child outlet with invalid order ID
    And I send the GET request to "outlets_get_outlet_and_child_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: TC_09 Get outlet and child outlet with non-existent order ID
    And I send the GET request to "outlets_get_outlet_and_child_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_10 Get outlet and child outlet with invalid endpoint
    And I send the GET request to "outlets_get_outlet_and_child_outlet_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: TC_11 Performance test for get outlet and child outlet endpoint
    And I send the GET request to "outlets_get_outlet_and_child_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Regression
  Scenario: TC_12 Regression test for get outlet and child outlet endpoint
    And I send the GET request to "outlets_get_outlet_and_child_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Positive @Functional
  Scenario: TC_13 Validate essential fields and types for order ID 1
    And I send the GET request to "outlets_get_outlet_and_child_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|
      |$.Data.id|string|
      |$.Data.panno|string|
      |$.Data.outletdata|object|
      |$.Data.outletdata.id|string|
      |$.Data.outletdata.name|string|
      |$.Data.customoutletdata|array|
      |$.Data.childOutlets|array|
      |$.Data.isEntitylimitationEnabled|boolean|
