@BizomWebAPI @PI @GamesManagement @GetGetScore @DataProcessing
#This API have notice in Responce so for a time being we are not testing this API
Feature: Get Score API Testing
  As a system user
  I want to test the get score endpoint
  So that I can ensure proper functionality and data retrieval for game scores and rankings

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get score without access token
    When I send the GET request to "games_getscore" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get score with invalid access token
    And I send the GET request to "games_getscore" endpoint with dynamic access token and query parameters
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
  Scenario: TC_03 Get score with expired access token
    And I send the GET request to "games_getscore" endpoint with dynamic access token and query parameters
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
  Scenario: TC_04 Get score with malformed access token
    And I send the GET request to "games_getscore" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

#  @Positive @Smoke
#  Scenario: TC_05 Get score with valid access token
#    And I send the GET request to "games_getscore" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.rankWiseUsers|[]|
#      |$.kpiWisePlayers|[]|
#      |$.userWiseIncentive|[]|
#    And I store the response as "get_score_response" name using full path
#
#  @Positive @DataValidation
#  Scenario: TC_06 Validate get score response structure
#    And I send the GET request to "games_getscore" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.rankWiseUsers|[]|
#      |$.kpiWisePlayers|[]|
#      |$.userWiseIncentive|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.rankWiseUsers|array|
#      |$.kpiWisePlayers|array|
#      |$.userWiseIncentive|array|
#
#  @Positive @DataValidation
#  Scenario: TC_07 Validate get score rankWiseUsers array structure
#    And I send the GET request to "games_getscore" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.rankWiseUsers|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.rankWiseUsers|array|
#
#  @Positive @DataValidation
#  Scenario: TC_08 Validate get score kpiWisePlayers array structure
#    And I send the GET request to "games_getscore" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.kpiWisePlayers|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.kpiWisePlayers|array|
#
#  @Positive @DataValidation
#  Scenario: TC_09 Validate get score userWiseIncentive array structure
#    And I send the GET request to "games_getscore" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.userWiseIncentive|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.userWiseIncentive|array|
#
#  @Positive @DataValidation
#  Scenario: TC_10 Validate get score complete structure
#    And I send the GET request to "games_getscore" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.rankWiseUsers|[]|
#      |$.kpiWisePlayers|[]|
#      |$.userWiseIncentive|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.rankWiseUsers|array|
#      |$.kpiWisePlayers|array|
#      |$.userWiseIncentive|array|
#
#  @Positive @Performance
#  Scenario: TC_11 Performance test for get score endpoint
#    And I send the GET request to "games_getscore" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.rankWiseUsers|[]|
#      |$.kpiWisePlayers|[]|
#      |$.userWiseIncentive|[]|
#
#  @Positive @Concurrency
#  Scenario: TC_12 Concurrent access test for get score endpoint
#    And I send the GET request to "games_getscore" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.rankWiseUsers|[]|
#      |$.kpiWisePlayers|[]|
#      |$.userWiseIncentive|[]|
#
#  @Negative @Validation
#  Scenario: TC_13 Get score with invalid query parameters
#    And I send the GET request to "games_getscore" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |invalid_param|invalid_value|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.rankWiseUsers|[]|
#      |$.kpiWisePlayers|[]|
#      |$.userWiseIncentive|[]|
#
#  @Negative @Validation
#  Scenario: TC_14 Get score with special characters in query parameters
#    And I send the GET request to "games_getscore" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.rankWiseUsers|[]|
#      |$.kpiWisePlayers|[]|
#      |$.userWiseIncentive|[]|
#
#  @Negative @Security
#  Scenario: TC_15 Get score with SQL injection attempt
#    And I send the GET request to "games_getscore" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|'; DROP TABLE games; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.rankWiseUsers|[]|
#      |$.kpiWisePlayers|[]|
#      |$.userWiseIncentive|[]|
#
#  @Negative @Boundary
#  Scenario: TC_16 Get score with maximum query parameters
#    And I send the GET request to "games_getscore" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |param1|value1|
#      |param2|value2|
#      |param3|value3|
#      |param4|value4|
#      |param5|value5|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.rankWiseUsers|[]|
#      |$.kpiWisePlayers|[]|
#      |$.userWiseIncentive|[]|
#
#  @Negative @ErrorHandling
#  Scenario: TC_17 Get score with invalid endpoint
#    And I send the GET request to "games_getscore_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds
#
#  @Positive @BusinessLogic
#  Scenario: TC_18 Validate get score business logic
#    And I send the GET request to "games_getscore" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.rankWiseUsers|[]|
#      |$.kpiWisePlayers|[]|
#      |$.userWiseIncentive|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.rankWiseUsers|array|
#      |$.kpiWisePlayers|array|
#      |$.userWiseIncentive|array|
#
#  @Positive @DataIntegrity
#  Scenario: TC_19 Validate get score data integrity
#    And I send the GET request to "games_getscore" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.rankWiseUsers|array|
#      |$.kpiWisePlayers|array|
#      |$.userWiseIncentive|array|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.rankWiseUsers|[]|
#      |$.kpiWisePlayers|[]|
#      |$.userWiseIncentive|[]|
#
#  @Positive @Regression
#  Scenario: TC_20 Regression test for get score endpoint
#    And I send the GET request to "games_getscore" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.rankWiseUsers|[]|
#      |$.kpiWisePlayers|[]|
#      |$.userWiseIncentive|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.rankWiseUsers|array|
#      |$.kpiWisePlayers|array|
#      |$.userWiseIncentive|array|
#
#  @Positive @Functional
#  Scenario: TC_21 Validate get score response completeness
#    And I send the GET request to "games_getscore" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.rankWiseUsers|[]|
#      |$.kpiWisePlayers|[]|
#      |$.userWiseIncentive|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.rankWiseUsers|array|
#      |$.kpiWisePlayers|array|
#      |$.userWiseIncentive|array|
#    And validating the response contains the following values
#      |Value|
#      |rankWiseUsers|
#      |kpiWisePlayers|
#      |userWiseIncentive|
#    And I store the response as "get_score_response" name using full path

