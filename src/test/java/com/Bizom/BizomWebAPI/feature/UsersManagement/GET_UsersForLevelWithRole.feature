@BizomWebAPI @CE @UsersManagement @GetUsersForLevelWithRole
Feature: Get Users For Level With Role API Testing
  As a system user
  I want to test the getUsersForLevelWithRole endpoint
  So that I can ensure proper functionality and data retrieval for users for level with role

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |accept-language|en-US,en;q=0.9|
      |priority|u=0, i|
      |sec-ch-ua|"Google Chrome";v="143", "Chromium";v="143", "Not A(Brand";v="24"|
      |sec-ch-ua-mobile|?0|
      |sec-ch-ua-platform|"Windows"|
      |sec-fetch-dest|document|
      |sec-fetch-mode|navigate|
      |sec-fetch-site|none|
      |sec-fetch-user|?1|
      |upgrade-insecure-requests|1|
      |user-agent|Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36|
      |cookie|toolbarDisplay=hide; PHPSESSID=SVU0lt0NuLWzW9DmBrnvh5e3b9gUqm5VlEBBbWPl; CAKEPHP=og843cmth1usd1br358jq9v21h|

  @Negative @Security
  Scenario: TC_01 Get users for level with role without access token
    When I send the GET request to "getUsersForLevelWithRole" endpoint with path parameters
      |Path|Value|
      |levelId|1|
      |role|all|
      |status|all|
      |type|all|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_02 Get users for level with role with invalid access token
    And I send the GET request to "getUsersForLevelWithRole" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|levelId|1|
      | | |role|all|
      | | |status|all|
      | | |type|all|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_03 Get users for level with role with expired access token
    And I send the GET request to "getUsersForLevelWithRole" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|levelId|1|
      | | |role|all|
      | | |status|all|
      | | |type|all|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_04 Get users for level with role with malformed access token
    And I send the GET request to "getUsersForLevelWithRole" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|levelId|1|
      | | |role|all|
      | | |status|all|
      | | |type|all|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get users for level with role with valid access token
    And I send the GET request to "getUsersForLevelWithRole" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|levelId|1|
      | | |role|all|
      | | |status|all|
      | | |type|all|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
      |$.users.2|"SLV Traders"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.users|object|

  @Positive @Functional
  Scenario: TC_06 Get users for level with role for another valid levelId
    And I send the GET request to "getUsersForLevelWithRole" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|levelId|2|
      | | |role|all|
      | | |status|all|
      | | |type|all|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
      |$.users.3|"Covid MGR"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.users|object|

  @Negative @Validation
  Scenario: TC_07 Get users for level with role with invalid levelId
    And I send the GET request to "getUsersForLevelWithRole" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|levelId|abc|
      | | |role|all|
      | | |status|all|
      | | |type|all|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Negative @Validation
  Scenario: TC_08 Get users for level with role with non-existent levelId
    And I send the GET request to "getUsersForLevelWithRole" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|levelId|999999|
      | | |role|all|
      | | |status|all|
      | | |type|all|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Negative @ErrorHandling
  Scenario: TC_09 Get users for level with role with invalid endpoint
    And I send the GET request to "getUsersForLevelWithRole_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|levelId|1|
      | | |role|all|
      | | |status|all|
      | | |type|all|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: TC_10 Performance test for getUsersForLevelWithRole endpoint
    And I send the GET request to "getUsersForLevelWithRole" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|levelId|1|
      | | |role|all|
      | | |status|all|
      | | |type|all|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Regression
  Scenario: TC_11 Regression test for getUsersForLevelWithRole endpoint
    And I send the GET request to "getUsersForLevelWithRole" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|levelId|1|
      | | |role|all|
      | | |status|all|
      | | |type|all|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: TC_12 Get users for level with role with valid access token and DB validation
    And I send the GET request to "getUsersForLevelWithRole" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|levelId|1|
      | | |role|all|
      | | |status|all|
      | | |type|all|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
      |$.users.2|DB:users:name: id=2|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.users|object|
