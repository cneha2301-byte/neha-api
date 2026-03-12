@BizomWebAPI @CE @UsersForDesignation @ReportingOperations
Feature: Users for Designation API Testing
  As a system user
  I want to test the getUsersfordesignation endpoint
  So that I can ensure proper functionality and data retrieval for users with specific designations

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get users for designation without access token
    When I send the GET request to "get_users_for_designation" endpoint with path parameters
      |Path|Value|
      |designationId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get users for designation with invalid access token
    And I send the GET request to "get_users_for_designation" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|designationId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get users for designation with expired access token
    And I send the GET request to "get_users_for_designation" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|designationId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get users for designation with malformed access token
    And I send the GET request to "get_users_for_designation" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|designationId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

#  @Positive @Smoke
#  Scenario: Get users for designation ID 1 with valid access token
#    And I send the GET request to "get_users_for_designation" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|designationId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|""|
#      |$.users|array|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.reason|string|
#      |$.users|array|
#      |$.users[0]|object|
#      |$.users[0].id|string|
#      |$.users[0].name|string|
#      |$.users[0].username|string|
#      |$.users[0].employeeid|string|

  @Positive @Functional
  Scenario: Get users for designation ID 1 with valid access token - detailed validation
    And I send the GET request to "get_users_for_designation" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|designationId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
      |$.users[0].id|"16"|
      |$.users[0].name|"lion12"|
      |$.users[0].username|"lion"|
      |$.users[0].employeeid|"lion1"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.users|array|
      |$.users[0]|object|
      |$.users[0].id|string|
      |$.users[0].name|string|
      |$.users[0].username|string|
      |$.users[0].employeeid|string|

#  @Negative @Validation
#  Scenario: Get users for designation ID 3 with valid access token - no data found
#    And I send the GET request to "get_users_for_designation" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|designationId|3|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.reason|"No data found."|
#      |$.users|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.reason|string|
#      |$.users|array|

  @Negative @Validation
  Scenario: Get users for designation ID 999 with valid access token - no data found
    And I send the GET request to "get_users_for_designation" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|designationId|999|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|"No data found."|
      |$.users|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.users|array|

#  @Negative @Validation
#  Scenario: Get users for designation with invalid designation ID
#    And I send the GET request to "get_users_for_designation" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|designationId|abc|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.reason|"Invalid request sent."|
#      |$.users|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.reason|string|
#      |$.users|array|

  @Negative @Validation
  Scenario: Get users for designation with empty designation ID
    And I send the GET request to "get_users_for_designation" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|designationId||
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|"Invalid request sent."|
      |$.users|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.users|array|

#  @Negative @Validation
#  Scenario: Get users for designation with special characters in designation ID
#    And I send the GET request to "get_users_for_designation" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|designationId|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.reason|"Invalid request sent."|
#      |$.users|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.reason|string|
#      |$.users|array|

#  @Negative @Security
#  Scenario: Get users for designation with SQL injection attempt
#    And I send the GET request to "get_users_for_designation" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|designationId|'; DROP TABLE users; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.reason|"Invalid request sent."|
#      |$.users|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.reason|string|
#      |$.users|array|

#  @Negative @ErrorHandling
#  Scenario: Get users for designation with invalid endpoint
#    And I send the GET request to "get_users_for_designation_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|designationId|1|
#    Then I should see the response code as "404"
#    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance test for users for designation endpoint
    And I send the GET request to "get_users_for_designation" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|designationId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Regression
  Scenario: Regression test for users for designation endpoint
    And I send the GET request to "get_users_for_designation" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|designationId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

#  @Positive @Smoke
#  Scenario: Get users for designation ID 1 with valid access token - DB validation
#    And I send the GET request to "get_users_for_designation" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|designationId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|""|
#      |$.users[0].id|DB:users:id: designation_id=1|
#      |$.users[0].name|DB:users:name: designation_id=1|
#      |$.users[0].username|DB:users:username: designation_id=1|
#      |$.users[0].employeeid|DB:users:employeeid: designation_id=1|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.reason|string|
#      |$.users|array|
#      |$.users[0]|object|
#      |$.users[0].id|string|
#      |$.users[0].name|string|
#      |$.users[0].username|string|
#      |$.users[0].employeeid|string|

