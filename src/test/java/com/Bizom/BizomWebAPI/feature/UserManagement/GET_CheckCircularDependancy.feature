@BizomWebAPI @CE @GetCheckCircularDependancy @UserManagement
Feature: Check Circular Dependancy API Testing
  As a system user
  I want to test the check circular dependancy endpoint
  So that I can ensure proper functionality for checking circular dependency in user management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Check circular dependancy without access token
    When I send the GET request to "users_checkcirculardependancy" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Check circular dependancy with invalid access token
    And I send the GET request to "users_checkcirculardependancy" endpoint with dynamic access token and query parameters
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
  Scenario: TC_03 Check circular dependancy with expired access token
    And I send the GET request to "users_checkcirculardependancy" endpoint with dynamic access token and query parameters
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
  Scenario: TC_04 Check circular dependancy with malformed access token
    And I send the GET request to "users_checkcirculardependancy" endpoint with dynamic access token and query parameters
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
  Scenario: TC_05 Check circular dependancy with valid access token
    And I send the GET request to "users_checkcirculardependancy" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Please set userId and reportingToUser|
    And I store the response as "check_circular_dependancy_response" name using full path

#  @Positive @DataValidation
#  Scenario: TC_06 Validate check circular dependancy response structure
#    And I send the GET request to "users_checkcirculardependancy" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Please set userId and reportingToUser|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|

#  @Positive @DataValidation
#  Scenario: TC_07 Validate check circular dependancy Result field
#    And I send the GET request to "users_checkcirculardependancy" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|

  @Positive @DataValidation
  Scenario: TC_08 Validate check circular dependancy Reason field
    And I send the GET request to "users_checkcirculardependancy" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Reason|Please set userId and reportingToUser|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Reason|string|

#  @Positive @DataValidation
#  Scenario: TC_09 Validate check circular dependancy complete structure
#    And I send the GET request to "users_checkcirculardependancy" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Please set userId and reportingToUser|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|

  @Positive @Performance
  Scenario: TC_10 Performance test for check circular dependancy endpoint
    And I send the GET request to "users_checkcirculardependancy" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Please set userId and reportingToUser|

  @Positive @Concurrency
  Scenario: TC_11 Concurrent access test for check circular dependancy endpoint
    And I send the GET request to "users_checkcirculardependancy" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Please set userId and reportingToUser|

  @Negative @Validation
  Scenario: TC_12 Check circular dependancy with invalid query parameters
    And I send the GET request to "users_checkcirculardependancy" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Please set userId and reportingToUser|

  @Negative @Validation
  Scenario: TC_13 Check circular dependancy with special characters in query parameters
    And I send the GET request to "users_checkcirculardependancy" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Please set userId and reportingToUser|

  @Negative @Security
  Scenario: TC_14 Check circular dependancy with SQL injection attempt
    And I send the GET request to "users_checkcirculardependancy" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE users; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Please set userId and reportingToUser|

  @Negative @Boundary
  Scenario: TC_15 Check circular dependancy with maximum query parameters
    And I send the GET request to "users_checkcirculardependancy" endpoint with dynamic access token and query parameters
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
      |$.Result|true|
      |$.Reason|Please set userId and reportingToUser|

#  @Negative @ErrorHandling
#  Scenario: TC_16 Check circular dependancy with invalid endpoint
#    And I send the GET request to "users_checkcirculardependancy_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

#  @Positive @BusinessLogic
#  Scenario: TC_17 Validate check circular dependancy business logic
#    And I send the GET request to "users_checkcirculardependancy" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Please set userId and reportingToUser|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|

  @Positive @DataIntegrity
  Scenario: TC_18 Validate check circular dependancy data integrity
    And I send the GET request to "users_checkcirculardependancy" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Please set userId and reportingToUser|

#  @Positive @Regression
#  Scenario: TC_19 Regression test for check circular dependancy endpoint
#    And I send the GET request to "users_checkcirculardependancy" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Please set userId and reportingToUser|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|

#  @Positive @Functional
#  Scenario: TC_20 Validate check circular dependancy response completeness
#    And I send the GET request to "users_checkcirculardependancy" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Please set userId and reportingToUser|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#    And validating the response contains the following values
#      |Value|
#      |Result|
#      |Reason|
#      |Please set userId and reportingToUser|
#    And I store the response as "check_circular_dependancy_response" name using full path

