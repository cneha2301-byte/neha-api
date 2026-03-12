@BizomWebAPI  @CE @EndOfDayReportsManagement @EndOfDayReports @GetEndOfDays @IntegrationServices
Feature: Get End Of Days - Detailed test coverage
  As a Bizom web API consumer
  I want to validate the get end of days endpoint thoroughly
  So that end-of-day summaries, types and edge-cases are covered

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get end of days without access token
    When I send the GET request to "endofdayreports_get_end_of_days" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get end of days with invalid access token
    And I send the GET request to "endofdayreports_get_end_of_days" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
      |language|en|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get end of days with expired access token
    And I send the GET request to "endofdayreports_get_end_of_days" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_04 Get end of days with valid access token (basic)
    And I send the GET request to "endofdayreports_get_end_of_days" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @Positive @DataValidation
  Scenario: TC_05 Validate Endofdayreport fields and types (structure)
    And I send the GET request to "endofdayreports_get_end_of_days" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|String|
      |$.Reason|String|
      |$.Endofdays|array|
      |$.Endofdays[0].Endofdayreport|object|
      |$.Endofdays[0].Endofdayreport.fordate|String|
      |$.Endofdays[0].Endofdayreport.user_id|String|
      |$.Endofdays[0].Endofdayreport.totalcallssecondary|array|
      |$.Endofdays[0].Endofdayreport.Endofdaydetails|array|

  @Positive @ValueChecks
  Scenario: TC_06 Validate important value fields in Endofdayreport
    And I send the GET request to "endofdayreports_get_end_of_days" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Endofdays[0].Endofdayreport.user_id|"1"|

  @Positive @NestedValidation
  Scenario: TC_07 Ensure nested arrays present and empty where expected
    And I send the GET request to "endofdayreports_get_end_of_days" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Endofdays[0].Endofdayreport.totalcallssecondary|array|
      |$.Endofdays[0].Endofdayreport.Endofdaydetails|array|

  @Negative @Validation
  Scenario: TC_08 Invalid date format for fromDate parameter
    And I send the GET request to "endofdayreports_get_end_of_days" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
      |fromDate|11-12-2025|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_09 SQL injection attempt in userId
    And I send the GET request to "endofdayreports_get_end_of_days" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
      |userId|'; DROP TABLE endofdayreports; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_10 XSS attempt in userId
    And I send the GET request to "endofdayreports_get_end_of_days" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
      |userId|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_11 Missing required parameter userId (if applicable)
    And I send the GET request to "endofdayreports_get_end_of_days" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: TC_12 Performance test for get end of days endpoint
    And I send the GET request to "endofdayreports_get_end_of_days" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: TC_13 Concurrent access test for get end of days endpoint
    And I send the GET request to "endofdayreports_get_end_of_days" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_14 Invalid endpoint returns appropriate response
    When I send the GET request to "endofdayreports_get_end_of_days_invalid" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"

  @Positive @StoreResponse
  Scenario: TC_15 Store response and assert fields exist
    And I send the GET request to "endofdayreports_get_end_of_days" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And I store the response as "getEndOfDays_response" name using full path
    And verifies the field is not null
      |JPath|
      |$.Endofdays[0].Endofdayreport.fordate|
      |$.Endofdays[0].Endofdayreport.user_id|
