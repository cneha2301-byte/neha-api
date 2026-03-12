@BizomWebAPI @CE @GetMyUsers @UserManagement
Feature: GetMyUsers API Testing
  As a system user
  I want to test the getmyusers endpoint
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
  Scenario: Get my users without access token
    When I send the GET request to "get_my_users" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get my users with invalid access token
    And I send the GET request to "get_my_users" endpoint with dynamic access token and query parameters
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
  Scenario: Get my users with expired access token
    And I send the GET request to "get_my_users" endpoint with dynamic access token and query parameters
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
  Scenario: Get my users with malformed access token
    And I send the GET request to "get_my_users" endpoint with dynamic access token and query parameters
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
  Scenario: Get my users with valid access token
    And I send the GET request to "get_my_users" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.apiVersion|"2.0"|
      |$.error.code|200|
      |$.error.message|"No Error Found"|
    And I store the response as "getmyusers_response" name using full path

  @Positive @DataValidation
  Scenario: Validate getmyusers response structure
    And I send the GET request to "get_my_users" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.apiVersion|"2.0"|
      |$.error.code|200|
      |$.error.message|"No Error Found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.apiVersion|string|
      |$.error|object|
      |$.error.code|number|
      |$.error.message|string|
      |$.data|array|

#  @Positive @DataValidation
#  Scenario: Validate getmyusers specific data values
#    And I send the GET request to "get_my_users" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.apiVersion|"2.0"|
#      |$.error.code|200|
#      |$.error.message|"No Error Found"|
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.data[0].userid|DB:users:id: id=1|
#      |$.data[0].name|DB:users:name: id=1|
#      |$.data[0].username|DB:users:username: id=1|

  @Positive @DataValidation
  Scenario: Validate getmyusers with static values
    And I send the GET request to "get_my_users" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.apiVersion|"2.0"|
      |$.error.code|200|
      |$.error.message|"No Error Found"|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data[0].userid|"1"|
      |$.data[0].name|"SLV Traders"|
      |$.data[0].username|"uiadmin"|
      |$.data[0].role_id|"1"|
      |$.data[0].role_name|"ADMIN"|

  @Positive @Performance
  Scenario: Performance test for getmyusers endpoint
    And I send the GET request to "get_my_users" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.apiVersion|"2.0"|
      |$.error.code|200|
      |$.error.message|"No Error Found"|

  @Positive @Concurrency
  Scenario: Concurrent access test for getmyusers endpoint
    And I send the GET request to "get_my_users" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.apiVersion|"2.0"|
      |$.error.code|200|
      |$.error.message|"No Error Found"|

  @Negative @Validation
  Scenario: Get my users with invalid query parameters
    And I send the GET request to "get_my_users" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.apiVersion|"2.0"|
      |$.error.code|200|
      |$.error.message|"No Error Found"|

  @Negative @Validation
  Scenario: Get my users with special characters in query parameters
    And I send the GET request to "get_my_users" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.apiVersion|"2.0"|
      |$.error.code|200|
      |$.error.message|"No Error Found"|

  @Negative @Security
  Scenario: Get my users with SQL injection attempt
    And I send the GET request to "get_my_users" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE users; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.apiVersion|"2.0"|
      |$.error.code|200|
      |$.error.message|"No Error Found"|

  @Negative @Boundary
  Scenario: Get my users with maximum query parameters
    And I send the GET request to "get_my_users" endpoint with dynamic access token and query parameters
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
      |$.result|true|
      |$.apiVersion|"2.0"|
      |$.error.code|200|
      |$.error.message|"No Error Found"|

#  @Negative @ErrorHandling
#  Scenario: Get my users with invalid endpoint
#    And I send the GET request to "get_my_users_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

  @Positive @BusinessLogic
  Scenario: Validate getmyusers business logic
    And I send the GET request to "get_my_users" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.apiVersion|"2.0"|
      |$.error.code|200|
      |$.error.message|"No Error Found"|

  @Positive @DataIntegrity
  Scenario: Validate getmyusers data integrity
    And I send the GET request to "get_my_users" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.apiVersion|"2.0"|
      |$.error.code|200|
      |$.error.message|"No Error Found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.apiVersion|string|
      |$.error|object|
      |$.error.code|number|
      |$.error.message|string|
      |$.data|array|
      |$.data[0]|object|
      |$.data[0].userid|string|
      |$.data[0].name|string|
      |$.data[0].username|string|
      |$.data[0].role_id|string|
      |$.data[0].role_name|string|

  @Positive @Regression
  Scenario: Regression test for getmyusers endpoint
    And I send the GET request to "get_my_users" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.apiVersion|"2.0"|
      |$.error.code|200|
      |$.error.message|"No Error Found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.apiVersion|string|
      |$.error|object|
      |$.data|array|

  @Positive @Functional
  Scenario: Validate getmyusers response completeness
    And I send the GET request to "get_my_users" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.apiVersion|"2.0"|
      |$.error.code|200|
      |$.error.message|"No Error Found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data[0].userid|"1"|
      |$.data[0].name|"SLV Traders"|
      |$.data[0].username|"uiadmin"|
      |$.data[0].role_id|"1"|
      |$.data[0].role_name|"ADMIN"|

  @Positive @ArrayValidation
  Scenario: Validate getmyusers array structure and content
    And I send the GET request to "get_my_users" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.apiVersion|"2.0"|
      |$.error.code|200|
      |$.error.message|"No Error Found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
      |$.data[0]|object|
      |$.data[1]|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data[0].userid|"1"|
      |$.data[0].name|"SLV Traders"|
      |$.data[0].username|"uiadmin"|
      |$.data[1].userid|"2"|
      |$.data[1].name|"SLV Traders"|
      |$.data[1].username|"covidse"|

  @Positive @ContentValidation
  Scenario: Validate getmyusers content structure
    And I send the GET request to "get_my_users" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.apiVersion|"2.0"|
      |$.error.code|200|
      |$.error.message|"No Error Found"|
    And validating the response contains the following values
      |Value|
      |userid|
      |name|
      |username|
      |role_id|
      |role_name|
      |attendance|
      |rolespecificid|

  @Positive @LoadTesting
  Scenario: Load testing for getmyusers endpoint
    And I send the GET request to "get_my_users" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.apiVersion|"2.0"|
      |$.error.code|200|
      |$.error.message|"No Error Found"|

  @Negative @Timeout
  Scenario: Test getmyusers endpoint timeout handling
    And I send the GET request to "get_my_users" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "10000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.apiVersion|"2.0"|
      |$.error.code|200|
      |$.error.message|"No Error Found"|

  @Positive @EndToEnd
  Scenario: End-to-end getmyusers data retrieval workflow
    And I send the GET request to "get_my_users" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.apiVersion|"2.0"|
      |$.error.code|200|
      |$.error.message|"No Error Found"|
    And I store the response as "getmyusers_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.apiVersion|string|
      |$.error|object|
      |$.data|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data[0].userid|"1"|
      |$.data[0].name|"SLV Traders"|
      |$.data[0].username|"uiadmin"|
      |$.data[0].role_id|"1"|
      |$.data[0].role_name|"ADMIN"|