@BizomWebAPI @CE @UsersManagement @GetUsersById
Feature: Get Users By Id API Testing
  As a system user
  I want to test the getusers/{id} endpoint with query parameters
  So that I can ensure proper functionality and data retrieval for users by id

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
  Scenario: TC_01 Get users by ids without access token
    When I send the GET request to "getusers" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |||userId|14|
      |ids|505|||
      |datetype|modified|||
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get users by ids with invalid access token
    And I send the GET request to "getusers" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|userId|14|
      |ids|505|||
      |datetype|modified|||
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get users by ids with expired access token
    And I send the GET request to "getusers" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|userId|14|
      |ids|505|||
      |datetype|modified|||
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get users by ids with malformed access token
    And I send the GET request to "getusers" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|userId|14|
      |ids|505|||
      |datetype|modified|||
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get users by ids with valid access token
    And I send the GET request to "getusers" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|14|
      |ids|505|||
      |datetype|modified|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.Users[0].id|"505"|
      |$.Users[0].username|"NeWoQruUmP"|
      |$.Users[0].name|"mobisy"|
      |$.Users[0].email|"wad@mobisy.com"|
      |$.Users[0].phoneno|"9916225589"|
      |$.Users[0].employeeid|"14421"|
      |$.Users[0].active|"1"|
      |$.Users[0].role|"WAREHOUSE MANAGER"|
      |$.Users[0].designation|"DM"|
      |$.Users[0].reportingto_name|"SLV Traders"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.Users|array|
      |$.Users[0].id|string|
      |$.Users[0].username|string|
      |$.Users[0].name|string|
      |$.Users[0].email|string|
      |$.Users[0].phoneno|string|
      |$.Users[0].employeeid|string|
      |$.Users[0].active|string|
      |$.Users[0].role|string|
      |$.Users[0].designation|string|
      |$.Users[0].reportingto_name|string|

  @Positive @Performance
  Scenario: TC_06 Performance test for getusers endpoint
    And I send the GET request to "getusers" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|14|
      |ids|505|||
      |datetype|modified|||
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.Users[0].id|"505"|
      |$.Users[0].username|"NeWoQruUmP"|
      |$.Users[0].name|"mobisy"|
      |$.Users[0].email|"wad@mobisy.com"|
      |$.Users[0].phoneno|"9916225589"|
      |$.Users[0].employeeid|"14421"|
      |$.Users[0].active|"1"|
      |$.Users[0].role|"WAREHOUSE MANAGER"|
      |$.Users[0].designation|"DM"|
      |$.Users[0].reportingto_name|"SLV Traders"|

  @Positive @Regression
  Scenario: TC_07 Regression test for getusers endpoint
    And I send the GET request to "getusers" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|14|
      |ids|505|||
      |datetype|modified|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.Users[0].id|"505"|
      |$.Users[0].username|"NeWoQruUmP"|
      |$.Users[0].name|"mobisy"|
      |$.Users[0].email|"wad@mobisy.com"|
      |$.Users[0].phoneno|"9916225589"|
      |$.Users[0].employeeid|"14421"|
      |$.Users[0].active|"1"|
      |$.Users[0].role|"WAREHOUSE MANAGER"|
      |$.Users[0].designation|"DM"|
      |$.Users[0].reportingto_name|"SLV Traders"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.Users|array|
      |$.Users[0].id|string|
      |$.Users[0].username|string|
      |$.Users[0].name|string|
      |$.Users[0].email|string|
      |$.Users[0].phoneno|string|
      |$.Users[0].employeeid|string|
      |$.Users[0].active|string|
      |$.Users[0].role|string|
      |$.Users[0].designation|string|
      |$.Users[0].reportingto_name|string|

  @Negative @ErrorHandling
  Scenario: TC_08 Get users by id with invalid endpoint
    And I send the GET request to "getusers_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|14|
      |ids|505|||
      |datetype|modified|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Users"

  @Positive @Smoke
  Scenario: TC_09 Get users by id with valid access token and DB validation
    And I send the GET request to "getusers" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|14|
      |ids|505|||
      |datetype|modified|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Users[0].name|DB:users:name: id=505|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.Users|array|
      |$.Users[0].id|string|