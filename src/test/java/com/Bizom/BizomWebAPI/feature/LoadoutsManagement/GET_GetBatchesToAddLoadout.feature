@BizomWebAPI @OS @LoadoutsManagement @GetBatchesToAddLoadout @UserAccessManagement
Feature: Get Batches To Add Loadout API Testing
  As a system user
  I want to test the get batches to add loadout endpoint
  So that I can ensure proper functionality and data retrieval for batches to add loadout management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get batches to add loadout without access token
    When I send the GET request to "loadouts_getbatchestoaddloadout" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_02 Get batches to add loadout with invalid access token
#    And I send the GET request to "loadouts_getbatchestoaddloadout" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|invalid_token_12345|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_03 Get batches to add loadout with expired access token
#    And I send the GET request to "loadouts_getbatchestoaddloadout" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|expired_token_12345|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds
#
#  @Negative @Security
#  Scenario: TC_04 Get batches to add loadout with malformed access token
#    And I send the GET request to "loadouts_getbatchestoaddloadout" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|malformed.token.here|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get batches to add loadout with valid access token
    And I send the GET request to "loadouts_getbatchestoaddloadout" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$|[]|
    And I store the response as "get_batches_to_add_loadout_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate get batches to add loadout response structure
    And I send the GET request to "loadouts_getbatchestoaddloadout" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate get batches to add loadout array structure
    And I send the GET request to "loadouts_getbatchestoaddloadout" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$|[]|

  @Positive @ArrayValidation
  Scenario: TC_08 Validate get batches to add loadout empty array response
    And I send the GET request to "loadouts_getbatchestoaddloadout" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$|[]|

  @Positive @Performance
  Scenario: TC_09 Performance test for get batches to add loadout endpoint
    And I send the GET request to "loadouts_getbatchestoaddloadout" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for get batches to add loadout endpoint
    And I send the GET request to "loadouts_getbatchestoaddloadout" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Negative @Validation
  Scenario: TC_11 Get batches to add loadout with invalid query parameters
    And I send the GET request to "loadouts_getbatchestoaddloadout" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Negative @Validation
  Scenario: TC_12 Get batches to add loadout with special characters in query parameters
    And I send the GET request to "loadouts_getbatchestoaddloadout" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Negative @Security
  Scenario: TC_13 Get batches to add loadout with SQL injection attempt
    And I send the GET request to "loadouts_getbatchestoaddloadout" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE batches; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

#  @Negative @ErrorHandling
#  Scenario: TC_14 Get batches to add loadout with invalid endpoint
#    And I send the GET request to "loadouts_getbatchestoaddloadout_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_15 Validate get batches to add loadout business logic
    And I send the GET request to "loadouts_getbatchestoaddloadout" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$|[]|

  @Positive @DataIntegrity
  Scenario: TC_16 Validate get batches to add loadout data integrity
    And I send the GET request to "loadouts_getbatchestoaddloadout" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$|[]|

  @Positive @Regression
  Scenario: TC_17 Regression test for get batches to add loadout endpoint
    And I send the GET request to "loadouts_getbatchestoaddloadout" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$|[]|

  @Positive @Functional
  Scenario: TC_18 Validate get batches to add loadout response completeness
    And I send the GET request to "loadouts_getbatchestoaddloadout" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$|[]|
    And I store the response as "get_batches_to_add_loadout_response" name using full path

  @Positive @ContentValidation
  Scenario: TC_19 Validate get batches to add loadout content structure
    And I send the GET request to "loadouts_getbatchestoaddloadout" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$|[]|

  @Positive @EndToEnd
  Scenario: TC_20 End-to-end get batches to add loadout data retrieval workflow
    And I send the GET request to "loadouts_getbatchestoaddloadout" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$|[]|
    And I store the response as "get_batches_to_add_loadout_response" name using full path

