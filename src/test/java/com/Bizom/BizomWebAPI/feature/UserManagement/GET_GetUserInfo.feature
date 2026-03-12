@BizomWebAPI @CE @GetUserInfo @allGet @ReportingOperations
Feature: This feature file contains testcases for GET endpoint getuserinfo
  As a system user
  I want to test the getuserinfo endpoint
  So that I can ensure proper functionality and data retrieval for detailed user information

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get user info without access token
    When I send the GET request to "get_user_info" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get user info with invalid access token
    And I send the GET request to "get_user_info" endpoint with dynamic access token and query parameters
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
  Scenario: Get user info with expired access token
    And I send the GET request to "get_user_info" endpoint with dynamic access token and query parameters
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
  Scenario: Get user info with malformed access token
    And I send the GET request to "get_user_info" endpoint with dynamic access token and query parameters
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
#  Scenario: Get user info with valid access token
#    And I send the GET request to "get_user_info" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.User.id|1|
#      |$.User.username|uiadmin|
#      |$.User.name|SLV Traders|
#      |$.User.email|sadhananda@mobisy.com|
#      |$.User.company_id|470212|
#      |$.User.active|1|
#      |$.User.employeeid|1|
#      |$.Role.name|ADMIN|
#      |$.Role.id|1|
#    And I store the response as "user_info_response" name using full path

#  @Positive @DataValidation
#  Scenario: Validate user info response structure
#    And I send the GET request to "get_user_info" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.User.id|1|
#      |$.User.username|uiadmin|
#      |$.User.name|SLV Traders|
#      |$.User.email|sadhananda@mobisy.com|
#      |$.User.company_id|470212|
#      |$.User.active|1|
#      |$.User.employeeid|1|
#      |$.Role.name|ADMIN|
#      |$.Role.id|1|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.User.id|string|
#      |$.User.username|string|
#      |$.User.name|string|
#      |$.User.email|string|
#      |$.User.company_id|string|
#      |$.User.active|string|
#      |$.User.employeeid|string|
#      |$.Role.name|string|
#      |$.Role.id|string|

#  @Positive @DataValidation
#  Scenario: Validate user info specific data values
#    And I send the GET request to "get_user_info" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.User.id|1|
#      |$.User.username|uiadmin|
#      |$.User.name|SLV Traders|
#      |$.User.email|sadhananda@mobisy.com|
#      |$.User.company_id|470212|
#      |$.User.active|1|
#      |$.User.employeeid|1|
#      |$.Role.name|ADMIN|
#      |$.Role.id|1|
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.User.id|1|
#      |$.User.username|uiadmin|
#      |$.User.name|SLV Traders|
#      |$.User.email|sadhananda@mobisy.com|
#      |$.User.company_id|470212|
#      |$.User.active|1|
#      |$.User.employeeid|1|
#      |$.Role.name|ADMIN|
#      |$.Role.id|1|

#  @Positive @DataValidation
#  Scenario: Validate user info with static values
#    And I send the GET request to "get_user_info" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.User.id|1|
#      |$.User.username|uiadmin|
#      |$.User.name|SLV Traders|
#      |$.User.email|sadhananda@mobisy.com|
#      |$.User.company_id|470212|
#      |$.User.active|1|
#      |$.User.employeeid|1|
#      |$.Role.name|ADMIN|
#      |$.Role.id|1|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.User.id|1|
#      |$.User.username|uiadmin|
#      |$.User.name|SLV Traders|
#      |$.User.email|sadhananda@mobisy.com|
#      |$.User.company_id|470212|
#      |$.User.active|1|
#      |$.User.employeeid|1|
#      |$.Role.name|ADMIN|
#      |$.Role.id|1|

#  @Positive @Performance
#  Scenario: Performance test for user info endpoint
#    And I send the GET request to "get_user_info" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.User.id|1|
#      |$.User.username|uiadmin|
#      |$.User.name|SLV Traders|
#      |$.User.email|sadhananda@mobisy.com|
#      |$.User.company_id|470212|
#      |$.User.active|1|
#      |$.User.employeeid|1|
#      |$.Role.name|ADMIN|
#      |$.Role.id|1|

#  @Positive @Concurrency
#  Scenario: Concurrent access test for user info endpoint
#    And I send the GET request to "get_user_info" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.User.id|1|
#      |$.User.username|uiadmin|
#      |$.User.name|SLV Traders|
#      |$.User.email|sadhananda@mobisy.com|
#      |$.User.company_id|470212|
#      |$.User.active|1|
#      |$.User.employeeid|1|
#      |$.Role.name|ADMIN|
#      |$.Role.id|1|

