@BizomWebAPI @CE @UserAppVersions @ReportingOperations
Feature: User App Versions API Testing
  As a system user
  I want to test the getuserappversions endpoint
  So that I can ensure proper functionality and data retrieval for user app versions

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get user app versions without access token
    When I send the GET request to "get_user_app_versions" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get user app versions with invalid access token
    And I send the GET request to "get_user_app_versions" endpoint with dynamic access token and query parameters
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
  Scenario: Get user app versions with expired access token
    And I send the GET request to "get_user_app_versions" endpoint with dynamic access token and query parameters
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
  Scenario: Get user app versions with malformed access token
    And I send the GET request to "get_user_app_versions" endpoint with dynamic access token and query parameters
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
#  Scenario: Get user app versions with valid access token
#    And I send the GET request to "get_user_app_versions" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Response.Result|"true"|
#      |$.Response.Reason|""|
#      |$.Response.Appversions[0].User.username|acldmgr|
#      |$.Response.Appversions[0].Managerole.role_id|"7"|
#      |$.Response.Appversions[0].Appversion.version|2.6.16.003|
#      |$.Response.Appversions[0].Appversion.imei|c5f3c74ab3936216|
#      |$.Response.Appversions[0].Appversion.created|2021-09-18 14:44:18|
#    And I store the response as "user_app_versions_response" name using full path

  @Positive @DataValidation
  Scenario: Validate user app versions response structure
    And I send the GET request to "get_user_app_versions" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response|object|
      |$.Response.Result|string|
      |$.Response.Reason|string|
      |$.Response.Appversions|array|
      |$.Response.Appversions[0]|object|
      |$.Response.Appversions[0].User|object|
      |$.Response.Appversions[0].User.username|string|
      |$.Response.Appversions[0].Managerole|object|
      |$.Response.Appversions[0].Managerole.role_id|string|
      |$.Response.Appversions[0].Appversion|object|
      |$.Response.Appversions[0].Appversion.version|string|
      |$.Response.Appversions[0].Appversion.imei|string|
      |$.Response.Appversions[0].Appversion.created|string|

  @Positive @DataValidation
  Scenario: Validate user app versions specific data values
    And I send the GET request to "get_user_app_versions" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|


#  @Positive @DataValidation
#  Scenario: Validate user app versions with static values
#    And I send the GET request to "get_user_app_versions" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Response.Result|"true"|
#      |$.Response.Reason|""|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Response.Appversions[0].User.username|acldmgr|
#      |$.Response.Appversions[0].Managerole.role_id|"7"|
#      |$.Response.Appversions[0].Appversion.version|2.6.16.003|
#      |$.Response.Appversions[0].Appversion.imei|c5f3c74ab3936216|
#      |$.Response.Appversions[0].Appversion.created|2021-09-18 14:44:18|
#      |$.Response.Appversions[1].User.username|aclmgg|
#      |$.Response.Appversions[1].Managerole.role_id|"5"|
#      |$.Response.Appversions[1].Appversion.version|2.6.6.014|
#      |$.Response.Appversions[1].Appversion.created|2021-03-24 10:29:25|

#  @Positive @Performance
#  Scenario: Performance test for user app versions endpoint
#    And I send the GET request to "get_user_app_versions" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Response.Result|"true"|
#      |$.Response.Reason|""|
#      |$.Response.Appversions[0].User.username|acldmgr|
#      |$.Response.Appversions[0].Managerole.role_id|"7"|
#      |$.Response.Appversions[0].Appversion.version|2.6.16.003|

#  @Positive @Concurrency
#  Scenario: Concurrent access test for user app versions endpoint
#    And I send the GET request to "get_user_app_versions" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Response.Result|"true"|
#      |$.Response.Reason|""|
#      |$.Response.Appversions[0].User.username|acldmgr|
#      |$.Response.Appversions[0].Managerole.role_id|"7"|
#      |$.Response.Appversions[0].Appversion.version|2.6.16.003|

  @Negative @Validation
  Scenario: Get user app versions with invalid query parameters
    And I send the GET request to "get_user_app_versions" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
      |$.Response.Appversions[0].User.username|acldmgr|

  @Negative @Validation
  Scenario: Get user app versions with special characters in query parameters
    And I send the GET request to "get_user_app_versions" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
      |$.Response.Appversions[0].User.username|acldmgr|

  @Negative @Security
  Scenario: Get user app versions with SQL injection attempt
    And I send the GET request to "get_user_app_versions" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE appversions; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
      |$.Response.Appversions[0].User.username|acldmgr|

  @Negative @Boundary
  Scenario: Get user app versions with maximum query parameters
    And I send the GET request to "get_user_app_versions" endpoint with dynamic access token and query parameters
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
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
      |$.Response.Appversions[0].User.username|acldmgr|

