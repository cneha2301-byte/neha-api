@BizomWebAPI @CE @OutletsManagement @LastSalePriceOfSku @InventoryOperations
Feature: Get Last Sale Price Of SKU API Testing
  As a system user
  I want to test the get last sale price of SKU endpoint
  So that I can ensure proper functionality and data retrieval for SKU pricing information

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get last sale price without access token
    When I send the GET request to "outlets_get_last_sale_price_of_sku" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |outletId|2|
      |warehouseId|1|
      |language|id|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get last sale price with invalid access token
    And I send the GET request to "outlets_get_last_sale_price_of_sku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
      |outletId|2|
      |warehouseId|1|
      |language|id|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get last sale price with expired access token
    And I send the GET request to "outlets_get_last_sale_price_of_sku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
      |outletId|2|
      |warehouseId|1|
      |language|id|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get last sale price with malformed access token
    And I send the GET request to "outlets_get_last_sale_price_of_sku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
      |outletId|2|
      |warehouseId|1|
      |language|id|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get last sale price with valid parameters
    And I send the GET request to "outlets_get_last_sale_price_of_sku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|"2"|
      |warehouseId|"1"|
      |language|"id"|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @DataValidation
  Scenario: TC_06 Validate last sale price response structure
    And I send the GET request to "outlets_get_last_sale_price_of_sku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|2|
      |warehouseId|1|
      |language|id|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.apiVersion|string|
      |$.last_sku_price|object|
      |$.last_sku_price.warehouse_id|string|
      |$.last_sku_price.outlet_id|string|
      |$.last_sku_price.skunits|array|
      |$.error|object|
      |$.error.code|string|
      |$.error.message|string|

  @Positive @DataValidation
  Scenario: TC_07 Validate SKU units array structure
    And I send the GET request to "outlets_get_last_sale_price_of_sku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|2|
      |warehouseId|1|
      |language|id|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.last_sku_price.warehouse_id|"1"|
      |$.last_sku_price.outlet_id|"2"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.last_sku_price.skunits|array|
      |$.last_sku_price.skunits[0].skunit_id|string|
      |$.last_sku_price.skunits[0].batch_id|string|
      |$.last_sku_price.skunits[0].price|string|

  @Positive @DataValidation
  Scenario: TC_08 Validate multiple SKU units with different batches
    And I send the GET request to "outlets_get_last_sale_price_of_sku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|2|
      |warehouseId|1|
      |language|id|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.last_sku_price.skunits|array|

  @Positive @Functional
  Scenario: TC_09 Get last sale price with different outlet and warehouse
    And I send the GET request to "outlets_get_last_sale_price_of_sku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|3|
      |warehouseId|2|
      |language|id|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.last_sku_price|array|

  @Positive @Functional
  Scenario: TC_10 Get last sale price with English language
    And I send the GET request to "outlets_get_last_sale_price_of_sku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|2|
      |warehouseId|1|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.apiVersion|"2"|

  @Positive @Performance
  Scenario: TC_11 Performance test for last sale price endpoint
    And I send the GET request to "outlets_get_last_sale_price_of_sku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|2|
      |warehouseId|1|
      |language|id|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @Validation
  Scenario: TC_12 Get last sale price without outlet ID parameter
    And I send the GET request to "outlets_get_last_sale_price_of_sku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|1|
      |language|id|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|

  @Negative @Validation
  Scenario: TC_13 Get last sale price without warehouse ID parameter
    And I send the GET request to "outlets_get_last_sale_price_of_sku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|2|
      |language|id|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|

  @Negative @Validation
  Scenario: TC_14 Get last sale price with invalid outlet ID
    And I send the GET request to "outlets_get_last_sale_price_of_sku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|abc|
      |warehouseId|1|
      |language|id|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|

  @Negative @Validation
  Scenario: TC_15 Get last sale price with special characters in query parameters
    And I send the GET request to "outlets_get_last_sale_price_of_sku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|2|
      |warehouseId|1|
      |language|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|

  @Negative @Boundary
  Scenario: TC_16 Get last sale price with maximum query parameters
    And I send the GET request to "outlets_get_last_sale_price_of_sku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|2|
      |warehouseId|1|
      |language|id|
      |param1|value1|
      |param2|value2|
      |param3|value3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @ErrorHandling
  Scenario: TC_17 Get last sale price with invalid endpoint
    And I send the GET request to "outlets_get_last_sale_price_of_sku_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|2|
      |warehouseId|1|
      |language|id|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_18 Validate last sale price business logic
    And I send the GET request to "outlets_get_last_sale_price_of_sku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|2|
      |warehouseId|1|
      |language|id|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.apiVersion|"2"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.apiVersion|string|
      |$.last_sku_price|object|
      |$.error|object|

  @Positive @Functional
  Scenario: TC_19 Validate last sale price response completeness
    And I send the GET request to "outlets_get_last_sale_price_of_sku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|2|
      |warehouseId|1|
      |language|id|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |result|
      |apiVersion|
      |last_sku_price|
      |warehouse_id|
      |outlet_id|
      |skunits|
      |skunit_id|
      |batch_id|
      |price|
      |error|

  @Positive @LoadTesting
  Scenario: TC_20 Load testing for last sale price endpoint
    And I send the GET request to "outlets_get_last_sale_price_of_sku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|2|
      |warehouseId|1|
      |language|id|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @Timeout
  Scenario: TC_21 Test last sale price endpoint timeout handling
    And I send the GET request to "outlets_get_last_sale_price_of_sku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|2|
      |warehouseId|1|
      |language|id|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Positive @EndToEnd
  Scenario: TC_22 End-to-end last sale price retrieval workflow
    And I send the GET request to "outlets_get_last_sale_price_of_sku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|2|
      |warehouseId|1|
      |language|id|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.apiVersion|"2"|
      |$.last_sku_price.warehouse_id|"1"|
      |$.last_sku_price.outlet_id|"2"|
    And I store the response as "last_sale_price_e2e_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.apiVersion|string|
      |$.last_sku_price|object|
      |$.last_sku_price.warehouse_id|string|
      |$.last_sku_price.outlet_id|string|
      |$.last_sku_price.skunits|array|
      |$.error.code|string|
      |$.error.message|string|

  @Positive @Reliability
  Scenario: TC_23 Reliability test for last sale price endpoint
    And I send the GET request to "outlets_get_last_sale_price_of_sku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|2|
      |warehouseId|1|
      |language|id|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.last_sku_price|object|
      |$.last_sku_price.skunits|array|