#  @Negative @Validation
#  Scenario: Get user info with invalid query parameters
#    And I send the GET request to "get_user_info" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |invalid_param|invalid_value|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.User.id|1|
#      |$.User.username|uiadmin|
#      |$.User.name|SLV Traders|
#      |$.User.email|sadhananda@mobisy.com|
#      |$.User.company_id|470212|
#      |$.User.active|1|
#      |$.User.employeeid|1|
#      |$.Role.name|ADMIN|
#      |$.Role.id|1|

#  @Negative @Validation
#  Scenario: Get user info with special characters in query parameters
#    And I send the GET request to "get_user_info" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.User.id|1|
#      |$.User.username|uiadmin|
#      |$.User.name|SLV Traders|
#      |$.User.email|sadhananda@mobisy.com|
#      |$.User.company_id|470212|
#      |$.User.active|1|
#      |$.User.employeeid|1|
#      |$.Role.name|ADMIN|
#      |$.Role.id|1|

#  @Negative @Security
#  Scenario: Get user info with SQL injection attempt
#    And I send the GET request to "get_user_info" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|'; DROP TABLE users; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.User.id|1|
#      |$.User.username|uiadmin|
#      |$.User.name|SLV Traders|
#      |$.User.email|sadhananda@mobisy.com|
#      |$.User.company_id|470212|
#      |$.User.active|1|
#      |$.User.employeeid|1|
#      |$.Role.name|ADMIN|
#      |$.Role.id|1|

#  @Negative @Boundary
#  Scenario: Get user info with maximum query parameters
#    And I send the GET request to "get_user_info" endpoint with dynamic access token and query parameters
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
#      |$.User.id|1|
#      |$.User.username|uiadmin|
#      |$.User.name|SLV Traders|
#      |$.User.email|sadhananda@mobisy.com|
#      |$.User.company_id|470212|
#      |$.User.active|1|
#      |$.User.employeeid|1|
#      |$.Role.name|ADMIN|
#      |$.Role.id|1|

#  @Negative @ErrorHandling
#  Scenario: Get user info with invalid endpoint
#    And I send the GET request to "get_user_info_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

#  @Positive @BusinessLogic
#  Scenario: Validate user info business logic
#    And I send the GET request to "get_user_info" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.User.id|1|
#      |$.User.username|uiadmin|
#      |$.User.name|SLV Traders|
#      |$.User.email|sadhananda@mobisy.com|
#      |$.User.company_id|470212|
#      |$.User.active|1|
#      |$.User.employeeid|1|
#      |$.Role.name|ADMIN|
#      |$.Role.id|1|

#  @Positive @DataIntegrity
#  Scenario: Validate user info data integrity
#    And I send the GET request to "get_user_info" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.User.id|1|
#      |$.User.username|uiadmin|
#      |$.User.name|SLV Traders|
#      |$.User.email|sadhananda@mobisy.com|
#      |$.User.company_id|470212|
#      |$.User.active|1|
#      |$.User.employeeid|1|
#      |$.Role.name|ADMIN|
#      |$.Role.id|1|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.User.id|string|
#      |$.User.username|string|
#      |$.User.name|string|
#      |$.User.email|string|
#      |$.User.company_id|string|
#      |$.User.active|string|
#      |$.User.employeeid|string|
#      |$.Role.name|string|
#      |$.Role.id|string|

#  @Positive @Regression
#  Scenario: Regression test for user info endpoint
#    And I send the GET request to "get_user_info" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.User.id|1|
#      |$.User.username|uiadmin|
#      |$.User.name|SLV Traders|
#      |$.User.email|sadhananda@mobisy.com|
#      |$.User.company_id|470212|
#      |$.User.active|1|
#      |$.User.employeeid|1|
#      |$.Role.name|ADMIN|
#      |$.Role.id|1|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.User.id|string|
#      |$.User.username|string|
#      |$.User.name|string|
#      |$.User.email|string|
#      |$.User.company_id|string|
#      |$.User.active|string|
#      |$.User.employeeid|string|
#      |$.Role.name|string|
#      |$.Role.id|string|

