@BizomWebAPI @CE @OutletsManagement @CategorizedOutletForUser @SystemOperations
Feature: Get Categorized Outlet For User API Testing
  As a system user
  I want to test the get categorized outlet for user endpoint
  So that I can ensure proper functionality and data retrieval for user-specific outlet targets and counts

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get categorized outlet without access token
    When I send the GET request to "outlets_get_categorized_outlet_for_user" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get categorized outlet with invalid access token
    And I send the GET request to "outlets_get_categorized_outlet_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get categorized outlet with expired access token
    And I send the GET request to "outlets_get_categorized_outlet_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get categorized outlet with malformed access token
    And I send the GET request to "outlets_get_categorized_outlet_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get categorized outlet with valid access token
    And I send the GET request to "outlets_get_categorized_outlet_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.data.count|0|
      |$.data.outletsTarget|0|
      |$.data.ordersTarget|0|
      |$.data.visitsTarget|0|
    And I store the response as "categorized_outlet_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate categorized outlet response structure
    And I send the GET request to "outlets_get_categorized_outlet_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.data|object|
      |$.data.count|number|
      |$.data.outletsTarget|number|
      |$.data.ordersTarget|number|
      |$.data.visitsTarget|number|

  @Positive @DataValidation
  Scenario: TC_07 Validate categorized outlet data object structure
    And I send the GET request to "outlets_get_categorized_outlet_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data.count|number|
      |$.data.outletsTarget|number|
      |$.data.ordersTarget|number|
      |$.data.visitsTarget|number|

  @Positive @DataValidation
  Scenario: TC_08 Validate categorized outlet with user ID filter
    And I send the GET request to "outlets_get_categorized_outlet_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |user_id|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.data|object|

  @Positive @Performance
  Scenario: TC_09 Performance test for categorized outlet endpoint
    And I send the GET request to "outlets_get_categorized_outlet_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for categorized outlet endpoint
    And I send the GET request to "outlets_get_categorized_outlet_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.data|object|

  @Negative @Validation
  Scenario: TC_11 Get categorized outlet with invalid query parameters
    And I send the GET request to "outlets_get_categorized_outlet_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.data|object|

  @Negative @Validation
  Scenario: TC_12 Get categorized outlet with special characters in query parameters
    And I send the GET request to "outlets_get_categorized_outlet_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.data|object|

  @Negative @Security
  Scenario: TC_13 Get categorized outlet with SQL injection attempt
    And I send the GET request to "outlets_get_categorized_outlet_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE outlets; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.data|object|

  @Negative @Boundary
  Scenario: TC_14 Get categorized outlet with maximum query parameters
    And I send the GET request to "outlets_get_categorized_outlet_for_user" endpoint with dynamic access token and query parameters
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
      |$.result|true|

#  @Negative @ErrorHandling
#  Scenario: TC_15 Get categorized outlet with invalid endpoint
#    And I send the GET request to "outlets_get_categorized_outlet_for_user_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_16 Validate categorized outlet business logic - zero targets
    And I send the GET request to "outlets_get_categorized_outlet_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.data.count|0|
      |$.data.outletsTarget|0|
      |$.data.ordersTarget|0|
      |$.data.visitsTarget|0|

  @Positive @BusinessLogic
  Scenario: TC_17 Validate categorized outlet with targets data
    And I send the GET request to "outlets_get_categorized_outlet_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.data.count|number|
      |$.data.outletsTarget|number|
      |$.data.ordersTarget|number|
      |$.data.visitsTarget|number|

  @Positive @DataIntegrity
  Scenario: TC_18 Validate categorized outlet data integrity
    And I send the GET request to "outlets_get_categorized_outlet_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data.count|number|
      |$.data.outletsTarget|number|
      |$.data.ordersTarget|number|
      |$.data.visitsTarget|number|

  @Positive @Regression
  Scenario: TC_19 Regression test for categorized outlet endpoint
    And I send the GET request to "outlets_get_categorized_outlet_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.data|object|

  @Positive @Functional
  Scenario: TC_20 Validate categorized outlet response completeness
    And I send the GET request to "outlets_get_categorized_outlet_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |result|
      |data|
      |count|
      |outletsTarget|
      |ordersTarget|
      |visitsTarget|

  @Positive @ContentValidation
  Scenario: TC_21 Validate categorized outlet content structure
    And I send the GET request to "outlets_get_categorized_outlet_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |result|
      |data|

  @Positive @LoadTesting
  Scenario: TC_22 Load testing for categorized outlet endpoint
    And I send the GET request to "outlets_get_categorized_outlet_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @Timeout
  Scenario: TC_23 Test categorized outlet endpoint timeout handling
    And I send the GET request to "outlets_get_categorized_outlet_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Positive @EndToEnd
  Scenario: TC_24 End-to-end categorized outlet retrieval workflow
    And I send the GET request to "outlets_get_categorized_outlet_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.data.count|0|
      |$.data.outletsTarget|0|
      |$.data.ordersTarget|0|
      |$.data.visitsTarget|0|
    And I store the response as "categorized_outlet_e2e_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.data|object|
      |$.data.count|number|
      |$.data.outletsTarget|number|
      |$.data.ordersTarget|number|
      |$.data.visitsTarget|number|

  @Positive @TargetValidation
  Scenario: TC_25 Validate outlet target fields
    And I send the GET request to "outlets_get_categorized_outlet_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data.outletsTarget|number|
      |$.data.ordersTarget|number|
      |$.data.visitsTarget|number|

  @Positive @CountValidation
  Scenario: TC_26 Validate count field
    And I send the GET request to "outlets_get_categorized_outlet_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data.count|number|

  @Positive @Concurrency
  Scenario: TC_27 Concurrent access test for categorized outlet endpoint
    And I send the GET request to "outlets_get_categorized_outlet_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.data|object|

  @Positive @Reliability
  Scenario: TC_28 Reliability test for categorized outlet endpoint
    And I send the GET request to "outlets_get_categorized_outlet_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.data|object|
      |$.data.count|number|
      |$.data.outletsTarget|number|
      |$.data.ordersTarget|number|
      |$.data.visitsTarget|number|

  @Positive @Idempotency
  Scenario: TC_29 Idempotency test for categorized outlet endpoint
    And I send the GET request to "outlets_get_categorized_outlet_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "categorized_outlet_first_call" name using full path
    And I send the GET request to "outlets_get_categorized_outlet_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.data|object|

  @Positive @CacheValidation
  Scenario: TC_30 Cache validation for categorized outlet endpoint
    And I send the GET request to "outlets_get_categorized_outlet_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.data|object|
      |$.data.count|number|
      |$.data.outletsTarget|number|
      |$.data.ordersTarget|number|
      |$.data.visitsTarget|number|


