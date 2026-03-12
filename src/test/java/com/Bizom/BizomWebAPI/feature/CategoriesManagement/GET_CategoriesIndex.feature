@BizomWebAPI @CE @CategoriesManagement @GetCategoriesIndex @ConfigurationSettings
Feature: Categories API Testing
  As a system user
  I want to test the categories endpoint
  So that I can ensure proper functionality and data retrieval for categories management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get categories without access token
    When I send the GET request to "categories_index" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get categories with invalid access token
    And I send the GET request to "categories_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get categories with expired access token
    And I send the GET request to "categories_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get categories with malformed access token
    And I send the GET request to "categories_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get categories with valid access token
    And I send the GET request to "categories_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "categories_response" name using full path

  @Positive @Functional
  Scenario: TC_06 Verify categories page contains expected HTML elements
    And I send the GET request to "categories_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain element "h4" with content "Categories"
    And verify response time is less than "2000" milliseconds

  @Positive @DataValidation
  Scenario: TC_07 Verify categories data structure and content
    And I send the GET request to "categories_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response contains the following values
      |Value|
      |Category|
      |table|
      |data|
      |Name|
      |Code|
    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: TC_08 Verify response time performance for categories retrieval
    And I send the GET request to "categories_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the HTML response should contain element "h4" with content "Categories"

  @Negative @Validation
  Scenario: TC_09 Get categories with invalid query parameters
    And I send the GET request to "categories_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_10 Get categories with special characters in query parameters
    And I send the GET request to "categories_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
     And the HTML response should contain element "h4" with content "Categories"

  @Negative @Security
  Scenario: TC_11 Get categories with SQL injection attempt
    And I send the GET request to "categories_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE categories; --| 
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain element "h4" with content "Categories"

  @Negative @Boundary
  Scenario: TC_12 Get categories with maximum query parameters
    And I send the GET request to "categories_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain element "h4" with content "Categories"

  @Negative @ErrorHandling
  Scenario: TC_13 Get categories with invalid endpoint
    And I send the GET request to "categories_index_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @DataIntegrity
  Scenario: TC_14 Validate categories data integrity
    And I send the GET request to "categories_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain element "h4" with content "Categories"
    And validating the response contains the following values
      |Value|
      |Category|
      |table|
      |Name|
      |Code|

  @Positive @Functional
  Scenario: TC_15 Validate categories response completeness
    And I send the GET request to "categories_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain element "h4" with content "Categories"
    And validating the response contains the following values
      |Value|
      |Categories|
      |Description|
      |Status|
      |Active|
      |ERP ID|

  @Positive @LoadTesting
  Scenario: TC_16 Load testing for categories endpoint
    And I send the GET request to "categories_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the HTML response should contain element "h4" with content "Categories"

  @Positive @EndToEnd
  Scenario: TC_17 End-to-end categories data retrieval workflow
    And I send the GET request to "categories_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain element "h4" with content "Categories"
    And I store the response as "categories_response" name using full path
    And validating the response contains the following values
      |Value|
      |Category|
      |table|
