@BizomWebAPI @OS @LoadoutsManagement @IsLoadoutSettled @UserAccessManagement
Feature: Is Loadout Settled API Testing
  As a system user
  I want to test the is loadout settled endpoint
  So that I can ensure proper functionality and data retrieval for loadout settlement status management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Is loadout settled without access token
    When I send the GET request to "loadouts_isloadoutsettled" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_02 Is loadout settled with invalid access token
#    And I send the GET request to "loadouts_isloadoutsettled" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|invalid_token_12345|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds
#
#  @Negative @Security
#  Scenario: TC_03 Is loadout settled with expired access token
#    And I send the GET request to "loadouts_isloadoutsettled" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|expired_token_12345|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds
#
#  @Negative @Security
#  Scenario: TC_04 Is loadout settled with malformed access token
#    And I send the GET request to "loadouts_isloadoutsettled" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|malformed.token.here|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Is loadout settled with valid access token
    And I send the GET request to "loadouts_isloadoutsettled" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And I store the response as "is_loadout_settled_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate is loadout settled response structure
    And I send the GET request to "loadouts_isloadoutsettled" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|object|
#
#  @Positive @DataValidation
#  Scenario: TC_07 Validate is loadout settled data object structure
#    And I send the GET request to "loadouts_isloadoutsettled" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.data|object|
#      |$.data.notSettleLoadout|string|

#  @Positive @DataValidation
#  Scenario: TC_08 Validate is loadout settled notSettleLoadout field
#    And I send the GET request to "loadouts_isloadoutsettled" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.data.notSettleLoadout|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.data.notSettleLoadout|"1"|

#  @Positive @DataValidation
#  Scenario: TC_09 Validate is loadout settled complete structure
#    And I send the GET request to "loadouts_isloadoutsettled" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data.notSettleLoadout|"1"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.data|object|
#      |$.data.notSettleLoadout|string|

  @Positive @Performance
  Scenario: TC_10 Performance test for is loadout settled endpoint
    And I send the GET request to "loadouts_isloadoutsettled" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|object|

  @Positive @Concurrency
  Scenario: TC_11 Concurrent access test for is loadout settled endpoint
    And I send the GET request to "loadouts_isloadoutsettled" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|object|

  @Negative @Validation
  Scenario: TC_12 Is loadout settled with invalid query parameters
    And I send the GET request to "loadouts_isloadoutsettled" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|object|

  @Negative @Validation
  Scenario: TC_13 Is loadout settled with special characters in query parameters
    And I send the GET request to "loadouts_isloadoutsettled" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|object|

  @Negative @Security
  Scenario: TC_14 Is loadout settled with SQL injection attempt
    And I send the GET request to "loadouts_isloadoutsettled" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE loadouts; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|object|

#  @Negative @ErrorHandling
#  Scenario: TC_15 Is loadout settled with invalid endpoint
#    And I send the GET request to "loadouts_isloadoutsettled_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds
#
#  @Positive @BusinessLogic
#  Scenario: TC_16 Validate is loadout settled business logic
#    And I send the GET request to "loadouts_isloadoutsettled" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data.notSettleLoadout|"1"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.data|object|
#      |$.data.notSettleLoadout|string|
#
#  @Positive @DataIntegrity
#  Scenario: TC_17 Validate is loadout settled data integrity
#    And I send the GET request to "loadouts_isloadoutsettled" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.data|object|
#      |$.data.notSettleLoadout|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data.notSettleLoadout|"1"|
#
#  @Positive @Regression
#  Scenario: TC_18 Regression test for is loadout settled endpoint
#    And I send the GET request to "loadouts_isloadoutsettled" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.data|object|
#      |$.data.notSettleLoadout|string|
#
#  @Positive @Functional
#  Scenario: TC_19 Validate is loadout settled response completeness
#    And I send the GET request to "loadouts_isloadoutsettled" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data.notSettleLoadout|"1"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.data|object|
#      |$.data.notSettleLoadout|string|
#    And I store the response as "is_loadout_settled_response" name using full path
#    And validating the response contains the following values
#      |Value|
#      |Result|
#      |Reason|
#      |data|
#
#  @Positive @NestedObjectValidation
#  Scenario: TC_20 Validate is loadout settled nested data object
#    And I send the GET request to "loadouts_isloadoutsettled" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.data|object|
#      |$.data.notSettleLoadout|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.data.notSettleLoadout|"1"|
#
#  @Positive @EndToEnd
#  Scenario: TC_21 End-to-end is loadout settled data retrieval workflow
#    And I send the GET request to "loadouts_isloadoutsettled" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data.notSettleLoadout|"1"|
#    And I store the response as "is_loadout_settled_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.data|object|
#      |$.data.notSettleLoadout|string|

