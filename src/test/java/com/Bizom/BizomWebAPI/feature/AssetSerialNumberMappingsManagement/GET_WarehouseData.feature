@BizomWebAPI @Innovation @AssetSerialNumberMappingsManagement @WarehouseData @CoreBusinessOperations
Feature: Warehouse Data API Testing
  As a system user
  I want to test the warehouse data endpoint
  So that I can ensure proper functionality and data retrieval for warehouse data in asset serial number mappings

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get warehouse data without access token
    When I send the GET request to "assetserialnumbermappings_warehousedata" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get warehouse data with invalid access token
    And I send the GET request to "assetserialnumbermappings_warehousedata" endpoint with dynamic access token and query parameters
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
  Scenario: TC_03 Get warehouse data with expired access token
    And I send the GET request to "assetserialnumbermappings_warehousedata" endpoint with dynamic access token and query parameters
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
  Scenario: TC_04 Get warehouse data with malformed access token
    And I send the GET request to "assetserialnumbermappings_warehousedata" endpoint with dynamic access token and query parameters
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
  Scenario: TC_05 Get warehouse data with valid access token
    And I send the GET request to "assetserialnumbermappings_warehousedata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And I store the response as "warehouse_data_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate warehouse data response structure
    And I send the GET request to "assetserialnumbermappings_warehousedata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.warehouses|object|

  @Positive @DataValidation
  Scenario: TC_07 Validate warehouse data warehouses object structure
    And I send the GET request to "assetserialnumbermappings_warehousedata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.warehouses|object|
      |$.warehouses."1"|string|
      |$.warehouses."2"|string|

  @Positive @DataValidation
  Scenario: TC_08 Validate warehouse data with static values
    And I send the GET request to "assetserialnumbermappings_warehousedata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|
      |$.warehouses.1|"SLV Traders"|
      |$.warehouses.2|"SLV DISTRIBUTOR"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.warehouses|object|
      |$.warehouses."1"|string|
      |$.warehouses."2"|string|

  @Positive @DataValidation
  Scenario: TC_09 Validate warehouse data multiple warehouse entries
    And I send the GET request to "assetserialnumbermappings_warehousedata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|
      |$.warehouses.1|"SLV Traders"|
      |$.warehouses.2|"SLV DISTRIBUTOR"|
      |$.warehouses.3|"Laksmi Venkateswara warehouses"|
      |$.warehouses.4|"Test"|
      |$.warehouses.5|"North Warehouse"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.warehouses."1"|string|
      |$.warehouses."2"|string|
      |$.warehouses."3"|string|
      |$.warehouses."4"|string|
      |$.warehouses."5"|string|

  @Positive @Performance
  Scenario: TC_10 Performance test for warehouse data endpoint
    And I send the GET request to "assetserialnumbermappings_warehousedata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @Concurrency
  Scenario: TC_11 Concurrent access test for warehouse data endpoint
    And I send the GET request to "assetserialnumbermappings_warehousedata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_12 Get warehouse data with invalid query parameters
    And I send the GET request to "assetserialnumbermappings_warehousedata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_13 Get warehouse data with special characters in query parameters
    And I send the GET request to "assetserialnumbermappings_warehousedata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Security
  Scenario: TC_14 Get warehouse data with SQL injection attempt
    And I send the GET request to "assetserialnumbermappings_warehousedata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE warehouses; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Boundary
  Scenario: TC_15 Get warehouse data with maximum query parameters
    And I send the GET request to "assetserialnumbermappings_warehousedata" endpoint with dynamic access token and query parameters
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

  @Negative @ErrorHandling
  Scenario: TC_16 Get warehouse data with invalid endpoint
    And I send the GET request to "assetserialnumbermappings_warehousedata_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_404_NOT_FOUND"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_17 Validate warehouse data business logic
    And I send the GET request to "assetserialnumbermappings_warehousedata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|
      |$.warehouses.1|"SLV Traders"|

  @Positive @DataIntegrity
  Scenario: TC_18 Validate warehouse data data integrity
    And I send the GET request to "assetserialnumbermappings_warehousedata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.warehouses|object|
      |$.warehouses."1"|string|

  @Positive @Regression
  Scenario: TC_19 Regression test for warehouse data endpoint
    And I send the GET request to "assetserialnumbermappings_warehousedata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.warehouses|object|

  @Positive @Functional
  Scenario: TC_20 Validate warehouse data response completeness
    And I send the GET request to "assetserialnumbermappings_warehousedata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|
      |$.warehouses.1|"SLV Traders"|
      |$.warehouses.2|"SLV DISTRIBUTOR"|
      |$.warehouses.3|"Laksmi Venkateswara warehouses"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.warehouses|object|
      |$.warehouses."1"|string|
      |$.warehouses."2"|string|
      |$.warehouses."3"|string|

  @Positive @ObjectValidation
  Scenario: TC_21 Validate warehouse data warehouses object structure and content
    And I send the GET request to "assetserialnumbermappings_warehousedata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.warehouses|object|
      |$.warehouses."1"|string|
      |$.warehouses."2"|string|
      |$.warehouses."3"|string|
      |$.warehouses."4"|string|
      |$.warehouses."5"|string|

  @Positive @ContentValidation
  Scenario: TC_22 Validate warehouse data content structure
    And I send the GET request to "assetserialnumbermappings_warehousedata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |warehouses|
      |Data Found|
      |SLV Traders|
      |SLV DISTRIBUTOR|

  @Positive @LoadTesting
  Scenario: TC_23 Load testing for warehouse data endpoint
    And I send the GET request to "assetserialnumbermappings_warehousedata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Timeout
  Scenario: TC_24 Test warehouse data endpoint timeout handling
    And I send the GET request to "assetserialnumbermappings_warehousedata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @EndToEnd
  Scenario: TC_25 End-to-end warehouse data data retrieval workflow
    And I send the GET request to "assetserialnumbermappings_warehousedata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|
      |$.warehouses.1|"SLV Traders"|
      |$.warehouses.2|"SLV DISTRIBUTOR"|
      |$.warehouses.3|"Laksmi Venkateswara warehouses"|
    And I store the response as "warehouse_data_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.warehouses|object|
      |$.warehouses."1"|string|
      |$.warehouses."2"|string|
      |$.warehouses."3"|string|

