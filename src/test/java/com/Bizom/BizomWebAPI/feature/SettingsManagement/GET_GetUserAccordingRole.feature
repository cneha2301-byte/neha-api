@BizomWebAPI @SettingsManagement @GetUserAccordingRole @UserManagement @CE
Feature: GetUserAccordingRole API Testing
  As a system user
  I want to test the getUserAccordingRole endpoint
  So that I can ensure proper functionality and data retrieval for users by role

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get user according role without access token
    When I send the GET request to "get_user_according_role" endpoint with path parameters
      |Path|Value|
      |roleId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get user according role with invalid access token
    And I send the GET request to "get_user_according_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|roleId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get user according role with expired access token
    And I send the GET request to "get_user_according_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|roleId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get user according role with malformed access token
    And I send the GET request to "get_user_according_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|roleId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_05 Get user according role with empty access token
    And I send the GET request to "get_user_according_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token||roleId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_06 Get user according role with valid parameters
    And I send the GET request to "get_user_according_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|roleId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json"
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
      |$[0].id|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate get user according role response structure
    And I send the GET request to "get_user_according_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|roleId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json"
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
      |$[0].id|array|

  @Positive @DataValidation
  Scenario: TC_08 Validate user object fields in array
    And I send the GET request to "get_user_according_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|roleId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json"
    And the fields in response should match with expected values
      |JPath|Value|
      |$[0].id|"1"|
      |$[0].name|"SLV Traders"|
      |$[0].username|"uiadmin"|

  @Positive @DataValidation
  Scenario: TC_09 Validate multiple user objects in array
    And I send the GET request to "get_user_according_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|roleId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json"
    And validating the response field data types
      |JPath|ExpectedType|
      |$[1]|object|
      |$[1].id|array|

  @Positive @DataValidation
  Scenario: TC_10 Validate get user according role response contains required fields
    And I send the GET request to "get_user_according_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|roleId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |id|
      |name|
      |username|

  @Negative @Validation
  Scenario: TC_11 Get user according role with invalid roleId
    And I send the GET request to "get_user_according_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|roleId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_12 Get user according role with non-existent roleId
    And I send the GET request to "get_user_according_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|roleId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_13 Get user according role with blank roleId
    And I send the GET request to "get_user_according_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|roleId||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Negative @ErrorHandling
#  Scenario: TC_14 Get user according role with invalid endpoint
#    And I send the GET request to "get_user_according_role_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|roleId|1|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: TC_15 Performance test for get user according role endpoint
    And I send the GET request to "get_user_according_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|roleId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Positive @BusinessLogic
  Scenario: TC_16 Get user according role with different roleId
    And I send the GET request to "get_user_according_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|roleId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json"
    And validating the response field data types
      |JPath|ExpectedType|
      |$[0]|array|

  @Positive @Boundary
  Scenario: TC_17 Get user according role with zero roleId
    And I send the GET request to "get_user_according_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|roleId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Boundary
  Scenario: TC_18 Get user according role with very large roleId
    And I send the GET request to "get_user_according_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|roleId|2147483647|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Regression
  Scenario: TC_19 Regression test for get user according role endpoint
    And I send the GET request to "get_user_according_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|roleId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json"
    And validating the response field data types
      |JPath|ExpectedType|
      |$[0]|array|
      |$[0].id|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$[0].id|"1"|
      |$[0].username|"uiadmin"|
    And I store the response as "getuseraccordingrole_response" name using full path

  @Positive @DataValidation
  Scenario: TC_20 Validate all user objects have required fields
    And I send the GET request to "get_user_according_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|roleId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$[0].id|array|

