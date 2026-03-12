@BizomWebAPI @CE @BrandsManagement @GetBrandsIndex @ConfigurationSettings
Feature: Brands API Testing
  As a system user
  I want to test the brands endpoint
  So that I can ensure proper functionality and data retrieval for brands management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get brands without access token
    When I send the GET request to "brands_index" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get brands with invalid access token
    And I send the GET request to "brands_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
     And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get brands with expired access token
    And I send the GET request to "brands_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
     And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get brands with malformed access token
    And I send the GET request to "brands_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get brands with valid access token
    And I send the GET request to "brands_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain element "h2" with content "Brands"
    And I store the response as "brands_response" name using full path

  @Positive @Functional
  Scenario: TC_06 Verify brands page contains expected HTML elements
    And I send the GET request to "brands_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain element "h2" with content "Brands"
    And verify response time is less than "2000" milliseconds

  @Positive @DataValidation
  Scenario: TC_07 Verify brands data structure and content
    And I send the GET request to "brands_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response contains the following values
      |Value|
      |Brand|
      |table|
      |Name|
      |Code|
    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: TC_08 Verify response time performance for brands retrieval
    And I send the GET request to "brands_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the HTML response should contain element "h2" with content "Brands"

  @Negative @Validation
  Scenario: TC_09 Get brands with invalid query parameters
    And I send the GET request to "brands_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain element "h2" with content "Brands"

  @Negative @Validation
  Scenario: TC_10 Get brands with special characters in query parameters
    And I send the GET request to "brands_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain element "h2" with content "Brands"

  @Negative @Security
  Scenario: TC_11 Get brands with SQL injection attempt
    And I send the GET request to "brands_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE brands; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain element "h2" with content "Brands"

  @Negative @Boundary
  Scenario: TC_12 Get brands with maximum query parameters
    And I send the GET request to "brands_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain element "h2" with content "Brands"

  @Negative @ErrorHandling
  Scenario: TC_13 Get brands with invalid endpoint
    And I send the GET request to "brands_index_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @DataIntegrity
  Scenario: TC_14 Validate brands data integrity
    And I send the GET request to "brands_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain element "h2" with content "Brands"
    And validating the response contains the following values
      |Value|
      |Brand|
      |table|
      |Name|
      |Code|

  @Positive @Functional
  Scenario: TC_15 Validate brands response completeness
    And I send the GET request to "brands_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain element "h2" with content "Brands"
    And validating the response contains the following values
      |Value|
      |Brand|
      |table|
      |Name|
      |Code|

  @Positive @LoadTesting
  Scenario: TC_16 Load testing for brands endpoint
    And I send the GET request to "brands_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the HTML response should contain element "h2" with content "Brands"

  @Positive @EndToEnd
  Scenario: TC_17 End-to-end brands data retrieval workflow
    And I send the GET request to "brands_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain element "h2" with content "Brands"
    And I store the response as "brands_response" name using full path
    And validating the response contains the following values
      |Value|
      |Brand|
      |table|
      |Name|
      |Code|
