@BizomWebAPI @CE @UserManagement @ChangePwdDialog @UserSecurity
Feature: Change Password Dialog API Testing
  As a system user
  I want to test the change password dialog endpoint
  So that I can ensure proper functionality and HTML page rendering for password change dialog

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|text/html,*/*; q=0.01|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get change password dialog without access token
    When I send the GET request to "GET_ChangePwdDialog" endpoint with path parameters
      |Path|Value|
      |userId|DB:users:id: active=1 ORDER BY id DESC LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get change password dialog with invalid access token
#    And I send the GET request to "GET_ChangePwdDialog" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|invalid_token_12345|
#      |Path|Value|
#      |userId|DB:users:id: active=1 ORDER BY id DESC LIMIT 1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get change password dialog with expired access token
#    And I send the GET request to "GET_ChangePwdDialog" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|expired_token_12345|
#      |Path|Value|
#      |userId|DB:users:id: active=1 ORDER BY id DESC LIMIT 1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get change password dialog with malformed access token
#    And I send the GET request to "GET_ChangePwdDialog" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|malformed.token.here|
#      |Path|Value|
#      |userId|DB:users:id: active=1 ORDER BY id DESC LIMIT 1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get change password dialog with valid user ID
    And I send the GET request to "GET_ChangePwdDialog" endpoint with path parameters
      |Path|Value|
      |userId|DB:users:id: active=1 ORDER BY id DESC LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And I store the response as "change_pwd_dialog_response" name using full path

#  @Positive @Smoke
#  Scenario: Get change password dialog with valid access token and user ID
#    And I send the GET request to "GET_ChangePwdDialog" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |Path|Value|
#      |userId|DB:users:id: active=1 ORDER BY id DESC LIMIT 1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Content-Type|text/html; charset=UTF-8|
#    And I store the response as "change_pwd_dialog_response" name using full path

  @Positive @DataValidation
  Scenario: Validate change password dialog HTML response structure
    And I send the GET request to "GET_ChangePwdDialog" endpoint with path parameters
      |Path|Value|
      |userId|DB:users:id: active=1 ORDER BY id DESC LIMIT 1|
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
  Scenario: Validate change password dialog HTML page structure
    And I send the GET request to "GET_ChangePwdDialog" endpoint with path parameters
      |Path|Value|
      |userId|DB:users:id: active=1 ORDER BY id DESC LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain element "html"
    And the HTML response should contain element "head"
    And the HTML response should contain element "body"
    And the HTML response should contain element "div"

  @Positive @HTMLValidation
  Scenario: Validate change password dialog HTML form elements
    And I send the GET request to "GET_ChangePwdDialog" endpoint with path parameters
      |Path|Value|
      |userId|DB:users:id: active=1 ORDER BY id DESC LIMIT 1|
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
      |form|
      |input|

  @Positive @PathParameter
  Scenario: Get change password dialog with different user ID
    And I send the GET request to "GET_ChangePwdDialog" endpoint with path parameters
      |Path|Value|
      |userId|DB:users:id: active=1 ORDER BY id DESC LIMIT 1 OFFSET 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @PathParameter
  Scenario: Get change password dialog with static user ID
    And I send the GET request to "GET_ChangePwdDialog" endpoint with path parameters
      |Path|Value|
      |userId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @Performance
  Scenario: Performance test for change password dialog endpoint
    And I send the GET request to "GET_ChangePwdDialog" endpoint with path parameters
      |Path|Value|
      |userId|DB:users:id: active=1 ORDER BY id DESC LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @Concurrency
  Scenario: Concurrent access test for change password dialog endpoint
    And I send the GET request to "GET_ChangePwdDialog" endpoint with path parameters
      |Path|Value|
      |userId|DB:users:id: active=1 ORDER BY id DESC LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Negative @Validation
  Scenario: Get change password dialog with invalid user ID
    And I send the GET request to "GET_ChangePwdDialog" endpoint with path parameters
      |Path|Value|
      |userId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Negative @Validation
  Scenario: Get change password dialog with non-existent user ID
    And I send the GET request to "GET_ChangePwdDialog" endpoint with path parameters
      |Path|Value|
      |userId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get change password dialog with negative user ID
    And I send the GET request to "GET_ChangePwdDialog" endpoint with path parameters
      |Path|Value|
      |userId|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get change password dialog with string user ID
    And I send the GET request to "GET_ChangePwdDialog" endpoint with path parameters
      |Path|Value|
      |userId|invalid_user_id|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get change password dialog with SQL injection in user ID
#    And I send the GET request to "GET_ChangePwdDialog" endpoint with path parameters
#      |Path|Value|
#      |userId|1'; DROP TABLE users; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds

#  @Negative @ErrorHandling
#  Scenario: Get change password dialog with invalid endpoint
#    And I send the GET request to "GET_ChangePwdDialog_invalid" endpoint with path parameters
#      |Path|Value|
#      |userId|DB:users:id: active=1 ORDER BY id DESC LIMIT 1|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate change password dialog business logic
    And I send the GET request to "GET_ChangePwdDialog" endpoint with path parameters
      |Path|Value|
      |userId|DB:users:id: active=1 ORDER BY id DESC LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And validating the response contains the following values
      |Value|
      |html|
      |head|
      |body|

  @Positive @DataIntegrity
  Scenario: Validate change password dialog data integrity
    And I send the GET request to "GET_ChangePwdDialog" endpoint with path parameters
      |Path|Value|
      |userId|DB:users:id: active=1 ORDER BY id DESC LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain element "html"
    And the HTML response should contain element "head"
    And the HTML response should contain element "body"
    And validating the response contains the following values
      |Value|
      |html|
      |head|
      |title|
      |body|

  @Positive @Regression
  Scenario: Regression test for change password dialog endpoint
    And I send the GET request to "GET_ChangePwdDialog" endpoint with path parameters
      |Path|Value|
      |userId|DB:users:id: active=1 ORDER BY id DESC LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And validating the response contains the following values
      |Value|
      |html|
      |head|
      |body|

  @Positive @Functional
  Scenario: Validate change password dialog response completeness
    And I send the GET request to "GET_ChangePwdDialog" endpoint with path parameters
      |Path|Value|
      |userId|DB:users:id: active=1 ORDER BY id DESC LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain element "html"
    And the HTML response should contain element "head"
    And the HTML response should contain element "body"
    And validating the response contains the following values
      |Value|
      |html|
      |head|
      |title|
      |body|
      |div|

  @Positive @ContentValidation
  Scenario: Validate change password dialog content structure
    And I send the GET request to "GET_ChangePwdDialog" endpoint with path parameters
      |Path|Value|
      |userId|DB:users:id: active=1 ORDER BY id DESC LIMIT 1|
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
      |div|
      |form|

  @Positive @LoadTesting
  Scenario: Load testing for change password dialog endpoint
    And I send the GET request to "GET_ChangePwdDialog" endpoint with path parameters
      |Path|Value|
      |userId|DB:users:id: active=1 ORDER BY id DESC LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Negative @Timeout
  Scenario: Test change password dialog endpoint timeout handling
    And I send the GET request to "GET_ChangePwdDialog" endpoint with path parameters
      |Path|Value|
      |userId|DB:users:id: active=1 ORDER BY id DESC LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @EndToEnd
  Scenario: End-to-end change password dialog HTML page retrieval workflow
    And I send the GET request to "GET_ChangePwdDialog" endpoint with path parameters
      |Path|Value|
      |userId|DB:users:id: active=1 ORDER BY id DESC LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And I store the response as "change_pwd_dialog_response" name using full path
    And the HTML response should contain element "html"
    And the HTML response should contain element "head"
    And the HTML response should contain element "body"
    And validating the response contains the following values
      |Value|
      |html|
      |head|
      |title|
      |body|
      |div|

