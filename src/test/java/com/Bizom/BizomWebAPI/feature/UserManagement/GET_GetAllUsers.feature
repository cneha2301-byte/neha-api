@BizomWebAPI @CE @AllUsers @UserManagement
Feature: Get All Users API Testing
  As a system user
  I want to test the getallusers endpoint
  So that I can ensure proper functionality and data retrieval for all users in the system

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get all users without access token
    When I send the GET request to "get_all_users" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get all users with invalid access token
    And I send the GET request to "get_all_users" endpoint with dynamic access token and query parameters
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
  Scenario: Get all users with expired access token
    And I send the GET request to "get_all_users" endpoint with dynamic access token and query parameters
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
  Scenario: Get all users with malformed access token
    And I send the GET request to "get_all_users" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

#  @Positive @Smoke
#  Scenario: Get all users with valid access token
#    And I send the GET request to "get_all_users" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$[0].User|object|
#      |$[0].Reportinguser|object|
#    And I store the response as "all_users_response" name using full path

#  @Positive @DataValidation
#  Scenario: Validate all users response structure
#    And I send the GET request to "get_all_users" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|array|
#      |$[0]|array|
#      |$[0].User|object|
#      |$[0].Reportinguser|object|

#  @Positive @DataValidation
#  Scenario: Validate all users User object structure
#    And I send the GET request to "get_all_users" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$[0].User.id|array|
#      |$[0].User.username|string|
#      |$[0].User.name|string|
#      |$[0].User.phoneno|string|
#      |$[0].User.creditlimit|string|
#      |$[0].User.balance|string|
#      |$[0].User.active|string|
#      |$[0].User.employeeid|string|

#  @Positive @DataValidation
#  Scenario: Validate all users Reportinguser object structure
#    And I send the GET request to "get_all_users" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$[0].Reportinguser.id|array|
#      |$[0].Reportinguser.name|string|

  @Positive @DataValidation
  Scenario: Validate all users with static values
    And I send the GET request to "get_all_users" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$[0].User.id|"2"|
      |$[0].User.username|"covidse"|
      |$[0].User.name|"SLV Traders"|
      |$[0].User.phoneno|"7777777777"|
      |$[0].User.creditlimit|"9990000"|
      |$[0].User.balance|"65"|
      |$[0].User.active|"1"|
      |$[0].User.employeeid|"1211"|
      |$[0].Reportinguser.id|"3"|
      |$[0].Reportinguser.name|"Covid MGR"|

#  @Positive @Performance
#  Scenario: Performance test for all users endpoint
#    And I send the GET request to "get_all_users" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$|array|
#      |$[0].User|object|
#      |$[0].Reportinguser|object|

#  @Positive @Concurrency
#  Scenario: Concurrent access test for all users endpoint
#    And I send the GET request to "get_all_users" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$|array|
#      |$[0].User|object|
#      |$[0].Reportinguser|object|

#  @Negative @Validation
#  Scenario: Get all users with invalid query parameters
#    And I send the GET request to "get_all_users" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |invalid_param|invalid_value|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$|array|
#      |$[0].User|object|
#      |$[0].Reportinguser|object|

#  @Negative @Validation
#  Scenario: Get all users with special characters in query parameters
#    And I send the GET request to "get_all_users" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$|array|
#      |$[0].User|object|
#      |$[0].Reportinguser|object|

#  @Negative @Security
#  Scenario: Get all users with SQL injection attempt
#    And I send the GET request to "get_all_users" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|'; DROP TABLE users; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$|array|
#      |$[0].User|object|
#      |$[0].Reportinguser|object|

#  @Negative @Boundary
#  Scenario: Get all users with maximum query parameters
#    And I send the GET request to "get_all_users" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |param1|value1|
#      |param2|value2|
#      |param3|value3|
#      |param4|value4|
#      |param5|value5|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$|array|
#      |$[0].User|object|
#      |$[0].Reportinguser|object|

#  @Negative @ErrorHandling
#  Scenario: Get all users with invalid endpoint
#    And I send the GET request to "get_all_users_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

