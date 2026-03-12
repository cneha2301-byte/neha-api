@BizomWebAPI @CE @UsersForArea @SystemIntegration
Feature: Users For Area API Testing
  As a system user
  I want to test the getusersforarea endpoint
  So that I can ensure proper functionality and data retrieval for users in specific areas

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get users for area without access token
    When I send the GET request to "get_users_for_area" endpoint with path parameters
      |Path|Value|
      |areaId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get users for area with invalid access token
    And I send the GET request to "get_users_for_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|areaId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get users for area with expired access token
    And I send the GET request to "get_users_for_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|areaId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get users for area with malformed access token
    And I send the GET request to "get_users_for_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|areaId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

#  @Positive @Smoke
#  Scenario: Get users for area ID 1 with valid access token
#    And I send the GET request to "get_users_for_area" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|areaId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.users[0].User.username|covidse|
#      |$.users[0].User.id|"2"|
#      |$.users[0].User.name|SLV Traders|
#      |$.users[1].User.username|testacl|
#      |$.users[1].User.id|"8"|
#      |$.users[1].User.name|SLV Traders|
#      |$.users[2].User.username|aclmgg|
#      |$.users[2].User.id|"9"|
#      |$.users[2].User.name|test1|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.users|array|
#      |$.users[0]|object|
#      |$.users[0].User|object|
#      |$.users[0].User.username|string|
#      |$.users[0].User.id|string|
#      |$.users[0].User.name|string|
#      |$.users[1]|object|
#      |$.users[1].User|object|
#      |$.users[1].User.username|string|
#      |$.users[1].User.id|string|
#      |$.users[1].User.name|string|
#      |$.users[2]|object|
#      |$.users[2].User|object|
#      |$.users[2].User.username|string|
#      |$.users[2].User.id|string|
#      |$.users[2].User.name|string|

#  @Positive @Functional
#  Scenario: Get users for area ID 2 with valid access token
#    And I send the GET request to "get_users_for_area" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|areaId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.users|[{"User":{"username":"touruser","id":"13","name":"testuser_tourplan"}}, {"User":{"username":"lion","id":"16","name":"lion12"}}, {"User":{"username":"jkksk","id":"23","name":"kji"}}]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.users|array|

#  @Positive @Functional
#  Scenario: Get users for area ID 3 with valid access token
#    And I send the GET request to "get_users_for_area" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|areaId|3|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.users|[{"User":{"username":"covidse","id":"2","name":"SLV Traders"}}, {"User":{"username":"acldmgr","id":"10","name":"sadha"}}]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.users|array|

#  @Positive @Functional
#  Scenario: Get users for area with blank area ID
#    And I send the GET request to "get_users_for_area" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|areaId|""|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.users[0].User.username|kjkgyy67|
#      |$.users[0].User.id|"1"|
#      |$.users[0].User.name|SLV Traders|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.users|array|
#      |$.users[0]|object|
#      |$.users[0].User|object|
#      |$.users[0].User.username|string|
#      |$.users[0].User.id|string|
#      |$.users[0].User.name|string|

#  @Negative @Validation
#  Scenario: Get users for area with invalid area ID
#    And I send the GET request to "get_users_for_area" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|areaId|abc|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.users|[{"User":{"username":"kjkgyy67","id":"17","name":"SymponiZM245_00127"}}, {"User":{"username":"hjvsh","id":"18","name":"hjjkk"}}, {"User":{"username":"mobisy80","id":"19","name":"msm"}}, {"User":{"username":"mobisy10","id":"20","name":"msm"}}, {"User":{"username":"mobisy156","id":"21","name":"msm"}}, {"User":{"username":"mobisy158","id":"22","name":"hjk"}}, {"User":{"username":"jkks78k","id":"24","name":"789"}}, {"User":{"username":"yuii","id":"25","name":"kji"}}], expected: <[]> but was: <[{"User":{"username":"kjkgyy67","id":"17","name":"SymponiZM245_00127"}},{"User":{"username":"hjvsh","id":"18","name":"hjjkk"}},{"User":{"username":"mobisy80","id":"19","name":"msm"}},{"User":{"username":"mobisy10","id":"20","name":"msm"}},{"User":{"username":"mobisy156","id":"21","name":"msm"}},{"User":{"username":"mobisy158","id":"22","name":"hjk"}},{"User":{"username":"jkks78k","id":"24","name":"789"}},{"User":{"username":"yuii","id":"25","name":"kji"}}]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.users|array|

