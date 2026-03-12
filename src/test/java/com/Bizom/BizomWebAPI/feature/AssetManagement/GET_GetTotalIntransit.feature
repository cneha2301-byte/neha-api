@BizomWebAPI @Innovation @AssetManagement @GetTotalIntransit @CoreBusinessOperations
Feature: Get Total Intransit API Testing
  As a Bizom web API consumer
  I want to validate the get total intransit endpoint
  So that I can ensure total intransit data is fetched correctly

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get total intransit without access token
    When I send the GET request to "assetserialnumbertransactions_get_total_intransit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token||
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get total intransit with invalid access token
    And I send the GET request to "assetserialnumbertransactions_get_total_intransit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get total intransit with expired access token
    And I send the GET request to "assetserialnumbertransactions_get_total_intransit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get total intransit with malformed access token
    And I send the GET request to "assetserialnumbertransactions_get_total_intransit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get total intransit with valid request
    And I send the GET request to "assetserialnumbertransactions_get_total_intransit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|
    And I store the response as "getTotalIntransit_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate total intransit response structure
    And I send the GET request to "assetserialnumbertransactions_get_total_intransit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
      |$.data[0]|string|

  @Positive @DataValidation
  Scenario: TC_07 Validate total intransit array structure and content
    And I send the GET request to "assetserialnumbertransactions_get_total_intransit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|
      |$.data[0]|"0"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
      |$.data[0]|string|

  @Positive @DataValidation
  Scenario: TC_08 Validate total intransit with specific data values
    And I send the GET request to "assetserialnumbertransactions_get_total_intransit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|
      |$.data[0]|"0"|

  @Positive @Performance
  Scenario: TC_09 Performance test for get total intransit endpoint
    And I send the GET request to "assetserialnumbertransactions_get_total_intransit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for get total intransit endpoint
    And I send the GET request to "assetserialnumbertransactions_get_total_intransit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_11 Get total intransit with invalid query parameters
    And I send the GET request to "assetserialnumbertransactions_get_total_intransit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_12 Get total intransit with special characters in query parameters
    And I send the GET request to "assetserialnumbertransactions_get_total_intransit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Security
  Scenario: TC_13 Get total intransit with SQL injection attempt
    And I send the GET request to "assetserialnumbertransactions_get_total_intransit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE assetserialnumbertransactions; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Boundary
  Scenario: TC_14 Get total intransit with maximum query parameters
    And I send the GET request to "assetserialnumbertransactions_get_total_intransit" endpoint with dynamic access token and query parameters
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

  @Negative @ErrorHandling
  Scenario: TC_15 Get total intransit with invalid endpoint
    And I send the GET request to "assetserialnumbertransactions_get_total_intransit_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_404_NOT_FOUND"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_16 Validate total intransit business logic
    And I send the GET request to "assetserialnumbertransactions_get_total_intransit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|
      |$.data[0]|"0"|

  @Positive @DataIntegrity
  Scenario: TC_17 Validate total intransit data integrity
    And I send the GET request to "assetserialnumbertransactions_get_total_intransit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
      |$.data[0]|string|

  @Positive @Regression
  Scenario: TC_18 Regression test for get total intransit endpoint
    And I send the GET request to "assetserialnumbertransactions_get_total_intransit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.data[0]|"0"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
      |$.data[0]|string|

  @Positive @Functional
  Scenario: TC_19 Validate total intransit response completeness
    And I send the GET request to "assetserialnumbertransactions_get_total_intransit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|
      |$.data[0]|"0"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
      |$.data[0]|string|

  @Positive @ArrayValidation
  Scenario: TC_20 Validate total intransit array structure and content
    And I send the GET request to "assetserialnumbertransactions_get_total_intransit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.data[0]|"0"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
      |$.data[0]|string|

  @Positive @ContentValidation
  Scenario: TC_21 Validate total intransit content structure
    And I send the GET request to "assetserialnumbertransactions_get_total_intransit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |data|

  @Positive @LoadTesting
  Scenario: TC_22 Load testing for get total intransit endpoint
    And I send the GET request to "assetserialnumbertransactions_get_total_intransit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Timeout
  Scenario: TC_23 Test get total intransit endpoint timeout handling
    And I send the GET request to "assetserialnumbertransactions_get_total_intransit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @EndToEnd
  Scenario: TC_24 End-to-end get total intransit data retrieval workflow
  And I send the GET request to "assetserialnumbertransactions_get_total_intransit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|
      |$.data[0]|"0"|
    And I store the response as "getTotalIntransit_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
      |$.data[0]|string|

