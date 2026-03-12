@BizomWebAPI @CE @UsersForZones @SystemIntegration
Feature: Users For Zones API Testing
  As a system user
  I want to test the getusersforzones endpoint
  So that I can ensure proper functionality and data retrieval for users in specific zones

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get users for zones without access token
    When I send the GET request to "get_users_for_zones" endpoint with path parameters
      |Path|Value|
      |zoneId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get users for zones with invalid access token
    And I send the GET request to "get_users_for_zones" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|zoneId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get users for zones with expired access token
    And I send the GET request to "get_users_for_zones" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|zoneId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get users for zones with malformed access token
    And I send the GET request to "get_users_for_zones" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|zoneId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

#  @Positive @Smoke
#  Scenario: Get users for zone ID 1 with valid access token
#    And I send the GET request to "get_users_for_zones" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|zoneId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.users.2|SLV Traders|
#      |$.users.8|SLV Traders|
#      |$.users.9|test1|
#      |$.users.10|sadha|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.users|object|
#      |$.users.2|string|
#      |$.users.8|string|
#      |$.users.9|string|
#      |$.users.10|string|

#  @Positive @Functional
#  Scenario: Get users for zone ID 3 with valid access token
#    And I send the GET request to "get_users_for_zones" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|zoneId|3|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.users|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.users|array|

#  @Positive @Functional
#  Scenario: Get users for zone ID 2 with valid access token
#    And I send the GET request to "get_users_for_zones" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|zoneId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.users|{"2":"SLV Traders","13":"testuser_tourplan","16":"lion12","23":"kji"}|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.users|array|

  @Negative @Validation
  Scenario: Get users for zones with invalid zone ID
    And I send the GET request to "get_users_for_zones" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|zoneId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.users|[]|

  @Negative @Validation
  Scenario: Get users for zones with non-existent zone ID
    And I send the GET request to "get_users_for_zones" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|zoneId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.users|[]|

  @Negative @ErrorHandling
  Scenario: Get users for zones with invalid endpoint
    And I send the GET request to "get_users_for_zones_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "404"
    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance test for users for zones endpoint
    And I send the GET request to "get_users_for_zones" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|zoneId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Regression
  Scenario: Regression test for users for zones endpoint
    And I send the GET request to "get_users_for_zones" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|zoneId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: Get users for zone ID 1 with valid access token and DB validation
    And I send the GET request to "get_users_for_zones" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|zoneId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|true|
      |$.users.2|DB:users:name: id=2|
      |$.users.8|DB:users:name: id=8|
      |$.users.9|DB:users:name: id=9|
      |$.users.10|DB:users:name: id=10|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.users|object|
      |$.users.2|string|
      |$.users.8|string|
      |$.users.9|string|
      |$.users.10|string|

  @Positive @Functional
  Scenario: Get users for zone ID 3 with valid access token and DB validation
    And I send the GET request to "get_users_for_zones" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|zoneId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.users|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.users|array|

#  @Positive @DataValidation
#  Scenario: Validate users for zones response structure for zone with users
#    And I send the GET request to "get_users_for_zones" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|zoneId|1|
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
#      |$.users|object|
#      |$.users.2|string|
#      |$.users.8|string|
#      |$.users.9|string|
#      |$.users.10|string|

#  @Positive @DataValidation
#  Scenario: Validate users for zones response structure for zone without users
#    And I send the GET request to "get_users_for_zones" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|zoneId|3|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.users|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.users|array|

  @Positive @BusinessLogic
  Scenario: Validate users for zones business logic for zone with users
    And I send the GET request to "get_users_for_zones" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|zoneId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.users.2|SLV Traders|
      |$.users.8|SLV Traders|
      |$.users.9|test1|
      |$.users.10|sadha|

  @Positive @BusinessLogic
  Scenario: Validate users for zones business logic for zone without users
    And I send the GET request to "get_users_for_zones" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|zoneId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.users|[]|

  @Positive @EdgeCase
  Scenario: Get users for zones with zero zone ID
    And I send the GET request to "get_users_for_zones" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|zoneId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.users|[]|

  @Positive @EdgeCase
  Scenario: Get users for zones with negative zone ID
    And I send the GET request to "get_users_for_zones" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|zoneId|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.users|[]|

  @Positive @Concurrency
  Scenario: Concurrent access test for users for zones endpoint
    And I send the GET request to "get_users_for_zones" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|zoneId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.users.2|SLV Traders|
      |$.users.8|SLV Traders|
      |$.users.9|test1|
      |$.users.10|sadha|

  @Positive @LoadTesting
  Scenario: Load testing for users for zones endpoint
    And I send the GET request to "get_users_for_zones" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|zoneId|1|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.users.2|SLV Traders|
      |$.users.8|SLV Traders|
      |$.users.9|test1|
      |$.users.10|sadha|

#  @Positive @EndToEnd
#  Scenario: End-to-end users for zones data retrieval workflow
#    And I send the GET request to "get_users_for_zones" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|zoneId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.users.2|SLV Traders|
#      |$.users.8|SLV Traders|
#      |$.users.9|test1|
#      |$.users.10|sadha|
#    And I store the response as "users_for_zones_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.users|object|
#      |$.users.2|string|
#      |$.users.8|string|
#      |$.users.9|string|
#      |$.users.10|string|

#  @Positive @ZoneValidation
#  Scenario: Validate users for different zone IDs
#    And I send the GET request to "get_users_for_zones" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|zoneId|4|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.users|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.users|array|

#  @Positive @UserDataValidation
#  Scenario: Validate user data structure in zone response
#    And I send the GET request to "get_users_for_zones" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|zoneId|1|
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
#      |$.users|object|
#      |$.users.2|string|
#      |$.users.8|string|
#      |$.users.9|string|
#      |$.users.10|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.users.2|SLV Traders|
#      |$.users.8|SLV Traders|
#      |$.users.9|test1|
#      |$.users.10|sadha|
