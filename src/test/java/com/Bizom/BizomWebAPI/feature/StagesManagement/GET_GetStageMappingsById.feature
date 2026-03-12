@BizomWebAPI @StagesManagement @StagesGetStageMappingsById @ProductManagement
Feature: Stages GetStageMappingsById API Testing
  As a system user
  I want to test the stages getstagemappingsbyid endpoint
  So that I can ensure proper functionality and data retrieval for stage mappings management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get stage mappings by id without access token
    When I send the GET request to "stages_get_stage_mappings_by_id" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get stage mappings by id with invalid access token
    And I send the GET request to "stages_get_stage_mappings_by_id" endpoint with dynamic access token and query parameters
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
  Scenario: Get stage mappings by id with expired access token
    And I send the GET request to "stages_get_stage_mappings_by_id" endpoint with dynamic access token and query parameters
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
  Scenario: Get stage mappings by id with malformed access token
    And I send the GET request to "stages_get_stage_mappings_by_id" endpoint with dynamic access token and query parameters
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
  Scenario: Get stage mappings by id with valid access token
    And I send the GET request to "stages_get_stage_mappings_by_id" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.response|No stages mapping found found|
    And I store the response as "stages_getstagemappingsbyid_response" name using full path

  @Positive @DataValidation
  Scenario: Validate stage mappings by id response structure
    And I send the GET request to "stages_get_stage_mappings_by_id" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.response|No stages mapping found found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.response|string|
      |$.stagemappings|array|

  @Positive @DataValidation
  Scenario: Validate stage mappings by id empty array and static values
    And I send the GET request to "stages_get_stage_mappings_by_id" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.response|No stages mapping found found|
      |$.stagemappings|[]|

  @Positive @Performance
  Scenario: Performance test for stage mappings by id endpoint
    And I send the GET request to "stages_get_stage_mappings_by_id" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.response|No stages mapping found found|

  @Positive @Concurrency
  Scenario: Concurrent access test for stage mappings by id endpoint
    And I send the GET request to "stages_get_stage_mappings_by_id" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.response|No stages mapping found found|

  @Negative @Validation
  Scenario: Get stage mappings by id with invalid query parameters
    And I send the GET request to "stages_get_stage_mappings_by_id" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.response|No stages mapping found found|

  @Negative @Validation
  Scenario: Get stage mappings by id with special characters in query parameters
    And I send the GET request to "stages_get_stage_mappings_by_id" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.response|No stages mapping found found|

  @Negative @Security
  Scenario: Get stage mappings by id with SQL injection attempt
    And I send the GET request to "stages_get_stage_mappings_by_id" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE stagemappings; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.response|No stages mapping found found|

  @Negative @Boundary
  Scenario: Get stage mappings by id with maximum query parameters
    And I send the GET request to "stages_get_stage_mappings_by_id" endpoint with dynamic access token and query parameters
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
      |$.result|false|
      |$.response|No stages mapping found found|

#  @Negative @ErrorHandling
#  Scenario: Get stage mappings by id with invalid endpoint
#    And I send the GET request to "stages_get_stage_mappings_by_id_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

  @Positive @BusinessLogic
  Scenario: Validate stage mappings by id business logic
    And I send the GET request to "stages_get_stage_mappings_by_id" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.response|No stages mapping found found|

  @Positive @DataIntegrity
  Scenario: Validate stage mappings by id data integrity
    And I send the GET request to "stages_get_stage_mappings_by_id" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.response|No stages mapping found found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.response|string|
      |$.stagemappings|array|

  @Positive @Regression
  Scenario: Regression test for stage mappings by id endpoint
    And I send the GET request to "stages_get_stage_mappings_by_id" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.response|No stages mapping found found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.response|string|
      |$.stagemappings|array|

  @Positive @Functional
  Scenario: Validate stage mappings by id response completeness
    And I send the GET request to "stages_get_stage_mappings_by_id" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.response|No stages mapping found found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.stagemappings|array|

  @Positive @ArrayValidation
  Scenario: Validate stage mappings by id array structure and content
    And I send the GET request to "stages_get_stage_mappings_by_id" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.response|No stages mapping found found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.stagemappings|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.stagemappings|[]|

  @Positive @ContentValidation
  Scenario: Validate stage mappings by id content structure
    And I send the GET request to "stages_get_stage_mappings_by_id" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.response|No stages mapping found found|
    And validating the response contains the following values
      |Value|
      |result|
      |response|
      |stagemappings|
      |No stages mapping found found|

  @Positive @LoadTesting
  Scenario: Load testing for stage mappings by id endpoint
    And I send the GET request to "stages_get_stage_mappings_by_id" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.response|No stages mapping found found|

  @Negative @Timeout
  Scenario: Test stage mappings by id endpoint timeout handling
    And I send the GET request to "stages_get_stage_mappings_by_id" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.response|No stages mapping found found|

  @Positive @EndToEnd
  Scenario: End-to-end stage mappings by id data retrieval workflow
    And I send the GET request to "stages_get_stage_mappings_by_id" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.response|No stages mapping found found|
    And I store the response as "stages_getstagemappingsbyid_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.response|string|
      |$.stagemappings|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.stagemappings|[]|
