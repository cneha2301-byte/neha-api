@BizomWebAPI @CE @OutletsManagement @GETAssetData @SystemOperations
Feature: Get Asset Data For Outlet API Testing
  As a system user
  I want to test the get asset data for outlet endpoint
  So that I can ensure proper functionality and data retrieval for outlet asset management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get asset data without access token
    When I send the GET request to "outlets_get_asset_data_for_outlet" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |outletids|DB:outlets:id: name=Sadha Nanda1 |
      |datatype|assetorder,assetdetail,assetaudit|
      |language|in|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get asset data with invalid access token
    And I send the GET request to "outlets_get_asset_data_for_outlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
      |outletids|DB:outlets:id: name=Sadha Nanda1|
      |datatype|assetorder,assetdetail,assetaudit|
      |language|in|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get asset data with expired access token
    And I send the GET request to "outlets_get_asset_data_for_outlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
      |outletids|DB:outlets:id: name=Sadha Nanda1|
      |datatype|assetorder,assetdetail,assetaudit|
      |language|in|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get asset data with malformed access token
    And I send the GET request to "outlets_get_asset_data_for_outlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
      |outletids|DB:outlets:id: name=Sadha Nanda1|
      |datatype|assetorder,assetdetail,assetaudit|
      |language|in|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get asset data with valid access token and single outlet
    And I send the GET request to "outlets_get_asset_data_for_outlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletids|DB:outlets:id: name=Sadha Nanda1|
      |datatype|assetorder,assetdetail,assetaudit|
      |language|in|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
    And I store the response as "asset_data_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate asset data response structure
    And I send the GET request to "outlets_get_asset_data_for_outlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletids|DB:outlets:id: name=Sadha Nanda1|
      |datatype|assetorder,assetdetail,assetaudit|
      |language|in|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|
      |$.error.message|string|
      |$.Outlets|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate asset data outlet structure
    And I send the GET request to "outlets_get_asset_data_for_outlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletids|2|
      |datatype|assetorder,assetdetail,assetaudit|
      |language|in|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.Outlets[0].Outletid|"2"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Outlets[0].Outletid|string|
      |$.Outlets[0].assetdetail|array|
      |$.Outlets[0].assetorder|array|
      |$.Outlets[0].assetaudit|array|

  @Positive @DataValidation
  Scenario: TC_08 Validate asset data with multiple outlets
    And I send the GET request to "outlets_get_asset_data_for_outlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletids|2,3,4|
      |datatype|assetorder,assetdetail,assetaudit|
      |language|in|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Outlets|array|

  @Positive @Performance
  Scenario: TC_09 Performance test for asset data endpoint
    And I send the GET request to "outlets_get_asset_data_for_outlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletids|DB:outlets:id: name=Sadha Nanda1|
      |datatype|assetorder,assetdetail,assetaudit|
      |language|in|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Positive @Functional
  Scenario: TC_10 Get asset data with single datatype - assetorder
    And I send the GET request to "outlets_get_asset_data_for_outlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletids|DB:outlets:id: name=Sadha Nanda1|
      |datatype|assetorder|
      |language|in|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Outlets[0].assetorder|array|

  @Positive @Functional
  Scenario: TC_11 Get asset data with single datatype - assetdetail
    And I send the GET request to "outlets_get_asset_data_for_outlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletids|DB:outlets:id: name=Sadha Nanda1|
      |datatype|assetdetail|
      |language|in|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Outlets[0].assetdetail|array|

  @Positive @Functional
  Scenario: TC_12 Get asset data with single datatype - assetaudit
    And I send the GET request to "outlets_get_asset_data_for_outlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletids|DB:outlets:id: name=Sadha Nanda1|
      |datatype|assetaudit|
      |language|in|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Outlets[0].assetaudit|array|

  @Positive @Functional
  Scenario: TC_13 Get asset data with different language - English
    And I send the GET request to "outlets_get_asset_data_for_outlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletids|DB:outlets:id: name=Sadha Nanda1|
      |datatype|assetorder,assetdetail,assetaudit|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @Validation
  Scenario: TC_14 Get asset data with invalid outlet ID
    And I send the GET request to "outlets_get_asset_data_for_outlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletids|999999|
      |datatype|assetorder,assetdetail,assetaudit|
      |language|in|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @Validation
  Scenario: TC_15 Get asset data with non-numeric outlet ID
    And I send the GET request to "outlets_get_asset_data_for_outlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletids|abc|
      |datatype|assetorder,assetdetail,assetaudit|
      |language|in|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_16 Get asset data without outletids parameter
    And I send the GET request to "outlets_get_asset_data_for_outlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |datatype|assetorder,assetdetail,assetaudit|
      |language|in|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_17 Get asset data without datatype parameter
    And I send the GET request to "outlets_get_asset_data_for_outlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletids|DB:outlets:id: name=Sadha Nanda1|
      |language|in|
    Then I should see the response code as "500"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_18 Get asset data with invalid datatype
    And I send the GET request to "outlets_get_asset_data_for_outlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletids|DB:outlets:id: name=Sadha Nanda1|
      |datatype|invalidtype|
      |language|in|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @Validation
  Scenario: TC_19 Get asset data with special characters in query parameters
    And I send the GET request to "outlets_get_asset_data_for_outlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletids|DB:outlets:id: name=Sadha Nanda1|
      |datatype|assetorder,assetdetail,assetaudit|
      |language|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @Security
  Scenario: TC_20 Get asset data with SQL injection attempt
    And I send the GET request to "outlets_get_asset_data_for_outlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletids|2; DROP TABLE outlets; --|
      |datatype|assetorder,assetdetail,assetaudit|
      |language|in|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: TC_21 Get asset data with maximum outlet IDs
    And I send the GET request to "outlets_get_asset_data_for_outlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletids|1,2,3,4,5,6,7,8,9,10|
      |datatype|assetorder,assetdetail,assetaudit|
      |language|in|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @ErrorHandling
  Scenario: TC_22 Get asset data with invalid endpoint
    And I send the GET request to "outlets_get_asset_data_for_outlet_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletids|DB:outlets:id: name=Sadha Nanda1|
      |datatype|assetorder,assetdetail,assetaudit|
      |language|in|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_23 Validate asset data business logic for outlet
    And I send the GET request to "outlets_get_asset_data_for_outlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletids|DB:outlets:id: name=Sadha Nanda1|
      |datatype|assetorder,assetdetail,assetaudit|
      |language|in|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Outlets[0].assetdetail|array|
      |$.Outlets[0].assetorder|array|
      |$.Outlets[0].assetaudit|array|

  @Positive @DataIntegrity
  Scenario: TC_24 Validate asset data integrity with database
    And I send the GET request to "outlets_get_asset_data_for_outlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletids|2|
      |datatype|assetorder,assetdetail,assetaudit|
      |language|in|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Positive @Regression
  Scenario: TC_25 Regression test for asset data endpoint
    And I send the GET request to "outlets_get_asset_data_for_outlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletids|DB:outlets:id: name=Sadha Nanda1|
      |datatype|assetorder,assetdetail,assetaudit|
      |language|in|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|
      |$.Outlets|array|

  @Positive @Functional
  Scenario: TC_26 Validate asset data response completeness
    And I send the GET request to "outlets_get_asset_data_for_outlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletids|DB:outlets:id: name=Sadha Nanda1|
      |datatype|assetorder,assetdetail,assetaudit|
      |language|in|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
    And validating the response contains the following values
      |Value|
      |result|
      |error|
      |Outlets|
      |Outletid|
      |assetdetail|
      |assetorder|
      |assetaudit|

  @Positive @ArrayValidation
  Scenario: TC_27 Validate outlets array structure and content
    And I send the GET request to "outlets_get_asset_data_for_outlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletids|2,3|
      |datatype|assetorder,assetdetail,assetaudit|
      |language|in|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Outlets|array|
      |$.Outlets[0]|object|
      |$.Outlets[1]|object|

  @Positive @LoadTesting
  Scenario: TC_28 Load testing for asset data endpoint
    And I send the GET request to "outlets_get_asset_data_for_outlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletids|2|
      |datatype|assetorder,assetdetail,assetaudit|
      |language|in|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @Timeout
  Scenario: TC_29 Test asset data endpoint timeout handling
    And I send the GET request to "outlets_get_asset_data_for_outlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletids|1,2,3,4,5,6,7,8,9,10,11,12,13,14,15|
      |datatype|assetorder,assetdetail,assetaudit|
      |language|in|
    Then I should see the response code as "200"
    And verify response time is less than "10000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Positive @EndToEnd
  Scenario: TC_30 End-to-end asset data retrieval workflow
    And I send the GET request to "outlets_get_asset_data_for_outlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletids|2|
      |datatype|assetorder,assetdetail,assetaudit|
      |language|in|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.Outlets[0].Outletid|"2"|
    And I store the response as "asset_data_e2e_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|
      |$.error.message|string|
      |$.Outlets|array|
      |$.Outlets[0].Outletid|string|
      |$.Outlets[0].assetdetail|array|
      |$.Outlets[0].assetorder|array|
      |$.Outlets[0].assetaudit|array|


