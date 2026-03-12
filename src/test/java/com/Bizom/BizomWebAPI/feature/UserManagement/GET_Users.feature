@BizomWebAPI @CE @UserManagement @UserGetUsers @SystemIntegration
Feature: Get Users API Testing
  As a system user
  I want to test the getusers endpoint
  So that I can ensure proper functionality and data retrieval for users management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get users without access token
    When I send the GET request to "users_getusers_with_id" endpoint with path parameters
      |Path|Value|
      |id|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get users with invalid access token
    And I send the GET request to "users_getusers_with_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|id|1|
      |ids|1|||
      |datetype|modified|||
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get users with expired access token
    And I send the GET request to "users_getusers_with_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|id|1|
      |ids|1|||
      |datetype|modified|||
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get users with malformed access token
    And I send the GET request to "users_getusers_with_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|id|1|
      |ids|1|||
      |datetype|modified|||
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get users with valid access token
    And I send the GET request to "users_getusers_with_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |ids|1|||
      |datetype|modified|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
      |$.Result|true|
      |$.Reason|""|
    And I store the response as "users_response" name using full path

#  @Positive @DataValidation
#  Scenario: TC_06 Validate users response structure
#    And I send the GET request to "users_getusers_with_id" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|id|1|
#      |ids|1|||
#      |datetype|modified|||
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|""|
#      |$.Result|true|
#      |$.Reason|""|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.reason|string|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Users|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate users specific data values
    And I send the GET request to "users_getusers_with_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |ids|1|||
      |datetype|modified|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
      |$.Result|true|
      |$.Reason|""|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Users[0].name|DB:users:name: id=1|
      |$.Users[0].username|DB:users:username: id=1|

  @Positive @DataValidation
  Scenario: TC_08 Validate users with static values
    And I send the GET request to "users_getusers_with_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |ids|1|||
      |datetype|modified|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
      |$.Result|true|
      |$.Reason|""|
      |$.Users[0].id|"1"|
      |$.Users[0].username|uiadmin|
      |$.Users[0].role|ADMIN|

  @Positive @Performance
  Scenario: TC_09 Performance test for users endpoint
    And I send the GET request to "users_getusers_with_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |ids|1|||
      |datetype|modified|||
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
      |$.Result|true|
      |$.Reason|""|

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for users endpoint
    And I send the GET request to "users_getusers_with_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |ids|1|||
      |datetype|modified|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
      |$.Result|true|
      |$.Reason|""|

  @Negative @Validation
  Scenario: TC_11 Get users with invalid query parameters
    And I send the GET request to "users_getusers_with_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |ids|invalid|||
      |datetype|invalid|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.Users|array|

  @Negative @Validation
  Scenario: TC_12 Get users with special characters in query parameters
    And I send the GET request to "users_getusers_with_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |ids|<script>alert('XSS')</script>|||
      |datetype|modified|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.Users|array|

  @Negative @Security
  Scenario: TC_13 Get users with SQL injection attempt
    And I send the GET request to "users_getusers_with_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |ids|'; DROP TABLE users; --|||
      |datetype|modified|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.Users|array|

  @Negative @Boundary
  Scenario: TC_14 Get users with maximum query parameters
    And I send the GET request to "users_getusers_with_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |ids|1|||
      |datetype|modified|||
      |param1|value1||    |
      |param2|value2||    |
      |param3|value3||    |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.Result|true|

#  @Negative @ErrorHandling
#  Scenario: TC_15 Get users with invalid endpoint
#    And I send the GET request to "users_getusers_with_id_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|id|1|
#      |ids|1|||
#      |datetype|modified|||
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_16 Validate users business logic
    And I send the GET request to "users_getusers_with_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |ids|1|||
      |datetype|modified|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
      |$.Result|true|
      |$.Reason|""|

#  @Positive @DataIntegrity
#  Scenario: TC_17 Validate users data integrity
#    And I send the GET request to "users_getusers_with_id" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|id|1|
#      |ids|1|||
#      |datetype|modified|||
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|""|
#      |$.Result|true|
#      |$.Reason|""|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.reason|string|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Users|array|
#      |$.Users[0].id|string|
#      |$.Users[0].username|string|
#      |$.Users[0].name|string|
#      |$.Users[0].email|string|
#      |$.Users[0].active|string|
#      |$.Users[0].role|string|
#      |$.Users[0].roleId|string|
#      |$.Users[0].usercustomdata|array|

#  @Positive @Regression
#  Scenario: TC_18 Regression test for users endpoint
#    And I send the GET request to "users_getusers_with_id" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|id|1|
#      |ids|1|||
#      |datetype|modified|||
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|""|
#      |$.Result|true|
#      |$.Reason|""|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.reason|string|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Users|array|

  @Positive @Functional
  Scenario: TC_19 Validate users response completeness
    And I send the GET request to "users_getusers_with_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |ids|1|||
      |datetype|modified|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Users|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Users[0].id|"1"|
      |$.Users[0].username|uiadmin|
      |$.Users[0].role|ADMIN|

  @Positive @ArrayValidation
  Scenario: TC_20 Validate users array structure and content
    And I send the GET request to "users_getusers_with_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |ids|1|||
      |datetype|modified|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Users|array|
      |$.Users[0]|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Users[0].id|"1"|
      |$.Users[0].username|uiadmin|
      |$.Users[0].name|SLV Traders|
      |$.Users[0].email|sadhananda@mobisy.com|
      |$.Users[0].role|ADMIN|

  @Positive @ContentValidation
  Scenario: TC_21 Validate users content structure
    And I send the GET request to "users_getusers_with_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |ids|1|||
      |datetype|modified|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.Result|true|
    And validating the response contains the following values
      |Value|
      |Users|
      |id|
      |username|
      |name|
      |email|
      |active|
      |role|
      |roleId|
      |created|
      |modified|
      |usercustomdata|

  @Positive @LoadTesting
  Scenario: TC_22 Load testing for users endpoint
    And I send the GET request to "users_getusers_with_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |ids|1|||
      |datetype|modified|||
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.Result|true|

  @Negative @Timeout
  Scenario: TC_23 Test users endpoint timeout handling
    And I send the GET request to "users_getusers_with_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |ids|1|||
      |datetype|modified|||
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.Result|true|

#  @Positive @EndToEnd
#  Scenario: TC_24 End-to-end users data retrieval workflow
#    And I send the GET request to "users_getusers_with_id" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|id|1|
#      |ids|1|||
#      |datetype|modified|||
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|""|
#      |$.Result|true|
#      |$.Reason|""|
#    And I store the response as "users_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.reason|string|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Users|array|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Users[0].id|"1"|
#      |$.Users[0].username|uiadmin|
#      |$.Users[0].name|SLV Traders|
#      |$.Users[0].role|ADMIN|
