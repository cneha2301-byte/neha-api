@BizomWebAPI @CE @GetEnrollStatus @UserManagement
Feature: GetEnrollStatus API Testing
  As a system user
  I want to test the getenrollstatus endpoint
  So that I can ensure proper functionality and data retrieval for user enrollment status

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get enroll status without access token
    When I send the GET request to "get_enroll_status" endpoint with path parameters
      |Path|Value|
      |userId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get enroll status with invalid access token
    And I send the GET request to "get_enroll_status" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|userId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get enroll status with expired access token
    And I send the GET request to "get_enroll_status" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|userId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get enroll status with malformed access token
    And I send the GET request to "get_enroll_status" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|userId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: Get enroll status for user ID 1 with valid access token
    And I send the GET request to "get_enroll_status" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.User.enroll_status|"0"|
      |$.User.name|"SLV Traders"|
      |$.User.email|"sadhananda@mobisy.com"|
      |$.User.phoneno|""|
      |$.User.address|"Bangalore"|
      |$.User.username|"uiadmin"|
      |$.User.active|"1"|
      |$.User.employeeid|"1"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.User|object|
      |$.User.enroll_status|string|
      |$.User.name|string|
      |$.User.email|string|
      |$.User.phoneno|string|
      |$.User.address|string|
      |$.User.username|string|
      |$.User.active|string|
      |$.User.employeeid|string|

#  @Negative @Validation
#  Scenario: Get enroll status with blank user ID
#    And I send the GET request to "get_enroll_status" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId||
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.User.enroll_status|"0"|
#      |$.User.name|"SLV Traders"|
#      |$.User.email|"sadhananda@mobisy.com"|
#      |$.User.phoneno|""|
#      |$.User.address|"Bangalore"|
#      |$.User.username|"uiadmin"|
#      |$.User.active|"1"|
#      |$.User.employeeid|"1"|

#  @Negative @Validation
#  Scenario: Get enroll status with invalid user ID
#    And I send the GET request to "get_enroll_status" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|999999|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.User.enroll_status|"0"|
#      |$.User.name|"SLV Traders"|
#      |$.User.email|"sadhananda@mobisy.com"|
#      |$.User.phoneno|""|
#      |$.User.address|"Bangalore"|
#      |$.User.username|"uiadmin"|
#      |$.User.active|"1"|
#      |$.User.employeeid|"1"|

#  @Negative @Validation
#  Scenario: Get enroll status with non-numeric user ID
#    And I send the GET request to "get_enroll_status" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|abc|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.User.enroll_status|"0"|
#      |$.User.name|"SLV Traders"|
#      |$.User.email|"sadhananda@mobisy.com"|
#      |$.User.phoneno|""|
#      |$.User.address|"Bangalore"|
#      |$.User.username|"uiadmin"|
#      |$.User.active|"1"|
#      |$.User.employeeid|"1"|

#  @Negative @ErrorHandling
#  Scenario: Get enroll status with invalid endpoint
#    And I send the GET request to "get_enroll_status_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|1|
#    Then I should see the response code as "404"
#    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance test for get enroll status endpoint
    And I send the GET request to "get_enroll_status" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Regression
  Scenario: Regression test for get enroll status endpoint
    And I send the GET request to "get_enroll_status" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