#  @Negative @Validation
#  Scenario: Get users for area with non-existent area ID
#    And I send the GET request to "get_users_for_area" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|areaId|999999|
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

  @Negative @ErrorHandling
  Scenario: Get users for area with invalid endpoint
    And I send the GET request to "get_users_for_area_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "404"
    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance test for users for area endpoint
    And I send the GET request to "get_users_for_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Regression
  Scenario: Regression test for users for area endpoint
    And I send the GET request to "get_users_for_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: Get users for area ID 1 with valid access token and DB validation
    And I send the GET request to "get_users_for_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.users[0].User.username|DB:users:username: id=2|
      |$.users[0].User.name|DB:users:name: id=2|
      |$.users[1].User.username|DB:users:username: id=8|
      |$.users[1].User.name|DB:users:name: id=8|
      |$.users[2].User.username|DB:users:username: id=9|
      |$.users[2].User.name|DB:users:name: id=9|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.users|array|
      |$.users[0]|object|
      |$.users[0].User|object|
      |$.users[0].User.username|string|
      |$.users[0].User.id|string|
      |$.users[0].User.name|string|
      |$.users[1]|object|
      |$.users[1].User|object|
      |$.users[1].User.username|string|
      |$.users[1].User.id|string|
      |$.users[1].User.name|string|
      |$.users[2]|object|
      |$.users[2].User|object|
      |$.users[2].User.username|string|
      |$.users[2].User.id|string|
      |$.users[2].User.name|string|

#  @Positive @Functional
#  Scenario: Get users for area with blank area ID and DB validation
#    And I send the GET request to "get_users_for_area" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|areaId|""|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.users[0].User.username|DB:users:username: id=1|
#      |$.users[0].User.name|DB:users:name: id=1|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.users|array|
#      |$.users[0]|object|
#      |$.users[0].User|object|
#      |$.users[0].User.username|string|
#      |$.users[0].User.id|string|
#      |$.users[0].User.name|string|

#  @Positive @DataValidation
#  Scenario: Validate users for area response structure for area with users
#    And I send the GET request to "get_users_for_area" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|areaId|1|
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
#      |$.users|array|
#      |$.users[0]|object|
#      |$.users[0].User|object|
#      |$.users[0].User.username|string|
#      |$.users[0].User.id|string|
#      |$.users[0].User.name|string|
#      |$.users[1]|object|
#      |$.users[1].User|object|
#      |$.users[1].User.username|string|
#      |$.users[1].User.id|string|
#      |$.users[1].User.name|string|
#      |$.users[2]|object|
#      |$.users[2].User|object|
#      |$.users[2].User.username|string|
#      |$.users[2].User.id|string|
#      |$.users[2].User.name|string|

#  @Positive @DataValidation
#  Scenario: Validate users for area response structure for area without users
#    And I send the GET request to "get_users_for_area" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|areaId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.users|[{"User":{"username":"touruser","id":"13","name":"testuser_tourplan"}}, {"User":{"username":"lion","id":"16","name":"lion12"}}, {"User":{"username":"jkksk","id":"23","name":"kji"}}]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.users|array|

#  @Positive @DataValidation
#  Scenario: Validate users for area response structure for blank area ID
#    And I send the GET request to "get_users_for_area" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|areaId|""|
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
#      |$.users|array|
#      |$.users[0]|object|
#      |$.users[0].User|object|
#      |$.users[0].User.username|string|
#      |$.users[0].User.id|string|
#      |$.users[0].User.name|string|

