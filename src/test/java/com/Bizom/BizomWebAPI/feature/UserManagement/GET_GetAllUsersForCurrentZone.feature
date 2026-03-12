@BizomWebAPI @CE @AllUsersForCurrentZone @UserManagement
Feature: Get All Users for Current Zone API Testing
  As a system user
  I want to test the getallusersforcurrentzone endpoint
  So that I can ensure proper functionality and data retrieval for all users in the current zone

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get all users for current zone without access token
    When I send the GET request to "get_all_users_for_current_zone" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get all users for current zone with invalid access token
    And I send the GET request to "get_all_users_for_current_zone" endpoint with dynamic access token and query parameters
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
  Scenario: Get all users for current zone with expired access token
    And I send the GET request to "get_all_users_for_current_zone" endpoint with dynamic access token and query parameters
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
  Scenario: Get all users for current zone with malformed access token
    And I send the GET request to "get_all_users_for_current_zone" endpoint with dynamic access token and query parameters
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
#  Scenario: Get all users for current zone with valid access token
#    And I send the GET request to "get_all_users_for_current_zone" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.users|object|
#    And I store the response as "all_users_current_zone_response" name using full path

  @Positive @DataValidation
  Scenario: Validate all users for current zone response structure
    And I send the GET request to "get_all_users_for_current_zone" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.users|object|

  @Positive @DataValidation
  Scenario: Validate all users for current zone users object structure
    And I send the GET request to "get_all_users_for_current_zone" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.users|object|
      |$.users."2"|string|
      |$.users."3"|string|
      |$.users."6"|string|

#  @Positive @DataValidation
#  Scenario: Validate all users for current zone with static values
#    And I send the GET request to "get_all_users_for_current_zone" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.users."2"|"SLV Traders"|
#      |$.users."3"|"Covid MGR"|
#      |$.users."6"|"Mobisy"|
#      |$.users."13"|"testuser_tourplan"|
#      |$.users."16"|"lion12"|

  @Positive @Performance
  Scenario: Performance test for all users for current zone endpoint
    And I send the GET request to "get_all_users_for_current_zone" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Positive @Concurrency
  Scenario: Concurrent access test for all users for current zone endpoint
    And I send the GET request to "get_all_users_for_current_zone" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Negative @Validation
  Scenario: Get all users for current zone with invalid query parameters
    And I send the GET request to "get_all_users_for_current_zone" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Negative @Validation
  Scenario: Get all users for current zone with special characters in query parameters
    And I send the GET request to "get_all_users_for_current_zone" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Negative @Security
  Scenario: Get all users for current zone with SQL injection attempt
    And I send the GET request to "get_all_users_for_current_zone" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE users; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Negative @Boundary
  Scenario: Get all users for current zone with maximum query parameters
    And I send the GET request to "get_all_users_for_current_zone" endpoint with dynamic access token and query parameters
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
      |$.Reason|""|

#  @Negative @ErrorHandling
#  Scenario: Get all users for current zone with invalid endpoint
#    And I send the GET request to "get_all_users_for_current_zone_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

#  @Positive @BusinessLogic
#  Scenario: Validate all users for current zone business logic
#    And I send the GET request to "get_all_users_for_current_zone" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.users."2"|DB:users:name: id=2|
#      |$.users."3"|DB:users:name: id=3|
#      |$.users."6"|DB:users:name: id=6|

#  @Positive @DataIntegrity
#  Scenario: Validate all users for current zone data integrity
#    And I send the GET request to "get_all_users_for_current_zone" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.users|object|
#      |$.users."2"|string|
#      |$.users."3"|string|
#      |$.users."6"|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.users."2"|"SLV Traders"|
#      |$.users."3"|"Covid MGR"|

#  @Positive @Regression
#  Scenario: Regression test for all users for current zone endpoint
#    And I send the GET request to "get_all_users_for_current_zone" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.users|object|

#  @Positive @Functional
#  Scenario: Validate all users for current zone response completeness
#    And I send the GET request to "get_all_users_for_current_zone" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.users|object|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.users."2"|"SLV Traders"|
#      |$.users."3"|"Covid MGR"|
#      |$.users."6"|"Mobisy"|
#      |$.users."13"|"testuser_tourplan"|
#      |$.users."16"|"lion12"|

#  @Positive @ObjectValidation
#  Scenario: Validate all users for current zone object structure and content
#    And I send the GET request to "get_all_users_for_current_zone" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.users|object|
#      |$.users."2"|string|
#      |$.users."3"|string|
#      |$.users."6"|string|
#      |$.users."13"|string|
#      |$.users."16"|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.users."2"|"SLV Traders"|
#      |$.users."3"|"Covid MGR"|
#      |$.users."6"|"Mobisy"|

  @Positive @ContentValidation
  Scenario: Validate all users for current zone content structure
    And I send the GET request to "get_all_users_for_current_zone" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |users|
      |SLV Traders|
      |Covid MGR|
      |Mobisy|
      |testuser_tourplan|

  @Positive @LoadTesting
  Scenario: Load testing for all users for current zone endpoint
    And I send the GET request to "get_all_users_for_current_zone" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Negative @Timeout
  Scenario: Test all users for current zone endpoint timeout handling
    And I send the GET request to "get_all_users_for_current_zone" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

#  @Positive @EndToEnd
#  Scenario: End-to-end all users for current zone data retrieval workflow
#    And I send the GET request to "get_all_users_for_current_zone" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#    And I store the response as "all_users_current_zone_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.users|object|
#      |$.users."2"|string|
#      |$.users."3"|string|
#      |$.users."6"|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.users."2"|"SLV Traders"|
#      |$.users."3"|"Covid MGR"|
#      |$.users."6"|"Mobisy"|
#      |$.users."13"|"testuser_tourplan"|
#      |$.users."16"|"lion12"|

  @Positive @HeaderValidation
  Scenario: Validate all users for current zone response headers
    And I send the GET request to "get_all_users_for_current_zone" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json; charset=UTF-8|
      |Server|Bizom|
      |Connection|keep-alive|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

#  @Positive @SessionValidation
#  Scenario: Validate all users for current zone with session handling
#    And I send the GET request to "get_all_users_for_current_zone" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.users|object|

#  @Positive @UserDataValidation
#  Scenario: Validate all users for current zone user data mapping
#    And I send the GET request to "get_all_users_for_current_zone" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.users."2"|"SLV Traders"|
#      |$.users."3"|"Covid MGR"|
#      |$.users."6"|"Mobisy"|
#      |$.users."13"|"testuser_tourplan"|
#      |$.users."16"|"lion12"|
#      |$.users."23"|"kji"|
#      |$.users."33"|"mobisy"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.users."2"|string|
#      |$.users."3"|string|
#      |$.users."6"|string|
#      |$.users."13"|string|
#      |$.users."16"|string|

#  @Positive @ZoneSpecificValidation
#  Scenario: Validate all users for current zone zone-specific data
#    And I send the GET request to "get_all_users_for_current_zone" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.users|object|
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.users."2"|DB:users:name: id=2 AND zone_id IN (SELECT zone_id FROM user_zones WHERE user_id=CURRENT_USER)|
#      |$.users."3"|DB:users:name: id=3 AND zone_id IN (SELECT zone_id FROM user_zones WHERE user_id=CURRENT_USER)|
