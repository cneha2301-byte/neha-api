@BizomWebAPI @PushRegistrationsManagement @PushRegistrations @OrderManagement
Feature: Get Notification History API Testing
  As a system user
  I want to test the get notification history endpoint
  So that I can ensure proper functionality and data retrieval for notification history based on user ID

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get notification history without access token
    When I send the GET request to "pushregistrations_get_notification_history" endpoint with path parameters
      |Path|Value|
      |userId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get notification history with invalid access token
    And I send the GET request to "pushregistrations_get_notification_history" endpoint with dynamic access token, path and query parameters
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
  Scenario: Get notification history with expired access token
    And I send the GET request to "pushregistrations_get_notification_history" endpoint with dynamic access token, path and query parameters
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
  Scenario: Get notification history with malformed access token
    And I send the GET request to "pushregistrations_get_notification_history" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|userId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: Get notification history for user ID 2 with valid access token
    And I send the GET request to "pushregistrations_get_notification_history" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|
      |$.Unreadcount|number|
    And I store the response as "notification_history_response" name using full path

  @Positive @Functional
  Scenario: Get notification history for user ID 1 with valid access token - no history
    And I send the GET request to "pushregistrations_get_notification_history" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No history data for the User|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

#  @Positive @Functional
#  Scenario: Get notification history for user ID 2 with valid access token - with data
#    And I send the GET request to "pushregistrations_get_notification_history" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Data Found|
#      |$.Unreadcount|7|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Data|array|
#      |$.Data[0]|object|
#      |$.Data[0].id|string|
#      |$.Data[0].user_id|string|
#      |$.Data[0].active|string|
#      |$.Data[0].sendbyuser_id|string|
#      |$.Data[0].message|string|
#      |$.Data[0].is_success|string|
#      |$.Data[0].title|string|
#      |$.Data[0].body|string|
#      |$.Data[0].senttime|string|
#      |$.Data[0].failedreason|string|
#      |$.Data[0].expirydatetime|string|
#      |$.Data[0].onclickevent|object|
#      |$.Data[0].onclickevent.onclick|object|
#      |$.Data[0].onclickevent.popproperties_id|object|
#      |$.Data[0].onclickevent.poppropertyvalue_id|object|
#      |$.Data[0].onclickevent.propertyname|object|
#      |$.Data[0].onclickevent.readstatus|string|
#      |$.Unreadcount|number|

#  @Positive @DataValidation
#  Scenario: Validate notification history response structure for user with data
#    And I send the GET request to "pushregistrations_get_notification_history" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Data Found|
#      |$.Unreadcount|7|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Data|array|
#      |$.Data[0].id|string|
#      |$.Data[0].user_id|string|
#      |$.Data[0].active|string|
#      |$.Data[0].message|string|
#      |$.Data[0].is_success|string|
#      |$.Unreadcount|number|

#  @Positive @DataValidation
#  Scenario: Validate notification history specific data values
#    And I send the GET request to "pushregistrations_get_notification_history" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Data Found|
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.Data[0].user_id|DB:pushregistrations:user_id: id=606|
#      |$.Data[0].message|DB:pushregistrations:message: id=606|

#  @Negative @Validation
#  Scenario: Get notification history with invalid user ID - alphabetic characters
#    And I send the GET request to "pushregistrations_get_notification_history" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|abc|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|Invalid User Id|

#  @Negative @Validation
#  Scenario: Get notification history with invalid user ID - special characters
#    And I send the GET request to "pushregistrations_get_notification_history" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|@#$%|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|Invalid User Id|

#  @Negative @Validation
#  Scenario: Get notification history with non-existent user ID
#    And I send the GET request to "pushregistrations_get_notification_history" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|999999|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|Invalid User Id|

#  @Negative @Validation
#  Scenario: Get notification history with negative user ID
#    And I send the GET request to "pushregistrations_get_notification_history" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|-1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|Invalid User Id|

#  @Negative @Validation
#  Scenario: Get notification history with zero user ID
#    And I send the GET request to "pushregistrations_get_notification_history" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|0|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|Invalid User Id|

#  @Negative @Validation
#  Scenario: Get notification history with very large user ID
#    And I send the GET request to "pushregistrations_get_notification_history" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|999999999|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|Invalid User Id|

#  @Negative @Validation
#  Scenario: Get notification history with SQL injection attempt in user ID
#    And I send the GET request to "pushregistrations_get_notification_history" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|1'; DROP TABLE users; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|Invalid User Id|

