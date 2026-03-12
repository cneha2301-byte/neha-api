@BizomWebAPI @InventoryManagement @GetBatchNamesForSku @UserAccessManagement @OS
Feature: Get Batch Names For SKU API Testing
  As a system user
  I want to test the get batch names for SKU endpoint
  So that I can ensure proper functionality and data retrieval for batch names by warehouse and SKU

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get batch names for SKU without access token
    When I send the GET request to "inventories_get_batch_names_for_sku" endpoint with path parameters
      |Path|Value|
      |warehouseId|1|
      |skuId|5|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get batch names for SKU with invalid access token
#    And I send the GET request to "inventories_get_batch_names_for_sku" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|invalid_token_12345|warehouseId|1|
#      |||skuId|5|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get batch names for SKU with expired access token
#    And I send the GET request to "inventories_get_batch_names_for_sku" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|expired_token_12345|warehouseId|1|
#      |||skuId|5|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2000" milliseconds
#
#  @Negative @Security
#  Scenario: Get batch names for SKU with malformed access token
#    And I send the GET request to "inventories_get_batch_names_for_sku" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|malformed.token.here|warehouseId|1|
#      |||skuId|5|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: Get batch names for SKU with valid access token - warehouse ID 1 and SKU ID 5
    And I send the GET request to "inventories_get_batch_names_for_sku" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
      |||skuId|5|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data[0].batchId|"0"|
      |$.data[0].batchName|No-Batch|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
      |$.data[0].batchId|string|
      |$.data[0].batchName|string|

  @Positive @Functional
  Scenario: Get batch names for SKU with different warehouse and SKU IDs
    And I send the GET request to "inventories_get_batch_names_for_sku" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
      |||skuId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|

#  @Negative @Validation
#  Scenario: Get batch names for SKU with invalid warehouse ID
#    And I send the GET request to "inventories_get_batch_names_for_sku" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|abc|
#      |||skuId|5|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|

#  @Negative @Validation
#  Scenario: Get batch names for SKU with invalid SKU ID
#    And I send the GET request to "inventories_get_batch_names_for_sku" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#      |||skuId|abc|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|

  @Negative @Validation
  Scenario: Get batch names for SKU with non-existent warehouse ID
    And I send the GET request to "inventories_get_batch_names_for_sku" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|999999|
      |||skuId|5|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: Get batch names for SKU with non-existent SKU ID
    And I send the GET request to "inventories_get_batch_names_for_sku" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
      |||skuId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @ErrorHandling
  Scenario: Get batch names for SKU with invalid endpoint
    And I send the GET request to "inventories_get_batch_names_for_sku_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
      |||skuId|5|
    Then I should see the response code as "404"
    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance test for get batch names for SKU endpoint
    And I send the GET request to "inventories_get_batch_names_for_sku" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
      |||skuId|5|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Regression
  Scenario: Regression test for get batch names for SKU endpoint
    And I send the GET request to "inventories_get_batch_names_for_sku" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
      |||skuId|5|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
      |$.data[0].batchId|string|
      |$.data[0].batchName|string|

  @Positive @Smoke
  Scenario: Get batch names for SKU with valid access token - DB validation
    And I send the GET request to "inventories_get_batch_names_for_sku" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
      |||skuId|5|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data[0].batchId|"0"|
      |$.data[0].batchName|No-Batch|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
      |$.data[0].batchId|string|
      |$.data[0].batchName|string|

