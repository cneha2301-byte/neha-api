@BizomWebAPI @CE @UsersForRole @SystemIntegration
Feature: Users For Role API Testing
  As a system user
  I want to test the getusersforrole endpoint
  So that I can ensure proper functionality and data retrieval for users with specific roles

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

#  @Negative @Security
#  Scenario: Get users for role without access token
#    When I send the GET request to "get_users_for_role" endpoint with path parameters
#      |Path|Value|
#      |roleId|1|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get users for role with invalid access token
    And I send the GET request to "get_users_for_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|roleId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get users for role with expired access token
    And I send the GET request to "get_users_for_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|roleId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get users for role with malformed access token
    And I send the GET request to "get_users_for_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|roleId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

#  @Positive @Smoke
#  Scenario: Get users for role ID 1 with valid access token
#    And I send the GET request to "get_users_for_role" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|roleId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data.1|uiadmin|
#      |$.data.12|MB_RETAILER_470212|
#      |$.data.15|RobertDROPTABLEStuden|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.data|object|
#      |$.data.1|string|
#      |$.data.12|string|
#      |$.data.15|string|
#      |$.newdata|array|

#  @Positive @Functional
#  Scenario: Get users for role ID 2 with valid access token
#    And I send the GET request to "get_users_for_role" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|roleId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data.4|zonemgr|
#      |$.data.14|devtest123aaaaa|
#      |$.data.585|Sampleuser|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.data|object|
#      |$.data.4|string|
#      |$.data.14|string|
#      |$.data.585|string|
#      |$.newdata|array|

#  @Positive @Functional
#  Scenario: Get users for role ID 3 with valid access token
#    And I send the GET request to "get_users_for_role" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|roleId|3|
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
#      |$.data|array|
#      |$.newdata|array|

  @Negative @Validation
  Scenario: Get users for role with blank role ID
    And I send the GET request to "get_users_for_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|roleId|""|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data|[]|
      |$.newdata|[]|

  @Negative @Validation
  Scenario: Get users for role with invalid role ID
    And I send the GET request to "get_users_for_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|roleId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data|[]|
      |$.newdata|[]|

  @Negative @Validation
  Scenario: Get users for role with non-existent role ID
    And I send the GET request to "get_users_for_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|roleId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data|[]|
      |$.newdata|[]|

  @Negative @ErrorHandling
  Scenario: Get users for role with invalid endpoint
    And I send the GET request to "get_users_for_role_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "404"
    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance test for users for role endpoint
    And I send the GET request to "get_users_for_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|roleId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Regression
  Scenario: Regression test for users for role endpoint
    And I send the GET request to "get_users_for_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|roleId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: Get users for role ID 1 with valid access token and DB validation
    And I send the GET request to "get_users_for_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|roleId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data.1|DB:users:username: id=1|
      |$.data.12|DB:users:username: id=12|
      |$.data.15|DB:users:username: id=15|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|object|
      |$.data.1|string|
      |$.data.12|string|
      |$.data.15|string|
      |$.newdata|array|

  @Positive @Functional
  Scenario: Get users for role ID 2 with valid access token and DB validation
    And I send the GET request to "get_users_for_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|roleId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data.4|DB:users:username: id=4|
      |$.data.14|DB:users:username: id=14|
      |$.data.585|DB:users:username: id=585|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|object|
      |$.data.4|string|
      |$.data.14|string|
      |$.data.585|string|
      |$.newdata|array|

#  @Positive @DataValidation
#  Scenario: Validate users for role response structure for role with users
#    And I send the GET request to "get_users_for_role" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|roleId|1|
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
#      |$.data|object|
#      |$.data.1|string|
#      |$.data.12|string|
#      |$.data.15|string|
#      |$.newdata|array|
#      |$.newdata[0]|object|
#      |$.newdata[1]|object|
#      |$.newdata[2]|object|

#  @Positive @DataValidation
#  Scenario: Validate users for role response structure for role without users
#    And I send the GET request to "get_users_for_role" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|roleId|3|
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
#      |$.data|array|
#      |$.newdata|array|

#  @Positive @DataValidation
#  Scenario: Validate users for role response structure for blank role ID
#    And I send the GET request to "get_users_for_role" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|roleId|""|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data|[]|
#      |$.newdata|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.data|array|
#      |$.newdata|array|

