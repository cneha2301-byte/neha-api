@BizomWebAPI @CE @BeatsManagement @GetAssignedBeatsForUsers @CoreBusinessOperations
Feature: Get Assigned Beats For Users API Smoke Tests
  As a Bizom web API consumer
  I want to verify the get assigned beats for users endpoint basics
  So that I can ensure the service is reachable under different access conditions

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get assigned beats for users without access token
    When I send the GET request to "get_assigned_beats_for_users" endpoint with path parameters
      |Path|Value|
      |userId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get assigned beats for users with invalid access token
    And I send the GET request to "get_assigned_beats_for_users" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|userId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get assigned beats for users with expired access token
    And I send the GET request to "get_assigned_beats_for_users" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|userId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get assigned beats for users with malformed access token
    And I send the GET request to "get_assigned_beats_for_users" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|userId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get assigned beats for users with valid access token
    And I send the GET request to "get_assigned_beats_for_users" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: TC_06 Performance test for get assigned beats for users endpoint
    And I send the GET request to "get_assigned_beats_for_users" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: TC_07 Concurrent access test for get assigned beats for users endpoint
    And I send the GET request to "get_assigned_beats_for_users" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_08 Get assigned beats for users with invalid query parameters
    And I send the GET request to "get_assigned_beats_for_users" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
      |invalid_param|invalid_value|userId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_09 Get assigned beats for users with special characters in query parameters
    And I send the GET request to "get_assigned_beats_for_users" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
      |test_param|<script>alert('XSS')</script>|userId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_10 Get assigned beats for users with SQL injection attempt
    And I send the GET request to "get_assigned_beats_for_users" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
      |test_param|'; DROP TABLE beats; --|userId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: TC_11 Get assigned beats for users with maximum query parameters
    And I send the GET request to "get_assigned_beats_for_users" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
      |param1|value1|userId|2|
      |param2|value2|userId|2|
      |param3|value3|userId|2|
      |param4|value4|userId|2|
      |param5|value5|userId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_12 Get assigned beats for users with invalid endpoint
    And I send the GET request to "get_assigned_beats_for_users_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

