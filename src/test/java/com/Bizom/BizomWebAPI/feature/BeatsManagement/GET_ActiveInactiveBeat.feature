@BizomWebAPI @BeatsManagement @ActiveInactiveBeat @CoreBusinessOperations @CE
Feature: Activate or Deactivate Beat API Testing
  As a Bizom web API consumer
  I want to validate the active/inactive beat endpoint
  So that I can ensure beat state changes are handled correctly

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Deactivate beat without access token
    When I send the GET request to "active_inactive_beat" endpoint with path parameters
      |Path|Value|
      |beatId|64632|
      |status|0|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Deactivate beat with invalid access token
    And I send the GET request to "active_inactive_beat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|beatId|64632|
      |||status|0|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Deactivate beat with expired access token
    And I send the GET request to "active_inactive_beat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|beatId|64632|
      |||status|0|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Deactivate beat with malformed access token
    And I send the GET request to "active_inactive_beat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|beatId|64632|
      |||status|0|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Deactivate beat with valid access token
    And I send the GET request to "active_inactive_beat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|64632|
      |||status|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.message|Beat Successfully Deactivated|
    And I store the response as "activeInactiveBeat_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate active/inactive beat response structure
    And I send the GET request to "active_inactive_beat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|64632|
      |||status|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.message|string|

  @Positive @Performance
  Scenario: TC_07 Performance test for active/inactive beat endpoint
    And I send the GET request to "active_inactive_beat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|64632|
      |||status|0|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: TC_08 Concurrent access test for active/inactive beat endpoint
    And I send the GET request to "active_inactive_beat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|64632|
      |||status|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_09 Deactivate beat with invalid status parameter
    And I send the GET request to "active_inactive_beat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|64632|
      |||status|invalid|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_10 Deactivate beat with invalid endpoint
    And I send the GET request to "active_inactive_beat_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|64632|
      |||status|0|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Regression
  Scenario: TC_11 Regression test for active/inactive beat endpoint
    And I send the GET request to "active_inactive_beat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|64632|
      |||status|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.message|Beat Successfully Deactivated|

  @Positive @LoadTesting
  Scenario: TC_12 Load testing for active/inactive beat endpoint
    And I send the GET request to "active_inactive_beat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|64632|
      |||status|0|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Negative @Timeout
  Scenario: TC_13 Timeout handling for active/inactive beat endpoint
    And I send the GET request to "active_inactive_beat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|64632|
      |||status|0|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds

  @Negative @Boundary
  Scenario: TC_14 Deactivate beat with non-existent beat id
    And I send the GET request to "active_inactive_beat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|5638479|
      |||status|0|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      

