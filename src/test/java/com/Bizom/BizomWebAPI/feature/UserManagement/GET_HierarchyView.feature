@BizomWebAPI @CE @GetHierarchyView @ReportingOperations
Feature: Hierarchy View API Testing
  As a system user
  I want to test the hierarchy view endpoint
  So that I can ensure proper functionality and HTML page rendering for user hierarchy view

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get hierarchy view without access token
    When I send the GET request to "users_hierarchyview" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get hierarchy view with invalid access token
    And I send the GET request to "users_hierarchyview" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title ""
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get hierarchy view with expired access token
    And I send the GET request to "users_hierarchyview" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title ""
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get hierarchy view with malformed access token
    And I send the GET request to "users_hierarchyview" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the HTML response should contain page title ""
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get hierarchy view with valid access token
    And I send the GET request to "users_hierarchyview" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
   And the HTML response should contain page title "Users"
    And I store the response as "hierarchy_view_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate hierarchy view HTML response structure
    And I send the GET request to "users_hierarchyview" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @HTMLValidation
  Scenario: TC_07 Validate hierarchy view HTML element h2
    And I send the GET request to "users_hierarchyview" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
   And the HTML response should contain page title "Users"

  @Positive @HTMLValidation
  Scenario: TC_08 Validate hierarchy view HTML structure
    And I send the GET request to "users_hierarchyview" endpoint with dynamic access token and query parameters
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
  Scenario: TC_09 Validate hierarchy view HTML element exists
    And I send the GET request to "users_hierarchyview" endpoint with dynamic access token and query parameters
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
    And the HTML response should contain element "h2"

  @Positive @Performance
  Scenario: TC_10 Performance test for hierarchy view endpoint
    And I send the GET request to "users_hierarchyview" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
   And the HTML response should contain page title "Users"

  @Positive @Concurrency
  Scenario: TC_11 Concurrent access test for hierarchy view endpoint
    And I send the GET request to "users_hierarchyview" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
   And the HTML response should contain page title "Users"

  @Negative @Validation
  Scenario: TC_12 Get hierarchy view with invalid query parameters
    And I send the GET request to "users_hierarchyview" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
   And the HTML response should contain page title "Users"

  @Negative @Validation
  Scenario: TC_13 Get hierarchy view with special characters in query parameters
    And I send the GET request to "users_hierarchyview" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
   And the HTML response should contain page title "Users"

  @Negative @Security
  Scenario: TC_14 Get hierarchy view with SQL injection attempt
    And I send the GET request to "users_hierarchyview" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE users; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
   And the HTML response should contain page title "Users"

  @Negative @Boundary
  Scenario: TC_15 Get hierarchy view with maximum query parameters
    And I send the GET request to "users_hierarchyview" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
   And the HTML response should contain page title "Users"

#  @Negative @ErrorHandling
#  Scenario: TC_16 Get hierarchy view with invalid endpoint
#    And I send the GET request to "users_hierarchyview_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_17 Validate hierarchy view business logic
    And I send the GET request to "users_hierarchyview" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
   And the HTML response should contain page title "Users"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @DataIntegrity
  Scenario: TC_18 Validate hierarchy view data integrity
    And I send the GET request to "users_hierarchyview" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
   And the HTML response should contain page title "Users"
    And validating the response contains the following values
      |Value|
      |Hierarchy View|
      |html|
      |body|
      |form-title|

  @Positive @Regression
  Scenario: TC_19 Regression test for hierarchy view endpoint
    And I send the GET request to "users_hierarchyview" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
   And the HTML response should contain page title "Users"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @Functional
  Scenario: TC_20 Validate hierarchy view response completeness
    And I send the GET request to "users_hierarchyview" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
   And the HTML response should contain page title "Users"
    And validating the response contains the following values
      |Value|
      |html|
      |head|
      |title|
      |body|
      |Hierarchy View|
      |h2|
      |form-title|
    And I store the response as "hierarchy_view_response" name using full path

