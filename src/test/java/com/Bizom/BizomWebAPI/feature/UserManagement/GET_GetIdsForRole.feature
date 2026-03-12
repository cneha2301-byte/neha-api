@BizomWebAPI @CE @GetIdsForRole @UserManagement
Feature: GetIdsForRole API Testing
  As a system user
  I want to test the getidsforrole endpoint
  So that I can ensure proper functionality and data retrieval for role-based user IDs

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get IDs for role without access token
    When I send the GET request to "get_ids_for_role" endpoint with path parameters
      |Path|Value|
      |roleId|3|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get IDs for role with invalid access token
    And I send the GET request to "get_ids_for_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|roleId|3|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get IDs for role with expired access token
    And I send the GET request to "get_ids_for_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|roleId|3|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get IDs for role with malformed access token
    And I send the GET request to "get_ids_for_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|roleId|3|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: Get IDs for role ID 3 with valid access token
    And I send the GET request to "get_ids_for_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|roleId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.error|"Error"|
      |$.Lable|""|
      |$.ids|[]|
      |$.selected|"1"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.error|string|
      |$.Lable|string|
      |$.ids|array|
      |$.selected|string|
      |$.allselected|array|

  @Positive @Functional
  Scenario: Get IDs for role ID 1 with valid access token
    And I send the GET request to "get_ids_for_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|roleId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.error|"Error"|
      |$.Lable|""|
      |$.ids|[]|
      |$.selected|"470212"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.error|string|
      |$.Lable|string|
      |$.ids|array|
      |$.selected|string|
      |$.allselected|array|

  @Negative @Validation
  Scenario: Get IDs for role with blank role ID
    And I send the GET request to "get_ids_for_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|roleId||
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.error|"Error"|
      |$.Lable|""|
      |$.ids|[]|
      |$.selected|""|

  @Negative @Validation
  Scenario: Get IDs for role with invalid role ID
    And I send the GET request to "get_ids_for_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|roleId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.error|"Error"|
      |$.Lable|""|
      |$.ids|[]|
      |$.selected|""|
      |$.allselected|[]|

  @Negative @Validation
  Scenario: Get IDs for role with non-numeric role ID
    And I send the GET request to "get_ids_for_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|roleId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.error|"Error"|
      |$.Lable|""|
      |$.ids|[]|
      |$.selected|""|

#  @Negative @ErrorHandling
#  Scenario: Get IDs for role with invalid endpoint
#    And I send the GET request to "get_ids_for_role_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|roleId|3|
#    Then I should see the response code as "404"
#    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance test for get IDs for role endpoint
    And I send the GET request to "get_ids_for_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|roleId|3|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Regression
  Scenario: Regression test for get IDs for role endpoint
    And I send the GET request to "get_ids_for_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|roleId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

#  @Positive @Smoke
#  Scenario: Get IDs for role ID 3 with valid access token - DB validation
#    And I send the GET request to "get_ids_for_role" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|roleId|3|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.error|"Error"|
#      |$.Lable|""|
#      |$.ids|[]|
#      |$.selected|"1"|
#      |$.allselected[0].Managerole.id|DB:manageroles:id: role_id=3|
#      |$.allselected[0].Managerole.role_id|DB:manageroles:role_id: role_id=3|
#      |$.allselected[0].Managerole.user_id|DB:manageroles:user_id: role_id=3|
#      |$.allselected[0].Managerole.rolespecificid|DB:manageroles:rolespecificid: role_id=3|
#      |$.allselected[0].Managerole.roletables|DB:manageroles:roletables: role_id=3|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.error|string|
#      |$.Lable|string|
#      |$.ids|array|
#      |$.selected|string|
#      |$.allselected|array|
#      |$.allselected[0]|object|
#      |$.allselected[0].Managerole|object|

