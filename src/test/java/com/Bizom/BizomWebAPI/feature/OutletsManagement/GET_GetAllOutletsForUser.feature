@BizomWebAPI @CE @OutletsManagement @GetAllOutletsForUser @SystemOperations
Feature: Get All Outlets For User API Testing
  As a system user
  I want to test the get all outlets for user endpoint
  So that I can ensure proper functionality and data retrieval for user-specific outlets

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get all outlets for user without access token
    When I send the GET request to "outlets_get_all_outlets_for_user" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get all outlets for user with invalid access token
    And I send the GET request to "outlets_get_all_outlets_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get all outlets for user with expired access token
    And I send the GET request to "outlets_get_all_outlets_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get all outlets for user with malformed access token
    And I send the GET request to "outlets_get_all_outlets_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get all outlets for user with valid access token
    And I send the GET request to "outlets_get_all_outlets_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.outlets|[]|
      |$.parentOutlets|[]|
    And I store the response as "get_all_outlets_for_user_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate response structure for all outlets for user
    And I send the GET request to "outlets_get_all_outlets_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.outlets|[]|
      |$.parentOutlets|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.outlets|array|
      |$.parentOutlets|array|

  @Positive @Performance
  Scenario: TC_07 Performance test for get all outlets for user endpoint
    And I send the GET request to "outlets_get_all_outlets_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: TC_08 Concurrent access test for get all outlets for user endpoint
    And I send the GET request to "outlets_get_all_outlets_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_09 Get all outlets for user with invalid query parameters
    And I send the GET request to "outlets_get_all_outlets_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_10 Get all outlets for user with special characters in query parameters
    And I send the GET request to "outlets_get_all_outlets_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_11 Get all outlets for user with SQL injection attempt
    And I send the GET request to "outlets_get_all_outlets_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE outlets; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_12 Get all outlets for user with invalid endpoint
    And I send the GET request to "outlets_get_all_outlets_for_user_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Regression
  Scenario: TC_13 Regression test for get all outlets for user endpoint
    And I send the GET request to "outlets_get_all_outlets_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.outlets|[]|
      |$.parentOutlets|[]|

  @Positive @EndToEnd
  Scenario: TC_14 End-to-end get all outlets for user retrieval workflow
    And I send the GET request to "outlets_get_all_outlets_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.outlets|[]|
      |$.parentOutlets|[]|
    And I store the response as "get_all_outlets_for_user_e2e_response" name using full path


