@AddPrimarySales @Sanity @All @Execution @allPost
Feature: TC5154 This feature file contains testcases for POST Add Primary Sales API (/payments/addprimarysale/xml)

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/xml|


  @PrimarySalesAPIPositive @Smoke @DBValidation
  Scenario: TC-01 Post Add Primary Sales API with all valid data - Verify successful response
    And I modify fields with random values and remove fields in "POST_AddPrimarySales" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/erp_id               |trp123        |
      |/sales/sale/payment/outlet_erp_id        |erp123        |
      |/sales/sale/payment/from_warehouse_erpid |trp123        |
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |1560.205      |
      |/sales/sale/payment/fordate              |todayDate     |
      |/sales/sale/payment/dispatchdocno        |1223          |
      |/sales/sale/payment/disptachdocdate      |todayDate     |
      |/sales/sale/payment/tcs_percent          |10            |
      |/sales/sale/payment/tcs_amount           |15            |
    And I post the request with "POST_AddPrimarySales" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader              |xmlValue |
      |Response.Result            |0        |
    And I verify the data got updated as needed from DB
      |expectedColumn |expectedValue |
      |DB:payments:mode:id = (SELECT MAX(id) FROM payments) |online |
      |DB:payments:amount:id = (SELECT MAX(id) FROM payments) | 1208.55683 |
      |DB:payments:tcs_percent:id = (SELECT MAX(id) FROM payments) |10.000 |
    And verify response time is less than "2500" milliseconds
    And I store the response as "primary_sales_response" name using xml full path

  @PrimarySalesAPIPositive @DBValidation
  Scenario: TC-02 Post Add Primary Sales API with cash payment mode  
    And I modify fields with random values and remove fields in "POST_AddPrimarySales" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/outlet_erp_id        |erp123        |
      |/sales/sale/payment/from_warehouse_erpid |trp123        |
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |1560.205      |
      |/sales/sale/payment/fordate              |todayDate     |
    And I post the request with "POST_AddPrimarySales" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader              |xmlValue |
      |Response.Result            |0        |
    And I verify the data got updated as needed from DB
      |expectedColumn |expectedValue |
      |DB:payments:mode:id = (SELECT MAX(id) FROM payments) |online |
      |DB:payments:amount:id = (SELECT MAX(id) FROM payments) | 1208.55683 |
    And verify response time is less than "2500" milliseconds

  @PrimarySalesAPIPositive @DBValidation
  Scenario: TC-03 Post Add Primary Sales API with MRP and amount values - Verify response fields
    And I modify fields with random values and remove fields in "POST_AddPrimarySales" XML payload
      |XPath                                          |Value         |
      |/sales/sale/payment/invoiceid                  |randomInt     |
      |/sales/sale/payment/outlet_erp_id              |erp123        |
      |/sales/sale/payment/from_warehouse_erpid       |trp123        |
      |/sales/sale/payment/mode                       |cash          |
      |/sales/sale/payment/mrp                        |29.00         |
      |/sales/sale/payment/amount                     |1560.205      |
      |/sales/sale/payment/fordate                    |todayDate     |
      |/sales/sale/paymentdetail/mrp                  |29.00         |
      |/sales/sale/paymentdetail/amount               |803.00        |
    And I post the request with "POST_AddPrimarySales" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader              |xmlValue |
      |Response.Result            |0        |
    And I verify the data got updated as needed from DB
      |expectedColumn |expectedValue |
      |DB:payments:mode:id = (SELECT MAX(id) FROM payments) |online |
      |DB:payments:amount:id = (SELECT MAX(id) FROM payments) | 1208.55683 |
    And verify response time is less than "2500" milliseconds

  @PrimarySalesAPIPositive @DBValidation
  Scenario: TC-04 Post Add Primary Sales API with TCS percent and amount - Verify tax calculation
    And I modify fields with random values and remove fields in "POST_AddPrimarySales" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/outlet_erp_id        |erp123        |
      |/sales/sale/payment/from_warehouse_erpid |trp123        |
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |1560.205      |
      |/sales/sale/payment/fordate              |todayDate     |
      |/sales/sale/payment/tcs_percent          |10.000            |
      |/sales/sale/payment/tcs_amount           |15            |
    And I post the request with "POST_AddPrimarySales" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader              |xmlValue |
      |Response.Result            |0        |
    And I verify the data got updated as needed from DB
      |expectedColumn |expectedValue |
      |DB:payments:mode:id = (SELECT MAX(id) FROM payments) |online |
      |DB:payments:amount:id = (SELECT MAX(id) FROM payments) | 1208.55683 |
      |DB:payments:tcs_percent:id = (SELECT MAX(id) FROM payments) |10.000 |
    And verify response time is less than "2500" milliseconds

  @PrimarySalesAPIPositive @DBValidation
  Scenario: TC-05 Post Add Primary Sales API with GST and CESS values - Verify paymentdetail taxes
    And I modify fields with random values and remove fields in "POST_AddPrimarySales" XML payload
      |XPath                                          |Value         |
      |/sales/sale/payment/invoiceid                  |randomInt     |
      |/sales/sale/payment/outlet_erp_id              |erp123        |
      |/sales/sale/payment/from_warehouse_erpid       |trp123        |
      |/sales/sale/payment/mode                       |cash          |
      |/sales/sale/payment/amount                     |1560.205      |
      |/sales/sale/payment/fordate                    |todayDate     |
      |/sales/sale/paymentdetail/customgst            |15            |
      |/sales/sale/paymentdetail/customcess           |5             |
    And I post the request with "POST_AddPrimarySales" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader              |xmlValue |
      |Response.Result            |0        |
    And I verify the data got updated as needed from DB
      |expectedColumn |expectedValue |
      |DB:payments:mode:id = (SELECT MAX(id) FROM payments) |online |
      |DB:payments:amount:id = (SELECT MAX(id) FROM payments) | 1208.55683 |
    And verify response time is less than "2500" milliseconds

  @PrimarySalesAPIPositive @DBValidation
  Scenario: TC-06 Post Add Primary Sales API with dispatch document details - Verify invoicebillno
    And I modify fields with random values and remove fields in "POST_AddPrimarySales" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/outlet_erp_id        |erp123        |
      |/sales/sale/payment/from_warehouse_erpid |trp123        |
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |1560.205      |
      |/sales/sale/payment/fordate              |todayDate     |
      |/sales/sale/payment/dispatchdocno        |1223          |
      |/sales/sale/payment/disptachdocdate      |todayDate     |
      |/sales/sale/payment/invoicebillno        |randomInt     |
    And I post the request with "POST_AddPrimarySales" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader              |xmlValue |
      |Response.Result            |0        |
    And I verify the data got updated as needed from DB
      |expectedColumn |expectedValue |
      |DB:payments:mode:id = (SELECT MAX(id) FROM payments) |online |
      |DB:payments:amount:id = (SELECT MAX(id) FROM payments) | 1208.55683 |
      |DB:payments:dispatchdocno:id = (SELECT MAX(id) FROM payments) |1223 |
    And verify response time is less than "2500" milliseconds

  @PrimarySalesAPIPositive @DBValidation
  Scenario: TC-07 Post Add Primary Sales API with initializeInventory enabled - Verify inventory flag
    And I modify fields with random values and remove fields in "POST_AddPrimarySales" XML payload
      |XPath                                          |Value         |
      |/sales/sale/payment/invoiceid                  |randomInt     |
      |/sales/sale/payment/outlet_erp_id              |erp123        |
      |/sales/sale/payment/from_warehouse_erpid       |trp123        |
      |/sales/sale/payment/mode                       |cash          |
      |/sales/sale/payment/amount                     |1560.205      |
      |/sales/sale/payment/fordate                    |todayDate     |
      |/sales/sale/paymentdetail/initializeInventory  |1             |
    And I post the request with "POST_AddPrimarySales" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader              |xmlValue |
      |Response.Result            |0        |
    And I verify the data got updated as needed from DB
      |expectedColumn |expectedValue |
      |DB:payments:mode:id = (SELECT MAX(id) FROM payments) |online |
      |DB:payments:amount:id = (SELECT MAX(id) FROM payments) | 1208.55683 |
    And verify response time is less than "2500" milliseconds

  @ResponseFieldValidation @FieldValidation
  Scenario: TC-08 Validate Response field - Result should be 1 for successful transaction
    And I modify fields with random values and remove fields in "POST_AddPrimarySales" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/outlet_erp_id        |erp123        |
      |/sales/sale/payment/from_warehouse_erpid |trp123        |
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |1560.205      |
      |/sales/sale/payment/fordate              |todayDate     |
    And I post the request with "POST_AddPrimarySales" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader   |xmlValue |
      |Response.Result |0        |
    And verify response time is less than "2500" milliseconds

  @ResponseFieldValidation @FieldValidation
  Scenario: TC-09 Validate Response field - printerType should be 'regular'
    And I modify fields with random values and remove fields in "POST_AddPrimarySales" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/outlet_erp_id        |erp123        |
      |/sales/sale/payment/from_warehouse_erpid |trp123        |
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |1560.205      |
      |/sales/sale/payment/fordate              |todayDate     |
    And I post the request with "POST_AddPrimarySales" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @ResponseFieldValidation @FieldValidation
  Scenario: TC-10 Validate Response field - paymentId should be present and not empty
    And I modify fields with random values and remove fields in "POST_AddPrimarySales" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/outlet_erp_id        |erp123        |
      |/sales/sale/payment/from_warehouse_erpid |trp123        |
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |1560.205      |
      |/sales/sale/payment/fordate              |todayDate     |
    And I post the request with "POST_AddPrimarySales" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader   |xmlValue |
      |Response.Result |0        |
    And verify response time is less than "2500" milliseconds

  @ResponseFieldValidation @FieldValidation
  Scenario: TC-11 Validate Response field - invoiceid in response matches request invoiceid
    And I modify fields with random values and remove fields in "POST_AddPrimarySales" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |345044399     |
      |/sales/sale/payment/outlet_erp_id        |erp123        |
      |/sales/sale/payment/from_warehouse_erpid |trp123        |
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |1560.205      |
      |/sales/sale/payment/fordate              |todayDate     |
    And I post the request with "POST_AddPrimarySales" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader   |xmlValue |
      |Response.Result |0        |
    And verify response time is less than "2500" milliseconds

  @ResponseFieldValidation @FieldValidation
  Scenario: TC-12 Validate Response field - invoiceDate should be not null in request
    And I modify fields with random values and remove fields in "POST_AddPrimarySales" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/outlet_erp_id        |erp123        |
      |/sales/sale/payment/from_warehouse_erpid |trp123        |
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |1560.205      |
    And I post the request with "POST_AddPrimarySales" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @ResponseFieldValidation1 @FieldValidation
  Scenario: TC-13 Validate Response field - schemeBudgetAlert should be 0 for normal transactions
    And I modify fields with random values and remove fields in "POST_AddPrimarySales" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/outlet_erp_id        |erp123        |
      |/sales/sale/payment/from_warehouse_erpid |trp123        |
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |1560.205      |
      |/sales/sale/payment/fordate              |todayDate     |
    And I post the request with "POST_AddPrimarySales" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader              |xmlValue |
      |Response.Result |0        |
    And verify response time is less than "2500" milliseconds

  @FieldValidation @PaymentFields @NegativeScenario
  Scenario: TC-14 Validate required field - invoiceid is mandatory
    And I modify fields with random values and remove fields in "POST_AddPrimarySales" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/outlet_erp_id        |erp123        |
      |/sales/sale/payment/from_warehouse_erpid |trp123        |
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |1560.205      |
      |/sales/sale/payment/fordate              |todayDate     |
    And I remove the fields from XML "POST_AddPrimarySales" payload
      |XPath                           |
      |/sales/sale/payment/invoiceid   |
    And I post the request with "POST_AddPrimarySales" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And validating the response contains the string in XML response body
      |XPath          |Value |
      |Response.Result|0     |
    And verify response time is less than "2500" milliseconds

  @FieldValidation @PaymentFields @NegativeScenario
  Scenario: TC-15 Validate required field - outlet_erp_id is mandatory
    And I modify fields with random values and remove fields in "POST_AddPrimarySales" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/from_warehouse_erpid |trp123        |
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |1560.205      |
      |/sales/sale/payment/fordate              |todayDate     |
    And I remove the fields from XML "POST_AddPrimarySales" payload
      |XPath                              |
      |/sales/sale/payment/outlet_erp_id  |
    And I post the request with "POST_AddPrimarySales" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And validating the response contains the string in XML response body
      |XPath          |Value |
      |Response.Result|0     |
    And verify response time is less than "2500" milliseconds

  @FieldValidation @PaymentFields @NegativeScenario
  Scenario: TC-16 Validate required field - from_warehouse_erpid is mandatory
    And I modify fields with random values and remove fields in "POST_AddPrimarySales" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/outlet_erp_id        |erp123        |
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |1560.205      |
      |/sales/sale/payment/fordate              |todayDate     |
    And I remove the fields from XML "POST_AddPrimarySales" payload
      |XPath                                     |
      |/sales/sale/payment/from_warehouse_erpid  |
    And I post the request with "POST_AddPrimarySales" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And validating the response contains the string in XML response body
      |XPath          |Value |
      |Response.Result|0     |
    And verify response time is less than "2500" milliseconds

  @FieldValidation @PaymentFields @NegativeScenario
  Scenario: TC-17 Validate required field - mode is mandatory
    And I modify fields with random values and remove fields in "POST_AddPrimarySales" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/outlet_erp_id        |erp123        |
      |/sales/sale/payment/from_warehouse_erpid |trp123        |
      |/sales/sale/payment/amount               |1560.205      |
      |/sales/sale/payment/fordate              |todayDate     |
    And I remove the fields from XML "POST_AddPrimarySales" payload
      |XPath                       |
      |/sales/sale/payment/mode    |
    And I post the request with "POST_AddPrimarySales" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And validating the response contains the string in XML response body
      |XPath          |Value |
      |Response.Result|0     |
    And verify response time is less than "2500" milliseconds

  @FieldValidation @PaymentFields @NegativeScenario
  Scenario: TC-18 Validate required field - amount is mandatory
    And I modify fields with random values and remove fields in "POST_AddPrimarySales" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/outlet_erp_id        |erp123        |
      |/sales/sale/payment/from_warehouse_erpid |trp123        |
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/fordate              |todayDate     |
    And I remove the fields from XML "POST_AddPrimarySales" payload
      |XPath                        |
      |/sales/sale/payment/amount   |
    And I post the request with "POST_AddPrimarySales" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And validating the response contains the string in XML response body
      |XPath          |Value |
      |Response.Result|0     |
    And verify response time is less than "2500" milliseconds

  @FieldValidation @PaymentFields @NegativeScenario
  Scenario: TC-19 Validate required field - fordate is mandatory
    And I modify fields with random values and remove fields in "POST_AddPrimarySales" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/outlet_erp_id        |erp123        |
      |/sales/sale/payment/from_warehouse_erpid |trp123        |
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |1560.205      |
    And I remove the fields from XML "POST_AddPrimarySales" payload
      |XPath                        |
      |/sales/sale/payment/fordate  |
    And I post the request with "POST_AddPrimarySales" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And validating the response contains the string in XML response body
      |XPath          |Value |
      |Response.Result|0     |
    And verify response time is less than "2500" milliseconds

  @FieldValidation @PaymentDetailFields @NegativeScenario
  Scenario: TC-20 Validate required field - skunit_erp_id is mandatory in paymentdetail
    And I modify fields with random values and remove fields in "POST_AddPrimarySales" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/outlet_erp_id        |erp123        |
      |/sales/sale/payment/from_warehouse_erpid |trp123        |
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |1560.205      |
      |/sales/sale/payment/fordate              |todayDate     |
    And I remove the fields from XML "POST_AddPrimarySales" payload
      |XPath                                   |
      |/sales/sale/paymentdetail/skunit_erp_id |
    And I post the request with "POST_AddPrimarySales" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And validating the response contains the string in XML response body
      |XPath          |Value |
      |Response.Result|0     |
    And verify response time is less than "2500" milliseconds

  @FieldValidation @PaymentDetailFields @NegativeScenario
  Scenario: TC-21 Validate required field - quantity is mandatory in paymentdetail
    And I modify fields with random values and remove fields in "POST_AddPrimarySales" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/outlet_erp_id        |erp123        |
      |/sales/sale/payment/from_warehouse_erpid |trp123        |
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |1560.205      |
      |/sales/sale/payment/fordate              |todayDate     |
    And I remove the fields from XML "POST_AddPrimarySales" payload
      |XPath                                |
      |/sales/sale/paymentdetail/quantity   |
    And I post the request with "POST_AddPrimarySales" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And validating the response contains the string in XML response body
      |XPath          |Value |
      |Response.Result|0     |
    And verify response time is less than "2500" milliseconds

  @FieldValidation @PaymentDetailFields @NegativeScenario
  Scenario: TC-22 Validate required field - status is mandatory in paymentdetail
    And I modify fields with random values and remove fields in "POST_AddPrimarySales" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/outlet_erp_id        |erp123        |
      |/sales/sale/payment/from_warehouse_erpid |trp123        |
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |1560.205      |
      |/sales/sale/payment/fordate              |todayDate     |
    And I remove the fields from XML "POST_AddPrimarySales" payload
      |XPath                              |
      |/sales/sale/paymentdetail/status   |
    And I post the request with "POST_AddPrimarySales" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And validating the response contains the string in XML response body
      |XPath          |Value |
      |Response.Result|0     |
    And verify response time is less than "2500" milliseconds

  @FieldValidation @PaymentDetailFields @NegativeScenario
  Scenario: TC-23 Validate required field - amount is mandatory in paymentdetail
    And I modify fields with random values and remove fields in "POST_AddPrimarySales" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/outlet_erp_id        |erp123        |
      |/sales/sale/payment/from_warehouse_erpid |trp123        |
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |1560.205      |
      |/sales/sale/payment/fordate              |todayDate     |
    And I remove the fields from XML "POST_AddPrimarySales" payload
      |XPath                              |
      |/sales/sale/paymentdetail/amount   |
    And I post the request with "POST_AddPrimarySales" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And validating the response contains the string in XML response body
      |XPath          |Value |
      |Response.Result|0     |
    And verify response time is less than "2500" milliseconds

  @NegativeScenario @InvalidValues
  Scenario: TC-24 Post Add Primary Sales API with invalid outlet_erp_id
    And I modify fields with random values and remove fields in "POST_AddPrimarySales" XML payload
      |XPath                                    |Value              |
      |/sales/sale/payment/invoiceid            |randomInt          |
      |/sales/sale/payment/outlet_erp_id        |invalid_outlet_999 |
      |/sales/sale/payment/from_warehouse_erpid |trp123             |
      |/sales/sale/payment/mode                 |cash               |
      |/sales/sale/payment/amount               |1560.205           |
      |/sales/sale/payment/fordate              |todayDate          |
    And I post the request with "POST_AddPrimarySales" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And validating the response contains the string in XML response body
      |XPath          |Value |
      |Response.Result|0     |
    And verify response time is less than "2500" milliseconds

  @NegativeScenario @InvalidValues
  Scenario: TC-25 Post Add Primary Sales API with invalid from_warehouse_erpid  
    And I modify fields with random values and remove fields in "POST_AddPrimarySales" XML payload
      |XPath                                    |Value                 |
      |/sales/sale/payment/invoiceid            |randomInt             |
      |/sales/sale/payment/outlet_erp_id        |erp123                |
      |/sales/sale/payment/from_warehouse_erpid |invalid_warehouse_999 |
      |/sales/sale/payment/mode                 |cash                  |
      |/sales/sale/payment/amount               |1560.205              |
      |/sales/sale/payment/fordate              |todayDate             |
    And I post the request with "POST_AddPrimarySales" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And validating the response contains the string in XML response body
      |XPath          |Value |
      |Response.Result|0     |
    And verify response time is less than "2500" milliseconds

  @NegativeScenario @InvalidValues
  Scenario: TC-26 Post Add Primary Sales API with invalid payment mode  
    And I modify fields with random values and remove fields in "POST_AddPrimarySales" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/outlet_erp_id        |erp123        |
      |/sales/sale/payment/from_warehouse_erpid |trp123        |
      |/sales/sale/payment/mode                 |invalid_mode  |
      |/sales/sale/payment/amount               |1560.205      |
      |/sales/sale/payment/fordate              |todayDate     |
    And I post the request with "POST_AddPrimarySales" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And validating the response contains the string in XML response body
      |XPath          |Value |
      |Response.Result|0     |
    And verify response time is less than "2500" milliseconds

  @NegativeScenario @InvalidValues
  Scenario: TC-27 Post Add Primary Sales API with negative amount  
    And I modify fields with random values and remove fields in "POST_AddPrimarySales" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/outlet_erp_id        |erp123        |
      |/sales/sale/payment/from_warehouse_erpid |trp123        |
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |-500.00       |
      |/sales/sale/payment/fordate              |todayDate     |
    And I post the request with "POST_AddPrimarySales" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And validating the response contains the string in XML response body
      |XPath          |Value |
      |Response.Result|0     |
    And verify response time is less than "2500" milliseconds

  @NegativeScenario @InvalidValues
  Scenario: TC-28 Post Add Primary Sales API with invalid date format  
    And I modify fields with random values and remove fields in "POST_AddPrimarySales" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/outlet_erp_id        |erp123        |
      |/sales/sale/payment/from_warehouse_erpid |trp123        |
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |1560.205      |
      |/sales/sale/payment/fordate              |27-09-2024    |
    And I post the request with "POST_AddPrimarySales" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And validating the response contains the string in XML response body
      |XPath          |Value |
      |Response.Result|0     |
    And verify response time is less than "2500" milliseconds

  @NegativeScenario @InvalidValues
  Scenario: TC-29 Post Add Primary Sales API with invalid skunit_erp_id  
    And I modify fields with random values and remove fields in "POST_AddPrimarySales" XML payload
      |XPath                                    |Value          |
      |/sales/sale/payment/invoiceid            |randomInt      |
      |/sales/sale/payment/outlet_erp_id        |erp123         |
      |/sales/sale/payment/from_warehouse_erpid |trp123         |
      |/sales/sale/payment/mode                 |cash           |
      |/sales/sale/payment/amount               |1560.205       |
      |/sales/sale/payment/fordate              |todayDate      |
      |/sales/sale/paymentdetail/skunit_erp_id  |invalid_sku_99 |
    And I post the request with "POST_AddPrimarySales" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And validating the response contains the string in XML response body
      |XPath          |Value |
      |Response.Result|0     |
    And verify response time is less than "2500" milliseconds

  @NegativeScenario @InvalidValues
  Scenario: TC-30 Post Add Primary Sales API with negative quantity  
    And I modify fields with random values and remove fields in "POST_AddPrimarySales" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/outlet_erp_id        |erp123        |
      |/sales/sale/payment/from_warehouse_erpid |trp123        |
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |1560.205      |
      |/sales/sale/payment/fordate              |todayDate     |
      |/sales/sale/paymentdetail/quantity       |-5            |
    And I post the request with "POST_AddPrimarySales" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And validating the response contains the string in XML response body
      |XPath          |Value |
      |Response.Result|0     |
    And verify response time is less than "2500" milliseconds

  @NegativeScenario @InvalidValues
  Scenario: TC-31 Post Add Primary Sales API with zero quantity  
    And I modify fields with random values and remove fields in "POST_AddPrimarySales" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/outlet_erp_id        |erp123        |
      |/sales/sale/payment/from_warehouse_erpid |trp123        |
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |1560.205      |
      |/sales/sale/payment/fordate              |todayDate     |
      |/sales/sale/paymentdetail/quantity       |0             |
    And I post the request with "POST_AddPrimarySales" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And validating the response contains the string in XML response body
      |XPath          |Value |
      |Response.Result|0     |
    And verify response time is less than "2500" milliseconds

  @NegativeScenario @InvalidValues
  Scenario: TC-32 Post Add Primary Sales API with string value for numeric amount  
    And I modify fields with random values and remove fields in "POST_AddPrimarySales" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/outlet_erp_id        |erp123        |
      |/sales/sale/payment/from_warehouse_erpid |trp123        |
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |not_a_number  |
      |/sales/sale/payment/fordate              |todayDate     |
    And I post the request with "POST_AddPrimarySales" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And validating the response contains the string in XML response body
      |XPath          |Value |
      |Response.Result|0     |
    And verify response time is less than "2500" milliseconds


  @AuthenticationScenario @Security
  Scenario: TC-33 Post Add Primary Sales API without access token - Verify 401 error
    And I modify fields with random values and remove fields in "POST_AddPrimarySales" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/outlet_erp_id        |erp123        |
      |/sales/sale/payment/from_warehouse_erpid |trp123        |
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |1560.205      |
      |/sales/sale/payment/fordate              |todayDate     |
    And I post the request with "POST_AddPrimarySales" xml payload with dynamic access token and query parameters
      |Query |Value |
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      |JPath                |Value                          |
      |$.error              |invalid_request                |
      |$.error_description  |The access token was not found.|
    And verify response time is less than "2500" milliseconds

  @AuthenticationScenario @Security
  Scenario: TC-34 Post Add Primary Sales API with invalid access token - Verify 401 error
    And I modify fields with random values and remove fields in "POST_AddPrimarySales" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/outlet_erp_id        |erp123        |
      |/sales/sale/payment/from_warehouse_erpid |trp123        |
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |1560.205      |
      |/sales/sale/payment/fordate              |todayDate     |
    And I post the request with "POST_AddPrimarySales" xml payload with dynamic access token and query parameters
      |Query        |Value               |
      |access_token |invalid_token_12345 |
    Then I should see the response code as "401"
    And verify response time is less than "2500" milliseconds

  @AuthenticationScenario @Security
  Scenario: TC-35 Post Add Primary Sales API with expired access token - Verify 401 error
    And I modify fields with random values and remove fields in "POST_AddPrimarySales" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/outlet_erp_id        |erp123        |
      |/sales/sale/payment/from_warehouse_erpid |trp123        |
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |1560.205      |
      |/sales/sale/payment/fordate              |todayDate     |
    And I post the request with "POST_AddPrimarySales" xml payload with dynamic access token and query parameters
      |Query        |Value                                     |
      |access_token |expired_00000000000000000000000000000000  |
    Then I should see the response code as "401"
    And verify response time is less than "2500" milliseconds


  @BoundaryTest @DBValidation
  Scenario: TC-36 Post Add Primary Sales API with minimum valid amount
    And I modify fields with random values and remove fields in "POST_AddPrimarySales" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/outlet_erp_id        |erp123        |
      |/sales/sale/payment/from_warehouse_erpid |trp123        |
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |0.01          |
      |/sales/sale/payment/fordate              |todayDate     |
      |/sales/sale/paymentdetail/amount         |0.01          |
    And I post the request with "POST_AddPrimarySales" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader   |xmlValue |
      |Response.Result |0        |
    And I verify the data got updated as needed from DB
      |expectedColumn |expectedValue |
      |DB:payments:mode:id = (SELECT MAX(id) FROM payments) |online |
      |DB:payments:amount:id = (SELECT MAX(id) FROM payments) | 1208.55683 |
    And verify response time is less than "2500" milliseconds

  @BoundaryTest @DBValidation
  Scenario: TC-37 Post Add Primary Sales API with maximum valid quantity
    And I modify fields with random values and remove fields in "POST_AddPrimarySales" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/outlet_erp_id        |erp123        |
      |/sales/sale/payment/from_warehouse_erpid |trp123        |
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |99999.99      |
      |/sales/sale/payment/fordate              |todayDate     |
      |/sales/sale/paymentdetail/quantity       |99999         |
    And I post the request with "POST_AddPrimarySales" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader   |xmlValue |
      |Response.Result |0        |
    And I verify the data got updated as needed from DB
      |expectedColumn |expectedValue |
      |DB:payments:mode:id = (SELECT MAX(id) FROM payments) |online |
      |DB:payments:amount:id = (SELECT MAX(id) FROM payments) | 1208.55683 |
    And verify response time is less than "2500" milliseconds

  @BoundaryTest
  Scenario: TC-38 Post Add Primary Sales API with long invoiceid  
    And I modify fields with random values and remove fields in "POST_AddPrimarySales" XML payload
      |XPath                                    |Value                                          |
      |/sales/sale/payment/invoiceid            |INV20241201123456789012345678901234567890      |
      |/sales/sale/payment/outlet_erp_id        |erp123                                         |
      |/sales/sale/payment/from_warehouse_erpid |trp123                                         |
      |/sales/sale/payment/mode                 |cash                                           |
      |/sales/sale/payment/amount               |1560.205                                       |
      |/sales/sale/payment/fordate              |todayDate                                      |
    And I post the request with "POST_AddPrimarySales" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @BoundaryTest @DBValidation
  Scenario: TC-39 Post Add Primary Sales API with tcs_percent
    And I modify fields with random values and remove fields in "POST_AddPrimarySales" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/outlet_erp_id        |erp123        |
      |/sales/sale/payment/from_warehouse_erpid |trp123        |
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |1560.205      |
      |/sales/sale/payment/fordate              |todayDate     |
      |/sales/sale/payment/tcs_percent          |10.000           |
      |/sales/sale/payment/tcs_amount           |0             |
    And I post the request with "POST_AddPrimarySales" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader   |xmlValue |
      |Response.Result |0       |
    And I verify the data got updated as needed from DB
      |expectedColumn |expectedValue |
      |DB:payments:mode:id = (SELECT MAX(id) FROM payments) |online |
      |DB:payments:amount:id = (SELECT MAX(id) FROM payments) | 1208.55683 |
      |DB:payments:tcs_percent:id = (SELECT MAX(id) FROM payments) |10.000   |
    And verify response time is less than "2500" milliseconds

  @BoundaryTest @DBValidation
  Scenario: TC-40 Post Add Primary Sales API with tcs_percent at 100
    And I modify fields with random values and remove fields in "POST_AddPrimarySales" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/outlet_erp_id        |erp123        |
      |/sales/sale/payment/from_warehouse_erpid |trp123        |
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |1560.205      |
      |/sales/sale/payment/fordate              |todayDate     |
      |/sales/sale/payment/tcs_percent          |10.000           |
      |/sales/sale/payment/tcs_amount           |1560.205      |
    And I post the request with "POST_AddPrimarySales" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader   |xmlValue |
      |Response.Result |0        |
    And I verify the data got updated as needed from DB
      |expectedColumn |expectedValue |
      |DB:payments:mode:id = (SELECT MAX(id) FROM payments) |online |
      |DB:payments:amount:id = (SELECT MAX(id) FROM payments) | 1208.55683 |
      |DB:payments:tcs_percent:id = (SELECT MAX(id) FROM payments) |10.000   |
    And verify response time is less than "2500" milliseconds


  @PaymentModeValidation @DBValidation
  Scenario: TC-41 Post Add Primary Sales API with 'cash' payment mode  
    And I modify fields with random values and remove fields in "POST_AddPrimarySales" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/outlet_erp_id        |erp123        |
      |/sales/sale/payment/from_warehouse_erpid |trp123        |
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |1560.205      |
      |/sales/sale/payment/fordate              |todayDate     |
    And I post the request with "POST_AddPrimarySales" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader   |xmlValue |
      |Response.Result |0        |
    And I verify the data got updated as needed from DB
      |expectedColumn |expectedValue |
      |DB:payments:mode:id = (SELECT MAX(id) FROM payments) |online |
      |DB:payments:amount:id = (SELECT MAX(id) FROM payments) | 1208.55683 |

  @PaymentModeValidation @DBValidation
  Scenario: TC-42 Post Add Primary Sales API with 'credit' payment mode  
    And I modify fields with random values and remove fields in "POST_AddPrimarySales" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/outlet_erp_id        |erp123        |
      |/sales/sale/payment/from_warehouse_erpid |trp123        |
      |/sales/sale/payment/mode                 |credit        |
      |/sales/sale/payment/amount               |1560.205      |
      |/sales/sale/payment/fordate              |todayDate     |
    And I post the request with "POST_AddPrimarySales" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader   |xmlValue |
      |Response.Result |0        |
    And I verify the data got updated as needed from DB
      |expectedColumn |expectedValue |
      |DB:payments:mode:id = (SELECT MAX(id) FROM payments) |online |
      |DB:payments:amount:id = (SELECT MAX(id) FROM payments) | 1208.55683 |
    And verify response time is less than "2500" milliseconds

  @PaymentModeValidation @DBValidation
  Scenario: TC-43 Post Add Primary Sales API with 'online' payment mode  
    And I modify fields with random values and remove fields in "POST_AddPrimarySales" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/outlet_erp_id        |erp123        |
      |/sales/sale/payment/from_warehouse_erpid |trp123        |
      |/sales/sale/payment/mode                 |online        |
      |/sales/sale/payment/amount               |1560.205      |
      |/sales/sale/payment/fordate              |todayDate     |
    And I post the request with "POST_AddPrimarySales" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader   |xmlValue |
      |Response.Result |0        |
    And I verify the data got updated as needed from DB
      |expectedColumn |expectedValue |
      |DB:payments:mode:id = (SELECT MAX(id) FROM payments) |online |
      |DB:payments:amount:id = (SELECT MAX(id) FROM payments) | 1208.55683 |
    And verify response time is less than "2500" milliseconds

  @StatusValidation @DBValidation
  Scenario: TC-44 Post Add Primary Sales API with 'purchased' status  
    And I modify fields with random values and remove fields in "POST_AddPrimarySales" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/outlet_erp_id        |erp123        |
      |/sales/sale/payment/from_warehouse_erpid |trp123        |
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |1560.205      |
      |/sales/sale/payment/fordate              |todayDate     |
      |/sales/sale/paymentdetail/status         |purchased     |
    And I post the request with "POST_AddPrimarySales" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader   |xmlValue |
      |Response.Result |0        |
    And I verify the data got updated as needed from DB
      |expectedColumn |expectedValue |
      |DB:payments:mode:id = (SELECT MAX(id) FROM payments) |online |
      |DB:payments:amount:id = (SELECT MAX(id) FROM payments) |1208.55683 |
    And verify response time is less than "2500" milliseconds

  @StatusValidation @NegativeScenario
  Scenario: TC-45 Post Add Primary Sales API with invalid status value  
    And I modify fields with random values and remove fields in "POST_AddPrimarySales" XML payload
      |XPath                                    |Value          |
      |/sales/sale/payment/invoiceid            |randomInt      |
      |/sales/sale/payment/outlet_erp_id        |erp123         |
      |/sales/sale/payment/from_warehouse_erpid |trp123         |
      |/sales/sale/payment/mode                 |cash           |
      |/sales/sale/payment/amount               |1560.205       |
      |/sales/sale/payment/fordate              |todayDate      |
      |/sales/sale/paymentdetail/status         |invalid_status |
    And I post the request with "POST_AddPrimarySales" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And validating the response contains the string in XML response body
      |XPath          |Value |
      |Response.Result|0     |
    And verify response time is less than "2500" milliseconds


  @DuplicateValidation
  Scenario: TC-46 Post Add Primary Sales API with duplicate invoiceid - Verify appropriate response
    And I modify fields with random values and remove fields in "POST_AddPrimarySales" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |DUPLICATE001  |
      |/sales/sale/payment/outlet_erp_id        |erp123        |
      |/sales/sale/payment/from_warehouse_erpid |trp123        |
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |1560.205      |
      |/sales/sale/payment/fordate              |todayDate     |
    And I post the request with "POST_AddPrimarySales" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    # First request should succeed
    And I modify fields with random values and remove fields in "POST_AddPrimarySales" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |DUPLICATE001  |
      |/sales/sale/payment/outlet_erp_id        |erp123        |
      |/sales/sale/payment/from_warehouse_erpid |trp123        |
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |1560.205      |
      |/sales/sale/payment/fordate              |todayDate     |
    And I post the request with "POST_AddPrimarySales" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    # Second request with same invoiceid should return appropriate response

  @PerformanceTest
  Scenario: TC-47 Post Add Primary Sales API - Verify response time under 3 seconds
    And I modify fields with random values and remove fields in "POST_AddPrimarySales" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/outlet_erp_id        |erp123        |
      |/sales/sale/payment/from_warehouse_erpid |trp123        |
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/amount               |1560.205      |
      |/sales/sale/payment/fordate              |todayDate     |
    And I post the request with "POST_AddPrimarySales" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @PerformanceTest @DBValidation
  Scenario: TC-48 Post Add Primary Sales API with large payload - Verify response time under 5 seconds
    And I modify fields with random values and remove fields in "POST_AddPrimarySales" XML payload
      |XPath                                           |Value         |
      |/sales/sale/payment/invoiceid                   |randomInt     |
      |/sales/sale/payment/erp_id                      |trp123        |
      |/sales/sale/payment/outlet_erp_id               |erp123        |
      |/sales/sale/payment/from_warehouse_erpid        |trp123        |
      |/sales/sale/payment/mode                        |cash          |
      |/sales/sale/payment/mrp                         |29.00         |
      |/sales/sale/payment/amount                      |1560.205      |
      |/sales/sale/payment/fordate                     |todayDate     |
      |/sales/sale/payment/dispatchdocno               |1223          |
      |/sales/sale/payment/disptachdocdate             |todayDate     |
      |/sales/sale/payment/invoicebillno               |randomInt     |
      |/sales/sale/payment/tcs_percent                 |10            |
      |/sales/sale/payment/tcs_amount                  |15            |
      |/sales/sale/paymentdetail/skunit_erp_id         |Fanta         |
      |/sales/sale/paymentdetail/quantityincases       |0             |
      |/sales/sale/paymentdetail/quantity              |1             |
      |/sales/sale/paymentdetail/quantity_unitcase     |0             |
      |/sales/sale/paymentdetail/customgst             |15            |
      |/sales/sale/paymentdetail/customcess            |5             |
      |/sales/sale/paymentdetail/status                |purchased     |
      |/sales/sale/paymentdetail/mrp                   |29.00         |
      |/sales/sale/paymentdetail/amount                |803.00        |
      |/sales/sale/paymentdetail/initializeInventory   |1             |
    And I post the request with "POST_AddPrimarySales" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader              |xmlValue |
      |Response.Result            |0       |
    And I verify the data got updated as needed from DB
      |expectedColumn |expectedValue |
      |DB:payments:mode:id = (SELECT MAX(id) FROM payments) |online |
      |DB:payments:amount:id = (SELECT MAX(id) FROM payments) | 1208.55683 |
      |DB:payments:tcs_percent:id = (SELECT MAX(id) FROM payments) |10.000 |
    And verify response time is less than "2500" milliseconds


  @DataTypeValidation @DBValidation
  Scenario: TC-49 Validate numeric fields accept decimal values  
    And I modify fields with random values and remove fields in "POST_AddPrimarySales" XML payload
      |XPath                                    |Value         |
      |/sales/sale/payment/invoiceid            |randomInt     |
      |/sales/sale/payment/outlet_erp_id        |erp123        |
      |/sales/sale/payment/from_warehouse_erpid |trp123        |
      |/sales/sale/payment/mode                 |cash          |
      |/sales/sale/payment/mrp                  |29.99         |
      |/sales/sale/payment/amount               |1560.205      |
      |/sales/sale/payment/fordate              |todayDate     |
      |/sales/sale/paymentdetail/mrp            |29.99         |
      |/sales/sale/paymentdetail/amount         |803.108       |
    And I post the request with "POST_AddPrimarySales" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader   |xmlValue |
      |Response.Result |0        |
    And I verify the data got updated as needed from DB
      |expectedColumn |expectedValue |
      |DB:payments:mode:id = (SELECT MAX(id) FROM payments) |online |
      |DB:payments:amount:id = (SELECT MAX(id) FROM payments) | 1208.55683 |
    And verify response time is less than "2500" milliseconds

