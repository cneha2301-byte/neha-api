@BizomWebAPI @CE @DashboardsManagement @DashboardsOrgLevelNames @IntegrationServices
Feature: Dashboards Org Level Names API Testing
  As a system user
  I want to test the dashboards orgLevelNames endpoint
  So that I can ensure proper functionality and data retrieval for organization level names

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get org level names without access token
    When I send the GET request to "dashboards_orglevelnames" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get org level names with invalid access token
    And I send the GET request to "dashboards_orglevelnames" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title " "
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get org level names with expired access token
    And I send the GET request to "dashboards_orglevelnames" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title " "
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get org level names with malformed access token
    And I send the GET request to "dashboards_orglevelnames" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the HTML response should contain page title " "
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get org level names with valid access token
    And I send the GET request to "dashboards_orglevelnames" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "  Dashboards"
    And verify response time is less than "2500" milliseconds
    And I store the response as "dashboards_orglevelnames_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate org level names response structure
    And I send the GET request to "dashboards_orglevelnames" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "  Dashboards"
    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: TC_07 Performance test for org level names endpoint
    And I send the GET request to "dashboards_orglevelnames" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "  Dashboards"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: TC_08 Concurrent access test for org level names endpoint
    And I send the GET request to "dashboards_orglevelnames" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "  Dashboards"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_09 Get org level names with invalid query parameters
    And I send the GET request to "dashboards_orglevelnames" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And the HTML response should contain page title "  Dashboards"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_10 Get org level names with special characters in query parameters
    And I send the GET request to "dashboards_orglevelnames" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And the HTML response should contain page title "  Dashboards"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_11 Get org level names with SQL injection attempt
    And I send the GET request to "dashboards_orglevelnames" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE dashboards; --|
    Then I should see the response code as "200"
    And the HTML response should contain page title "  Dashboards"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: TC_12 Get org level names with maximum query parameters
    And I send the GET request to "dashboards_orglevelnames" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And the HTML response should contain page title "  Dashboards"
    And verify response time is less than "2500" milliseconds

#  @Negative @ErrorHandling
#  Scenario: TC_13 Get org level names with invalid endpoint
#    And I send the GET request to "dashboards_orglevelnames_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_14 Validate org level names business logic
    And I send the GET request to "dashboards_orglevelnames" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "  Dashboards"
    And verify response time is less than "2500" milliseconds

  @Positive @DataIntegrity
  Scenario: TC_15 Validate org level names data integrity
    And I send the GET request to "dashboards_orglevelnames" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "  Dashboards"
    And verify response time is less than "2500" milliseconds

  @Positive @Regression
  Scenario: TC_16 Regression test for org level names endpoint
    And I send the GET request to "dashboards_orglevelnames" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "  Dashboards"
    And verify response time is less than "2500" milliseconds

  @Positive @Functional
  Scenario: TC_17 Validate org level names response completeness
    And I send the GET request to "dashboards_orglevelnames" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "  Dashboards"
    And verify response time is less than "2500" milliseconds

  @Positive @ContentValidation
  Scenario: TC_18 Validate org level names content structure
    And I send the GET request to "dashboards_orglevelnames" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "  Dashboards"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Dashboards|
      |orgLevelNames|
      |org|

  @Positive @LoadTesting
  Scenario: TC_19 Load testing for org level names endpoint
    And I send the GET request to "dashboards_orglevelnames" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "  Dashboards"
    And verify response time is less than "3000" milliseconds

  @Negative @Timeout
  Scenario: TC_20 Test org level names endpoint timeout handling
    And I send the GET request to "dashboards_orglevelnames" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "  Dashboards"
    And verify response time is less than "5000" milliseconds

  @Positive @EndToEnd
  Scenario: TC_21 End-to-end org level names data retrieval workflow
    And I send the GET request to "dashboards_orglevelnames" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "  Dashboards"
    And verify response time is less than "2500" milliseconds
    And I store the response as "dashboards_orglevelnames_response" name using full path

  @Positive @DataHandling
  Scenario: TC_22 Validate org level names data handling
    And I send the GET request to "dashboards_orglevelnames" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "  Dashboards"
    And verify response time is less than "2500" milliseconds

  @Positive @ResponseStructure
  Scenario: TC_23 Validate org level names response structure consistency
    And I send the GET request to "dashboards_orglevelnames" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "  Dashboards"
    And verify response time is less than "2500" milliseconds

  @Positive @Headers
  Scenario: TC_24 Validate org level names response headers
    And I send the GET request to "dashboards_orglevelnames" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "  Dashboards"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Connection|keep-alive|
    And verify response time is less than "2500" milliseconds

  @Positive @ResponseStorage
  Scenario: TC_25 Store org level names response for further use
    And I send the GET request to "dashboards_orglevelnames" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "  Dashboards"
    And I store the response as "dashboards_orglevelnames_response" name using full path
    And verify response time is less than "2500" milliseconds

  @Positive @SecurityHeaders
  Scenario: TC_26 Validate org level names security headers
    And I send the GET request to "dashboards_orglevelnames" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "  Dashboards"
    And verify response time is less than "2500" milliseconds

  @Positive @LoginPageValidation
  Scenario: TC_27 Validate org level names login page redirect
    And I send the GET request to "dashboards_orglevelnames" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @ResponseValidation
  Scenario: TC_28 Validate org level names HTML response format
    And I send the GET request to "dashboards_orglevelnames" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "  Dashboards"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_29 Get org level names - verify page title consistency
    And I send the GET request to "dashboards_orglevelnames" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "  Dashboards"
    And verify response time is less than "2500" milliseconds

  @Positive @Functional
  Scenario: TC_30 Get org level names - comprehensive validation
    And I send the GET request to "dashboards_orglevelnames" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "  Dashboards"
    And verify response time is less than "2500" milliseconds
    And I store the response as "dashboards_orglevelnames_response" name using full path
    And validating the response contains the following values
      |Value|
      |Dashboards|
      |orgLevelNames|
      |org|


