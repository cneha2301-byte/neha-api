@BizomWebAPI @CE @UserLoginDetails @SystemIntegration
Feature: User Login Details API Testing
  As a system user
  I want to test the getuserlogindetails endpoint
  So that I can ensure proper functionality and data retrieval for user login details

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get user login details without access token
    When I send the GET request to "get_user_login_details" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get user login details with invalid access token
    And I send the GET request to "get_user_login_details" endpoint with dynamic access token and query parameters
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
  Scenario: Get user login details with expired access token
    And I send the GET request to "get_user_login_details" endpoint with dynamic access token and query parameters
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
  Scenario: Get user login details with malformed access token
    And I send the GET request to "get_user_login_details" endpoint with dynamic access token and query parameters
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
  Scenario: Get user login details with valid access token
    And I send the GET request to "get_user_login_details" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.User.roleid|"1"|
      |$.User.rolename|ADMIN|
      |$.User.rolespecificid|"470212"|
      |$.setting.otplength|6|
    And I store the response as "user_login_details_response" name using full path

  @Positive @DataValidation
  Scenario: Validate user login details response structure
    And I send the GET request to "get_user_login_details" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.User.roleid|"1"|
      |$.User.rolename|ADMIN|
      |$.User.rolespecificid|"470212"|
      |$.setting.otplength|6|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.User|object|
      |$.User.roleid|string|
      |$.User.rolename|string|
      |$.User.rolespecificid|string|
      |$.setting|object|
      |$.setting.otplength|number|

  @Positive @DataValidation
  Scenario: Validate user login details specific data values
    And I send the GET request to "get_user_login_details" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.User.roleid|"1"|
      |$.User.rolename|ADMIN|
      |$.User.rolespecificid|"470212"|
      |$.setting.otplength|6|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.User.rolename|DB:roles:name: id=1|


  @Positive @DataValidation
  Scenario: Validate user login details with static values
    And I send the GET request to "get_user_login_details" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.User.roleid|"1"|
      |$.User.rolename|ADMIN|
      |$.User.rolespecificid|"470212"|
      |$.setting.otplength|6|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.User.roleid|"1"|
      |$.User.rolename|ADMIN|
      |$.User.rolespecificid|"470212"|
      |$.setting.otplength|6|

  @Positive @Performance
  Scenario: Performance test for user login details endpoint
    And I send the GET request to "get_user_login_details" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.User.roleid|"1"|
      |$.User.rolename|ADMIN|
      |$.User.rolespecificid|"470212"|
      |$.setting.otplength|6|

  @Positive @Concurrency
  Scenario: Concurrent access test for user login details endpoint
    And I send the GET request to "get_user_login_details" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.User.roleid|"1"|
      |$.User.rolename|ADMIN|
      |$.User.rolespecificid|"470212"|
      |$.setting.otplength|6|

  @Negative @Validation
  Scenario: Get user login details with invalid query parameters
    And I send the GET request to "get_user_login_details" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.User.roleid|"1"|
      |$.User.rolename|ADMIN|
      |$.User.rolespecificid|"470212"|
      |$.setting.otplength|6|

  @Negative @Validation
  Scenario: Get user login details with special characters in query parameters
    And I send the GET request to "get_user_login_details" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.User.roleid|"1"|
      |$.User.rolename|ADMIN|
      |$.User.rolespecificid|"470212"|
      |$.setting.otplength|6|

  @Negative @Security
  Scenario: Get user login details with SQL injection attempt
    And I send the GET request to "get_user_login_details" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE users; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.User.roleid|"1"|
      |$.User.rolename|ADMIN|
      |$.User.rolespecificid|"470212"|
      |$.setting.otplength|6|

  @Negative @Boundary
  Scenario: Get user login details with maximum query parameters
    And I send the GET request to "get_user_login_details" endpoint with dynamic access token and query parameters
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
      |$.User.roleid|"1"|
      |$.User.rolename|ADMIN|
      |$.User.rolespecificid|"470212"|
      |$.setting.otplength|6|

