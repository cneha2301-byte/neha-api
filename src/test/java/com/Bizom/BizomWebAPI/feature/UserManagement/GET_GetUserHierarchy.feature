@BizomWebAPI @CE @UserHierarchy @ReportingOperations
Feature: Get User Hierarchy API Testing
  As a system user
  I want to test the getuserhierarchy endpoint
  So that I can ensure proper functionality and data retrieval for user hierarchy management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get user hierarchy without access token
    When I send the GET request to "get_user_hierarchy" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get user hierarchy with invalid access token
    And I send the GET request to "get_user_hierarchy" endpoint with dynamic access token and query parameters
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
  Scenario: Get user hierarchy with expired access token
    And I send the GET request to "get_user_hierarchy" endpoint with dynamic access token and query parameters
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
  Scenario: Get user hierarchy with malformed access token
    And I send the GET request to "get_user_hierarchy" endpoint with dynamic access token and query parameters
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
#  Scenario: Get user hierarchy with valid access token
#    And I send the GET request to "get_user_hierarchy" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.hierarchy|array|
#    And I store the response as "user_hierarchy_response" name using full path

  @Positive @DataValidation
  Scenario: Validate user hierarchy response structure
    And I send the GET request to "get_user_hierarchy" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.hierarchy|array|
      |$.hierarchy[0]|object|
      |$.hierarchy[0].user_id|string|
      |$.hierarchy[0].userHierarchy|array|
      |$.hierarchy[0].users|array|

  @Positive @DataValidation
  Scenario: Validate user hierarchy company data structure
    And I send the GET request to "get_user_hierarchy" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.hierarchy[0].userHierarchy[0].Company|object|
      |$.hierarchy[0].userHierarchy[0].Company.id|string|
      |$.hierarchy[0].userHierarchy[0].Company.name|string|
      |$.hierarchy[0].userHierarchy[0].Company.address|string|
      |$.hierarchy[0].userHierarchy[0].Company.phoneno|string|
      |$.hierarchy[0].userHierarchy[0].Company.email|string|
      |$.hierarchy[0].userHierarchy[0].Company.taxno|string|
      |$.hierarchy[0].userHierarchy[0].Company.logo_url|string|
      |$.hierarchy[0].userHierarchy[0].Company.currency|string|
      |$.hierarchy[0].userHierarchy[0].Company.timezone|string|

  @Positive @DataValidation
  Scenario: Validate user hierarchy users data structure
    And I send the GET request to "get_user_hierarchy" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.hierarchy[0].users[0]|object|
      |$.hierarchy[0].users[0].userid|string|
      |$.hierarchy[0].users[0].name|string|
      |$.hierarchy[0].users[0].email|string|
      |$.hierarchy[0].users[0].phoneno|string|
      |$.hierarchy[0].users[0].address|string|
      |$.hierarchy[0].users[0].employeeid|string|
      |$.hierarchy[0].users[0].reportingto|string|
      |$.hierarchy[0].users[0].role_id|string|
      |$.hierarchy[0].users[0].role_name|string|

  @Positive @DataValidation
  Scenario: Validate user hierarchy with static values
    And I send the GET request to "get_user_hierarchy" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.hierarchy[0].user_id|"1"|
      |$.hierarchy[0].userHierarchy[0].Company.id|"470212"|
      |$.hierarchy[0].userHierarchy[0].Company.name|"ui"|
      |$.hierarchy[0].userHierarchy[0].Company.currency|"INR"|
      |$.hierarchy[0].userHierarchy[0].Company.timezone|"Asia/Kolkata"|
      |$.hierarchy[0].users[0].userid|"2"|
      |$.hierarchy[0].users[0].name|"SLV Traders"|
      |$.hierarchy[0].users[0].email|"sadhananda@mobisy.com"|
      |$.hierarchy[0].users[0].role_name|"SALESMAN"|

#  @Positive @Performance
#  Scenario: Performance test for user hierarchy endpoint
#    And I send the GET request to "get_user_hierarchy" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.hierarchy|array|

#  @Positive @Concurrency
#  Scenario: Concurrent access test for user hierarchy endpoint
#    And I send the GET request to "get_user_hierarchy" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.hierarchy|array|

#  @Negative @Validation
#  Scenario: Get user hierarchy with invalid query parameters
#    And I send the GET request to "get_user_hierarchy" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |invalid_param|invalid_value|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.hierarchy|array|

#  @Negative @Validation
#  Scenario: Get user hierarchy with special characters in query parameters
#    And I send the GET request to "get_user_hierarchy" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.hierarchy|array|

#  @Negative @Security
#  Scenario: Get user hierarchy with SQL injection attempt
#    And I send the GET request to "get_user_hierarchy" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|'; DROP TABLE users; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.hierarchy|array|

#  @Negative @Boundary
#  Scenario: Get user hierarchy with maximum query parameters
#    And I send the GET request to "get_user_hierarchy" endpoint with dynamic access token and query parameters
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
#      |$.hierarchy|array|

