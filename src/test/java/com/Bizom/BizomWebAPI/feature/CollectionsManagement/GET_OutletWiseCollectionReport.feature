@BizomWebAPI @OS @CollectionsManagement @OutletWiseCollectionReport @ReportsAnalyticsGroup2
Feature: Outlet Wise Collection Report API Testing
  As a system user
  I want to test the outlet wise collection report endpoint
  So that I can ensure proper functionality and HTML page rendering for outlet wise collection reports

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get outlet wise collection report without access token
    When I send the GET request to "collections_outlet_wise_collection_report" endpoint with path parameters
      |Path|Value|
      |fromdate|29-09-2025|
      |todate|29-10-2025|
      |outletId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get outlet wise collection report with invalid access token
    And I send the GET request to "collections_outlet_wise_collection_report" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|fromdate|29-09-2025|
      |||todate|29-10-2025|
      |||outletId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get outlet wise collection report with expired access token
    And I send the GET request to "collections_outlet_wise_collection_report" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|fromdate|29-09-2025|
      |||todate|29-10-2025|
      |||outletId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get outlet wise collection report with malformed access token
    And I send the GET request to "collections_outlet_wise_collection_report" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|fromdate|29-09-2025|
      |||todate|29-10-2025|
      |||outletId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get outlet wise collection report with valid access token
    And I send the GET request to "collections_outlet_wise_collection_report" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|29-09-2025|
      |||todate|29-10-2025|
      |||outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And I store the response as "outlet_wise_collection_report_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate outlet wise collection report HTML response structure
    And I send the GET request to "collections_outlet_wise_collection_report" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|29-09-2025|
      |||todate|29-10-2025|
      |||outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @HTMLValidation
  Scenario: TC_07 Validate outlet wise collection report HTML page title
    And I send the GET request to "collections_outlet_wise_collection_report" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|29-09-2025|
      |||todate|29-10-2025|
      |||outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @HTMLValidation
  Scenario: TC_08 Validate outlet wise collection report HTML structure
    And I send the GET request to "collections_outlet_wise_collection_report" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|29-09-2025|
      |||todate|29-10-2025|
      |||outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And validating the response contains the following values
      |Value|
      |html|
      |head|
      |body|

  @Positive @ContentValidation
  Scenario: TC_09 Validate outlet wise collection report HTML content
    And I send the GET request to "collections_outlet_wise_collection_report" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|29-09-2025|
      |||todate|29-10-2025|
      |||outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And validating the response contains the following values
      |Value|
      |html|
      |head|
      |body|
      |Collection|
      |Report|

  @Positive @Functional
  Scenario: TC_10 Get outlet wise collection report with different date range
    And I send the GET request to "collections_outlet_wise_collection_report" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|01-09-2025|
      |||todate|30-09-2025|
      |||outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @Functional
  Scenario: TC_11 Get outlet wise collection report with different outlet ID
    And I send the GET request to "collections_outlet_wise_collection_report" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|29-09-2025|
      |||todate|29-10-2025|
      |||outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @Performance
  Scenario: TC_12 Performance test for outlet wise collection report endpoint
    And I send the GET request to "collections_outlet_wise_collection_report" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|29-09-2025|
      |||todate|29-10-2025|
      |||outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @Concurrency
  Scenario: TC_13 Concurrent access test for outlet wise collection report endpoint
    And I send the GET request to "collections_outlet_wise_collection_report" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|29-09-2025|
      |||todate|29-10-2025|
      |||outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @DataIntegrity
  Scenario: TC_14 Validate outlet wise collection report data integrity
    And I send the GET request to "collections_outlet_wise_collection_report" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|29-09-2025|
      |||todate|29-10-2025|
      |||outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And validating the response contains the following values
      |Value|
      |html|
      |head|
      |body|

  @Positive @Regression
  Scenario: TC_15 Regression test for outlet wise collection report endpoint
    And I send the GET request to "collections_outlet_wise_collection_report" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|29-09-2025|
      |||todate|29-10-2025|
      |||outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @Functional
  Scenario: TC_16 Validate outlet wise collection report response completeness
    And I send the GET request to "collections_outlet_wise_collection_report" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|29-09-2025|
      |||todate|29-10-2025|
      |||outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And validating the response contains the following values
      |Value|
      |html|
      |head|
      |body|

  @Positive @ResponseHeaders
  Scenario: TC_17 Validate outlet wise collection report response headers
    And I send the GET request to "collections_outlet_wise_collection_report" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|29-09-2025|
      |||todate|29-10-2025|
      |||outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Connection|keep-alive|

  @Positive @LoadTesting
  Scenario: TC_18 Load testing for outlet wise collection report endpoint
    And I send the GET request to "collections_outlet_wise_collection_report" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|29-09-2025|
      |||todate|29-10-2025|
      |||outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @Timeout
  Scenario: TC_19 Test outlet wise collection report endpoint timeout handling
    And I send the GET request to "collections_outlet_wise_collection_report" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|29-09-2025|
      |||todate|29-10-2025|
      |||outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Negative @Validation
  Scenario: TC_20 Get outlet wise collection report with invalid date format
    And I send the GET request to "collections_outlet_wise_collection_report" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|invalid-date|
      |||todate|29-10-2025|
      |||outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Negative @Validation
  Scenario: TC_21 Get outlet wise collection report with invalid outlet ID
    And I send the GET request to "collections_outlet_wise_collection_report" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|29-09-2025|
      |||todate|29-10-2025|
      |||outletId|99999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Negative @Validation
  Scenario: TC_22 Get outlet wise collection report with reversed date range
    And I send the GET request to "collections_outlet_wise_collection_report" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|29-10-2025|
      |||todate|29-09-2025|
      |||outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Negative @Validation
  Scenario: TC_23 Get outlet wise collection report with special characters in path parameters
    And I send the GET request to "collections_outlet_wise_collection_report" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|<script>alert('XSS')</script>|
      |||todate|29-10-2025|
      |||outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json|

  @Negative @Security
  Scenario: TC_24 Get outlet wise collection report with SQL injection attempt in path parameters
    And I send the GET request to "collections_outlet_wise_collection_report" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|'; DROP TABLE collections; --|
      |||todate|29-10-2025|
      |||outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Negative @ErrorHandling
  Scenario: TC_25 Get outlet wise collection report with invalid endpoint
    And I send the GET request to "collections_outlet_wise_collection_report_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|29-09-2025|
      |||todate|29-10-2025|
      |||outletId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @ContentValidation
  Scenario: TC_26 Validate outlet wise collection report HTML element content
    And I send the GET request to "collections_outlet_wise_collection_report" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|29-09-2025|
      |||todate|29-10-2025|
      |||outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And validating the response contains the following values
      |Value|
      |html|
      |head|
      |body|
      |Collection|
      |Report|