#  @Negative @ErrorHandling
#  Scenario: Get user login details with invalid endpoint
#    And I send the GET request to "get_user_login_details_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

  @Positive @BusinessLogic
  Scenario: Validate user login details business logic
    And I send the GET request to "get_user_login_details" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.User.roleid|"1"|
      |$.User.rolename|ADMIN|
      |$.User.rolespecificid|"470212"|
      |$.setting.otplength|6|

  @Positive @DataIntegrity
  Scenario: Validate user login details data integrity
    And I send the GET request to "get_user_login_details" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.User.roleid|"1"|
      |$.User.rolename|ADMIN|
      |$.User.rolespecificid|"470212"|
      |$.setting.otplength|6|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.User|object|
      |$.User.roleid|string|
      |$.User.rolename|string|
      |$.User.rolespecificid|string|
      |$.setting|object|
      |$.setting.otplength|number|

  @Positive @Regression
  Scenario: Regression test for user login details endpoint
    And I send the GET request to "get_user_login_details" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.User.roleid|"1"|
      |$.User.rolename|ADMIN|
      |$.User.rolespecificid|"470212"|
      |$.setting.otplength|6|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.User|object|
      |$.User.roleid|string|
      |$.User.rolename|string|
      |$.User.rolespecificid|string|
      |$.setting|object|
      |$.setting.otplength|number|

  @Positive @Functional
  Scenario: Validate user login details response completeness
    And I send the GET request to "get_user_login_details" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.User.roleid|"1"|
      |$.User.rolename|ADMIN|
      |$.User.rolespecificid|"470212"|
      |$.setting.otplength|6|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.User|object|
      |$.setting|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.User.roleid|"1"|
      |$.User.rolename|ADMIN|
      |$.User.rolespecificid|"470212"|
      |$.setting.otplength|6|

  @Positive @ObjectValidation
  Scenario: Validate user login details object structure and content
    And I send the GET request to "get_user_login_details" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.User.roleid|"1"|
      |$.User.rolename|ADMIN|
      |$.User.rolespecificid|"470212"|
      |$.setting.otplength|6|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.User|object|
      |$.setting|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.User.roleid|"1"|
      |$.User.rolename|ADMIN|
      |$.User.rolespecificid|"470212"|
      |$.setting.otplength|6|

  @Positive @ContentValidation
  Scenario: Validate user login details content structure
    And I send the GET request to "get_user_login_details" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.User.roleid|"1"|
      |$.User.rolename|ADMIN|
      |$.User.rolespecificid|"470212"|
      |$.setting.otplength|6|
    And validating the response contains the following values
      |Value|
      |User|
      |roleid|
      |rolename|
      |rolespecificid|
      |setting|
      |otplength|

  @Positive @LoadTesting
  Scenario: Load testing for user login details endpoint
    And I send the GET request to "get_user_login_details" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.User.roleid|"1"|
      |$.User.rolename|ADMIN|
      |$.User.rolespecificid|"470212"|
      |$.setting.otplength|6|

  @Negative @Timeout
  Scenario: Test user login details endpoint timeout handling
    And I send the GET request to "get_user_login_details" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.User.roleid|"1"|
      |$.User.rolename|ADMIN|
      |$.User.rolespecificid|"470212"|
      |$.setting.otplength|6|

  @Positive @EndToEnd
  Scenario: End-to-end user login details data retrieval workflow
    And I send the GET request to "get_user_login_details" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.User.roleid|"1"|
      |$.User.rolename|ADMIN|
      |$.User.rolespecificid|"470212"|
      |$.setting.otplength|6|
    And I store the response as "user_login_details_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.User|object|
      |$.User.roleid|string|
      |$.User.rolename|string|
      |$.User.rolespecificid|string|
      |$.setting|object|
      |$.setting.otplength|number|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.User.roleid|"1"|
      |$.User.rolename|ADMIN|
      |$.User.rolespecificid|"470212"|
      |$.setting.otplength|6|
