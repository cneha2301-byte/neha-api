@BizomWebAPI @CustomReportsManagement @CustomReports @TrafficLightDashboardParams @SystemIntegration @CE
Feature: Traffic Light Dashboard Params API Testing
  As a system user
  I want to test the traffic light dashboard params endpoint
  So that I can ensure proper functionality and data retrieval for traffic light dashboard parameters

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get traffic light dashboard params without access token
    When I send the GET request to "customreports_trafficlightdashboardparams" endpoint with path parameters
      |Path|Value|
      |userId|2|
      |date|17-09-2025|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get traffic light dashboard params with invalid access token
    And I send the GET request to "customreports_trafficlightdashboardparams" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|userId|2|
      |zoneId|1|date|17-09-2025|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get traffic light dashboard params with expired access token
    And I send the GET request to "customreports_trafficlightdashboardparams" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|userId|2|
      |zoneId|1|date|17-09-2025|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get traffic light dashboard params with malformed access token
    And I send the GET request to "customreports_trafficlightdashboardparams" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|userId|2|
      |zoneId|1|date|17-09-2025|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: Get traffic light dashboard params for user ID 2 and date 17-09-2025 with valid access token
    And I send the GET request to "customreports_trafficlightdashboardparams" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
      |zoneId|1|date|17-09-2025|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I store the response as "trafficLightDashboardParams_response" name using full path

  @Positive @Functional
  Scenario: Get traffic light dashboard params for user ID 1 and date 01-01-2025 with valid access token
    And I send the GET request to "customreports_trafficlightdashboardparams" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
      |zoneId|1|date|01-01-2025|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I store the response as "trafficLightDashboardParams_response" name using full path

  @Positive @Functional
  Scenario: Get traffic light dashboard params for user ID 3 and date 31-12-2025 with valid access token
    And I send the GET request to "customreports_trafficlightdashboardparams" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|3|
      |zoneId|1|date|31-12-2025|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I store the response as "trafficLightDashboardParams_response" name using full path

  @Positive @Functional
  Scenario: Get traffic light dashboard params with different zone ID
    And I send the GET request to "customreports_trafficlightdashboardparams" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
      |zoneId|2|date|17-09-2025|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I store the response as "trafficLightDashboardParams_response" name using full path

  @Negative @Validation
  Scenario: Get traffic light dashboard params with invalid user ID
    And I send the GET request to "customreports_trafficlightdashboardparams" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|abc|
      |zoneId|1|date|17-09-2025|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: Get traffic light dashboard params with non-existent user ID
    And I send the GET request to "customreports_trafficlightdashboardparams" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|999999|
      |zoneId|1|date|17-09-2025|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: Get traffic light dashboard params with invalid date format
    And I send the GET request to "customreports_trafficlightdashboardparams" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
      |zoneId|1|date|2025-09-17|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: Get traffic light dashboard params with invalid date
    And I send the GET request to "customreports_trafficlightdashboardparams" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
      |zoneId|1|date|99-99-9999|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: Get traffic light dashboard params with invalid zone ID
    And I send the GET request to "customreports_trafficlightdashboardparams" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
      |zoneId|abc|date|17-09-2025|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: Get traffic light dashboard params with negative zone ID
    And I send the GET request to "customreports_trafficlightdashboardparams" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
      |zoneId|-1|date|17-09-2025|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: Get traffic light dashboard params with missing zone ID
    And I send the GET request to "customreports_trafficlightdashboardparams" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
      |||date|17-09-2025|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @ErrorHandling
  Scenario: Get traffic light dashboard params with invalid endpoint
    And I send the GET request to "customreports_trafficlightdashboardparams_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
      |zoneId|1|date|17-09-2025|
    Then I should see the response code as "404"
    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance test for traffic light dashboard params endpoint
    And I send the GET request to "customreports_trafficlightdashboardparams" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
      |zoneId|1|date|17-09-2025|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Regression
  Scenario: Regression test for traffic light dashboard params endpoint
    And I send the GET request to "customreports_trafficlightdashboardparams" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
      |zoneId|1|date|17-09-2025|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I store the response as "trafficLightDashboardParams_response" name using full path