#  @Positive @Functional
#  Scenario: Validate user info response completeness
#    And I send the GET request to "get_user_info" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.User.id|1|
#      |$.User.username|uiadmin|
#      |$.User.name|SLV Traders|
#      |$.User.email|sadhananda@mobisy.com|
#      |$.User.company_id|470212|
#      |$.User.active|1|
#      |$.User.employeeid|1|
#      |$.Role.name|ADMIN|
#      |$.Role.id|1|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.User.id|string|
#      |$.User.username|string|
#      |$.User.name|string|
#      |$.User.email|string|
#      |$.User.company_id|string|
#      |$.User.active|string|
#      |$.User.employeeid|string|
#      |$.Role.name|string|
#      |$.Role.id|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.User.id|1|
#      |$.User.username|uiadmin|
#      |$.User.name|SLV Traders|
#      |$.User.email|sadhananda@mobisy.com|
#      |$.User.company_id|470212|
#      |$.User.active|1|
#      |$.User.employeeid|1|
#      |$.Role.name|ADMIN|
#      |$.Role.id|1|

#  @Positive @ObjectValidation
#  Scenario: Validate user info object structure and content
#    And I send the GET request to "get_user_info" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.User.id|1|
#      |$.User.username|uiadmin|
#      |$.User.name|SLV Traders|
#      |$.User.email|sadhananda@mobisy.com|
#      |$.User.company_id|470212|
#      |$.User.active|1|
#      |$.User.employeeid|1|
#      |$.Role.name|ADMIN|
#      |$.Role.id|1|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.User.id|string|
#      |$.User.username|string|
#      |$.User.name|string|
#      |$.User.email|string|
#      |$.User.company_id|string|
#      |$.User.active|string|
#      |$.User.employeeid|string|
#      |$.Role.name|string|
#      |$.Role.id|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.User.id|1|
#      |$.User.username|uiadmin|
#      |$.User.name|SLV Traders|
#      |$.User.email|sadhananda@mobisy.com|
#      |$.User.company_id|470212|
#      |$.User.active|1|
#      |$.User.employeeid|1|
#      |$.Role.name|ADMIN|
#      |$.Role.id|1|

#  @Positive @ContentValidation
#  Scenario: Validate user info content structure
#    And I send the GET request to "get_user_info" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.User.id|1|
#      |$.User.username|uiadmin|
#      |$.User.name|SLV Traders|
#      |$.User.email|sadhananda@mobisy.com|
#      |$.User.company_id|470212|
#      |$.User.active|1|
#      |$.User.employeeid|1|
#      |$.Role.name|ADMIN|
#      |$.Role.id|1|
#    And validating the response contains the following values
#      |Value|
#      |User|
#      |Role|
#      |workflows|
#      |Hierarchy|
#      |Formdefinitions|
#      |UserCustomData|
#      |UserCustomField|
#      |newUserCustomField|

#  @Positive @LoadTesting
#  Scenario: Load testing for user info endpoint
#    And I send the GET request to "get_user_info" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "3000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.User.id|1|
#      |$.User.username|uiadmin|
#      |$.User.name|SLV Traders|
#      |$.User.email|sadhananda@mobisy.com|
#      |$.User.company_id|470212|
#      |$.User.active|1|
#      |$.User.employeeid|1|
#      |$.Role.name|ADMIN|
#      |$.Role.id|1|

#  @Negative @Timeout
#  Scenario: Test user info endpoint timeout handling
#    And I send the GET request to "get_user_info" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "5000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.User.id|1|
#      |$.User.username|uiadmin|
#      |$.User.name|SLV Traders|
#      |$.User.email|sadhananda@mobisy.com|
#      |$.User.company_id|470212|
#      |$.User.active|1|
#      |$.User.employeeid|1|
#      |$.Role.name|ADMIN|
#      |$.Role.id|1|

#  @Positive @EndToEnd
#  Scenario: End-to-end user info data retrieval workflow
#    And I send the GET request to "get_user_info" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.User.id|1|
#      |$.User.username|uiadmin|
#      |$.User.name|SLV Traders|
#      |$.User.email|sadhananda@mobisy.com|
#      |$.User.company_id|470212|
#      |$.User.active|1|
#      |$.User.employeeid|1|
#      |$.Role.name|ADMIN|
#      |$.Role.id|1|
#    And I store the response as "user_info_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.User.id|string|
#      |$.User.username|string|
#      |$.User.name|string|
#      |$.User.email|string|
#      |$.User.company_id|string|
#      |$.User.active|string|
#      |$.User.employeeid|string|
#      |$.Role.name|string|
#      |$.Role.id|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.User.id|1|
#      |$.User.username|uiadmin|
#      |$.User.name|SLV Traders|
#      |$.User.email|sadhananda@mobisy.com|
#      |$.User.company_id|470212|
#      |$.User.active|1|
#      |$.User.employeeid|1|
#      |$.Role.name|ADMIN|
#      |$.Role.id|1|

