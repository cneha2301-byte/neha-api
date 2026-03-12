@BizomWebAPI @CE @OutletsManagement @AddOutlet @OutletManagement
Feature: Add Outlet API Testing
  As a system user
  I want to test the add outlet endpoint
  So that I can ensure proper functionality and HTML page rendering for adding outlets

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get add outlet without access token
    When I send the GET request to "GET_AddOutlet" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get add outlet with invalid access token
    And I send the GET request to "GET_AddOutlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title ""
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get add outlet with expired access token
    And I send the GET request to "GET_AddOutlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title ""
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get add outlet with malformed access token
    And I send the GET request to "GET_AddOutlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the HTML response should contain page title ""
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get add outlet with valid access token
    And I send the GET request to "GET_AddOutlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Outlets"
    And I store the response as "add_outlet_response" name using full path

  @Positive @DataValidation
  Scenario: Validate add outlet HTML response structure
    And I send the GET request to "GET_AddOutlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Outlets"

  @Positive @HTMLValidation
  Scenario: Validate add outlet HTML page title
    And I send the GET request to "GET_AddOutlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Outlets"

  @Positive @HTMLValidation
  Scenario: Validate add outlet HTML structure
    And I send the GET request to "GET_AddOutlet" endpoint with dynamic access token and query parameters
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
      |Outlets|

  @Positive @HTMLValidation
  Scenario: Validate add outlet HTML page structure elements
    And I send the GET request to "GET_AddOutlet" endpoint with dynamic access token and query parameters
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
    And the HTML response should contain element "div"

  @Positive @Performance
  Scenario: Performance test for add outlet endpoint
    And I send the GET request to "GET_AddOutlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Outlets"

  @Positive @Concurrency
  Scenario: Concurrent access test for add outlet endpoint
    And I send the GET request to "GET_AddOutlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Outlets"

  @Negative @Validation
  Scenario: Get add outlet with invalid query parameters
    And I send the GET request to "GET_AddOutlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Outlets"

  @Negative @Validation
  Scenario: Get add outlet with special characters in query parameters
    And I send the GET request to "GET_AddOutlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Outlets"

  @Negative @Security
  Scenario: Get add outlet with SQL injection attempt
    And I send the GET request to "GET_AddOutlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE outlets; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Outlets"

  @Negative @Boundary
  Scenario: Get add outlet with maximum query parameters
    And I send the GET request to "GET_AddOutlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Outlets"

#  @Negative @ErrorHandling
#  Scenario: Get add outlet with invalid endpoint
#    And I send the GET request to "GET_AddOutlet_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate add outlet business logic
    And I send the GET request to "GET_AddOutlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Outlets"

  @Positive @DataIntegrity
  Scenario: Validate add outlet data integrity
    And I send the GET request to "GET_AddOutlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Outlets"
    And validating the response contains the following values
      |Value|
      |html|
      |head|
      |title|
      |body|
      |Outlets|

  @Positive @Regression
  Scenario: Regression test for add outlet endpoint
    And I send the GET request to "GET_AddOutlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Outlets"
    And validating the response contains the following values
      |Value|
      |html|
      |head|
      |title|
      |body|

  @Positive @Functional
  Scenario: Validate add outlet response completeness
    And I send the GET request to "GET_AddOutlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Outlets"
    And the HTML response should contain element "html"
    And the HTML response should contain element "head"
    And the HTML response should contain element "body"
    And validating the response contains the following values
      |Value|
      |html|
      |head|
      |title|
      |body|
      |Outlets|

  @Positive @ContentValidation
  Scenario: Validate add outlet content structure
    And I send the GET request to "GET_AddOutlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Outlets"
    And validating the response contains the following values
      |Value|
      |html|
      |head|
      |title|
      |body|
      |Outlets|
      |div|

  @Positive @LoadTesting
  Scenario: Load testing for add outlet endpoint
    And I send the GET request to "GET_AddOutlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Outlets"

  @Negative @Timeout
  Scenario: Test add outlet endpoint timeout handling
    And I send the GET request to "GET_AddOutlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Outlets"

  @Positive @EndToEnd
  Scenario: End-to-end add outlet HTML page retrieval workflow
    And I send the GET request to "GET_AddOutlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Outlets"
    And I store the response as "add_outlet_response" name using full path
    And the HTML response should contain element "html"
    And the HTML response should contain element "head"
    And the HTML response should contain element "body"
    And validating the response contains the following values
      |Value|
      |html|
      |head|
      |title|
      |body|
      |Outlets|

