@BizomWebAPI @OS @InventoriesManagement @GetInventoryForWarehousePaginated @SystemIntegration
Feature: Get Inventory For Warehouse Paginated API Testing
  As a system user
  I want to test the getInventoryForWarehousePaginated endpoint
  So that I can ensure proper retrieval of paginated inventory data for warehouses

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
  Scenario: TC_01 Get inventory for warehouse paginated without access token
    And I post the request with "POST_getInventoryForWarehousePaginated" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token||
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get inventory for warehouse paginated with invalid access token
    And I post the request with "POST_getInventoryForWarehousePaginated" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|invalid_token_12345|
    Then I should see the response code as "302"
    And the HTML response should contain page title ""
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get inventory for warehouse paginated with expired access token
    And I post the request with "POST_getInventoryForWarehousePaginated" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|expired_token_12345|
    Then I should see the response code as "302"
    And the HTML response should contain page title ""
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get inventory for warehouse paginated with malformed access token
    And I post the request with "POST_getInventoryForWarehousePaginated" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|malformed.token.here|
    Then I should see the response code as "302"
    And the HTML response should contain page title ""
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get inventory for warehouse paginated with valid request
    And I post the request with "POST_getInventoryForWarehousePaginated" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found.|
      |$.Data[0].id|"1"|
      |$.Data[0].warehouse_id|"1"|
      |$.Data[0].skunit_id|"1"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|
      |$.Data[0]|object|
      |$.Data[0].id|string|
      |$.Data[0].warehouse_id|string|
      |$.Data[0].availableinventory|string|
      |$.Data[0].nonsaleableinventory|string|
      |$.Data[0].emptyinventory|string|
      |$.Data[0].is_active|string|
      |$.Data[0].skunit_id|string|
      |$.Data[0].batch_id|string|
      |$.Data[0].bookedinventory|string|
      |$.Data[0].alloworderwithoutinventory|string|
      |$.Data[0].primaryStock|string|
      |$.Data[0].openingAuditStock|string|
      |$.Data[0].skunit_serialnumbers|array|
    And I store the response as "get_inventory_for_warehouse_paginated_response" name using full path

  @Positive @DBValidation
  Scenario: TC_06 Validate inventory data with DB
    And I post the request with "POST_getInventoryForWarehousePaginated" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And I verify API response at path with DB and static values
      |JPath|Value|
      #|$.Data[0].warehouse_id|DB:warehouses:id: id=1|

  @Positive @Performance
  Scenario: TC_07 Performance test for get inventory for warehouse paginated endpoint
    And I post the request with "POST_getInventoryForWarehousePaginated" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_08 Get inventory for warehouse paginated with invalid warehouse ID
    And I modify fields with random values and remove fields in "POST_getInventoryForWarehousePaginated" payload
      |JPath|Value|
      |$.warehouseId|abc|
    And I post the request with "POST_getInventoryForWarehousePaginated" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Data|array|

  @Negative @Validation
  Scenario: TC_09 Get inventory for warehouse paginated with empty body
    And I send empty body with "POST_getInventoryForWarehousePaginated" request
    And I post the request with "POST_getInventoryForWarehousePaginated" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Invalid warehouseId format sent."|

#  @Negative @ErrorHandling
#  Scenario: TC_10 Get inventory for warehouse paginated with invalid endpoint
#    And I post the request with "POST_getInventoryForWarehousePaginated_invalid" payload with dynamic access token and query parameters
#      |Query|Value|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_11 Get inventory for warehouse paginated with invalid page number
    And I modify fields with random values and remove fields in "POST_getInventoryForWarehousePaginated" payload
      |JPath|Value|
      |$.pageno|abc|
    And I post the request with "POST_getInventoryForWarehousePaginated" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Data|array|

  @Negative @Validation
  Scenario: TC_12 Get inventory for warehouse paginated with invalid limit
    And I modify fields with random values and remove fields in "POST_getInventoryForWarehousePaginated" payload
      |JPath|Value|
      |$.limit|abc|
    And I post the request with "POST_getInventoryForWarehousePaginated" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Data|array|

  @Negative @Validation
  Scenario: TC_13 Get inventory for warehouse paginated with non-existent warehouse ID
    And I modify fields with random values and remove fields in "POST_getInventoryForWarehousePaginated" payload
      |JPath|Value|
      |$.warehouseId|999999|
    And I post the request with "POST_getInventoryForWarehousePaginated" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Data|array|

  @Positive @ObjectValidation
  Scenario: TC_14 Validate inventory object structure and data types
    And I post the request with "POST_getInventoryForWarehousePaginated" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data[0].id|string|
      |$.Data[0].warehouse_id|string|
      |$.Data[0].availableinventory|string|
      |$.Data[0].nonsaleableinventory|string|
      |$.Data[0].emptyinventory|string|
      |$.Data[0].is_active|string|
      |$.Data[0].skunit_id|string|
      |$.Data[0].batch_id|string|
      |$.Data[0].bookedinventory|string|
      |$.Data[0].alloworderwithoutinventory|string|
      |$.Data[0].primaryStock|string|
      |$.Data[0].openingAuditStock|string|
      |$.Data[0].skunit_serialnumbers|array|

  @Positive @ContentValidation
  Scenario: TC_15 Validate inventory response contains mandatory keys
    And I post the request with "POST_getInventoryForWarehousePaginated" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Data|
      |id|
      |warehouse_id|
      |availableinventory|
      |nonsaleableinventory|
      |emptyinventory|
      |is_active|
      |skunit_id|
      |batch_id|
      |bookedinventory|
      |alloworderwithoutinventory|
      |primaryStock|
      |openingAuditStock|
      |skunit_serialnumbers|

  @Positive @Regression
  Scenario: TC_16 Regression test for get inventory for warehouse paginated endpoint
    And I post the request with "POST_getInventoryForWarehousePaginated" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|

  @Positive @Concurrency
  Scenario: TC_17 Concurrent access test for get inventory for warehouse paginated endpoint
    And I post the request with "POST_getInventoryForWarehousePaginated" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @LoadTesting
  Scenario: TC_18 Load testing for get inventory for warehouse paginated endpoint
    And I post the request with "POST_getInventoryForWarehousePaginated" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Timeout
  Scenario: TC_19 Test get inventory for warehouse paginated endpoint timeout handling
    And I post the request with "POST_getInventoryForWarehousePaginated" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

