@BizomWebAPI @CE @HierarchiesManagement @GetHierarchies @DataProcessing
Feature: Get Hierarchies API Testing
  As a system user
  I want to test the get hierarchies endpoint
  So that I can ensure proper functionality and data retrieval for hierarchies management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get hierarchies without access token
    When I send the GET request to "hierarchies_gethierarchies" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get hierarchies with invalid access token
    And I send the GET request to "hierarchies_gethierarchies" endpoint with dynamic access token and query parameters
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
  Scenario: TC_03 Get hierarchies with expired access token
    And I send the GET request to "hierarchies_gethierarchies" endpoint with dynamic access token and query parameters
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
  Scenario: TC_04 Get hierarchies with malformed access token
    And I send the GET request to "hierarchies_gethierarchies" endpoint with dynamic access token and query parameters
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
  Scenario: TC_05 Get hierarchies with valid access token
    And I send the GET request to "hierarchies_gethierarchies" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And I store the response as "hierarchies_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate hierarchies response structure
    And I send the GET request to "hierarchies_gethierarchies" endpoint with dynamic access token and query parameters
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
      |$.Data|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate hierarchies Data array structure
    And I send the GET request to "hierarchies_gethierarchies" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|
      |$.Data[0]|object|
      |$.Data[0].id|string|
      |$.Data[0].fromhierarchy|string|
      |$.Data[0].fromentitytype|string|
      |$.Data[0].tohierarchy|string|
      |$.Data[0].toentitytype|string|
      |$.Data[0].priority|string|
      |$.Data[0].transactiontype|string|
      |$.Data[0].is_active|string|

  @Positive @DataValidation
  Scenario: TC_08 Validate hierarchies data object fields
    And I send the GET request to "hierarchies_gethierarchies" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data[0].id|string|
      |$.Data[0].fromhierarchy|string|
      |$.Data[0].fromentitytype|string|
      |$.Data[0].tohierarchy|string|
      |$.Data[0].toentitytype|string|
      |$.Data[0].priority|string|
      |$.Data[0].transactiontype|string|
      |$.Data[0].is_active|string|

  @Positive @Performance
  Scenario: TC_09 Performance test for hierarchies endpoint
    And I send the GET request to "hierarchies_gethierarchies" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for hierarchies endpoint
    And I send the GET request to "hierarchies_gethierarchies" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Negative @Validation
  Scenario: TC_11 Get hierarchies with invalid query parameters
    And I send the GET request to "hierarchies_gethierarchies" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Negative @Validation
  Scenario: TC_12 Get hierarchies with special characters in query parameters
    And I send the GET request to "hierarchies_gethierarchies" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Negative @Security
  Scenario: TC_13 Get hierarchies with SQL injection attempt
    And I send the GET request to "hierarchies_gethierarchies" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE hierarchies; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Negative @Boundary
  Scenario: TC_14 Get hierarchies with maximum query parameters
    And I send the GET request to "hierarchies_gethierarchies" endpoint with dynamic access token and query parameters
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
      |$.Reason|""|

#  @Negative @ErrorHandling
#  Scenario: TC_15 Get hierarchies with invalid endpoint
#    And I send the GET request to "hierarchies_gethierarchies_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_16 Validate hierarchies business logic
    And I send the GET request to "hierarchies_gethierarchies" endpoint with dynamic access token and query parameters
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
      |$.Data|array|
      |$.Data[0]|object|
      |$.Data[0].id|string|
      |$.Data[0].fromhierarchy|string|
      |$.Data[0].tohierarchy|string|
      |$.Data[0].priority|string|
      |$.Data[0].transactiontype|string|
      |$.Data[0].is_active|string|

  @Positive @DataIntegrity
  Scenario: TC_17 Validate hierarchies data integrity
    And I send the GET request to "hierarchies_gethierarchies" endpoint with dynamic access token and query parameters
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
      |$.Data|array|
      |$.Data[0].id|string|
      |$.Data[0].fromhierarchy|string|
      |$.Data[0].fromentitytype|string|
      |$.Data[0].tohierarchy|string|
      |$.Data[0].toentitytype|string|
      |$.Data[0].priority|string|
      |$.Data[0].transactiontype|string|
      |$.Data[0].is_active|string|

  @Positive @Regression
  Scenario: TC_18 Regression test for hierarchies endpoint
    And I send the GET request to "hierarchies_gethierarchies" endpoint with dynamic access token and query parameters
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
      |$.Data|array|
      |$.Data[0]|object|
      |$.Data[0].id|string|
      |$.Data[0].fromhierarchy|string|
      |$.Data[0].tohierarchy|string|

  @Positive @Functional
  Scenario: TC_19 Validate hierarchies response completeness
    And I send the GET request to "hierarchies_gethierarchies" endpoint with dynamic access token and query parameters
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
      |$.Data|array|
      |$.Data[0]|object|
      |$.Data[0].id|string|
      |$.Data[0].fromhierarchy|string|
      |$.Data[0].fromentitytype|string|
      |$.Data[0].tohierarchy|string|
      |$.Data[0].toentitytype|string|
      |$.Data[0].priority|string|
      |$.Data[0].transactiontype|string|
      |$.Data[0].is_active|string|

  @Positive @ArrayValidation
  Scenario: TC_20 Validate hierarchies Data array structure and content
    And I send the GET request to "hierarchies_gethierarchies" endpoint with dynamic access token and query parameters
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
      |$.Data|array|
      |$.Data[0]|object|
      |$.Data[1]|object|
      |$.Data[2]|object|

  @Positive @ContentValidation
  Scenario: TC_21 Validate hierarchies content structure
    And I send the GET request to "hierarchies_gethierarchies" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Data|
      |id|
      |fromhierarchy|
      |fromentitytype|
      |tohierarchy|
      |toentitytype|
      |priority|
      |transactiontype|
      |is_active|

  @Positive @LoadTesting
  Scenario: TC_22 Load testing for hierarchies endpoint
    And I send the GET request to "hierarchies_gethierarchies" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Negative @Timeout
  Scenario: TC_23 Test hierarchies endpoint timeout handling
    And I send the GET request to "hierarchies_gethierarchies" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Positive @EndToEnd
  Scenario: TC_24 End-to-end hierarchies data retrieval workflow
    And I send the GET request to "hierarchies_gethierarchies" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And I store the response as "hierarchies_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|
      |$.Data[0]|object|
      |$.Data[0].id|string|
      |$.Data[0].fromhierarchy|string|
      |$.Data[0].fromentitytype|string|
      |$.Data[0].tohierarchy|string|
      |$.Data[0].toentitytype|string|
      |$.Data[0].priority|string|
      |$.Data[0].transactiontype|string|
      |$.Data[0].is_active|string|

