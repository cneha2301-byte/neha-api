@BizomWebAPI @LanguagesManagement @GetLanguages @UserAccessManagement @CE
Feature: Get Languages API Testing
  As a system user
  I want to test the get languages endpoint
  So that I can ensure proper functionality and data retrieval for languages

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get languages without access token
    When I send the GET request to "get_languages" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get languages with invalid access token
#    And I send the GET request to "get_languages" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|invalid_token_12345|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get languages with expired access token
#    And I send the GET request to "get_languages" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|expired_token_12345|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds
#
#  @Negative @Security
#  Scenario: Get languages with malformed access token
#    And I send the GET request to "get_languages" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|malformed.token.here|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds
#
#  @Positive @Smoke
#  Scenario: Get languages with valid access token
#    And I send the GET request to "get_languages" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.reason|There is no active languages|
#    And I store the response as "get_languages_response" name using full path

  @Positive @DataValidation
  Scenario: Validate get languages response structure
    And I send the GET request to "get_languages" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|There is no active languages|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|

  @Positive @DataValidation
  Scenario: Validate get languages with static values
    And I send the GET request to "get_languages" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|There is no active languages|

  @Positive @Performance
  Scenario: Performance test for get languages endpoint
    And I send the GET request to "get_languages" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|There is no active languages|

  @Positive @Concurrency
  Scenario: Concurrent access test for get languages endpoint
    And I send the GET request to "get_languages" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|There is no active languages|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|

  @Negative @Validation
  Scenario: Get languages with invalid query parameters
    And I send the GET request to "get_languages" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|There is no active languages|

  @Negative @Validation
  Scenario: Get languages with special characters in query parameters
    And I send the GET request to "get_languages" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|There is no active languages|

  @Negative @Security
  Scenario: Get languages with SQL injection attempt
    And I send the GET request to "get_languages" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE languages; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|There is no active languages|

  @Negative @Boundary
  Scenario: Get languages with maximum query parameters
    And I send the GET request to "get_languages" endpoint with dynamic access token and query parameters
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
      |$.result|false|
      |$.reason|There is no active languages|

#  @Negative @ErrorHandling
#  Scenario: Get languages with invalid endpoint
#    And I send the GET request to "get_languages_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

  @Positive @BusinessLogic
  Scenario: Validate get languages business logic
    And I send the GET request to "get_languages" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|There is no active languages|

  @Positive @DataIntegrity
  Scenario: Validate get languages data integrity
    And I send the GET request to "get_languages" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
    And validating the response contains the following values
      |Value|
      |result|
      |reason|
      |There is no active languages|

  @Positive @Regression
  Scenario: Regression test for get languages endpoint
    And I send the GET request to "get_languages" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|There is no active languages|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|

  @Positive @Functional
  Scenario: Validate get languages response completeness
    And I send the GET request to "get_languages" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|There is no active languages|

  @Positive @ContentValidation
  Scenario: Validate get languages content structure
    And I send the GET request to "get_languages" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|There is no active languages|
    And validating the response contains the following values
      |Value|
      |result|
      |reason|
      |There is no active languages|

  @Positive @LoadTesting
  Scenario: Load testing for get languages endpoint
    And I send the GET request to "get_languages" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|There is no active languages|

  @Negative @Timeout
  Scenario: Test get languages endpoint timeout handling
    And I send the GET request to "get_languages" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|There is no active languages|

  @Positive @EndToEnd
  Scenario: End-to-end get languages data retrieval workflow
    And I send the GET request to "get_languages" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|There is no active languages|
    And I store the response as "get_languages_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
    And validating the response contains the following values
      |Value|
      |result|
      |reason|
      |There is no active languages|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|There is no active languages|

