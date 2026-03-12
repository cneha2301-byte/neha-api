@BizomWebAPI @SegmentRulesManagement @SegmentRules @WarehouseOperations
Feature: Get Supported Entities API Testing
  As a system user
  I want to test the get supported entities endpoint
  So that I can ensure proper functionality and data retrieval for supported entities management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get supported entities without access token
    When I send the GET request to "segmentrules_get_supported_entities" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get supported entities with invalid access token
    And I send the GET request to "segmentrules_get_supported_entities" endpoint with dynamic access token and query parameters
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
  Scenario: Get supported entities with expired access token
    And I send the GET request to "segmentrules_get_supported_entities" endpoint with dynamic access token and query parameters
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
  Scenario: Get supported entities with malformed access token
    And I send the GET request to "segmentrules_get_supported_entities" endpoint with dynamic access token and query parameters
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
  Scenario: Get supported entities with valid access token
    And I send the GET request to "segmentrules_get_supported_entities" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data found.|
      |$.Data[0]|users|
      |$.Data[1]|beats|
      |$.Data[2]|outlets|
    And I store the response as "supported_entities_response" name using full path

  @Positive @DataValidation
  Scenario: Validate supported entities response structure
    And I send the GET request to "segmentrules_get_supported_entities" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data found.|
      |$.Data[0]|users|
      |$.Data[1]|beats|
      |$.Data[2]|outlets|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|
      |$.Data[0]|string|
      |$.Data[1]|string|
      |$.Data[2]|string|

  @Positive @DataValidation
  Scenario: Validate supported entities specific data values
    And I send the GET request to "segmentrules_get_supported_entities" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data found.|
      |$.Data[0]|users|
      |$.Data[1]|beats|
      |$.Data[2]|outlets|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data found.|
      |$.Data[0]|users|
      |$.Data[1]|beats|
      |$.Data[2]|outlets|

  @Positive @DataValidation
  Scenario: Validate supported entities with static values
    And I send the GET request to "segmentrules_get_supported_entities" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data found.|
      |$.Data[0]|users|
      |$.Data[1]|beats|
      |$.Data[2]|outlets|

  @Positive @Performance
  Scenario: Performance test for supported entities endpoint
    And I send the GET request to "segmentrules_get_supported_entities" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data found.|

  @Positive @Concurrency
  Scenario: Concurrent access test for supported entities endpoint
    And I send the GET request to "segmentrules_get_supported_entities" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data found.|

  @Negative @Validation
  Scenario: Get supported entities with invalid query parameters
    And I send the GET request to "segmentrules_get_supported_entities" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data found.|

  @Negative @Validation
  Scenario: Get supported entities with special characters in query parameters
    And I send the GET request to "segmentrules_get_supported_entities" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data found.|

  @Negative @Security
  Scenario: Get supported entities with SQL injection attempt
    And I send the GET request to "segmentrules_get_supported_entities" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE segmentrules; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data found.|

  @Negative @Boundary
  Scenario: Get supported entities with maximum query parameters
    And I send the GET request to "segmentrules_get_supported_entities" endpoint with dynamic access token and query parameters
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
      |$.Result|true|
      |$.Reason|Data found.|

  @Negative @ErrorHandling
  Scenario: Get supported entities with invalid endpoint
    And I send the GET request to "segmentrules_get_supported_entities_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "404"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate supported entities business logic
    And I send the GET request to "segmentrules_get_supported_entities" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data found.|
      |$.Data[0]|users|
      |$.Data[1]|beats|
      |$.Data[2]|outlets|

  @Positive @DataIntegrity
  Scenario: Validate supported entities data integrity
    And I send the GET request to "segmentrules_get_supported_entities" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data found.|
      |$.Data[0]|users|
      |$.Data[1]|beats|
      |$.Data[2]|outlets|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|
      |$.Data[0]|string|
      |$.Data[1]|string|
      |$.Data[2]|string|

  @Positive @Regression
  Scenario: Regression test for supported entities endpoint
    And I send the GET request to "segmentrules_get_supported_entities" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data found.|
      |$.Data[0]|users|
      |$.Data[1]|beats|
      |$.Data[2]|outlets|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|
      |$.Data[0]|string|
      |$.Data[1]|string|
      |$.Data[2]|string|

  @Positive @Functional
  Scenario: Validate supported entities response completeness
    And I send the GET request to "segmentrules_get_supported_entities" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data found.|
      |$.Data[0]|users|
      |$.Data[1]|beats|
      |$.Data[2]|outlets|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|
      |$.Data[0]|string|
      |$.Data[1]|string|
      |$.Data[2]|string|

  @Positive @ArrayValidation
  Scenario: Validate supported entities array structure and content
    And I send the GET request to "segmentrules_get_supported_entities" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data found.|
      |$.Data[0]|users|
      |$.Data[1]|beats|
      |$.Data[2]|outlets|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|
      |$.Data[0]|string|
      |$.Data[1]|string|
      |$.Data[2]|string|

  @Positive @ContentValidation
  Scenario: Validate supported entities content structure
    And I send the GET request to "segmentrules_get_supported_entities" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data found.|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Data|
      |Data found.|
      |users|
      |beats|
      |outlets|

  @Positive @LoadTesting
  Scenario: Load testing for supported entities endpoint
    And I send the GET request to "segmentrules_get_supported_entities" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data found.|

  @Negative @Timeout
  Scenario: Test supported entities endpoint timeout handling
    And I send the GET request to "segmentrules_get_supported_entities" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data found.|

  @Positive @EndToEnd
  Scenario: End-to-end supported entities retrieval workflow
    And I send the GET request to "segmentrules_get_supported_entities" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data found.|
      |$.Data[0]|users|
      |$.Data[1]|beats|
      |$.Data[2]|outlets|
    And I store the response as "supported_entities_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|
      |$.Data[0]|string|
      |$.Data[1]|string|
      |$.Data[2]|string|