#  @Positive @Functional
#  Scenario: Get users for designation ID 2 with valid access token - DB validation
#    And I send the GET request to "get_users_for_designation" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|designationId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|""|
#      |$.users[0].id|DB:users:id: designation_id=2|
#      |$.users[0].name|DB:users:name: designation_id=2|
#      |$.users[0].username|DB:users:username: designation_id=2|
#      |$.users[0].employeeid|DB:users:employeeid: designation_id=2|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.reason|string|
#      |$.users|array|
#      |$.users[0]|object|
#      |$.users[0].id|string|
#      |$.users[0].name|string|
#      |$.users[0].username|string|
#      |$.users[0].employeeid|string|

  @Positive @DataValidation
  Scenario: Validate users for designation response structure
    And I send the GET request to "get_users_for_designation" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|designationId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.users|array|
      |$.users[0]|object|
      |$.users[0].id|string|
      |$.users[0].name|string|
      |$.users[0].username|string|
      |$.users[0].employeeid|string|

#  @Positive @ContentValidation
#  Scenario: Validate users for designation content structure
#    And I send the GET request to "get_users_for_designation" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|designationId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|string|
#      |$.users|array|
#    And validating the response contains the following values
#      |Value|
#      |result|
#      |reason|
#      |users|
#      |id|
#      |name|
#      |username|
#      |employeeid|
#      |lion12|
#      |lion|

#  @Positive @LoadTesting
#  Scenario: Load testing for users for designation endpoint
#    And I send the GET request to "get_users_for_designation" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|designationId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "3000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|boolean|
#      |$.reason|string|
#      |$.users|array|

#  @Negative @Timeout
#  Scenario: Test users for designation endpoint timeout handling
#    And I send the GET request to "get_users_for_designation" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|designationId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "5000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|boolean|
#      |$.reason|string|
#      |$.users|array|

#  @Positive @EndToEnd
#  Scenario: End-to-end users for designation data retrieval workflow
#    And I send the GET request to "get_users_for_designation" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|designationId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|string|
#      |$.users|array|
#    And I store the response as "users_for_designation_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.reason|string|
#      |$.users|array|
#      |$.users[0]|object|
#      |$.users[0].id|string|
#      |$.users[0].name|string|
#      |$.users[0].username|string|
#      |$.users[0].employeeid|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|""|
#      |$.users[0].id|"16"|
#      |$.users[0].name|"lion12"|
#      |$.users[0].username|"lion"|
#      |$.users[0].employeeid|"lion1"|

#  @Positive @HeaderValidation
#  Scenario: Validate users for designation response headers
#    And I send the GET request to "get_users_for_designation" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|designationId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Content-Type|text/html; charset=UTF-8|
#      |Server|Bizom|
#      |Connection|keep-alive|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|string|
#      |$.users|array|

#  @Positive @SessionValidation
#  Scenario: Validate users for designation with session handling
#    And I send the GET request to "get_users_for_designation" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|designationId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|string|
#      |$.users|array|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.reason|string|
#      |$.users|array|
#      |$.users[0]|object|

#  @Positive @DesignationSpecificValidation
#  Scenario: Validate users for designation designation-specific data
#    And I send the GET request to "get_users_for_designation" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|designationId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|""|
#      |$.users|array|
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.users[0].id|DB:users:id: designation_id=1 AND active=1|
#      |$.users[0].name|DB:users:name: designation_id=1 AND active=1|
#      |$.users[0].username|DB:users:username: designation_id=1 AND active=1|
#      |$.users[0].employeeid|DB:users:employeeid: designation_id=1 AND active=1|

  @Positive @ArrayValidation
  Scenario: Validate users for designation array structure and content
    And I send the GET request to "get_users_for_designation" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|designationId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.users|array|
      |$.users[0]|object|
      |$.users[0].id|string|
      |$.users[0].name|string|
      |$.users[0].username|string|
      |$.users[0].employeeid|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
      |$.users[0].id|"16"|
      |$.users[0].name|"lion12"|
      |$.users[0].username|"lion"|
      |$.users[0].employeeid|"lion1"|
