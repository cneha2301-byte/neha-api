@BizomWebAPI @CE @WarehousesManagement @WarehouseManagement @WarehouseSkunitList @SystemIntegration
Feature: Warehouse SK Unit List API Testing
  As a system user
  I want to test the warehouse SK unit list endpoint
  So that I can ensure proper functionality and data retrieval for warehouse SK units

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get warehouse SK unit list without access token
    When I send the GET request to "warehouse_skunit_list" endpoint with path parameters
      |Path|Value|
      |warehouseId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get warehouse SK unit list with invalid access token
#    And I send the GET request to "warehouse_skunit_list" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|invalid_token_12345|warehouseId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get warehouse SK unit list with expired access token
#    And I send the GET request to "warehouse_skunit_list" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|expired_token_12345|warehouseId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get warehouse SK unit list with malformed access token
#    And I send the GET request to "warehouse_skunit_list" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|malformed.token.here|warehouseId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: Get warehouse SK unit list with valid warehouse ID and access token
     And I send the GET request to "warehouse_skunit_list" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|fetched successfully|
    And I store the response as "warehouse_skunit_list_response" name using full path

  @Positive @Functional
  Scenario: Get warehouse SK unit list with different warehouse ID
    And I send the GET request to "warehouse_skunit_list" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|fetched successfully|

  @Positive @Functional
  Scenario: Get warehouse SK unit list with warehouse ID 3
    And I send the GET request to "warehouse_skunit_list" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|fetched successfully|

  @Positive @Functional
  Scenario: Get warehouse SK unit list with warehouse ID 4
    And I send the GET request to "warehouse_skunit_list" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|4|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|fetched successfully|

  @Positive @DataValidation
  Scenario: Validate warehouse SK unit list response structure
     And I send the GET request to "warehouse_skunit_list" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|fetched successfully|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data[0].Warehouseskunit|object|
      |$.data[0].Warehouseskunit.id|string|
      |$.data[0].Warehouseskunit.warehouse_id|string|
      |$.data[0].Warehouseskunit.skunit_id|string|
      |$.data[0].Warehouseskunit.mrp|string|
      |$.data[0].Warehouseskunit.price|string|
      |$.data[0].Warehouseskunit.vat|string|
      |$.data[0].Warehouseskunit.warehouses|object|
      |$.data[0].Warehouseskunit.skunits|object|

#  @Positive @DataValidation
#  Scenario: Validate warehouse SK unit list specific data values
#     And I send the GET request to "warehouse_skunit_list" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|fetched successfully|
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.data[0].Warehouseskunit.warehouse_id|"2"|
#      |$.data[0].Warehouseskunit.skunit_id|"1"|
#      |$.data[0].Warehouseskunit.skunits.skucode|DB:skunits:skucode: id=1|
#      |$.data[0].Warehouseskunit.warehouses.erp_id|DB:warehouses:erp_id: id=1|
#      |$.data[0].Warehouseskunit.id|DB:warehouseskunits:id: warehouse_id=1|
#      |$.data[0].Warehouseskunit.mrp|DB:warehouseskunits:mrp: warehouse_id=1|
#      |$.data[0].Warehouseskunit.price|DB:warehouseskunits:price: warehouse_id=1|

