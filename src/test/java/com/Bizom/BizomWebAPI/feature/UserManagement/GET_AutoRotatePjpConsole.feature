@BizomWebAPI @CE @GetAutoRotatePjpConsole @UserManagement
Feature: Auto Rotate PJP Console API Testing
  As a system user
  I want to test the auto rotate PJP console endpoint
  So that I can ensure proper functionality for auto rotating PJP console management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Auto rotate PJP console without access token
    When I send the GET request to "users_autorotatepjpconsole" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title ""
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Auto rotate PJP console with invalid access token
    And I send the GET request to "users_autorotatepjpconsole" endpoint with dynamic access token and query parameters
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
  Scenario: TC_03 Auto rotate PJP console with expired access token
    And I send the GET request to "users_autorotatepjpconsole" endpoint with dynamic access token and query parameters
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
  Scenario: TC_04 Auto rotate PJP console with malformed access token
    And I send the GET request to "users_autorotatepjpconsole" endpoint with dynamic access token and query parameters
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
  Scenario: TC_05 Auto rotate PJP console with valid access token
    And I send the GET request to "users_autorotatepjpconsole" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Pjp will be Applied|
    And I store the response as "auto_rotate_pjp_console_response" name using full path

#  @Positive @DataValidation
#  Scenario: TC_06 Validate auto rotate PJP console response structure
#    And I send the GET request to "users_autorotatepjpconsole" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Pjp will be Applied|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|

#  @Positive @DataValidation
#  Scenario: TC_07 Validate auto rotate PJP console Result field
#    And I send the GET request to "users_autorotatepjpconsole" endpoint with dynamic access token and query parameters
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
  Scenario: TC_08 Validate auto rotate PJP console Reason field
    And I send the GET request to "users_autorotatepjpconsole" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Reason|Pjp will be Applied|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Reason|string|

#  @Positive @DataValidation
#  Scenario: TC_09 Validate auto rotate PJP console complete structure
#    And I send the GET request to "users_autorotatepjpconsole" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Pjp will be Applied|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|

  @Positive @Performance
  Scenario: TC_10 Performance test for auto rotate PJP console endpoint
    And I send the GET request to "users_autorotatepjpconsole" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Pjp will be Applied|

  @Positive @Concurrency
  Scenario: TC_11 Concurrent access test for auto rotate PJP console endpoint
    And I send the GET request to "users_autorotatepjpconsole" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Pjp will be Applied|

  @Negative @Validation
  Scenario: TC_12 Auto rotate PJP console with invalid query parameters
    And I send the GET request to "users_autorotatepjpconsole" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Pjp will be Applied|

  @Negative @Validation
  Scenario: TC_13 Auto rotate PJP console with special characters in query parameters
    And I send the GET request to "users_autorotatepjpconsole" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Pjp will be Applied|

  @Negative @Security
  Scenario: TC_14 Auto rotate PJP console with SQL injection attempt
    And I send the GET request to "users_autorotatepjpconsole" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE users; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Pjp will be Applied|

  @Negative @Boundary
  Scenario: TC_15 Auto rotate PJP console with maximum query parameters
    And I send the GET request to "users_autorotatepjpconsole" endpoint with dynamic access token and query parameters
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
      |$.Reason|Pjp will be Applied|

#  @Negative @ErrorHandling
#  Scenario: TC_16 Auto rotate PJP console with invalid endpoint
#    And I send the GET request to "users_autorotatepjpconsole_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

#  @Positive @BusinessLogic
#  Scenario: TC_17 Validate auto rotate PJP console business logic
#    And I send the GET request to "users_autorotatepjpconsole" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Pjp will be Applied|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|

  @Positive @DataIntegrity
  Scenario: TC_18 Validate auto rotate PJP console data integrity
    And I send the GET request to "users_autorotatepjpconsole" endpoint with dynamic access token and query parameters
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
      |$.Reason|Pjp will be Applied|

#  @Positive @Regression
#  Scenario: TC_19 Regression test for auto rotate PJP console endpoint
#    And I send the GET request to "users_autorotatepjpconsole" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Pjp will be Applied|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|

#  @Positive @Functional
#  Scenario: TC_20 Validate auto rotate PJP console response completeness
#    And I send the GET request to "users_autorotatepjpconsole" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Pjp will be Applied|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#    And validating the response contains the following values
#      |Value|
#      |Result|
#      |Reason|
#      |Pjp will be Applied|
#    And I store the response as "auto_rotate_pjp_console_response" name using full path

