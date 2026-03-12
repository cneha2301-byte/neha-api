@BizomWebAPI @PI @GamesManagement @GetGameDetail @DataProcessing
 #This API have notice in Responce so for a time being we are not testing this API
Feature: Get Game Detail API Testing
  As a system user
  I want to test the get game detail endpoint
  So that I can ensure proper functionality and data retrieval for game detail management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get game detail without access token
    When I send the GET request to "games_getgamedetail" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_02 Get game detail with invalid access token
#    And I send the GET request to "games_getgamedetail" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|invalid_token_12345|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds
#
#  @Negative @Security
#  Scenario: TC_03 Get game detail with expired access token
#    And I send the GET request to "games_getgamedetail" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|expired_token_12345|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds
#
#  @Negative @Security
#  Scenario: TC_04 Get game detail with malformed access token
#    And I send the GET request to "games_getgamedetail" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|malformed.token.here|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds
#
#  @Positive @Smoke
#  Scenario: TC_05 Get game detail with valid access token
#    And I send the GET request to "games_getgamedetail" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#    And I store the response as "game_detail_response" name using full path
#
#  @Positive @DataValidation
#  Scenario: TC_06 Validate game detail response structure
#    And I send the GET request to "games_getgamedetail" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Data|object|
#
#  @Positive @DataValidation
#  Scenario: TC_07 Validate game detail Data object structure
#    And I send the GET request to "games_getgamedetail" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Data|object|
#      |$.Data.Game|object|
#      |$.Data.Gamekpi|array|
#      |$.Data.Gamebadge|array|
#      |$.Data.Gameconversion|array|
#      |$.Data.Gameteam|array|
#      |$.Data.Userids|array|
#      |$.Data.playerWiseTeams|object|
#      |$.Data.Gametheme|array|
#
#  @Positive @DataValidation
#  Scenario: TC_08 Validate Game nested object structure
#    And I send the GET request to "games_getgamedetail" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Data.Game|object|
#      |$.Data.Game.Game|object|
#      |$.Data.Game.Game.isactive|number|
#      |$.Data.Game.Game.issingleplayer|number|
#
#  @Positive @DataValidation
#  Scenario: TC_09 Validate playerWiseTeams object structure
#    And I send the GET request to "games_getgamedetail" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Data.playerWiseTeams|object|
#      |$.Data.playerWiseTeams.Users|array|
#      |$.Data.playerWiseTeams.Teams|array|
#
#  @Positive @DataValidation
#  Scenario: TC_10 Validate game detail arrays structure
#    And I send the GET request to "games_getgamedetail" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Data.Gamekpi|array|
#      |$.Data.Gamebadge|array|
#      |$.Data.Gameconversion|array|
#      |$.Data.Gameteam|array|
#      |$.Data.Userids|array|
#      |$.Data.Gametheme|array|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Data.Gamekpi|[]|
#      |$.Data.Gamebadge|[]|
#      |$.Data.Gameconversion|[]|
#      |$.Data.Gameteam|[]|
#      |$.Data.Userids|[]|
#      |$.Data.Gametheme|[]|
#      |$.Data.playerWiseTeams.Users|[]|
#      |$.Data.playerWiseTeams.Teams|[]|
#
#  @Positive @Performance
#  Scenario: TC_11 Performance test for game detail endpoint
#    And I send the GET request to "games_getgamedetail" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#
#  @Positive @Concurrency
#  Scenario: TC_12 Concurrent access test for game detail endpoint
#    And I send the GET request to "games_getgamedetail" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#
#  @Negative @Validation
#  Scenario: TC_13 Get game detail with invalid query parameters
#    And I send the GET request to "games_getgamedetail" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |invalid_param|invalid_value|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#
#  @Negative @Validation
#  Scenario: TC_14 Get game detail with special characters in query parameters
#    And I send the GET request to "games_getgamedetail" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#
#  @Negative @Security
#  Scenario: TC_15 Get game detail with SQL injection attempt
#    And I send the GET request to "games_getgamedetail" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|'; DROP TABLE games; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#
#  @Negative @Boundary
#  Scenario: TC_16 Get game detail with maximum query parameters
#    And I send the GET request to "games_getgamedetail" endpoint with dynamic access token and query parameters
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
#      |$.Result|true|
#      |$.Reason|""|
#
#  @Negative @ErrorHandling
#  Scenario: TC_17 Get game detail with invalid endpoint
#    And I send the GET request to "games_getgamedetail_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds
#
#  @Positive @BusinessLogic
#  Scenario: TC_18 Validate game detail business logic
#    And I send the GET request to "games_getgamedetail" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Data|object|
#      |$.Data.Game|object|
#      |$.Data.Gamekpi|array|
#      |$.Data.Gamebadge|array|
#      |$.Data.Gameconversion|array|
#      |$.Data.Gameteam|array|
#      |$.Data.Userids|array|
#      |$.Data.playerWiseTeams|object|
#      |$.Data.Gametheme|array|
#
#  @Positive @DataIntegrity
#  Scenario: TC_19 Validate game detail data integrity
#    And I send the GET request to "games_getgamedetail" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Data|object|
#      |$.Data.Game|object|
#      |$.Data.Game.Game|object|
#      |$.Data.Gamekpi|array|
#      |$.Data.Gamebadge|array|
#      |$.Data.Gameconversion|array|
#      |$.Data.Gameteam|array|
#      |$.Data.Userids|array|
#      |$.Data.playerWiseTeams|object|
#      |$.Data.Gametheme|array|
#
#  @Positive @Regression
#  Scenario: TC_20 Regression test for game detail endpoint
#    And I send the GET request to "games_getgamedetail" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Data|object|
#      |$.Data.Game|object|
#      |$.Data.Gamekpi|array|
#      |$.Data.Gamebadge|array|
#      |$.Data.Gameconversion|array|
#      |$.Data.Gameteam|array|
#      |$.Data.Userids|array|
#      |$.Data.playerWiseTeams|object|
#      |$.Data.Gametheme|array|
#
#  @Positive @Functional
#  Scenario: TC_21 Validate game detail response completeness
#    And I send the GET request to "games_getgamedetail" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Data|object|
#      |$.Data.Game|object|
#      |$.Data.Gamekpi|array|
#      |$.Data.Gamebadge|array|
#      |$.Data.Gameconversion|array|
#      |$.Data.Gameteam|array|
#      |$.Data.Userids|array|
#      |$.Data.playerWiseTeams|object|
#      |$.Data.Gametheme|array|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#
#  @Positive @ContentValidation
#  Scenario: TC_22 Validate game detail content structure
#    And I send the GET request to "games_getgamedetail" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response contains the following values
#      |Value|
#      |Result|
#      |Reason|
#      |Data|
#      |Game|
#      |Gamekpi|
#      |Gamebadge|
#      |Gameconversion|
#      |Gameteam|
#      |Userids|
#      |playerWiseTeams|
#      |Gametheme|
#      |Users|
#      |Teams|
#
#  @Positive @LoadTesting
#  Scenario: TC_23 Load testing for game detail endpoint
#    And I send the GET request to "games_getgamedetail" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "3000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#
#  @Negative @Timeout
#  Scenario: TC_24 Test game detail endpoint timeout handling
#    And I send the GET request to "games_getgamedetail" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "5000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#
#  @Positive @EndToEnd
#  Scenario: TC_25 End-to-end game detail data retrieval workflow
#    And I send the GET request to "games_getgamedetail" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#    And I store the response as "game_detail_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Data|object|
#      |$.Data.Game|object|
#      |$.Data.Game.Game|object|
#      |$.Data.Gamekpi|array|
#      |$.Data.Gamebadge|array|
#      |$.Data.Gameconversion|array|
#      |$.Data.Gameteam|array|
#      |$.Data.Userids|array|
#      |$.Data.playerWiseTeams|object|
#      |$.Data.playerWiseTeams.Users|array|
#      |$.Data.playerWiseTeams.Teams|array|
#      |$.Data.Gametheme|array|

