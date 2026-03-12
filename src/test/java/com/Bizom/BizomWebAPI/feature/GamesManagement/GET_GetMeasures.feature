@BizomWebAPI @PI @GamesManagement @GetMeasures @DataProcessing
Feature: Get Measures API Testing
  As a system user
  I want to test the get measures endpoint
  So that I can ensure proper functionality and data retrieval for games measures management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get measures without access token
    When I send the GET request to "games_getmeasures" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get measures with invalid access token
    And I send the GET request to "games_getmeasures" endpoint with dynamic access token and query parameters
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
  Scenario: TC_03 Get measures with expired access token
    And I send the GET request to "games_getmeasures" endpoint with dynamic access token and query parameters
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
  Scenario: TC_04 Get measures with malformed access token
    And I send the GET request to "games_getmeasures" endpoint with dynamic access token and query parameters
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
  Scenario: TC_05 Get measures with valid access token
    And I send the GET request to "games_getmeasures" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data|[]|
    And I store the response as "measures_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate measures response structure
    And I send the GET request to "games_getmeasures" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate measures array structure
    And I send the GET request to "games_getmeasures" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|

  @Positive @Performance
  Scenario: TC_08 Performance test for measures endpoint
    And I send the GET request to "games_getmeasures" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data|[]|

  @Positive @Concurrency
  Scenario: TC_09 Concurrent access test for measures endpoint
    And I send the GET request to "games_getmeasures" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data|[]|

  @Negative @Validation
  Scenario: TC_10 Get measures with invalid query parameters
    And I send the GET request to "games_getmeasures" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data|[]|

  @Negative @Validation
  Scenario: TC_11 Get measures with special characters in query parameters
    And I send the GET request to "games_getmeasures" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data|[]|

  @Negative @Security
  Scenario: TC_12 Get measures with SQL injection attempt
    And I send the GET request to "games_getmeasures" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE games; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data|[]|

  @Negative @Boundary
  Scenario: TC_13 Get measures with maximum query parameters
    And I send the GET request to "games_getmeasures" endpoint with dynamic access token and query parameters
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
      |$.Data|[]|

#  @Negative @ErrorHandling
#  Scenario: TC_14 Get measures with invalid endpoint
#    And I send the GET request to "games_getmeasures_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_15 Validate measures business logic
    And I send the GET request to "games_getmeasures" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|

  @Positive @DataIntegrity
  Scenario: TC_16 Validate measures data integrity
    And I send the GET request to "games_getmeasures" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|

  @Positive @Regression
  Scenario: TC_17 Regression test for measures endpoint
    And I send the GET request to "games_getmeasures" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|

  @Positive @Functional
  Scenario: TC_18 Validate measures response completeness
    And I send the GET request to "games_getmeasures" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data|[]|

  @Positive @ArrayValidation
  Scenario: TC_19 Validate measures array structure
    And I send the GET request to "games_getmeasures" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data|[]|

  @Positive @ContentValidation
  Scenario: TC_20 Validate measures content structure
    And I send the GET request to "games_getmeasures" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Data|

  @Positive @LoadTesting
  Scenario: TC_21 Load testing for measures endpoint
    And I send the GET request to "games_getmeasures" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data|[]|

  @Negative @Timeout
  Scenario: TC_22 Test measures endpoint timeout handling
    And I send the GET request to "games_getmeasures" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data|[]|

  @Positive @EndToEnd
  Scenario: TC_23 End-to-end measures data retrieval workflow
    And I send the GET request to "games_getmeasures" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data|[]|
    And I store the response as "measures_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|