#  @Positive @DataValidation
#  Scenario: Validate users for area response structure for invalid area ID
#    And I send the GET request to "get_users_for_area" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|areaId|abc|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.users|[{"User":{"username":"kjkgyy67","id":"17","name":"SymponiZM245_00127"}}, {"User":{"username":"hjvsh","id":"18","name":"hjjkk"}}, {"User":{"username":"mobisy80","id":"19","name":"msm"}}, {"User":{"username":"mobisy10","id":"20","name":"msm"}}, {"User":{"username":"mobisy156","id":"21","name":"msm"}}, {"User":{"username":"mobisy158","id":"22","name":"hjk"}}, {"User":{"username":"jkks78k","id":"24","name":"789"}}, {"User":{"username":"yuii","id":"25","name":"kji"}}], expected: <[]> but was: <[{"User":{"username":"kjkgyy67","id":"17","name":"SymponiZM245_00127"}},{"User":{"username":"hjvsh","id":"18","name":"hjjkk"}},{"User":{"username":"mobisy80","id":"19","name":"msm"}},{"User":{"username":"mobisy10","id":"20","name":"msm"}},{"User":{"username":"mobisy156","id":"21","name":"msm"}},{"User":{"username":"mobisy158","id":"22","name":"hjk"}},{"User":{"username":"jkks78k","id":"24","name":"789"}},{"User":{"username":"yuii","id":"25","name":"kji"}}]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.users|array|

  @Positive @BusinessLogic
  Scenario: Validate users for area business logic for area with users
    And I send the GET request to "get_users_for_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.users[0].User.username|covidse|
      |$.users[0].User.id|"2"|
      |$.users[0].User.name|SLV Traders|
      |$.users[1].User.username|testacl|
      |$.users[1].User.id|"8"|
      |$.users[1].User.name|SLV Traders|
      |$.users[2].User.username|aclmgg|
      |$.users[2].User.id|"9"|
      |$.users[2].User.name|test1|

  @Positive @BusinessLogic
  Scenario: Validate users for area business logic for area without users
    And I send the GET request to "get_users_for_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.users|[{"User":{"username":"touruser","id":"13","name":"testuser_tourplan"}}, {"User":{"username":"lion","id":"16","name":"lion12"}}, {"User":{"username":"jkksk","id":"23","name":"kji"}}]|

#  @Positive @BusinessLogic
#  Scenario: Validate users for area business logic for blank area ID
#    And I send the GET request to "get_users_for_area" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|areaId|""|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.users[0].User.username|kjkgyy67|
#      |$.users[0].User.id|"1"|
#      |$.users[0].User.name|SLV Traders|

  @Positive @BusinessLogic
  Scenario: Validate users for area business logic for invalid area ID
    And I send the GET request to "get_users_for_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.users|[{"User":{"username":"kjkgyy67","id":"17","name":"SymponiZM245_00127"}}, {"User":{"username":"hjvsh","id":"18","name":"hjjkk"}}, {"User":{"username":"mobisy80","id":"19","name":"msm"}}, {"User":{"username":"mobisy10","id":"20","name":"msm"}}, {"User":{"username":"mobisy156","id":"21","name":"msm"}}, {"User":{"username":"mobisy158","id":"22","name":"hjk"}}, {"User":{"username":"jkks78k","id":"24","name":"789"}}, {"User":{"username":"yuii","id":"25","name":"kji"}}], expected: <[]> but was: <[{"User":{"username":"kjkgyy67","id":"17","name":"SymponiZM245_00127"}},{"User":{"username":"hjvsh","id":"18","name":"hjjkk"}},{"User":{"username":"mobisy80","id":"19","name":"msm"}},{"User":{"username":"mobisy10","id":"20","name":"msm"}},{"User":{"username":"mobisy156","id":"21","name":"msm"}},{"User":{"username":"mobisy158","id":"22","name":"hjk"}},{"User":{"username":"jkks78k","id":"24","name":"789"}},{"User":{"username":"yuii","id":"25","name":"kji"}}]|

#  @Positive @EdgeCase
#  Scenario: Get users for area with zero area ID
#    And I send the GET request to "get_users_for_area" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|areaId|0|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.users|[{"User":{"username":"kjkgyy67","id":"17","name":"SymponiZM245_00127"}}, {"User":{"username":"hjvsh","id":"18","name":"hjjkk"}}, {"User":{"username":"mobisy80","id":"19","name":"msm"}}, {"User":{"username":"mobisy10","id":"20","name":"msm"}}, {"User":{"username":"mobisy156","id":"21","name":"msm"}}, {"User":{"username":"mobisy158","id":"22","name":"hjk"}}, {"User":{"username":"jkks78k","id":"24","name":"789"}}, {"User":{"username":"yuii","id":"25","name":"kji"}}], expected: <[]> but was: <[{"User":{"username":"kjkgyy67","id":"17","name":"SymponiZM245_00127"}},{"User":{"username":"hjvsh","id":"18","name":"hjjkk"}},{"User":{"username":"mobisy80","id":"19","name":"msm"}},{"User":{"username":"mobisy10","id":"20","name":"msm"}},{"User":{"username":"mobisy156","id":"21","name":"msm"}},{"User":{"username":"mobisy158","id":"22","name":"hjk"}},{"User":{"username":"jkks78k","id":"24","name":"789"}},{"User":{"username":"yuii","id":"25","name":"kji"}}]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.users|array|

