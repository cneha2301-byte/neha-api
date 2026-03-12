@BizomWebAPI @OS @DepoMarginsManagement @DepoMarginsIndex @IntegrationServices
Feature: Depo Margins Index API Testing
  As a system user
  I want to test the depo margins index endpoint
  So that I can ensure proper functionality and data retrieval for depo margins management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get depo margins index without access token
    When I send the GET request to "depomargins_index" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get depo margins index with invalid access token
    And I send the GET request to "depomargins_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get depo margins index with expired access token
    And I send the GET request to "depomargins_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get depo margins index with malformed access token
    And I send the GET request to "depomargins_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get depo margins index with valid access token
    And I send the GET request to "depomargins_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the response body should contain "depomargin"
    And verify response time is less than "2500" milliseconds

  @Positive @DataValidation
  Scenario: TC_06 Validate depo margins index response structure
    And I send the GET request to "depomargins_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the response body should contain "depomargin"
    
  @Positive @Performance
  Scenario: TC_07 Performance test for depo margins index endpoint
    And I send the GET request to "depomargins_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the response body should contain "depomargin"

  @Positive @Concurrency
  Scenario: TC_08 Concurrent access test for depo margins index endpoint
    And I send the GET request to "depomargins_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the response body should contain "depomargin"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_09 Get depo margins index with invalid query parameters
    And I send the GET request to "depomargins_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And the response body should contain "depomargin"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_10 Get depo margins index with special characters in query parameters
    And I send the GET request to "depomargins_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And the response body should contain "depomargin"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_11 Get depo margins index with SQL injection attempt
    And I send the GET request to "depomargins_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE depomargins; --|
    Then I should see the response code as "200"
    And the response body should contain "depomargin"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: TC_12 Get depo margins index with maximum query parameters
    And I send the GET request to "depomargins_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And the response body should contain "depomargin"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_13 Get depo margins index with invalid endpoint
    And I send the GET request to "depomargins_index_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_14 Validate depo margins index business logic
    And I send the GET request to "depomargins_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the response body should contain "depomargin"
    And verify response time is less than "2500" milliseconds

  @Positive @DataIntegrity
  Scenario: TC_15 Validate depo margins index data integrity
    And I send the GET request to "depomargins_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the response body should contain "depomargin"
    And verify response time is less than "2500" milliseconds

  @Positive @Regression
  Scenario: TC_16 Regression test for depo margins index endpoint
    And I send the GET request to "depomargins_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the response body should contain "depomargin"
    And verify response time is less than "2500" milliseconds

  @Positive @Functional
  Scenario: TC_17 Validate depo margins index response completeness
    And I send the GET request to "depomargins_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the response body should contain "depomargin"
    And verify response time is less than "2500" milliseconds

  @Positive @ContentValidation
  Scenario: TC_18 Validate depo margins index content structure
    And I send the GET request to "depomargins_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the response body should contain "depomargin"
    And verify response time is less than "2500" milliseconds

  @Positive @LoadTesting
  Scenario: TC_19 Load testing for depo margins index endpoint
    And I send the GET request to "depomargins_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the response body should contain "depomargin"
    And verify response time is less than "3000" milliseconds

  @Negative @Timeout
  Scenario: TC_20 Test depo margins index endpoint timeout handling
    And I send the GET request to "depomargins_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the response body should contain "depomargin"
    And verify response time is less than "5000" milliseconds

  @Positive @EndToEnd
  Scenario: TC_21 End-to-end depo margins index data retrieval workflow
    And I send the GET request to "depomargins_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the response body should contain "depomargin"
    And verify response time is less than "2500" milliseconds
    And I store the response as "depomargins_index_response" name using full path

  @Positive @DataHandling
  Scenario: TC_22 Validate depo margins index data handling
    And I send the GET request to "depomargins_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the response body should contain "depomargin"
    And verify response time is less than "2500" milliseconds

  @Positive @ResponseStructure
  Scenario: TC_23 Validate depo margins index response structure consistency
    And I send the GET request to "depomargins_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the response body should contain "depomargin"
    And verify response time is less than "2500" milliseconds

  @Positive @Headers
  Scenario: TC_24 Validate depo margins index response headers
    And I send the GET request to "depomargins_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the response body should contain "depomargin"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Connection|keep-alive|
    And verify response time is less than "2500" milliseconds

  @Positive @ResponseStorage
  Scenario: TC_25 Store depo margins index response for further use
    And I send the GET request to "depomargins_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the response body should contain "depomargin"
    And I store the response as "depomargins_index_response" name using full path
    And verify response time is less than "2500" milliseconds

  @Positive @SecurityHeaders
  Scenario: TC_26 Validate depo margins index security headers
    And I send the GET request to "depomargins_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the response body should contain "depomargin"
    And verify response time is less than "2500" milliseconds

  @Positive @LoginPageValidation
  Scenario: TC_27 Validate depo margins index login page redirect
    And I send the GET request to "depomargins_index" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @ResponseValidation
  Scenario: TC_28 Validate depo margins index HTML response format
    And I send the GET request to "depomargins_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the response body should contain "depomargin"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_29 Get depo margins index - verify page title consistency
    And I send the GET request to "depomargins_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the response body should contain "depomargin"
    And verify response time is less than "2500" milliseconds

  @Positive @Functional
  Scenario: TC_30 Get depo margins index - comprehensive validation
    And I send the GET request to "depomargins_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the response body should contain "depomargin"
    And verify response time is less than "2500" milliseconds

