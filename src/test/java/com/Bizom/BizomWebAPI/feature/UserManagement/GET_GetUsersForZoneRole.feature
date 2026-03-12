@BizomWebAPI @CE @UsersForZoneRole @ReportingOperations
Feature: Get Users for Zone Role API Testing
  As a system user
  I want to test the getUsersforzonerole endpoint
  So that I can ensure proper functionality and data retrieval for users associated with specific zone roles

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get users for zone role without access token
    When I send the GET request to "get_users_for_zone_role" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get users for zone role with invalid access token
    And I send the GET request to "get_users_for_zone_role" endpoint with dynamic access token and query parameters
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
  Scenario: Get users for zone role with expired access token
    And I send the GET request to "get_users_for_zone_role" endpoint with dynamic access token and query parameters
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
  Scenario: Get users for zone role with malformed access token
    And I send the GET request to "get_users_for_zone_role" endpoint with dynamic access token and query parameters
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
#  Scenario: Get users for zone role with valid access token
#    And I send the GET request to "get_users_for_zone_role" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data|object|
#    And I store the response as "users_for_zone_role_response" name using full path

  @Positive @DataValidation
  Scenario: Validate users for zone role response structure
    And I send the GET request to "get_users_for_zone_role" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|object|

  @Positive @DataValidation
  Scenario: Validate users for zone role data object structure
    And I send the GET request to "get_users_for_zone_role" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|object|
      |$.data."1"|string|
      |$.data."2"|string|
      |$.data."3"|string|

#  @Positive @DataValidation
#  Scenario: Validate users for zone role with static values
#    And I send the GET request to "get_users_for_zone_role" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data."1"|"SLV Traders-1"|
#      |$.data."2"|"SLV Traders-1211"|
#      |$.data."3"|"Covid MGR-1212"|
#      |$.data."4"|"SLV Traders"|
#      |$.data."5"|"Sadha"|
#      |$.data."6"|"Mobisy"|

#  @Positive @Performance
#  Scenario: Performance test for users for zone role endpoint
#    And I send the GET request to "get_users_for_zone_role" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data|object|

#  @Positive @Concurrency
#  Scenario: Concurrent access test for users for zone role endpoint
#    And I send the GET request to "get_users_for_zone_role" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data|object|

#  @Negative @Validation
#  Scenario: Get users for zone role with invalid query parameters
#    And I send the GET request to "get_users_for_zone_role" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |invalid_param|invalid_value|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data|object|

#  @Negative @Validation
#  Scenario: Get users for zone role with special characters in query parameters
#    And I send the GET request to "get_users_for_zone_role" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data|object|

#  @Negative @Security
#  Scenario: Get users for zone role with SQL injection attempt
#    And I send the GET request to "get_users_for_zone_role" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|'; DROP TABLE users; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data|object|

#  @Negative @Boundary
#  Scenario: Get users for zone role with maximum query parameters
#    And I send the GET request to "get_users_for_zone_role" endpoint with dynamic access token and query parameters
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
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data|object|

#  @Negative @ErrorHandling
#  Scenario: Get users for zone role with invalid endpoint
#    And I send the GET request to "get_users_for_zone_role_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

#  @Positive @BusinessLogic
#  Scenario: Validate users for zone role business logic
#    And I send the GET request to "get_users_for_zone_role" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data|object|
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.data."1"|DB:users:name: id=1 AND zone_id IN (SELECT zone_id FROM user_zones WHERE user_id=CURRENT_USER)|
#      |$.data."2"|DB:users:name: id=2 AND zone_id IN (SELECT zone_id FROM user_zones WHERE user_id=CURRENT_USER)|
#      |$.data."3"|DB:users:name: id=3 AND zone_id IN (SELECT zone_id FROM user_zones WHERE user_id=CURRENT_USER)|

#  @Positive @DataIntegrity
#  Scenario: Validate users for zone role data integrity
#    And I send the GET request to "get_users_for_zone_role" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.data|object|
#      |$.data."1"|string|
#      |$.data."2"|string|
#      |$.data."3"|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data."1"|"SLV Traders-1"|
#      |$.data."2"|"SLV Traders-1211"|
#      |$.data."3"|"Covid MGR-1212"|

#  @Positive @Regression
#  Scenario: Regression test for users for zone role endpoint
#    And I send the GET request to "get_users_for_zone_role" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data|object|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.data|object|

#  @Positive @Functional
#  Scenario: Validate users for zone role response completeness
#    And I send the GET request to "get_users_for_zone_role" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.data|object|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data."1"|"SLV Traders-1"|
#      |$.data."2"|"SLV Traders-1211"|
#      |$.data."3"|"Covid MGR-1212"|
#      |$.data."4"|"SLV Traders"|
#      |$.data."5"|"Sadha"|
#      |$.data."6"|"Mobisy"|

