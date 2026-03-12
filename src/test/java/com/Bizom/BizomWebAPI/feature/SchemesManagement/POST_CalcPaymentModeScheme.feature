@BizomWebAPI @SchemesManagement @CalcPaymentModeScheme @PaymentProcessing
Feature: CalcPaymentModeScheme API Testing
  As a system user
  I want to test the calcPaymentModeScheme endpoint
  So that I can ensure correct calculation of payment mode schemes and benefits

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName        |HeaderValue                                                                                 |
      |Content-Type      |application/json; charset=UTF-8                                            |
      |accept            |application/json, text/javascript, */*; q=0.01                                              |
      |accept-language   |en-US,en;q=0.9                                                                              |
      |origin            |https://devuitest.bizomdev.in                                                                |
      |referer           |https://devuitest.bizomdev.in/payments/sale                                                 |
      |sec-ch-ua         |"Not(A:Brand";v="8", "Chromium";v="144", "Google Chrome";v="144"                            |
      |sec-ch-ua-mobile  |?0                                                                                          |
      |sec-ch-ua-platform|"Linux"                                                                                     |
      |sec-fetch-dest    |empty                                                                                       |
      |sec-fetch-mode    |cors                                                                                        |
      |sec-fetch-site    |same-origin                                                                                 |
      |x-ht-session-id   |Siddhant                                                                                   |
      |x-requested-with  |XMLHttpRequest                                                                             |
      |user-agent        |Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36|

  @Negative @Security
  Scenario: TC_01 Calc payment mode scheme without access token
    And I post the request with "POST_calcPaymentModeScheme" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path        |Value|
      |access_token   |               |warehouseId |2    |
      |               |               |outletId    |2    |
      |               |               |paymentMode |cash |
    Then I should see the response code as "403"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Calc payment mode scheme with invalid access token
    And I post the request with "POST_calcPaymentModeScheme" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path        |Value|
      |access_token   |invalid_token_12345|warehouseId |2    |
      |               |               |outletId    |2    |
      |               |               |paymentMode |cash |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath           |Value                              |
      |$.result        |false                              |
      |$.error.code    |401                                |
      |$.error.message |Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Calc payment mode scheme with expired access token
    And I post the request with "POST_calcPaymentModeScheme" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path        |Value|
      |access_token   |expired_token_12345|warehouseId |2    |
      |               |               |outletId    |2    |
      |               |               |paymentMode |cash |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath           |Value                              |
      |$.result        |false                              |
      |$.error.code    |401                                |
      |$.error.message |Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Calc payment mode scheme with malformed access token
    And I post the request with "POST_calcPaymentModeScheme" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path        |Value|
      |access_token   |malformed.token.here|warehouseId |2    |
      |               |               |outletId    |2    |
      |               |               |paymentMode |cash |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath           |Value                              |
      |$.result        |false                              |
      |$.error.code    |401                                |
      |$.error.message |Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke @DBValidation
  Scenario: TC_05 Calc payment mode scheme with valid request
    And I post the request with "POST_calcPaymentModeScheme" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path        |Value|
      |access_token  |ACCESS_TOKEN   |warehouseId |2    |
      |               |               |outletId    |2    |
      |               |               |paymentMode |cash |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath                                            |Value                                   |
      |$.Result                                         |true                                    |
      |$.Reason                                         |Data Found                              |
      |$.Data.beat_name                                 |DB:beats:name: id=1                     |
      |$.Data.skunit["1"]["0"].skunitname               |DB:skunits:name: id=1                   |
      |$.Data.skunit["1"]["0"].skucode                  |DB:skunits:skucode: id=1                |
      |$.Data.payModebenefit["956"].schemeId            |DB:schemes:id: name="PaymentModeSchemeApiAutomationSlab"|
      |$.Data.payModebenefit["956"].schemeName          |DB:schemes:name: id=956      |
    And I store the response as "calc_payment_mode_scheme_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate calc payment mode scheme response data types
    And I post the request with "POST_calcPaymentModeScheme" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path        |Value|
      |access_token   |ACCESS_TOKEN |warehouseId |2    |
      |               |               |outletId    |2    |
      |               |               |paymentMode |cash |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath                                              |ExpectedType|
      |$.Result                                           |boolean     |
      |$.Reason                                           |string      |
      |$.Data                                             |object      |
      |$.Data.skunit                                      |object      |
      |$.Data.skunit["1"]                                 |object      |
      |$.Data.skunit["1"]["0"]                           |object      |
      |$.Data.skunit["1"]["0"].total_weight               |string      |
      |$.Data.skunit["1"]["0"].units                      |string      |
      |$.Data.skunit["1"]["0"].quantity                   |string      |
      |$.Data.skunit["1"]["0"].price                      |string      |
      |$.Data.skunit["1"]["0"].unitprice                  |number      |
      |$.Data.skunit["1"]["0"].amount                     |number      |
      |$.Data.skunit["1"]["0"].mrp                        |string      |
      |$.Data.skunit["1"]["0"].skunitname                 |string      |
      |$.Data.skunit["1"]["0"].skucode                    |string      |
      |$.Data.skunit["1"]["0"].skunit_id                  |string      |
      |$.Data.skunit["1"]["0"].vat                        |string      |
      |$.Data.skunit["1"]["0"].gst                        |string      |
      |$.Data.skunit["1"]["0"].cess                       |string      |
      |$.Data.skunit["1"]["0"].advalorem                  |string      |
      |$.Data.skunit["1"]["0"].paymodescheme              |number      |
      |$.Data.warehouseId                                 |string      |
      |$.Data.outlet_id                                   |string      |
      |$.Data.beat_id                                     |string      |
      |$.Data.transactionByUserID                         |string      |
      |$.Data.applyprimarydiscount                        |string      |
      |$.Data.Payment                                     |object      |
      |$.Data.Payment.mode                                |string      |
      |$.Data.payModebenefit                              |object      |
      |$.Data.payModebenefit["956"]                       |object      |
      |$.Data.payModebenefit["956"].schemeId              |number      |
      |$.Data.payModebenefit["956"].schemeName            |string      |
      |$.Data.payModebenefit["956"].discountpercent       |string      |
      |$.Data.payModebenefit["956"].discountPerCash       |number      |
      |$.Data.payModebenefit["956"].forSkunit             |object      |
      |$.Data.payModebenefit["956"].forSkunit["1"]        |object      |
      |$.Data.payModebenefit["956"].forSkunit["1"].skunitId|number     |
      |$.Data.payModebenefit["956"].forSkunit["1"].constUnit|string    |
      |$.Data.payModebenefit["956"].forSkunit["1"].quantity|string     |
      |$.Data.paymentmodefreeskus                         |array       |
      |$.Data.benefitOnNextInvoice                        |array       |

  @Positive @ContentValidation
  Scenario: TC_07 Validate calc payment mode scheme mandatory keys
    And I post the request with "POST_calcPaymentModeScheme" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path        |Value|
      |access_token   |ACCESS_TOKEN |warehouseId |2    |
      |               |               |outletId    |2    |
      |               |               |paymentMode |cash |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value               |
      |Result              |
      |Reason              |
      |Data                |
      |skunit              |
      |warehouseId         |
      |outlet_id           |
      |beat_id             |
      |Payment             |
      |totalGst            |
      |totAmtWithoutGst    |
      |totAmt              |
      |totalDicountedPrice |
      |payModebenefit      |
      |schemeId            |
      |schemeName          |
      |discountpercent     |
      |discountPerCash     |
      |forSkunit           |
      |skunitId            |
      |constUnit           |
      |quantity            |

  @Positive @BusinessLogic
  Scenario: TC_08 Validate amount and paymodescheme calculations
    And I post the request with "POST_calcPaymentModeScheme" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path        |Value|
      |access_token   |ACCESS_TOKEN |warehouseId |2    |
      |               |               |outletId    |2    |
      |               |               |paymentMode |cash |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath                                   |Value|
      |$.Data.skunit["1"]["0"].unitprice       |1.8  |
      |$.Data.skunit["1"]["0"].amount          |180  |
      |$.Data.skunit["1"]["0"].totAmount       |"200"|
      |$.Data.skunit["1"]["0"].paymodescheme   |0.2  |
      |$.Data.totAmt                           |200  |

  @Negative @Validation
  Scenario: TC_9 Calc payment mode scheme with missing warehouseId
    And I post the request with "POST_calcPaymentModeScheme" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path        |Value|
      |access_token   |ACCESS_TOKEN |warehouseId |    |
      |               |               |outletId    |2    |
      |               |               |paymentMode |cash     |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath           |Value                              |
      |$.Result        |false                              |
      |$.Reason        |"Invalid Warehouse / Outlet Id / Payment mode"|
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_10 Calc payment mode scheme with missing outletId
    And I post the request with "POST_calcPaymentModeScheme" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path        |Value|
      |access_token   |ACCESS_TOKEN |warehouseId |2    |
      |               |               |outletId    |    |
      |               |               |paymentMode |cash     |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath           |Value                              |
      |$.Result        |false                              |
      |$.Reason        |"Invalid Warehouse / Outlet Id / Payment mode"|
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_11 Calc payment mode scheme with empty body
    And I send empty body with "POST_calcPaymentModeScheme" request
    And I post the request with "POST_calcPaymentModeScheme" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path        |Value|
      |access_token   |ACCESS_TOKEN |warehouseId |2    |
      |               |               |outletId    |2    |
      |               |               |paymentMode |cash |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath           |Value                              |
      |$.Result        |false                              |
      |$.Reason        |"Invalid Warehouse / Outlet Id / Payment mode"|
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_12 Calc payment mode scheme with invalid endpoint
    And I post the request with "POST_calcPaymentModeScheme_invalid" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path        |Value|
      |access_token   |ACCESS_TOKEN |warehouseId |2    |
      |               |               |outletId    |2    |
      |               |               |paymentMode |cash |
    Then I should see the response code as "404"
    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: TC_13 Performance test for calc payment mode scheme endpoint
    And I post the request with "POST_calcPaymentModeScheme" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path        |Value|
      |access_token   |ACCESS_TOKEN |warehouseId |2    |
      |               |               |outletId    |2    |
      |               |               |paymentMode |cash |
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath    |Value|
      |$.Result |true |

  @Positive @BusinessLogic
  Scenario: TC_14 Calc payment mode scheme with different outletId
    And I post the request with "POST_calcPaymentModeScheme" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path        |Value|
      |access_token   |ACCESS_TOKEN |warehouseId |2    |
      |               |               |outletId    |1    |
      |               |               |paymentMode |cash |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath           |Value                              |
      |$.Result        |true                              |
      |$.Data.payModebenefit        |[]                 |
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"

  @Positive @BusinessLogic
  Scenario: TC_15 Calc payment mode scheme with different payment modes
    And I post the request with "POST_calcPaymentModeScheme" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path        |Value|
      |access_token   |ACCESS_TOKEN |warehouseId |2    |
      |               |               |outletId    |2    |
      |               |               |paymentMode |card |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath           |Value                             |
      |$.Result        |true                              |
      |$.Data.payModebenefit        |[]                 |
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"

  @Positive @Regression
  Scenario: TC_16 Regression test for calc payment mode scheme endpoint
    And I post the request with "POST_calcPaymentModeScheme" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path        |Value|
      |access_token   |ACCESS_TOKEN |warehouseId |2    |
      |               |               |outletId    |2    |
      |               |               |paymentMode |cash |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath   |Value     |
      |$.Result|true      |
      |$.Reason|Data Found|
    And validating the response field data types
      |JPath                    |ExpectedType|
      |$.Result                 |boolean     |
      |$.Reason                 |string      |
      |$.Data                   |object      |
      |$.Data.skunit            |object      |
      |$.Data.payModebenefit    |object      |
      |$.Data.paymentmodefreeskus|array      |
      |$.Data.benefitOnNextInvoice|array     |
    And I store the response as "calc_payment_mode_scheme_response" name using full path

  @Positive @DataValidation
  Scenario: TC_17 Validate payModebenefit structure and calculations
    And I post the request with "POST_calcPaymentModeScheme" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path        |Value|
      |access_token   |ACCESS_TOKEN |warehouseId |2    |
      |               |               |outletId    |2    |
      |               |               |paymentMode |cash |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath                                              |Value                          |
      |$.Data.payModebenefit["956"].schemeId              |956                            |
      |$.Data.payModebenefit["956"].schemeName            |PaymentModeSchemeApiAutomationSlab|
      |$.Data.payModebenefit["956"].discountpercent       |"10.0000"                       |
      |$.Data.payModebenefit["956"].discountPerCash       |20                             |
      |$.Data.payModebenefit["956"].benefittype           |"1"                            |
      |$.Data.payModebenefit["956"].invoicetype           |"1"                            |
      |$.Data.payModebenefit["956"].forSkunit["1"].skunitId|1                             |
      |$.Data.payModebenefit["956"].forSkunit["1"].constUnit|"100"                         |
      |$.Data.payModebenefit["956"].forSkunit["1"].quantity|"100"                         |

  @Positive @DataValidation
  Scenario: TC_18 Validate skunit nested structure and fields
    And I post the request with "POST_calcPaymentModeScheme" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path        |Value|
      |access_token   |ACCESS_TOKEN |warehouseId |2    |
      |               |               |outletId    |2    |
      |               |               |paymentMode |cash |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath                                |ExpectedType|
      |$.Data.skunit["1"]["0"].total_weight |string      |
      |$.Data.skunit["1"]["0"].units        |string      |
      |$.Data.skunit["1"]["0"].quantity     |string      |
      |$.Data.skunit["1"]["0"].price        |string      |
      |$.Data.skunit["1"]["0"].isEdited     |string      |
      |$.Data.skunit["1"]["0"].bprice       |string      |
      |$.Data.skunit["1"]["0"].unitprice    |number      |
      |$.Data.skunit["1"]["0"].actual_price  |string      |
      |$.Data.skunit["1"]["0"].mrp          |string      |
      |$.Data.skunit["1"]["0"].unitspercase |string      |
      |$.Data.skunit["1"]["0"].skunitname   |string      |
      |$.Data.skunit["1"]["0"].skucode      |string      |
      |$.Data.skunit["1"]["0"].skunit_id    |string      |
      |$.Data.skunit["1"]["0"].batch_id     |string      |
      |$.Data.skunit["1"]["0"].unitcase      |string      |
      |$.Data.skunit["1"]["0"].vat          |string      |
      |$.Data.skunit["1"]["0"].gst          |string      |
      |$.Data.skunit["1"]["0"].cess         |string      |
      |$.Data.skunit["1"]["0"].advalorem    |string      |
      |$.Data.skunit["1"]["0"].totAmount    |string      |
      |$.Data.skunit["1"]["0"].amount       |number      |
      |$.Data.skunit["1"]["0"].paymodescheme|number      |

  @Positive @BoundaryTesting
  Scenario: TC_19 Calc payment mode scheme with zero quantity
    And I modify fields with random values and remove fields in "POST_calcPaymentModeScheme" payload
      |JPath                          |Value|
      |$.skunit["1"]["0"].quantity    |0    |
    And I post the request with "POST_calcPaymentModeScheme" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path        |Value|
      |access_token   |ACCESS_TOKEN |warehouseId |2    |
      |               |               |outletId    |2    |
      |               |               |paymentMode |cash |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath           |Value                              |
      |$.name        |"Division by zero"                   |
      |$.message     |"Division by zero"                   |
    And verify response time is less than "2500" milliseconds

  @Positive @BoundaryTesting
  Scenario: TC_20 Calc payment mode scheme with maximum quantity
    And I modify fields with random values and remove fields in "POST_calcPaymentModeScheme" payload
      |JPath                          |Value  |
      |$.skunit["1"]["0"].quantity    |999999|
    And I post the request with "POST_calcPaymentModeScheme" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path        |Value|
      |access_token   |ACCESS_TOKEN |warehouseId |2    |
      |               |               |outletId    |2    |
      |               |               |paymentMode |cash |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath           |Value                             |
      |$.Result        |true                              |
      |$.Data.payModebenefit.956.discountPerCash|199999.8 |
    And verify response time is less than "2500" milliseconds