#  @Positive @BusinessLogic
#  Scenario: Validate all users business logic
#    And I send the GET request to "get_all_users" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$|array|
#      |$[0].User|object|
#      |$[0].Reportinguser|object|
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$[0].User.id|DB:users:id: id=2|
#      |$[0].User.name|DB:users:name: id=2|
#      |$[0].User.username|DB:users:username: id=2|
#      |$[0].Reportinguser.id|DB:users:id: id=3|

#  @Positive @DataIntegrity
#  Scenario: Validate all users data integrity
#    And I send the GET request to "get_all_users" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|array|
#      |$[0]|array|
#      |$[0].User|object|
#      |$[0].Reportinguser|object|
#      |$[0].User.id|array|
#      |$[0].User.username|string|
#      |$[0].User.name|string|
#      |$[0].User.phoneno|string|
#      |$[0].User.creditlimit|string|
#      |$[0].User.balance|string|
#      |$[0].User.active|string|
#      |$[0].User.employeeid|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$[0].User.id|"2"|
#      |$[0].User.username|"covidse"|
#      |$[0].User.name|"SLV Traders"|
#      |$[0].Reportinguser.id|"3"|
#      |$[0].Reportinguser.name|"Covid MGR"|

#  @Positive @Regression
#  Scenario: Regression test for all users endpoint
#    And I send the GET request to "get_all_users" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$|array|
#      |$[0].User|object|
#      |$[0].Reportinguser|object|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|array|
#      |$[0]|array|
#      |$[0].User|object|
#      |$[0].Reportinguser|object|

#  @Positive @Functional
#  Scenario: Validate all users response completeness
#    And I send the GET request to "get_all_users" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|array|
#      |$[0]|array|
#      |$[0].User|object|
#      |$[0].Reportinguser|object|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$[0].User.id|"2"|
#      |$[0].User.username|"covidse"|
#      |$[0].User.name|"SLV Traders"|
#      |$[0].User.phoneno|"7777777777"|
#      |$[0].User.creditlimit|"9990000"|
#      |$[0].User.balance|"65"|
#      |$[0].User.active|"1"|
#      |$[0].User.employeeid|"1211"|
#      |$[0].Reportinguser.id|"3"|
#      |$[0].Reportinguser.name|"Covid MGR"|

#  @Positive @ArrayValidation
#  Scenario: Validate all users array structure and content
#    And I send the GET request to "get_all_users" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|array|
#      |$[0]|array|
#      |$[1]|array|
#      |$[2]|array|
#      |$[0].User|object|
#      |$[0].Reportinguser|object|
#      |$[1].User|object|
#      |$[1].Reportinguser|object|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$[0].User.id|"2"|
#      |$[0].User.username|"covidse"|
#      |$[0].User.name|"SLV Traders"|
#      |$[1].User.id|"3"|
#      |$[1].User.username|"covidmgr"|
#      |$[1].User.name|"Covid MGR"|

#  @Positive @ContentValidation
#  Scenario: Validate all users content structure
#    And I send the GET request to "get_all_users" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$|array|
#      |$[0].User|object|
#      |$[0].Reportinguser|object|
#    And validating the response contains the following values
#      |Value|
#      |User|
#      |Reportinguser|
#      |id|
#      |username|
#      |name|
#      |phoneno|
#      |creditlimit|
#      |balance|
#      |active|
#      |employeeid|
#      |SLV Traders|
#      |Covid MGR|

#  @Positive @LoadTesting
#  Scenario: Load testing for all users endpoint
#    And I send the GET request to "get_all_users" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "3000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$|array|
#      |$[0].User|object|
#      |$[0].Reportinguser|object|

#  @Negative @Timeout
#  Scenario: Test all users endpoint timeout handling
#    And I send the GET request to "get_all_users" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "5000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$|array|
#      |$[0].User|object|
#      |$[0].Reportinguser|object|