#  @Positive @ObjectValidation
#  Scenario: Validate users for zone role object structure and content
#    And I send the GET request to "get_users_for_zone_role" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.data|object|
#      |$.data."1"|string|
#      |$.data."2"|string|
#      |$.data."3"|string|
#      |$.data."4"|string|
#      |$.data."5"|string|
#      |$.data."6"|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data."1"|"SLV Traders-1"|
#      |$.data."2"|"SLV Traders-1211"|
#      |$.data."3"|"Covid MGR-1212"|

#  @Positive @ContentValidation
#  Scenario: Validate users for zone role content structure
#    And I send the GET request to "get_users_for_zone_role" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data|object|
#    And validating the response contains the following values
#      |Value|
#      |Result|
#      |Reason|
#      |data|
#      |SLV Traders|
#      |Covid MGR|
#      |Sadha|
#      |Mobisy|
#      |test1|
#      |sadha|

#  @Positive @LoadTesting
#  Scenario: Load testing for users for zone role endpoint
#    And I send the GET request to "get_users_for_zone_role" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "3000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data|object|

#  @Negative @Timeout
#  Scenario: Test users for zone role endpoint timeout handling
#    And I send the GET request to "get_users_for_zone_role" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "5000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data|object|

#  @Positive @EndToEnd
#  Scenario: End-to-end users for zone role data retrieval workflow
#    And I send the GET request to "get_users_for_zone_role" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data|object|
#    And I store the response as "users_for_zone_role_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.data|object|
#      |$.data."1"|string|
#      |$.data."2"|string|
#      |$.data."3"|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data."1"|"SLV Traders-1"|
#      |$.data."2"|"SLV Traders-1211"|
#      |$.data."3"|"Covid MGR-1212"|
#      |$.data."4"|"SLV Traders"|
#      |$.data."5"|"Sadha"|
#      |$.data."6"|"Mobisy"|

#  @Positive @HeaderValidation
#  Scenario: Validate users for zone role response headers
#    And I send the GET request to "get_users_for_zone_role" endpoint with dynamic access token and query parameters
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
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data|object|

#  @Positive @SessionValidation
#  Scenario: Validate users for zone role with session handling
#    And I send the GET request to "get_users_for_zone_role" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data|object|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.data|object|

#  @Positive @UserDataValidation
#  Scenario: Validate users for zone role user data mapping
#    And I send the GET request to "get_users_for_zone_role" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data."1"|"SLV Traders-1"|
#      |$.data."2"|"SLV Traders-1211"|
#      |$.data."3"|"Covid MGR-1212"|
#      |$.data."4"|"SLV Traders"|
#      |$.data."5"|"Sadha"|
#      |$.data."6"|"Mobisy"|
#      |$.data."7"|"Sadha Nanda"|
#      |$.data."8"|"SLV Traders"|
#      |$.data."9"|"test1"|
#      |$.data."10"|"sadha"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.data."1"|string|
#      |$.data."2"|string|
#      |$.data."3"|string|
#      |$.data."4"|string|
#      |$.data."5"|string|
#      |$.data."6"|string|

#  @Positive @ZoneRoleSpecificValidation
#  Scenario: Validate users for zone role zone-specific data
#    And I send the GET request to "get_users_for_zone_role" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data|object|
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.data."1"|DB:users:name: id=1 AND zone_id IN (SELECT zone_id FROM user_zones WHERE user_id=CURRENT_USER) AND role_id IN (SELECT role_id FROM user_roles WHERE user_id=CURRENT_USER)|
#      |$.data."2"|DB:users:name: id=2 AND zone_id IN (SELECT zone_id FROM user_zones WHERE user_id=CURRENT_USER) AND role_id IN (SELECT role_id FROM user_roles WHERE user_id=CURRENT_USER)|

#  @Positive @EmployeeIdValidation
#  Scenario: Validate users for zone role employee ID format
#    And I send the GET request to "get_users_for_zone_role" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data."1"|"SLV Traders-1"|
#      |$.data."2"|"SLV Traders-1211"|
#      |$.data."3"|"Covid MGR-1212"|
#      |$.data."16"|"lion12-lion1"|
#      |$.data."17"|"SymponiZM245_00127-098756"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.data."1"|string|
#      |$.data."2"|string|
#      |$.data."3"|string|
#      |$.data."16"|string|
#      |$.data."17"|string|
#    And validating the response contains the following values
#      |Value|
#      |Result|
#      |Reason|
#      |data|
#      |SLV Traders|
#      |Covid MGR|
#      |Sadha|
#      |Mobisy|
#      |test1|
#      |sadha|
#      |lion12|
#      |SymponiZM245_00127|
#      |1|
#      |2|
#      |3|
