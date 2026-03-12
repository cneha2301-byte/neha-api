@BizomWebAPI @CompaniesManagement @GetOutletsData @SupportingFunctions @CE
#This API have notice in Responce so for a time being we are not testing this API
Feature: Get Outlets Data API Testing
  As a system user
  I want to test the get outlets data endpoint
  So that I can ensure proper functionality and data retrieval for outlets data

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get outlets data without access token
    When I send the GET request to "companies_getoutletsdata" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get outlets data with invalid access token
    And I send the GET request to "companies_getoutletsdata" endpoint with dynamic access token and query parameters
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
  Scenario: TC_03 Get outlets data with expired access token
    And I send the GET request to "companies_getoutletsdata" endpoint with dynamic access token and query parameters
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
  Scenario: TC_04 Get outlets data with malformed access token
    And I send the GET request to "companies_getoutletsdata" endpoint with dynamic access token and query parameters
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
  Scenario: TC_05 Get outlets data with valid access token
    And I send the GET request to "companies_getoutletsdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
    And I store the response as "outlets_data_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate outlets data response structure
    And I send the GET request to "companies_getoutletsdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.outletData|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate outlet data array structure
    And I send the GET request to "companies_getoutletsdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.outletData|array|
      |$.outletData[0]|object|
      |$.outletData[0].Outletview|object|

  @Positive @DataValidation
  Scenario: TC_08 Validate Outletview object structure
    And I send the GET request to "companies_getoutletsdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.outletData[0].Outletview.id|string|
      |$.outletData[0].Outletview.longitude|string|
      |$.outletData[0].Outletview.latitude|string|
      |$.outletData[0].Outletview.Name|string|
      |$.outletData[0].Outletview.Address|string|
      |$.outletData[0].Outletview.created|string|
      |$.outletData[0].Outletview.phoneno|string|
      |$.outletData[0].Outletview.Warehouse_Name|string|

  @Positive @DataValidation
  Scenario: TC_09 Validate Outletview optional fields
    And I send the GET request to "companies_getoutletsdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.outletData[0].Outletview.OutletType|string|
      |$.outletData[0].Outletview.Mobile|string|
      |$.outletData[0].Outletview.type|string|
      |$.outletData[0].Outletview.Area|string|
      |$.outletData[0].Outletview.areaid|string|

  @Positive @Performance
  Scenario: TC_10 Performance test for outlets data endpoint
    And I send the GET request to "companies_getoutletsdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Positive @Concurrency
  Scenario: TC_11 Concurrent access test for outlets data endpoint
    And I send the GET request to "companies_getoutletsdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @Validation
  Scenario: TC_12 Get outlets data with invalid query parameters
    And I send the GET request to "companies_getoutletsdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @Validation
  Scenario: TC_13 Get outlets data with special characters in query parameters
    And I send the GET request to "companies_getoutletsdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @Security
  Scenario: TC_14 Get outlets data with SQL injection attempt
    And I send the GET request to "companies_getoutletsdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE outlets; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @Boundary
  Scenario: TC_15 Get outlets data with maximum query parameters
    And I send the GET request to "companies_getoutletsdata" endpoint with dynamic access token and query parameters
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
      |$.result|true|

  @Negative @ErrorHandling
  Scenario: TC_16 Get outlets data with invalid endpoint
    And I send the GET request to "companies_getoutletsdata_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_17 Validate outlets data business logic
    And I send the GET request to "companies_getoutletsdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.outletData|array|

  @Positive @DataIntegrity
  Scenario: TC_18 Validate outlets data integrity
    And I send the GET request to "companies_getoutletsdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.outletData|array|
      |$.outletData[0].Outletview|object|
      |$.outletData[0].Outletview.id|string|
      |$.outletData[0].Outletview.Name|string|

  @Positive @Regression
  Scenario: TC_19 Regression test for outlets data endpoint
    And I send the GET request to "companies_getoutletsdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.outletData|array|
      |$.outletData[0].Outletview|object|

  @Positive @Functional
  Scenario: TC_20 Validate outlets data response completeness
    And I send the GET request to "companies_getoutletsdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.outletData|array|
      |$.outletData[0].Outletview|object|
      |$.outletData[0].Outletview.id|string|
      |$.outletData[0].Outletview.longitude|string|
      |$.outletData[0].Outletview.latitude|string|
      |$.outletData[0].Outletview.Name|string|
      |$.outletData[0].Outletview.Address|string|
      |$.outletData[0].Outletview.Warehouse_Name|string|

  @Positive @ArrayValidation
  Scenario: TC_21 Validate outlets data array structure and content
    And I send the GET request to "companies_getoutletsdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.outletData|array|
      |$.outletData[0]|object|
      |$.outletData[0].Outletview|object|
      |$.outletData[0].Outletview.id|string|
      |$.outletData[0].Outletview.Name|string|

  @Positive @ContentValidation
  Scenario: TC_22 Validate outlets data content structure
    And I send the GET request to "companies_getoutletsdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
    And validating the response contains the following values
      |Value|
      |result|
      |outletData|
      |Outletview|

  @Positive @LoadTesting
  Scenario: TC_23 Load testing for outlets data endpoint
    And I send the GET request to "companies_getoutletsdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @Timeout
  Scenario: TC_24 Test outlets data endpoint timeout handling
    And I send the GET request to "companies_getoutletsdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Positive @EndToEnd
  Scenario: TC_25 End-to-end outlets data retrieval workflow
    And I send the GET request to "companies_getoutletsdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
    And I store the response as "outlets_data_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.outletData|array|
      |$.outletData[0]|object|
      |$.outletData[0].Outletview|object|
      |$.outletData[0].Outletview.id|string|
      |$.outletData[0].Outletview.longitude|string|
      |$.outletData[0].Outletview.latitude|string|
      |$.outletData[0].Outletview.Name|string|
      |$.outletData[0].Outletview.Address|string|
      |$.outletData[0].Outletview.created|string|
      |$.outletData[0].Outletview.phoneno|string|
      |$.outletData[0].Outletview.Warehouse_Name|string|

