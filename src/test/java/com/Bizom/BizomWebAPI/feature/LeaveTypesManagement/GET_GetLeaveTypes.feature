@BizomWebAPI @LeaveTypesManagement @GetLeaveTypes @UserAccessManagement
Feature: Get Leave Types API Testing
  As a system user
  I want to test the get leave types endpoint
  So that I can ensure proper functionality and data retrieval for leave types

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get leave types without access token
    When I send the GET request to "get_leave_types" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get leave types with invalid access token
    And I send the GET request to "get_leave_types" endpoint with dynamic access token and query parameters
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
  Scenario: Get leave types with expired access token
    And I send the GET request to "get_leave_types" endpoint with dynamic access token and query parameters
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
  Scenario: Get leave types with malformed access token
    And I send the GET request to "get_leave_types" endpoint with dynamic access token and query parameters
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
#  Scenario: Get leave types with valid access token
#    And I send the GET request to "get_leave_types" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|array|
#      |$[0]|object|
#      |$[0].Leavetype|object|
#      |$[0].Leavetype.id|string|
#      |$[0].Leavetype.name|string|
#      |$[0].Leavetype.active|boolean|
#    And I store the response as "get_leave_types_response" name using full path

#  @Positive @DataValidation
#  Scenario: Validate get leave types response structure
#    And I send the GET request to "get_leave_types" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|array|
#      |$[0]|object|
#      |$[0].Leavetype|object|
#      |$[0].Leavetype.id|string|
#      |$[0].Leavetype.name|string|
#      |$[0].Leavetype.active|boolean|

#  @Positive @DataValidation
#  Scenario: Validate get leave types nested object structure
#    And I send the GET request to "get_leave_types" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|array|
#      |$[0]|object|
#      |$[0].Leavetype|object|
#      |$[0].Leavetype.id|string|
#      |$[0].Leavetype.name|string|
#      |$[0].Leavetype.active|boolean|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$[0].Leavetype.id|"1"|
#      |$[0].Leavetype.name|Leave|
#      |$[0].Leavetype.active|true|

  @Positive @DataValidation
  Scenario: Validate get leave types with static values
    And I send the GET request to "get_leave_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$[0].Leavetype.id|"1"|
      |$[0].Leavetype.name|Leave|
      |$[0].Leavetype.active|true|

#  @Positive @Performance
#  Scenario: Performance test for get leave types endpoint
#    And I send the GET request to "get_leave_types" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|array|
#      |$[0]|object|
#      |$[0].Leavetype|object|

#  @Positive @Concurrency
#  Scenario: Concurrent access test for get leave types endpoint
#    And I send the GET request to "get_leave_types" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|array|
#      |$[0]|object|
#      |$[0].Leavetype|object|
#      |$[0].Leavetype.id|string|
#      |$[0].Leavetype.name|string|
#      |$[0].Leavetype.active|boolean|

  @Negative @Validation
  Scenario: Get leave types with invalid query parameters
    And I send the GET request to "get_leave_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Negative @Validation
  Scenario: Get leave types with special characters in query parameters
    And I send the GET request to "get_leave_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Negative @Security
  Scenario: Get leave types with SQL injection attempt
    And I send the GET request to "get_leave_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE leavetypes; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

#  @Negative @Boundary
#  Scenario: Get leave types with maximum query parameters
#    And I send the GET request to "get_leave_types" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |param1|value1|
#      |param2|value2|
#      |param3|value3|
#      |param4|value4|
#      |param5|value5|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|array|
#      |$[0]|object|
#      |$[0].Leavetype|object|

#  @Negative @ErrorHandling
#  Scenario: Get leave types with invalid endpoint
#    And I send the GET request to "get_leave_types_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

#  @Positive @BusinessLogic
#  Scenario: Validate get leave types business logic
#    And I send the GET request to "get_leave_types" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|array|
#      |$[0]|object|
#      |$[0].Leavetype|object|
#      |$[0].Leavetype.id|string|
#      |$[0].Leavetype.name|string|
#      |$[0].Leavetype.active|boolean|

#  @Positive @DataIntegrity
#  Scenario: Validate get leave types data integrity
#    And I send the GET request to "get_leave_types" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|array|
#      |$[0]|object|
#      |$[0].Leavetype|object|
#      |$[0].Leavetype.id|string|
#      |$[0].Leavetype.name|string|
#      |$[0].Leavetype.active|boolean|
#    And validating the response contains the following values
#      |Value|
#      |Leavetype|
#      |id|
#      |name|
#      |active|
#      |Leave|

#  @Positive @Regression
#  Scenario: Regression test for get leave types endpoint
#    And I send the GET request to "get_leave_types" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|array|
#      |$[0]|object|
#      |$[0].Leavetype|object|
#      |$[0].Leavetype.id|string|
#      |$[0].Leavetype.name|string|
#      |$[0].Leavetype.active|boolean|

#  @Positive @Functional
#  Scenario: Validate get leave types response completeness
#    And I send the GET request to "get_leave_types" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|array|
#      |$[0]|object|
#      |$[0].Leavetype|object|
#      |$[0].Leavetype.id|string|
#      |$[0].Leavetype.name|string|
#      |$[0].Leavetype.active|boolean|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$[0].Leavetype.id|"1"|
#      |$[0].Leavetype.name|Leave|
#      |$[0].Leavetype.active|true|

#  @Positive @ArrayValidation
#  Scenario: Validate get leave types array structure and content
#    And I send the GET request to "get_leave_types" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|array|
#      |$[0]|object|
#      |$[0].Leavetype|object|
#      |$[0].Leavetype.id|string|
#      |$[0].Leavetype.name|string|
#      |$[0].Leavetype.active|boolean|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$[0].Leavetype.id|"1"|
#      |$[0].Leavetype.name|Leave|
#      |$[0].Leavetype.active|true|

  @Positive @ContentValidation
  Scenario: Validate get leave types content structure
    And I send the GET request to "get_leave_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Leavetype|
      |id|
      |name|
      |active|
      |Leave|
    And the fields in response should match with expected values
      |JPath|Value|
      |$[0].Leavetype.id|"1"|
      |$[0].Leavetype.name|Leave|
      |$[0].Leavetype.active|true|

#  @Positive @LoadTesting
#  Scenario: Load testing for get leave types endpoint
#    And I send the GET request to "get_leave_types" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "3000" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|array|
#      |$[0]|object|
#      |$[0].Leavetype|object|

#  @Negative @Timeout
#  Scenario: Test get leave types endpoint timeout handling
#    And I send the GET request to "get_leave_types" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "5000" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|array|
#      |$[0]|object|
#      |$[0].Leavetype|object|

#  @Positive @EndToEnd
#  Scenario: End-to-end get leave types data retrieval workflow
#    And I send the GET request to "get_leave_types" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|array|
#      |$[0]|object|
#      |$[0].Leavetype|object|
#      |$[0].Leavetype.id|string|
#      |$[0].Leavetype.name|string|
#      |$[0].Leavetype.active|boolean|
#    And I store the response as "get_leave_types_response" name using full path
#    And validating the response contains the following values
#      |Value|
#      |Leavetype|
#      |id|
#      |name|
#      |active|
#      |Leave|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$[0].Leavetype.id|"1"|
#      |$[0].Leavetype.name|Leave|
#      |$[0].Leavetype.active|true|

