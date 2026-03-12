@BizomWebAPI @CE @OutletsManagement @DistimanValidateOutlets @SystemOperations
Feature: Distiman Validate Outlet API Testing
  As a system user
  I want to test the distiman validate outlet endpoint
  So that I can ensure proper functionality and data validation for outlet management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get distiman validate outlet without access token
    When I send the GET request to "outlets_distiman_validate_outlet" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get distiman validate outlet with invalid access token
    And I send the GET request to "outlets_distiman_validate_outlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get distiman validate outlet with expired access token
    And I send the GET request to "outlets_distiman_validate_outlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get distiman validate outlet with malformed access token
    And I send the GET request to "outlets_distiman_validate_outlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get distiman validate outlet with valid access token
    And I send the GET request to "outlets_distiman_validate_outlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.status|success|
      |$.id|"0"|
    And I store the response as "validate_outlet_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate distiman validate outlet response structure
    And I send the GET request to "outlets_distiman_validate_outlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.status|success|
      |$.id|"0"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.status|string|
      |$.id|string|

  @Positive @DataValidation
  Scenario: TC_07 Validate distiman validate outlet with static values
    And I send the GET request to "outlets_distiman_validate_outlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.status|success|
      |$.id|"0"|

  @Positive @Performance
  Scenario: TC_08 Performance test for distiman validate outlet endpoint
    And I send the GET request to "outlets_distiman_validate_outlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.status|success|
      |$.id|"0"|

  @Positive @Concurrency
  Scenario: TC_09 Concurrent access test for distiman validate outlet endpoint
    And I send the GET request to "outlets_distiman_validate_outlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.status|success|
      |$.id|"0"|

  @Negative @Validation
  Scenario: TC_10 Get distiman validate outlet with invalid query parameters
    And I send the GET request to "outlets_distiman_validate_outlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.status|success|
      |$.id|"0"|

  @Negative @Validation
  Scenario: TC_11 Get distiman validate outlet with special characters in query parameters
    And I send the GET request to "outlets_distiman_validate_outlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.status|success|
      |$.id|"0"|

  @Negative @Security
  Scenario: TC_12 Get distiman validate outlet with SQL injection attempt
    And I send the GET request to "outlets_distiman_validate_outlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE outlets; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.status|success|
      |$.id|"0"|

  @Negative @Boundary
  Scenario: TC_13 Get distiman validate outlet with maximum query parameters
    And I send the GET request to "outlets_distiman_validate_outlet" endpoint with dynamic access token and query parameters
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
      |$.status|success|
      |$.id|"0"|

#  @Negative @ErrorHandling
#  Scenario: TC_14 Get distiman validate outlet with invalid endpoint
#    And I send the GET request to "outlets_distiman_validate_outlet_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_15 Validate distiman validate outlet business logic
    And I send the GET request to "outlets_distiman_validate_outlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.status|success|
      |$.id|"0"|

  @Positive @DataIntegrity
  Scenario: TC_16 Validate distiman validate outlet data integrity
    And I send the GET request to "outlets_distiman_validate_outlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.status|success|
      |$.id|"0"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.status|string|
      |$.id|string|

  @Positive @Regression
  Scenario: TC_17 Regression test for distiman validate outlet endpoint
    And I send the GET request to "outlets_distiman_validate_outlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.status|success|
      |$.id|"0"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.status|string|
      |$.id|string|

  @Positive @Functional
  Scenario: TC_18 Validate distiman validate outlet response completeness
    And I send the GET request to "outlets_distiman_validate_outlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.status|success|
      |$.id|"0"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.status|string|
      |$.id|string|

  @Positive @ContentValidation
  Scenario: TC_19 Validate distiman validate outlet content structure
    And I send the GET request to "outlets_distiman_validate_outlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.status|success|
      |$.id|"0"|
    And validating the response contains the following values
      |Value|
      |status|
      |id|
      |success|
      |0|

  @Positive @LoadTesting
  Scenario: TC_20 Load testing for distiman validate outlet endpoint
    And I send the GET request to "outlets_distiman_validate_outlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.status|success|
      |$.id|"0"|

  @Negative @Timeout
  Scenario: TC_21 Test distiman validate outlet endpoint timeout handling
    And I send the GET request to "outlets_distiman_validate_outlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.status|success|
      |$.id|"0"|

  @Positive @EndToEnd
  Scenario: TC_22 End-to-end distiman validate outlet data retrieval workflow
    And I send the GET request to "outlets_distiman_validate_outlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.status|success|
      |$.id|"0"|
    And I store the response as "validate_outlet_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.status|string|
      |$.id|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.status|success|
      |$.id|"0"|

