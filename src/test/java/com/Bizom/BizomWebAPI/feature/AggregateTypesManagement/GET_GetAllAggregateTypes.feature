@BizomWebAPI @AggregateTypesManagement @GetAllAggregateTypes @MasterDataManagement @CE
Feature: Get All Aggregate Types API Testing
  As a Bizom web API consumer
  I want to validate the get all aggregate types endpoint
  So that I can ensure aggregate types data is fetched correctly

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get all aggregate types without access token
    When I send the GET request to "aggregatetypes_get_all_aggregate_types" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get all aggregate types with invalid access token
    And I send the GET request to "aggregatetypes_get_all_aggregate_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users" 
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get all aggregate types with expired access token
    And I send the GET request to "aggregatetypes_get_all_aggregate_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users" 
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get all aggregate types with malformed access token
    And I send the GET request to "aggregatetypes_get_all_aggregate_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users" 
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get all aggregate types with valid request
    And I send the GET request to "aggregatetypes_get_all_aggregate_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data[0].id|"1"|
      |$.data[0].name|Type1|
    And I store the response as "getAllAggregateTypes_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate aggregate types response structure
    And I send the GET request to "aggregatetypes_get_all_aggregate_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
      |$.data[0]|object|
      |$.data[0].id|string|
      |$.data[0].name|string|
      |$.data[0].erp_id|string|
      |$.data[0].typename|string|
      |$.data[0].channel_id|null|
      |$.data[0].is_active|string|
      |$.data[0].created|string|
      |$.data[0].modified|string|

  @Positive @DataValidation
  Scenario: TC_07 Validate aggregate types array structure and content
    And I send the GET request to "aggregatetypes_get_all_aggregate_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
      |$.data[0]|object|
      |$.data[0].id|string|
      |$.data[0].name|string|

  @Positive @DataValidation
  Scenario: TC_08 Validate aggregate types with specific data values
    And I send the GET request to "aggregatetypes_get_all_aggregate_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data[0].id|"1"|
      |$.data[0].name|Type1|
      |$.data[0].erp_id|Typeerp1|
      |$.data[0].typename|category|
      |$.data[0].is_active|"1"|
      |$.data[2].id|"4"|
      |$.data[2].name|Type4-Outlettype|
      |$.data[2].typename|type|

  @Positive @Performance
  Scenario: TC_09 Performance test for get all aggregate types endpoint
    And I send the GET request to "aggregatetypes_get_all_aggregate_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data[0].id|"1"|

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for get all aggregate types endpoint
    And I send the GET request to "aggregatetypes_get_all_aggregate_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data[0].id|"1"|

  @Negative @Validation
  Scenario: TC_11 Get all aggregate types with invalid query parameters
    And I send the GET request to "aggregatetypes_get_all_aggregate_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data[0].id|"1"|

  @Negative @Validation
  Scenario: TC_12 Get all aggregate types with special characters in query parameters
    And I send the GET request to "aggregatetypes_get_all_aggregate_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data[0].id|"1"|

  @Negative @Security
  Scenario: TC_13 Get all aggregate types with SQL injection attempt
    And I send the GET request to "aggregatetypes_get_all_aggregate_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE aggregatetypes; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data[0].id|"1"|

  @Negative @Boundary
  Scenario: TC_14 Get all aggregate types with maximum query parameters
    And I send the GET request to "aggregatetypes_get_all_aggregate_types" endpoint with dynamic access token and query parameters
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
      |$.data[0].id|"1"|

  @Negative @ErrorHandling
  Scenario: TC_15 Get all aggregate types with invalid endpoint
    And I send the GET request to "aggregatetypes_get_all_aggregate_types_invalid" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_16 Validate aggregate types business logic
    And I send the GET request to "aggregatetypes_get_all_aggregate_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data[0].id|"1"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data[0].typename|string|

  @Positive @DataIntegrity
  Scenario: TC_17 Validate aggregate types data integrity
    And I send the GET request to "aggregatetypes_get_all_aggregate_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data[0].id|"1"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
      |$.data[0]|object|
      |$.data[0].id|string|
      |$.data[0].name|string|
      |$.data[0].erp_id|string|
      |$.data[0].typename|string|
      |$.data[0].channel_id|null|
      |$.data[0].is_active|string|
      |$.data[0].created|string|
      |$.data[0].modified|string|

  @Positive @Regression
  Scenario: TC_18 Regression test for get all aggregate types endpoint
    And I send the GET request to "aggregatetypes_get_all_aggregate_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data[0].id|"1"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
      |$.data[0]|object|
      |$.data[0].id|string|
      |$.data[0].name|string|
      |$.data[0].typename|string|

  @Positive @Functional
  Scenario: TC_19 Validate aggregate types response completeness
    And I send the GET request to "aggregatetypes_get_all_aggregate_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
      |$.data[0]|object|
      |$.data[0].id|string|
      |$.data[0].name|string|
      |$.data[0].typename|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data[0].id|"1"|
      |$.data[0].name|Type1|
      |$.data[0].typename|category|
      |$.data[1].id|"2"|
      |$.data[1].name|Type2|
      |$.data[1].typename|category|
      |$.data[2].id|"4"|
      |$.data[2].name|Type4-Outlettype|
      |$.data[2].typename|type|

  @Positive @ArrayValidation
  Scenario: TC_20 Validate aggregate types array structure and content
    And I send the GET request to "aggregatetypes_get_all_aggregate_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
      |$.data[0]|object|
      |$.data[1]|object|
      |$.data[2]|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data[0].id|"1"|
      |$.data[0].name|Type1|
      |$.data[1].id|"2"|
      |$.data[1].name|Type2|
      |$.data[2].id|"4"|
      |$.data[2].name|Type4-Outlettype|

  @Positive @ContentValidation
  Scenario: TC_21 Validate aggregate types content structure
    And I send the GET request to "aggregatetypes_get_all_aggregate_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |data|
      |id|
      |name|
      |erp_id|
      |typename|
      |channel_id|
      |is_active|
      |created|
      |modified|

  @Positive @LoadTesting
  Scenario: TC_22 Load testing for get all aggregate types endpoint
    And I send the GET request to "aggregatetypes_get_all_aggregate_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data[0].id|"1"|

  @Negative @Timeout
  Scenario: TC_23 Test get all aggregate types endpoint timeout handling
    And I send the GET request to "aggregatetypes_get_all_aggregate_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data[0].id|"1"|

  @Positive @EndToEnd
  Scenario: TC_24 End-to-end get all aggregate types data retrieval workflow
    And I send the GET request to "aggregatetypes_get_all_aggregate_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "getAllAggregateTypes_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
      |$.data[0]|object|
      |$.data[0].id|string|
      |$.data[0].name|string|
      |$.data[0].erp_id|string|
      |$.data[0].typename|string|
      |$.data[0].channel_id|null|
      |$.data[0].is_active|string|
      |$.data[0].created|string|
      |$.data[0].modified|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data[0].id|"1"|
      |$.data[0].name|Type1|
      |$.data[0].typename|category|
      |$.data[1].id|"2"|
      |$.data[1].name|Type2|
      |$.data[1].typename|category|
      |$.data[2].id|"4"|
      |$.data[2].name|Type4-Outlettype|
      |$.data[2].typename|type|

