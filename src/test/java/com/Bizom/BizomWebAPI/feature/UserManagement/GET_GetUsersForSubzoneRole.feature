@BizomWebAPI @CE @UsersForSubzoneRole @ReportingOperations
Feature: Users for Subzone Role API Testing
  As a system user
  I want to test the getUsersForSubzoneRole endpoint
  So that I can ensure proper functionality and data retrieval for users with specific subzone roles

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get users for subzone role without access token
    When I send the GET request to "get_users_for_subzone_role" endpoint with path parameters
      |Path|Value|
      |subzoneId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get users for subzone role with invalid access token
    And I send the GET request to "get_users_for_subzone_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|subzoneId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get users for subzone role with expired access token
    And I send the GET request to "get_users_for_subzone_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|subzoneId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get users for subzone role with malformed access token
    And I send the GET request to "get_users_for_subzone_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|subzoneId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

#  @Positive @Smoke
#  Scenario: Get users for subzone role ID 1 with valid access token
#    And I send the GET request to "get_users_for_subzone_role" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|subzoneId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
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
#      |$.data."2"|string|
#      |$.data."8"|string|
#      |$.data."9"|string|
#      |$.data."10"|string|

#  @Positive @Functional
#  Scenario: Get users for subzone role ID 1 with valid access token - detailed validation
#    And I send the GET request to "get_users_for_subzone_role" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|subzoneId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data."2"|"SLV Traders-1211"|
#      |$.data."8"|"SLV Traders"|
#      |$.data."9"|"test1"|
#      |$.data."10"|"sadha"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.data|object|
#      |$.data."2"|string|
#      |$.data."8"|string|
#      |$.data."9"|string|
#      |$.data."10"|string|

#  @Positive @Functional
#  Scenario: Get users for subzone role ID 2 with valid access token - empty data
#    And I send the GET request to "get_users_for_subzone_role" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|subzoneId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.data|array|

#  @Positive @Functional
#  Scenario: Get users for subzone role ID 999 with valid access token - empty data
#    And I send the GET request to "get_users_for_subzone_role" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|subzoneId|999|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.data|array|

#  @Negative @Validation
#  Scenario: Get users for subzone role with invalid subzone ID
#    And I send the GET request to "get_users_for_subzone_role" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|subzoneId|abc|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|"Invalid Data."|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|

#  @Negative @Validation
#  Scenario: Get users for subzone role with empty subzone ID
#    And I send the GET request to "get_users_for_subzone_role" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|subzoneId||
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|"Invalid Data."|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|

#  @Negative @Validation
#  Scenario: Get users for subzone role with special characters in subzone ID
#    And I send the GET request to "get_users_for_subzone_role" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|subzoneId|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|"Invalid Data."|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|

#  @Negative @Security
#  Scenario: Get users for subzone role with SQL injection attempt
#    And I send the GET request to "get_users_for_subzone_role" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|subzoneId|'; DROP TABLE users; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|"Invalid Data."|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|

#  @Negative @ErrorHandling
#  Scenario: Get users for subzone role with invalid endpoint
#    And I send the GET request to "get_users_for_subzone_role_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|subzoneId|1|
#    Then I should see the response code as "404"
#    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance test for users for subzone role endpoint
    And I send the GET request to "get_users_for_subzone_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|subzoneId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Regression
  Scenario: Regression test for users for subzone role endpoint
    And I send the GET request to "get_users_for_subzone_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|subzoneId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

#  @Positive @Smoke
#  Scenario: Get users for subzone role ID 1 with valid access token - DB validation
#    And I send the GET request to "get_users_for_subzone_role" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|subzoneId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data."2"|DB:users:name: subzone_id=1 AND user_id=2|
#      |$.data."8"|DB:users:name: subzone_id=1 AND user_id=8|
#      |$.data."9"|DB:users:name: subzone_id=1 AND user_id=9|
#      |$.data."10"|DB:users:name: subzone_id=1 AND user_id=10|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.data|object|
#      |$.data."2"|string|
#      |$.data."8"|string|
#      |$.data."9"|string|
#      |$.data."10"|string|

  @Positive @Functional
  Scenario: Get users for subzone role ID 3 with valid access token - DB validation
    And I send the GET request to "get_users_for_subzone_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|subzoneId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|

  @Positive @DataValidation
  Scenario: Validate users for subzone role response structure
    And I send the GET request to "get_users_for_subzone_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|subzoneId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|object|
      |$.data."2"|string|
      |$.data."8"|string|
      |$.data."9"|string|
      |$.data."10"|string|

#  @Positive @ContentValidation
#  Scenario: Validate users for subzone role content structure
#    And I send the GET request to "get_users_for_subzone_role" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|subzoneId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
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
#      |test1|
#      |sadha|
#      |2|
#      |8|
#      |9|
#      |10|

#  @Positive @LoadTesting
#  Scenario: Load testing for users for subzone role endpoint
#    And I send the GET request to "get_users_for_subzone_role" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|subzoneId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "3000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.data|object|

#  @Negative @Timeout
#  Scenario: Test users for subzone role endpoint timeout handling
#    And I send the GET request to "get_users_for_subzone_role" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|subzoneId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "5000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.data|object|

#  @Positive @EndToEnd
#  Scenario: End-to-end users for subzone role data retrieval workflow
#    And I send the GET request to "get_users_for_subzone_role" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|subzoneId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data|object|
#    And I store the response as "users_for_subzone_role_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.data|object|
#      |$.data."2"|string|
#      |$.data."8"|string|
#      |$.data."9"|string|
#      |$.data."10"|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data."2"|"SLV Traders-1211"|
#      |$.data."8"|"SLV Traders"|
#      |$.data."9"|"test1"|
#      |$.data."10"|"sadha"|

#  @Positive @HeaderValidation
#  Scenario: Validate users for subzone role response headers
#    And I send the GET request to "get_users_for_subzone_role" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|subzoneId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
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
#  Scenario: Validate users for subzone role with session handling
#    And I send the GET request to "get_users_for_subzone_role" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|subzoneId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
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
#      |$.data."2"|string|

#  @Positive @SubzoneRoleSpecificValidation
#  Scenario: Validate users for subzone role subzone-specific data
#    And I send the GET request to "get_users_for_subzone_role" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|subzoneId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data|object|
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.data."2"|DB:users:name: subzone_id=1 AND user_id=2 AND active=1|
#      |$.data."8"|DB:users:name: subzone_id=1 AND user_id=8 AND active=1|
#      |$.data."9"|DB:users:name: subzone_id=1 AND user_id=9 AND active=1|
#      |$.data."10"|DB:users:name: subzone_id=1 AND user_id=10 AND active=1|

#  @Positive @ObjectValidation
#  Scenario: Validate users for subzone role object structure and content
#    And I send the GET request to "get_users_for_subzone_role" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|subzoneId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.data|object|
#      |$.data."2"|string|
#      |$.data."8"|string|
#      |$.data."9"|string|
#      |$.data."10"|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data."2"|"SLV Traders-1211"|
#      |$.data."8"|"SLV Traders"|
#      |$.data."9"|"test1"|
#      |$.data."10"|"sadha"|
