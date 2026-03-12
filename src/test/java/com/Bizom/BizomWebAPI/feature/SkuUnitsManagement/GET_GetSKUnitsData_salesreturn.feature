@BizomWebAPI @SkuUnitsManagement @SkuUnitsSaleReturn @ProductManagement @OS
Feature: Get SKU Units Data Sales Return API Testing
  As a system user
  I want to test the get SKU units data for sales return endpoint
  So that I can ensure proper functionality and data retrieval for SKU units data in sales return context

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get SKU units data sales return without access token
    When I send the GET request to "skunits_get_sku_units_data_salesreturn" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |draw|1|||
      |start|0|||
      |length|10|||
      |skunit_type|2|||
      |||param1|2|
      |||param2|1|
      |||param3|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get SKU units data sales return with invalid access token
    And I send the GET request to "skunits_get_sku_units_data_salesreturn" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|||
      |draw|1|||
      |start|0|||
      |length|10|||
      |skunit_type|2|||
      |||param1|2|
      |||param2|1|
      |||param3|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get SKU units data sales return with expired access token
    And I send the GET request to "skunits_get_sku_units_data_salesreturn" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|||
      |draw|1|||
      |start|0|||
      |length|10|||
      |skunit_type|2|||
      |||param1|2|
      |||param2|1|
      |||param3|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get SKU units data sales return with malformed access token
    And I send the GET request to "skunits_get_sku_units_data_salesreturn" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|||
      |draw|1|||
      |start|0|||
      |length|10|||
      |skunit_type|2|||
      |||param1|2|
      |||param2|1|
      |||param3|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get SKU units data sales return with valid access token
    And I send the GET request to "skunits_get_sku_units_data_salesreturn" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|||
      |draw|1|||
      |start|0|||
      |length|10|||
      |skunit_type|2|||
      |||param1|2|
      |||param2|1|
      |||param3|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|"1"|
      |$.data[0].sku_id|"1"|
      |$.data[0].sku_code|"Cuba"|
      |$.data[0].sku_name|"Cafe Cuba"|
    And I store the response as "getSKUnitsData_salesreturn_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate SKU units data sales return response structure
    And I send the GET request to "skunits_get_sku_units_data_salesreturn" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|||
      |draw|1|||
      |start|0|||
      |length|10|||
      |skunit_type|2|||
      |||param1|2|
      |||param2|1|
      |||param3|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verifies the field is present in the response
      |JPath|
      |$.draw|
      |$.recordsTotal|
      |$.recordsFiltered|
      |$.data|
      |$.data[0].sku_id|
      |$.data[0].sku_code|
      |$.data[0].sku_name|
      |$.data[0].sku_description|
      |$.data[0].sku_mrp|
      |$.data[0].sku_price|
      |$.data[0].unitspercase|
      |$.data[0].gst|
      |$.data[0].brand_id|
      |$.data[0].Batch|
      |$.data[0].Batch.0|
      |$.data[0].Batch.0.available_inventory|
      |$.data[0].Batch.0.total_inventory|
    And I store the response as "getSKUnitsData_salesreturn_response" name using full path

  @Positive @DataValidation
  Scenario: TC_07 Validate SKU units data sales return data types
    And I send the GET request to "skunits_get_sku_units_data_salesreturn" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|||
      |draw|1|||
      |start|0|||
      |length|10|||
      |skunit_type|2|||
      |||param1|2|
      |||param2|1|
      |||param3|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.data|array|
      |$.data[0].sku_id|string|
      |$.data[0].sku_code|string|
      |$.data[0].sku_name|string|
      |$.data[0].sku_description|string|
      |$.data[0].sku_mrp|string|
      |$.data[0].sku_price|string|
      |$.data[0].unitspercase|string|
      |$.data[0].gst|string|
      |$.data[0].brand_id|string|
      |$.data[0].Batch|object|
      |$.data[0].Batch.0.available_inventory|string|
      |$.data[0].Batch.0.total_inventory|string|
    And I store the response as "getSKUnitsData_salesreturn_response" name using full path

  @Positive @Functional
  Scenario: TC_08 Get SKU units data sales return with different pagination values
    And I send the GET request to "skunits_get_sku_units_data_salesreturn" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|||
      |draw|1|||
      |start|10|||
      |length|20|||
      |skunit_type|2|||
      |||param1|2|
      |||param2|1|
      |||param3|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "getSKUnitsData_salesreturn_response" name using full path

  @Positive @Functional
  Scenario: TC_09 Get SKU units data sales return with different path parameters
    And I send the GET request to "skunits_get_sku_units_data_salesreturn" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|||
      |draw|1|||
      |start|0|||
      |length|10|||
      |skunit_type|2|||
      |||param1|2|
      |||param2|1|
      |||param3|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "getSKUnitsData_salesreturn_response" name using full path

  @Negative @Validation
  Scenario: TC_10 Get SKU units data sales return with invalid path parameter format
    And I send the GET request to "skunits_get_sku_units_data_salesreturn" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|||
      |draw|1|||
      |start|0|||
      |length|10|||
      |skunit_type|2|||
      |||param1|invalid|
      |||param2|1|
      |||param3|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "getSKUnitsData_salesreturn_response" name using full path

  @Negative @Validation
  Scenario: TC_11 Get SKU units data sales return with invalid skunit_type
    And I send the GET request to "skunits_get_sku_units_data_salesreturn" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|||
      |draw|1|||
      |start|0|||
      |length|10|||
      |skunit_type|999|||
      |||param1|2|
      |||param2|1|
      |||param3|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "getSKUnitsData_salesreturn_response" name using full path

  @Negative @ErrorHandling
  Scenario: TC_12 Get SKU units data sales return with invalid endpoint
    And I send the GET request to "skunits_get_sku_units_data_salesreturn_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|||
      |draw|1|||
      |start|0|||
      |length|10|||
      |skunit_type|2|||
      |||param1|2|
      |||param2|1|
      |||param3|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: TC_13  Performance test for get SKU units data sales return endpoint
    And I send the GET request to "skunits_get_sku_units_data_salesreturn" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|||
      |draw|1|||
      |start|0|||
      |length|10|||
      |skunit_type|2|||
      |||param1|2|
      |||param2|1|
      |||param3|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I store the response as "getSKUnitsData_salesreturn_response" name using full path

  @Positive @DataValidation
  Scenario: TC_14 Validate SKU units data sales return response with expected values
    And I send the GET request to "skunits_get_sku_units_data_salesreturn" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|||
      |draw|1|||
      |start|0|||
      |length|10|||
      |skunit_type|2|||
      |||param1|2|
      |||param2|1|
      |||param3|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|"1"|
      |$.data[0].sku_id|"1"|
      |$.data[0].sku_code|"Cuba"|
      |$.data[0].sku_name|"Cafe Cuba"|
      |$.data[0].sku_description|""|
      |$.data[0].sku_mrp|"28.00000"|
      |$.data[0].sku_price|"25.00000"|
      |$.data[0].unitspercase|"24"|
      |$.data[0].gst|"5.00"|
      |$.data[0].brand_id|"1"|
      |$.data[0].active|"1"|
    And I store the response as "getSKUnitsData_salesreturn_response" name using full path

  @DBvalidation
  Scenario: TC_15 Get SKU units data sales return - verify response data with DB
    And I send the GET request to "skunits_get_sku_units_data_salesreturn" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|||
      |draw|1|||
      |start|0|||
      |length|10|||
      |skunit_type|2|||
      |||param1|2|
      |||param2|1|
      |||param3|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|"1"|
      |$.data[0].sku_id|"1"|
      |$.data[0].sku_code|"Cuba"|
      |$.data[0].sku_name|"Cafe Cuba"|
      |$.data[0].sku_mrp|"28.00000"|
      |$.data[0].sku_price|"25.00000"|
      |$.data[0].unitspercase|"24"|
      |$.data[0].gst|"5.00"|
      |$.data[0].brand_id|"1"|
      |$.data[0].active|"1"|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.data[0].sku_code|DB:skunits:skucode: id=1 LIMIT 1|
      |$.data[0].sku_name|DB:skunits:name: id=1 LIMIT 1|

