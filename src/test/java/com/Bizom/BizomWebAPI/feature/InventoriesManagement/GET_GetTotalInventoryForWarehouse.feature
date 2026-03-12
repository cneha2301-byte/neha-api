@BizomWebAPI @OS @InventoriesManagement @Inventories @DataProcessing
Feature: Get Total Inventory For Warehouse API Testing
  As a system user
  I want to test the get total inventory for warehouse endpoint
  So that I can ensure proper functionality and data retrieval for total warehouse inventory management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get total inventory for warehouse without access token
    When I send the GET request to "inventories_get_total_inventory_for_warehouse" endpoint with path parameters
      |Path|Value|
      |warehouseId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds
#
#  @Negative @Security
#  Scenario: Get total inventory for warehouse with invalid access token
#    And I send the GET request to "inventories_get_total_inventory_for_warehouse" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|invalid_token_12345|warehouseId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get total inventory for warehouse with expired access token
#    And I send the GET request to "inventories_get_total_inventory_for_warehouse" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|expired_token_12345|warehouseId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds
#
#  @Negative @Security
#  Scenario: Get total inventory for warehouse with malformed access token
#    And I send the GET request to "inventories_get_total_inventory_for_warehouse" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|malformed.token.here|warehouseId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

#  @Positive @Smoke
#  Scenario: Get total inventory for warehouse ID 1 with valid access token
#    And I send the GET request to "inventories_get_total_inventory_for_warehouse" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason||
#      |$.data.stockTransfer.totstockTransInventoryinUnit|0|
#      |$.data.stockTransfer.totstockTransInventoryinCase|0|
#      |$.data.inventories.totsaleableInventoryinUnit|"24"|
#      |$.data.inventories.totNonsaleableInventoryinUnit|"0"|
#      |$.data.inventories.totsaleableInventoryinCase|"20"|
#      |$.data.inventories.totNonsaleableInventoryinCase|"0"|
#      |$.data.inventories.totalDCINUnits|"0"|
#      |$.data.inventories.totalDCOUTUnits|"0"|
#      |$.data.inventories.totalDCINCases|"0"|
#      |$.data.inventories.totalDCOUTCases|"0"|
#      |$.data.totalAmount|2844|
#      |$.data.totalPurchaseAmount|2844|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.data|object|
#      |$.data.stockTransfer|object|
#      |$.data.stockTransfer.totstockTransInventoryinUnit|number|
#      |$.data.stockTransfer.totstockTransInventoryinCase|number|
#      |$.data.inventories|object|
#      |$.data.inventories.totsaleableInventoryinUnit|string|
#      |$.data.inventories.totNonsaleableInventoryinUnit|string|
#      |$.data.inventories.totsaleableInventoryinCase|string|
#      |$.data.inventories.totNonsaleableInventoryinCase|string|
#      |$.data.inventories.totalDCINUnits|string|
#      |$.data.inventories.totalDCOUTUnits|string|
#      |$.data.inventories.totalDCINCases|string|
#      |$.data.inventories.totalDCOUTCases|string|
#      |$.data.totalAmount|number|
#      |$.data.totalPurchaseAmount|number|
#    And I store the response as "total_inventory_for_warehouse_response" name using full path

#  @Positive @Functional
#  Scenario: Get total inventory for warehouse ID 2 with valid access token
#    And I send the GET request to "inventories_get_total_inventory_for_warehouse" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason||
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.data|object|
#      |$.data.stockTransfer|object|
#      |$.data.inventories|object|
#
#  @Positive @Functional
#  Scenario: Get total inventory for warehouse ID 3 with valid access token
#    And I send the GET request to "inventories_get_total_inventory_for_warehouse" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|3|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason||
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.data|object|
#      |$.data.stockTransfer|object|
#      |$.data.inventories|object|

  @Negative @Validation
  Scenario: Get total inventory for warehouse with invalid warehouse ID - alphabetic characters
    And I send the GET request to "inventories_get_total_inventory_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Invalid warehouseId|
      |$.data.stockTransfer|{}|
      |$.data.inventories|{}|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|object|
      |$.data.stockTransfer|object|
      |$.data.inventories|object|

#  @Negative @Validation
#  Scenario: Get total inventory for warehouse with invalid warehouse ID - special characters
#    And I send the GET request to "inventories_get_total_inventory_for_warehouse" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|@#$%|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|Invalid warehouseId|
#      |$.data.stockTransfer|{}|
#      |$.data.inventories|{}|

#  @Negative @Validation
#  Scenario: Get total inventory for warehouse with non-existent warehouse ID
#    And I send the GET request to "inventories_get_total_inventory_for_warehouse" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|999999|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|Invalid warehouseId|
#      |$.data.stockTransfer|{}|
#      |$.data.inventories|{}|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.data|object|
#      |$.data.stockTransfer|object|
#      |$.data.inventories|object|

#  @Negative @Validation
#  Scenario: Get total inventory for warehouse with negative warehouse ID
#    And I send the GET request to "inventories_get_total_inventory_for_warehouse" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|-1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|Invalid warehouseId|
#      |$.data.stockTransfer|{}|
#      |$.data.inventories|{}|

#  @Negative @Validation
#  Scenario: Get total inventory for warehouse with zero warehouse ID
#    And I send the GET request to "inventories_get_total_inventory_for_warehouse" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|0|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|Invalid warehouseId|
#      |$.data.stockTransfer|{}|
#      |$.data.inventories|{}|

#  @Negative @Security
#  Scenario: Get total inventory for warehouse with SQL injection attempt in warehouse ID
#    And I send the GET request to "inventories_get_total_inventory_for_warehouse" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|'; DROP TABLE warehouses; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|Invalid warehouseId|
#      |$.data.stockTransfer|{}|
#      |$.data.inventories|{}|

