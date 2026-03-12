@BizomWebAPI @CompaniesManagement @GetOutletsDataCount @SupportingFunctions @CE
Feature: Get Outlets Data Count API Testing
  As a system user
  I want to test the get outlets data count endpoint
  So that I can ensure proper functionality and data retrieval for outlets data count

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get outlets data count without access token
    When I send the GET request to "companies_getoutletsdatacount" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get outlets data count with invalid access token
    And I send the GET request to "companies_getoutletsdatacount" endpoint with dynamic access token and query parameters
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
  Scenario: TC_03 Get outlets data count with expired access token
    And I send the GET request to "companies_getoutletsdatacount" endpoint with dynamic access token and query parameters
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
  Scenario: TC_04 Get outlets data count with malformed access token
    And I send the GET request to "companies_getoutletsdatacount" endpoint with dynamic access token and query parameters
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
  Scenario: TC_05 Get outlets data count with valid access token
    And I send the GET request to "companies_getoutletsdatacount" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.count|number|
    And I store the response as "outlets_data_count_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate outlets data count response structure
    And I send the GET request to "companies_getoutletsdatacount" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.count|number|

  @Positive @DataValidation
  Scenario: TC_07 Validate outlets data count response format
    And I send the GET request to "companies_getoutletsdatacount" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.count|number|
    And validating the response contains the following values
      |Value|
      |count|

  @Positive @DataValidation
  Scenario: TC_08 Validate outlets data count is non-negative
    And I send the GET request to "companies_getoutletsdatacount" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.count|number|

  @Positive @Performance
  Scenario: TC_09 Performance test for outlets data count endpoint
    And I send the GET request to "companies_getoutletsdatacount" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.count|number|

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for outlets data count endpoint
    And I send the GET request to "companies_getoutletsdatacount" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.count|number|

  @Negative @Validation
  Scenario: TC_11 Get outlets data count with invalid query parameters
    And I send the GET request to "companies_getoutletsdatacount" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.count|number|

  @Negative @Validation
  Scenario: TC_12 Get outlets data count with special characters in query parameters
    And I send the GET request to "companies_getoutletsdatacount" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.count|number|

  @Negative @Security
  Scenario: TC_13 Get outlets data count with SQL injection attempt
    And I send the GET request to "companies_getoutletsdatacount" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE outlets; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.count|number|

  @Negative @Boundary
  Scenario: TC_14 Get outlets data count with maximum query parameters
    And I send the GET request to "companies_getoutletsdatacount" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.count|number|

#  @Negative @ErrorHandling
#  Scenario: TC_15 Get outlets data count with invalid endpoint
#    And I send the GET request to "companies_getoutletsdatacount_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_16 Validate outlets data count business logic
    And I send the GET request to "companies_getoutletsdatacount" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.count|number|

  @Positive @DataIntegrity
  Scenario: TC_17 Validate outlets data count data integrity
    And I send the GET request to "companies_getoutletsdatacount" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.count|number|

  @Positive @Regression
  Scenario: TC_18 Regression test for outlets data count endpoint
    And I send the GET request to "companies_getoutletsdatacount" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.count|number|

  @Positive @Functional
  Scenario: TC_19 Validate outlets data count response completeness
    And I send the GET request to "companies_getoutletsdatacount" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.count|number|
    And validating the response contains the following values
      |Value|
      |count|

  @Positive @ContentValidation
  Scenario: TC_20 Validate outlets data count content structure
    And I send the GET request to "companies_getoutletsdatacount" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |count|

  @Positive @LoadTesting
  Scenario: TC_21 Load testing for outlets data count endpoint
    And I send the GET request to "companies_getoutletsdatacount" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.count|number|

  @Negative @Timeout
  Scenario: TC_22 Test outlets data count endpoint timeout handling
    And I send the GET request to "companies_getoutletsdatacount" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.count|number|

  @Positive @EndToEnd
  Scenario: TC_23 End-to-end outlets data count data retrieval workflow
    And I send the GET request to "companies_getoutletsdatacount" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.count|number|
    And I store the response as "outlets_data_count_response" name using full path
    And validating the response contains the following values
      |Value|
      |count|

