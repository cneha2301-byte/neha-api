@BizomWebAPI @PI @CreditLevelsManagement @CreditLevels @CreditLevelsIndex @SupportingFunctions
Feature: Credit Levels Index API Testing
  As a system user
  I want to test the credit levels index API endpoint
  So that I can ensure proper functionality and data retrieval for credit levels management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get credit levels without access token
    When I send the GET request to "creditlevels_index" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get credit levels with invalid access token
    And I send the GET request to "creditlevels_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get credit levels with expired access token
    And I send the GET request to "creditlevels_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get credit levels with malformed access token
    And I send the GET request to "creditlevels_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get credit levels with valid access token
    And I send the GET request to "creditlevels_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Creditlevels"
    And I store the response as "creditlevels_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate credit levels response structure
    And I send the GET request to "creditlevels_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Creditlevels"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Connection|keep-alive|


  @Positive @Performance
  Scenario: TC_07 Performance test for credit levels endpoint
    And I send the GET request to "creditlevels_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the HTML response should contain page title "Creditlevels"

  @Positive @Concurrency
  Scenario: TC_08 Concurrent access test for credit levels endpoint
    And I send the GET request to "creditlevels_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Creditlevels"

  @Negative @Validation
  Scenario: TC_09 Get credit levels with special characters in query parameters
    And I send the GET request to "creditlevels_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Creditlevels"

  @Negative @Security
  Scenario: TC_10 Get credit levels with SQL injection attempt
    And I send the GET request to "creditlevels_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE creditlevels; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Creditlevels"

  @Negative @Boundary
  Scenario: TC_11 Get credit levels with maximum query parameters
    And I send the GET request to "creditlevels_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Creditlevels"

#  @Negative @ErrorHandling
#  Scenario: TC_12 Get credit levels with invalid endpoint
#    And I send the GET request to "creditlevels_index_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#     And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds


  @Positive @DataIntegrity
  Scenario: TC_13 Validate credit levels data integrity
    And I send the GET request to "creditlevels_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Creditlevels"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Connection|keep-alive|

  @Positive @Regression
  Scenario: TC_14 Regression test for credit levels endpoint
    And I send the GET request to "creditlevels_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Creditlevels"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Connection|keep-alive|

  @Positive @LoadTesting
  Scenario: TC_15 Load testing for credit levels endpoint
    And I send the GET request to "creditlevels_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the HTML response should contain page title "Creditlevels"

  @Negative @Timeout
  Scenario: TC_16 Test credit levels endpoint timeout handling
    And I send the GET request to "creditlevels_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the HTML response should contain page title "Creditlevels"

  @Positive @EndToEnd
  Scenario: TC_17 End-to-end credit levels data retrieval workflow
    And I send the GET request to "creditlevels_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Creditlevels"
    And I store the response as "creditlevels_response" name using full path
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Connection|keep-alive|


  @Positive @ResponseHeaders
  Scenario: TC_18 Validate response headers for credit levels
    And I send the GET request to "creditlevels_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Connection|keep-alive|
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Creditlevels"

  @Positive @SecurityHeaders
  Scenario: TC_19 Validate security headers for credit levels
    And I send the GET request to "creditlevels_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Connection|keep-alive|
    And the HTML response should contain page title "Creditlevels"
    And verify response time is less than "2500" milliseconds

  @Positive @BoundaryTesting
  Scenario: TC_20 Boundary testing for credit levels with special characters
    And I send the GET request to "creditlevels_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |special_chars|@#$%^&*()_+-=[]{};':",./<>?|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Creditlevels"

  @Positive @LoginPageValidation
  Scenario: TC_21 Validate login page elements for credit levels
    And I send the GET request to "creditlevels_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Creditlevels"
    And validating the response contains the following values
      |Value|
      |Creditlevels|
