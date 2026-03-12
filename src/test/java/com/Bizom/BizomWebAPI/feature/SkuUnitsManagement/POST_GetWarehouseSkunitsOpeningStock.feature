@BizomWebAPI @SkuUnitsManagement @SkuUnitsOpeningStock @ProductManagement @OS
Feature: Get Warehouse SKUs Opening Stock API Testing
  As a system user
  I want to test the get warehouse SKUs opening stock endpoint
  So that I can ensure proper functionality and data retrieval for warehouse SKU opening stock information

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get warehouse SKUs opening stock without access token
    When I post the request with "skunits_get_warehouse_skunits_opening_stock" payload
    Then I should see the response code as "401"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_02 Get warehouse SKUs opening stock with invalid access token
    And I modify fields with random values and remove fields in "skunits_get_warehouse_skunits_opening_stock" payload
      |JPath|Value|
      |$.skunitIds[0]|1|
      |$.warehouseId|2|
    And I post the request with "skunits_get_warehouse_skunits_opening_stock" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|invalid_token_12345|
    Then I should see the response code as "302"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_03 Get warehouse SKUs opening stock with expired access token
    And I modify fields with random values and remove fields in "skunits_get_warehouse_skunits_opening_stock" payload
      |JPath|Value|
      |$.skunitIds[0]|1|
      |$.warehouseId|2|
    And I post the request with "skunits_get_warehouse_skunits_opening_stock" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|expired_token_12345|
    Then I should see the response code as "302"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_04 Get warehouse SKUs opening stock with malformed access token
    And I modify fields with random values and remove fields in "skunits_get_warehouse_skunits_opening_stock" payload
      |JPath|Value|
      |$.skunitIds[0]|1|
      |$.warehouseId|2|
    And I post the request with "skunits_get_warehouse_skunits_opening_stock" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|malformed.token.here|
    Then I should see the response code as "302"
    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get warehouse SKUs opening stock with valid access token
    And I post the request with "skunits_get_warehouse_skunits_opening_stock" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Setting is not enabled for this process"|
      |$.Data|[]|
    And I store the response as "getWarehouseSkunitsOpeningStock_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate warehouse SKUs opening stock response structure
    And I modify fields with random values and remove fields in "skunits_get_warehouse_skunits_opening_stock" payload
      |JPath|Value|
      |$.skunitIds[0]|1|
      |$.warehouseId|2|
    And I post the request with "skunits_get_warehouse_skunits_opening_stock" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And verifies the field is present in the response
      |JPath|
      |$.Result|
      |$.Reason|
      |$.Data|
    And I store the response as "getWarehouseSkunitsOpeningStock_response" name using full path

  @Positive @DataValidation
  Scenario: TC_07 Validate warehouse SKUs opening stock data types
    And I modify fields with random values and remove fields in "skunits_get_warehouse_skunits_opening_stock" payload
      |JPath|Value|
      |$.skunitIds[0]|1|
      |$.warehouseId|2|
    And I post the request with "skunits_get_warehouse_skunits_opening_stock" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|
    And I store the response as "getWarehouseSkunitsOpeningStock_response" name using full path

  @Positive @Functional
  Scenario: TC_08 Get warehouse SKUs opening stock with different warehouse ID
    And I post the request with "skunits_get_warehouse_skunits_opening_stock" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Setting is not enabled for this process"|
      |$.Data|[]|
    And I store the response as "getWarehouseSkunitsOpeningStock_response" name using full path

  @Positive @Functional
  Scenario: TC_09 Get warehouse SKUs opening stock with different SKU IDs
    And I post the request with "skunits_get_warehouse_skunits_opening_stock" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Setting is not enabled for this process"|
      |$.Data|[]|
    And I store the response as "getWarehouseSkunitsOpeningStock_response" name using full path

  @Positive @DataValidation
  Scenario: TC_10 Validate warehouse SKUs opening stock response with expected values
    And I post the request with "skunits_get_warehouse_skunits_opening_stock" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Setting is not enabled for this process"|
      |$.Data|[]|
    And I store the response as "getWarehouseSkunitsOpeningStock_response" name using full path

  @Negative @Validation
  Scenario: TC_11 Get warehouse SKUs opening stock with missing skunitIds
    And I modify fields with random values and remove fields in "skunits_get_warehouse_skunits_opening_stock" payload
      |JPath|Value|
      |$.warehouseId|2|
    And I post the request with "skunits_get_warehouse_skunits_opening_stock" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I store the response as "getWarehouseSkunitsOpeningStock_response" name using full path

  @Negative @Validation
  Scenario: TC_12 Get warehouse SKUs opening stock with missing warehouseId
    And I modify fields with random values and remove fields in "skunits_get_warehouse_skunits_opening_stock" payload
      |JPath|Value|
      |$.skunitIds[0]|1|
    And I post the request with "skunits_get_warehouse_skunits_opening_stock" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I store the response as "getWarehouseSkunitsOpeningStock_response" name using full path

  @Negative @Validation
  Scenario: TC_13 Get warehouse SKUs opening stock with invalid warehouseId format
    And I modify fields with random values and remove fields in "skunits_get_warehouse_skunits_opening_stock" payload
      |JPath|Value|
      |$.skunitIds[0]|1|
      |$.warehouseId|invalid|
    And I post the request with "skunits_get_warehouse_skunits_opening_stock" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I store the response as "getWarehouseSkunitsOpeningStock_response" name using full path

  @Negative @Validation
  Scenario: TC_14 Get warehouse SKUs opening stock with empty skunitIds array
    And I modify fields with random values and remove fields in "skunits_get_warehouse_skunits_opening_stock" payload
      |JPath|Value|
      |$.skunitIds|[]|
      |$.warehouseId|2|
    And I post the request with "skunits_get_warehouse_skunits_opening_stock" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I store the response as "getWarehouseSkunitsOpeningStock_response" name using full path

#  @Negative @ErrorHandling
#  Scenario: TC_15 Get warehouse SKUs opening stock with invalid endpoint
#    And I modify fields with random values and remove fields in "skunits_get_warehouse_skunits_opening_stock" payload
#      |JPath|Value|
#      |$.skunitIds[0]|1|
#      |$.warehouseId|2|
#    And I post the request with "skunits_get_warehouse_skunits_opening_stock_invalid" payload with dynamic access token and query parameters
#      |Query|Value|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: TC_16 Performance test for get warehouse SKUs opening stock endpoint
    And I modify fields with random values and remove fields in "skunits_get_warehouse_skunits_opening_stock" payload
      |JPath|Value|
      |$.skunitIds[0]|1|
      |$.warehouseId|2|
    And I post the request with "skunits_get_warehouse_skunits_opening_stock" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And I store the response as "getWarehouseSkunitsOpeningStock_response" name using full path

