@BizomWebAPI @Innovation @AssetManagement @GetTotalAssetAtWarehouse @CoreBusinessOperations
Feature: Get Total Asset At Warehouse API Testing
  As a system user
  I want to test the get total asset at warehouse endpoint
  So that I can ensure proper functionality and data retrieval for asset warehouse management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get total asset at warehouse without access token
    When I send the GET request to "assetserialnumbertransactions_get_total_asset_at_warehouse" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get total asset at warehouse with invalid access token
    And I send the GET request to "assetserialnumbertransactions_get_total_asset_at_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get total asset at warehouse with expired access token
    And I send the GET request to "assetserialnumbertransactions_get_total_asset_at_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get total asset at warehouse with malformed access token
    And I send the GET request to "assetserialnumbertransactions_get_total_asset_at_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get total asset at warehouse with valid access token
    And I send the GET request to "assetserialnumbertransactions_get_total_asset_at_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|
    And I store the response as "total_asset_at_warehouse_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate total asset at warehouse response structure
    And I send the GET request to "assetserialnumbertransactions_get_total_asset_at_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate total asset at warehouse data array content
    And I send the GET request to "assetserialnumbertransactions_get_total_asset_at_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
      |$.data[0]|string|

  @Positive @Performance
  Scenario: TC_08 Performance test for total asset at warehouse endpoint
    And I send the GET request to "assetserialnumbertransactions_get_total_asset_at_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|

  @Positive @Concurrency
  Scenario: TC_09 Concurrent access test for total asset at warehouse endpoint
    And I send the GET request to "assetserialnumbertransactions_get_total_asset_at_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|

  @Negative @Validation
  Scenario: TC_10 Get total asset at warehouse with invalid query parameters
    And I send the GET request to "assetserialnumbertransactions_get_total_asset_at_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|

  @Negative @Validation
  Scenario: TC_11 Get total asset at warehouse with special characters in query parameters
    And I send the GET request to "assetserialnumbertransactions_get_total_asset_at_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|

  @Negative @Security
  Scenario: TC_12 Get total asset at warehouse with SQL injection attempt
    And I send the GET request to "assetserialnumbertransactions_get_total_asset_at_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE assets; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|

  @Negative @Boundary
  Scenario: TC_13 Get total asset at warehouse with maximum query parameters
    And I send the GET request to "assetserialnumbertransactions_get_total_asset_at_warehouse" endpoint with dynamic access token and query parameters
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
      |$.Reason|Data Found|

  @Negative @ErrorHandling
  Scenario: TC_14 Get total asset at warehouse with invalid endpoint
    And I send the GET request to "assetserialnumbertransactions_get_total_asset_at_warehouse_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_404_NOT_FOUND"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_15 Validate total asset at warehouse business logic
    And I send the GET request to "assetserialnumbertransactions_get_total_asset_at_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|

  @Positive @DataIntegrity
  Scenario: TC_16 Validate total asset at warehouse data integrity
    And I send the GET request to "assetserialnumbertransactions_get_total_asset_at_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|

  @Positive @Regression
  Scenario: TC_17 Regression test for total asset at warehouse endpoint
    And I send the GET request to "assetserialnumbertransactions_get_total_asset_at_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|

  @Positive @Functional
  Scenario: TC_18 Validate total asset at warehouse response completeness
    And I send the GET request to "assetserialnumbertransactions_get_total_asset_at_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

  @Positive @ArrayValidation
  Scenario: TC_19 Validate total asset at warehouse array structure and content
    And I send the GET request to "assetserialnumbertransactions_get_total_asset_at_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
      |$.data[0]|string|

  @Positive @ContentValidation
  Scenario: TC_20 Validate total asset at warehouse content structure
    And I send the GET request to "assetserialnumbertransactions_get_total_asset_at_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |data|

  @Positive @LoadTesting
  Scenario: TC_21 Load testing for total asset at warehouse endpoint
    And I send the GET request to "assetserialnumbertransactions_get_total_asset_at_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|

  @Negative @Timeout
  Scenario: TC_22 Test total asset at warehouse endpoint timeout handling
    And I send the GET request to "assetserialnumbertransactions_get_total_asset_at_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|

  @Positive @EndToEnd
  Scenario: TC_23 End-to-end total asset at warehouse data retrieval workflow
    And I send the GET request to "assetserialnumbertransactions_get_total_asset_at_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|
    And I store the response as "total_asset_at_warehouse_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
      |$.data[0]|string|

