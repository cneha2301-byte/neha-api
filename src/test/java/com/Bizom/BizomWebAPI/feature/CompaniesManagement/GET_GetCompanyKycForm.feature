@BizomWebAPI @CompaniesManagement @GetCompanyKycForm @SupportingFunctions @CE
Feature: Get Company KYC Form API Testing
  As a system user
  I want to test the get company KYC form endpoint
  So that I can ensure proper functionality and data retrieval for company KYC form management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get company KYC form without access token
    When I send the GET request to "companies_getcompanykycform" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get company KYC form with invalid access token
    And I send the GET request to "companies_getcompanykycform" endpoint with dynamic access token and query parameters
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
  Scenario: TC_03 Get company KYC form with expired access token
    And I send the GET request to "companies_getcompanykycform" endpoint with dynamic access token and query parameters
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
  Scenario: TC_04 Get company KYC form with malformed access token
    And I send the GET request to "companies_getcompanykycform" endpoint with dynamic access token and query parameters
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
  Scenario: TC_05 Get company KYC form with valid access token
    And I send the GET request to "companies_getcompanykycform" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
    And I store the response as "company_kyc_form_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate company KYC form response structure
    And I send the GET request to "companies_getcompanykycform" endpoint with dynamic access token and query parameters
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
      |$.CompanyKyc|object|

  @Positive @DataValidation
  Scenario: TC_07 Validate company KYC form CompanyKyc object structure
    And I send the GET request to "companies_getcompanykycform" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.CompanyKyc|object|
      |$.CompanyKyc.company_id|string|
      |$.CompanyKyc.kycForm|object|

  @Positive @DataValidation
  Scenario: TC_08 Validate company KYC form with static values
    And I send the GET request to "companies_getcompanykycform" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
      |$.CompanyKyc.company_id|"470212"|

  @Positive @Performance
  Scenario: TC_09 Performance test for company KYC form endpoint
    And I send the GET request to "companies_getcompanykycform" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for company KYC form endpoint
    And I send the GET request to "companies_getcompanykycform" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Negative @Validation
  Scenario: TC_11 Get company KYC form with invalid query parameters
    And I send the GET request to "companies_getcompanykycform" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Negative @Validation
  Scenario: TC_12 Get company KYC form with special characters in query parameters
    And I send the GET request to "companies_getcompanykycform" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Negative @Security
  Scenario: TC_13 Get company KYC form with SQL injection attempt
    And I send the GET request to "companies_getcompanykycform" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE companies; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Negative @Boundary
  Scenario: TC_14 Get company KYC form with maximum query parameters
    And I send the GET request to "companies_getcompanykycform" endpoint with dynamic access token and query parameters
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

#  @Negative @ErrorHandling
#  Scenario: TC_15 Get company KYC form with invalid endpoint
#    And I send the GET request to "companies_getcompanykycform_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_16 Validate company KYC form business logic
    And I send the GET request to "companies_getcompanykycform" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @Positive @DataIntegrity
  Scenario: TC_17 Validate company KYC form data integrity
    And I send the GET request to "companies_getcompanykycform" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.CompanyKyc|object|
      |$.CompanyKyc.company_id|string|
      |$.CompanyKyc.kycForm|object|

  @Positive @Regression
  Scenario: TC_18 Regression test for company KYC form endpoint
    And I send the GET request to "companies_getcompanykycform" endpoint with dynamic access token and query parameters
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
      |$.CompanyKyc|object|

  @Positive @Functional
  Scenario: TC_19 Validate company KYC form response completeness
    And I send the GET request to "companies_getcompanykycform" endpoint with dynamic access token and query parameters
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
      |$.CompanyKyc|object|
      |$.CompanyKyc.company_id|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.CompanyKyc.company_id|"470212"|

  @Positive @ContentValidation
  Scenario: TC_20 Validate company KYC form content structure
    And I send the GET request to "companies_getcompanykycform" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |CompanyKyc|
      |company_id|
      |kycForm|

  @Positive @LoadTesting
  Scenario: TC_21 Load testing for company KYC form endpoint
    And I send the GET request to "companies_getcompanykycform" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Negative @Timeout
  Scenario: TC_22 Test company KYC form endpoint timeout handling
    And I send the GET request to "companies_getcompanykycform" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Positive @EndToEnd
  Scenario: TC_23 End-to-end company KYC form data retrieval workflow
    And I send the GET request to "companies_getcompanykycform" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And I store the response as "company_kyc_form_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.CompanyKyc|object|
      |$.CompanyKyc.company_id|string|
      |$.CompanyKyc.kycForm|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.CompanyKyc.company_id|"470212"|