#  @Negative @Security
#  Scenario: Get total inventory for warehouse with XSS attempt in warehouse ID
#    And I send the GET request to "inventories_get_total_inventory_for_warehouse" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|Invalid warehouseId|
#      |$.data.stockTransfer|{}|
#      |$.data.inventories|{}|

  @Negative @Boundary
  Scenario: Get total inventory for warehouse with very large warehouse ID
    And I send the GET request to "inventories_get_total_inventory_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|999999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Invalid warehouseId|
      |$.data.stockTransfer|{}|
      |$.data.inventories|{}|

  @Negative @ErrorHandling
  Scenario: Get total inventory for warehouse with invalid endpoint
    And I send the GET request to "inventories_get_total_inventory_for_warehouse_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "404"
    And verify response time is less than "2500" milliseconds

#  @Positive @Performance
#  Scenario: Performance test for total inventory for warehouse endpoint
#    And I send the GET request to "inventories_get_total_inventory_for_warehouse" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason||

#  @Positive @Regression
#  Scenario: Regression test for total inventory for warehouse endpoint
#    And I send the GET request to "inventories_get_total_inventory_for_warehouse" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason||
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.data|object|
#      |$.data.stockTransfer|object|
#      |$.data.inventories|object|

#  @Positive @DataValidation
#  Scenario: Validate total inventory for warehouse response structure
#    And I send the GET request to "inventories_get_total_inventory_for_warehouse" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason||
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.data|object|
#      |$.data.stockTransfer|object|
#      |$.data.stockTransfer.totstockTransInventoryinUnit|number|
#      |$.data.stockTransfer.totstockTransInventoryinCase|number|
#      |$.data.inventories|object|
#      |$.data.inventories.totsaleableInventoryinUnit|string|
#      |$.data.inventories.totNonsaleableInventoryinUnit|string|
#      |$.data.inventories.totsaleableInventoryinCase|string|
#      |$.data.inventories.totNonsaleableInventoryinCase|string|
#      |$.data.inventories.totalDCINUnits|string|
#      |$.data.inventories.totalDCOUTUnits|string|
#      |$.data.inventories.totalDCINCases|string|
#      |$.data.inventories.totalDCOUTCases|string|
#      |$.data.totalAmount|number|
#      |$.data.totalPurchaseAmount|number|

#  @Positive @DataValidation
#  Scenario: Validate total inventory for warehouse nested data structure
#    And I send the GET request to "inventories_get_total_inventory_for_warehouse" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason||
#      |$.data.stockTransfer.totstockTransInventoryinUnit|0|
#      |$.data.stockTransfer.totstockTransInventoryinCase|0|
#      |$.data.inventories.totsaleableInventoryinUnit|"24"|
#      |$.data.inventories.totNonsaleableInventoryinUnit|"0"|
#      |$.data.inventories.totsaleableInventoryinCase|"20"|
#      |$.data.inventories.totNonsaleableInventoryinCase|"0"|
#      |$.data.totalAmount|2844|
#      |$.data.totalPurchaseAmount|2844|

#  @Positive @BusinessLogic
#  Scenario: Validate total inventory for warehouse business logic
#    And I send the GET request to "inventories_get_total_inventory_for_warehouse" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason||

#  @Positive @DataIntegrity
#  Scenario: Validate total inventory for warehouse data integrity
#    And I send the GET request to "inventories_get_total_inventory_for_warehouse" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason||
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.data|object|
#      |$.data.stockTransfer|object|
#      |$.data.inventories|object|
#      |$.data.totalAmount|number|
#      |$.data.totalPurchaseAmount|number|

#  @Positive @EndToEnd
#  Scenario: End-to-end total inventory for warehouse data retrieval workflow
#    And I send the GET request to "inventories_get_total_inventory_for_warehouse" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason||
#      |$.data.stockTransfer.totstockTransInventoryinUnit|0|
#      |$.data.stockTransfer.totstockTransInventoryinCase|0|
#      |$.data.inventories.totsaleableInventoryinUnit|"24"|
#      |$.data.inventories.totNonsaleableInventoryinUnit|"0"|
#      |$.data.inventories.totsaleableInventoryinCase|"20"|
#      |$.data.inventories.totNonsaleableInventoryinCase|"0"|
#      |$.data.inventories.totalDCINUnits|"0"|
#      |$.data.inventories.totalDCOUTUnits|"0"|
#      |$.data.inventories.totalDCINCases|"0"|
#      |$.data.inventories.totalDCOUTCases|"0"|
#      |$.data.totalAmount|2844|
#      |$.data.totalPurchaseAmount|2844|
#    And I store the response as "total_inventory_for_warehouse_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.data|object|
#      |$.data.stockTransfer|object|
#      |$.data.inventories|object|
#      |$.data.totalAmount|number|
#      |$.data.totalPurchaseAmount|number|

#  @Positive @NestedObjectValidation
#  Scenario: Validate total inventory for warehouse nested object structure
#    And I send the GET request to "inventories_get_total_inventory_for_warehouse" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason||
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.data.stockTransfer|object|
#      |$.data.stockTransfer.totstockTransInventoryinUnit|number|
#      |$.data.stockTransfer.totstockTransInventoryinCase|number|
#      |$.data.inventories|object|
#      |$.data.inventories.totsaleableInventoryinUnit|string|
#      |$.data.inventories.totNonsaleableInventoryinUnit|string|
#      |$.data.inventories.totsaleableInventoryinCase|string|
#      |$.data.inventories.totNonsaleableInventoryinCase|string|
#      |$.data.inventories.totalDCINUnits|string|
#      |$.data.inventories.totalDCOUTUnits|string|
#      |$.data.inventories.totalDCINCases|string|
#      |$.data.inventories.totalDCOUTCases|string|



