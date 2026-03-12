 @BizomWebAPI @CE @UserManagement @UsersNotification @SystemIntegration
Feature: Get Notifications API Testing
  As a system user
  I want to test the get notifications endpoint
  So that I can ensure proper functionality and data retrieval for user notifications

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get notifications without access token
    When I send the GET request to "users_get_notifications" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_02 Get notifications with invalid access token
    And I send the GET request to "users_get_notifications" endpoint with dynamic access token and query parameters
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
  Scenario: TC_03 Get notifications with expired access token
    And I send the GET request to "users_get_notifications" endpoint with dynamic access token and query parameters
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
  Scenario: TC_04 Get notifications with malformed access token
    And I send the GET request to "users_get_notifications" endpoint with dynamic access token and query parameters
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
  Scenario: TC_05 Get notifications with valid access token
    And I send the GET request to "users_get_notifications" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.notification|{}|
      |$.Reason|"Setting enable_whats_new is Not enabled"|
    And I store the response as "getNotifications_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate notifications response structure
    And I send the GET request to "users_get_notifications" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And verifies the field is present in the response
      |JPath|
       |$.notification|
      |$.Reason|
    And I store the response as "getNotifications_response" name using full path

  @Positive @DataValidation
  Scenario: TC_07 Validate notifications data types
    And I send the GET request to "users_get_notifications" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.notification|object|
      |$.Reason|string|
    And I store the response as "getNotifications_response" name using full path

  @Positive @DataValidation
  Scenario: TC_08 Validate notifications response with expected values
    And I send the GET request to "users_get_notifications" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.notification|{}|
      |$.Reason|"Setting enable_whats_new is Not enabled"|
    And I store the response as "getNotifications_response" name using full path

#  @Negative @ErrorHandling
#  Scenario: TC_09 Get notifications with invalid endpoint
#    And I send the GET request to "users_get_notifications_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: TC_10 Performance test for get notifications endpoint
    And I send the GET request to "users_get_notifications" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And I store the response as "getNotifications_response" name using full path

  @DBvalidation
  Scenario: TC_11 Get notifications - verify response data with DB
    And I send the GET request to "users_get_notifications" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.notification|{}|
      |$.Reason|"Setting enable_whats_new is Not enabled"|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Reason|"Setting enable_whats_new is Not enabled"|
    And I store the response as "getNotifications_response" name using full path
