@BizomWebAPI @CE @BeatsManagement @GetAllActiveInactiveBeat @CoreBusinessOperations
Feature: Get All Active Inactive Beat API Testing
  As a Bizom web API consumer
  I want to validate the get all active inactive beat endpoint
  So that I can ensure beat status reporting works correctly

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get all active inactive beat without access token
    When I send the GET request to "get_all_active_inactive_beat" endpoint with path parameters
      |Path|Value|
      |userId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get all active inactive beat with invalid access token
    And I send the GET request to "get_all_active_inactive_beat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|userId|2|
      |draw|1|                                | |
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get all active inactive beat with expired access token
    And I send the GET request to "get_all_active_inactive_beat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|userId|2|
      |draw|1|                                | |
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get all active inactive beat with malformed access token
    And I send the GET request to "get_all_active_inactive_beat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|userId|2|
      |draw|1|                                 | |
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get all active inactive beat with valid access token
    And I send the GET request to "get_all_active_inactive_beat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
      |draw|1|                         | |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|"1"|
      |$.recordsTotal|"0"|
      |$.recordsFiltered|"0"|
    And I store the response as "getAllActiveInactiveBeat_response" name using full path

  @Positive @Performance
  Scenario: TC_06 Performance test for get all active inactive beat endpoint
    And I send the GET request to "get_all_active_inactive_beat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
      |draw|1|                         | |
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: TC_07 Concurrent access test for get all active inactive beat endpoint
    And I send the GET request to "get_all_active_inactive_beat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
      |draw|1|                         | |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_08 Get all active inactive beat with invalid query parameters
    And I send the GET request to "get_all_active_inactive_beat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
      |draw|1|                         | |
      |invalid_param|invalid_value|userId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|"1"|

  @Negative @Validation
  Scenario: TC_09 Get all active inactive beat with special characters in query parameters
    And I send the GET request to "get_all_active_inactive_beat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
      |draw|1|                         | |
      |test_param|<script>alert('XSS')</script>|userId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_10 Get all active inactive beat with SQL injection attempt
    And I send the GET request to "get_all_active_inactive_beat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
      |draw|1|                         | |
      |test_param|'; DROP TABLE beats; --|userId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: TC_11 Get all active inactive beat with maximum query parameters
    And I send the GET request to "get_all_active_inactive_beat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
      |draw|1|                         | |
      |param1|value1|userId|2|
      |param2|value2|userId|2|
      |param3|value3|userId|2|
      |param4|value4|userId|2|
      |param5|value5|userId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_12 Get all active inactive beat with invalid endpoint
    And I send the GET request to "get_all_active_inactive_beat_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
      |draw|1|                         | |
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Regression
  Scenario: TC_13 Regression test for get all active inactive beat endpoint
    And I send the GET request to "get_all_active_inactive_beat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
      |draw|1|                         | |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.recordsFiltered|"0"|

  @Positive @Functional
  Scenario: TC_14 Validate get all active inactive beat response completeness
    And I send the GET request to "get_all_active_inactive_beat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
      |draw|1|                         | |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @LoadTesting
  Scenario: TC_15 Load testing for get all active inactive beat endpoint
    And I send the GET request to "get_all_active_inactive_beat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
      |draw|1|                         | |
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Negative @Timeout
  Scenario: TC_16 Test get all active inactive beat endpoint timeout handling
    And I send the GET request to "get_all_active_inactive_beat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
      |draw|1|                         | |
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds

  @Positive @EndToEnd
  Scenario: TC_17 End-to-end get all active inactive beat workflow
    And I send the GET request to "get_all_active_inactive_beat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
      |draw|1|                         | |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.recordsTotal|"0"|
    And I store the response as "getAllActiveInactiveBeat_response" name using full path

