@BizomWebAPI @CE @OutletsManagement @BeatwiseOutlets @SystemOperations
Feature: Get Beatwise Outlets New API Testing
  As a system user
  I want to test the get beatwise outlets new endpoint
  So that I can ensure proper functionality and data retrieval for beatwise outlet and warehouse management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get beatwise outlets without access token
    When I send the GET request to "outlets_get_beatwise_outlets_new" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get beatwise outlets with invalid access token
    And I send the GET request to "outlets_get_beatwise_outlets_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get beatwise outlets with expired access token
    And I send the GET request to "outlets_get_beatwise_outlets_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get beatwise outlets with malformed access token
    And I send the GET request to "outlets_get_beatwise_outlets_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users" 
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get beatwise outlets with valid access token
    And I send the GET request to "outlets_get_beatwise_outlets_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"false"|
      |$.Reason|"No beat found"|
    And I store the response as "beatwise_outlets_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate beatwise outlets response structure
    And I send the GET request to "outlets_get_beatwise_outlets_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Warehouses|array|
      |$.outletBalances|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate beatwise outlets warehouse structure
    And I send the GET request to "outlets_get_beatwise_outlets_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Warehouses|array|
      |$.Warehouses[0].warehouse_id|number|
      |$.Warehouses[0].warehouse_name|string|
      |$.Warehouses[0].Areas|object|
      |$.Warehouses[0].vdiscountpercent|string|
      |$.Warehouses[0].warehouse_outlet_id|string|
      |$.Warehouses[0].warehouse_erp_id|string|

  @Positive @DataValidation
  Scenario: TC_08 Validate beatwise outlets warehouse with child warehouses
    And I send the GET request to "outlets_get_beatwise_outlets_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Warehouses|array|

  @Positive @Performance
  Scenario: TC_09 Performance test for beatwise outlets endpoint
    And I send the GET request to "outlets_get_beatwise_outlets_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for beatwise outlets endpoint
    And I send the GET request to "outlets_get_beatwise_outlets_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Warehouses|array|

  @Negative @Validation
  Scenario: TC_11 Get beatwise outlets with invalid query parameters
    And I send the GET request to "outlets_get_beatwise_outlets_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|

  @Negative @Validation
  Scenario: TC_12 Get beatwise outlets with special characters in query parameters
    And I send the GET request to "outlets_get_beatwise_outlets_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|

  @Negative @Security
  Scenario: TC_13 Get beatwise outlets with SQL injection attempt
    And I send the GET request to "outlets_get_beatwise_outlets_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE warehouses; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|

  @Negative @Boundary
  Scenario: TC_14 Get beatwise outlets with maximum query parameters
    And I send the GET request to "outlets_get_beatwise_outlets_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|

  @Negative @ErrorHandling
  Scenario: TC_15 Get beatwise outlets with invalid endpoint
    And I send the GET request to "outlets_get_beatwise_outlets_new_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_16 Validate beatwise outlets business logic - no beat found
    And I send the GET request to "outlets_get_beatwise_outlets_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"false"|
      |$.Reason|"No beat found"|

  @Positive @BusinessLogic
  Scenario: TC_17 Validate beatwise outlets with warehouses data
    And I send the GET request to "outlets_get_beatwise_outlets_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Warehouses|array|
      |$.outletBalances|array|

  @Positive @DataIntegrity
  Scenario: TC_18 Validate beatwise outlets warehouse data integrity
    And I send the GET request to "outlets_get_beatwise_outlets_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Warehouses|array|
      |$.Warehouses[0].warehouse_id|number|
      |$.Warehouses[0].warehouse_name|string|
      |$.Warehouses[0].Areas|object|
      |$.Warehouses[0].vdiscountpercent|string|
      |$.Warehouses[0].newoutletdiscountcategory_id|string|
      |$.Warehouses[0].warehouse_outlet_id|string|
      |$.Warehouses[0].warehouse_erp_id|string|

  @Positive @Regression
  Scenario: TC_19 Regression test for beatwise outlets endpoint
    And I send the GET request to "outlets_get_beatwise_outlets_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Warehouses|array|

  @Positive @Functional
  Scenario: TC_20 Validate beatwise outlets response completeness
    And I send the GET request to "outlets_get_beatwise_outlets_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Warehouses|
      |outletBalances|

  @Positive @ContentValidation
  Scenario: TC_21 Validate beatwise outlets content structure
    And I send the GET request to "outlets_get_beatwise_outlets_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Warehouses|
      |warehouse_id|
      |warehouse_name|
      |Areas|
      |vdiscountpercent|
      |warehouse_outlet_id|
      |warehouse_erp_id|

  @Positive @LoadTesting
  Scenario: TC_22 Load testing for beatwise outlets endpoint
    And I send the GET request to "outlets_get_beatwise_outlets_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Warehouses|array|

  @Negative @Timeout
  Scenario: TC_23 Test beatwise outlets endpoint timeout handling
    And I send the GET request to "outlets_get_beatwise_outlets_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|

  @Positive @EndToEnd
  Scenario: TC_24 End-to-end beatwise outlets data retrieval workflow
    And I send the GET request to "outlets_get_beatwise_outlets_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "beatwise_outlets_e2e_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Warehouses|array|
      |$.outletBalances|array|

  @Positive @ArrayValidation
  Scenario: TC_25 Validate warehouses array structure and content
    And I send the GET request to "outlets_get_beatwise_outlets_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Warehouses|array|
      |$.Warehouses[0]|object|

  @Positive @DataValidation
  Scenario: TC_26 Validate warehouse areas object structure
    And I send the GET request to "outlets_get_beatwise_outlets_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Warehouses[0].Areas|object|

  @Positive @DataValidation
  Scenario: TC_27 Validate warehouse child warehouses structure
    And I send the GET request to "outlets_get_beatwise_outlets_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Warehouses|array|

  @Positive @Reliability
  Scenario: TC_28 Reliability test for beatwise outlets endpoint
    And I send the GET request to "outlets_get_beatwise_outlets_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Warehouses|array|
      |$.outletBalances|array|

  @Positive @Idempotency
  Scenario: TC_29 Idempotency test for beatwise outlets endpoint
    And I send the GET request to "outlets_get_beatwise_outlets_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "beatwise_first_call" name using full path
    And I send the GET request to "outlets_get_beatwise_outlets_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|

  @Positive @CacheValidation
  Scenario: TC_30 Cache validation for beatwise outlets endpoint
    And I send the GET request to "outlets_get_beatwise_outlets_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Warehouses|array|

  @Positive @CacheValidation
  Scenario: TC_31 Cache validation for beatwise outlets endpoint [For collection modes]
    And I send the GET request to "outlets_get_beatwise_outlets_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.collectionmodes|string|