#  @Positive @DataValidation
#  Scenario: Validate users for role response structure for invalid role ID
#    And I send the GET request to "get_users_for_role" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|roleId|abc|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data|[]|
#      |$.newdata|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.data|array|
#      |$.newdata|array|

  @Positive @BusinessLogic
  Scenario: Validate users for role business logic for role with users
    And I send the GET request to "get_users_for_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|roleId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data.1|uiadmin|
      |$.data.12|MB_RETAILER_470212|
      |$.data.15|RobertDROPTABLEStuden|

  @Positive @BusinessLogic
  Scenario: Validate users for role business logic for role with multiple users
    And I send the GET request to "get_users_for_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|roleId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data.4|zonemgr|
      |$.data.14|devtest123aaaaa|
      |$.data.585|Sampleuser|

  @Positive @BusinessLogic
  Scenario: Validate users for role business logic for role without users
    And I send the GET request to "get_users_for_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|roleId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Positive @BusinessLogic
  Scenario: Validate users for role business logic for blank role ID
    And I send the GET request to "get_users_for_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|roleId|""|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data|[]|
      |$.newdata|[]|

  @Positive @BusinessLogic
  Scenario: Validate users for role business logic for invalid role ID
    And I send the GET request to "get_users_for_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|roleId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data|[]|
      |$.newdata|[]|

  @Positive @EdgeCase
  Scenario: Get users for role with zero role ID
    And I send the GET request to "get_users_for_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|roleId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data|[]|
      |$.newdata|[]|

  @Positive @EdgeCase
  Scenario: Get users for role with negative role ID
    And I send the GET request to "get_users_for_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|roleId|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data|[]|
      |$.newdata|[]|

  @Positive @Concurrency
  Scenario: Concurrent access test for users for role endpoint
    And I send the GET request to "get_users_for_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|roleId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data.1|uiadmin|
      |$.data.12|MB_RETAILER_470212|
      |$.data.15|RobertDROPTABLEStuden|

  @Positive @LoadTesting
  Scenario: Load testing for users for role endpoint
    And I send the GET request to "get_users_for_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|roleId|1|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data.1|uiadmin|
      |$.data.12|MB_RETAILER_470212|
      |$.data.15|RobertDROPTABLEStuden|

#  @Positive @EndToEnd
#  Scenario: End-to-end users for role data retrieval workflow
#    And I send the GET request to "get_users_for_role" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|roleId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data.1|uiadmin|
#      |$.data.12|MB_RETAILER_470212|
#      |$.data.15|RobertDROPTABLEStuden|
#    And I store the response as "users_for_role_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.data|object|
#      |$.data.1|string|
#      |$.data.12|string|
#      |$.data.15|string|
#      |$.newdata|array|

#  @Positive @RoleValidation
#  Scenario: Validate users for different role IDs
#    And I send the GET request to "get_users_for_role" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|roleId|4|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data|[]|
#      |$.newdata|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.data|array|
#      |$.newdata|array|

#  @Positive @UserDataValidation
#  Scenario: Validate user data structure in role response
#    And I send the GET request to "get_users_for_role" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|roleId|1|
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
#      |$.data|object|
#      |$.data.1|string|
#      |$.data.12|string|
#      |$.data.15|string|
#      |$.newdata|array|
#      |$.newdata[0]|object|
#      |$.newdata[1]|object|
#      |$.newdata[2]|object|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.data.1|uiadmin|
#      |$.data.12|MB_RETAILER_470212|
#      |$.data.15|RobertDROPTABLEStuden|

#  @Positive @NewDataValidation
#  Scenario: Validate newdata array structure in role response
#    And I send the GET request to "get_users_for_role" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|roleId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.newdata|array|
#      |$.newdata[0]|object|
#      |$.newdata[0].id|string|
#      |$.newdata[0].name|string|
#      |$.newdata[0].username|string|
#      |$.newdata[0].employeeid|string|
#      |$.newdata[1]|object|
#      |$.newdata[1].id|string|
#      |$.newdata[1].name|string|
#      |$.newdata[1].username|string|
#      |$.newdata[1].employeeid|string|
#      |$.newdata[2]|object|
#      |$.newdata[2].id|string|
#      |$.newdata[2].name|string|
#      |$.newdata[2].username|string|
#      |$.newdata[2].employeeid|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.newdata[0].id|"1"|
#      |$.newdata[0].name|SLV Traders|
#      |$.newdata[0].username|uiadmin|
#      |$.newdata[0].employeeid|"1"|
#      |$.newdata[1].id|"12"|
#      |$.newdata[1].name|retailer|
#      |$.newdata[1].username|MB_RETAILER_470212|
#      |$.newdata[1].employeeid|null|
#      |$.newdata[2].id|"15"|
#      |$.newdata[2].username|RobertDROPTABLEStuden|
#      |$.newdata[2].employeeid|""-prompt()-""|

#  @Positive @ErrorHandlingValidation
#  Scenario: Validate error handling for various role ID scenarios
#    And I send the GET request to "get_users_for_role" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|roleId|999999|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data|[]|
#      |$.newdata|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.data|array|
#      |$.newdata|array|