#  @Positive @EdgeCase
#  Scenario: Get users for area with negative area ID
#    And I send the GET request to "get_users_for_area" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|areaId|-1|
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

  @Positive @Concurrency
  Scenario: Concurrent access test for users for area endpoint
    And I send the GET request to "get_users_for_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.users[0].User.username|covidse|
      |$.users[0].User.id|"2"|
      |$.users[0].User.name|SLV Traders|
      |$.users[1].User.username|testacl|
      |$.users[1].User.id|"8"|
      |$.users[1].User.name|SLV Traders|
      |$.users[2].User.username|aclmgg|
      |$.users[2].User.id|"9"|
      |$.users[2].User.name|test1|

  @Positive @LoadTesting
  Scenario: Load testing for users for area endpoint
    And I send the GET request to "get_users_for_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.users[0].User.username|covidse|
      |$.users[0].User.id|"2"|
      |$.users[0].User.name|SLV Traders|
      |$.users[1].User.username|testacl|
      |$.users[1].User.id|"8"|
      |$.users[1].User.name|SLV Traders|
      |$.users[2].User.username|aclmgg|
      |$.users[2].User.id|"9"|
      |$.users[2].User.name|test1|

#  @Positive @EndToEnd
#  Scenario: End-to-end users for area data retrieval workflow
#    And I send the GET request to "get_users_for_area" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|areaId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.users[0].User.username|covidse|
#      |$.users[0].User.id|"2"|
#      |$.users[0].User.name|SLV Traders|
#      |$.users[1].User.username|testacl|
#      |$.users[1].User.id|"8"|
#      |$.users[1].User.name|SLV Traders|
#      |$.users[2].User.username|aclmgg|
#      |$.users[2].User.id|"9"|
#      |$.users[2].User.name|test1|
#    And I store the response as "users_for_area_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.users|array|
#      |$.users[0]|object|
#      |$.users[0].User|object|
#      |$.users[0].User.username|string|
#      |$.users[0].User.id|string|
#      |$.users[0].User.name|string|
#      |$.users[1]|object|
#      |$.users[1].User|object|
#      |$.users[1].User.username|string|
#      |$.users[1].User.id|string|
#      |$.users[1].User.name|string|
#      |$.users[2]|object|
#      |$.users[2].User|object|
#      |$.users[2].User.username|string|
#      |$.users[2].User.id|string|
#      |$.users[2].User.name|string|

#  @Positive @AreaValidation
#  Scenario: Validate users for different area IDs
#    And I send the GET request to "get_users_for_area" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|areaId|4|
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
#  Scenario: Validate user data structure in area response
#    And I send the GET request to "get_users_for_area" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|areaId|1|
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
#      |$.users|array|
#      |$.users[0]|object|
#      |$.users[0].User|object|
#      |$.users[0].User.username|string|
#      |$.users[0].User.id|string|
#      |$.users[0].User.name|string|
#      |$.users[1]|object|
#      |$.users[1].User|object|
#      |$.users[1].User.username|string|
#      |$.users[1].User.id|string|
#      |$.users[1].User.name|string|
#      |$.users[2]|object|
#      |$.users[2].User|object|
#      |$.users[2].User.username|string|
#      |$.users[2].User.id|string|
#      |$.users[2].User.name|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.users[0].User.username|covidse|
#      |$.users[0].User.id|"2"|
#      |$.users[0].User.name|SLV Traders|
#      |$.users[1].User.username|testacl|
#      |$.users[1].User.id|"8"|
#      |$.users[1].User.name|SLV Traders|
#      |$.users[2].User.username|aclmgg|
#      |$.users[2].User.id|"9"|
#      |$.users[2].User.name|test1|

#  @Positive @ErrorHandlingValidation
#  Scenario: Validate error handling for various area ID scenarios
#    And I send the GET request to "get_users_for_area" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|areaId|999999|
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
