@BizomWebAPI @CE @ManagersForUser @ReportingOperations
Feature: Managers For User API Testing
  As a system user
  I want to test the getManagersForUser endpoint
  So that I can ensure proper functionality and data retrieval for user managers

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get managers for user without access token
    When I send the GET request to "get_managers_for_user" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get managers for user with invalid access token
    And I send the GET request to "get_managers_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get managers for user with expired access token
    And I send the GET request to "get_managers_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get managers for user with malformed access token
    And I send the GET request to "get_managers_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: Get managers for user with valid access token
    And I send the GET request to "get_managers_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$|[{"User":{"id":"11","name":"southsalesmgr"},"Headquarter":{"id":null,"name":null}}]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
      |$[0]|array|
      |$[0].User|array|
      |$[0].User.id|array|
      |$[0].User.name|array|
      |$[0].Headquarter|array|
      |$[0].Headquarter.id|array|
      |$[0].Headquarter.name|array|
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json; charset=UTF-8|
      |Server|Bizom|
      |Connection|keep-alive|

  @Positive @Functional
  Scenario: Verify managers for user response structure
    And I send the GET request to "get_managers_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$|[{"User":{"id":"11","name":"southsalesmgr"},"Headquarter":{"id":null,"name":null}}]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
      |$[0]|array|
      |$[0].User|array|
      |$[0].User.id|array|
      |$[0].User.name|array|
      |$[0].Headquarter|array|
      |$[0].Headquarter.id|array|
      |$[0].Headquarter.name|array|


#  @Positive @Regression
#  Scenario: Verify managers for user data consistency
#    And I send the GET request to "get_managers_for_user" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$|[{"User":{"id":"11","name":"southsalesmgr"},"Headquarter":{"id":null,"name":null}}]|
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$[0].User.id|DB:users:id: username=southsalesmgr|
#      |$[0].User.name|DB:users:name: id=11|

  @Negative @ErrorHandling
  Scenario: Get managers for user with invalid endpoint
    And I send the GET request to "get_managers_for_user_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "404"
    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance test for managers for user endpoint
    And I send the GET request to "get_managers_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @DataValidation
  Scenario: Verify managers for user data integrity
    And I send the GET request to "get_managers_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$|[{"User":{"id":"11","name":"southsalesmgr"},"Headquarter":{"id":null,"name":null}}]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
      |$[0]|array|
      |$[0].User|array|
      |$[0].User.id|array|
      |$[0].User.name|array|
      |$[0].Headquarter|array|
      |$[0].Headquarter.id|array|
      |$[0].Headquarter.name|array|



#  @Positive @Smoke
#  Scenario: Get managers for user with comprehensive validation
#    And I send the GET request to "get_managers_for_user" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$|[{"User":{"id":"11","name":"southsalesmgr"},"Headquarter":{"id":null,"name":null}}]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|array|
#      |$[0]|array|
#      |$[0].User|array|
#      |$[0].User.id|array|
#      |$[0].User.name|array|
#      |$[0].Headquarter|array|
#      |$[0].Headquarter.id|array|
#      |$[0].Headquarter.name|array|
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Content-Type|application/json; charset=UTF-8|
#      |Server|Bizom|
#      |Connection|keep-alive|
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$[0].User.id|DB:users:id: username=southsalesmgr|
#      |$[0].User.name|DB:users:name: id= 11|
  @Positive @Functional
  Scenario: Verify managers for user response format
    And I send the GET request to "get_managers_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$|[{"User":{"id":"11","name":"southsalesmgr"},"Headquarter":{"id":null,"name":null}}]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
      |$[0]|array|
      |$[0].User|array|
      |$[0].User.id|array|
      |$[0].User.name|array|
      |$[0].Headquarter|array|
      |$[0].Headquarter.id|array|
      |$[0].Headquarter.name|array|



  @Positive @EdgeCase
  Scenario: Verify managers for user with empty response
    And I send the GET request to "get_managers_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$|[{"User":{"id":"11","name":"southsalesmgr"},"Headquarter":{"id":null,"name":null}}]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Positive @BusinessLogic
  Scenario: Verify managers for user business logic
    And I send the GET request to "get_managers_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$|[{"User":{"id":"11","name":"southsalesmgr"},"Headquarter":{"id":null,"name":null}}]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
      |$[0]|array|
      |$[0].User|array|
      |$[0].User.id|array|
      |$[0].User.name|array|
      |$[0].Headquarter|array|
      |$[0].Headquarter.id|array|
      |$[0].Headquarter.name|array|
