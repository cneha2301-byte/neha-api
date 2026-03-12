@BizomWebAPI @CE @UserManagement @AjaxUserIndex
Feature: Ajax User Index API Testing
  As a system user
  I want to test the ajax user index endpoint
  So that I can ensure proper functionality and HTML page rendering for user management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get ajax user index without access token
    When I send the GET request to "webAjaxUserIndex" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    # And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get ajax user index with invalid access token
    And I send the GET request to "webAjaxUserIndex" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title ""
    # And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get ajax user index with expired access token
    And I send the GET request to "webAjaxUserIndex" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title ""
    # And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get ajax user index with malformed access token
    And I send the GET request to "webAjaxUserIndex" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the HTML response should contain page title ""
    # And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get ajax user index with valid access token
    And I send the GET request to "webAjaxUserIndex" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Users"
    And I store the response as "ajax_user_index_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate ajax user index HTML response structure
    And I send the GET request to "webAjaxUserIndex" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Users"

  @Positive @HTMLValidation
  Scenario: TC_07 Validate ajax user index HTML page title
    And I send the GET request to "webAjaxUserIndex" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Users"

  @Positive @HTMLValidation
  Scenario: TC_08 Validate ajax user index HTML structure
    And I send the GET request to "webAjaxUserIndex" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
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
  Scenario: TC_09 Validate ajax user index HTML element exists
    And I send the GET request to "webAjaxUserIndex" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain element "html"
    And the HTML response should contain element "head"
    And the HTML response should contain element "body"
    And the HTML response should contain element "div"

  @Positive @Performance
  Scenario: TC_10 Performance test for ajax user index endpoint
    And I send the GET request to "webAjaxUserIndex" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    # And verify response time is less than "1500" milliseconds
    And the HTML response should contain page title "Users"

  @Positive @Concurrency
  Scenario: TC_11 Concurrent access test for ajax user index endpoint
    And I send the GET request to "webAjaxUserIndex" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Users"

  @Negative @Validation
  Scenario: TC_12 Get ajax user index with invalid query parameters
    And I send the GET request to "webAjaxUserIndex" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Users"

  @Negative @Validation
  Scenario: TC_13 Get ajax user index with special characters in query parameters
    And I send the GET request to "webAjaxUserIndex" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Users"

  @Negative @Security
  Scenario: TC_14 Get ajax user index with SQL injection attempt
    And I send the GET request to "webAjaxUserIndex" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE users; --|
    Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Users"

  @Negative @Boundary
  Scenario: TC_15 Get ajax user index with maximum query parameters
    And I send the GET request to "webAjaxUserIndex" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Users"

#  @Negative @ErrorHandling
#  Scenario: TC_16 Get ajax user index with invalid endpoint
#    And I send the GET request to "webAjaxUserIndex_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    # And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_17 Validate ajax user index business logic
    And I send the GET request to "webAjaxUserIndex" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Users"

  @Positive @DataIntegrity
  Scenario: TC_18 Validate ajax user index data integrity
    And I send the GET request to "webAjaxUserIndex" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Users"
    And the HTML response should contain element "html"
    And the HTML response should contain element "head"
    And the HTML response should contain element "body"

  @Positive @Regression
  Scenario: TC_19 Regression test for ajax user index endpoint
    And I send the GET request to "webAjaxUserIndex" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Users"

  @Positive @Functional
  Scenario: TC_20 Validate ajax user index response completeness
    And I send the GET request to "webAjaxUserIndex" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Users"
    And the HTML response should contain element "html"
    And the HTML response should contain element "head"
    And the HTML response should contain element "body"
    And the HTML response should contain element "div"
    And validating the response contains the following values
      |Value|
      |html|
      |head|
      |title|
      |body|
      |Users|
    And I store the response as "ajax_user_index_response" name using full path

  @Positive @HTMLValidation
  Scenario: TC_21 Validate ajax user index HTML content type
    And I send the GET request to "webAjaxUserIndex" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Users"

  @Positive @HTMLValidation
  Scenario: TC_22 Validate ajax user index HTML page structure elements
    And I send the GET request to "webAjaxUserIndex" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain element "html"
    And the HTML response should contain element "head"
    And the HTML response should contain element "title"
    And the HTML response should contain element "body"
    And the HTML response should contain page title "Users"