#  @Positive @UserDataValidation
#  Scenario: Validate user info user data validation
#    And I send the GET request to "get_user_info" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.User.id|1|
#      |$.User.username|uiadmin|
#      |$.User.name|SLV Traders|
#      |$.User.email|sadhananda@mobisy.com|
#      |$.User.company_id|470212|
#      |$.User.active|1|
#      |$.User.employeeid|1|
#      |$.Role.name|ADMIN|
#      |$.Role.id|1|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.User.id|string|
#      |$.User.username|string|
#      |$.User.name|string|
#      |$.User.email|string|
#      |$.User.company_id|string|
#      |$.User.active|string|
#      |$.User.employeeid|string|
#      |$.Role.name|string|
#      |$.Role.id|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.User.id|1|
#      |$.User.username|uiadmin|
#      |$.User.name|SLV Traders|
#      |$.User.email|sadhananda@mobisy.com|
#      |$.User.company_id|470212|
#      |$.User.active|1|
#      |$.User.employeeid|1|
#      |$.Role.name|ADMIN|
#      |$.Role.id|1|

#  @Positive @WorkflowValidation
#  Scenario: Validate user info workflow validation
#    And I send the GET request to "get_user_info" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.User.id|1|
#      |$.User.username|uiadmin|
#      |$.User.name|SLV Traders|
#      |$.User.email|sadhananda@mobisy.com|
#      |$.User.company_id|470212|
#      |$.User.active|1|
#      |$.User.employeeid|1|
#      |$.Role.name|ADMIN|
#      |$.Role.id|1|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.User.id|string|
#      |$.User.username|string|
#      |$.User.name|string|
#      |$.User.email|string|
#      |$.User.company_id|string|
#      |$.User.active|string|
#      |$.User.employeeid|string|
#      |$.Role.name|string|
#      |$.Role.id|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.User.id|1|
#      |$.User.username|uiadmin|
#      |$.User.name|SLV Traders|
#      |$.User.email|sadhananda@mobisy.com|
#      |$.User.company_id|470212|
#      |$.User.active|1|
#      |$.User.employeeid|1|
#      |$.Role.name|ADMIN|
#      |$.Role.id|1|

#  @Positive @HierarchyValidation
#  Scenario: Validate user info hierarchy validation
#    And I send the GET request to "get_user_info" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.User.id|1|
#      |$.User.username|uiadmin|
#      |$.User.name|SLV Traders|
#      |$.User.email|sadhananda@mobisy.com|
#      |$.User.company_id|470212|
#      |$.User.active|1|
#      |$.User.employeeid|1|
#      |$.Role.name|ADMIN|
#      |$.Role.id|1|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.User.id|string|
#      |$.User.username|string|
#      |$.User.name|string|
#      |$.User.email|string|
#      |$.User.company_id|string|
#      |$.User.active|string|
#      |$.User.employeeid|string|
#      |$.Role.name|string|
#      |$.Role.id|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.User.id|1|
#      |$.User.username|uiadmin|
#      |$.User.name|SLV Traders|
#      |$.User.email|sadhananda@mobisy.com|
#      |$.User.company_id|470212|
#      |$.User.active|1|
#      |$.User.employeeid|1|
#      |$.Role.name|ADMIN|
#      |$.Role.id|1|

#  @Positive @CustomFieldValidation
#  Scenario: Validate user info custom field validation
#    And I send the GET request to "get_user_info" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.User.id|1|
#      |$.User.username|uiadmin|
#      |$.User.name|SLV Traders|
#      |$.User.email|sadhananda@mobisy.com|
#      |$.User.company_id|470212|
#      |$.User.active|1|
#      |$.User.employeeid|1|
#      |$.Role.name|ADMIN|
#      |$.Role.id|1|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.User.id|string|
#      |$.User.username|string|
#      |$.User.name|string|
#      |$.User.email|string|
#      |$.User.company_id|string|
#      |$.User.active|string|
#      |$.User.employeeid|string|
#      |$.Role.name|string|
#      |$.Role.id|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.User.id|1|
#      |$.User.username|uiadmin|
#      |$.User.name|SLV Traders|
#      |$.User.email|sadhananda@mobisy.com|
#      |$.User.company_id|470212|
#      |$.User.active|1|
#      |$.User.employeeid|1|
#      |$.Role.name|ADMIN|
#      |$.Role.id|1|