#  @Positive @EndToEnd
#  Scenario: End-to-end all users data retrieval workflow
#    And I send the GET request to "get_all_users" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$|array|
#      |$[0].User|object|
#      |$[0].Reportinguser|object|
#    And I store the response as "all_users_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|array|
#      |$[0]|array|
#      |$[0].User|object|
#      |$[0].Reportinguser|object|
#      |$[0].User.id|array|
#      |$[0].User.username|string|
#      |$[0].User.name|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$[0].User.id|"2"|
#      |$[0].User.username|"covidse"|
#      |$[0].User.name|"SLV Traders"|
#      |$[0].User.phoneno|"7777777777"|
#      |$[0].User.creditlimit|"9990000"|
#      |$[0].User.balance|"65"|
#      |$[0].User.active|"1"|
#      |$[0].User.employeeid|"1211"|
#      |$[0].Reportinguser.id|"3"|
#      |$[0].Reportinguser.name|"Covid MGR"|

#  @Positive @HeaderValidation
#  Scenario: Validate all users response headers
#    And I send the GET request to "get_all_users" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Content-Type|application/json; charset=UTF-8|
#      |Server|Bizom|
#      |Connection|keep-alive|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$|array|
#      |$[0].User|object|
#      |$[0].Reportinguser|object|

#  @Positive @SessionValidation
#  Scenario: Validate all users with session handling
#    And I send the GET request to "get_all_users" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$|array|
#      |$[0].User|object|
#      |$[0].Reportinguser|object|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|array|
#      |$[0]|array|
#      |$[0].User|object|
#      |$[0].Reportinguser|object|

#  @Positive @UserDataValidation
#  Scenario: Validate all users user data mapping
#    And I send the GET request to "get_all_users" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$[0].User.id|"2"|
#      |$[0].User.username|"covidse"|
#      |$[0].User.name|"SLV Traders"|
#      |$[0].User.phoneno|"7777777777"|
#      |$[0].User.creditlimit|"9990000"|
#      |$[0].User.balance|"65"|
#      |$[0].User.active|"1"|
#      |$[0].User.employeeid|"1211"|
#      |$[1].User.id|"3"|
#      |$[1].User.username|"covidmgr"|
#      |$[1].User.name|"Covid MGR"|
#      |$[2].User.id|"4"|
#      |$[2].User.username|"zonemgr"|
#      |$[2].User.name|"SLV Traders"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$[0].User.id|array|
#      |$[0].User.username|string|
#      |$[0].User.name|string|
#      |$[0].User.phoneno|string|
#      |$[0].User.creditlimit|string|
#      |$[0].User.balance|string|
#      |$[0].User.active|string|
#      |$[0].User.employeeid|string|

#  @Positive @ReportingStructureValidation
#  Scenario: Validate all users reporting structure
#    And I send the GET request to "get_all_users" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$|array|
#      |$[0].User|object|
#      |$[0].Reportinguser|object|
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$[0].Reportinguser.id|DB:users:id: id=3|
#      |$[0].Reportinguser.name|DB:users:name: id=3|
#      |$[1].Reportinguser.id|DB:users:id: id=null|
#      |$[1].Reportinguser.name|DB:users:name: id=null|

#  @Positive @MultipleUserValidation
#  Scenario: Validate all users multiple user data
#    And I send the GET request to "get_all_users" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$[0].User.id|"2"|
#      |$[0].User.username|"covidse"|
#      |$[0].User.name|"SLV Traders"|
#      |$[1].User.id|"3"|
#      |$[1].User.username|"covidmgr"|
#      |$[1].User.name|"Covid MGR"|
#      |$[2].User.id|"4"|
#      |$[2].User.username|"zonemgr"|
#      |$[2].User.name|"SLV Traders"|
#      |$[3].User.id|"5"|
#      |$[3].User.username|"coviddmgr"|
#      |$[3].User.name|"Sadha"|
#      |$[4].User.id|"6"|
#      |$[4].User.username|"nrthwmgr"|
#      |$[4].User.name|"Mobisy"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$[0].User|array|
#      |$[1].User|array|
#      |$[2].User|array|
#      |$[3].User|array|
#      |$[4].User|array|
#      |$[0].Reportinguser|object|
#      |$[1].Reportinguser|object|
#      |$[2].Reportinguser|object|
#      |$[3].Reportinguser|object|
#      |$[4].Reportinguser|object|
