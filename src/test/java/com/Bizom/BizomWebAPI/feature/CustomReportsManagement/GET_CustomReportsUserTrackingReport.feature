@BizomWebAPI @CustomReportsManagement @CustomReportsUserTrackingReport @SupportingFunctions @CE
Feature: Custom Reports User Tracking Report API Testing
  As a system user
  I want to test the custom reports usertrackingreport endpoint
  So that I can ensure proper functionality and data retrieval for user tracking reports

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get user tracking report without access token
    When I send the GET request to "customreports_usertrackingreport" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get user tracking report with invalid access token
    And I send the GET request to "customreports_usertrackingreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title " "
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get user tracking report with expired access token
    And I send the GET request to "customreports_usertrackingreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title " "
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get user tracking report with malformed access token
    And I send the GET request to "customreports_usertrackingreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the HTML response should contain page title " "
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get user tracking report with valid access token
    And I send the GET request to "customreports_usertrackingreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "  Customreports"
    And verify response time is less than "2500" milliseconds
    And I store the response as "customreports_usertrackingreport_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate user tracking report response structure
    And I send the GET request to "customreports_usertrackingreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "  Customreports"
    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: TC_07 Performance test for user tracking report endpoint
    And I send the GET request to "customreports_usertrackingreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "  Customreports"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: TC_08 Concurrent access test for user tracking report endpoint
    And I send the GET request to "customreports_usertrackingreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "  Customreports"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_09 Get user tracking report with invalid query parameters
    And I send the GET request to "customreports_usertrackingreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And the HTML response should contain page title "  Customreports"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_10 Get user tracking report with special characters in query parameters
    And I send the GET request to "customreports_usertrackingreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And the HTML response should contain page title "  Customreports"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_11 Get user tracking report with SQL injection attempt
    And I send the GET request to "customreports_usertrackingreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE customreports; --|
    Then I should see the response code as "200"
    And the HTML response should contain page title "  Customreports"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: TC_12 Get user tracking report with maximum query parameters
    And I send the GET request to "customreports_usertrackingreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And the HTML response should contain page title "  Customreports"
    And verify response time is less than "2500" milliseconds

#  @Negative @ErrorHandling
#  Scenario: TC_13 Get user tracking report with invalid endpoint
#    And I send the GET request to "customreports_usertrackingreport_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_14 Validate user tracking report business logic
    And I send the GET request to "customreports_usertrackingreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "  Customreports"
    And verify response time is less than "2500" milliseconds

  @Positive @DataIntegrity
  Scenario: TC_15 Validate user tracking report data integrity
    And I send the GET request to "customreports_usertrackingreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "  Customreports"
    And verify response time is less than "2500" milliseconds

  @Positive @Regression
  Scenario: TC_16 Regression test for user tracking report endpoint
    And I send the GET request to "customreports_usertrackingreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "  Customreports"
    And verify response time is less than "2500" milliseconds

  @Positive @Functional
  Scenario: TC_17 Validate user tracking report response completeness
    And I send the GET request to "customreports_usertrackingreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "  Customreports"
    And verify response time is less than "2500" milliseconds

  @Positive @ContentValidation
  Scenario: TC_18 Validate user tracking report content structure
    And I send the GET request to "customreports_usertrackingreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "  Customreports"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Customreports|
      |usertracking|
      |report|

  @Positive @LoadTesting
  Scenario: TC_19 Load testing for user tracking report endpoint
    And I send the GET request to "customreports_usertrackingreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "  Customreports"
    And verify response time is less than "3000" milliseconds

  @Negative @Timeout
  Scenario: TC_20 Test user tracking report endpoint timeout handling
    And I send the GET request to "customreports_usertrackingreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "  Customreports"
    And verify response time is less than "5000" milliseconds

  @Positive @EndToEnd
  Scenario: TC_21 End-to-end user tracking report data retrieval workflow
    And I send the GET request to "customreports_usertrackingreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "  Customreports"
    And verify response time is less than "2500" milliseconds
    And I store the response as "customreports_usertrackingreport_response" name using full path

  @Positive @DataHandling
  Scenario: TC_22 Validate user tracking report data handling
    And I send the GET request to "customreports_usertrackingreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "  Customreports"
    And verify response time is less than "2500" milliseconds

  @Positive @ResponseStructure
  Scenario: TC_23 Validate user tracking report response structure consistency
    And I send the GET request to "customreports_usertrackingreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "  Customreports"
    And verify response time is less than "2500" milliseconds

  @Positive @Headers
  Scenario: TC_24 Validate user tracking report response headers
    And I send the GET request to "customreports_usertrackingreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "  Customreports"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Connection|keep-alive|
    And verify response time is less than "2500" milliseconds

  @Positive @ResponseStorage
  Scenario: TC_25 Store user tracking report response for further use
    And I send the GET request to "customreports_usertrackingreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "  Customreports"
    And I store the response as "customreports_usertrackingreport_response" name using full path
    And verify response time is less than "2500" milliseconds

  @Positive @SecurityHeaders
  Scenario: TC_26 Validate user tracking report security headers
    And I send the GET request to "customreports_usertrackingreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "  Customreports"
    And verify response time is less than "2500" milliseconds

  @Negative @LoginPageValidation
  Scenario: TC_27 Validate user tracking report login page redirect
    And I send the GET request to "customreports_usertrackingreport" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @ResponseValidation
  Scenario: TC_28 Validate user tracking report HTML response format
    And I send the GET request to "customreports_usertrackingreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "  Customreports"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_29 Get user tracking report - verify page title consistency
    And I send the GET request to "customreports_usertrackingreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "  Customreports"
    And verify response time is less than "2500" milliseconds

  @Positive @Functional
  Scenario: TC_30 Get user tracking report - comprehensive validation
    And I send the GET request to "customreports_usertrackingreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "  Customreports"
    And verify response time is less than "2500" milliseconds
    And I store the response as "customreports_usertrackingreport_response" name using full path
    And validating the response contains the following values
      |Value|
      |Customreports|
      |usertracking|
      |report|


