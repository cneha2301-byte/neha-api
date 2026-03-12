@BizomWebAPI @AggregateTypesManagement @AggregateTypesIndex @MasterDataManagement @CE
Feature: Aggregate Types Index API Testing
  As a Bizom web API consumer
  I want to validate the aggregate types index endpoint
  So that I can ensure aggregate types HTML page is rendered correctly

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get aggregate types index without access token
    When I send the GET request to "aggregatetypes_index" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get aggregate types index with invalid access token
    And I send the GET request to "aggregatetypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users" 
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get aggregate types index with expired access token
    And I send the GET request to "aggregatetypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users" 
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get aggregate types index with malformed access token
    And I send the GET request to "aggregatetypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users" 
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get aggregate types index with valid request
    And I send the GET request to "aggregatetypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Server|Bizom|
      |Connection|keep-alive|
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain element "h2" with content "Aggregate Type"
    And I store the response as "aggregatetypes_index_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate aggregate types index HTML response structure
    And I send the GET request to "aggregatetypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain element "h2" with content "Aggregate Type"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @DataValidation
  Scenario: TC_07 Validate aggregate types index HTML content
    And I send the GET request to "aggregatetypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain element "h2" with content "Aggregate Type"
    And the HTML response should contain element "h2"
    And validating the response contains the following values
      |Value|
      |Aggregate Type|
      |html|
      |body|

  @Positive @DataValidation
  Scenario: TC_08 Validate aggregate types index HTML elements
    And I send the GET request to "aggregatetypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain element "h2"
    And the HTML response should contain element "h2" with content "Aggregate Type"

  @Positive @Performance
  Scenario: TC_09 Performance test for aggregate types index endpoint
    And I send the GET request to "aggregatetypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the HTML response should contain element "h2" with content "Aggregate Type"

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for aggregate types index endpoint
    And I send the GET request to "aggregatetypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain element "h2" with content "Aggregate Type"

  @Negative @Validation
  Scenario: TC_11 Get aggregate types index with invalid query parameters
    And I send the GET request to "aggregatetypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain element "h2" with content "Aggregate Type"

  @Negative @Validation
  Scenario: TC_12 Get aggregate types index with special characters in query parameters
    And I send the GET request to "aggregatetypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain element "h2" with content "Aggregate Type"

  @Negative @Security
  Scenario: TC_13 Get aggregate types index with SQL injection attempt
    And I send the GET request to "aggregatetypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE aggregatetypes; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain element "h2" with content "Aggregate Type"

  @Negative @Boundary
  Scenario: TC_14 Get aggregate types index with maximum query parameters
    And I send the GET request to "aggregatetypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain element "h2" with content "Aggregate Type"

  @Negative @ErrorHandling
  Scenario: TC_15 Get aggregate types index with invalid endpoint
    And I send the GET request to "aggregatetypes_index_invalid" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_16 Validate aggregate types index business logic
    And I send the GET request to "aggregatetypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain element "h2" with content "Aggregate Type"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @DataIntegrity
  Scenario: TC_17 Validate aggregate types index data integrity
    And I send the GET request to "aggregatetypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain element "h2" with content "Aggregate Type"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Server|Bizom|

  @Positive @Regression
  Scenario: TC_18 Regression test for aggregate types index endpoint
    And I send the GET request to "aggregatetypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain element "h2" with content "Aggregate Type"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @Functional
  Scenario: TC_19 Validate aggregate types index response completeness
    And I send the GET request to "aggregatetypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain element "h2" with content "Aggregate Type"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Server|Bizom|
      |Connection|keep-alive|
    And I store the response as "aggregatetypes_index_response" name using full path

  @Positive @ContentValidation
  Scenario: TC_20 Validate aggregate types index content structure
    And I send the GET request to "aggregatetypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain element "h2" with content "Aggregate Type"
    And validating the response contains the following values
      |Value|
      |Aggregate Type|
      |html|
      |head|
      |body|

  @Positive @LoadTesting
  Scenario: TC_21 Load testing for aggregate types index endpoint
    And I send the GET request to "aggregatetypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the HTML response should contain element "h2" with content "Aggregate Type"

  @Negative @Timeout
  Scenario: TC_22 Test aggregate types index endpoint timeout handling
    And I send the GET request to "aggregatetypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the HTML response should contain element "h2" with content "Aggregate Type"

  @Positive @EndToEnd
  Scenario: TC_23 End-to-end aggregate types index data retrieval workflow
    And I send the GET request to "aggregatetypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Server|Bizom|
      |Connection|keep-alive|
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain element "h2" with content "Aggregate Type"
    And the HTML response should contain element "h2"
    And I store the response as "aggregatetypes_index_response" name using full path
    And validating the response contains the following values
      |Value|
      |Aggregate Type|
      |html|
      |body|

