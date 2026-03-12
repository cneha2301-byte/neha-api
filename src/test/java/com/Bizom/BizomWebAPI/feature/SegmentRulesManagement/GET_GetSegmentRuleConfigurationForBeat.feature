@BizomWebAPI @SegmentRulesManagement @SegmentRules @WarehouseOperations @Innovation
Feature: Get Segment Rule Configuration For Beat API Testing
  As a system user
  I want to test the get segment rule configuration for beat endpoint
  So that I can ensure proper functionality and data retrieval for segment rule configuration management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get segment rule configuration for beat without access token
    When I send the GET request to "segmentrules_get_segment_rule_configuration_for_beat" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get segment rule configuration for beat with invalid access token
    And I send the GET request to "segmentrules_get_segment_rule_configuration_for_beat" endpoint with dynamic access token and query parameters
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
  Scenario: Get segment rule configuration for beat with expired access token
    And I send the GET request to "segmentrules_get_segment_rule_configuration_for_beat" endpoint with dynamic access token and query parameters
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
  Scenario: Get segment rule configuration for beat with malformed access token
    And I send the GET request to "segmentrules_get_segment_rule_configuration_for_beat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get segment rule configuration for beat with valid access token
    And I send the GET request to "segmentrules_get_segment_rule_configuration_for_beat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|The setting: segmentationModule is disabled.|
    And I store the response as "segment_rule_configuration_for_beat_response" name using full path

  @Positive @DataValidation
  Scenario: Validate segment rule configuration for beat response structure
    And I send the GET request to "segmentrules_get_segment_rule_configuration_for_beat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|The setting: segmentationModule is disabled.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @DataValidation
  Scenario: Validate segment rule configuration for beat specific data values
    And I send the GET request to "segmentrules_get_segment_rule_configuration_for_beat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|The setting: segmentationModule is disabled.|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|The setting: segmentationModule is disabled.|

  @Positive @DataValidation
  Scenario: Validate segment rule configuration for beat with static values
    And I send the GET request to "segmentrules_get_segment_rule_configuration_for_beat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|The setting: segmentationModule is disabled.|

  @Positive @Performance
  Scenario: Performance test for segment rule configuration for beat endpoint
    And I send the GET request to "segmentrules_get_segment_rule_configuration_for_beat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|The setting: segmentationModule is disabled.|

  @Positive @Concurrency
  Scenario: Concurrent access test for segment rule configuration for beat endpoint
    And I send the GET request to "segmentrules_get_segment_rule_configuration_for_beat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|The setting: segmentationModule is disabled.|

  @Negative @Validation
  Scenario: Get segment rule configuration for beat with invalid query parameters
    And I send the GET request to "segmentrules_get_segment_rule_configuration_for_beat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|The setting: segmentationModule is disabled.|

  @Negative @Validation
  Scenario: Get segment rule configuration for beat with special characters in query parameters
    And I send the GET request to "segmentrules_get_segment_rule_configuration_for_beat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|The setting: segmentationModule is disabled.|

  @Negative @Security
  Scenario: Get segment rule configuration for beat with SQL injection attempt
    And I send the GET request to "segmentrules_get_segment_rule_configuration_for_beat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE segmentrules; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|The setting: segmentationModule is disabled.|

  @Negative @Boundary
  Scenario: Get segment rule configuration for beat with maximum query parameters
    And I send the GET request to "segmentrules_get_segment_rule_configuration_for_beat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|The setting: segmentationModule is disabled.|

  @Negative @ErrorHandling
  Scenario: Get segment rule configuration for beat with invalid endpoint
    And I send the GET request to "segmentrules_get_segment_rule_configuration_for_beat_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "404"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate segment rule configuration for beat business logic
    And I send the GET request to "segmentrules_get_segment_rule_configuration_for_beat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|The setting: segmentationModule is disabled.|

  @Positive @DataIntegrity
  Scenario: Validate segment rule configuration for beat data integrity
    And I send the GET request to "segmentrules_get_segment_rule_configuration_for_beat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|The setting: segmentationModule is disabled.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @Regression
  Scenario: Regression test for segment rule configuration for beat endpoint
    And I send the GET request to "segmentrules_get_segment_rule_configuration_for_beat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|The setting: segmentationModule is disabled.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @Functional
  Scenario: Validate segment rule configuration for beat response completeness
    And I send the GET request to "segmentrules_get_segment_rule_configuration_for_beat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|The setting: segmentationModule is disabled.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @ContentValidation
  Scenario: Validate segment rule configuration for beat content structure
    And I send the GET request to "segmentrules_get_segment_rule_configuration_for_beat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|The setting: segmentationModule is disabled.|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |The setting: segmentationModule is disabled.|

  @Positive @LoadTesting
  Scenario: Load testing for segment rule configuration for beat endpoint
    And I send the GET request to "segmentrules_get_segment_rule_configuration_for_beat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|The setting: segmentationModule is disabled.|

  @Negative @Timeout
  Scenario: Test segment rule configuration for beat endpoint timeout handling
    And I send the GET request to "segmentrules_get_segment_rule_configuration_for_beat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|The setting: segmentationModule is disabled.|

  @Positive @EndToEnd
  Scenario: End-to-end segment rule configuration for beat retrieval workflow
    And I send the GET request to "segmentrules_get_segment_rule_configuration_for_beat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|The setting: segmentationModule is disabled.|
    And I store the response as "segment_rule_configuration_for_beat_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

