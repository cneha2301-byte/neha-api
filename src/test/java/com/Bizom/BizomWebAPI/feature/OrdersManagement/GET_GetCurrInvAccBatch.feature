@BizomWebAPI @OS @OrdersManagement @GetCurrInvAccBatch @SystemIntegration
Feature: Get Current Inventory According to Batch API Testing
  As a system user
  I want to test the getCurrInvAccBatch endpoint
  So that I can ensure proper retrieval of current inventory according to batch parameters

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |accept-language|en-US,en;q=0.9|
      |priority|u=0, i|
      |sec-ch-ua|"Google Chrome";v="143", "Chromium";v="143", "Not A(Brand";v="24"|
      |sec-ch-ua-mobile|?0|
      |sec-ch-ua-platform|"Windows"|
      |sec-fetch-dest|document|
      |sec-fetch-mode|navigate|
      |sec-fetch-site|none|
      |sec-fetch-user|?1|
      |upgrade-insecure-requests|1|
      |user-agent|Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36|

  @Negative @Security
  Scenario: TC_01 Get current inventory according to batch without access token
    When I send the GET request to "orders_get_curr_inv_acc_batch" endpoint with path parameters
      |Path|Value|
      |skuIds|2|
      |batchId|1|
      |inventoryCheckForWareId|1|
      |qtyincases|1|
      |towarehouseid|1|
      |zeroBatchFlag|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get current inventory according to batch with invalid access token
    And I send the GET request to "orders_get_curr_inv_acc_batch" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|skuIds|2|
      |||batchId|1|
      |||inventoryCheckForWareId|1|
      |||qtyincases|1|
      |||towarehouseid|1|
      |||zeroBatchFlag|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get current inventory according to batch with expired access token
    And I send the GET request to "orders_get_curr_inv_acc_batch" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|skuIds|2|
      |||batchId|1|
      |||inventoryCheckForWareId|1|
      |||qtyincases|1|
      |||towarehouseid|1|
      |||zeroBatchFlag|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get current inventory according to batch with malformed access token
    And I send the GET request to "orders_get_curr_inv_acc_batch" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|skuIds|2|
      |||batchId|1|
      |||inventoryCheckForWareId|1|
      |||qtyincases|1|
      |||towarehouseid|1|
      |||zeroBatchFlag|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_05 Get current inventory according to batch with empty access token
    And I send the GET request to "orders_get_curr_inv_acc_batch" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token||skuIds|2|
      |||batchId|1|
      |||inventoryCheckForWareId|1|
      |||qtyincases|1|
      |||towarehouseid|1|
      |||zeroBatchFlag|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_06 Get current inventory according to batch with valid parameters
    And I send the GET request to "orders_get_curr_inv_acc_batch" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|skuIds|2|
      |||batchId|1|
      |||inventoryCheckForWareId|1|
      |||qtyincases|1|
      |||towarehouseid|1|
      |||zeroBatchFlag|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "getcurrinvaccbatch_response" name using full path

  @Positive @DataValidation
  Scenario: TC_07 Validate get current inventory response structure
    And I send the GET request to "orders_get_curr_inv_acc_batch" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|skuIds|2|
      |||batchId|1|
      |||inventoryCheckForWareId|1|
      |||qtyincases|1|
      |||towarehouseid|1|
      |||zeroBatchFlag|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.availableInventory|array|
      |$.unitsPerCase|array|
      |$.unitsPerInnerCase|array|
      |$.distirubutorAvailableInventory|array|
      |$.zeroBatchAvailableInventory|array|

  @Positive @DataValidation
  Scenario: TC_08 Validate nested array structure
    And I send the GET request to "orders_get_curr_inv_acc_batch" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|skuIds|2|
      |||batchId|1|
      |||inventoryCheckForWareId|1|
      |||qtyincases|1|
      |||towarehouseid|1|
      |||zeroBatchFlag|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.unitsPerCase|array|
      |$.unitsPerInnerCase|array|

  @Positive @Performance
  Scenario: TC_09 Performance test for get current inventory endpoint
    And I send the GET request to "orders_get_curr_inv_acc_batch" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|skuIds|2|
      |||batchId|1|
      |||inventoryCheckForWareId|1|
      |||qtyincases|1|
      |||towarehouseid|1|
      |||zeroBatchFlag|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Negative @Validation
  Scenario: TC_10 Get current inventory with invalid skuIds
    And I send the GET request to "orders_get_curr_inv_acc_batch" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|skuIds|abc|
      |||batchId|1|
      |||inventoryCheckForWareId|1|
      |||qtyincases|1|
      |||towarehouseid|1|
      |||zeroBatchFlag|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_11 Get current inventory with invalid batchId
    And I send the GET request to "orders_get_curr_inv_acc_batch" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|skuIds|2|
      |||batchId|abc|
      |||inventoryCheckForWareId|1|
      |||qtyincases|1|
      |||towarehouseid|1|
      |||zeroBatchFlag|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_12 Get current inventory with invalid inventoryCheckForWareId
    And I send the GET request to "orders_get_curr_inv_acc_batch" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|skuIds|2|
      |||batchId|1|
      |||inventoryCheckForWareId|abc|
      |||qtyincases|1|
      |||towarehouseid|1|
      |||zeroBatchFlag|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_13 Get current inventory with invalid qtyincases
    And I send the GET request to "orders_get_curr_inv_acc_batch" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|skuIds|2|
      |||batchId|1|
      |||inventoryCheckForWareId|1|
      |||qtyincases|abc|
      |||towarehouseid|1|
      |||zeroBatchFlag|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_14 Get current inventory with invalid towarehouseid
    And I send the GET request to "orders_get_curr_inv_acc_batch" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|skuIds|2|
      |||batchId|1|
      |||inventoryCheckForWareId|1|
      |||qtyincases|1|
      |||towarehouseid|abc|
      |||zeroBatchFlag|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_15 Get current inventory with invalid zeroBatchFlag
    And I send the GET request to "orders_get_curr_inv_acc_batch" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|skuIds|2|
      |||batchId|1|
      |||inventoryCheckForWareId|1|
      |||qtyincases|1|
      |||towarehouseid|1|
      |||zeroBatchFlag|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_16 Get current inventory with non-existent skuIds
    And I send the GET request to "orders_get_curr_inv_acc_batch" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|skuIds|999999|
      |||batchId|1|
      |||inventoryCheckForWareId|1|
      |||qtyincases|1|
      |||towarehouseid|1|
      |||zeroBatchFlag|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_17 Get current inventory with zero values
    And I send the GET request to "orders_get_curr_inv_acc_batch" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|skuIds|0|
      |||batchId|0|
      |||inventoryCheckForWareId|0|
      |||qtyincases|0|
      |||towarehouseid|0|
      |||zeroBatchFlag|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_18 Get current inventory with negative values
    And I send the GET request to "orders_get_curr_inv_acc_batch" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|skuIds|-1|
      |||batchId|-1|
      |||inventoryCheckForWareId|-1|
      |||qtyincases|-1|
      |||towarehouseid|-1|
      |||zeroBatchFlag|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_19 Get current inventory with zeroBatchFlag 0
    And I send the GET request to "orders_get_curr_inv_acc_batch" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|skuIds|2|
      |||batchId|1|
      |||inventoryCheckForWareId|1|
      |||qtyincases|1|
      |||towarehouseid|1|
      |||zeroBatchFlag|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Negative @ErrorHandling