#  @Negative @ErrorHandling
#  Scenario: Get user hierarchy with invalid endpoint
#    And I send the GET request to "get_user_hierarchy_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

#  @Positive @BusinessLogic
#  Scenario: Validate user hierarchy business logic
#    And I send the GET request to "get_user_hierarchy" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.hierarchy|array|
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.hierarchy[0].userHierarchy[0].Company.id|DB:companies:id: id=470212|
#      |$.hierarchy[0].users[0].userid|DB:users:id: id=2|

  @Positive @DataIntegrity
  Scenario: Validate user hierarchy data integrity
    And I send the GET request to "get_user_hierarchy" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.hierarchy|array|
      |$.hierarchy[0]|object|
      |$.hierarchy[0].user_id|string|
      |$.hierarchy[0].userHierarchy|array|
      |$.hierarchy[0].users|array|
      |$.hierarchy[0].userHierarchy[0].Company.id|string|
      |$.hierarchy[0].userHierarchy[0].Company.name|string|
      |$.hierarchy[0].users[0].userid|string|
      |$.hierarchy[0].users[0].name|string|
      |$.hierarchy[0].users[0].role_name|string|

#  @Positive @Regression
#  Scenario: Regression test for user hierarchy endpoint
#    And I send the GET request to "get_user_hierarchy" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.hierarchy|array|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.hierarchy|array|
#      |$.hierarchy[0]|object|
#      |$.hierarchy[0].user_id|string|

  @Positive @Functional
  Scenario: Validate user hierarchy response completeness
    And I send the GET request to "get_user_hierarchy" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.hierarchy|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.hierarchy[0].user_id|"1"|
      |$.hierarchy[0].userHierarchy[0].Company.id|"470212"|
      |$.hierarchy[0].userHierarchy[0].Company.name|"ui"|
      |$.hierarchy[0].users[0].userid|"2"|
      |$.hierarchy[0].users[0].name|"SLV Traders"|
      |$.hierarchy[0].users[0].role_name|"SALESMAN"|

  @Positive @ArrayValidation
  Scenario: Validate user hierarchy array structure and content
    And I send the GET request to "get_user_hierarchy" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.hierarchy|array|
      |$.hierarchy[0]|object|
      |$.hierarchy[0].userHierarchy|array|
      |$.hierarchy[0].users|array|
      |$.hierarchy[0].userHierarchy[0]|object|
      |$.hierarchy[0].users[0]|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.hierarchy[0].user_id|"1"|
      |$.hierarchy[0].userHierarchy[0].Company.id|"470212"|
      |$.hierarchy[0].users[0].userid|"2"|
      |$.hierarchy[0].users[0].name|"SLV Traders"|

#  @Positive @ContentValidation
#  Scenario: Validate user hierarchy content structure
#    And I send the GET request to "get_user_hierarchy" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.hierarchy|array|
#    And validating the response contains the following values
#      |Value|
#      |hierarchy|
#      |user_id|
#      |userHierarchy|
#      |Company|
#      |users|
#      |userid|
#      |name|
#      |email|
#      |role_name|

#  @Positive @LoadTesting
#  Scenario: Load testing for user hierarchy endpoint
#    And I send the GET request to "get_user_hierarchy" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "3000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.hierarchy|array|

#  @Negative @Timeout
#  Scenario: Test user hierarchy endpoint timeout handling
#    And I send the GET request to "get_user_hierarchy" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "5000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.hierarchy|array|

#  @Positive @EndToEnd
#  Scenario: End-to-end user hierarchy data retrieval workflow
#    And I send the GET request to "get_user_hierarchy" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.hierarchy|array|
#    And I store the response as "user_hierarchy_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.hierarchy|array|
#      |$.hierarchy[0]|object|
#      |$.hierarchy[0].user_id|string|
#      |$.hierarchy[0].userHierarchy|array|
#      |$.hierarchy[0].users|array|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.hierarchy[0].user_id|"1"|
#      |$.hierarchy[0].userHierarchy[0].Company.id|"470212"|
#      |$.hierarchy[0].userHierarchy[0].Company.name|"ui"|
#      |$.hierarchy[0].users[0].userid|"2"|
#      |$.hierarchy[0].users[0].name|"SLV Traders"|
#      |$.hierarchy[0].users[0].role_name|"SALESMAN"|

#  @Positive @HeaderValidation
#  Scenario: Validate user hierarchy response headers
#    And I send the GET request to "get_user_hierarchy" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Content-Type|text/html; charset=UTF-8|
#      |Server|Bizom|
#      |Connection|keep-alive|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.hierarchy|array|

#  @Positive @SessionValidation
#  Scenario: Validate user hierarchy with session handling
#    And I send the GET request to "get_user_hierarchy" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.hierarchy|array|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.hierarchy|array|
#      |$.hierarchy[0]|object|
#      |$.hierarchy[0].user_id|string|