#  @Positive @DataValidation
#  Scenario: Validate warehouse SK unit list with empty result for non-existent warehouse
#    And I send the GET request to "warehouse_skunit_list" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|999|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|fetched successfully|
#      |$.data|[{"Warehouseskunit":{"id":"1","warehouse_id":"2","skunit_id":"1","mrp":"11.00000","price":"2.00000","vat":"5.00000","minprice":"0.00000","maxprice":"0.00000","minmargin":"0.00000","maxmargin":"0.00000","batch_id":null,"entitytype":"","entitytype_id":"0","warehouses":{"erp_id":"trp133"},"batch":{"id":null,"name":null},"skunits":{"skucode":"Cuba"}}},{"Warehouseskunit":{"id":"2","warehouse_id":"1","skunit_id":"3","mrp":"24.00000","price":"22.20000","vat":"6.00000","minprice":"0.00000","maxprice":"0.00000","minmargin":"0.00000","maxmargin":"0.00000","batch_id":null,"entitytype":"","entitytype_id":"0","warehouses":{"erp_id":"trp123"},"batch":{"id":null,"name":null},"skunits":{"skucode":"Fanta"}}},{"Warehouseskunit":{"id":"3","warehouse_id":"1","skunit_id":"4","mrp":"30.00000","price":"1.40000","vat":"7.00000","minprice":"0.00000","maxprice":"0.00000","minmargin":"0.00000","maxmargin":"0.00000","batch_id":null,"entitytype":"","entitytype_id":"0","warehouses":{"erp_id":"trp123"},"batch":{"id":null,"name":null},"skunits":{"skucode":"Slice"}}},{"Warehouseskunit":{"id":"4","warehouse_id":"1","skunit_id":"6","mrp":"10.00000","price":"2.89000","vat":"6.00000","minprice":"0.00000","maxprice":"0.00000","minmargin":"0.00000","maxmargin":"0.00000","batch_id":null,"entitytype":"","entitytype_id":"0","warehouses":{"erp_id":"trp123"},"batch":{"id":null,"name":null},"skunits":{"skucode":"6"}}},{"Warehouseskunit":{"id":"5","warehouse_id":"2","skunit_id":"6","mrp":"10.00000","price":"3.90000","vat":"6.00000","minprice":"0.00000","maxprice":"0.00000","minmargin":"0.00000","maxmargin":"0.00000","batch_id":null,"entitytype":"","entitytype_id":"0","warehouses":{"erp_id":"trp133"},"batch":{"id":null,"name":null},"skunits":{"skucode":"6"}}},{"Warehouseskunit":{"id":"6","warehouse_id":"4","skunit_id":"6","mrp":"10.00000","price":"11.00000","vat":"6.00000","minprice":"0.00000","maxprice":"0.00000","minmargin":"0.00000","maxmargin":"0.00000","batch_id":null,"entitytype":"","entitytype_id":"0","warehouses":{"erp_id":""},"batch":{"id":null,"name":null},"skunits":{"skucode":"6"}}},{"Warehouseskunit":{"id":"8","warehouse_id":"4","skunit_id":"4","mrp":"30.00000","price":"35.00000","vat":"0.00000","minprice":"0.00000","maxprice":"0.00000","minmargin":"0.00000","maxmargin":"0.00000","batch_id":null,"entitytype":"","entitytype_id":"0","warehouses":{"erp_id":""},"batch":{"id":null,"name":null},"skunits":{"skucode":"Slice"}}},{"Warehouseskunit":{"id":"9","warehouse_id":"2","skunit_id":"13","mrp":"50.00000","price":"25.00000","vat":"0.00000","minprice":"0.00000","maxprice":"0.00000","minmargin":"0.00000","maxmargin":"0.00000","batch_id":null,"entitytype":"","entitytype_id":"0","warehouses":{"erp_id":"trp133"},"batch":{"id":null,"name":null},"skunits":{"skucode":"3"}}},{"Warehouseskunit":{"id":"10","warehouse_id":"2","skunit_id":"14","mrp":"50.00000","price":"35.00000","vat":"0.00000","minprice":"0.00000","maxprice":"0.00000","minmargin":"0.00000","maxmargin":"0.00000","batch_id":null,"entitytype":"","entitytype_id":"0","warehouses":{"erp_id":"trp133"},"batch":{"id":null,"name":null},"skunits":{"skucode":""}}},{"Warehouseskunit":{"id":"11","warehouse_id":"2","skunit_id":"15","mrp":"50.00000","price":"35.00000","vat":"0.00000","minprice":"0.00000","maxprice":"0.00000","minmargin":"0.00000","maxmargin":"0.00000","batch_id":null,"entitytype":"","entitytype_id":"0","warehouses":{"erp_id":"trp133"},"batch":{"id":null,"name":null},"skunits":{"skucode":""}}},{"Warehouseskunit":{"id":"12","warehouse_id":"2","skunit_id":"16","mrp":"50.00000","price":"40.00000","vat":"0.00000","minprice":"0.00000","maxprice":"0.00000","minmargin":"0.00000","maxmargin":"0.00000","batch_id":null,"entitytype":"","entitytype_id":"0","warehouses":{"erp_id":"trp133"},"batch":{"id":null,"name":null},"skunits":{"skucode":""}}},{"Warehouseskunit":{"id":"13","warehouse_id":"2","skunit_id":"18","mrp":"15.00000","price":"11.00000","vat":"0.00000","minprice":"0.00000","maxprice":"0.00000","minmargin":"0.00000","maxmargin":"0.00000","batch_id":null,"entitytype":"","entitytype_id":"0","warehouses":{"erp_id":"trp133"},"batch":{"id":null,"name":null},"skunits":{"skucode":""}}},{"Warehouseskunit":{"id":"14","warehouse_id":"3","skunit_id":"18","mrp":"15.00000","price":"11.00000","vat":"0.00000","minprice":"0.00000","maxprice":"0.00000","minmargin":"0.00000","maxmargin":"0.00000","batch_id":null,"entitytype":"","entitytype_id":"0","warehouses":{"erp_id":""},"batch":{"id":null,"name":null},"skunits":{"skucode":""}}},{"Warehouseskunit":{"id":"15","warehouse_id":"4","skunit_id":"18","mrp":"15.00000","price":"11.00000","vat":"0.00000","minprice":"0.00000","maxprice":"0.00000","minmargin":"0.00000","maxmargin":"0.00000","batch_id":null,"entitytype":"","entitytype_id":"0","warehouses":{"erp_id":""},"batch":{"id":null,"name":null},"skunits":{"skucode":""}}},{"Warehouseskunit":{"id":"16","warehouse_id":"7","skunit_id":"18","mrp":"15.00000","price":"11.00000","vat":"0.00000","minprice":"0.00000","maxprice":"0.00000","minmargin":"0.00000","maxmargin":"0.00000","batch_id":null,"entitytype":"","entitytype_id":"0","warehouses":{"erp_id":"0"},"batch":{"id":null,"name":null},"skunits":{"skucode":""}}},{"Warehouseskunit":{"id":"17","warehouse_id":"8","skunit_id":"18","mrp":"15.00000","price":"11.00000","vat":"0.00000","minprice":"0.00000","maxprice":"0.00000","minmargin":"0.00000","maxmargin":"0.00000","batch_id":null,"entitytype":"","entitytype_id":"0","warehouses":{"erp_id":"0"},"batch":{"id":null,"name":null},"skunits":{"skucode":""}}},{"Warehouseskunit":{"id":"18","warehouse_id":"9","skunit_id":"18","mrp":"15.00000","price":"11.00000","vat":"0.00000","minprice":"0.00000","maxprice":"0.00000","minmargin":"0.00000","maxmargin":"0.00000","batch_id":null,"entitytype":"","entitytype_id":"0","warehouses":{"erp_id":"0"},"batch":{"id":null,"name":null},"skunits":{"skucode":""}}},{"Warehouseskunit":{"id":"19","warehouse_id":"10","skunit_id":"18","mrp":"15.00000","price":"11.00000","vat":"0.00000","minprice":"0.00000","maxprice":"0.00000","minmargin":"0.00000","maxmargin":"0.00000","batch_id":null,"entitytype":"","entitytype_id":"0","warehouses":{"erp_id":"s12345"},"batch":{"id":null,"name":null},"skunits":{"skucode":""}}},{"Warehouseskunit":{"id":"20","warehouse_id":"11","skunit_id":"18","mrp":"15.00000","price":"11.00000","vat":"0.00000","minprice":"0.00000","maxprice":"0.00000","minmargin":"0.00000","maxmargin":"0.00000","batch_id":null,"entitytype":"","entitytype_id":"0","warehouses":{"erp_id":"0"},"batch":{"id":null,"name":null},"skunits":{"skucode":""}}},{"Warehouseskunit":{"id":"21","warehouse_id":"12","skunit_id":"18","mrp":"15.00000","price":"11.00000","vat":"0.00000","minprice":"0.00000","maxprice":"0.00000","minmargin":"0.00000","maxmargin":"0.00000","batch_id":null,"entitytype":"","entitytype_id":"0","warehouses":{"erp_id":"0"},"batch":{"id":null,"name":null},"skunits":{"skucode":""}}},{"Warehouseskunit":{"id":"22","warehouse_id":"28","skunit_id":"18","mrp":"15.00000","price":"11.00000","vat":"0.00000","minprice":"0.00000","maxprice":"0.00000","minmargin":"0.00000","maxmargin":"0.00000","batch_id":null,"entitytype":"","entitytype_id":"0","warehouses":{"erp_id":"0"},"batch":{"id":null,"name":null},"skunits":{"skucode":""}}},{"Warehouseskunit":{"id":"23","warehouse_id":"1","skunit_id":"1","mrp":"28.00000","price":"25.00000","vat":"0.00000","minprice":"0.00000","maxprice":"0.00000","minmargin":"0.00000","maxmargin":"0.00000","batch_id":null,"entitytype":"","entitytype_id":"0","warehouses":{"erp_id":"trp123"},"batch":{"id":null,"name":null},"skunits":{"skucode":"Cuba"}}},{"Warehouseskunit":{"id":"24","warehouse_id":"1","skunit_id":"3","mrp":"71.81000","price":"743.06000","vat":"6.00000","minprice":"0.00000","maxprice":"0.00000","minmargin":"0.00000","maxmargin":"0.00000","batch_id":null,"entitytype":"warehouses","entitytype_id":"1","warehouses":{"erp_id":"trp123"},"batch":{"id":null,"name":null},"skunits":{"skucode":"Fanta"}}},{"Warehouseskunit":{"id":"25","warehouse_id":"2","skunit_id":"5","mrp":"71.81000","price":"722.03000","vat":"3.00000","minprice":"0.00000","maxprice":"0.00000","minmargin":"0.00000","maxmargin":"0.00000","batch_id":null,"entitytype":"warehouses","entitytype_id":"2","warehouses":{"erp_id":"trp133"},"batch":{"id":null,"name":null},"skunits":{"skucode":"Lays"}}},{"Warehouseskunit":{"id":"26","warehouse_id":"2","skunit_id":"5","mrp":"71.81000","price":"722.03000","vat":"3.00000","minprice":"0.00000","maxprice":"0.00000","minmargin":"0.00000","maxmargin":"0.00000","batch_id":null,"entitytype":"warehouses","entitytype_id":"0","warehouses":{"erp_id":"trp133"},"batch":{"id":null,"name":null},"skunits":{"skucode":"Lays"}}},{"Warehouseskunit":{"id":"27","warehouse_id":"1","skunit_id":"1","mrp":"71.81000","price":"81.90000","vat":"5.00000","minprice":"0.00000","maxprice":"0.00000","minmargin":"0.00000","maxmargin":"0.00000","batch_id":null,"entitytype":"warehouses","entitytype_id":"2","warehouses":{"erp_id":"trp123"},"batch":{"id":null,"name":null},"skunits":{"skucode":"Cuba"}}}]|

  @Positive @Performance
  Scenario: Performance test for warehouse SK unit list endpoint
     And I send the GET request to "warehouse_skunit_list" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|fetched successfully|

  @Positive @Concurrency
  Scenario: Concurrent access test for warehouse SK unit list endpoint
     And I send the GET request to "warehouse_skunit_list" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|fetched successfully|

