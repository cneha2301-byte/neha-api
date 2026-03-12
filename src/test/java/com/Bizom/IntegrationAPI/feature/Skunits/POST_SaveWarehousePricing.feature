@SaveWarehousePricing @Sanity @All @Execution @allPost
Feature: TC5155 This feature file contains testcases for POST Save Warehouse Pricing API (/warehouseskunits/saveWarehousePricing)


  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/xml|


  @SaveWarehousePricingAPIPositive @Smoke @DBValidation
  Scenario: TC-01 Post Save Warehouse Pricing API with all valid data - Verify successful response
    And I modify fields with random values and remove fields in "POST_SaveWarehousePricing" XML payload
      |XPath                                    |Value         |
      |/Warehouseskunits/Warehouseskunit/warehouseID  |1        |
      |/Warehouseskunits/Warehouseskunit/skunitID     |6       |
      |/Warehouseskunits/Warehouseskunit/vat             |1             |
      |/Warehouseskunits/Warehouseskunit/mrp             |270           |
      |/Warehouseskunits/Warehouseskunit/price           |2.89000      |
      |/Warehouseskunits/Warehouseskunit/entitytype      |warehouses    |
      |/Warehouseskunits/Warehouseskunit/entitytype_erpid|111112        |
      |/Warehouseskunits/Warehouseskunit/minmargin       |200           |
      |/Warehouseskunits/Warehouseskunit/maxmargin       |232           |
      |/Warehouseskunits/Warehouseskunit/is_active        |1             |
    And I post the request with "POST_SaveWarehousePricing" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader              |xmlValue |
      |Response.Result            |1       |
    And verify response time is less than "2500" milliseconds
    And I store the response as "save_warehouse_pricing_response" name using xml full path
    And I verify the data got updated as needed from DB
      |expectedColumn |expectedValue |
      |DB:warehouseskunits:price:id = (SELECT MAX(id) FROM warehouseskunits WHERE warehouse_id = '1' AND skunit_id = '6') |2.89000 |




  @SaveWarehousePricingAPIPositive @DBValidation
  Scenario: TC-02 Post Save Warehouse Pricing API with valid warehouseID and skunitID
    And I modify fields with random values and remove fields in "POST_SaveWarehousePricing" XML payload
      |XPath                                    |Value         |
      |/Warehouseskunits/Warehouseskunit/warehouseID |1        |
      |/Warehouseskunits/Warehouseskunit/skunitID     |6       |
      |/Warehouseskunits/Warehouseskunit/price           |2.89000       |
      |/Warehouseskunits/Warehouseskunit/entitytype      |warehouses    |
      |/Warehouseskunits/Warehouseskunit/entitytype_erpid|111112        |
      |/Warehouseskunits/Warehouseskunit/is_active        |1             |
    And I post the request with "POST_SaveWarehousePricing" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader              |xmlValue |
      |Response.Result            |1       |
    And verify response time is less than "2500" milliseconds
    And I verify the data got updated as needed from DB
      |expectedColumn |expectedValue |
      |DB:warehouseskunits:price:id = (SELECT MAX(id) FROM warehouseskunits WHERE warehouse_id = '1' AND skunit_id = '6') |2.89000 |




  @SaveWarehousePricingAPIPositive @DBValidation
  Scenario: TC-03 Post Save Warehouse Pricing API with MRP and price values - Verify pricing fields
    And I modify fields with random values and remove fields in "POST_SaveWarehousePricing" XML payload
      |XPath                                    |Value         |
      |/Warehouseskunits/Warehouseskunit/warehouseID |1        |
      |/Warehouseskunits/Warehouseskunit/skunitID     |6       |
      |/Warehouseskunits/Warehouseskunit/mrp             |10.00000      |
      |/Warehouseskunits/Warehouseskunit/price           |2.89000        |
      |/Warehouseskunits/Warehouseskunit/entitytype      |warehouses    |
      |/Warehouseskunits/Warehouseskunit/entitytype_erpid|111112        |
      |/Warehouseskunits/Warehouseskunit/is_active        |1             |
    And I post the request with "POST_SaveWarehousePricing" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader              |xmlValue |
      |Response.Result            |1        |
    And verify response time is less than "2500" milliseconds
    And I verify the data got updated as needed from DB
      |expectedColumn |expectedValue |
      |DB:warehouseskunits:price:id = (SELECT MAX(id) FROM warehouseskunits WHERE warehouse_id = '1' AND skunit_id = '6') |2.89000 |
      |DB:warehouseskunits:mrp:id = (SELECT MAX(id) FROM warehouseskunits WHERE warehouse_id = '1' AND skunit_id = '6') |10.00000 |




  @SaveWarehousePricingAPIPositive @DBValidation
  Scenario: TC-04 Post Save Warehouse Pricing API with VAT and margin values - Verify tax calculation
    And I modify fields with random values and remove fields in "POST_SaveWarehousePricing" XML payload
      |XPath                                    |Value         |
      |/Warehouseskunits/Warehouseskunit/warehouseID |1        |
      |/Warehouseskunits/Warehouseskunit/skunitID     |6       |
      |/Warehouseskunits/Warehouseskunit/vat             |6.00000    |
      |/Warehouseskunits/Warehouseskunit/price           |2.89000        |
      |/Warehouseskunits/Warehouseskunit/entitytype      |warehouses    |
      |/Warehouseskunits/Warehouseskunit/entitytype_erpid|111112        |
      |/Warehouseskunits/Warehouseskunit/minmargin       |200           |
      |/Warehouseskunits/Warehouseskunit/maxmargin       |0.00000          |
      |/Warehouseskunits/Warehouseskunit/is_active        |1             |
    And I post the request with "POST_SaveWarehousePricing" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader              |xmlValue |
      |Response.Result            |1        |
    And verify response time is less than "2500" milliseconds
    And I verify the data got updated as needed from DB
      |expectedColumn |expectedValue |
      |DB:warehouseskunits:price:id = (SELECT MAX(id) FROM warehouseskunits WHERE warehouse_id = '1' AND skunit_id = '6') |2.89000 |
      |DB:warehouseskunits:vat:id = (SELECT MAX(id) FROM warehouseskunits WHERE warehouse_id = '1' AND skunit_id = '6') |6.00000 |
      |DB:warehouseskunits:minmargin:id = (SELECT MAX(id) FROM warehouseskunits WHERE warehouse_id = '1' AND skunit_id = '6') |0.00000|
      |DB:warehouseskunits:maxmargin:id = (SELECT MAX(id) FROM warehouseskunits WHERE warehouse_id = '1' AND skunit_id = '6') |0.00000 |




  @SaveWarehousePricingAPIPositive @DBValidation
  Scenario: TC-05 Post Save Warehouse Pricing API with margintype value - Verify margin type
    And I modify fields with random values and remove fields in "POST_SaveWarehousePricing" XML payload
      |XPath                                    |Value         |
      |/Warehouseskunits/Warehouseskunit/warehouseID |1        |
      |/Warehouseskunits/Warehouseskunit/skunitID     |6       |
      |/Warehouseskunits/Warehouseskunit/price           |2.89000        |
      |/Warehouseskunits/Warehouseskunit/entitytype      |warehouses    |
      |/Warehouseskunits/Warehouseskunit/entitytype_erpid|111112        |
      |/Warehouseskunits/Warehouseskunit/minmargin       |0.00000     |
      |/Warehouseskunits/Warehouseskunit/maxmargin       |232           |
      |/Warehouseskunits/Warehouseskunit/margintype       |percent       |
      |/Warehouseskunits/Warehouseskunit/is_active        |1             |
    And I post the request with "POST_SaveWarehousePricing" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader              |xmlValue |
      |Response.Result            |1        |
    And verify response time is less than "2500" milliseconds
    And I verify the data got updated as needed from DB
      |expectedColumn |expectedValue |
      |DB:warehouseskunits:price:id = (SELECT MAX(id) FROM warehouseskunits WHERE warehouse_id = '1' AND skunit_id = '6') |2.89000|
      |DB:warehouseskunits:minmargin:id = (SELECT MAX(id) FROM warehouseskunits WHERE warehouse_id = '1' AND skunit_id = '6') |0.00000|
      |DB:warehouseskunits:maxmargin:id = (SELECT MAX(id) FROM warehouseskunits WHERE warehouse_id = '1' AND skunit_id = '6') |0.00000 |




  @ResponseFieldValidation @FieldValidation
  Scenario: TC-06 Validate Response field - Result should be 0 for successful transaction
    And I modify fields with random values and remove fields in "POST_SaveWarehousePricing" XML payload
      |XPath                                    |Value         |
      |/Warehouseskunits/Warehouseskunit/warehouseID |1        |
      |/Warehouseskunits/Warehouseskunit/skunitID     |6       |
      |/Warehouseskunits/Warehouseskunit/price           |213.21        |
      |/Warehouseskunits/Warehouseskunit/entitytype      |warehouses    |
      |/Warehouseskunits/Warehouseskunit/entitytype_erpid|111112        |
      |/Warehouseskunits/Warehouseskunit/is_active        |1             |
    And I post the request with "POST_SaveWarehousePricing" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader   |xmlValue |
      |Response.Result |1       |
    And verify response time is less than "2500" milliseconds




  @ResponseFieldValidation @FieldValidation
  Scenario: TC-07 Validate Response field - Data.Result should be present in response
    And I modify fields with random values and remove fields in "POST_SaveWarehousePricing" XML payload
      |XPath                                    |Value         |
      |/Warehouseskunits/Warehouseskunit/warehouseID |1        |
      |/Warehouseskunits/Warehouseskunit/skunitID     |6       |
      |/Warehouseskunits/Warehouseskunit/price           |213.21        |
      |/Warehouseskunits/Warehouseskunit/entitytype      |warehouses    |
      |/Warehouseskunits/Warehouseskunit/entitytype_erpid|111112        |
      |/Warehouseskunits/Warehouseskunit/is_active        |1             |
    And I post the request with "POST_SaveWarehousePricing" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader   |xmlValue |
      |Response.Result |1        |
    And verify response time is less than "2500" milliseconds


  @FieldValidation @WarehouseFields @NegativeScenario
  Scenario: TC-08 Validate required field - entitytype is mandatory
    And I modify fields with random values and remove fields in "POST_SaveWarehousePricing" XML payload
      |XPath                                    |Value         |
      |/Warehouseskunits/Warehouseskunit/warehouseID |1        |
      |/Warehouseskunits/Warehouseskunit/skunitID     |6       |
      |/Warehouseskunits/Warehouseskunit/price           |213.21        |
      |/Warehouseskunits/Warehouseskunit/entitytype_erpid|111112        |
      |/Warehouseskunits/Warehouseskunit/is_active        |1             |
    And I remove the fields from XML "POST_SaveWarehousePricing" payload
      |XPath                              |
      |/Warehouseskunits/Warehouseskunit/entitytype   |
    And I post the request with "POST_SaveWarehousePricing" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And validating the response contains the string in XML response body
      |XPath          |Value |
      |Response.Result|1     |
    And verify response time is less than "2500" milliseconds




  @NegativeScenario @InvalidValues
  Scenario: TC-09 Post Save Warehouse Pricing API with invalid warehouseID
    And I modify fields with random values and remove fields in "POST_SaveWarehousePricing" XML payload
      |XPath                                    |Value              |
      |/Warehouseskunits/Warehouseskunit/warehouseID |invalid_warehouse_999 |
      |/Warehouseskunits/Warehouseskunit/skunitID     |6       |
      |/Warehouseskunits/Warehouseskunit/price           |213.21        |
      |/Warehouseskunits/Warehouseskunit/entitytype      |warehouses    |
      |/Warehouseskunits/Warehouseskunit/entitytype_erpid|111112        |
      |/Warehouseskunits/Warehouseskunit/is_active        |1             |
    And I post the request with "POST_SaveWarehousePricing" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And validating the response contains the string in XML response body
      |XPath          |Value |
      |Response.Result|1     |
    And verify response time is less than "2500" milliseconds




  @NegativeScenario @InvalidValues
  Scenario: TC-10 Post Save Warehouse Pricing API with invalid skunitID
    And I modify fields with random values and remove fields in "POST_SaveWarehousePricing" XML payload
      |XPath                                    |Value                 |
      |/Warehouseskunits/Warehouseskunit/warehouseID |1        |
      |/Warehouseskunits/Warehouseskunit/skunitID     |invalid_sku_999 |
      |/Warehouseskunits/Warehouseskunit/price           |213.21        |
      |/Warehouseskunits/Warehouseskunit/entitytype      |warehouses    |
      |/Warehouseskunits/Warehouseskunit/entitytype_erpid|111112        |
      |/Warehouseskunits/Warehouseskunit/is_active        |1             |
    And I post the request with "POST_SaveWarehousePricing" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And validating the response contains the string in XML response body
      |XPath          |Value |
      |Response.Result|1     |
    And verify response time is less than "2500" milliseconds




  @NegativeScenario @InvalidValues
  Scenario: TC-11 Post Save Warehouse Pricing API with negative price
    And I modify fields with random values and remove fields in "POST_SaveWarehousePricing" XML payload
      |XPath                                    |Value         |
      |/Warehouseskunits/Warehouseskunit/warehouseID |1        |
      |/Warehouseskunits/Warehouseskunit/skunitID     |6       |
      |/Warehouseskunits/Warehouseskunit/price           |-500.00       |
      |/Warehouseskunits/Warehouseskunit/entitytype      |warehouses    |
      |/Warehouseskunits/Warehouseskunit/entitytype_erpid|111112        |
      |/Warehouseskunits/Warehouseskunit/is_active        |1             |
    And I post the request with "POST_SaveWarehousePricing" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And validating the response contains the string in XML response body
      |XPath          |Value |
      |Response.Result|1     |
    And verify response time is less than "2500" milliseconds




  @NegativeScenario @InvalidValues
  Scenario: TC-12 Post Save Warehouse Pricing API with negative MRP
    And I modify fields with random values and remove fields in "POST_SaveWarehousePricing" XML payload
      |XPath                                    |Value         |
      |/Warehouseskunits/Warehouseskunit/warehouseID |1        |
      |/Warehouseskunits/Warehouseskunit/skunitID     |6       |
      |/Warehouseskunits/Warehouseskunit/mrp             |-100.00       |
      |/Warehouseskunits/Warehouseskunit/price           |213.21        |
      |/Warehouseskunits/Warehouseskunit/entitytype      |warehouses    |
      |/Warehouseskunits/Warehouseskunit/entitytype_erpid|111112        |
      |/Warehouseskunits/Warehouseskunit/is_active        |1             |
    And I post the request with "POST_SaveWarehousePricing" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And validating the response contains the string in XML response body
      |XPath          |Value |
      |Response.Result|1    |
    And verify response time is less than "2500" milliseconds








  @NegativeScenario @InvalidValues
  Scenario: TC-13 Post Save Warehouse Pricing API with string value for numeric price
    And I modify fields with random values and remove fields in "POST_SaveWarehousePricing" XML payload
      |XPath                                    |Value         |
      |/Warehouseskunits/Warehouseskunit/warehouseID |1        |
      |/Warehouseskunits/Warehouseskunit/skunitID     |6       |
      |/Warehouseskunits/Warehouseskunit/price           |not_a_number  |
      |/Warehouseskunits/Warehouseskunit/entitytype      |warehouses    |
      |/Warehouseskunits/Warehouseskunit/entitytype_erpid|111112        |
      |/Warehouseskunits/Warehouseskunit/is_active        |1             |
    And I post the request with "POST_SaveWarehousePricing" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And validating the response contains the string in XML response body
      |XPath          |Value |
      |Response.Result|1    |
    And verify response time is less than "2500" milliseconds








  @AuthenticationScenario @Security
  Scenario: TC-14 Post Save Warehouse Pricing API without access token - Verify 401 error
    And I modify fields with random values and remove fields in "POST_SaveWarehousePricing" XML payload
      |XPath                                    |Value         |
      |/Warehouseskunits/Warehouseskunit/warehouseID |1        |
      |/Warehouseskunits/Warehouseskunit/skunitID     |6       |
      |/Warehouseskunits/Warehouseskunit/price           |213.21        |
      |/Warehouseskunits/Warehouseskunit/entitytype      |warehouses    |
      |/Warehouseskunits/Warehouseskunit/entitytype_erpid|111112        |
      |/Warehouseskunits/Warehouseskunit/is_active        |1             |
    And I post the request with "POST_SaveWarehousePricing" xml payload with dynamic access token and query parameters
      |Query |Value |
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      |JPath                |Value                          |
      |$.error              |invalid_request                |
      |$.error_description  |The access token was not found.|
    And verify response time is less than "2500" milliseconds




  @AuthenticationScenario @Security
  Scenario: TC-15 Post Save Warehouse Pricing API with invalid access token - Verify 401 error
    And I modify fields with random values and remove fields in "POST_SaveWarehousePricing" XML payload
      |XPath                                    |Value         |
      |/Warehouseskunits/Warehouseskunit/warehouseID |1        |
      |/Warehouseskunits/Warehouseskunit/skunitID     |6       |
      |/Warehouseskunits/Warehouseskunit/price           |213.21        |
      |/Warehouseskunits/Warehouseskunit/entitytype      |warehouses    |
      |/Warehouseskunits/Warehouseskunit/entitytype_erpid|111112        |
      |/Warehouseskunits/Warehouseskunit/is_active        |1             |
    And I post the request with "POST_SaveWarehousePricing" xml payload with dynamic access token and query parameters
      |Query        |Value               |
      |access_token |invalid_token_12345 |
    Then I should see the response code as "401"
    And verify response time is less than "2500" milliseconds




  @AuthenticationScenario @Security
  Scenario: TC-16 Post Save Warehouse Pricing API with expired access token - Verify 401 error
    And I modify fields with random values and remove fields in "POST_SaveWarehousePricing" XML payload
      |XPath                                    |Value         |
      |/Warehouseskunits/Warehouseskunit/warehouseID |1        |
      |/Warehouseskunits/Warehouseskunit/skunitID     |6       |
      |/Warehouseskunits/Warehouseskunit/price           |213.21        |
      |/Warehouseskunits/Warehouseskunit/entitytype      |warehouses    |
      |/Warehouseskunits/Warehouseskunit/entitytype_erpid|111112        |
      |/Warehouseskunits/Warehouseskunit/is_active        |1             |
    And I post the request with "POST_SaveWarehousePricing" xml payload with dynamic access token and query parameters
      |Query        |Value                                     |
      |access_token |expired_00000000000000000000000000000000  |
    Then I should see the response code as "401"
    And verify response time is less than "2500" milliseconds


  @BoundaryTest @DBValidation
  Scenario: TC-17 Post Save Warehouse Pricing API with minimum valid price
    And I modify fields with random values and remove fields in "POST_SaveWarehousePricing" XML payload
      |XPath                                    |Value         |
      |/Warehouseskunits/Warehouseskunit/warehouseID |1        |
      |/Warehouseskunits/Warehouseskunit/skunitID     |6       |
      |/Warehouseskunits/Warehouseskunit/price           |2.89         |
      |/Warehouseskunits/Warehouseskunit/entitytype      |warehouses    |
      |/Warehouseskunits/Warehouseskunit/entitytype_erpid|111112        |
      |/Warehouseskunits/Warehouseskunit/is_active        |1             |
    And I post the request with "POST_SaveWarehousePricing" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader   |xmlValue |
      |Response.Result |1        |
    And verify response time is less than "2500" milliseconds
    And I verify the data got updated as needed from DB
      |expectedColumn |expectedValue |
      |DB:warehouseskunits:price:id = (SELECT MAX(id) FROM warehouseskunits WHERE warehouse_id = '1' AND skunit_id = '6') |2.89000 |




  @BoundaryTest @DBValidation
  Scenario: TC-18 Post Save Warehouse Pricing API with maximum valid price
    And I modify fields with random values and remove fields in "POST_SaveWarehousePricing" XML payload
      |XPath                                    |Value         |
      |/Warehouseskunits/Warehouseskunit/warehouseID |1        |
      |/Warehouseskunits/Warehouseskunit/skunitID     |6       |
      |/Warehouseskunits/Warehouseskunit/price           |2.89000      |
      |/Warehouseskunits/Warehouseskunit/entitytype      |warehouses    |
      |/Warehouseskunits/Warehouseskunit/entitytype_erpid|111112        |
      |/Warehouseskunits/Warehouseskunit/is_active        |1             |
    And I post the request with "POST_SaveWarehousePricing" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader   |xmlValue |
      |Response.Result |1        |
    And verify response time is less than "2500" milliseconds
    And I verify the data got updated as needed from DB
      |expectedColumn |expectedValue |
      |DB:warehouseskunits:price:id = (SELECT MAX(id) FROM warehouseskunits WHERE warehouse_id = '1' AND skunit_id = '6') |2.89000 |




  @BoundaryTest
  Scenario: TC-19 Post Save Warehouse Pricing API with long warehouseID
    And I modify fields with random values and remove fields in "POST_SaveWarehousePricing" XML payload
      |XPath                                    |Value                                          |
      |/Warehouseskunits/Warehouseskunit/warehouseID |WH20241201123456789012345678901234567890      |
      |/Warehouseskunits/Warehouseskunit/skunitID     |6       |
      |/Warehouseskunits/Warehouseskunit/price           |213.21        |
      |/Warehouseskunits/Warehouseskunit/entitytype      |warehouses    |
      |/Warehouseskunits/Warehouseskunit/entitytype_erpid|111112        |
      |/Warehouseskunits/Warehouseskunit/is_active        |1             |
    And I post the request with "POST_SaveWarehousePricing" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds




  @EntityTypeValidation @DBValidation
  Scenario: TC-20 Post Save Warehouse Pricing API with entitytype 'warehouses'
    And I modify fields with random values and remove fields in "POST_SaveWarehousePricing" XML payload
      |XPath                                    |Value         |
      |/Warehouseskunits/Warehouseskunit/warehouseID |1        |
      |/Warehouseskunits/Warehouseskunit/skunitID     |6       |
      |/Warehouseskunits/Warehouseskunit/price           |2.89000        |
      |/Warehouseskunits/Warehouseskunit/entitytype      |warehouses    |
      |/Warehouseskunits/Warehouseskunit/entitytype_erpid|111112        |
      |/Warehouseskunits/Warehouseskunit/is_active        |1             |
    And I post the request with "POST_SaveWarehousePricing" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader   |xmlValue |
      |Response.Result |1       |
    And verify response time is less than "2500" milliseconds
    And I verify the data got updated as needed from DB
      |expectedColumn |expectedValue |
      |DB:warehouseskunits:price:id = (SELECT MAX(id) FROM warehouseskunits WHERE warehouse_id = '1' AND skunit_id = '6') |2.89000 |




  @MarginTypeValidation @DBValidation
  Scenario: TC-21 Post Save Warehouse Pricing API with margintype 'percent'
    And I modify fields with random values and remove fields in "POST_SaveWarehousePricing" XML payload
      |XPath                                    |Value         |
      |/Warehouseskunits/Warehouseskunit/warehouseID |1        |
      |/Warehouseskunits/Warehouseskunit/skunitID     |6       |
      |/Warehouseskunits/Warehouseskunit/price           |2.89000        |
      |/Warehouseskunits/Warehouseskunit/entitytype      |warehouses    |
      |/Warehouseskunits/Warehouseskunit/entitytype_erpid|111112        |
      |/Warehouseskunits/Warehouseskunit/minmargin       |200           |
      |/Warehouseskunits/Warehouseskunit/maxmargin       |232           |
      |/Warehouseskunits/Warehouseskunit/margintype       |percent       |
      |/Warehouseskunits/Warehouseskunit/is_active        |1             |
    And I post the request with "POST_SaveWarehousePricing" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader   |xmlValue |
      |Response.Result |1        |
    And verify response time is less than "2500" milliseconds
    And I verify the data got updated as needed from DB
      |expectedColumn |expectedValue |
      |DB:warehouseskunits:price:id = (SELECT MAX(id) FROM warehouseskunits WHERE warehouse_id = '1' AND skunit_id = '6') |2.89000 |




  @MarginTypeValidation @DBValidation
  Scenario: TC-22 Post Save Warehouse Pricing API with margintype 'value'
    And I modify fields with random values and remove fields in "POST_SaveWarehousePricing" XML payload
      |XPath                                    |Value         |
      |/Warehouseskunits/Warehouseskunit/warehouseID |1        |
      |/Warehouseskunits/Warehouseskunit/skunitID     |6       |
      |/Warehouseskunits/Warehouseskunit/price           |2.89000        |
      |/Warehouseskunits/Warehouseskunit/entitytype      |warehouses    |
      |/Warehouseskunits/Warehouseskunit/entitytype_erpid|111112        |
      |/Warehouseskunits/Warehouseskunit/minmargin       |200           |
      |/Warehouseskunits/Warehouseskunit/maxmargin       |232           |
      |/Warehouseskunits/Warehouseskunit/margintype       |value         |
      |/Warehouseskunits/Warehouseskunit/is_active        |1             |
    And I post the request with "POST_SaveWarehousePricing" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader   |xmlValue |
      |Response.Result |1        |
    And verify response time is less than "2500" milliseconds
    And I verify the data got updated as needed from DB
      |expectedColumn |expectedValue |
      |DB:warehouseskunits:price:id = (SELECT MAX(id) FROM warehouseskunits WHERE warehouse_id = '1' AND skunit_id = '6') |2.89000 |




  @StatusValidation @DBValidation
  Scenario: TC-23 Post Save Warehouse Pricing API with is_active '1'
    And I modify fields with random values and remove fields in "POST_SaveWarehousePricing" XML payload
      |XPath                                    |Value         |
      |/Warehouseskunits/Warehouseskunit/warehouseID |1        |
      |/Warehouseskunits/Warehouseskunit/skunitID     |6       |
      |/Warehouseskunits/Warehouseskunit/price           |2.89000        |
      |/Warehouseskunits/Warehouseskunit/entitytype      |warehouses    |
      |/Warehouseskunits/Warehouseskunit/entitytype_erpid|111112        |
      |/Warehouseskunits/Warehouseskunit/is_active        |1             |
    And I post the request with "POST_SaveWarehousePricing" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader   |xmlValue |
      |Response.Result |1       |
    And verify response time is less than "2500" milliseconds
    And I verify the data got updated as needed from DB
      |expectedColumn |expectedValue |
      |DB:warehouseskunits:price:id = (SELECT MAX(id) FROM warehouseskunits WHERE warehouse_id = '1' AND skunit_id = '6') |2.89000 |
      |DB:warehouseskunits:is_active:id = (SELECT MAX(id) FROM warehouseskunits WHERE warehouse_id = '1' AND skunit_id = '6') |1 |




  @StatusValidation @DBValidation
  Scenario: TC-24 Post Save Warehouse Pricing API with is_active '0'
    And I modify fields with random values and remove fields in "POST_SaveWarehousePricing" XML payload
      |XPath                                    |Value         |
      |/Warehouseskunits/Warehouseskunit/warehouseID |1        |
      |/Warehouseskunits/Warehouseskunit/skunitID     |6       |
      |/Warehouseskunits/Warehouseskunit/price           |2.89000       |
      |/Warehouseskunits/Warehouseskunit/entitytype      |warehouses    |
      |/Warehouseskunits/Warehouseskunit/entitytype_erpid|111112        |
      |/Warehouseskunits/Warehouseskunit/is_active        |1            |
    And I post the request with "POST_SaveWarehousePricing" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader   |xmlValue |
      |Response.Result |1        |
    And verify response time is less than "2500" milliseconds
    And I verify the data got updated as needed from DB
      |expectedColumn |expectedValue |
      |DB:warehouseskunits:price:id = (SELECT MAX(id) FROM warehouseskunits WHERE warehouse_id = '1' AND skunit_id = '6') |2.89000|
      |DB:warehouseskunits:is_active:id = (SELECT MAX(id) FROM warehouseskunits WHERE warehouse_id = '1' AND skunit_id = '6') |0 |




  @PerformanceTest
  Scenario: TC-25 Post Save Warehouse Pricing API - Verify response time under 3 seconds
    And I modify fields with random values and remove fields in "POST_SaveWarehousePricing" XML payload
      |XPath                                    |Value         |
      |/Warehouseskunits/Warehouseskunit/warehouseID |1        |
      |/Warehouseskunits/Warehouseskunit/skunitID     |6       |
      |/Warehouseskunits/Warehouseskunit/price           |213.21        |
      |/Warehouseskunits/Warehouseskunit/entitytype      |warehouses    |
      |/Warehouseskunits/Warehouseskunit/entitytype_erpid|111112        |
      |/Warehouseskunits/Warehouseskunit/is_active        |true             |
    And I post the request with "POST_SaveWarehousePricing" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds




  @DataTypeValidation @DBValidation
  Scenario: TC-26 Validate numeric fields accept decimal values
    And I modify fields with random values and remove fields in "POST_SaveWarehousePricing" XML payload
      |XPath                                    |Value         |
      |/Warehouseskunits/Warehouseskunit/warehouseID |1        |
      |/Warehouseskunits/Warehouseskunit/skunitID     |6       |
      |/Warehouseskunits/Warehouseskunit/mrp             |10.00        |
      |/Warehouseskunits/Warehouseskunit/price           |2.89        |
      |/Warehouseskunits/Warehouseskunit/entitytype      |warehouses    |
      |/Warehouseskunits/Warehouseskunit/entitytype_erpid|111112        |
      |/Warehouseskunits/Warehouseskunit/minmargin       |200.50        |
      |/Warehouseskunits/Warehouseskunit/maxmargin       |232.75        |
      |/Warehouseskunits/Warehouseskunit/is_active        |true             |
    And I post the request with "POST_SaveWarehousePricing" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader   |xmlValue |
      |Response.Result |1        |
    And verify response time is less than "2500" milliseconds
    And I verify the data got updated as needed from DB
      |expectedColumn |expectedValue |
      |DB:warehouseskunits:price:id = (SELECT MAX(id) FROM warehouseskunits WHERE warehouse_id = '1' AND skunit_id = '6') |2.89000 |
      |DB:warehouseskunits:mrp:id = (SELECT MAX(id) FROM warehouseskunits WHERE warehouse_id = '1' AND skunit_id = '6') |10.00000 |
      |DB:warehouseskunits:minmargin:id = (SELECT MAX(id) FROM warehouseskunits WHERE warehouse_id = '1' AND skunit_id = '6') |0.00000 |
      |DB:warehouseskunits:maxmargin:id = (SELECT MAX(id) FROM warehouseskunits WHERE warehouse_id = '1' AND skunit_id = '6') |0.00000|

