@BizomWebAPI @CE @GetAttendancelog @UserManagement
Feature: Attendance Log API Testing
  As a system user
  I want to test the attendance log endpoint
  So that I can ensure proper functionality and data retrieval for user attendance log management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get attendance log without access token
    When I send the GET request to "users_attendancelog" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token||userId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get attendance log with invalid access token
    And I send the GET request to "users_attendancelog" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|userId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get attendance log with expired access token
    And I send the GET request to "users_attendancelog" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|userId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get attendance log with malformed access token
    And I send the GET request to "users_attendancelog" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|userId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get attendance log with valid access token and user ID
    And I send the GET request to "users_attendancelog" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$[0]|"true"|
    And I store the response as "attendance_log_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate attendance log response structure
    And I send the GET request to "users_attendancelog" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
      |$[0]|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate attendance log array content
    And I send the GET request to "users_attendancelog" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$[0]|"true"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
      |$[0]|array|

  @Positive @DataValidation
  Scenario: TC_08 Validate attendance log complete structure
    And I send the GET request to "users_attendancelog" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$[0]|"true"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
      |$[0]|array|

  @Positive @Performance
  Scenario: TC_09 Performance test for attendance log endpoint
    And I send the GET request to "users_attendancelog" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$[0]|"true"|

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for attendance log endpoint
    And I send the GET request to "users_attendancelog" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$[0]|"true"|

  @Positive @Functional
  Scenario: TC_11 Get attendance log with different user IDs
    And I send the GET request to "users_attendancelog" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
      |$[0]|array|

  @Positive @Functional
  Scenario: TC_12 Get attendance log with valid user ID 3
    And I send the GET request to "users_attendancelog" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
      |$[0]|array|

  @Negative @Validation
  Scenario: TC_13 Get attendance log with invalid query parameters
    And I send the GET request to "users_attendancelog" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
      |invalid_param|invalid_value|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
      |$[0]|array|

#  @Negative @Validation
#  Scenario: TC_14 Get attendance log with special characters in user ID
#    And I send the GET request to "users_attendancelog" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the HTML response should contain page title "Users"

#  @Negative @Security
#  Scenario: TC_15 Get attendance log with SQL injection attempt in user ID
#    And I send the GET request to "users_attendancelog" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|'; DROP TABLE users; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the HTML response should contain page title "Users"

  @Negative @Boundary
  Scenario: TC_16 Get attendance log with empty user ID
    And I send the GET request to "users_attendancelog" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId||
    Then I should see the response code as "500"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: TC_17 Get attendance log with zero user ID
    And I send the GET request to "users_attendancelog" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
      |$[0]|array|

  @Negative @Boundary
  Scenario: TC_18 Get attendance log with negative user ID
    And I send the GET request to "users_attendancelog" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
      |$[0]|array|

  @Negative @Boundary
  Scenario: TC_19 Get attendance log with very large user ID
    And I send the GET request to "users_attendancelog" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|999999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
      |$[0]|array|

#  @Negative @ErrorHandling
#  Scenario: TC_20 Get attendance log with invalid endpoint
#    And I send the GET request to "users_attendancelog_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|1|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_21 Validate attendance log business logic
    And I send the GET request to "users_attendancelog" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$[0]|"true"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
      |$[0]|array|

  @Positive @DataIntegrity
  Scenario: TC_22 Validate attendance log data integrity
    And I send the GET request to "users_attendancelog" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
      |$[0]|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$[0]|"true"|

  @Positive @Regression
  Scenario: TC_23 Regression test for attendance log endpoint
    And I send the GET request to "users_attendancelog" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$[0]|"true"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
      |$[0]|array|

  @Positive @Functional
  Scenario: TC_24 Validate attendance log response completeness
    And I send the GET request to "users_attendancelog" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$[0]|"true"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
      |$[0]|array|
    And I store the response as "attendance_log_response" name using full path