#  Scenario: TC_20 Get current inventory with invalid endpoint
#    And I send the GET request to "orders_get_curr_inv_acc_batch_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|skuIds|2|
#      |||batchId|1|
#      |||inventoryCheckForWareId|1|
#      |||qtyincases|1|
#      |||towarehouseid|1|
#      |||zeroBatchFlag|1|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds

  @Positive @DataValidation
  Scenario: TC_21 Validate response contains mandatory keys
    And I send the GET request to "orders_get_curr_inv_acc_batch" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|skuIds|2|
      |||batchId|1|
      |||inventoryCheckForWareId|1|
      |||qtyincases|1|
      |||towarehouseid|1|
      |||zeroBatchFlag|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |availableInventory|
      |unitsPerCase|
      |unitsPerInnerCase|
      |distirubutorAvailableInventory|
      |zeroBatchAvailableInventory|

  @Positive @ArrayValidation
  Scenario: TC_22 Validate empty and non-empty arrays
    And I send the GET request to "orders_get_curr_inv_acc_batch" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|skuIds|2|
      |||batchId|1|
      |||inventoryCheckForWareId|1|
      |||qtyincases|1|
      |||towarehouseid|1|
      |||zeroBatchFlag|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.availableInventory|array|
      |$.zeroBatchAvailableInventory|array|

  @Positive @Concurrency
  Scenario: TC_23 Concurrent access test for get current inventory endpoint
    And I send the GET request to "orders_get_curr_inv_acc_batch" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|skuIds|2|
      |||batchId|1|
      |||inventoryCheckForWareId|1|
      |||qtyincases|1|
      |||towarehouseid|1|
      |||zeroBatchFlag|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @LoadTesting
  Scenario: TC_24 Load testing for get current inventory endpoint
    And I send the GET request to "orders_get_curr_inv_acc_batch" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|skuIds|2|
      |||batchId|1|
      |||inventoryCheckForWareId|1|
      |||qtyincases|1|
      |||towarehouseid|1|
      |||zeroBatchFlag|1|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Negative @Timeout
  Scenario: TC_25 Test get current inventory endpoint timeout handling
    And I send the GET request to "orders_get_curr_inv_acc_batch" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|skuIds|2|
      |||batchId|1|
      |||inventoryCheckForWareId|1|
      |||qtyincases|1|
      |||towarehouseid|1|
      |||zeroBatchFlag|1|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds

  @Positive @Regression
  Scenario: TC_26 Regression test for get current inventory endpoint
    And I send the GET request to "orders_get_curr_inv_acc_batch" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|skuIds|2|
      |||batchId|1|
      |||inventoryCheckForWareId|1|
      |||qtyincases|1|
      |||towarehouseid|1|
      |||zeroBatchFlag|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.availableInventory|array|
      |$.unitsPerCase|array|
      |$.unitsPerInnerCase|array|

  @Positive @EndToEnd
  Scenario: TC_27 End-to-end get current inventory workflow
    And I send the GET request to "orders_get_curr_inv_acc_batch" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|skuIds|2|
      |||batchId|1|
      |||inventoryCheckForWareId|1|
      |||qtyincases|1|
      |||towarehouseid|1|
      |||zeroBatchFlag|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.availableInventory|array|
      |$.unitsPerCase|array|
      |$.unitsPerInnerCase|array|
      |$.distirubutorAvailableInventory|array|
      |$.zeroBatchAvailableInventory|array|
    And validating the response contains the following values
      |Value|
      |availableInventory|
      |unitsPerCase|
      |unitsPerInnerCase|
      |distirubutorAvailableInventory|
      |zeroBatchAvailableInventory|
    And I store the response as "getcurrinvaccbatch_response" name using full path

  @Positive @Boundary
  Scenario: TC_28 Get current inventory with very large skuIds
    And I send the GET request to "orders_get_curr_inv_acc_batch" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|skuIds|2147483647|
      |||batchId|1|
      |||inventoryCheckForWareId|1|
      |||qtyincases|1|
      |||towarehouseid|1|
      |||zeroBatchFlag|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Boundary
  Scenario: TC_29 Get current inventory with different qtyincases values
    And I send the GET request to "orders_get_curr_inv_acc_batch" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|skuIds|2|
      |||batchId|1|
      |||inventoryCheckForWareId|1|
      |||qtyincases|10|
      |||towarehouseid|1|
      |||zeroBatchFlag|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Boundary
  Scenario: TC_30 Get current inventory with different warehouse IDs
    And I send the GET request to "orders_get_curr_inv_acc_batch" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|skuIds|2|
      |||batchId|1|
      |||inventoryCheckForWareId|1|
      |||qtyincases|1|
      |||towarehouseid|5|
      |||zeroBatchFlag|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds


