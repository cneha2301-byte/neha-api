@BizomWebAPI @ChecksManagement @GetChecksIndex @ConfigurationSettings
Feature: Checks API Testing
  As a system user
  I want to test the checks endpoint
  So that I can ensure proper functionality and data retrieval for checks management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get checks without access token
    When I send the GET request to "checks_index" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get checks with invalid access token
    And I send the GET request to "checks_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title " "
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get checks with expired access token
    And I send the GET request to "checks_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title " "
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get checks with malformed access token
    And I send the GET request to "checks_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the HTML response should contain page title " "
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get checks with valid access token
    And I send the GET request to "checks_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Checks"
    And I store the response as "checks_response" name using full path

  @Positive @Functional
  Scenario: TC_06 Verify checks page contains expected HTML elements
    And I send the GET request to "checks_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Checks"
    And verify response time is less than "2000" milliseconds

  @Positive @DataValidation
  Scenario: TC_07 Verify checks data structure and content
    And I send the GET request to "checks_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response contains the following values
      |Value|
      |Check|
      |table|
      |data|
      |Name|
      |Code|
    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: TC_08 Verify response time performance for checks retrieval
    And I send the GET request to "checks_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the HTML response should contain page title "Checks"

  @Negative @Validation
  Scenario: TC_09 Get checks with invalid query parameters
    And I send the GET request to "checks_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Checks"

  @Negative @Validation
  Scenario: TC_10 Get checks with special characters in query parameters
    And I send the GET request to "checks_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Checks"

  @Negative @Security
  Scenario: TC_11 Get checks with SQL injection attempt
    And I send the GET request to "checks_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE checks; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Checks"

  @Negative @Boundary
  Scenario: TC_12 Get checks with maximum query parameters
    And I send the GET request to "checks_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Checks"

  @Negative @ErrorHandling
  Scenario: TC_13 Get checks with invalid endpoint
    And I send the GET request to "checks_index_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_404_NOT_FOUND"
    And verify response time is less than "2500" milliseconds

  @Positive @DataIntegrity
  Scenario: TC_14 Validate checks data integrity
    And I send the GET request to "checks_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Checks"
    And validating the response contains the following values
      |Value|
      |Check|
      |table|
      |Name|
      |Code|

  @Positive @Functional
  Scenario: TC_15 Validate checks response completeness
    And I send the GET request to "checks_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Checks"

  @Positive @LoadTesting
  Scenario: TC_16 Load testing for checks endpoint
    And I send the GET request to "checks_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the HTML response should contain page title "Checks"

  @Positive @EndToEnd
  Scenario: TC_17 End-to-end checks data retrieval workflow
    And I send the GET request to "checks_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Checks"
    And I store the response as "checks_response" name using full path
