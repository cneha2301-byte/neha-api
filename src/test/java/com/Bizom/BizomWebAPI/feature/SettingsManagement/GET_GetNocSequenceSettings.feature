@BizomWebAPI @SettingsManagement @Settings @WarehouseOperations
Feature: Get NOC Sequence Settings API Testing
  As a system user
  I want to test the get NOC sequence settings endpoint
  So that I can ensure proper functionality and data retrieval for NOC sequence settings management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get NOC sequence settings without access token
    When I send the GET request to "settings_get_noc_sequence_settings" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get NOC sequence settings with invalid access token
    And I send the GET request to "settings_get_noc_sequence_settings" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get NOC sequence settings with expired access token
    And I send the GET request to "settings_get_noc_sequence_settings" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get NOC sequence settings with malformed access token
    And I send the GET request to "settings_get_noc_sequence_settings" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

#  @Positive @Smoke
#  Scenario: Get NOC sequence settings with valid access token
#    And I send the GET request to "settings_get_noc_sequence_settings" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.value|0|
#    And I store the response as "noc_sequence_settings_response" name using full path

#  @Positive @DataValidation
#  Scenario: Validate NOC sequence settings response structure
#    And I send the GET request to "settings_get_noc_sequence_settings" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.value|0|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.value|string|

#  @Positive @DataValidation
#  Scenario: Validate NOC sequence settings specific data values
#    And I send the GET request to "settings_get_noc_sequence_settings" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.value|0|
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.value|0|

#  @Positive @DataValidation
#  Scenario: Validate NOC sequence settings with static values
#    And I send the GET request to "settings_get_noc_sequence_settings" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.value|0|

#  @Positive @Performance
#  Scenario: Performance test for NOC sequence settings endpoint
#    And I send the GET request to "settings_get_noc_sequence_settings" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.value|0|

#  @Positive @Concurrency
#  Scenario: Concurrent access test for NOC sequence settings endpoint
#    And I send the GET request to "settings_get_noc_sequence_settings" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.value|0|

#  @Negative @Validation
#  Scenario: Get NOC sequence settings with invalid query parameters
#    And I send the GET request to "settings_get_noc_sequence_settings" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |invalid_param|invalid_value|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.value|0|

#  @Negative @Validation
#  Scenario: Get NOC sequence settings with special characters in query parameters
#    And I send the GET request to "settings_get_noc_sequence_settings" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.value|0|

#  @Negative @Security
#  Scenario: Get NOC sequence settings with SQL injection attempt
#    And I send the GET request to "settings_get_noc_sequence_settings" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|'; DROP TABLE settings; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.value|0|

#  @Negative @Boundary
#  Scenario: Get NOC sequence settings with maximum query parameters
#    And I send the GET request to "settings_get_noc_sequence_settings" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |param1|value1|
#      |param2|value2|
#      |param3|value3|
#      |param4|value4|
#      |param5|value5|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.value|0|

  @Negative @ErrorHandling
  Scenario: Get NOC sequence settings with invalid endpoint
    And I send the GET request to "settings_get_noc_sequence_settings_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "404"
    And verify response time is less than "2500" milliseconds

#  @Positive @BusinessLogic
#  Scenario: Validate NOC sequence settings business logic
#    And I send the GET request to "settings_get_noc_sequence_settings" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.value|0|

#  @Positive @DataIntegrity
#  Scenario: Validate NOC sequence settings data integrity
#    And I send the GET request to "settings_get_noc_sequence_settings" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.value|0|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.value|string|

#  @Positive @Regression
#  Scenario: Regression test for NOC sequence settings endpoint
#    And I send the GET request to "settings_get_noc_sequence_settings" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.value|0|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.value|string|

#  @Positive @Functional
#  Scenario: Validate NOC sequence settings response completeness
#    And I send the GET request to "settings_get_noc_sequence_settings" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.value|0|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.value|string|

#  @Positive @ContentValidation
#  Scenario: Validate NOC sequence settings content structure
#    And I send the GET request to "settings_get_noc_sequence_settings" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.value|0|
#    And validating the response contains the following values
#      |Value|
#      |value|
#      |0|

#  @Positive @LoadTesting
#  Scenario: Load testing for NOC sequence settings endpoint
#    And I send the GET request to "settings_get_noc_sequence_settings" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "3000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.value|0|

#  @Negative @Timeout
#  Scenario: Test NOC sequence settings endpoint timeout handling
#    And I send the GET request to "settings_get_noc_sequence_settings" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "5000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.value|0|

#  @Positive @EndToEnd
#  Scenario: End-to-end NOC sequence settings retrieval workflow
#    And I send the GET request to "settings_get_noc_sequence_settings" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.value|0|
#    And I store the response as "noc_sequence_settings_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.value|string|

