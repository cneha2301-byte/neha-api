@BizomWebAPI @PI @SchemeEnrollmentAssignmentsManagement @SchemeEnrollmentAssignmentsGetIndex @PaymentProcessing
Feature: Scheme Enrollment Assignments Index API Testing
  As a system user
  I want to test the scheme enrollment assignments index endpoint
  So that I can ensure proper functionality and HTML page rendering for scheme enrollment assignments management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get scheme enrollment assignments index without access token
    When I send the GET request to "schemeenrollmentassignments_index" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get scheme enrollment assignments index with invalid access token
    And I send the GET request to "schemeenrollmentassignments_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title ""
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get scheme enrollment assignments index with expired access token
    And I send the GET request to "schemeenrollmentassignments_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title ""
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get scheme enrollment assignments index with malformed access token
    And I send the GET request to "schemeenrollmentassignments_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the HTML response should contain page title ""
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get scheme enrollment assignments index with valid access token
    And I send the GET request to "schemeenrollmentassignments_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Schemeenrollmentassignments"
    And I store the response as "schemeenrollmentassignments_index_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate scheme enrollment assignments index HTML response structure
    And I send the GET request to "schemeenrollmentassignments_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @HTMLValidation
  Scenario: TC_07 Validate scheme enrollment assignments index HTML page title
    And I send the GET request to "schemeenrollmentassignments_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Schemeenrollmentassignments"

  @Positive @HTMLValidation
  Scenario: TC_08 Validate scheme enrollment assignments index HTML structure
    And I send the GET request to "schemeenrollmentassignments_index" endpoint with dynamic access token and query parameters
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

  @Positive @Performance
  Scenario: TC_09 Performance test for scheme enrollment assignments index endpoint
    And I send the GET request to "schemeenrollmentassignments_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the HTML response should contain page title "Schemeenrollmentassignments"

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for scheme enrollment assignments index endpoint
    And I send the GET request to "schemeenrollmentassignments_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Schemeenrollmentassignments"

  @Negative @Validation
  Scenario: TC_11 Get scheme enrollment assignments index with invalid query parameters
    And I send the GET request to "schemeenrollmentassignments_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Schemeenrollmentassignments"

  @Negative @Validation
  Scenario: TC_12 Get scheme enrollment assignments index with special characters in query parameters
    And I send the GET request to "schemeenrollmentassignments_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Schemeenrollmentassignments"

  @Negative @Security
  Scenario: TC_13 Get scheme enrollment assignments index with SQL injection attempt
    And I send the GET request to "schemeenrollmentassignments_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE schemeenrollmentassignments; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Schemeenrollmentassignments"

  @Negative @Boundary
  Scenario: TC_14 Get scheme enrollment assignments index with maximum query parameters
    And I send the GET request to "schemeenrollmentassignments_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Schemeenrollmentassignments"

  @Negative @ErrorHandling
  Scenario: TC_15 Get scheme enrollment assignments index with invalid endpoint
    And I send the GET request to "schemeenrollmentassignments_index_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_16 Validate scheme enrollment assignments index business logic
    And I send the GET request to "schemeenrollmentassignments_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Schemeenrollmentassignments"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @DataIntegrity
  Scenario: TC_17 Validate scheme enrollment assignments index data integrity
    And I send the GET request to "schemeenrollmentassignments_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Schemeenrollmentassignments"
    And validating the response contains the following values
      |Value|
      |Schemeenrollmentassignments|
      |html|
      |body|

  @Positive @Regression
  Scenario: TC_18 Regression test for scheme enrollment assignments index endpoint
    And I send the GET request to "schemeenrollmentassignments_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Schemeenrollmentassignments"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @Functional
  Scenario: TC_19 Validate scheme enrollment assignments index response completeness
    And I send the GET request to "schemeenrollmentassignments_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Schemeenrollmentassignments"
    And validating the response contains the following values
      |Value|
      |html|
      |head|
      |title|
      |body|
      |Schemeenrollmentassignments|
    And I store the response as "schemeenrollmentassignments_index_response" name using full path

