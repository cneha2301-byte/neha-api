@BizomWebAPI @OS @InventoriesManagement @GetSearchedSKUData
Feature: Get Searched SKU Data API Testing
  As a system user
  I want to test the getSearchedSKUData endpoint
  So that I can ensure proper functionality and data retrieval for searched SKU data

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
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
  Scenario: TC_01 Get searched SKU data without access token
    When I send the GET request to "inventories_get_searched_sku_data" endpoint with path parameters
      |Path|Value|
      |param1|3|
      |param2|1|
      |param3|1|
      |param4|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get searched SKU data with invalid access token
    And I send the GET request to "inventories_get_searched_sku_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|param1|3|
      |||param2|1|
      |||param3|1|
      |||param4|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get searched SKU data with expired access token
    And I send the GET request to "inventories_get_searched_sku_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|param1|3|
      |||param2|1|
      |||param3|1|
      |||param4|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get searched SKU data with malformed access token
    And I send the GET request to "inventories_get_searched_sku_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|param1|3|
      |||param2|1|
      |||param3|1|
      |||param4|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get searched SKU data with valid request
    And I send the GET request to "inventories_get_searched_sku_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|param1|3|
      |||param2|1|
      |||param3|1|
      |||param4|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|Data found!|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|object|
      |$.data.skunitsData|object|
      |$.data.skunitsData.3|object|
      |$.data.skunitsData.3.skucode|string|
      |$.data.skunitsData.3.availableInventory|number|
      |$.data.skunitsData.3.skuprice|string|
      |$.data.skunitsData.3.gst|string|
      |$.data.skunitsData.3.cess|string|
      |$.data.skunitsData.3.Batch|array|
      |$.data.skunitsData.3.BPrice|array|
      |$.data.skunitsData.3.BPrice[0]|object|
      |$.data.skunitsData.3.BPrice[0].mrp|string|
      |$.data.skunitsData.3.BPrice[0].price|string|
    And I store the response as "get_searched_sku_data_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate searched SKU data response structure
    And I send the GET request to "inventories_get_searched_sku_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|param1|3|
      |||param2|1|
      |||param3|1|
      |||param4|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|Data found!|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|object|
      |$.data.skunitsData|object|
      |$.data.skunitsData.3|object|
      |$.data.skunitsData.3.skudetails|array|
      |$.data.skunitsData.3.skudetails[0]|object|
      |$.data.skunitsData.3.skudetails[0].skuid|string|
      |$.data.skunitsData.3.skudetails[0].skuname|string|
      |$.data.skunitsData.3.skudetails[0].skucode|string|
      |$.data.skunitsData.3.skudetails[0].amountwithoutgst|number|
      |$.data.skunitsData.3.skudetails[0].quantity|string|
      |$.data.skunitsData.3.skudetails[0].unitpricewithoutgst|number|
      |$.data.skunitsData.3.skudetails[0].gstpercent|number|
      |$.data.skunitsData.3.skudetails[0].gstamount|number|

  @Positive @Performance
  Scenario: TC_07 Performance test for get searched SKU data endpoint
    And I send the GET request to "inventories_get_searched_sku_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|param1|3|
      |||param2|1|
      |||param3|1|
      |||param4|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Positive @Functional
  Scenario: TC_08 Validate searched SKU data completeness
    And I send the GET request to "inventories_get_searched_sku_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|param1|3|
      |||param2|1|
      |||param3|1|
      |||param4|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|Data found!|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data.skunitsData|object|
      |$.data.skunitsData.3|object|
      |$.data.skunitsData.3.Batch|array|
      |$.data.skunitsData.3.BPrice|array|
    And validating the response contains the following values
      |Value|
      |result|
      |reason|
      |data|
      |skunitsData|
      |skucode|
      |availableInventory|
      |skuprice|

  @Negative @Validation
  Scenario: TC_09 Get searched SKU data with invalid path parameter
    And I send the GET request to "inventories_get_searched_sku_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|param1|abc|
      |||param2|1|
      |||param3|1|
      |||param4|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|

  @Negative @ErrorHandling
  Scenario: TC_10 Get searched SKU data with invalid endpoint
    And I send the GET request to "inventories_get_searched_sku_data_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|param1|3|
      |||param2|1|
      |||param3|1|
      |||param4|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @ObjectValidation
  Scenario: TC_11 Validate searched SKU data object structure and data types
    And I send the GET request to "inventories_get_searched_sku_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|param1|3|
      |||param2|1|
      |||param3|1|
      |||param4|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|object|
      |$.data.skunitsData|object|
      |$.data.skunitsData.3|object|
      |$.data.skunitsData.3.skucode|string|
      |$.data.skunitsData.3.availableInventory|number|
      |$.data.skunitsData.3.Batch|array|
      |$.data.skunitsData.3.BPrice|array|
      |$.data.skunitsData.3.BPrice[0]|object|
      |$.data.skunitsData.3.BPrice[0].mrp|string|
      |$.data.skunitsData.3.BPrice[0].price|string|

  @Positive @ContentValidation
  Scenario: TC_12 Validate searched SKU data response contains mandatory keys
    And I send the GET request to "inventories_get_searched_sku_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|param1|3|
      |||param2|1|
      |||param3|1|
      |||param4|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |result|
      |reason|
      |data|
      |skunitsData|
      |skucode|
      |availableInventory|
      |skuprice|
      |Batch|
      |BPrice|

  @Positive @ParameterVariation
  Scenario: TC_13 Get searched SKU data with different search parameters
    And I send the GET request to "inventories_get_searched_sku_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|param1|1|
      |||param2|2|
      |||param3|3|
      |||param4|4|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|object|
      |$.data.skunitsData|object|

