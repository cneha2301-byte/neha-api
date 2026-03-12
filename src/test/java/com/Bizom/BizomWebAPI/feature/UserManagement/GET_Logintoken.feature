@BizomWebAPI @CE @GetLogintoken @ReportingOperations
Feature: Login Token API Testing
  As a system user
  I want to test the login token endpoint
  So that I can ensure proper functionality for login token management in user authentication

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get login token without access token
    When I send the GET request to "users_logintoken" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title ""
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get login token with invalid access token
    And I send the GET request to "users_logintoken" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get login token with expired access token
    And I send the GET request to "users_logintoken" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get login token with malformed access token
    And I send the GET request to "users_logintoken" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get login token with valid access token
    And I send the GET request to "users_logintoken" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.success|0|
      |$.message|""|
    And I store the response as "login_token_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate login token response structure
    And I send the GET request to "users_logintoken" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.success|0|
      |$.message|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.success|number|
      |$.message|string|

  @Positive @DataValidation
  Scenario: TC_07 Validate login token success field
    And I send the GET request to "users_logintoken" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.success|0|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.success|number|

  @Positive @DataValidation
  Scenario: TC_08 Validate login token message field
    And I send the GET request to "users_logintoken" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.message|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.message|string|

  @Positive @DataValidation
  Scenario: TC_09 Validate login token complete structure
    And I send the GET request to "users_logintoken" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.success|0|
      |$.message|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.success|number|
      |$.message|string|

  @Positive @Performance
  Scenario: TC_10 Performance test for login token endpoint
    And I send the GET request to "users_logintoken" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.success|0|
      |$.message|""|

  @Positive @Concurrency
  Scenario: TC_11 Concurrent access test for login token endpoint
    And I send the GET request to "users_logintoken" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.success|0|
      |$.message|""|

  @Negative @Validation
  Scenario: TC_12 Get login token with invalid query parameters
    And I send the GET request to "users_logintoken" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.success|0|
      |$.message|""|

  @Negative @Validation
  Scenario: TC_13 Get login token with special characters in query parameters
    And I send the GET request to "users_logintoken" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.success|0|
      |$.message|""|

  @Negative @Security
  Scenario: TC_14 Get login token with SQL injection attempt
    And I send the GET request to "users_logintoken" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE users; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.success|0|
      |$.message|""|

  @Negative @Boundary
  Scenario: TC_15 Get login token with maximum query parameters
    And I send the GET request to "users_logintoken" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.success|0|
      |$.message|""|

#  @Negative @ErrorHandling
#  Scenario: TC_16 Get login token with invalid endpoint
#    And I send the GET request to "users_logintoken_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_17 Validate login token business logic
    And I send the GET request to "users_logintoken" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.success|0|
      |$.message|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.success|number|
      |$.message|string|

  @Positive @DataIntegrity
  Scenario: TC_18 Validate login token data integrity
    And I send the GET request to "users_logintoken" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.success|number|
      |$.message|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.success|0|
      |$.message|""|

  @Positive @Regression
  Scenario: TC_19 Regression test for login token endpoint
    And I send the GET request to "users_logintoken" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.success|0|
      |$.message|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.success|number|
      |$.message|string|

  @Positive @Functional
  Scenario: TC_20 Validate login token response completeness
    And I send the GET request to "users_logintoken" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.success|0|
      |$.message|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.success|number|
      |$.message|string|
    And validating the response contains the following values
      |Value|
      |success|
      |message|
    And I store the response as "login_token_response" name using full path

