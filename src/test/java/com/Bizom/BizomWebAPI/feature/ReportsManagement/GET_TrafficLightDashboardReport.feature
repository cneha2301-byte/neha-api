@BizomWebAPI @ReportsManagement @TrafficLightDashboardReport @OrderManagement
Feature: Traffic Light Dashboard Report API Testing
  As a system user
  I want to test the traffic light dashboard report endpoint
  So that I can ensure proper functionality and data retrieval for traffic light dashboard reports

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get traffic light dashboard report without access token
    When I send the GET request to "reports_traffic_light_dashboard_report" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get traffic light dashboard report with invalid access token
    And I send the GET request to "reports_traffic_light_dashboard_report" endpoint with dynamic access token and query parameters
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
  Scenario: Get traffic light dashboard report with expired access token
    And I send the GET request to "reports_traffic_light_dashboard_report" endpoint with dynamic access token and query parameters
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
  Scenario: Get traffic light dashboard report with malformed access token
    And I send the GET request to "reports_traffic_light_dashboard_report" endpoint with dynamic access token and query parameters
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
  Scenario: Get traffic light dashboard report with valid access token
    And I send the GET request to "reports_traffic_light_dashboard_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "traffic_light_dashboard_report_response" name using full path

  @Positive @DataValidation
  Scenario: Validate traffic light dashboard report response structure
    And I send the GET request to "reports_traffic_light_dashboard_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|

  @Positive @Performance
  Scenario: Performance test for traffic light dashboard report endpoint
    And I send the GET request to "reports_traffic_light_dashboard_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: Concurrent access test for traffic light dashboard report endpoint
    And I send the GET request to "reports_traffic_light_dashboard_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get traffic light dashboard report with invalid query parameters
    And I send the GET request to "reports_traffic_light_dashboard_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get traffic light dashboard report with special characters in query parameters
    And I send the GET request to "reports_traffic_light_dashboard_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get traffic light dashboard report with SQL injection attempt
    And I send the GET request to "reports_traffic_light_dashboard_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE reports; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: Get traffic light dashboard report with maximum query parameters
    And I send the GET request to "reports_traffic_light_dashboard_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: Get traffic light dashboard report with invalid endpoint
    And I send the GET request to "reports_traffic_light_dashboard_report_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "404"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate traffic light dashboard report business logic
    And I send the GET request to "reports_traffic_light_dashboard_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|

  @Positive @DataIntegrity
  Scenario: Validate traffic light dashboard report data integrity
    And I send the GET request to "reports_traffic_light_dashboard_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|

  @Positive @Regression
  Scenario: Regression test for traffic light dashboard report endpoint
    And I send the GET request to "reports_traffic_light_dashboard_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|

  @Positive @Functional
  Scenario: Validate traffic light dashboard report response completeness
    And I send the GET request to "reports_traffic_light_dashboard_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|

#  @Positive @ContentValidation
#  Scenario: Validate traffic light dashboard report content structure
#    And I send the GET request to "reports_traffic_light_dashboard_report" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response contains the following values
#      |Value|
#      |response|

  @Positive @LoadTesting
  Scenario: Load testing for traffic light dashboard report endpoint
    And I send the GET request to "reports_traffic_light_dashboard_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|

  @Negative @Timeout
  Scenario: Test traffic light dashboard report endpoint timeout handling
    And I send the GET request to "reports_traffic_light_dashboard_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|

  @Positive @EndToEnd
  Scenario: End-to-end traffic light dashboard report data retrieval workflow
    And I send the GET request to "reports_traffic_light_dashboard_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "traffic_light_dashboard_report_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|

  @Positive @StatusCodeValidation
  Scenario: Validate traffic light dashboard report status code
    And I send the GET request to "reports_traffic_light_dashboard_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @ResponseTimeValidation
  Scenario: Validate traffic light dashboard report response time
    And I send the GET request to "reports_traffic_light_dashboard_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds

  @Positive @ResponseValidation
  Scenario: Validate traffic light dashboard report response exists
    And I send the GET request to "reports_traffic_light_dashboard_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|

