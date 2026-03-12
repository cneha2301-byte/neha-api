@BizomWebAPI @CE @UsersManagement @GetWarehouseTransactionForAllUsers
Feature: Get Warehouse Transaction For All Users API Testing
  As a system user
  I want to test the getWarehouseTransactionForAllUsers endpoint
  So that I can ensure proper functionality and data retrieval for warehouse transactions for all users

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
  Scenario: TC_01 Get warehouse transaction for all users without access token
    When I send the GET request to "getWarehouseTransactionForAllUsers" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |isLoggedInUser|true|
      |userStatus|1|
      |warehouseId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get warehouse transaction for all users with invalid access token
    And I send the GET request to "getWarehouseTransactionForAllUsers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
      |isLoggedInUser|true|
      |userStatus|1|
      |warehouseId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get warehouse transaction for all users with expired access token
    And I send the GET request to "getWarehouseTransactionForAllUsers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
      |isLoggedInUser|true|
      |userStatus|1|
      |warehouseId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get warehouse transaction for all users with malformed access token
    And I send the GET request to "getWarehouseTransactionForAllUsers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
      |isLoggedInUser|true|
      |userStatus|1|
      |warehouseId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get warehouse transaction for all users with valid access token
    And I send the GET request to "getWarehouseTransactionForAllUsers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |isLoggedInUser|true|
      |userStatus|1|
      |warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.1|SLV Traders|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.1|string|

  @Positive @Performance
  Scenario: TC_06 Performance test for getWarehouseTransactionForAllUsers endpoint
    And I send the GET request to "getWarehouseTransactionForAllUsers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |isLoggedInUser|true|
      |userStatus|1|
      |warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.1|SLV Traders|

  @Positive @Regression
  Scenario: TC_07 Regression test for getWarehouseTransactionForAllUsers endpoint
    And I send the GET request to "getWarehouseTransactionForAllUsers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |isLoggedInUser|true|
      |userStatus|1|
      |warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.1|SLV Traders|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.1|string|

  @Negative @Validation
  Scenario: TC_08 Get warehouse transaction for all users with invalid warehouseId
    And I send the GET request to "getWarehouseTransactionForAllUsers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |isLoggedInUser|true|
      |userStatus|1|
      |warehouseId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title ""

  @Negative @Validation
  Scenario: TC_09 Get warehouse transaction for all users with non-existent warehouseId
    And I send the GET request to "getWarehouseTransactionForAllUsers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |isLoggedInUser|true|
      |userStatus|1|
      |warehouseId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title ""

  @Negative @ErrorHandling
  Scenario: TC_10 Get warehouse transaction for all users with invalid endpoint
    And I send the GET request to "getWarehouseTransactionForAllUsers_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |isLoggedInUser|true|
      |userStatus|1|
      |warehouseId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_11 Get warehouse transaction for all users with valid access token and DB validation
    And I send the GET request to "getWarehouseTransactionForAllUsers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |isLoggedInUser|true|
      |userStatus|1|
      |warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.1|DB:warehouses:name: id=1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.1|string|