#  @Negative @Validation
#  Scenario: Get warehouse SK unit list with invalid warehouse ID format
#    And I send the GET request to "warehouse_skunit_list" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|invalid_id|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|data not found|

  @Negative @Validation
  Scenario: Get warehouse SK unit list with negative warehouse ID
    And I send the GET request to "warehouse_skunit_list" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|data not found|

#  @Negative @Validation
#  Scenario: Get warehouse SK unit list with zero warehouse ID
#    And I send the GET request to "warehouse_skunit_list" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|0|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|data not found|

#  @Negative @Validation
#  Scenario: Get warehouse SK unit list with very large warehouse ID
#
#    And I send the GET request to "warehouse_skunit_list" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|999999999|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|fetched successfully|
#      |$.data|[{"Warehouseskunit":{"id":"1","warehouse_id":"2","skunit_id":"1","mrp":"11.00000","price":"2.00000","vat":"5.00000","minprice":"0.00000","maxprice":"0.00000","minmargin":"0.00000","maxmargin":"0.00000","batch_id":null,"entitytype":"","entitytype_id":"0","warehouses":{"erp_id":"trp133"},"batch":{"id":null,"name":null},"skunits":{"skucode":"Cuba"}}},{"Warehouseskunit":{"id":"2","warehouse_id":"1","skunit_id":"3","mrp":"24.00000","price":"22.20000","vat":"6.00000","minprice":"0.00000","maxprice":"0.00000","minmargin":"0.00000","maxmargin":"0.00000","batch_id":null,"entitytype":"","entitytype_id":"0","warehouses":{"erp_id":"trp123"},"batch":{"id":null,"name":null},"skunits":{"skucode":"Fanta"}}},{"Warehouseskunit":{"id":"3","warehouse_id":"1","skunit_id":"4","mrp":"30.00000","price":"1.40000","vat":"7.00000","minprice":"0.00000","maxprice":"0.00000","minmargin":"0.00000","maxmargin":"0.00000","batch_id":null,"entitytype":"","entitytype_id":"0","warehouses":{"erp_id":"trp123"},"batch":{"id":null,"name":null},"skunits":{"skucode":"Slice"}}},{"Warehouseskunit":{"id":"4","warehouse_id":"1","skunit_id":"6","mrp":"10.00000","price":"2.89000","vat":"6.00000","minprice":"0.00000","maxprice":"0.00000","minmargin":"0.00000","maxmargin":"0.00000","batch_id":null,"entitytype":"","entitytype_id":"0","warehouses":{"erp_id":"trp123"},"batch":{"id":null,"name":null},"skunits":{"skucode":"6"}}},{"Warehouseskunit":{"id":"5","warehouse_id":"2","skunit_id":"6","mrp":"10.00000","price":"3.90000","vat":"6.00000","minprice":"0.00000","maxprice":"0.00000","minmargin":"0.00000","maxmargin":"0.00000","batch_id":null,"entitytype":"","entitytype_id":"0","warehouses":{"erp_id":"trp133"},"batch":{"id":null,"name":null},"skunits":{"skucode":"6"}}},{"Warehouseskunit":{"id":"6","warehouse_id":"4","skunit_id":"6","mrp":"10.00000","price":"11.00000","vat":"6.00000","minprice":"0.00000","maxprice":"0.00000","minmargin":"0.00000","maxmargin":"0.00000","batch_id":null,"entitytype":"","entitytype_id":"0","warehouses":{"erp_id":""},"batch":{"id":null,"name":null},"skunits":{"skucode":"6"}}},{"Warehouseskunit":{"id":"8","warehouse_id":"4","skunit_id":"4","mrp":"30.00000","price":"35.00000","vat":"0.00000","minprice":"0.00000","maxprice":"0.00000","minmargin":"0.00000","maxmargin":"0.00000","batch_id":null,"entitytype":"","entitytype_id":"0","warehouses":{"erp_id":""},"batch":{"id":null,"name":null},"skunits":{"skucode":"Slice"}}},{"Warehouseskunit":{"id":"9","warehouse_id":"2","skunit_id":"13","mrp":"50.00000","price":"25.00000","vat":"0.00000","minprice":"0.00000","maxprice":"0.00000","minmargin":"0.00000","maxmargin":"0.00000","batch_id":null,"entitytype":"","entitytype_id":"0","warehouses":{"erp_id":"trp133"},"batch":{"id":null,"name":null},"skunits":{"skucode":"3"}}},{"Warehouseskunit":{"id":"10","warehouse_id":"2","skunit_id":"14","mrp":"50.00000","price":"35.00000","vat":"0.00000","minprice":"0.00000","maxprice":"0.00000","minmargin":"0.00000","maxmargin":"0.00000","batch_id":null,"entitytype":"","entitytype_id":"0","warehouses":{"erp_id":"trp133"},"batch":{"id":null,"name":null},"skunits":{"skucode":""}}},{"Warehouseskunit":{"id":"11","warehouse_id":"2","skunit_id":"15","mrp":"50.00000","price":"35.00000","vat":"0.00000","minprice":"0.00000","maxprice":"0.00000","minmargin":"0.00000","maxmargin":"0.00000","batch_id":null,"entitytype":"","entitytype_id":"0","warehouses":{"erp_id":"trp133"},"batch":{"id":null,"name":null},"skunits":{"skucode":""}}},{"Warehouseskunit":{"id":"12","warehouse_id":"2","skunit_id":"16","mrp":"50.00000","price":"40.00000","vat":"0.00000","minprice":"0.00000","maxprice":"0.00000","minmargin":"0.00000","maxmargin":"0.00000","batch_id":null,"entitytype":"","entitytype_id":"0","warehouses":{"erp_id":"trp133"},"batch":{"id":null,"name":null},"skunits":{"skucode":""}}},{"Warehouseskunit":{"id":"13","warehouse_id":"2","skunit_id":"18","mrp":"15.00000","price":"11.00000","vat":"0.00000","minprice":"0.00000","maxprice":"0.00000","minmargin":"0.00000","maxmargin":"0.00000","batch_id":null,"entitytype":"","entitytype_id":"0","warehouses":{"erp_id":"trp133"},"batch":{"id":null,"name":null},"skunits":{"skucode":""}}},{"Warehouseskunit":{"id":"14","warehouse_id":"3","skunit_id":"18","mrp":"15.00000","price":"11.00000","vat":"0.00000","minprice":"0.00000","maxprice":"0.00000","minmargin":"0.00000","maxmargin":"0.00000","batch_id":null,"entitytype":"","entitytype_id":"0","warehouses":{"erp_id":""},"batch":{"id":null,"name":null},"skunits":{"skucode":""}}},{"Warehouseskunit":{"id":"15","warehouse_id":"4","skunit_id":"18","mrp":"15.00000","price":"11.00000","vat":"0.00000","minprice":"0.00000","maxprice":"0.00000","minmargin":"0.00000","maxmargin":"0.00000","batch_id":null,"entitytype":"","entitytype_id":"0","warehouses":{"erp_id":""},"batch":{"id":null,"name":null},"skunits":{"skucode":""}}},{"Warehouseskunit":{"id":"16","warehouse_id":"7","skunit_id":"18","mrp":"15.00000","price":"11.00000","vat":"0.00000","minprice":"0.00000","maxprice":"0.00000","minmargin":"0.00000","maxmargin":"0.00000","batch_id":null,"entitytype":"","entitytype_id":"0","warehouses":{"erp_id":"0"},"batch":{"id":null,"name":null},"skunits":{"skucode":""}}},{"Warehouseskunit":{"id":"17","warehouse_id":"8","skunit_id":"18","mrp":"15.00000","price":"11.00000","vat":"0.00000","minprice":"0.00000","maxprice":"0.00000","minmargin":"0.00000","maxmargin":"0.00000","batch_id":null,"entitytype":"","entitytype_id":"0","warehouses":{"erp_id":"0"},"batch":{"id":null,"name":null},"skunits":{"skucode":""}}},{"Warehouseskunit":{"id":"18","warehouse_id":"9","skunit_id":"18","mrp":"15.00000","price":"11.00000","vat":"0.00000","minprice":"0.00000","maxprice":"0.00000","minmargin":"0.00000","maxmargin":"0.00000","batch_id":null,"entitytype":"","entitytype_id":"0","warehouses":{"erp_id":"0"},"batch":{"id":null,"name":null},"skunits":{"skucode":""}}},{"Warehouseskunit":{"id":"19","warehouse_id":"10","skunit_id":"18","mrp":"15.00000","price":"11.00000","vat":"0.00000","minprice":"0.00000","maxprice":"0.00000","minmargin":"0.00000","maxmargin":"0.00000","batch_id":null,"entitytype":"","entitytype_id":"0","warehouses":{"erp_id":"s12345"},"batch":{"id":null,"name":null},"skunits":{"skucode":""}}},{"Warehouseskunit":{"id":"20","warehouse_id":"11","skunit_id":"18","mrp":"15.00000","price":"11.00000","vat":"0.00000","minprice":"0.00000","maxprice":"0.00000","minmargin":"0.00000","maxmargin":"0.00000","batch_id":null,"entitytype":"","entitytype_id":"0","warehouses":{"erp_id":"0"},"batch":{"id":null,"name":null},"skunits":{"skucode":""}}},{"Warehouseskunit":{"id":"21","warehouse_id":"12","skunit_id":"18","mrp":"15.00000","price":"11.00000","vat":"0.00000","minprice":"0.00000","maxprice":"0.00000","minmargin":"0.00000","maxmargin":"0.00000","batch_id":null,"entitytype":"","entitytype_id":"0","warehouses":{"erp_id":"0"},"batch":{"id":null,"name":null},"skunits":{"skucode":""}}},{"Warehouseskunit":{"id":"22","warehouse_id":"28","skunit_id":"18","mrp":"15.00000","price":"11.00000","vat":"0.00000","minprice":"0.00000","maxprice":"0.00000","minmargin":"0.00000","maxmargin":"0.00000","batch_id":null,"entitytype":"","entitytype_id":"0","warehouses":{"erp_id":"0"},"batch":{"id":null,"name":null},"skunits":{"skucode":""}}},{"Warehouseskunit":{"id":"23","warehouse_id":"1","skunit_id":"1","mrp":"28.00000","price":"25.00000","vat":"0.00000","minprice":"0.00000","maxprice":"0.00000","minmargin":"0.00000","maxmargin":"0.00000","batch_id":null,"entitytype":"","entitytype_id":"0","warehouses":{"erp_id":"trp123"},"batch":{"id":null,"name":null},"skunits":{"skucode":"Cuba"}}},{"Warehouseskunit":{"id":"24","warehouse_id":"1","skunit_id":"3","mrp":"71.81000","price":"743.06000","vat":"6.00000","minprice":"0.00000","maxprice":"0.00000","minmargin":"0.00000","maxmargin":"0.00000","batch_id":null,"entitytype":"warehouses","entitytype_id":"1","warehouses":{"erp_id":"trp123"},"batch":{"id":null,"name":null},"skunits":{"skucode":"Fanta"}}},{"Warehouseskunit":{"id":"25","warehouse_id":"2","skunit_id":"5","mrp":"71.81000","price":"722.03000","vat":"3.00000","minprice":"0.00000","maxprice":"0.00000","minmargin":"0.00000","maxmargin":"0.00000","batch_id":null,"entitytype":"warehouses","entitytype_id":"2","warehouses":{"erp_id":"trp133"},"batch":{"id":null,"name":null},"skunits":{"skucode":"Lays"}}},{"Warehouseskunit":{"id":"26","warehouse_id":"2","skunit_id":"5","mrp":"71.81000","price":"722.03000","vat":"3.00000","minprice":"0.00000","maxprice":"0.00000","minmargin":"0.00000","maxmargin":"0.00000","batch_id":null,"entitytype":"warehouses","entitytype_id":"0","warehouses":{"erp_id":"trp133"},"batch":{"id":null,"name":null},"skunits":{"skucode":"Lays"}}},{"Warehouseskunit":{"id":"27","warehouse_id":"1","skunit_id":"1","mrp":"71.81000","price":"81.90000","vat":"5.00000","minprice":"0.00000","maxprice":"0.00000","minmargin":"0.00000","maxmargin":"0.00000","batch_id":null,"entitytype":"warehouses","entitytype_id":"2","warehouses":{"erp_id":"trp123"},"batch":{"id":null,"name":null},"skunits":{"skucode":"Cuba"}}}]|


  @Negative @Security
  Scenario: Get warehouse SK unit list with XSS attempt in warehouse ID

    And I send the GET request to "warehouse_skunit_list" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|data not found|

  @Negative @Boundary
  Scenario: Get warehouse SK unit list with boundary warehouse ID value
     And I send the GET request to "warehouse_skunit_list" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|fetched successfully|

#  @Negative @ErrorHandling
#  Scenario: Get warehouse SK unit list with invalid endpoint
#    And I send the GET request to "warehouse_skunit_list_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "404"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

#  @Positive @BusinessLogic
#  Scenario: Validate warehouse SK unit list business logic
#     And I send the GET request to "warehouse_skunit_list" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|fetched successfully|
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.data[0].Warehouseskunit.warehouse_id|"2"|
#      |$.data[0].Warehouseskunit.skunits.skucode|DB:skunits:skucode: id=1|
#      |$.data[0].Warehouseskunit.warehouses.erp_id|DB:warehouses:erp_id: id=1|

  @Positive @DataIntegrity
  Scenario: Validate warehouse SK unit list data integrity
     And I send the GET request to "warehouse_skunit_list" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|fetched successfully|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data[0].Warehouseskunit.id|string|
      |$.data[0].Warehouseskunit.warehouse_id|string|
      |$.data[0].Warehouseskunit.skunit_id|string|
      |$.data[0].Warehouseskunit.mrp|string|
      |$.data[0].Warehouseskunit.price|string|
      |$.data[0].Warehouseskunit.vat|string|

