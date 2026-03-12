@BizomWebAPI @CustomReportsManagement @CustomReportsHierarchyReport @SupportingFunctions @CE
Feature: Custom Reports Hierarchy Report API Testing
  As a system user
  I want to test the custom reports hierarchy report endpoint
  So that I can ensure proper functionality and data retrieval for hierarchy reports

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get hierarchy report without access token
    When I send the GET request to "customreports_hierarchyreport" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get hierarchy report with invalid access token
    And I send the GET request to "customreports_hierarchyreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get hierarchy report with expired access token
    And I send the GET request to "customreports_hierarchyreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get hierarchy report with malformed access token
    And I send the GET request to "customreports_hierarchyreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get hierarchy report with valid access token
    And I send the GET request to "customreports_hierarchyreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Customreports"
    And verify response time is less than "2500" milliseconds
    And I store the response as "customreports_hierarchyreport_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate hierarchy report response structure
    And I send the GET request to "customreports_hierarchyreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Customreports"
    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: TC_07 Performance test for hierarchy report endpoint
    And I send the GET request to "customreports_hierarchyreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Customreports"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: TC_08 Concurrent access test for hierarchy report endpoint
    And I send the GET request to "customreports_hierarchyreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Customreports"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_09 Get hierarchy report with invalid query parameters
    And I send the GET request to "customreports_hierarchyreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Customreports"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_10 Get hierarchy report with special characters in query parameters
    And I send the GET request to "customreports_hierarchyreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Customreports"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_11 Get hierarchy report with SQL injection attempt
    And I send the GET request to "customreports_hierarchyreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE customreports; --|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Customreports"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: TC_12 Get hierarchy report with maximum query parameters
    And I send the GET request to "customreports_hierarchyreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Customreports"
    And verify response time is less than "2500" milliseconds

#  @Negative @ErrorHandling
#  Scenario: TC_13 Get hierarchy report with invalid endpoint
#    And I send the GET request to "customreports_hierarchyreport_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_14 Validate hierarchy report business logic
    And I send the GET request to "customreports_hierarchyreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Customreports"
    And verify response time is less than "2500" milliseconds

  @Positive @Regression
  Scenario: TC_15 Regression test for hierarchy report endpoint
    And I send the GET request to "customreports_hierarchyreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Customreports"
    And verify response time is less than "2500" milliseconds

  @Positive @Functional
  Scenario: TC_16 Validate hierarchy report response completeness
    And I send the GET request to "customreports_hierarchyreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Customreports"
    And verify response time is less than "2500" milliseconds

  @Positive @ContentValidation
  Scenario: TC_17 Validate hierarchy report content structure
    And I send the GET request to "customreports_hierarchyreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Customreports"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Customreports|
      |hierarchy|

  @Negative @Timeout
  Scenario: TC_18 Test hierarchy report endpoint timeout handling
    And I send the GET request to "customreports_hierarchyreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Customreports"
    And verify response time is less than "5000" milliseconds

  @Positive @EndToEnd
  Scenario: TC_19 End-to-end hierarchy report data retrieval workflow
    And I send the GET request to "customreports_hierarchyreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Customreports"
    And verify response time is less than "2500" milliseconds
    And I store the response as "customreports_hierarchyreport_response" name using full path

  @Positive @Headers
  Scenario: TC_20 Validate hierarchy report response headers
    And I send the GET request to "customreports_hierarchyreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Customreports"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Connection|keep-alive|
    And verify response time is less than "2500" milliseconds

  @Positive @Functional
  Scenario: TC_21 Get hierarchy report - comprehensive validation
    And I send the GET request to "customreports_hierarchyreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Customreports"
    And verify response time is less than "2500" milliseconds
    And I store the response as "customreports_hierarchyreport_response" name using full path
    And validating the response contains the following values
      |Value|
      |Customreports|
      |hierarchy|
      |report|


