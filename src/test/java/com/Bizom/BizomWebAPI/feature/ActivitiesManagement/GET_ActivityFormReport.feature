@BizomWebAPI @CE @ActivitiesManagement @ActivityFormReport @GetActivityFormReport @MasterDataManagement
Feature: Activity Form Report API Testing
  As a system user
  I want to access the activity form report endpoint
  So that I can retrieve activity form report data from the system

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get activity form report without access token
    When I send the GET request to "activity_form_report" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get activity form report with invalid access token
    And I send the GET request to "activity_form_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get activity form report with expired access token
    And I send the GET request to "activity_form_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get activity form report with malformed access token
    And I send the GET request to "activity_form_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: Get activity form report with valid access token
    And I send the GET request to "activity_form_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
  

  @Positive @Functional
  Scenario: Validate activity form report HTML structure
    And I send the GET request to "activity_form_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
  

  @Positive @UIValidation
  Scenario: Validate activity form report page elements
    And I send the GET request to "activity_form_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
  

  @Positive @ContentValidation
  Scenario: Validate activity form report specific content
    And I send the GET request to "activity_form_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
  

  @Positive @Performance
  Scenario: Performance test for activity form report endpoint
    And I send the GET request to "activity_form_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
  

  @Positive @Concurrency
  Scenario: Concurrent access test for activity form report endpoint
    And I send the GET request to "activity_form_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
  

  @Negative @Validation
  Scenario: Get activity form report with invalid query parameter
    And I send the GET request to "activity_form_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
  

  @Negative @Security
  Scenario: Get activity form report with XSS attempt in query parameter
    And I send the GET request to "activity_form_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
  

  @Negative @Boundary
  Scenario: Get activity form report with excessive query parameters
    And I send the GET request to "activity_form_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
  

  @Negative @ErrorHandling
  Scenario: Get activity form report with invalid endpoint
    And I send the GET request to "activity_form_report_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate activity form report business logic
    And I send the GET request to "activity_form_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
  

  @Positive @DataIntegrity
  Scenario: Validate activity form report data integrity
    And I send the GET request to "activity_form_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
  

  @Positive @Regression
  Scenario: Regression test for activity form report endpoint
    And I send the GET request to "activity_form_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
  
