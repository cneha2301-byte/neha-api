@BizomWebAPI @CE @UserReporteeUsers @SystemIntegration
Feature: User Reportee Users API Testing
  As a system user
  I want to test the getUserReporteeUsers endpoint
  So that I can ensure proper functionality and data retrieval for reportee users of a specific user

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

#  @Negative @Security
#  Scenario: Get user reportee users without access token
#    When I send the GET request to "get_user_reportee_users" endpoint with dynamic access token, path and query parameters
#
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|1|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get user reportee users with invalid access token
    And I send the GET request to "get_user_reportee_users" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|userId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get user reportee users with expired access token
    And I send the GET request to "get_user_reportee_users" endpoint with dynamic access token, path and query parameters

      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|userId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get user reportee users with malformed access token
    And I send the GET request to "get_user_reportee_users" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|userId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

#  @Positive @Smoke
#  Scenario: Get user reportee users with valid user ID 1
#    And I send the GET request to "get_user_reportee_users" endpoint with dynamic access token, path and query parameters
#
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.Data|{"8":"SLV Traders","13":"testuser_tourplan"}|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Data|object|
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Content-Type|application/json; charset=UTF-8|
#      |Server|Bizom|
#      |Connection|keep-alive|

#  @Positive @Functional
#  Scenario: Verify user reportee users response structure for user ID 1
#    And I send the GET request to "get_user_reportee_users" endpoint with dynamic access token, path and query parameters
#
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.Data|{"8":"SLV Traders","13":"testuser_tourplan"}|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Data|object|
#      |$.Data.8|string|
#      |$.Data.13|string|

#  @Positive @Functional
#  Scenario: Verify user reportee users response structure for user ID 3
#    And I send the GET request to "get_user_reportee_users" endpoint with dynamic access token, path and query parameters
#
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|3|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.Data|{"2":"SLV Traders"}|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Data|object|
#      |$.Data.2|string|

#  @Negative @ErrorHandling
#  Scenario: Get user reportee users with invalid user ID
#    And I send the GET request to "get_user_reportee_users" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|99999|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|No data found|
#      |$.Data|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Data|array|

#  @Negative @ErrorHandling
#  Scenario: Get user reportee users with blank user ID
#    And I send the GET request to "get_user_reportee_users" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|""|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|Invalid User|
#      |$.Data|array|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Data|array|

#  @Negative @ErrorHandling
#  Scenario: Get user reportee users with non-numeric user ID
#    And I send the GET request to "get_user_reportee_users" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|invalid_user_id|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|Invalid User|
#      |$.Data|array|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Data|array|

  @Negative @ErrorHandling
  Scenario: Get user reportee users with invalid endpoint
    And I send the GET request to "get_user_reportee_users_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "404"
    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance test for user reportee users endpoint
    And I send the GET request to "get_user_reportee_users" endpoint with dynamic access token, path and query parameters
    
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

#  @Positive @DataValidation
#  Scenario: Verify user reportee users data integrity for user ID 1
#    And I send the GET request to "get_user_reportee_users" endpoint with dynamic access token, path and query parameters
#
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.Data|{"8":"SLV Traders","13":"testuser_tourplan"}|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Data|object|
#      |$.Data.8|string|
#      |$.Data.13|string|


#  @Positive @DataValidation
#  Scenario: Verify user reportee users data integrity for user ID 3
#    And I send the GET request to "get_user_reportee_users" endpoint with dynamic access token, path and query parameters
#
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|3|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.Data|{"2":"SLV Traders"}|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Data|object|
#      |$.Data.2|string|


#  @Positive @Smoke
#  Scenario: Get user reportee users with comprehensive validation for user ID 1
#    And I send the GET request to "get_user_reportee_users" endpoint with dynamic access token, path and query parameters
#
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.Data|{"8":"SLV Traders","13":"testuser_tourplan"}|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Data|object|
#      |$.Data.8|string|
#      |$.Data.13|string|
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Content-Type|application/json; charset=UTF-8|
#      |Server|Bizom|
#      |Connection|keep-alive|
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.Result|true|

#  @Positive @BusinessLogic
#  Scenario: Verify user reportee users business logic for user ID 1
#    And I send the GET request to "get_user_reportee_users" endpoint with dynamic access token, path and query parameters
#
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.Data|{"8":"SLV Traders","13":"testuser_tourplan"}|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Data|object|
#      |$.Data.8|string|
#      |$.Data.13|string|


#  @Positive @BusinessLogic
#  Scenario: Verify user reportee users business logic for user ID 3
#    And I send the GET request to "get_user_reportee_users" endpoint with dynamic access token, path and query parameters
#
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|3|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.Data|{"2":"SLV Traders"}|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Data|object|
#      |$.Data.2|string|

#  @Positive @Regression
#  Scenario: Verify user reportee users regression testing for user ID 1
#    And I send the GET request to "get_user_reportee_users" endpoint with dynamic access token, path and query parameters
#
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.Data|{"8":"SLV Traders","13":"testuser_tourplan"}|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Data|object|
#      |$.Data.8|string|
#      |$.Data.13|string|

#
#  @Positive @Regression
#  Scenario: Verify user reportee users regression testing for user ID 3
#    And I send the GET request to "get_user_reportee_users" endpoint with dynamic access token, path and query parameters
#
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|3|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.Data|{"2":"SLV Traders"}|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Data|object|
#      |$.Data.2|string|

