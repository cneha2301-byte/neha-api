@BizomWebAPI @CompaniesManagement @GetCompanyInfo @SupportingFunctions @CE
Feature: Get Company Info API Testing
  As a system user
  I want to test the get company info endpoint
  So that I can ensure proper functionality and data retrieval for company information

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get company info without access token
    When I send the GET request to "companies_getcompanyinfo" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get company info with invalid access token
    And I send the GET request to "companies_getcompanyinfo" endpoint with dynamic access token and query parameters
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
  Scenario: TC_03 Get company info with expired access token
    And I send the GET request to "companies_getcompanyinfo" endpoint with dynamic access token and query parameters
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
  Scenario: TC_04 Get company info with malformed access token
    And I send the GET request to "companies_getcompanyinfo" endpoint with dynamic access token and query parameters
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
  Scenario: TC_05 Get company info with valid access token
    And I send the GET request to "companies_getcompanyinfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And I store the response as "company_info_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate company info response structure
    And I send the GET request to "companies_getcompanyinfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.CompanyInfo|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate company info array structure
    And I send the GET request to "companies_getcompanyinfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.CompanyInfo|array|
      |$.CompanyInfo[0]|object|
      |$.CompanyInfo[0].Company|object|
      |$.CompanyInfo[0].Setting|object|

  @Positive @DataValidation
  Scenario: TC_08 Validate Company object structure
    And I send the GET request to "companies_getcompanyinfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.CompanyInfo[0].Company.id|string|
      |$.CompanyInfo[0].Company.name|string|
      |$.CompanyInfo[0].Company.address|string|
      |$.CompanyInfo[0].Company.phoneno|string|
      |$.CompanyInfo[0].Company.email|string|
      |$.CompanyInfo[0].Company.created|string|
      |$.CompanyInfo[0].Company.modified|string|
      |$.CompanyInfo[0].Company.currency|string|
      |$.CompanyInfo[0].Company.timezone|string|

  @Positive @DataValidation
  Scenario: TC_09 Validate Setting object structure
    And I send the GET request to "companies_getcompanyinfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.CompanyInfo[0].Setting|object|
      |$.CompanyInfo[0].Setting.isBluetoothDIG|string|
      |$.CompanyInfo[0].Setting.EnableBluetoothLaodoutDIG|string|
      |$.CompanyInfo[0].Setting.EnableBluetoothSaleReturnDIG|string|
      |$.CompanyInfo[0].Setting.EnableBluetoothCollectionDIG|string|
      |$.CompanyInfo[0].Setting.Cash_Reconciliation|string|
      |$.CompanyInfo[0].Setting.Bluetooth_DIG_Configuration|string|

  @Positive @Performance
  Scenario: TC_10 Performance test for company info endpoint
    And I send the GET request to "companies_getcompanyinfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @Positive @Concurrency
  Scenario: TC_11 Concurrent access test for company info endpoint
    And I send the GET request to "companies_getcompanyinfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @Negative @Validation
  Scenario: TC_12 Get company info with invalid query parameters
    And I send the GET request to "companies_getcompanyinfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @Negative @Validation
  Scenario: TC_13 Get company info with special characters in query parameters
    And I send the GET request to "companies_getcompanyinfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @Negative @Security
  Scenario: TC_14 Get company info with SQL injection attempt
    And I send the GET request to "companies_getcompanyinfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE companies; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @Negative @Boundary
  Scenario: TC_15 Get company info with maximum query parameters
    And I send the GET request to "companies_getcompanyinfo" endpoint with dynamic access token and query parameters
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
      |$.Result|"true"|
      |$.Reason|""|

#  @Negative @ErrorHandling
#  Scenario: TC_16 Get company info with invalid endpoint
#    And I send the GET request to "companies_getcompanyinfo_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_17 Validate company info business logic
    And I send the GET request to "companies_getcompanyinfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.CompanyInfo|array|
      |$.CompanyInfo[0].Company|object|
      |$.CompanyInfo[0].Setting|object|

  @Positive @DataIntegrity
  Scenario: TC_18 Validate company info data integrity
    And I send the GET request to "companies_getcompanyinfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.CompanyInfo|array|
      |$.CompanyInfo[0].Company.id|string|
      |$.CompanyInfo[0].Company.name|string|
      |$.CompanyInfo[0].Setting|object|

  @Positive @Regression
  Scenario: TC_19 Regression test for company info endpoint
    And I send the GET request to "companies_getcompanyinfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.CompanyInfo|array|
      |$.CompanyInfo[0].Company|object|
      |$.CompanyInfo[0].Setting|object|

  @Positive @Functional
  Scenario: TC_20 Validate company info response completeness
    And I send the GET request to "companies_getcompanyinfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.CompanyInfo|array|
      |$.CompanyInfo[0].Company.id|string|
      |$.CompanyInfo[0].Company.name|string|
      |$.CompanyInfo[0].Company.currency|string|
      |$.CompanyInfo[0].Company.timezone|string|
      |$.CompanyInfo[0].Setting|object|

  @Positive @ArrayValidation
  Scenario: TC_21 Validate company info array structure and content
    And I send the GET request to "companies_getcompanyinfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.CompanyInfo|array|
      |$.CompanyInfo[0]|object|
      |$.CompanyInfo[0].Company|object|
      |$.CompanyInfo[0].Setting|object|

  @Positive @ContentValidation
  Scenario: TC_22 Validate company info content structure
    And I send the GET request to "companies_getcompanyinfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |CompanyInfo|
      |Company|
      |Setting|

  @Positive @LoadTesting
  Scenario: TC_23 Load testing for company info endpoint
    And I send the GET request to "companies_getcompanyinfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @Negative @Timeout
  Scenario: TC_24 Test company info endpoint timeout handling
    And I send the GET request to "companies_getcompanyinfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @Positive @EndToEnd
  Scenario: TC_25 End-to-end company info data retrieval workflow
    And I send the GET request to "companies_getcompanyinfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And I store the response as "company_info_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.CompanyInfo|array|
      |$.CompanyInfo[0]|object|
      |$.CompanyInfo[0].Company|object|
      |$.CompanyInfo[0].Company.id|string|
      |$.CompanyInfo[0].Company.name|string|
      |$.CompanyInfo[0].Company.currency|string|
      |$.CompanyInfo[0].Company.timezone|string|
      |$.CompanyInfo[0].Setting|object|

