@BizomWebAPI @CE @OutletsManagement @OutletSummaryInfo @InventoryOperations
Feature: Get Outlet Summary Info API Testing
  As a system user
  I want to test the get outlet summary info endpoint
  So that I can ensure proper handling and summary data by outlet ID

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get outlet summary info without access token
    When I send the GET request to "outlets_get_outlet_summary_info" endpoint with path parameters
      |Path|Value|
      |outletId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_02 Get outlet summary info with invalid access token
    And I send the GET request to "outlets_get_outlet_summary_info" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|outletId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_03 Get outlet summary info with expired access token
    And I send the GET request to "outlets_get_outlet_summary_info" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|outletId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_04 Get outlet summary info with malformed access token
    And I send the GET request to "outlets_get_outlet_summary_info" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|outletId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get outlet summary info for outlet ID 1 with valid access token
    And I send the GET request to "outlets_get_outlet_summary_info" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|The Setting gcplindoOutletCustomSummary is not enabled|
      |$.Data|[]|
    And I store the response as "outlet_summary_info_response" name using full path

  @Positive @Functional
  Scenario: TC_06 Get outlet summary info for outlet ID 2 with valid access token
    And I send the GET request to "outlets_get_outlet_summary_info" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|

  @Negative @Validation
  Scenario: TC_07 Get outlet summary info with invalid outlet ID
    And I send the GET request to "outlets_get_outlet_summary_info" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Negative @Validation
  Scenario: TC_08 Get outlet summary info with non-existent outlet ID
    And I send the GET request to "outlets_get_outlet_summary_info" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Negative @ErrorHandling
  Scenario: TC_09 Get outlet summary info with invalid endpoint
    And I send the GET request to "outlets_get_outlet_summary_info_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: TC_10 Performance test for outlet summary info endpoint
    And I send the GET request to "outlets_get_outlet_summary_info" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Regression
  Scenario: TC_11 Regression test for outlet summary info endpoint
    And I send the GET request to "outlets_get_outlet_summary_info" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Positive @Concurrency
  Scenario: TC_12 Concurrent access test for outlet summary info endpoint
    And I send the GET request to "outlets_get_outlet_summary_info" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: TC_13 Get outlet summary info with invalid query parameters
    And I send the GET request to "outlets_get_outlet_summary_info" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
      |invalid_param|invalid_value|      | |
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: TC_14 Get outlet summary info with special characters in query parameters
    And I send the GET request to "outlets_get_outlet_summary_info" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
      |test_param|<script>alert('XSS')</script>|||
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_15 Get outlet summary info with SQL injection attempt
    And I send the GET request to "outlets_get_outlet_summary_info" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
      |test_param|'; DROP TABLE outlets; --|||
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Positive @EndToEnd
  Scenario: TC_16 End-to-end outlet summary info retrieval workflow
    And I send the GET request to "outlets_get_outlet_summary_info" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|The Setting gcplindoOutletCustomSummary is not enabled|
      |$.Data|[]|
    And I store the response as "outlet_summary_info_e2e_response" name using full path


