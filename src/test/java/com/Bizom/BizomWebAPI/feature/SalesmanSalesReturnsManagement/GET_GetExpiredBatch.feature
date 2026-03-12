@BizomWebAPI @SkunitsManagement @GetExpiredBatches @InventoryManagement
Feature: Get Expired Batch API Testing
  As a system user
  I want to test the get expired batch endpoint
  So that I can ensure proper functionality and data retrieval for expired batches

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get expired batch without access token
    When I send the GET request to "skunits_get_expired_batch" endpoint
    Then I should see the response code as "STATUS_200_OK"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get expired batch with empty access token
    And I send the GET request to "skunits_get_expired_batch" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |skuId|DB:skunits:id: id=1|
      |searchBatch|test|
      |warehouseId|DB:warehouses:id: id=2|
      |outletId|DB:outlets:id: id=1|
      |access_token||
    Then I should see the response code as "STATUS_200_OK"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_03 Get expired batch with valid access token and valid parameters
    And I send the GET request to "skunits_get_expired_batch" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |skuId|DB:skunits:id: id=1|
      |searchBatch|test|
      |warehouseId|DB:warehouses:id: id=2|
      |outletId|DB:outlets:id: id=1|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Expired Batch found|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data[0].name|TestBatch1|
      |$.data[0].manufacture_date|2024-12-31|
      |$.data[0].expiry_date|2025-12-31|
    And I store the response as "get_expired_batch_response" name using full path

  @Positive @DataValidation
  Scenario: TC_04 Validate expired batch response structure
    And I send the GET request to "skunits_get_expired_batch" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |skuId|DB:skunits:id: id=1|
      |searchBatch|test|
      |warehouseId|DB:warehouses:id: id=2|
      |outletId|DB:outlets:id: id=1|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
      |$.inventory|array|
      |$.price|array|
      |$.price[0].skunit_id|string|
      |$.price[0].batch_id|string|
      |$.price[0].price|string|
      |$.price[0].mrp|string|
      |$.lastPrice|array|
      |$.lastPrice[0].skunit_id|string|
      |$.lastPrice[0].batch_id|string|
      |$.lastPrice[0].price|string|

  @Positive @DataValidation
  Scenario: TC_05 Validate expired batch specific data values
    And I send the GET request to "skunits_get_expired_batch" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |skuId|DB:skunits:id: id=1|
      |searchBatch|test|
      |warehouseId|DB:warehouses:id: id=2|
      |outletId|DB:outlets:id: id=1|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Expired Batch found|

  @Positive @Performance
  Scenario: TC_06 Performance test for expired batch endpoint
    And I send the GET request to "skunits_get_expired_batch" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |skuId|DB:skunits:id: id=1|
      |searchBatch|test|
      |warehouseId|DB:warehouses:id: id=2|
      |outletId|DB:outlets:id: id=1|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Expired Batch found|

  @Positive @Concurrency
  Scenario: TC_07 Concurrent access test for expired batch endpoint
    And I send the GET request to "skunits_get_expired_batch" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |skuId|DB:skunits:id: id=1|
      |searchBatch|test|
      |warehouseId|DB:warehouses:id: id=2|
      |outletId|DB:outlets:id: id=1|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: TC_08 Get expired batch with maximum query parameters
    And I send the GET request to "skunits_get_expired_batch" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |skuId|1|
      |searchBatch|test|
      |warehouseId|1|
      |outletId|2|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Expired Batch found|


  @Positive @BusinessLogic
  Scenario: TC_09 Validate expired batch business logic
    And I send the GET request to "skunits_get_expired_batch" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |skuId|DB:skunits:id: id=1|
      |searchBatch|test|
      |warehouseId|DB:warehouses:id: id=2|
      |outletId|DB:outlets:id: id=1|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Expired Batch found|

  @Positive @DataIntegrity
  Scenario: TC_10 Validate expired batch data integrity
    And I send the GET request to "skunits_get_expired_batch" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |skuId|DB:skunits:id: id=1|
      |searchBatch|test|
      |warehouseId|DB:warehouses:id: id=2|
      |outletId|DB:outlets:id: id=1|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
      |$.inventory|array|
      |$.price|array|
      |$.lastPrice|array|

  @Positive @Regression
  Scenario: TC_11 Regression test for expired batch endpoint
    And I send the GET request to "skunits_get_expired_batch" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |skuId|DB:skunits:id: id=1|
      |searchBatch|test|
      |warehouseId|DB:warehouses:id: id=2|
      |outletId|DB:outlets:id: id=1|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Expired Batch found|

  @Positive @Functional
  Scenario: TC_12 Validate expired batch response completeness
    And I send the GET request to "skunits_get_expired_batch" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |skuId|DB:skunits:id: id=1|
      |searchBatch|test|
      |warehouseId|DB:warehouses:id: id=2|
      |outletId|DB:outlets:id: id=1|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
      |$.price|array|
      |$.lastPrice|array|

  @Positive @ArrayValidation
  Scenario: TC_13 Validate expired batch array structure and content
    And I send the GET request to "skunits_get_expired_batch" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |skuId|DB:skunits:id: id=1|
      |searchBatch|test|
      |warehouseId|DB:warehouses:id: id=2|
      |outletId|DB:outlets:id: id=1|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
      |$.data[0]|object|
      |$.price|array|
      |$.price[0]|object|
      |$.lastPrice|array|
      |$.lastPrice[0]|object|

  @Positive @ContentValidation
  Scenario: TC_14 Validate expired batch content contains keys
    And I send the GET request to "skunits_get_expired_batch" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |skuId|DB:skunits:id: id=1|
      |searchBatch|test|
      |warehouseId|DB:warehouses:id: id=2|
      |outletId|DB:outlets:id: id=1|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |data|
      |inventory|
      |price|
      |lastPrice|

  @Positive @LoadTesting
  Scenario: TC_15 Load testing for expired batch endpoint
    And I send the GET request to "skunits_get_expired_batch" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |skuId|DB:skunits:id: id=1|
      |searchBatch|test|
      |warehouseId|DB:warehouses:id: id=2|
      |outletId|DB:outlets:id: id=1|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Expired Batch found|

  @Negative @Timeout
  Scenario: TC_16 Test expired batch endpoint timeout handling
    And I send the GET request to "skunits_get_expired_batch" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |skuId|DB:skunits:id: id=1|
      |searchBatch|test|
      |warehouseId|DB:warehouses:id: id=2|
      |outletId|DB:outlets:id: id=1|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "5000" milliseconds

  @Positive @EndToEnd
  Scenario: TC_17 End-to-end expired batch data retrieval workflow
    And I send the GET request to "skunits_get_expired_batch" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |skuId|DB:skunits:id: id=1|
      |searchBatch|test|
      |warehouseId|DB:warehouses:id: id=2|
      |outletId|DB:outlets:id: id=1|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And I store the response as "get_expired_batch_response_e2e" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
      |$.price|array|
      |$.lastPrice|array|

  @Negative @Validation
  Scenario: TC_18 Get expired batch with missing required parameters
    And I send the GET request to "skunits_get_expired_batch" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Negative @Validation
  Scenario: TC_19 Get expired batch with empty search batch
    And I send the GET request to "skunits_get_expired_batch" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |skuId|DB:skunits:id: id=1|
      |searchBatch||
      |warehouseId|DB:warehouses:id: id=2|
      |outletId|DB:outlets:id: id=1|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_20 Get expired batch with special characters in search batch
    And I send the GET request to "skunits_get_expired_batch" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |skuId|DB:skunits:id: id=1|
      |searchBatch|@#$!$#!|
      |warehouseId|DB:warehouses:id: id=2|
      |outletId|DB:outlets:id: id=1|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