#  @Positive @Smoke
#  Scenario: Get enroll status for user ID 1 with valid access token - DB validation
#    And I send the GET request to "get_enroll_status" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.User.enroll_status|DB:users:enroll_status: id=1|
#      |$.User.name|DB:users:name: id=1|
#      |$.User.email|DB:users:email: id=1|
#      |$.User.phoneno|DB:users:phoneno: id=1|
#      |$.User.address|DB:users:address: id=1|
#      |$.User.username|DB:users:username: id=1|
#      |$.User.active|DB:users:active: id=1|
#      |$.User.employeeid|DB:users:employeeid: id=1|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.User|object|
#      |$.User.enroll_status|string|
#      |$.User.name|string|
#      |$.User.email|string|
#      |$.User.phoneno|string|
#      |$.User.address|string|
#      |$.User.username|string|
#      |$.User.active|string|
#      |$.User.employeeid|string|

  @Positive @DataValidation
  Scenario: Validate get enroll status response structure for user ID 1
    And I send the GET request to "get_enroll_status" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.User.enroll_status|"0"|
      |$.User.name|"SLV Traders"|
      |$.User.email|"sadhananda@mobisy.com"|
      |$.User.phoneno|""|
      |$.User.address|"Bangalore"|
      |$.User.username|"uiadmin"|
      |$.User.active|"1"|
      |$.User.employeeid|"1"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.User|object|
      |$.User.enroll_status|string|
      |$.User.name|string|
      |$.User.email|string|
      |$.User.phoneno|string|
      |$.User.address|string|
      |$.User.username|string|
      |$.User.active|string|
      |$.User.employeeid|string|

  @Positive @BusinessLogic
  Scenario: Validate get enroll status business logic for user ID 1
    And I send the GET request to "get_enroll_status" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.User.enroll_status|"0"|
      |$.User.name|"SLV Traders"|
      |$.User.email|"sadhananda@mobisy.com"|
      |$.User.phoneno|""|
      |$.User.address|"Bangalore"|
      |$.User.username|"uiadmin"|
      |$.User.active|"1"|
      |$.User.employeeid|"1"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.User|object|
      |$.User.enroll_status|string|
      |$.User.name|string|
      |$.User.email|string|
      |$.User.phoneno|string|
      |$.User.address|string|
      |$.User.username|string|
      |$.User.active|string|
      |$.User.employeeid|string|

  @Positive @UserDataValidation
  Scenario: Validate user data structure for user ID 1
    And I send the GET request to "get_enroll_status" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.User.enroll_status|"0"|
      |$.User.name|"SLV Traders"|
      |$.User.email|"sadhananda@mobisy.com"|
      |$.User.phoneno|""|
      |$.User.address|"Bangalore"|
      |$.User.username|"uiadmin"|
      |$.User.active|"1"|
      |$.User.employeeid|"1"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.User|object|
      |$.User.enroll_status|string|
      |$.User.name|string|
      |$.User.email|string|
      |$.User.phoneno|string|
      |$.User.address|string|
      |$.User.username|string|
      |$.User.active|string|
      |$.User.employeeid|string|

  @Positive @EnrollStatusValidation
  Scenario: Validate enroll status specific data for user ID 1
    And I send the GET request to "get_enroll_status" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.User.enroll_status|"0"|
      |$.User.name|"SLV Traders"|
      |$.User.email|"sadhananda@mobisy.com"|
      |$.User.phoneno|""|
      |$.User.address|"Bangalore"|
      |$.User.username|"uiadmin"|
      |$.User.active|"1"|
      |$.User.employeeid|"1"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.User|object|
      |$.User.enroll_status|string|
      |$.User.name|string|
      |$.User.email|string|
      |$.User.phoneno|string|
      |$.User.address|string|
      |$.User.username|string|
      |$.User.active|string|
      |$.User.employeeid|string|

  @Positive @ObjectValidation
  Scenario: Validate User object structure and content for user ID 1
    And I send the GET request to "get_enroll_status" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.User.enroll_status|"0"|
      |$.User.name|"SLV Traders"|
      |$.User.email|"sadhananda@mobisy.com"|
      |$.User.phoneno|""|
      |$.User.address|"Bangalore"|
      |$.User.username|"uiadmin"|
      |$.User.active|"1"|
      |$.User.employeeid|"1"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.User|object|
      |$.User.enroll_status|string|
      |$.User.name|string|
      |$.User.email|string|
      |$.User.phoneno|string|
      |$.User.address|string|
      |$.User.username|string|
      |$.User.active|string|
      |$.User.employeeid|string|

  @Positive @ContentValidation
  Scenario: Validate enroll status content structure for user ID 1
    And I send the GET request to "get_enroll_status" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.User.enroll_status|"0"|
      |$.User.name|"SLV Traders"|
      |$.User.email|"sadhananda@mobisy.com"|
      |$.User.phoneno|""|
      |$.User.address|"Bangalore"|
      |$.User.username|"uiadmin"|
      |$.User.active|"1"|
      |$.User.employeeid|"1"|
    And validating the response contains the following values
      |Value|
      |User|
      |enroll_status|
      |name|
      |email|
      |phoneno|
      |address|
      |username|
      |active|
      |employeeid|

  @Positive @LoadTesting
  Scenario: Load testing for get enroll status endpoint
    And I send the GET request to "get_enroll_status" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.User.enroll_status|"0"|
      |$.User.name|"SLV Traders"|
      |$.User.email|"sadhananda@mobisy.com"|
      |$.User.phoneno|""|
      |$.User.address|"Bangalore"|
      |$.User.username|"uiadmin"|
      |$.User.active|"1"|
      |$.User.employeeid|"1"|

  @Negative @Timeout
  Scenario: Test get enroll status endpoint timeout handling
    And I send the GET request to "get_enroll_status" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.User.enroll_status|"0"|
      |$.User.name|"SLV Traders"|
      |$.User.email|"sadhananda@mobisy.com"|
      |$.User.phoneno|""|
      |$.User.address|"Bangalore"|
      |$.User.username|"uiadmin"|
      |$.User.active|"1"|
      |$.User.employeeid|"1"|

  @Positive @EndToEnd
  Scenario: End-to-end get enroll status data retrieval workflow
    And I send the GET request to "get_enroll_status" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I store the response as "enroll_status_response" name using full path
    And the fields in response should match with expected values
      |JPath|Value|
      |$.User.enroll_status|"0"|
      |$.User.name|"SLV Traders"|
      |$.User.email|"sadhananda@mobisy.com"|
      |$.User.phoneno|""|
      |$.User.address|"Bangalore"|
      |$.User.username|"uiadmin"|
      |$.User.active|"1"|
      |$.User.employeeid|"1"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.User|object|
      |$.User.enroll_status|string|
      |$.User.name|string|
      |$.User.email|string|
      |$.User.phoneno|string|
      |$.User.address|string|
      |$.User.username|string|
      |$.User.active|string|
      |$.User.employeeid|string|

  @Positive @CompleteValidation
  Scenario: Validate complete get enroll status data structure for user ID 1
    And I send the GET request to "get_enroll_status" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.User.enroll_status|"0"|
      |$.User.name|"SLV Traders"|
      |$.User.email|"sadhananda@mobisy.com"|
      |$.User.phoneno|""|
      |$.User.address|"Bangalore"|
      |$.User.username|"uiadmin"|
      |$.User.active|"1"|
      |$.User.employeeid|"1"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.User|object|
      |$.User.enroll_status|string|
      |$.User.name|string|
      |$.User.email|string|
      |$.User.phoneno|string|
      |$.User.address|string|
      |$.User.username|string|
      |$.User.active|string|
      |$.User.employeeid|string|
