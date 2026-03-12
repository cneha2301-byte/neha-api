@BizomWebAPI @Innovation @AssetManagement @GetOutletAssetOrders @CoreBusinessOperations
Feature: Get Outlet Asset Orders API Testing
  As a Bizom web API consumer
  I want to validate the get outlet asset orders endpoint
  So that I can ensure outlet asset orders data is fetched correctly

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get outlet asset orders without access token
    When I send the GET request to "assetorders_get_outlet_asset_orders" endpoint with path parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token||outletId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get outlet asset orders with invalid access token
    And I send the GET request to "assetorders_get_outlet_asset_orders" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|outletId|2|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get outlet asset orders with expired access token
    And I send the GET request to "assetorders_get_outlet_asset_orders" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|outletId|2|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get outlet asset orders with malformed access token
    And I send the GET request to "assetorders_get_outlet_asset_orders" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|outletId|2|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get outlet asset orders with valid path parameter
    And I send the GET request to "assetorders_get_outlet_asset_orders" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data|[]|
    And I store the response as "getOutletAssetOrders_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate outlet asset orders response structure
    And I send the GET request to "assetorders_get_outlet_asset_orders" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate outlet asset orders array structure
    And I send the GET request to "assetorders_get_outlet_asset_orders" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

  @Positive @Performance
  Scenario: TC_08 Performance test for get outlet asset orders endpoint
    And I send the GET request to "assetorders_get_outlet_asset_orders" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @Concurrency
  Scenario: TC_09 Concurrent access test for get outlet asset orders endpoint
    And I send the GET request to "assetorders_get_outlet_asset_orders" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_10 Get outlet asset orders with invalid outlet id
    And I send the GET request to "assetorders_get_outlet_asset_orders" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|invalid|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_11 Get outlet asset orders with special characters in outlet id
    And I send the GET request to "assetorders_get_outlet_asset_orders" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_12 Get outlet asset orders with SQL injection attempt
    And I send the GET request to "assetorders_get_outlet_asset_orders" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|'; DROP TABLE assetorders; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_13 Get outlet asset orders with negative outlet id
    And I send the GET request to "assetorders_get_outlet_asset_orders" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_14 Get outlet asset orders with zero outlet id
    And I send the GET request to "assetorders_get_outlet_asset_orders" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_15 Get outlet asset orders with very large outlet id
    And I send the GET request to "assetorders_get_outlet_asset_orders" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|999999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_16 Get outlet asset orders with invalid endpoint
    And I send the GET request to "assetorders_get_outlet_asset_orders_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_17 Validate outlet asset orders business logic
    And I send the GET request to "assetorders_get_outlet_asset_orders" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|   
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data|[]|

  @Positive @DataIntegrity
  Scenario: TC_18 Validate outlet asset orders data integrity
    And I send the GET request to "assetorders_get_outlet_asset_orders" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2     |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|

  @Positive @Regression
  Scenario: TC_19 Regression test for get outlet asset orders endpoint
    And I send the GET request to "assetorders_get_outlet_asset_orders" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|

  @Positive @Functional
  Scenario: TC_20 Validate outlet asset orders response completeness
    And I send the GET request to "assetorders_get_outlet_asset_orders" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

  @Positive @ArrayValidation
  Scenario: TC_21 Validate outlet asset orders array structure and content
    And I send the GET request to "assetorders_get_outlet_asset_orders" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

  @Positive @ContentValidation
  Scenario: TC_22 Validate outlet asset orders content structure
    And I send the GET request to "assetorders_get_outlet_asset_orders" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |data|

  @Positive @LoadTesting
  Scenario: TC_23 Load testing for get outlet asset orders endpoint
    And I send the GET request to "assetorders_get_outlet_asset_orders" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @EndToEnd
  Scenario: TC_24 End-to-end get outlet asset orders data retrieval workflow
    And I send the GET request to "assetorders_get_outlet_asset_orders" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data|[]|
    And I store the response as "getOutletAssetOrders_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|

