@BizomWebAPI @PI @SchemeGroupsManagement @IndexApi @PaymentProcessing
Feature: Scheme Groups Index API Testing
  As a system user
  I want to test the scheme groups index API endpoint
  So that I can ensure proper functionality and redirection behavior for scheme groups management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  # @Negative @Security
  # Scenario: Get scheme groups index API without access token
    # When I send the GET request to "schemegroups_index_api" endpoint
    # Then I should see the response code as "200"
    # And the HTML response should contain page title "Users"
    # And verify response time is less than "2500" milliseconds
    # And verify response headers
      # |HeaderName|HeaderValue|
      # |Location|https://devuitest.bizomdev.in/schemegroups/indexnew|

  # @Negative @Security
  # Scenario: Get scheme groups index API with invalid access token
    # And I send the GET request to "schemegroups_index_api" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|invalid_token_12345|
    # Then I should see the response code as "200"
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.result|false|
      # |$.error.code|401|
      # |$.error.message|Invalid Access Token or Credentials|
    # And verify response time is less than "2500" milliseconds
    # And verify response headers
      # |HeaderName|HeaderValue|
      # |Location|https://devuitest.bizomdev.in/schemegroups/indexnew|

  # @Negative @Security
  # Scenario: Get scheme groups index API with expired access token
    # And I send the GET request to "schemegroups_index_api" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|expired_token_12345|
    # Then I should see the response code as "200"
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.result|false|
      # |$.error.code|401|
      # |$.error.message|Invalid Access Token or Credentials|
    # And verify response time is less than "2500" milliseconds
    # And verify response headers
      # |HeaderName|HeaderValue|
      # |Location|https://devuitest.bizomdev.in/schemegroups/indexnew|

  # @Negative @Security
  # Scenario: Get scheme groups index API with malformed access token
    # And I send the GET request to "schemegroups_index_api" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|malformed.token.here|
    # Then I should see the response code as "200"
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.result|false|
      # |$.error.code|401|
      # |$.error.message|Invalid Access Token or Credentials|
    # And verify response time is less than "2500" milliseconds
    # And verify response headers
      # |HeaderName|HeaderValue|
      # |Location|https://devuitest.bizomdev.in/schemegroups/indexnew|

  # @Positive @Smoke @Redirection
  # Scenario: Get scheme groups index API with valid access token and verify redirection
    # And I send the GET request to "schemegroups_index_api" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|ACCESS_TOKEN|
    # Then I should see the response code as "302"
    # And verify response time is less than "2500" milliseconds
    # And verify response headers
      # |HeaderName|HeaderValue|
      # |Location|https://devuitest.bizomdev.in/schemegroups/indexnew|
    # When I send the GET request to "schemegroups_indexnew" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|ACCESS_TOKEN|
    # Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    # And verify response headers
      # |HeaderName|HeaderValue|
      # |Content-Type|text/html; charset=UTF-8|

  # @Positive @Redirection
  # Scenario: Validate scheme groups index API redirection behavior
    # And I send the GET request to "schemegroups_index_api" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|ACCESS_TOKEN|
    # Then I should see the response code as "302"
    # And verify response time is less than "2500" milliseconds
    # And verify response headers
      # |HeaderName|HeaderValue|
      # |Location|https://devuitest.bizomdev.in/schemegroups/indexnew|

  # @Positive @DataValidation
  # Scenario: Validate scheme groups index API redirect response structure
    # And I send the GET request to "schemegroups_index_api" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|ACCESS_TOKEN|
    # Then I should see the response code as "302"
    # And verify response time is less than "2500" milliseconds
    # And verify response headers
      # |HeaderName|HeaderValue|
      # |Location|https://devuitest.bizomdev.in/schemegroups/indexnew|

  # @Positive @Performance
  # Scenario: Performance test for scheme groups index API endpoint
    # And I send the GET request to "schemegroups_index_api" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|ACCESS_TOKEN|
    # Then I should see the response code as "302"
    # And verify response time is less than "1500" milliseconds
    # And verify response headers
      # |HeaderName|HeaderValue|
      # |Location|https://devuitest.bizomdev.in/schemegroups/indexnew|

  # @Positive @Concurrency
  # Scenario: Concurrent access test for scheme groups index API endpoint
    # And I send the GET request to "schemegroups_index_api" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|ACCESS_TOKEN|
    # Then I should see the response code as "302"
    # And verify response time is less than "2500" milliseconds
    # And verify response headers
      # |HeaderName|HeaderValue|
      # |Location|https://devuitest.bizomdev.in/schemegroups/indexnew|

  # @Negative @Validation
  # Scenario: Get scheme groups index API with invalid query parameters
    # And I send the GET request to "schemegroups_index_api" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|ACCESS_TOKEN|
      # |invalid_param|invalid_value|
    # Then I should see the response code as "302"
    # And verify response time is less than "2500" milliseconds
    # And verify response headers
      # |HeaderName|HeaderValue|
      # |Location|https://devuitest.bizomdev.in/schemegroups/indexnew|

  # @Negative @Validation
  # Scenario: Get scheme groups index API with special characters in query parameters
    # And I send the GET request to "schemegroups_index_api" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|ACCESS_TOKEN|
      # |test_param|<script>alert('XSS')</script>|
    # Then I should see the response code as "302"
    # And verify response time is less than "2500" milliseconds
    # And verify response headers
      # |HeaderName|HeaderValue|
      # |Location|https://devuitest.bizomdev.in/schemegroups/indexnew|

  @Negative @Security
  Scenario: Get scheme groups index API with SQL injection attempt
    And I send the GET request to "schemegroups_index_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE schemegroups; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  # @Negative @ErrorHandling
  # Scenario: Get scheme groups index API with invalid endpoint
    # And I send the GET request to "schemegroups_index_api_invalid" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|ACCESS_TOKEN|
    # Then I should see the response code as "404"
    # And verify response time is less than "2500" milliseconds

  # @Positive @BusinessLogic
  # Scenario: Validate scheme groups index API business logic and redirection
    # And I send the GET request to "schemegroups_index_api" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|ACCESS_TOKEN|
    # Then I should see the response code as "302"
    # And verify response time is less than "2500" milliseconds
    # And verify response headers
      # |HeaderName|HeaderValue|
      # |Location|https://devuitest.bizomdev.in/schemegroups/indexnew|

  # @Positive @DataIntegrity
  # Scenario: Validate scheme groups index API redirect data integrity
    # And I send the GET request to "schemegroups_index_api" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|ACCESS_TOKEN|
    # Then I should see the response code as "302"
    # And verify response time is less than "2500" milliseconds
    # And verify response headers
      # |HeaderName|HeaderValue|
      # |Location|https://devuitest.bizomdev.in/schemegroups/indexnew|

  # @Positive @Regression
  # Scenario: Regression test for scheme groups index API endpoint
    # And I send the GET request to "schemegroups_index_api" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|ACCESS_TOKEN|
    # Then I should see the response code as "302"
    # And verify response time is less than "2500" milliseconds
    # And verify response headers
      # |HeaderName|HeaderValue|
      # |Location|https://devuitest.bizomdev.in/schemegroups/indexnew|

  # @Positive @Functional
  # Scenario: Validate scheme groups index API response completeness
    # And I send the GET request to "schemegroups_index_api" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|ACCESS_TOKEN|
    # Then I should see the response code as "302"
    # And verify response time is less than "2500" milliseconds
    # And verify response headers
      # |HeaderName|HeaderValue|
      # |Location|https://devuitest.bizomdev.in/schemegroups/indexnew|

  # @Positive @LocationHeaderValidation
  # Scenario: Validate scheme groups index API Location header
    # And I send the GET request to "schemegroups_index_api" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|ACCESS_TOKEN|
    # Then I should see the response code as "302"
    # And verify response time is less than "2500" milliseconds
    # And verify response headers
      # |HeaderName|HeaderValue|
      # |Location|https://devuitest.bizomdev.in/schemegroups/indexnew|

  # @Positive @RedirectFlowValidation
  # Scenario: Validate complete redirect flow from index API to indexnew
    # And I send the GET request to "schemegroups_index_api" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|ACCESS_TOKEN|
    # Then I should see the response code as "302"
    # And verify response time is less than "2500" milliseconds
    # And verify response headers
      # |HeaderName|HeaderValue|
      # |Location|https://devuitest.bizomdev.in/schemegroups/indexnew|
    # When I send the GET request to "schemegroups_indexnew" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|ACCESS_TOKEN|
    # Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    # And verify response headers
      # |HeaderName|HeaderValue|
      # |Content-Type|text/html; charset=UTF-8|
    # And the HTML response should contain element "html"
    # And the HTML response should contain element "head"
    # And the HTML response should contain element "body"

  # @Positive @LoadTesting
  # Scenario: Load testing for scheme groups index API endpoint
    # And I send the GET request to "schemegroups_index_api" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|ACCESS_TOKEN|
    # Then I should see the response code as "302"
    # And verify response time is less than "3000" milliseconds
    # And verify response headers
      # |HeaderName|HeaderValue|
      # |Location|https://devuitest.bizomdev.in/schemegroups/indexnew|

  # @Negative @Timeout
  # Scenario: Test scheme groups index API endpoint timeout handling
    # And I send the GET request to "schemegroups_index_api" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|ACCESS_TOKEN|
    # Then I should see the response code as "302"
    # And verify response time is less than "5000" milliseconds
    # And verify response headers
      # |HeaderName|HeaderValue|
      # |Location|https://devuitest.bizomdev.in/schemegroups/indexnew|

  # @Positive @EndToEnd
  # Scenario: End-to-end scheme groups index API redirect workflow
    # And I send the GET request to "schemegroups_index_api" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|ACCESS_TOKEN|
    # Then I should see the response code as "302"
    # And verify response time is less than "2500" milliseconds
    # And verify response headers
      # |HeaderName|HeaderValue|
      # |Location|https://devuitest.bizomdev.in/schemegroups/indexnew|
    # When I send the GET request to "schemegroups_indexnew" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|ACCESS_TOKEN|
    # Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    # And verify response headers
      # |HeaderName|HeaderValue|
      # |Content-Type|text/html; charset=UTF-8|
    # And I store the response as "schemegroups_indexnew_response" name using full path
    # And the HTML response should contain element "html"
    # And the HTML response should contain element "head"
    # And the HTML response should contain element "body"
    # And the HTML response should contain page title "Schemegroups"

