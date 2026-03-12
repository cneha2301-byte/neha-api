@BizomWebAPI @CE @EnrolledOutletsManagement @EnrolledOutlets @GetEnrolledOutletsForUser @DataProcessing
Feature: Get Enrolled Outlets For User API Testing
  As a Bizom web API consumer
  I want to validate the get enrolled outlets for user endpoint
  So that I can ensure enrolled outlet listings are retrieved correctly

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get enrolled outlets without access token
    When I send the GET request to "enrolledoutlets_get_enrolled_outlets_for_user" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get enrolled outlets with invalid access token
    And I send the GET request to "enrolledoutlets_get_enrolled_outlets_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
      |userId|1|
      |fromDate|2025-11-14|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get enrolled outlets with expired access token
    And I send the GET request to "enrolledoutlets_get_enrolled_outlets_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
      |userId|1|
      |fromDate|2025-11-14|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get enrolled outlets with malformed access token
    And I send the GET request to "enrolledoutlets_get_enrolled_outlets_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
      |userId|1|
      |fromDate|2025-11-14|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get enrolled outlets with valid access token
    And I send the GET request to "enrolledoutlets_get_enrolled_outlets_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |userId|1|
      |fromDate|2025-11-14|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Outlets|[]|
    And I store the response as "getEnrolledOutlets_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate get enrolled outlets response structure
    And I send the GET request to "enrolledoutlets_get_enrolled_outlets_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |userId|1|
      |fromDate|2025-11-14|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|String|
      |$.Reason|string|
      |$.Outlets|array|

  @Positive @Performance
  Scenario: TC_07 Performance test for get enrolled outlets endpoint
    And I send the GET request to "enrolledoutlets_get_enrolled_outlets_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |userId|1|
      |fromDate|2025-11-14|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: TC_08 Concurrent access test for get enrolled outlets endpoint
    And I send the GET request to "enrolledoutlets_get_enrolled_outlets_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |userId|1|
      |fromDate|2025-11-14|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_09 Get enrolled outlets with special characters in user id
    And I send the GET request to "enrolledoutlets_get_enrolled_outlets_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |userId|<script>alert('XSS')</script>|
      |fromDate|2025-11-14|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_10 Get enrolled outlets with SQL injection attempt
    And I send the GET request to "enrolledoutlets_get_enrolled_outlets_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |userId|'; DROP TABLE enrolledoutlets; --|
      |fromDate|2025-11-14|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: TC_11 Get enrolled outlets with maximum query parameters
    And I send the GET request to "enrolledoutlets_get_enrolled_outlets_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |userId|1|
      |fromDate|2025-11-14|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Negative @ErrorHandling
#  Scenario: TC_12 Get enrolled outlets with invalid endpoint
#    And I send the GET request to "enrolledoutlets_get_enrolled_outlets_for_user_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |userId|1|
#      |fromDate|2025-11-14|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @Regression
  Scenario: TC_13 Regression test for get enrolled outlets endpoint
    And I send the GET request to "enrolledoutlets_get_enrolled_outlets_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |userId|1|
      |fromDate|2025-11-14|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Outlets|array|

  @Positive @LoadTesting
  Scenario: TC_14 Load testing for get enrolled outlets endpoint
    And I send the GET request to "enrolledoutlets_get_enrolled_outlets_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |userId|1|
      |fromDate|2025-11-14|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Negative @Timeout
  Scenario: TC_15 Timeout handling for get enrolled outlets endpoint
    And I send the GET request to "enrolledoutlets_get_enrolled_outlets_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |userId|1|
      |fromDate|2025-11-14|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds

  @Positive @EndToEnd
  Scenario: TC_16 End-to-end get enrolled outlets workflow
    And I send the GET request to "enrolledoutlets_get_enrolled_outlets_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |userId|1|
      |fromDate|2025-11-14|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Outlets|[]|
    And I store the response as "getEnrolledOutlets_response" name using full path

