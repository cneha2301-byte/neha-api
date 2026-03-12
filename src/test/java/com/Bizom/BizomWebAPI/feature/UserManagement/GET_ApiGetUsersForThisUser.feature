@BizomWebAPI @CE @GetApiGetUsersForThisUser @UserManagement
Feature: API Get Users For This User API Testing
  As a system user
  I want to test the API get users for this user endpoint
  So that I can ensure proper functionality and data retrieval for user management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get users for this user without access token
    When I send the GET request to "users_apigetusersforthuser" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get users for this user with invalid access token
    And I send the GET request to "users_apigetusersforthuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get users for this user with expired access token
    And I send the GET request to "users_apigetusersforthuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get users for this user with malformed access token
    And I send the GET request to "users_apigetusersforthuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get users for this user with valid access token
    And I send the GET request to "users_apigetusersforthuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And I store the response as "users_apigetusersforthuser_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate users for this user response structure
    And I send the GET request to "users_apigetusersforthuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Model|array|
      |$.Users|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate users for this user Model array structure
    And I send the GET request to "users_apigetusersforthuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Model|array|
      |$.Model[0]|string|

  @Positive @DataValidation
  Scenario: TC_08 Validate users for this user Users array structure
    And I send the GET request to "users_apigetusersforthuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Users|array|
      |$.Users[0]|object|
      |$.Users[0].User|object|

  @Positive @DataValidation
  Scenario: TC_09 Validate users for this user User object structure
    And I send the GET request to "users_apigetusersforthuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Users[0].User|object|
      |$.Users[0].User.id|string|
      |$.Users[0].User.name|string|
      |$.Users[0].User.username|string|
      |$.Users[0].User.employeeid|string|

  @Positive @DataValidation
  Scenario: TC_10 Validate users for this user User object fields presence
    And I send the GET request to "users_apigetusersforthuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Model|
      |Users|
      |User|
      |id|
      |name|
      |username|
      |employeeid|

  @Positive @DataValidation
  Scenario: TC_11 Validate users for this user complete nested structure
    And I send the GET request to "users_apigetusersforthuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Model|array|
      |$.Model[0]|string|
      |$.Users|array|
      |$.Users[0]|object|
      |$.Users[0].User|object|
      |$.Users[0].User.id|string|
      |$.Users[0].User.name|string|
      |$.Users[0].User.username|string|
      |$.Users[0].User.employeeid|string|

  @Positive @Performance
  Scenario: TC_12 Performance test for users for this user endpoint
    And I send the GET request to "users_apigetusersforthuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @Positive @Concurrency
  Scenario: TC_13 Concurrent access test for users for this user endpoint
    And I send the GET request to "users_apigetusersforthuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @Negative @Validation
  Scenario: TC_14 Get users for this user with invalid query parameters
    And I send the GET request to "users_apigetusersforthuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @Negative @Validation
  Scenario: TC_15 Get users for this user with special characters in query parameters
    And I send the GET request to "users_apigetusersforthuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @Negative @Security
  Scenario: TC_16 Get users for this user with SQL injection attempt
    And I send the GET request to "users_apigetusersforthuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE users; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @Negative @Boundary
  Scenario: TC_17 Get users for this user with maximum query parameters
    And I send the GET request to "users_apigetusersforthuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

#  @Negative @ErrorHandling
#  Scenario: TC_18 Get users for this user with invalid endpoint
#    And I send the GET request to "users_apigetusersforthuser_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_19 Validate users for this user business logic
    And I send the GET request to "users_apigetusersforthuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Model|array|
      |$.Users|array|
      |$.Users[0].User|object|
      |$.Users[0].User.id|string|
      |$.Users[0].User.name|string|
      |$.Users[0].User.username|string|
      |$.Users[0].User.employeeid|string|

  @Positive @DataIntegrity
  Scenario: TC_20 Validate users for this user data integrity
    And I send the GET request to "users_apigetusersforthuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Model|array|
      |$.Users|array|
      |$.Users[0]|object|
      |$.Users[0].User|object|
      |$.Users[0].User.id|string|
      |$.Users[0].User.name|string|
      |$.Users[0].User.username|string|
      |$.Users[0].User.employeeid|string|

  @Positive @Regression
  Scenario: TC_21 Regression test for users for this user endpoint
    And I send the GET request to "users_apigetusersforthuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Model|array|
      |$.Users|array|
      |$.Users[0].User|object|
      |$.Users[0].User.id|string|
      |$.Users[0].User.name|string|
      |$.Users[0].User.username|string|
      |$.Users[0].User.employeeid|string|

  @Positive @Functional
  Scenario: TC_22 Validate users for this user response completeness
    And I send the GET request to "users_apigetusersforthuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Model|array|
      |$.Model[0]|string|
      |$.Users|array|
      |$.Users[0]|object|
      |$.Users[0].User|object|
      |$.Users[0].User.id|string|
      |$.Users[0].User.name|string|
      |$.Users[0].User.username|string|
      |$.Users[0].User.employeeid|string|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Model|
      |Users|
      |User|
      |id|
      |name|
      |username|
      |employeeid|
    And I store the response as "users_apigetusersforthuser_response" name using full path

