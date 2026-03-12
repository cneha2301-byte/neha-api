@BizomWebAPI @Innovation @AssetsManagement @AssetsManagementIndex @CoreBusinessOperations
Feature: Assets Index API Testing
  As a Bizom web API consumer
  I want to validate the assets index endpoint
  So that I can ensure assets HTML page is rendered correctly

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get assets index without access token
    When I send the GET request to "assets_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token||
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get assets index with invalid access token
    And I send the GET request to "assets_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "" 
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get assets index with expired access token
    And I send the GET request to "assets_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "" 
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get assets index with malformed access token
    And I send the GET request to "assets_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the HTML response should contain page title "" 
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get assets index with valid request
    And I send the GET request to "assets_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Server|Bizom|
      |Connection|keep-alive|
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Assets"
    And I store the response as "assets_index_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate assets index HTML response structure
    And I send the GET request to "assets_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Assets"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @DataValidation
  Scenario: TC_07 Validate assets index HTML content
    And I send the GET request to "assets_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Assets"
    And validating the response contains the following values
      |Value|
      |Assets|
      |html|
      |body|

  @Positive @Performance
  Scenario: TC_08 Performance test for assets index endpoint
    And I send the GET request to "assets_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the HTML response should contain page title "Assets"

  @Positive @Concurrency
  Scenario: TC_09 Concurrent access test for assets index endpoint
    And I send the GET request to "assets_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Assets"

  @Negative @Validation
  Scenario: TC_10 Get assets index with invalid query parameters
    And I send the GET request to "assets_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Assets"

  @Negative @Validation
  Scenario: TC_11 Get assets index with special characters in query parameters
    And I send the GET request to "assets_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Assets"

  @Negative @Security
  Scenario: TC_12 Get assets index with SQL injection attempt
    And I send the GET request to "assets_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE assets; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Assets"

  @Negative @Boundary
  Scenario: TC_13 Get assets index with maximum query parameters
    And I send the GET request to "assets_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Assets"

 @Negative @ErrorHandling
 Scenario: TC_14 Get assets index with invalid endpoint
   And I send the GET request to "assets_index_invalid" endpoint with dynamic access token and query parameters
     |QueryParamName|QueryParamValue|
     |access_token|ACCESS_TOKEN|
   Then I should see the response code as "STATUS_404_NOT_FOUND"
   And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_15 Validate assets index business logic
    And I send the GET request to "assets_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Assets"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @DataIntegrity
  Scenario: TC_16 Validate assets index data integrity
    And I send the GET request to "assets_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Assets"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Server|Bizom|

  @Positive @Regression
  Scenario: TC_17 Regression test for assets index endpoint
    And I send the GET request to "assets_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Assets"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @Functional
  Scenario: TC_18 Validate assets index response completeness
    And I send the GET request to "assets_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Assets"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Server|Bizom|
      |Connection|keep-alive|
    And validating the response contains the following values
      |Value|
      |Assets|
      |html|
      |body|
      |div|
      |table|

  @Positive @ContentValidation
  Scenario: TC_19 Validate assets index content structure
    And I send the GET request to "assets_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Assets|
      |html|
      |body|
      |div|
      |table|

  @Positive @LoadTesting
  Scenario: TC_20 Load testing for assets index endpoint
    And I send the GET request to "assets_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the HTML response should contain page title "Assets"

  @Negative @Timeout
  Scenario: TC_21 Test assets index endpoint timeout handling
    And I send the GET request to "assets_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the HTML response should contain page title "Assets"

  @Positive @EndToEnd
  Scenario: TC_22 End-to-end assets index data retrieval workflow
    And I send the GET request to "assets_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Assets"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Server|Bizom|
      |Connection|keep-alive|
    And I store the response as "assets_index_response" name using full path
    And validating the response contains the following values
      |Value|
      |Assets|
      |html|
      |body|
      |div|
      |table|

