@BizomWebAPI @CE @OutletsManagement @GetOutletsForState @InventoryOperations
Feature: Get Outlets For State API Testing
  As a system user
  I want to test the get outlets for state endpoint
  So that I can ensure state-level outlet lookups return accurate data

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get outlets for state without access token
    When I send the GET request to "outlets_get_outlets_for_state" endpoint with path parameters
      |Path|Value|
      |stateId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_02 Get outlets for state with invalid access token
#    And I send the GET request to "outlets_get_outlets_for_state" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|invalid_token_12345|stateId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_03 Get outlets for state with expired access token
#    And I send the GET request to "outlets_get_outlets_for_state" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|expired_token_12345|stateId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_04 Get outlets for state with malformed access token
#    And I send the GET request to "outlets_get_outlets_for_state" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|malformed.token.here|stateId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#    And verify response time is less than "2500" milliseconds

#  @Positive @Smoke
#  Scenario: TC_05 Get outlets for state with valid access token
#    And I send the GET request to "outlets_get_outlets_for_state" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|stateId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|"Data Found"|
#      |$.Data['18']|"sass"|
#      |$.Data['37']|"MDM"|
#    And I store the response as "outlets_state_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate outlets for state response structure
    And I send the GET request to "outlets_get_outlets_for_state" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|stateId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|
      |$.Data['18']|string|
      |$.Data['37']|string|

#  @Positive @DataValidation
#  Scenario: TC_07 Validate outlets for state specific data values
#    And I send the GET request to "outlets_get_outlets_for_state" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|stateId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Data['54']|"test2"|
#      |$.Data['55']|"test3"|
#      |$.Data['71']|"test19"|
#      |$.Data['170']|"test4"|

#  @Positive @ContentValidation
#  Scenario: TC_08 Validate outlets for state content structure
#    And I send the GET request to "outlets_get_outlets_for_state" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|stateId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response contains the following values
#      |Value|
#      |Result|
#      |Reason|
#      |Data|
#      |sass|
#      |test2|

#  @Positive @Performance
#  Scenario: TC_09 Performance test for outlets for state endpoint
#    And I send the GET request to "outlets_get_outlets_for_state" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|stateId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|

#  @Positive @Concurrency
#  Scenario: TC_10 Concurrent access test for outlets for state endpoint
#    And I send the GET request to "outlets_get_outlets_for_state" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|stateId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|

#  @Positive @LoadTesting
#  Scenario: TC_11 Load testing for outlets for state endpoint
#    And I send the GET request to "outlets_get_outlets_for_state" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|stateId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "3000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|

#  @Positive @Regression
#  Scenario: TC_12 Regression test for outlets for state endpoint
#    And I send the GET request to "outlets_get_outlets_for_state" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|stateId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|"Data Found"|

#  @Positive @EndToEnd
#  Scenario: TC_13 End-to-end outlets for state data retrieval workflow
#    And I send the GET request to "outlets_get_outlets_for_state" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|stateId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|"Data Found"|
#    And I store the response as "outlets_state_response" name using full path

#  @Negative @Validation
#  Scenario: TC_14 Get outlets for state with invalid query parameters
#    And I send the GET request to "outlets_get_outlets_for_state" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|stateId|1|
#      |invalid_param|invalid_value| | |
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|

#  @Negative @Validation
#  Scenario: TC_15 Get outlets for state using special characters in query parameters
#    And I send the GET request to "outlets_get_outlets_for_state" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|stateId|1|
#      |test_param|<script>alert('XSS')</script>| | |
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

#  @Negative @Security
#  Scenario: TC_16 Get outlets for state with SQL injection attempt
#    And I send the GET request to "outlets_get_outlets_for_state" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|stateId|1|
#      |test_param|'; DROP TABLE outlets; --| | |
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|

  @Negative @Boundary
  Scenario: TC_17 Get outlets for state using large state identifier
    And I send the GET request to "outlets_get_outlets_for_state" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|stateId|9999999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_18 Get outlets for state using invalid endpoint
    And I send the GET request to "outlets_get_outlets_for_state_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|stateId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