#  @Positive @Functional
#  Scenario: Get IDs for role ID 1 with valid access token - DB validation
#    And I send the GET request to "get_ids_for_role" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|roleId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.error|"Error"|
#      |$.Lable|""|
#      |$.ids|[]|
#      |$.selected|"470212"|
#      |$.allselected[0].Managerole.id|DB:manageroles:id: role_id=1|
#      |$.allselected[0].Managerole.role_id|DB:manageroles:role_id: role_id=1|
#      |$.allselected[0].Managerole.user_id|DB:manageroles:user_id: role_id=1|
#      |$.allselected[0].Managerole.rolespecificid|DB:manageroles:rolespecificid: role_id=1|
#      |$.allselected[0].Managerole.roletables|DB:manageroles:roletables: role_id=1|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.error|string|
#      |$.Lable|string|
#      |$.ids|array|
#      |$.selected|string|
#      |$.allselected|array|
#      |$.allselected[0]|object|
#      |$.allselected[0].Managerole|object|

  @Positive @DataValidation
  Scenario: Validate get IDs for role response structure for role ID 3
    And I send the GET request to "get_ids_for_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|roleId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.error|"Error"|
      |$.Lable|""|
      |$.ids|[]|
      |$.selected|"1"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.error|string|
      |$.Lable|string|
      |$.ids|array|
      |$.selected|string|
      |$.allselected|array|
      |$.allselected[0]|object|
      |$.allselected[0].Managerole|object|
      |$.allselected[0].Managerole.id|string|
      |$.allselected[0].Managerole.role_id|string|
      |$.allselected[0].Managerole.user_id|string|
      |$.allselected[0].Managerole.created|string|
      |$.allselected[0].Managerole.modified|string|
      |$.allselected[0].Managerole.rolespecificid|string|
      |$.allselected[0].Managerole.roletables|string|

  @Positive @DataValidation
  Scenario: Validate get IDs for role response structure for role ID 1
    And I send the GET request to "get_ids_for_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|roleId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.error|"Error"|
      |$.Lable|""|
      |$.ids|[]|
      |$.selected|"470212"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.error|string|
      |$.Lable|string|
      |$.ids|array|
      |$.selected|string|
      |$.allselected|array|
      |$.allselected[0]|object|
      |$.allselected[0].Managerole|object|
      |$.allselected[0].Managerole.id|string|
      |$.allselected[0].Managerole.role_id|string|
      |$.allselected[0].Managerole.user_id|string|
      |$.allselected[0].Managerole.created|string|
      |$.allselected[0].Managerole.modified|string|
      |$.allselected[0].Managerole.rolespecificid|string|
      |$.allselected[0].Managerole.roletables|string|

  @Positive @BusinessLogic
  Scenario: Validate get IDs for role business logic for role ID 3
    And I send the GET request to "get_ids_for_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|roleId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.error|"Error"|
      |$.Lable|""|
      |$.ids|[]|
      |$.selected|"1"|
      |$.allselected[0].Managerole.id|"3"|
      |$.allselected[0].Managerole.role_id|"3"|
      |$.allselected[0].Managerole.user_id|"3"|
      |$.allselected[0].Managerole.rolespecificid|"1"|
      |$.allselected[0].Managerole.roletables|"warehouses"|

  @Positive @BusinessLogic
  Scenario: Validate get IDs for role business logic for role ID 1
    And I send the GET request to "get_ids_for_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|roleId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.error|"Error"|
      |$.Lable|""|
      |$.ids|[]|
      |$.selected|"470212"|
      |$.allselected[0].Managerole.id|"1"|
      |$.allselected[0].Managerole.role_id|"1"|
      |$.allselected[0].Managerole.user_id|"1"|
      |$.allselected[0].Managerole.rolespecificid|"470212"|
      |$.allselected[0].Managerole.roletables|"companies"|

  @Positive @ArrayValidation
  Scenario: Validate allselected array structure for role ID 3
    And I send the GET request to "get_ids_for_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|roleId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.error|"Error"|
      |$.Lable|""|
      |$.ids|[]|
      |$.selected|"1"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.allselected|array|
      |$.allselected[0]|object|
      |$.allselected[0].Managerole|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.allselected[0].Managerole.id|"3"|
      |$.allselected[0].Managerole.role_id|"3"|
      |$.allselected[0].Managerole.user_id|"3"|
      |$.allselected[0].Managerole.created|"2020-05-13 14:51:51"|
      |$.allselected[0].Managerole.modified|"2020-05-13 14:51:51"|
      |$.allselected[0].Managerole.rolespecificid|"1"|
      |$.allselected[0].Managerole.roletables|"warehouses"|

  @Positive @ArrayValidation
  Scenario: Validate allselected array structure for role ID 1
    And I send the GET request to "get_ids_for_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|roleId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.error|"Error"|
      |$.Lable|""|
      |$.ids|[]|
      |$.selected|"470212"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.allselected|array|
      |$.allselected[0]|object|
      |$.allselected[0].Managerole|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.allselected[0].Managerole.id|"1"|
      |$.allselected[0].Managerole.role_id|"1"|
      |$.allselected[0].Managerole.user_id|"1"|
      |$.allselected[0].Managerole.created|"2020-03-30 16:29:16"|
      |$.allselected[0].Managerole.modified|"2020-03-30 16:29:16"|
      |$.allselected[0].Managerole.rolespecificid|"470212"|
      |$.allselected[0].Managerole.roletables|"companies"|

  @Positive @ErrorHandling
  Scenario: Validate error handling for blank role ID
    And I send the GET request to "get_ids_for_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|roleId||
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.error|"Error"|
      |$.Lable|""|
      |$.ids|[]|
      |$.selected|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.error|string|
      |$.Lable|string|
      |$.ids|array|
      |$.selected|string|

  @Positive @ErrorHandling
  Scenario: Validate error handling for invalid role ID
    And I send the GET request to "get_ids_for_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|roleId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.error|"Error"|
      |$.Lable|""|
      |$.ids|[]|
      |$.selected|""|
      |$.allselected|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.error|string|
      |$.Lable|string|
      |$.ids|array|
      |$.selected|string|
      |$.allselected|array|

  @Positive @CompleteValidation
  Scenario: Validate complete get IDs for role data structure for role ID 3
    And I send the GET request to "get_ids_for_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|roleId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.error|"Error"|
      |$.Lable|""|
      |$.ids|[]|
      |$.selected|"1"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.error|string|
      |$.Lable|string|
      |$.ids|array|
      |$.selected|string|
      |$.allselected|array|
      |$.allselected[0]|object|
      |$.allselected[0].Managerole|object|
      |$.allselected[0].Managerole.id|string|
      |$.allselected[0].Managerole.role_id|string|
      |$.allselected[0].Managerole.user_id|string|
      |$.allselected[0].Managerole.created|string|
      |$.allselected[0].Managerole.modified|string|
      |$.allselected[0].Managerole.rolespecificid|string|
      |$.allselected[0].Managerole.roletables|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.allselected[0].Managerole.id|"3"|
      |$.allselected[0].Managerole.role_id|"3"|
      |$.allselected[0].Managerole.user_id|"3"|
      |$.allselected[0].Managerole.created|"2020-05-13 14:51:51"|
      |$.allselected[0].Managerole.modified|"2020-05-13 14:51:51"|
      |$.allselected[0].Managerole.rolespecificid|"1"|
      |$.allselected[0].Managerole.roletables|"warehouses"|
