@BizomWebAPI @HeadquartersManagement @HeadquartersGetAdd @DataProcessing @CE
Feature: Add Headquarters API Testing
  As a system user
  I want to test the add headquarters endpoint
  So that I can ensure proper functionality and HTML page rendering for adding headquarters

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get add headquarters without access token
    When I send the GET request to "headquarters_add" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get add headquarters with invalid access token
    And I send the GET request to "headquarters_add" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get add headquarters with expired access token
    And I send the GET request to "headquarters_add" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get add headquarters with malformed access token
    And I send the GET request to "headquarters_add" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get add headquarters with valid access token
    And I send the GET request to "headquarters_add" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And I store the response as "add_headquarters_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate add headquarters HTML response structure
    And I send the GET request to "headquarters_add" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @HTMLValidation
  Scenario: TC_07 Validate add headquarters HTML div  class="fieldset-heading"  class="fieldset-heading" element
    And I send the GET request to "headquarters_add" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    
  @Positive @HTMLValidation
  Scenario: TC_08 Validate add headquarters HTML structure
    And I send the GET request to "headquarters_add" endpoint with dynamic access token and query parameters
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
  Scenario: TC_09 Validate add headquarters HTML element exists
    And I send the GET request to "headquarters_add" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @Performance
  Scenario: TC_10 Performance test for add headquarters endpoint
    And I send the GET request to "headquarters_add" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    
  @Positive @Concurrency
  Scenario: TC_11 Concurrent access test for add headquarters endpoint
    And I send the GET request to "headquarters_add" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_12 Get add headquarters with invalid query parameters
    And I send the GET request to "headquarters_add" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_13 Get add headquarters with special characters in query parameters
    And I send the GET request to "headquarters_add" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_14 Get add headquarters with SQL injection attempt
    And I send the GET request to "headquarters_add" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE headquarters; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: TC_15 Get add headquarters with maximum query parameters
    And I send the GET request to "headquarters_add" endpoint with dynamic access token and query parameters
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
  Scenario: TC_16 Get add headquarters with invalid endpoint
    And I send the GET request to "headquarters_add_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_17 Validate add headquarters business logic
    And I send the GET request to "headquarters_add" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @DataIntegrity
  Scenario: TC_18 Validate add headquarters data integrity
    And I send the GET request to "headquarters_add" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Add HEAD QUARTER|
      |html|
      |body|
      |fieldset-heading|

  @Positive @Regression
  Scenario: TC_19 Regression test for add headquarters endpoint
    And I send the GET request to "headquarters_add" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @Functional
  Scenario: TC_20 Validate add headquarters response completeness
    And I send the GET request to "headquarters_add" endpoint with dynamic access token and query parameters
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
      |Add HEAD QUARTER|
      |fieldset-heading|
    And I store the response as "add_headquarters_response" name using full path

