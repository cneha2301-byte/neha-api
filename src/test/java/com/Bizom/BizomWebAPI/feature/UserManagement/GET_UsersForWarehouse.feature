@BizomWebAPI @CE @UsersForWarehouse @SystemIntegration
Feature: Users For Warehouse API Testing
  As a system user
  I want to test the getusersforwarehouse endpoint
  So that I can ensure proper functionality and data retrieval for users in specific warehouses

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get users for warehouse without access token
    When I send the GET request to "get_users_for_warehouse" endpoint with path parameters
      |Path|Value|
      |warehouseId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get users for warehouse with invalid access token
    And I send the GET request to "get_users_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|warehouseId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get users for warehouse with expired access token
    And I send the GET request to "get_users_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|warehouseId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get users for warehouse with malformed access token
    And I send the GET request to "get_users_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|warehouseId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

#  @Positive @Smoke
#  Scenario: Get users for warehouse ID 1 with valid access token
#    And I send the GET request to "get_users_for_warehouse" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.Data.2|SLV Traders|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Data|object|
#      |$.Data.2|string|

#  @Positive @Functional
#  Scenario: Get users for warehouse ID 3 with valid access token
#    And I send the GET request to "get_users_for_warehouse" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|3|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.Data.2|SLV Traders|
#      |$.Data.8|SLV Traders|
#      |$.Data.9|test1|
#      |$.Data.10|sadha|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Data|object|
#      |$.Data.2|string|
#      |$.Data.8|string|
#      |$.Data.9|string|
#      |$.Data.10|string|

#  @Negative @Validation
#  Scenario: Get users for warehouse with blank warehouse ID
#    And I send the GET request to "get_users_for_warehouse" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|""|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|Invalid data send.|

  @Negative @Validation
  Scenario: Get users for warehouse with invalid warehouse ID
    And I send the GET request to "get_users_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No users found.|

  @Negative @Validation
  Scenario: Get users for warehouse with non-existent warehouse ID
    And I send the GET request to "get_users_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No users found.|

  @Negative @ErrorHandling
  Scenario: Get users for warehouse with invalid endpoint
    And I send the GET request to "get_users_for_warehouse_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "404"
    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance test for users for warehouse endpoint
    And I send the GET request to "get_users_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Regression
  Scenario: Regression test for users for warehouse endpoint
    And I send the GET request to "get_users_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: Get users for warehouse ID 1 with valid access token and DB validation
    And I send the GET request to "get_users_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.Data.2|DB:users:name: id=2|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|
      |$.Data.2|string|

#  @Positive @Functional
#  Scenario: Get users for warehouse ID 3 with valid access token and DB validation
#    And I send the GET request to "get_users_for_warehouse" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|3|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.Data.2|DB:users:name: id=2|
#      |$.Data.8|DB:users:name: id=8|
#      |$.Data.9|DB:users:name: id=9|
#      |$.Data.10|DB:users:name: id=10|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Data|object|
#      |$.Data.2|string|
#      |$.Data.8|string|
#      |$.Data.9|string|
#      |$.Data.10|string|

#  @Positive @DataValidation
#  Scenario: Validate users for warehouse response structure for warehouse with users
#    And I send the GET request to "get_users_for_warehouse" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Data|object|
#      |$.Data.2|string|

#  @Positive @DataValidation
#  Scenario: Validate users for warehouse response structure for warehouse with multiple users
#    And I send the GET request to "get_users_for_warehouse" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|3|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Data|object|
#      |$.Data.2|string|
#      |$.Data.8|string|
#      |$.Data.9|string|
#      |$.Data.10|string|

#  @Negative @DataValidation
#  Scenario: Validate users for warehouse response structure for blank warehouse ID
#    And I send the GET request to "get_users_for_warehouse" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|""|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|Invalid data send.|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|

#  @Negative @DataValidation
#  Scenario: Validate users for warehouse response structure for invalid warehouse ID
#    And I send the GET request to "get_users_for_warehouse" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|abc|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|No users found.|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|

  @Positive @BusinessLogic
  Scenario: Validate users for warehouse business logic for warehouse with users
    And I send the GET request to "get_users_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.Data.2|SLV Traders|

#  @Positive @BusinessLogic
#  Scenario: Validate users for warehouse business logic for warehouse with multiple users
#    And I send the GET request to "get_users_for_warehouse" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|3|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.Data.2|SLV Traders|
#      |$.Data.8|SLV Traders|
#      |$.Data.9|test1|
#      |$.Data.10|sadha|

#  @Negative @BusinessLogic
#  Scenario: Validate users for warehouse business logic for blank warehouse ID
#    And I send the GET request to "get_users_for_warehouse" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|""|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|Invalid data send.|

  @Negative @BusinessLogic
  Scenario: Validate users for warehouse business logic for invalid warehouse ID
    And I send the GET request to "get_users_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No users found.|

#  @Positive @EdgeCase
#  Scenario: Get users for warehouse with zero warehouse ID
#    And I send the GET request to "get_users_for_warehouse" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|0|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|No users found.|

  @Positive @EdgeCase
  Scenario: Get users for warehouse with negative warehouse ID
    And I send the GET request to "get_users_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No users found.|

  @Positive @Concurrency
  Scenario: Concurrent access test for users for warehouse endpoint
    And I send the GET request to "get_users_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.Data.2|SLV Traders|

  @Positive @LoadTesting
  Scenario: Load testing for users for warehouse endpoint
    And I send the GET request to "get_users_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.Data.2|SLV Traders|

#  @Positive @EndToEnd
#  Scenario: End-to-end users for warehouse data retrieval workflow
#    And I send the GET request to "get_users_for_warehouse" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.Data.2|SLV Traders|
#    And I store the response as "users_for_warehouse_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Data|object|
#      |$.Data.2|string|

#  @Positive @WarehouseValidation
#  Scenario: Validate users for different warehouse IDs
#    And I send the GET request to "get_users_for_warehouse" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|No users found.|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|

#  @Positive @UserDataValidation
#  Scenario: Validate user data structure in warehouse response
#    And I send the GET request to "get_users_for_warehouse" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Data|object|
#      |$.Data.2|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Data.2|SLV Traders|

#  @Positive @ErrorHandlingValidation
#  Scenario: Validate error handling for various warehouse ID scenarios
#    And I send the GET request to "get_users_for_warehouse" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|999999|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|No users found.|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
