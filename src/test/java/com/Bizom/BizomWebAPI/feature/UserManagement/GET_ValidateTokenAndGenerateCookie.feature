@BizomWebAPI @CE @GetValidateTokenAndGenerateCookie @SystemIntegration
Feature: Validate Token And Generate Cookie API Testing
  As a system user
  I want to test the validate token and generate cookie endpoint
  So that I can ensure proper functionality for token validation and cookie generation in user management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Validate token and generate cookie without access token
    When I send the GET request to "users_validatetokenandgeneratecookie" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Validate token and generate cookie with invalid access token
    And I send the GET request to "users_validatetokenandgeneratecookie" endpoint with dynamic access token and query parameters
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
  Scenario: TC_03 Validate token and generate cookie with expired access token
    And I send the GET request to "users_validatetokenandgeneratecookie" endpoint with dynamic access token and query parameters
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
  Scenario: TC_04 Validate token and generate cookie with malformed access token
    And I send the GET request to "users_validatetokenandgeneratecookie" endpoint with dynamic access token and query parameters
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
  Scenario: TC_05 Validate token and generate cookie with valid access token
    And I send the GET request to "users_validatetokenandgeneratecookie" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|data found|
    And I store the response as "validate_token_and_generate_cookie_response" name using full path

#  @Positive @DataValidation
#  Scenario: TC_06 Validate token and generate cookie response structure
#    And I send the GET request to "users_validatetokenandgeneratecookie" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|data found|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|

#  @Positive @DataValidation
#  Scenario: TC_07 Validate token and generate cookie Result field
#    And I send the GET request to "users_validatetokenandgeneratecookie" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|

  @Positive @DataValidation
  Scenario: TC_08 Validate token and generate cookie Reason field
    And I send the GET request to "users_validatetokenandgeneratecookie" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Reason|data found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Reason|string|

#  @Positive @DataValidation
#  Scenario: TC_09 Validate token and generate cookie complete structure
#    And I send the GET request to "users_validatetokenandgeneratecookie" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|data found|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|

  @Positive @Performance
  Scenario: TC_10 Performance test for validate token and generate cookie endpoint
    And I send the GET request to "users_validatetokenandgeneratecookie" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|data found|

  @Positive @Concurrency
  Scenario: TC_11 Concurrent access test for validate token and generate cookie endpoint
    And I send the GET request to "users_validatetokenandgeneratecookie" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|data found|

  @Negative @Validation
  Scenario: TC_12 Validate token and generate cookie with invalid query parameters
    And I send the GET request to "users_validatetokenandgeneratecookie" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|data found|

  @Negative @Validation
  Scenario: TC_13 Validate token and generate cookie with special characters in query parameters
    And I send the GET request to "users_validatetokenandgeneratecookie" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|data found|

  @Negative @Security
  Scenario: TC_14 Validate token and generate cookie with SQL injection attempt
    And I send the GET request to "users_validatetokenandgeneratecookie" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE users; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|data found|

  @Negative @Boundary
  Scenario: TC_15 Validate token and generate cookie with maximum query parameters
    And I send the GET request to "users_validatetokenandgeneratecookie" endpoint with dynamic access token and query parameters
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
      |$.Result|true|
      |$.Reason|data found|

#  @Negative @ErrorHandling
#  Scenario: TC_16 Validate token and generate cookie with invalid endpoint
#    And I send the GET request to "users_validatetokenandgeneratecookie_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

#  @Positive @BusinessLogic
#  Scenario: TC_17 Validate token and generate cookie business logic
#    And I send the GET request to "users_validatetokenandgeneratecookie" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|data found|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|

  @Positive @DataIntegrity
  Scenario: TC_18 Validate token and generate cookie data integrity
    And I send the GET request to "users_validatetokenandgeneratecookie" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|data found|

#  @Positive @Regression
#  Scenario: TC_19 Regression test for validate token and generate cookie endpoint
#    And I send the GET request to "users_validatetokenandgeneratecookie" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|data found|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|

#  @Positive @Functional
#  Scenario: TC_20 Validate token and generate cookie response completeness
#    And I send the GET request to "users_validatetokenandgeneratecookie" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|data found|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#    And validating the response contains the following values
#      |Value|
#      |Result|
#      |Reason|
#      |data found|
#    And I store the response as "validate_token_and_generate_cookie_response" name using full path

