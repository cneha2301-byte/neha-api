@BizomWebAPI @CE @UsersManagement @GetUsersDataForEntities
Feature: Get Users Data For Entities API Testing
  As a system user
  I want to test the getUsersDataForEntities endpoint
  So that I can ensure proper functionality and data retrieval for users data for entities

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
  Scenario: TC_01 Get users data for entities without access token
    When I send the GET request to "getUsersDataForEntities" endpoint with path parameters
      |Path|Value|
      |entityType|subzone|
      |entityId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_02 Get users data for entities with invalid access token
    And I send the GET request to "getUsersDataForEntities" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|entityType|subzone|
      | | |entityId|2|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_03 Get users data for entities with expired access token
    And I send the GET request to "getUsersDataForEntities" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|entityType|subzone|
      | | |entityId|2|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_04 Get users data for entities with malformed access token
    And I send the GET request to "getUsersDataForEntities" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|entityType|subzone|
      | | |entityId|2|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get users data for entities with valid access token
    And I send the GET request to "getUsersDataForEntities" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType|subzone|
      | | |entityId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data found|
      |$.entity_type|subzone|
      |$.entity_type_values[0].id|1|
      |$.entity_type_values[0].name|"Ujgqmy"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.entity_type|string|
      |$.entity_type_values|array|

  @Positive @Functional
  Scenario: TC_06 Get users data for entities with another valid entityId
    And I send the GET request to "getUsersDataForEntities" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType|subzone|
      | | |entityId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data found|
      |$.entity_type|subzone|
      |$.entity_type_values[0].id|2|
      |$.entity_type_values[0].name|"Subzone_0987"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.entity_type|string|
      |$.entity_type_values|array|

  @Negative @Validation
  Scenario: TC_07 Get users data for entities with invalid entityId
    And I send the GET request to "getUsersDataForEntities" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType|subzone|
      | | |entityId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Negative @Validation
  Scenario: TC_08 Get users data for entities with non-existent entityId
    And I send the GET request to "getUsersDataForEntities" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType|subzone|
      | | |entityId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Negative @ErrorHandling
  Scenario: TC_09 Get users data for entities with invalid endpoint
    And I send the GET request to "getUsersDataForEntities_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType|subzone|
      | | |entityId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: TC_10 Performance test for getUsersDataForEntities endpoint
    And I send the GET request to "getUsersDataForEntities" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType|subzone|
      | | |entityId|2|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Regression
  Scenario: TC_11 Regression test for getUsersDataForEntities endpoint
    And I send the GET request to "getUsersDataForEntities" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType|subzone|
      | | |entityId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: TC_12 Get users data for entities with valid access token and DB validation
    And I send the GET request to "getUsersDataForEntities" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType|subzone|
      | | |entityId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data found|
      |$.entity_type_values[0].name|DB:subzones:name:id=1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.entity_type|string|
      |$.entity_type_values|array|