#  @Negative @ErrorHandling
#  Scenario: Get user app versions with invalid endpoint
#    And I send the GET request to "get_user_app_versions_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

#  @Positive @BusinessLogic
#  Scenario: Validate user app versions business logic
#    And I send the GET request to "get_user_app_versions" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Response.Result|"true"|
#      |$.Response.Reason|""|
#      |$.Response.Appversions[0].User.username|acldmgr|
#      |$.Response.Appversions[0].Managerole.role_id|"7"|
#      |$.Response.Appversions[0].Appversion.version|2.6.16.003|
#      |$.Response.Appversions[0].Appversion.imei|c5f3c74ab3936216|
#      |$.Response.Appversions[0].Appversion.created|2021-09-18 14:44:18|

  @Positive @DataIntegrity
  Scenario: Validate user app versions data integrity
    And I send the GET request to "get_user_app_versions" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response|object|
      |$.Response.Result|string|
      |$.Response.Reason|string|
      |$.Response.Appversions|array|
      |$.Response.Appversions[0]|object|
      |$.Response.Appversions[0].User|object|
      |$.Response.Appversions[0].User.username|string|
      |$.Response.Appversions[0].Managerole|object|
      |$.Response.Appversions[0].Managerole.role_id|string|
      |$.Response.Appversions[0].Appversion|object|
      |$.Response.Appversions[0].Appversion.version|string|
      |$.Response.Appversions[0].Appversion.imei|string|
      |$.Response.Appversions[0].Appversion.created|string|

  @Positive @Regression
  Scenario: Regression test for user app versions endpoint
    And I send the GET request to "get_user_app_versions" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response|object|
      |$.Response.Result|string|
      |$.Response.Reason|string|
      |$.Response.Appversions|array|

#  @Positive @Functional
#  Scenario: Validate user app versions response completeness
#    And I send the GET request to "get_user_app_versions" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Response.Result|"true"|
#      |$.Response.Reason|""|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Response|object|
#      |$.Response.Appversions|array|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Response.Appversions[0].User.username|acldmgr|
#      |$.Response.Appversions[0].Managerole.role_id|"7"|
#      |$.Response.Appversions[0].Appversion.version|2.6.16.003|
#      |$.Response.Appversions[0].Appversion.imei|c5f3c74ab3936216|
#      |$.Response.Appversions[0].Appversion.created|2021-09-18 14:44:18|

#  @Positive @ArrayValidation
#  Scenario: Validate user app versions array structure and content
#    And I send the GET request to "get_user_app_versions" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Response.Result|"true"|
#      |$.Response.Reason|""|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Response.Appversions|array|
#      |$.Response.Appversions[0]|object|
#      |$.Response.Appversions[1]|object|
#      |$.Response.Appversions[2]|object|
#      |$.Response.Appversions[3]|object|
#      |$.Response.Appversions[4]|object|
#      |$.Response.Appversions[5]|object|
#      |$.Response.Appversions[6]|object|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Response.Appversions[0].User.username|acldmgr|
#      |$.Response.Appversions[0].Managerole.role_id|"7"|
#      |$.Response.Appversions[0].Appversion.version|2.6.16.003|
#      |$.Response.Appversions[1].User.username|aclmgg|
#      |$.Response.Appversions[1].Managerole.role_id|"5"|
#      |$.Response.Appversions[1].Appversion.version|2.6.6.014|
#      |$.Response.Appversions[2].User.username|covidmgr|
#      |$.Response.Appversions[2].Managerole.role_id|"3"|
#      |$.Response.Appversions[2].Appversion.version|2.9.12.005|

  @Positive @ContentValidation
  Scenario: Validate user app versions content structure
    And I send the GET request to "get_user_app_versions" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
    And validating the response contains the following values
      |Value|
      |Response|
      |Result|
      |Reason|
      |Appversions|
      |User|
      |username|
      |Managerole|
      |role_id|
      |Appversion|
      |version|
      |imei|
      |created|

  @Positive @LoadTesting
  Scenario: Load testing for user app versions endpoint
    And I send the GET request to "get_user_app_versions" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
      |$.Response.Appversions[0].User.username|acldmgr|

  @Negative @Timeout
  Scenario: Test user app versions endpoint timeout handling
    And I send the GET request to "get_user_app_versions" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
      |$.Response.Appversions[0].User.username|acldmgr|

