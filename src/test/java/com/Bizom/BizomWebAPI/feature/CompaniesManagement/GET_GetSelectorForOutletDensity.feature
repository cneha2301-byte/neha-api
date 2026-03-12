@BizomWebAPI @CompaniesManagement @GetSelectorForOutletDensity @SupportingFunctions @CE
Feature: Get Selector For Outlet Density API Testing
  As a system user
  I want to test the get selector for outlet density endpoint
  So that I can ensure proper functionality and data retrieval for outlet density selector management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get selector for outlet density without access token
    When I send the GET request to "companies_getselectorforoutletdensity" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get selector for outlet density with invalid access token
    And I send the GET request to "companies_getselectorforoutletdensity" endpoint with dynamic access token and query parameters
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
  Scenario: TC_03 Get selector for outlet density with expired access token
    And I send the GET request to "companies_getselectorforoutletdensity" endpoint with dynamic access token and query parameters
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
  Scenario: TC_04 Get selector for outlet density with malformed access token
    And I send the GET request to "companies_getselectorforoutletdensity" endpoint with dynamic access token and query parameters
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
  Scenario: TC_05 Get selector for outlet density with valid access token
    And I send the GET request to "companies_getselectorforoutletdensity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.selector|[]|
    And I store the response as "selector_for_outlet_density_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate selector for outlet density response structure
    And I send the GET request to "companies_getselectorforoutletdensity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.selector|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.selector|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate selector for outlet density array structure
    And I send the GET request to "companies_getselectorforoutletdensity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.selector|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.selector|array|

  @Positive @Performance
  Scenario: TC_08 Performance test for selector for outlet density endpoint
    And I send the GET request to "companies_getselectorforoutletdensity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.selector|[]|

  @Positive @Concurrency
  Scenario: TC_09 Concurrent access test for selector for outlet density endpoint
    And I send the GET request to "companies_getselectorforoutletdensity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.selector|[]|

  @Negative @Validation
  Scenario: TC_10 Get selector for outlet density with invalid query parameters
    And I send the GET request to "companies_getselectorforoutletdensity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.selector|[]|

  @Negative @Validation
  Scenario: TC_11 Get selector for outlet density with special characters in query parameters
    And I send the GET request to "companies_getselectorforoutletdensity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.selector|[]|

  @Negative @Security
  Scenario: TC_12 Get selector for outlet density with SQL injection attempt
    And I send the GET request to "companies_getselectorforoutletdensity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE companies; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.selector|[]|

  @Negative @Boundary
  Scenario: TC_13 Get selector for outlet density with maximum query parameters
    And I send the GET request to "companies_getselectorforoutletdensity" endpoint with dynamic access token and query parameters
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
      |$.selector|[]|

#  @Negative @ErrorHandling
#  Scenario: TC_14 Get selector for outlet density with invalid endpoint
#    And I send the GET request to "companies_getselectorforoutletdensity_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the HTML response should contain page title "Users"

  @Positive @BusinessLogic
  Scenario: TC_15 Validate selector for outlet density business logic
    And I send the GET request to "companies_getselectorforoutletdensity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.selector|[]|

  @Positive @DataIntegrity
  Scenario: TC_16 Validate selector for outlet density data integrity
    And I send the GET request to "companies_getselectorforoutletdensity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.selector|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.selector|array|

  @Positive @Regression
  Scenario: TC_17 Regression test for selector for outlet density endpoint
    And I send the GET request to "companies_getselectorforoutletdensity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.selector|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.selector|array|

  @Positive @Functional
  Scenario: TC_18 Validate selector for outlet density response completeness
    And I send the GET request to "companies_getselectorforoutletdensity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.selector|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.selector|array|

  @Positive @ArrayValidation
  Scenario: TC_19 Validate selector for outlet density array structure and content
    And I send the GET request to "companies_getselectorforoutletdensity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.selector|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.selector|array|

  @Positive @ContentValidation
  Scenario: TC_20 Validate selector for outlet density content structure
    And I send the GET request to "companies_getselectorforoutletdensity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.selector|[]|
    And validating the response contains the following values
      |Value|
      |selector|

  @Positive @LoadTesting
  Scenario: TC_21 Load testing for selector for outlet density endpoint
    And I send the GET request to "companies_getselectorforoutletdensity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.selector|[]|

  @Negative @Timeout
  Scenario: TC_22 Test selector for outlet density endpoint timeout handling
    And I send the GET request to "companies_getselectorforoutletdensity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.selector|[]|

  @Positive @EndToEnd
  Scenario: TC_23 End-to-end selector for outlet density data retrieval workflow
    And I send the GET request to "companies_getselectorforoutletdensity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.selector|[]|
    And I store the response as "selector_for_outlet_density_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.selector|array|

