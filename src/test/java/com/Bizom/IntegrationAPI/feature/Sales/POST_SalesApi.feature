@SalesPOST @Sanity @All @Execution @allPost
Feature: This feature file contains testcases for POST Sale API (/payments/saleapi)

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/xml|

  @SaleAPIPositive @Smoke 
  Scenario: TC-01 Post Sale API with all valid data - Verify successful response
    And I modify fields with random values and remove fields in "POST_SalesApi" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/paymentErpId        |randomInt     |
      |/sales/sale/payment/outlet_erp_id           |outlets: id=1 |
      |/sales/sale/payment/from_warehouse_erpid   |warehouses: id=1 |
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |4810.00000      |
      |/sales/sale/payment/fordate              |todayDate     |
      |/sales/sale/payment/tcs_amount           |10.00            |
      |/sales/sale/payment/employee_id          |1211         |
    And I post the request with "POST_SalesApi" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader              |xmlValue |
      |Response.Result            |0        |
    And verify response time is less than "1500" milliseconds
    And I store the response as "sale_response" name using xml full path

  @SaleAPIPositive @DBValidation
  Scenario: TC-02 Post Sale API with cash payment mode  
    And I modify fields with random values and remove fields in "POST_SalesApi" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/paymentErpId        |randomInt     |
      |/sales/sale/payment/outlet_erp_id           |erp123|
      |/sales/sale/payment/from_warehouse_erpid   |trp123|
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |4815.00000      |
      |/sales/sale/payment/fordate              |todayDate     |
      |/sales/sale/payment/employee_id          |1211         |
    And I post the request with "POST_SalesApi" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader              |xmlValue |
      |Response.Result            |0        |
    And I verify the data got updated as needed from DB
      |expectedColumn |expectedValue |
      |DB:payments:amount:id = (SELECT MAX(id) FROM payments WHERE oldpaymentid IS NULL) |4810.00000 |
    And verify response time is less than "1500" milliseconds

  @SaleAPIPositive @DBValidation
  Scenario: TC-03 Post Sale API with TCS amount - Verify tax calculation
    And I modify fields with random values and remove fields in "POST_SalesApi" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/paymentErpId        |randomInt     |
      |/sales/sale/payment/outlet_erp_id           |erp123|
      |/sales/sale/payment/from_warehouse_erpid   |trp123|
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |4815.00000      |
      |/sales/sale/payment/fordate              |todayDate     |
      |/sales/sale/payment/tcs_amount           |10.00            |
      |/sales/sale/payment/employee_id          |1211         |
    And I post the request with "POST_SalesApi" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader              |xmlValue |
      |Response.Result            |0        |
    And I verify the data got updated as needed from DB
      |expectedColumn |expectedValue |
      |DB:payments:tcs_amount:id = (SELECT MAX(id) FROM payments WHERE oldpaymentid IS NULL) |10.00 |
    And verify response time is less than "1500" milliseconds

  @SaleAPIPositive @DBValidation
  Scenario: TC-04 Post Sale API with scheme discount - Verify discount calculation
    And I modify fields with random values and remove fields in "POST_SalesApi" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/paymentErpId        |randomInt     |
      |/sales/sale/payment/outlet_erp_id           |erp123|
      |/sales/sale/payment/from_warehouse_erpid   |trp123|
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |4810.00000     |
      |/sales/sale/payment/fordate              |todayDate     |
      |/sales/sale/payment/employee_id          |1211         |
      |/sales/sale/paymentdetail/schemediscount |10.00        |
    And I post the request with "POST_SalesApi" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader              |xmlValue |
      |Response.Result            |0        |
    And I verify the data got updated as needed from DB
      |expectedColumn |expectedValue |
      |DB:payments:amount:id = (SELECT MAX(id) FROM payments WHERE oldpaymentid IS NULL) |4810.00000 |
    And verify response time is less than "1500" milliseconds

  @SaleAPIPositive @DBValidation
  Scenario: TC-05 Post Sale API with partialfulfil flag - Verify partial fulfillment
    And I modify fields with random values and remove fields in "POST_SalesApi" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/paymentErpId        |randomInt     |
      |/sales/sale/payment/outlet_erp_id           |erp123|
      |/sales/sale/payment/from_warehouse_erpid   |trp123|
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |4810.00000      |
      |/sales/sale/payment/fordate              |todayDate     |
      |/sales/sale/payment/employee_id          |1211         |
      |/sales/sale/payment/partialfulfil        |1             |
    And I post the request with "POST_SalesApi" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader              |xmlValue |
      |Response.Result            |0        |
    And I verify the data got updated as needed from DB
      |expectedColumn |expectedValue |
      |DB:payments:amount:id = (SELECT MAX(id) FROM payments WHERE oldpaymentid IS NULL) |4810.00000 |
    And verify response time is less than "1500" milliseconds

  @ResponseFieldValidation @FieldValidation
  Scenario: TC-06 Validate Response field - Result should be 1 for successful transaction
    And I modify fields with random values and remove fields in "POST_SalesApi" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/paymentErpId        |randomInt     |
      |/sales/sale/payment/outlet_erp_id           |erp123|
      |/sales/sale/payment/from_warehouse_erpid   |trp123|
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |4810.00000      |
      |/sales/sale/payment/fordate              |todayDate     |
      |/sales/sale/payment/employee_id          |1211         |
    And I post the request with "POST_SalesApi" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader   |xmlValue |
      |Response.Result |0        |
    And verify response time is less than "1500" milliseconds

  @ResponseFieldValidation @FieldValidation
  Scenario: TC-07 Validate Response field - printerType should be 'regular'
    And I modify fields with random values and remove fields in "POST_SalesApi" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/paymentErpId        |randomInt     |
      |/sales/sale/payment/outlet_erp_id           |erp123|
      |/sales/sale/payment/from_warehouse_erpid   |trp123|
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |4810.00000      |
      |/sales/sale/payment/fordate              |todayDate     |
      |/sales/sale/payment/employee_id          |1211         |
    And I post the request with "POST_SalesApi" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader              |xmlValue |
      |Response.Result |0        |
    And verify response time is less than "1500" milliseconds

  @ResponseFieldValidation @FieldValidation
  Scenario: TC-08 Validate Response field - invoiceid in response matches request invoiceid
    And I modify fields with random values and remove fields in "POST_SalesApi" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |345044399     |
      |/sales/sale/payment/paymentErpId        |randomInt     |
      |/sales/sale/payment/outlet_erp_id           |erp123|
      |/sales/sale/payment/from_warehouse_erpid   |trp123|
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |4810.00000      |
      |/sales/sale/payment/fordate              |todayDate     |
      |/sales/sale/payment/employee_id          |1211         |
    And I post the request with "POST_SalesApi" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader   |xmlValue |
      |Response.Result |0        |
    And verify response time is less than "1500" milliseconds

  @FieldValidation @PaymentFields @NegativeScenario
  Scenario: TC-09 Validate required field - invoiceid is mandatory
    And I modify fields with random values and remove fields in "POST_SalesApi" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/paymentErpId        |randomInt     |
      |/sales/sale/payment/outlet_erp_id           |erp123|
      |/sales/sale/payment/from_warehouse_erpid   |trp123|
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |4810.00000      |
      |/sales/sale/payment/fordate              |todayDate     |
      |/sales/sale/payment/employee_id          |1211         |
    And I remove the fields from XML "POST_SalesApi" payload
      |XPath                           |
      |/sales/sale/payment/invoiceid   |
    And I post the request with "POST_SalesApi" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And validating the response contains the string in XML response body
      |XPath          |Value |
      |Response.Result|0     |
    And verify response time is less than "1500" milliseconds

  @FieldValidation @PaymentFields @NegativeScenario
  Scenario: TC-10 Validate required field - outlet_erp_id is mandatory
    And I modify fields with random values and remove fields in "POST_SalesApi" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/paymentErpId        |randomInt     |
      |/sales/sale/payment/from_warehouse_erpid   |trp123|
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |4810.00000      |
      |/sales/sale/payment/fordate              |todayDate     |
      |/sales/sale/payment/employee_id          |1211         |
    And I remove the fields from XML "POST_SalesApi" payload
      |XPath                              |
      |/sales/sale/payment/outlet_erp_id  |
    And I post the request with "POST_SalesApi" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And validating the response contains the string in XML response body
      |XPath          |Value |
      |Response.Result|0     |
    And verify response time is less than "1500" milliseconds

  @FieldValidation @PaymentFields @NegativeScenario
  Scenario: TC-11 Validate required field - from_warehouse_erpid is mandatory
    And I modify fields with random values and remove fields in "POST_SalesApi" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/paymentErpId        |randomInt     |
      |/sales/sale/payment/outlet_erp_id           |erp123|
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |4810.00000      |
      |/sales/sale/payment/fordate              |todayDate     |
      |/sales/sale/payment/employee_id          |1211         |
    And I remove the fields from XML "POST_SalesApi" payload
      |XPath                                     |
      |/sales/sale/payment/from_warehouse_erpid  |
    And I post the request with "POST_SalesApi" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And validating the response contains the string in XML response body
      |XPath          |Value |
      |Response.Result|0     |
    And verify response time is less than "1500" milliseconds

  @FieldValidation @PaymentFields @NegativeScenario
  Scenario: TC-12 Validate required field - mode is mandatory
    And I modify fields with random values and remove fields in "POST_SalesApi" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/paymentErpId        |randomInt     |
      |/sales/sale/payment/outlet_erp_id           |erp123|
      |/sales/sale/payment/from_warehouse_erpid   |trp123|
      |/sales/sale/payment/amount               |4810.00000      |
      |/sales/sale/payment/fordate              |todayDate     |
      |/sales/sale/payment/employee_id          |1211         |
    And I remove the fields from XML "POST_SalesApi" payload
      |XPath                       |
      |/sales/sale/payment/mode    |
    And I post the request with "POST_SalesApi" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And validating the response contains the string in XML response body
      |XPath          |Value |
      |Response.Result|0     |
    And verify response time is less than "1500" milliseconds

  @FieldValidation @PaymentFields @NegativeScenario
  Scenario: TC-13 Validate required field - amount is mandatory
    And I modify fields with random values and remove fields in "POST_SalesApi" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/paymentErpId        |randomInt     |
      |/sales/sale/payment/outlet_erp_id           |erp123|
      |/sales/sale/payment/from_warehouse_erpid   |trp123|
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/fordate              |todayDate     |
      |/sales/sale/payment/employee_id          |1211         |
    And I remove the fields from XML "POST_SalesApi" payload
      |XPath                        |
      |/sales/sale/payment/amount   |
    And I post the request with "POST_SalesApi" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And validating the response contains the string in XML response body
      |XPath          |Value |
      |Response.Result|0     |
    And verify response time is less than "1500" milliseconds

  @FieldValidation @PaymentFields @NegativeScenario
  Scenario: TC-14 Validate required field - fordate is mandatory
    And I modify fields with random values and remove fields in "POST_SalesApi" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/paymentErpId        |randomInt     |
      |/sales/sale/payment/outlet_erp_id           |erp123|
      |/sales/sale/payment/from_warehouse_erpid   |trp123|
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |4810.00000      |
      |/sales/sale/payment/employee_id          |1211         |
    And I remove the fields from XML "POST_SalesApi" payload
      |XPath                        |
      |/sales/sale/payment/fordate  |
    And I post the request with "POST_SalesApi" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And validating the response contains the string in XML response body
      |XPath          |Value |
      |Response.Result|0     |
    And verify response time is less than "1500" milliseconds

  @FieldValidation @PaymentDetailFields @NegativeScenario
  Scenario: TC-15 Validate required field - skunit_erp_id is mandatory in paymentdetail
    And I modify fields with random values and remove fields in "POST_SalesApi" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/paymentErpId        |randomInt     |
      |/sales/sale/payment/outlet_erp_id           |erp123|
      |/sales/sale/payment/from_warehouse_erpid   |trp123|
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |4810.00000      |
      |/sales/sale/payment/fordate              |todayDate     |
      |/sales/sale/payment/employee_id          |1211         |
    And I remove the fields from XML "POST_SalesApi" payload
      |XPath                                   |
      |/sales/sale/paymentdetail/skunit_erp_id |
    And I post the request with "POST_SalesApi" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And validating the response contains the string in XML response body
      |XPath          |Value |
      |Response.Result|0     |
    And verify response time is less than "1500" milliseconds

  @FieldValidation @PaymentDetailFields @NegativeScenario
  Scenario: TC-16 Validate required field - quantity is mandatory in paymentdetail
    And I modify fields with random values and remove fields in "POST_SalesApi" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/paymentErpId        |randomInt     |
      |/sales/sale/payment/outlet_erp_id           |erp123|
      |/sales/sale/payment/from_warehouse_erpid   |trp123|
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |4810.00000      |
      |/sales/sale/payment/fordate              |todayDate     |
      |/sales/sale/payment/employee_id          |1211         |
    And I remove the fields from XML "POST_SalesApi" payload
      |XPath                                |
      |/sales/sale/paymentdetail/quantity   |
    And I post the request with "POST_SalesApi" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And validating the response contains the string in XML response body
      |XPath          |Value |
      |Response.Result|0     |
    And verify response time is less than "1500" milliseconds

  @FieldValidation @PaymentDetailFields @NegativeScenario
  Scenario: TC-17 Validate required field - status is mandatory in paymentdetail
    And I modify fields with random values and remove fields in "POST_SalesApi" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/paymentErpId        |randomInt     |
      |/sales/sale/payment/outlet_erp_id           |erp123|
      |/sales/sale/payment/from_warehouse_erpid   |trp123|
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |4810.00000      |
      |/sales/sale/payment/fordate              |todayDate     |
      |/sales/sale/payment/employee_id          |1211         |
    And I remove the fields from XML "POST_SalesApi" payload
      |XPath                              |
      |/sales/sale/paymentdetail/status   |
    And I post the request with "POST_SalesApi" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And validating the response contains the string in XML response body
      |XPath          |Value |
      |Response.Result|0     |
    And verify response time is less than "1500" milliseconds

  @FieldValidation @PaymentDetailFields @NegativeScenario
  Scenario: TC-18 Validate required field - amount is mandatory in paymentdetail
    And I modify fields with random values and remove fields in "POST_SalesApi" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/paymentErpId        |randomInt     |
      |/sales/sale/payment/outlet_erp_id           |erp123|
      |/sales/sale/payment/from_warehouse_erpid   |trp123|
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |4810.00000      |
      |/sales/sale/payment/fordate              |todayDate     |
      |/sales/sale/payment/employee_id          |1211         |
    And I remove the fields from XML "POST_SalesApi" payload
      |XPath                              |
      |/sales/sale/paymentdetail/amount   |
    And I post the request with "POST_SalesApi" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And validating the response contains the string in XML response body
      |XPath          |Value |
      |Response.Result|0     |
    And verify response time is less than "1500" milliseconds

  @NegativeScenario @InvalidValues
  Scenario: TC-19 Post Sale API with invalid outlet_erp_id
    And I modify fields with random values and remove fields in "POST_SalesApi" XML payload
      |XPath                                    |Value              |
      |/sales/sale/payment/invoiceid            |randomInt          |
      |/sales/sale/payment/paymentErpId        |randomInt          |
      |/sales/sale/payment/outlet_erp_id           |.........|
      |/sales/sale/payment/from_warehouse_erpid   |trp123|
      |/sales/sale/payment/mode                 |cash               |
      |/sales/sale/payment/amount               |4810.00000           |
      |/sales/sale/payment/fordate              |todayDate          |
      |/sales/sale/payment/employee_id          |1211              |
    And I post the request with "POST_SalesApi" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And validating the response contains the string in XML response body
      |XPath          |Value |
      |Response.Result|0     |
    And verify response time is less than "1500" milliseconds

  @NegativeScenario @InvalidValues
  Scenario: TC-20 Post Sale API with invalid from_warehouse_erpid  
    And I modify fields with random values and remove fields in "POST_SalesApi" XML payload
      |XPath                                    |Value                 |
      |/sales/sale/payment/invoiceid            |randomInt             |
      |/sales/sale/payment/paymentErpId        |randomInt             |
      |/sales/sale/payment/outlet_erp_id           |erp123|
      |/sales/sale/payment/from_warehouse_erpid   |.........|
      |/sales/sale/payment/mode                 |cash                  |
      |/sales/sale/payment/amount               |4810.00000              |
      |/sales/sale/payment/fordate              |todayDate             |
      |/sales/sale/payment/employee_id          |1211                 |
    And I post the request with "POST_SalesApi" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And validating the response contains the string in XML response body
      |XPath          |Value |
      |Response.Result|0     |
    And verify response time is less than "1500" milliseconds

  @NegativeScenario @InvalidValues
  Scenario: TC-21 Post Sale API with invalid payment mode  
    And I modify fields with random values and remove fields in "POST_SalesApi" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/paymentErpId        |randomInt     |
      |/sales/sale/payment/outlet_erp_id           |erp123|
      |/sales/sale/payment/from_warehouse_erpid   |trp123|
      |/sales/sale/payment/mode                 |invalid_mode  |
      |/sales/sale/payment/amount               |4810.00000      |
      |/sales/sale/payment/fordate              |todayDate     |
      |/sales/sale/payment/employee_id          |1211         |
    And I post the request with "POST_SalesApi" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader|xmlValue|
      |Response.Result|0|
    And verify response time is less than "1500" milliseconds

  @NegativeScenario @InvalidValues
  Scenario: TC-22 Post Sale API with negative amount  
    And I modify fields with random values and remove fields in "POST_SalesApi" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/paymentErpId        |randomInt     |
      |/sales/sale/payment/outlet_erp_id           |erp123|
      |/sales/sale/payment/from_warehouse_erpid   |trp123|
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |-500.00       |
      |/sales/sale/payment/fordate              |todayDate     |
      |/sales/sale/payment/employee_id          |1211         |
    And I post the request with "POST_SalesApi" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader|xmlValue|
      |Response.Result|0|
    And verify response time is less than "1500" milliseconds

  @NegativeScenario @InvalidValues
  Scenario: TC-23 Post Sale API with invalid date format  
    And I modify fields with random values and remove fields in "POST_SalesApi" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/paymentErpId        |randomInt     |
      |/sales/sale/payment/outlet_erp_id           |erp123|
      |/sales/sale/payment/from_warehouse_erpid   |trp123|
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |4810.00000      |
      |/sales/sale/payment/fordate              |27-09-2024    |
      |/sales/sale/payment/employee_id          |1211         |
    And I post the request with "POST_SalesApi" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And validating the response contains the string in XML response body
      |XPath          |Value |
      |Response.Result|0     |
    And verify response time is less than "1500" milliseconds

  @NegativeScenario @InvalidValues
  Scenario: TC-24 Post Sale API with invalid skunit_erp_id  
    And I modify fields with random values and remove fields in "POST_SalesApi" XML payload
      |XPath                                    |Value          |
      |/sales/sale/payment/invoiceid            |randomInt      |
      |/sales/sale/payment/paymentErpId        |randomInt      |
      |/sales/sale/payment/outlet_erp_id           |erp123|
      |/sales/sale/payment/from_warehouse_erpid   |trp123|
      |/sales/sale/payment/mode                 |cash           |
      |/sales/sale/payment/amount               |4810.00000       |
      |/sales/sale/payment/fordate              |todayDate      |
      |/sales/sale/payment/employee_id          |1211          |
      |/sales/sale/paymentdetail/skunit_erp_id  |invalid_sku_99 |
    And I post the request with "POST_SalesApi" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And validating the response contains the string in XML response body
      |XPath          |Value |
      |Response.Result|0     |
    And verify response time is less than "1500" milliseconds

  @NegativeScenario @InvalidValues
  Scenario: TC-25 Post Sale API with negative quantity  
    And I modify fields with random values and remove fields in "POST_SalesApi" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/paymentErpId        |randomInt     |
      |/sales/sale/payment/outlet_erp_id           |erp123|
      |/sales/sale/payment/from_warehouse_erpid   |trp123|
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |4810.00000      |
      |/sales/sale/payment/fordate              |todayDate     |
      |/sales/sale/payment/employee_id          |1211         |
      |/sales/sale/paymentdetail/quantity       |-5            |
    And I post the request with "POST_SalesApi" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And validating the response contains the string in XML response body
      |XPath          |Value |
      |Response.Result|0     |
    And verify response time is less than "1500" milliseconds

  @NegativeScenario @InvalidValues
  Scenario: TC-26 Post Sale API with zero quantity  
    And I modify fields with random values and remove fields in "POST_SalesApi" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/paymentErpId        |randomInt     |
      |/sales/sale/payment/outlet_erp_id           |erp123|
      |/sales/sale/payment/from_warehouse_erpid   |trp123|
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |4810.00000      |
      |/sales/sale/payment/fordate              |todayDate     |
      |/sales/sale/payment/employee_id          |1211         |
      |/sales/sale/paymentdetail/quantity       |0             |
    And I post the request with "POST_SalesApi" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And validating the response contains the string in XML response body
      |XPath          |Value |
      |Response.Result|0     |
    And verify response time is less than "1500" milliseconds

  @NegativeScenario @InvalidValues
  Scenario: TC-27 Post Sale API with string value for numeric amount  
    And I modify fields with random values and remove fields in "POST_SalesApi" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/paymentErpId        |randomInt     |
      |/sales/sale/payment/outlet_erp_id           |erp123|
      |/sales/sale/payment/from_warehouse_erpid   |trp123|
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |not_a_number  |
      |/sales/sale/payment/fordate              |todayDate     |
      |/sales/sale/payment/employee_id          |1211         |
    And I post the request with "POST_SalesApi" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And validating the response contains the string in XML response body
      |XPath          |Value |
      |Response.Result|0     |
    And verify response time is less than "1500" milliseconds


  @AuthenticationScenario @Security
  Scenario: TC-28 Post Sale API without access token - Verify 401 error
    And I modify fields with random values and remove fields in "POST_SalesApi" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/paymentErpId        |randomInt     |
      |/sales/sale/payment/outlet_erp_id           |erp123|
      |/sales/sale/payment/from_warehouse_erpid   |trp123|
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |4810.00000      |
      |/sales/sale/payment/fordate              |todayDate     |
      |/sales/sale/payment/employee_id          |1211         |
    And I post the request with "POST_SalesApi" xml payload with dynamic access token and query parameters
      |Query |Value |
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      |JPath                |Value                          |
      |$.error              |invalid_request                |
      |$.error_description  |The access token was not found.|
    And verify response time is less than "1500" milliseconds

  @AuthenticationScenario @Security
  Scenario: TC-29 Post Sale API with invalid access token - Verify 401 error
    And I modify fields with random values and remove fields in "POST_SalesApi" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/paymentErpId        |randomInt     |
      |/sales/sale/payment/outlet_erp_id           |erp123|
      |/sales/sale/payment/from_warehouse_erpid   |trp123|
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |4810.00000      |
      |/sales/sale/payment/fordate              |todayDate     |
      |/sales/sale/payment/employee_id          |1211         |
    And I post the request with "POST_SalesApi" xml payload with dynamic access token and query parameters
      |Query        |Value               |
      |access_token |invalid_token_12345 |
    Then I should see the response code as "401"
    And verify response time is less than "1500" milliseconds

  @AuthenticationScenario @Security
  Scenario: TC-30 Post Sale API with expired access token - Verify 401 error
    And I modify fields with random values and remove fields in "POST_SalesApi" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/paymentErpId        |randomInt     |
      |/sales/sale/payment/outlet_erp_id           |erp123|
      |/sales/sale/payment/from_warehouse_erpid   |trp123|
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |4810.00000      |
      |/sales/sale/payment/fordate              |todayDate     |
      |/sales/sale/payment/employee_id          |1211         |
    And I post the request with "POST_SalesApi" xml payload with dynamic access token and query parameters
      |Query        |Value                                     |
      |access_token |expired_00000000000000000000000000000000  |
    Then I should see the response code as "401"
    And verify response time is less than "1500" milliseconds


  @BoundaryTest @DBValidation
  Scenario: TC-31 Post Sale API with minimum valid amount
    And I modify fields with random values and remove fields in "POST_SalesApi" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/paymentErpId        |randomInt     |
      |/sales/sale/payment/outlet_erp_id           |erp123|
      |/sales/sale/payment/from_warehouse_erpid   |trp123|
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |4810.00000          |
      |/sales/sale/payment/fordate              |todayDate     |
      |/sales/sale/payment/employee_id          |1211         |
      |/sales/sale/paymentdetail/amount         |4810.00000          |
    And I post the request with "POST_SalesApi" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader   |xmlValue |
      |Response.Result |0        |
    And I verify the data got updated as needed from DB
      |expectedColumn |expectedValue |
      |DB:payments:amount:id = (SELECT MAX(id) FROM payments WHERE oldpaymentid IS NULL) |4810.00000 |
    And verify response time is less than "1500" milliseconds

  @BoundaryTest @DBValidation
  Scenario: TC-32 Post Sale API with maximum valid quantity
    And I modify fields with random values and remove fields in "POST_SalesApi" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/paymentErpId        |randomInt     |
      |/sales/sale/payment/outlet_erp_id           |erp123|
      |/sales/sale/payment/from_warehouse_erpid   |trp123|
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |4810.00000      |
      |/sales/sale/payment/fordate              |todayDate     |
      |/sales/sale/payment/employee_id          |1211         |
      |/sales/sale/paymentdetail/quantity       |99999         |
    And I post the request with "POST_SalesApi" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader   |xmlValue |
      |Response.Result |0        |
    And I verify the data got updated as needed from DB
      |expectedColumn |expectedValue |
      |DB:payments:amount:id = (SELECT MAX(id) FROM payments WHERE oldpaymentid IS NULL) |4810.00000 |
    And verify response time is less than "1500" milliseconds

  @BoundaryTest
  Scenario: TC-33 Post Sale API with long invoiceid  
    And I modify fields with random values and remove fields in "POST_SalesApi" XML payload
      |XPath                                    |Value                                          |
      |/sales/sale/payment/invoiceid            |INV20241201123456789012345678901234567890      |
      |/sales/sale/payment/paymentErpId        |randomInt                                      |
      |/sales/sale/payment/outlet_erp_id           |erp123|
      |/sales/sale/payment/from_warehouse_erpid   |trp123|
      |/sales/sale/payment/mode                 |cash                                           |
      |/sales/sale/payment/amount               |4810.00000                                       |
      |/sales/sale/payment/fordate              |todayDate                                      |
      |/sales/sale/payment/employee_id          |1211                                          |
    And I post the request with "POST_SalesApi" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @BoundaryTest @DBValidation
  Scenario: TC-34 Post Sale API with tcs_amount at zero
    And I modify fields with random values and remove fields in "POST_SalesApi" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/paymentErpId        |randomInt     |
      |/sales/sale/payment/outlet_erp_id           |erp123|
      |/sales/sale/payment/from_warehouse_erpid   |trp123|
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |4810.00000      |
      |/sales/sale/payment/fordate              |todayDate     |
      |/sales/sale/payment/employee_id          |1211         |
    And I post the request with "POST_SalesApi" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader   |xmlValue |
      |Response.Result |0        |
    And verify response time is less than "1500" milliseconds


  @PaymentModeValidation @DBValidation
  Scenario: TC-35 Post Sale API with 'cash' payment mode  
    And I modify fields with random values and remove fields in "POST_SalesApi" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/paymentErpId        |randomInt     |
      |/sales/sale/payment/outlet_erp_id           |erp123|
      |/sales/sale/payment/from_warehouse_erpid   |trp123|
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |4810.00000      |
      |/sales/sale/payment/fordate              |todayDate     |
      |/sales/sale/payment/employee_id          |1211         |
    And I post the request with "POST_SalesApi" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader   |xmlValue |
      |Response.Result |0        |

  @PaymentModeValidation @DBValidation
  Scenario: TC-36 Post Sale API with 'credit' payment mode  
    And I modify fields with random values and remove fields in "POST_SalesApi" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/paymentErpId        |randomInt     |
      |/sales/sale/payment/outlet_erp_id           |erp123|
      |/sales/sale/payment/from_warehouse_erpid   |trp123|
      |/sales/sale/payment/mode                 |credit        |
      |/sales/sale/payment/amount               |4810.00000      |
      |/sales/sale/payment/fordate              |todayDate     |
      |/sales/sale/payment/employee_id          |1211         |
    And I post the request with "POST_SalesApi" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader   |xmlValue |
      |Response.Result |0        |
    And I verify the data got updated as needed from DB
      |expectedColumn |expectedValue |
      |DB:payments:mode:id = (SELECT MAX(id) FROM payments WHERE oldpaymentid IS NULL) |credit |
    And verify response time is less than "1500" milliseconds

  @PaymentModeValidation @DBValidation
  Scenario: TC-37 Post Sale API with 'online' payment mode  
    And I modify fields with random values and remove fields in "POST_SalesApi" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/paymentErpId        |randomInt     |
      |/sales/sale/payment/outlet_erp_id           |erp123|
      |/sales/sale/payment/from_warehouse_erpid   |trp123|
      |/sales/sale/payment/mode                 |online        |
      |/sales/sale/payment/amount               |4810.00000      |
      |/sales/sale/payment/fordate              |todayDate     |
      |/sales/sale/payment/employee_id          |1211         |
    And I post the request with "POST_SalesApi" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @StatusValidation @DBValidation
  Scenario: TC-38 Post Sale API with delivery status  
    And I modify fields with random values and remove fields in "POST_SalesApi" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/paymentErpId        |randomInt     |
      |/sales/sale/payment/outlet_erp_id           |erp123|
      |/sales/sale/payment/from_warehouse_erpid   |trp123|
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |4810.00000      |
      |/sales/sale/payment/fordate              |todayDate     |
      |/sales/sale/payment/employee_id          |1211         |
      |/sales/sale/payment/delivery_status      |0            |
    And I post the request with "POST_SalesApi" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader   |xmlValue |
      |Response.Result |0        |
    And I verify the data got updated as needed from DB
      |expectedColumn |expectedValue |
      |DB:payments:delivery_status:id = (SELECT MAX(id) FROM payments WHERE oldpaymentid IS NULL) |0|
    And verify response time is less than "1500" milliseconds

  @StatusValidation @NegativeScenario
  Scenario: TC-39 Post Sale API with invalid status value  
    And I modify fields with random values and remove fields in "POST_SalesApi" XML payload
      |XPath                                    |Value          |
      |/sales/sale/payment/invoiceid            |randomInt      |
      |/sales/sale/payment/paymentErpId        |randomInt      |
      |/sales/sale/payment/outlet_erp_id           |erp123|
      |/sales/sale/payment/from_warehouse_erpid   |trp123|
      |/sales/sale/payment/mode                 |cash           |
      |/sales/sale/payment/amount               |4810.00000       |
      |/sales/sale/payment/fordate              |todayDate      |
      |/sales/sale/payment/employee_id          |1211          |
      |/sales/sale/paymentdetail/status         |invalid_status |
    And I post the request with "POST_SalesApi" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And validating the response contains the string in XML response body
      |XPath          |Value |
      |Response.Result|0     |
    And verify response time is less than "1500" milliseconds


  @DuplicateValidation
  Scenario: TC-40 Post Sale API with duplicate invoiceid - Verify appropriate response
    And I modify fields with random values and remove fields in "POST_SalesApi" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |DUPLICATE001  |
      |/sales/sale/payment/paymentErpId        |randomInt     |
      |/sales/sale/payment/outlet_erp_id           |erp123|
      |/sales/sale/payment/from_warehouse_erpid   |trp123|
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |4810.00000      |
      |/sales/sale/payment/fordate              |todayDate     |
      |/sales/sale/payment/employee_id          |1211         |
    And I post the request with "POST_SalesApi" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    # First request should succeed
    And I modify fields with random values and remove fields in "POST_SalesApi" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |DUPLICATE001  |
      |/sales/sale/payment/paymentErpId        |randomInt     |
      |/sales/sale/payment/outlet_erp_id           |erp123|
      |/sales/sale/payment/from_warehouse_erpid   |trp123|
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |4810.00000      |
      |/sales/sale/payment/fordate              |todayDate     |
      |/sales/sale/payment/employee_id          |1211         |
    And I post the request with "POST_SalesApi" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    # Second request with same invoiceid should return appropriate response

  @PerformanceTest
  Scenario: TC-41 Post Sale API - Verify response time under 5 seconds
    And I modify fields with random values and remove fields in "POST_SalesApi" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/paymentErpId        |randomInt     |
      |/sales/sale/payment/outlet_erp_id           |erp123|
      |/sales/sale/payment/from_warehouse_erpid   |trp123|
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |4810.00000      |
      |/sales/sale/payment/fordate              |todayDate     |
      |/sales/sale/payment/employee_id          |1211         |
    And I post the request with "POST_SalesApi" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @PerformanceTest
  Scenario: TC-42 Post Sale API with large payload - Verify response time under 5 seconds
    And I modify fields with random values and remove fields in "POST_SalesApi" XML payload
      |XPath                                           |Value         |
      |/sales/sale/payment/invoiceid                   |randomInt     |
      |/sales/sale/payment/paymentErpId               |randomInt     |
      |/sales/sale/payment/outlet_erp_id                  |erp123|
      |/sales/sale/payment/from_warehouse_erpid          |trp123|
      |/sales/sale/payment/mode                        |cash          |
      |/sales/sale/payment/amount                      |4810.00000      |
      |/sales/sale/payment/fordate                     |todayDate     |
      |/sales/sale/payment/employee_id                 |1211         |
      |/sales/sale/payment/tcs_amount                  |10.00            |
      |/sales/sale/paymentdetail/skunit_erp_id         |6             |
      |/sales/sale/paymentdetail/quantityincases      |0             |
      |/sales/sale/paymentdetail/quantity             |1             |
      |/sales/sale/paymentdetail/status                |purchased     |
      |/sales/sale/paymentdetail/discount_type         |percent       |
      |/sales/sale/paymentdetail/discount              |10            |
      |/sales/sale/paymentdetail/schemediscount        |5.00          |
      |/sales/sale/paymentdetail/amount               |803.00        |
    And I post the request with "POST_SalesApi" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader              |xmlValue |
      |Response.Result            |0        |
    And verify response time is less than "1500" milliseconds

  @DataTypeValidation @DBValidation
  Scenario: TC-43 Validate numeric fields accept decimal values  
    And I modify fields with random values and remove fields in "POST_SalesApi" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/paymentErpId        |randomInt     |
      |/sales/sale/payment/outlet_erp_id           |erp123|
      |/sales/sale/payment/from_warehouse_erpid   |trp123|
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |4810.00000      |
      |/sales/sale/payment/fordate              |todayDate     |
      |/sales/sale/payment/employee_id          |1211         |
      |/sales/sale/paymentdetail/amount         |803.108       |
    And I post the request with "POST_SalesApi" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader   |xmlValue |
      |Response.Result |0       |
    And I verify the data got updated as needed from DB
      |expectedColumn |expectedValue |
      |DB:payments:amount:id = (SELECT MAX(id) FROM payments WHERE oldpaymentid IS NULL) |4810.00000 |
    And verify response time is less than "1500" milliseconds