#  @Positive @EndToEnd
#  Scenario: End-to-end user app versions data retrieval workflow
#    And I send the GET request to "get_user_app_versions" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Response.Result|"true"|
#      |$.Response.Reason|""|
#      |$.Response.Appversions[0].User.username|acldmgr|
#      |$.Response.Appversions[0].Managerole.role_id|"7"|
#      |$.Response.Appversions[0].Appversion.version|2.6.16.003|
#      |$.Response.Appversions[0].Appversion.imei|c5f3c74ab3936216|
#      |$.Response.Appversions[0].Appversion.created|2021-09-18 14:44:18|
#    And I store the response as "user_app_versions_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Response|object|
#      |$.Response.Result|string|
#      |$.Response.Reason|string|
#      |$.Response.Appversions|array|
#      |$.Response.Appversions[0]|object|
#      |$.Response.Appversions[0].User|object|
#      |$.Response.Appversions[0].User.username|string|
#      |$.Response.Appversions[0].Managerole|object|
#      |$.Response.Appversions[0].Managerole.role_id|string|
#      |$.Response.Appversions[0].Appversion|object|
#      |$.Response.Appversions[0].Appversion.version|string|
#      |$.Response.Appversions[0].Appversion.imei|string|
#      |$.Response.Appversions[0].Appversion.created|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Response.Appversions[0].User.username|acldmgr|
#      |$.Response.Appversions[0].Managerole.role_id|"7"|
#      |$.Response.Appversions[0].Appversion.version|2.6.16.003|
#      |$.Response.Appversions[0].Appversion.imei|c5f3c74ab3936216|
#      |$.Response.Appversions[0].Appversion.created|2021-09-18 14:44:18|

#  @Positive @AppVersionValidation
#  Scenario: Validate user app versions specific version data
#    And I send the GET request to "get_user_app_versions" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Response.Result|"true"|
#      |$.Response.Reason|""|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Response.Appversions[0].Appversion.version|string|
#      |$.Response.Appversions[0].Appversion.imei|string|
#      |$.Response.Appversions[0].Appversion.created|string|
#      |$.Response.Appversions[1].Appversion.version|string|
#      |$.Response.Appversions[1].Appversion.imei|string|
#      |$.Response.Appversions[1].Appversion.created|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Response.Appversions[0].Appversion.version|2.6.16.003|
#      |$.Response.Appversions[0].Appversion.imei|c5f3c74ab3936216|
#      |$.Response.Appversions[0].Appversion.created|2021-09-18 14:44:18|
#      |$.Response.Appversions[1].Appversion.version|2.6.6.014|
#      |$.Response.Appversions[1].Appversion.imei|"358674089882807"|
#      |$.Response.Appversions[1].Appversion.created|2021-03-24 10:29:25|

#  @Positive @UserDataValidation
#  Scenario: Validate user data in app versions response
#    And I send the GET request to "get_user_app_versions" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Response.Result|"true"|
#      |$.Response.Reason|""|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Response.Appversions[0].User|object|
#      |$.Response.Appversions[0].User.username|string|
#      |$.Response.Appversions[0].Managerole|object|
#      |$.Response.Appversions[0].Managerole.role_id|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Response.Appversions[0].User.username|acldmgr|
#      |$.Response.Appversions[0].Managerole.role_id|"7"|
#      |$.Response.Appversions[1].User.username|aclmgg|
#      |$.Response.Appversions[1].Managerole.role_id|"5"|
#      |$.Response.Appversions[2].User.username|covidmgr|
#      |$.Response.Appversions[2].Managerole.role_id|"3"|
#      |$.Response.Appversions[3].User.username|covidse|
#      |$.Response.Appversions[3].Managerole.role_id|"5"|
#      |$.Response.Appversions[4].User.username|testacl|
#      |$.Response.Appversions[4].Managerole.role_id|"5"|
#      |$.Response.Appversions[5].User.username|touruser|
#      |$.Response.Appversions[5].Managerole.role_id|"5"|
#      |$.Response.Appversions[6].User.username|uiadmin|
#      |$.Response.Appversions[6].Managerole.role_id|"1"|
