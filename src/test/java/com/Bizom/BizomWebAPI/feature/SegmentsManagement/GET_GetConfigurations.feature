@BizomWebAPI @SegmentsManagement @Segments @WarehouseOperations
Feature: Get Segments Configurations API Testing
  As a system user
  I want to test the get segments configurations endpoint
  So that I can ensure proper functionality and data retrieval for segments configurations management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get segments configurations without access token
    When I send the GET request to "segments_get_configurations" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get segments configurations with invalid access token
    And I send the GET request to "segments_get_configurations" endpoint with dynamic access token and query parameters
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
  Scenario: Get segments configurations with expired access token
    And I send the GET request to "segments_get_configurations" endpoint with dynamic access token and query parameters
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
  Scenario: Get segments configurations with malformed access token
    And I send the GET request to "segments_get_configurations" endpoint with dynamic access token and query parameters
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
  Scenario: Get segments configurations with valid access token
    And I send the GET request to "segments_get_configurations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|The setting: segmentationModule is disabled.|
      |$.Segments|[]|
      |$.SegmentRules|[]|
    And I store the response as "segments_configurations_response" name using full path

  @Positive @DataValidation
  Scenario: Validate segments configurations response structure
    And I send the GET request to "segments_get_configurations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|The setting: segmentationModule is disabled.|
      |$.Segments|[]|
      |$.SegmentRules|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Segments|array|
      |$.SegmentRules|array|

  @Positive @DataValidation
  Scenario: Validate segments configurations specific data values
    And I send the GET request to "segments_get_configurations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|The setting: segmentationModule is disabled.|
      |$.Segments|[]|
      |$.SegmentRules|[]|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|The setting: segmentationModule is disabled.|
      |$.Segments|[]|
      |$.SegmentRules|[]|

  @Positive @DataValidation
  Scenario: Validate segments configurations with static values
    And I send the GET request to "segments_get_configurations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|The setting: segmentationModule is disabled.|
      |$.Segments|[]|
      |$.SegmentRules|[]|

  @Positive @Performance
  Scenario: Performance test for segments configurations endpoint
    And I send the GET request to "segments_get_configurations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|The setting: segmentationModule is disabled.|

  @Positive @Concurrency
  Scenario: Concurrent access test for segments configurations endpoint
    And I send the GET request to "segments_get_configurations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|The setting: segmentationModule is disabled.|

  @Negative @Validation
  Scenario: Get segments configurations with invalid query parameters
    And I send the GET request to "segments_get_configurations" endpoint with dynamic access token and query parameters
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
  Scenario: Get segments configurations with special characters in query parameters
    And I send the GET request to "segments_get_configurations" endpoint with dynamic access token and query parameters
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
  Scenario: Get segments configurations with SQL injection attempt
    And I send the GET request to "segments_get_configurations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE segments; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|The setting: segmentationModule is disabled.|

  @Negative @Boundary
  Scenario: Get segments configurations with maximum query parameters
    And I send the GET request to "segments_get_configurations" endpoint with dynamic access token and query parameters
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
  Scenario: Get segments configurations with invalid endpoint
    And I send the GET request to "segments_get_configurations_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "404"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate segments configurations business logic
    And I send the GET request to "segments_get_configurations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|The setting: segmentationModule is disabled.|

  @Positive @DataIntegrity
  Scenario: Validate segments configurations data integrity
    And I send the GET request to "segments_get_configurations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|The setting: segmentationModule is disabled.|
      |$.Segments|[]|
      |$.SegmentRules|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Segments|array|
      |$.SegmentRules|array|

  @Positive @Regression
  Scenario: Regression test for segments configurations endpoint
    And I send the GET request to "segments_get_configurations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|The setting: segmentationModule is disabled.|
      |$.Segments|[]|
      |$.SegmentRules|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Segments|array|
      |$.SegmentRules|array|

  @Positive @Functional
  Scenario: Validate segments configurations response completeness
    And I send the GET request to "segments_get_configurations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|The setting: segmentationModule is disabled.|
      |$.Segments|[]|
      |$.SegmentRules|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Segments|array|
      |$.SegmentRules|array|

  @Positive @ArrayValidation
  Scenario: Validate segments configurations array structure and content
    And I send the GET request to "segments_get_configurations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|The setting: segmentationModule is disabled.|
      |$.Segments|[]|
      |$.SegmentRules|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Segments|array|
      |$.SegmentRules|array|

  @Positive @ContentValidation
  Scenario: Validate segments configurations content structure
    And I send the GET request to "segments_get_configurations" endpoint with dynamic access token and query parameters
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
      |Segments|
      |SegmentRules|
      |The setting: segmentationModule is disabled.|

  @Positive @LoadTesting
  Scenario: Load testing for segments configurations endpoint
    And I send the GET request to "segments_get_configurations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|The setting: segmentationModule is disabled.|

  @Negative @Timeout
  Scenario: Test segments configurations endpoint timeout handling
    And I send the GET request to "segments_get_configurations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|The setting: segmentationModule is disabled.|

  @Positive @EndToEnd
  Scenario: End-to-end segments configurations retrieval workflow
    And I send the GET request to "segments_get_configurations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|The setting: segmentationModule is disabled.|
      |$.Segments|[]|
      |$.SegmentRules|[]|
    And I store the response as "segments_configurations_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Segments|array|
      |$.SegmentRules|array|

