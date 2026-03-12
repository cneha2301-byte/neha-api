@BizomWebAPI @CE @BusinessUnitsManagement @BusinessUnitsIndex @ConfigurationSettings
Feature: Business Units Index API Testing
  As a system user
  I want to test the business units index endpoint
  So that I can ensure proper functionality and data retrieval for business units management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get business units index without access token
    When I send the GET request to "businessunits_index" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds 
    And the HTML response should contain page title "Users"

  @Negative @Security
  Scenario: TC_02 Get business units index with invalid access token
    And I send the GET request to "businessunits_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Users"
  @Negative @Security
  Scenario: TC_03 Get business units index with expired access token
    And I send the GET request to "businessunits_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Users"

  @Negative @Security
  Scenario: TC_04 Get business units index with malformed access token
    And I send the GET request to "businessunits_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get business units index with valid access token
    And I send the GET request to "businessunits_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Server|Bizom|
      |Connection|keep-alive|
    And I store the response as "businessunits_index_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate business units index response structure
    And I send the GET request to "businessunits_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Server|Bizom|
      |Connection|keep-alive|

  @Positive @DataValidation
  Scenario: TC_07 Validate business units index specific data values
    And I send the GET request to "businessunits_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Server|Bizom|
      |Connection|keep-alive|

  @Positive @DataValidation
  Scenario: TC_08 Validate business units index with static values
    And I send the GET request to "businessunits_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Server|Bizom|
      |Connection|keep-alive|

  @Positive @Performance
  Scenario: TC_09 Performance test for business units index endpoint
    And I send the GET request to "businessunits_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Server|Bizom|
      |Connection|keep-alive|

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for business units index endpoint
    And I send the GET request to "businessunits_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Server|Bizom|
      |Connection|keep-alive|

  @Negative @Validation
  Scenario: TC_11 Get business units index with invalid query parameters
    And I send the GET request to "businessunits_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Server|Bizom|
      |Connection|keep-alive|

  @Negative @Validation
  Scenario: TC_12 Get business units index with special characters in query parameters
    And I send the GET request to "businessunits_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Server|Bizom|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_13 Get business units index with SQL injection attempt
    And I send the GET request to "businessunits_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE businessunits; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Server|Bizom|
      |Connection|keep-alive|

  @Negative @Boundary
  Scenario: TC_14 Get business units index with maximum query parameters
    And I send the GET request to "businessunits_index" endpoint with dynamic access token and query parameters
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
      |Server|Bizom|
      |Connection|keep-alive|

  @Negative @ErrorHandling
  Scenario: TC_15 Get business units index with invalid endpoint
    And I send the GET request to "businessunits_index_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_16 Validate business units index business logic
    And I send the GET request to "businessunits_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Server|Bizom|
      |Connection|keep-alive|

  @Positive @DataIntegrity
  Scenario: TC_17 Validate business units index data integrity
    And I send the GET request to "businessunits_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Server|Bizom|
      |Connection|keep-alive|

  @Positive @Regression
  Scenario: TC_18 Regression test for business units index endpoint
    And I send the GET request to "businessunits_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Server|Bizom|
      |Connection|keep-alive|

  @Positive @Functional
  Scenario: TC_19 Validate business units index response completeness
    And I send the GET request to "businessunits_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Server|Bizom|
      |Connection|keep-alive|

  @Positive @ContentValidation
  Scenario: TC_20 Validate business units index content structure
    And I send the GET request to "businessunits_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Server|Bizom|
      |Connection|keep-alive|

  @Positive @LoadTesting
  Scenario: TC_21 Load testing for business units index endpoint
    And I send the GET request to "businessunits_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Server|Bizom|
      |Connection|keep-alive|

  @Negative @Timeout
  Scenario: TC_22 Test business units index endpoint timeout handling
    And I send the GET request to "businessunits_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Server|Bizom|
      |Connection|keep-alive|

  @Positive @EndToEnd
  Scenario: TC_23 End-to-end business units index data retrieval workflow
    And I send the GET request to "businessunits_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Server|Bizom|
      |Connection|keep-alive|
    And I store the response as "businessunits_index_response" name using full path

  @Positive @DataHandling
  Scenario: TC_24 Validate business units index data handling
    And I send the GET request to "businessunits_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Server|Bizom|
      |Connection|keep-alive|

  @Positive @ResponseStructure
  Scenario: TC_25 Validate business units index response structure consistency
    And I send the GET request to "businessunits_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Server|Bizom|
      |Connection|keep-alive|

