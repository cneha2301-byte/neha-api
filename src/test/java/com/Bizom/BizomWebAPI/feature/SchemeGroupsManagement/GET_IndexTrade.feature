@BizomWebAPI @PI @SchemeGroupsManagement @IndexTrade @PaymentProcessing
Feature: Scheme Groups Index Trade API Testing
  As a system user
  I want to test the scheme groups index trade endpoint
  So that I can ensure proper functionality and HTML page rendering for scheme groups trade management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get scheme groups index trade without access token
    When I send the GET request to "schemegroups_indextrade" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  # @Negative @Security
  # Scenario: Get scheme groups index trade with invalid access token
    # And I send the GET request to "schemegroups_indextrade" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|invalid_token_12345|
    # Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    # And verify response headers
      # |HeaderName|HeaderValue|
      # |Content-Type|text/html; charset=UTF-8|

  # @Negative @Security
  # Scenario: Get scheme groups index trade with expired access token
    # And I send the GET request to "schemegroups_indextrade" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|expired_token_12345|
    # Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    # And verify response headers
      # |HeaderName|HeaderValue|
      # |Content-Type|text/html; charset=UTF-8|

  # @Negative @Security
  # Scenario: Get scheme groups index trade with malformed access token
    # And I send the GET request to "schemegroups_indextrade" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|malformed.token.here|
    # Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    # And verify response headers
      # |HeaderName|HeaderValue|
      # |Content-Type|text/html; charset=UTF-8|

  @Positive @Smoke
  Scenario: Get scheme groups index trade with valid access token
    And I send the GET request to "schemegroups_indextrade" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And I store the response as "schemegroups_indextrade_response" name using full path

  @Positive @DataValidation
  Scenario: Validate scheme groups index trade HTML response structure
    And I send the GET request to "schemegroups_indextrade" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @HTMLValidation
  Scenario: Validate scheme groups index trade HTML page title
    And I send the GET request to "schemegroups_indextrade" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Schemegroups"

  @Positive @HTMLValidation
  Scenario: Validate scheme groups index trade HTML structure
    And I send the GET request to "schemegroups_indextrade" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And validating the response contains the following values
      |Value|
      |html|
      |head|
      |title|
      |body|

  @Positive @HTMLValidation
  Scenario: Validate scheme groups index trade HTML element exists
    And I send the GET request to "schemegroups_indextrade" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain element "html"
    And the HTML response should contain element "head"
    And the HTML response should contain element "body"

  @Positive @Performance
  Scenario: Performance test for scheme groups index trade endpoint
    And I send the GET request to "schemegroups_indextrade" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @Concurrency
  Scenario: Concurrent access test for scheme groups index trade endpoint
    And I send the GET request to "schemegroups_indextrade" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Negative @Validation
  Scenario: Get scheme groups index trade with invalid query parameters
    And I send the GET request to "schemegroups_indextrade" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Negative @Validation
  Scenario: Get scheme groups index trade with special characters in query parameters
    And I send the GET request to "schemegroups_indextrade" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Negative @Security
  Scenario: Get scheme groups index trade with SQL injection attempt
    And I send the GET request to "schemegroups_indextrade" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE schemegroups; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  # @Negative @ErrorHandling
  # Scenario: Get scheme groups index trade with invalid endpoint
    # And I send the GET request to "schemegroups_indextrade_invalid" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|ACCESS_TOKEN|
    # Then I should see the response code as "404"
    # And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate scheme groups index trade business logic
    And I send the GET request to "schemegroups_indextrade" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Schemegroups"

  @Positive @DataIntegrity
  Scenario: Validate scheme groups index trade data integrity
    And I send the GET request to "schemegroups_indextrade" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain element "html"
    And the HTML response should contain element "body"

  @Positive @Regression
  Scenario: Regression test for scheme groups index trade endpoint
    And I send the GET request to "schemegroups_indextrade" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @Functional
  Scenario: Validate scheme groups index trade response completeness
    And I send the GET request to "schemegroups_indextrade" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain element "html"
    And the HTML response should contain element "head"
    And the HTML response should contain element "body"
    And validating the response contains the following values
      |Value|
      |html|
      |head|
      |title|
      |body|

  @Positive @ContentValidation
  Scenario: Validate scheme groups index trade content structure
    And I send the GET request to "schemegroups_indextrade" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And validating the response contains the following values
      |Value|
      |html|
      |head|
      |title|
      |body|
      |Schemegroups|

  @Positive @LoadTesting
  Scenario: Load testing for scheme groups index trade endpoint
    And I send the GET request to "schemegroups_indextrade" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Negative @Timeout
  Scenario: Test scheme groups index trade endpoint timeout handling
    And I send the GET request to "schemegroups_indextrade" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @EndToEnd
  Scenario: End-to-end scheme groups index trade data retrieval workflow
    And I send the GET request to "schemegroups_indextrade" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And I store the response as "schemegroups_indextrade_response" name using full path
    And the HTML response should contain element "html"
    And the HTML response should contain element "head"
    And the HTML response should contain element "body"
    And the HTML response should contain page title "Schemegroups"
    And validating the response contains the following values
      |Value|
      |html|
      |head|
      |title|
      |body|
      |Schemegroups|


