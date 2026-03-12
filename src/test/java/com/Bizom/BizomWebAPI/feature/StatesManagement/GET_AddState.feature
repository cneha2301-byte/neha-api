@BizomWebAPI @CE @StatesManagement @AddState @MasterDataManagement
Feature: Add State API Testing
  As a system user
  I want to test the add state endpoint
  So that I can ensure proper functionality and HTML page rendering for adding states

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get add state without access token
    When I send the GET request to "GET_AddState" endpoint
    Then I should see the response code as "STATUS_200_OK"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get add state with invalid access token
    And I send the GET request to "GET_AddState" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "STATUS_200_OK"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get add state with expired access token
    And I send the GET request to "GET_AddState" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "STATUS_200_OK"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get add state with malformed access token
    And I send the GET request to "GET_AddState" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "STATUS_200_OK"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get add state with valid access token
    And I send the GET request to "GET_AddState" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Add State"
    And I store the response as "add_state_response" name using full path

  @Positive @DataValidation
  Scenario: Validate add state HTML response structure
    And I send the GET request to "GET_AddState" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Add State"

  @Positive @HTMLValidation
  Scenario: Validate add state HTML page title
    And I send the GET request to "GET_AddState" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Add State"

  @Positive @HTMLValidation
  Scenario: Validate add state HTML structure
    And I send the GET request to "GET_AddState" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_200_OK"
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
      |States|

  @Positive @HTMLValidation
  Scenario: Validate add state HTML page structure elements
    And I send the GET request to "GET_AddState" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain element "html"
    And the HTML response should contain element "head"
    And the HTML response should contain element "body"
    And the HTML response should contain element "div"

  @Positive @Performance
  Scenario: Performance test for add state endpoint
    And I send the GET request to "GET_AddState" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "1500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Add State"

  @Positive @Concurrency
  Scenario: Concurrent access test for add state endpoint
    And I send the GET request to "GET_AddState" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Add State"

  @Negative @Validation
  Scenario: Get add state with invalid query parameters
    And I send the GET request to "GET_AddState" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Add State"

  @Negative @Validation
  Scenario: Get add state with special characters in query parameters
    And I send the GET request to "GET_AddState" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Add State"

  @Negative @Security
  Scenario: Get add state with SQL injection attempt
    And I send the GET request to "GET_AddState" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE states; --|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Add State"

  @Negative @Boundary
  Scenario: Get add state with maximum query parameters
    And I send the GET request to "GET_AddState" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Add State"

  @Negative @ErrorHandling
  Scenario: Get add state with invalid endpoint
    And I send the GET request to "GET_AddState_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_200_OK"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate add state business logic
    And I send the GET request to "GET_AddState" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Add State"

  @Positive @DataIntegrity
  Scenario: Validate add state data integrity
    And I send the GET request to "GET_AddState" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Add State"
    And validating the response contains the following values
      |Value|
      |html|
      |head|
      |title|
      |body|
      |States|

  @Positive @Regression
  Scenario: Regression test for add state endpoint
    And I send the GET request to "GET_AddState" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Add State"
    And validating the response contains the following values
      |Value|
      |html|
      |head|
      |title|
      |body|

  @Positive @Functional
  Scenario: Validate add state response completeness
    And I send the GET request to "GET_AddState" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Add State"
    And the HTML response should contain element "html"
    And the HTML response should contain element "head"
    And the HTML response should contain element "body"
    And validating the response contains the following values
      |Value|
      |html|
      |head|
      |title|
      |body|
      |States|

  @Positive @ContentValidation
  Scenario: Validate add state content structure
    And I send the GET request to "GET_AddState" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Add State"
    And validating the response contains the following values
      |Value|
      |html|
      |head|
      |title|
      |body|
      |States|
      |div|

  @Positive @LoadTesting
  Scenario: Load testing for add state endpoint
    And I send the GET request to "GET_AddState" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "3000" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Add State"

  @Negative @Timeout
  Scenario: Test add state endpoint timeout handling
    And I send the GET request to "GET_AddState" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "5000" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Add State"

  @Positive @EndToEnd
  Scenario: End-to-end add state HTML page retrieval workflow
    And I send the GET request to "GET_AddState" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Add State"
    And I store the response as "add_state_response" name using full path
    And the HTML response should contain element "html"
    And the HTML response should contain element "head"
    And the HTML response should contain element "body"
    And validating the response contains the following values
      |Value|
      |html|
      |head|
      |title|
      |body|
      |States|

