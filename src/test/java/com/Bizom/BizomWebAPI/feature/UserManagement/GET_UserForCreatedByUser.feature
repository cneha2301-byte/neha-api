@BizomWebAPI @CE @UserForCreatedByUser @SystemIntegration
Feature: User For Created By User API Testing
  As a system user
  I want to test the getUserForCreatedByUser endpoint
  So that I can ensure proper functionality and data retrieval for users created by a specific user

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

#  @Negative @Security
#  Scenario: Get user for created by user without access token
#    When I send the GET request to "get_user_for_created_by_user" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|6|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get user for created by user with invalid access token
    And I send the GET request to "get_user_for_created_by_user" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|userId|6|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get user for created by user with expired access token
    And I send the GET request to "get_user_for_created_by_user" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|userId|6|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get user for created by user with malformed access token
    And I send the GET request to "get_user_for_created_by_user" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|userId|6|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: Get user for created by user with valid user ID 6
    And I send the GET request to "get_user_for_created_by_user" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|6|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
      |$.data|{"6":"Mobisy","13":"testuser_tourplan","16":"lion12","23":"kji"}|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|object|
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json; charset=UTF-8|
      |Server|Bizom|
      |Connection|keep-alive|

  @Positive @Functional
  Scenario: Verify user for created by user response structure for user ID 6
    And I send the GET request to "get_user_for_created_by_user" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|6|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
      |$.data|{"6":"Mobisy","13":"testuser_tourplan","16":"lion12","23":"kji"}|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|object|
      |$.data.6|string|
      |$.data.13|string|
      |$.data.16|string|
      |$.data.23|string|


#  @Positive @Functional
#  Scenario: Verify user for created by user response structure for user ID 4
#    And I send the GET request to "get_user_for_created_by_user" endpoint with dynamic access token, path and query parameters
#         |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|4|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|""|
#      |$.data|{"6":"Mobisy","13":"testuser_tourplan","16":"lion12","23":"kji"}|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.reason|string|
#      |$.data|object|
#      |$.data.2|string|
#      |$.data.4|string|
#      |$.data.5|string|
#      |$.data.7|string|
#      |$.data.8|string|
#      |$.data.9|string|
#      |$.data.10|string|


  @Negative @ErrorHandling
  Scenario: Get user for created by user with blank user ID
    And I send the GET request to "get_user_for_created_by_user" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|""|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|No users found.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|

  @Negative @ErrorHandling
  Scenario: Get user for created by user with invalid user ID
    And I send the GET request to "get_user_for_created_by_user" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|99999|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|No users found.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|

  @Negative @ErrorHandling
  Scenario: Get user for created by user with non-numeric user ID
    And I send the GET request to "get_user_for_created_by_user" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|invalid_user_id|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|No users found.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|

#  @Negative @ErrorHandling
#  Scenario: Get user for created by user with invalid endpoint
#    And I send the GET request to "get_user_for_created_by_user_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|6|
#    Then I should see the response code as "404"
#    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance test for user for created by user endpoint
    And I send the GET request to "get_user_for_created_by_user" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|6|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @DataValidation
  Scenario: Verify user for created by user data integrity for user ID 6
    And I send the GET request to "get_user_for_created_by_user" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|6|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
      |$.data|{"6":"Mobisy","13":"testuser_tourplan","16":"lion12","23":"kji"}|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|object|
      |$.data.6|string|
      |$.data.13|string|
      |$.data.16|string|
      |$.data.23|string|

#  @Positive @DataValidation
#  Scenario: Verify user for created by user data integrity for user ID 4
#    And I send the GET request to "get_user_for_created_by_user" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId   |4    |
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|""|
#      |$.data|{"6":"Mobisy","13":"testuser_tourplan","16":"lion12","23":"kji"}|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.reason|string|
#      |$.data|object|
#      |$.data.2|string|
#      |$.data.4|string|
#      |$.data.5|string|
#      |$.data.7|string|
#      |$.data.8|string|
#      |$.data.9|string|
#      |$.data.10|string|


#  @Positive @Smoke
#  Scenario: Get user for created by user with comprehensive validation for user ID 6
#    And I send the GET request to "get_user_for_created_by_user" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|6|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|""|
#      |$.data|{"6":"Mobisy","13":"testuser_tourplan","16":"lion12","23":"kji"}|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.reason|string|
#      |$.data|object|
#      |$.data.6|string|
#      |$.data.13|string|
#      |$.data.16|string|
#      |$.data.23|string|
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Content-Type|application/json; charset=UTF-8|
#      |Server|Bizom|
#      |Connection|keep-alive|
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.data|DB:users:created_by_user_6|
#      |$.result|true|

  @Positive @BusinessLogic
  Scenario: Verify user for created by user business logic for user ID 6
    And I send the GET request to "get_user_for_created_by_user" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|6|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
      |$.data|{"6":"Mobisy","13":"testuser_tourplan","16":"lion12","23":"kji"}|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|object|
      |$.data.6|string|
      |$.data.13|string|
      |$.data.16|string|
      |$.data.23|string|

#  @Positive @BusinessLogic
#  Scenario: Verify user for created by user business logic for user ID 4
#    And I send the GET request to "get_user_for_created_by_user" endpoint with dynamic access token, path and query parameters
#
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|4|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|""|
#      |$.data|{"6":"Mobisy","13":"testuser_tourplan","16":"lion12","23":"kji"}|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.reason|string|
#      |$.data|object|
#      |$.data.2|string|
#      |$.data.4|string|
#      |$.data.5|string|
#      |$.data.7|string|
#      |$.data.8|string|
#      |$.data.9|string|
#      |$.data.10|string|


  @Positive @Regression
  Scenario: Verify user for created by user regression testing for user ID 6
    And I send the GET request to "get_user_for_created_by_user" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|6|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
      |$.data|{"6":"Mobisy","13":"testuser_tourplan","16":"lion12","23":"kji"}|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|object|
      |$.data.6|string|
      |$.data.13|string|
      |$.data.16|string|
      |$.data.23|string|


#  @Positive @Regression
#  Scenario: Verify user for created by user regression testing for user ID 4
#    And I send the GET request to "get_user_for_created_by_user" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|4|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|""|
#      |$.data|{"6":"Mobisy","13":"testuser_tourplan","16":"lion12","23":"kji"}|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.reason|string|
#      |$.data|object|
#      |$.data.2|string|
#      |$.data.4|string|
#      |$.data.5|string|
#      |$.data.7|string|
#      |$.data.8|string|
#      |$.data.9|string|
#      |$.data.10|string|
