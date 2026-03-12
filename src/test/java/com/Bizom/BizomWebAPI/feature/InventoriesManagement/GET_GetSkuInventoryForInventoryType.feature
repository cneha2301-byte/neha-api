@BizomWebAPI @OS @InventoriesManagement @GetSkuInventoryForInventoryType @DataProcessing
Feature: Get SKU Inventory For Inventory Type API Testing
  As a system user
  I want to test the get SKU inventory for inventory type endpoint
  So that I can ensure proper functionality and data retrieval for SKU inventory by inventory type

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get SKU inventory for inventory type without access token
    When I send the GET request to "inventories_get_sku_inventory_for_inventory_type" endpoint with path parameters
      |Path|Value|
      |warehouseId|2|
      |skuId|1|
      |inventoryTypeId|5|
      |batchId|0|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get SKU inventory for inventory type with invalid access token
#    And I send the GET request to "inventories_get_sku_inventory_for_inventory_type" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|invalid_token_12345|warehouseId|2|
#      |||skuId|1|
#      |||inventoryTypeId|5|
#      |||batchId|0|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get SKU inventory for inventory type with expired access token
#    And I send the GET request to "inventories_get_sku_inventory_for_inventory_type" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|expired_token_12345|warehouseId|2|
#      |||skuId|1|
#      |||inventoryTypeId|5|
#      |||batchId|0|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2000" milliseconds
#
#  @Negative @Security
#  Scenario: Get SKU inventory for inventory type with malformed access token
#    And I send the GET request to "inventories_get_sku_inventory_for_inventory_type" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|malformed.token.here|warehouseId|2|
#      |||skuId|1|
#      |||inventoryTypeId|5|
#      |||batchId|0|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2000" milliseconds

#  @Positive @Smoke
#  Scenario: Get SKU inventory for inventory type with valid access token - warehouse ID 2, SKU ID 1, inventory type ID 5, batch ID 0
#    And I send the GET request to "inventories_get_sku_inventory_for_inventory_type" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|2|
#      |||skuId|1|
#      |||inventoryTypeId|5|
#      |||batchId|0|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data["1"]|0|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.data|object|

#  @Positive @Functional
#  Scenario: Get SKU inventory for inventory type with different parameters
#    And I send the GET request to "inventories_get_sku_inventory_for_inventory_type" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#      |||skuId|2|
#      |||inventoryTypeId|3|
#      |||batchId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.data|object|

  @Negative @Validation
  Scenario: Get SKU inventory for inventory type with invalid warehouse ID
    And I send the GET request to "inventories_get_sku_inventory_for_inventory_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|abc|
      |||skuId|1|
      |||inventoryTypeId|5|
      |||batchId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Negative @Validation
  Scenario: Get SKU inventory for inventory type with invalid SKU ID
    And I send the GET request to "inventories_get_sku_inventory_for_inventory_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
      |||skuId|abc|
      |||inventoryTypeId|5|
      |||batchId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Negative @Validation
  Scenario: Get SKU inventory for inventory type with invalid inventory type ID
    And I send the GET request to "inventories_get_sku_inventory_for_inventory_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
      |||skuId|1|
      |||inventoryTypeId|abc|
      |||batchId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Negative @Validation
  Scenario: Get SKU inventory for inventory type with non-existent warehouse ID
    And I send the GET request to "inventories_get_sku_inventory_for_inventory_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|999999|
      |||skuId|1|
      |||inventoryTypeId|5|
      |||batchId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: Get SKU inventory for inventory type with non-existent SKU ID
    And I send the GET request to "inventories_get_sku_inventory_for_inventory_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
      |||skuId|999999|
      |||inventoryTypeId|5|
      |||batchId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: Get SKU inventory for inventory type with non-existent inventory type ID
    And I send the GET request to "inventories_get_sku_inventory_for_inventory_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
      |||skuId|1|
      |||inventoryTypeId|999999|
      |||batchId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @ErrorHandling
  Scenario: Get SKU inventory for inventory type with invalid endpoint
    And I send the GET request to "inventories_get_sku_inventory_for_inventory_type_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
      |||skuId|1|
      |||inventoryTypeId|5|
      |||batchId|0|
    Then I should see the response code as "404"
    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance test for get SKU inventory for inventory type endpoint
    And I send the GET request to "inventories_get_sku_inventory_for_inventory_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
      |||skuId|1|
      |||inventoryTypeId|5|
      |||batchId|0|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Regression
  Scenario: Regression test for get SKU inventory for inventory type endpoint
    And I send the GET request to "inventories_get_sku_inventory_for_inventory_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
      |||skuId|1|
      |||inventoryTypeId|5|
      |||batchId|0|
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
      |$.data|object|

#  @Positive @Smoke
#  Scenario: Get SKU inventory for inventory type with valid access token - DB validation
#    And I send the GET request to "inventories_get_sku_inventory_for_inventory_type" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|2|
#      |||skuId|1|
#      |||inventoryTypeId|5|
#      |||batchId|0|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data["1"]|0|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.data|object|