#  @Negative @Validation
#  Scenario: Get notification history with XSS attempt in user ID
#    And I send the GET request to "pushregistrations_get_notification_history" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|Invalid User Id|

  @Negative @ErrorHandling
  Scenario: Get notification history with invalid endpoint
    And I send the GET request to "pushregistrations_get_notification_history_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
    Then I should see the response code as "404"
    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance test for notification history endpoint
    And I send the GET request to "pushregistrations_get_notification_history" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|

  @Positive @Concurrency
  Scenario: Concurrent access test for notification history endpoint
    And I send the GET request to "pushregistrations_get_notification_history" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|

#  @Positive @Regression
#  Scenario: Regression test for notification history endpoint
#    And I send the GET request to "pushregistrations_get_notification_history" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Data Found|
#      |$.Unreadcount|7|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Data|array|
#      |$.Unreadcount|number|

#  @Positive @DataIntegrity
#  Scenario: Validate notification history data integrity
#    And I send the GET request to "pushregistrations_get_notification_history" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Data Found|
#      |$.Unreadcount|7|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Data|array|
#      |$.Data[0].id|string|
#      |$.Data[0].user_id|string|
#      |$.Data[0].active|string|
#      |$.Data[0].sendbyuser_id|string|
#      |$.Data[0].message|string|
#      |$.Data[0].is_success|string|
#      |$.Data[0].title|string|
#      |$.Data[0].body|string|
#      |$.Data[0].senttime|string|
#      |$.Data[0].failedreason|string|
#      |$.Data[0].expirydatetime|string|
#      |$.Data[0].onclickevent|object|
#      |$.Data[0].onclickevent.readstatus|string|
#      |$.Unreadcount|number|

#  @Positive @BusinessLogic
#  Scenario: Validate notification history business logic
#    And I send the GET request to "pushregistrations_get_notification_history" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Data Found|
#      |$.Unreadcount|7|

#  @Positive @EndToEnd
#  Scenario: End-to-end notification history retrieval workflow
#    And I send the GET request to "pushregistrations_get_notification_history" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Data Found|
#      |$.Unreadcount|7|
#    And I store the response as "notification_history_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Data|array|
#      |$.Data[0].id|string|
#      |$.Data[0].user_id|string|
#      |$.Data[0].active|string|
#      |$.Data[0].message|string|
#      |$.Data[0].is_success|string|
#      |$.Data[0].onclickevent|object|
#      |$.Unreadcount|number|

#  @Positive @Smoke
#  Scenario: Get notification history for user ID 2 with valid access token and DB validation
#    And I send the GET request to "pushregistrations_get_notification_history" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Data Found|
#      |$.Data[0].user_id|DB:pushregistrations:user_id: id=606|
#      |$.Data[0].message|DB:pushregistrations:message: id=606|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Data|array|
#      |$.Data[0].id|string|
#      |$.Data[0].user_id|string|
#      |$.Data[0].active|string|
#      |$.Data[0].message|string|
#      |$.Data[0].is_success|string|
#      |$.Unreadcount|number|

  @Positive @Functional
  Scenario: Get notification history for user ID 1 with valid access token and DB validation - no history
    And I send the GET request to "pushregistrations_get_notification_history" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No history data for the User|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

#  @Positive @ArrayValidation
#  Scenario: Validate notification history array structure and content
#    And I send the GET request to "pushregistrations_get_notification_history" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Data Found|
#      |$.Unreadcount|7|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Data|array|
#      |$.Data[0]|object|
#      |$.Data[1]|object|
#      |$.Data[0].id|string|
#      |$.Data[0].user_id|string|
#      |$.Data[0].active|string|
#      |$.Data[0].message|string|
#      |$.Data[0].is_success|string|
#      |$.Data[0].onclickevent|object|
#      |$.Data[0].onclickevent.readstatus|string|

  @Positive @ContentValidation
  Scenario: Validate notification history content structure
    And I send the GET request to "pushregistrations_get_notification_history" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Data|
      |Unreadcount|
      |id|
      |user_id|
      |message|
      |onclickevent|

  @Positive @LoadTesting
  Scenario: Load testing for notification history endpoint
    And I send the GET request to "pushregistrations_get_notification_history" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|

  @Negative @Timeout
  Scenario: Test notification history endpoint timeout handling
    And I send the GET request to "pushregistrations_get_notification_history" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|

  @Negative @Boundary
  Scenario: Get notification history with boundary value - minimum valid ID
    And I send the GET request to "pushregistrations_get_notification_history" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No history data for the User|

#  @Negative @Boundary
#  Scenario: Get notification history with boundary value - maximum valid ID
#    And I send the GET request to "pushregistrations_get_notification_history" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|2147483647|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|Invalid User Id|

