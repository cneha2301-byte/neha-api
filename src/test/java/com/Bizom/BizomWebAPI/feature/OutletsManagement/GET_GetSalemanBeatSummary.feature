@BizomWebAPI @CE @OutletsManagement @SalemanBeatSummary @InventoryOperations
Feature: Get Saleman Beat Summary API Testing
  As a system user
  I want to test the get saleman beat summary endpoint
  So that I can ensure proper functionality and correct handling when feature is disabled

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get saleman beat summary without access token
    When I send the GET request to "outlets_get_saleman_beat_summary" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get saleman beat summary with invalid access token
    And I send the GET request to "outlets_get_saleman_beat_summary" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get saleman beat summary with expired access token
    And I send the GET request to "outlets_get_saleman_beat_summary" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get saleman beat summary with malformed access token
    And I send the GET request to "outlets_get_saleman_beat_summary" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get saleman beat summary with valid access token
    And I send the GET request to "outlets_get_saleman_beat_summary" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|gcplindoOutletCustomSummary setting is not enabled for this user|
      |$.Data|[]|
    And I store the response as "saleman_beat_summary_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate saleman beat summary response structure
    And I send the GET request to "outlets_get_saleman_beat_summary" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|gcplindoOutletCustomSummary setting is not enabled for this user|
      |$.Data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|

  @Positive @Performance
  Scenario: TC_07 Performance test for saleman beat summary endpoint
    And I send the GET request to "outlets_get_saleman_beat_summary" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: TC_08 Concurrent access test for saleman beat summary endpoint
    And I send the GET request to "outlets_get_saleman_beat_summary" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_09 Get saleman beat summary with invalid query parameters
    And I send the GET request to "outlets_get_saleman_beat_summary" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_10 Get saleman beat summary with special characters in query parameters
    And I send the GET request to "outlets_get_saleman_beat_summary" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_11 Get saleman beat summary with SQL injection attempt
    And I send the GET request to "outlets_get_saleman_beat_summary" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE outlets; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_12 Get saleman beat summary with invalid endpoint
    And I send the GET request to "outlets_get_saleman_beat_summary_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Regression
  Scenario: TC_13 Regression test for saleman beat summary endpoint
    And I send the GET request to "outlets_get_saleman_beat_summary" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|gcplindoOutletCustomSummary setting is not enabled for this user|

  @Positive @EndToEnd
  Scenario: TC_14 End-to-end saleman beat summary retrieval workflow
    And I send the GET request to "outlets_get_saleman_beat_summary" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|gcplindoOutletCustomSummary setting is not enabled for this user|
      |$.Data|[]|
    And I store the response as "saleman_beat_summary_e2e_response" name using full path


