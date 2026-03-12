@AddDiscount
Feature: This feature file is of the testcases of POST end point of add discounts

#-------------------------------------------------------------------------------------------------

  @Test_1-positive
  Scenario: TC_01 CreateNewDiscount form warehouse to outlet -  positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/json           |
    And I modify fields with random values and remove fields in "POST_AddDiscount" XML payload
      |XPath       |Value       |
      | /Discounts/Discount/discountpercent  | 20 |
      | /Discounts/Discount/fromlevelname  | zone |
      | /Discounts/Discount/fromlevelerpid  | DB:zones:sap-code: id=1 |
      | /Discounts/Discount/tolevelname  | warehouse |
      | /Discounts/Discount/tolevelerpid  | DB:warehouses:erp_id: id=1 |
      | /Discounts/Discount/skucodes/skucode[1]       |DB:skunits:skucode: id=1 |
      | /Discounts/Discount/skucodes/skucode[2]        |DB:skunits:skucode: id=2     |
      | /Discounts/Discount/skucodes/skucode[3]       |DB:skunits:skucode: id=3   |
      | /Discounts/Discount/fromdate   | todayDate   |
      | /Discounts/Discount/todate  |  futureDate:30  |

    And I post the request with "POST_AddDiscount" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      |$.Result   |true |
      | $.Reason  | [Discount Saved successfully at row 1] |
    And verify response time is less than "2500" milliseconds


    #-----------------------------------------------------------------------------------------------------


  @Test_2-positive
  Scenario: TC_02 CreateNewDiscount form zone to warehouse  -  positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/json           |
    And I modify fields with random values and remove fields in "POST_AddDiscount" XML payload
      |XPath       |Value       |
      | /Discounts/Discount/discountpercent  | 20 |
      | /Discounts/Discount/fromlevelname  | zone |
      | /Discounts/Discount/fromlevelerpid  | DB:zones:sap-code: id=1 |
      | /Discounts/Discount/tolevelname  | warehouse |
      | /Discounts/Discount/tolevelerpid  | DB:warehouses:erp_id: id=1 |
      | /Discounts/Discount/skucodes/skucode[1]       |DB:skunits:skucode: id=1 |
      | /Discounts/Discount/skucodes/skucode[2]        |DB:skunits:skucode: id=2     |
      | /Discounts/Discount/skucodes/skucode[3]       |DB:skunits:skucode: id=3   |
      | /Discounts/Discount/fromdate   | todayDate   |
      | /Discounts/Discount/todate  |  futureDate:30  |

    And I post the request with "POST_AddDiscount" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      |$.Result   |true |
      | $.Reason  | [Discount Saved successfully at row 1] |
    And verify response time is less than "2500" milliseconds


    #------------------------------------------------------------------------------------------------------

  @Test_3-positive
  Scenario: TC_03 CreateNewDiscount form zone to warehouse with multiple skucodes -  positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/json           |
    And I modify fields with random values and remove fields in "POST_AddDiscount" XML payload
      |XPath       |Value       |
      | /Discounts/Discount/discountpercent  | 20 |
      | /Discounts/Discount/fromlevelname  | zone |
      | /Discounts/Discount/fromlevelerpid  | DB:zones:sap-code: id=1 |
      | /Discounts/Discount/tolevelname  | warehouse |
      | /Discounts/Discount/tolevelerpid  | DB:warehouses:erp_id: id=1 |
      | /Discounts/Discount/skucodes/skucode[1]       |DB:skunits:skucode: id=1 |
      | /Discounts/Discount/skucodes/skucode[2]        |DB:skunits:skucode: id=2     |
      | /Discounts/Discount/skucodes/skucode[3]       |DB:skunits:skucode: id=3   |
      | /Discounts/Discount/fromdate   | todayDate   |
      | /Discounts/Discount/todate  |  futureDate:30  |

    And I post the request with "POST_AddDiscount" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      |$.Result   |true |
      | $.Reason  | [Discount Saved successfully at row 1] |
    And verify response time is less than "2500" milliseconds


    #---------------------------------------------------------------------------------------------


  @Test_4-negative
  Scenario: TC_04 CreateNewDiscount remove access token - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/json           |
    And I modify fields with random values and remove fields in "POST_AddDiscount" XML payload
      |XPath       |Value       |
      | /Discounts/Discount/discountpercent  | 20 |
      | /Discounts/Discount/fromlevelname  | zone |
      | /Discounts/Discount/fromlevelerpid  | DB:zones:sap-code: id=1 |
      | /Discounts/Discount/tolevelname  | warehouse |
      | /Discounts/Discount/tolevelerpid  | DB:warehouses:erp_id: id=1 |
      | /Discounts/Discount/skucodes/skucode[1]       |DB:skunits:skucode: id=1 |
      | /Discounts/Discount/skucodes/skucode[2]        |DB:skunits:skucode: id=2     |
      | /Discounts/Discount/skucodes/skucode[3]       |DB:skunits:skucode: id=3   |
      | /Discounts/Discount/fromdate         | todayDate  |
      | /Discounts/Discount/todate           |  futureDate:30  |

    And I post the request with "POST_AddDiscount" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |  |
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      | JPath     | Value    |
      |$.error             |"invalid_request"|
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------

  @Test_5-negative
  Scenario: TC_05 CreateNewDiscount create discount for past date - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/json           |
    And I modify fields with random values and remove fields in "POST_AddDiscount" XML payload
      |XPath       |Value       |
      | /Discounts/Discount/discountpercent  | 20 |
      | /Discounts/Discount/fromlevelname  | zone |
      | /Discounts/Discount/fromlevelerpid  | DB:zones:sap-code: id=1 |
      | /Discounts/Discount/tolevelname  | warehouse |
      | /Discounts/Discount/tolevelerpid  | DB:warehouses:erp_id: id=1 |
      |/Discounts/Discount/skucodes/skucode[1]       |DB:skunits:skucode: id=1 |
      |/Discounts/Discount/skucodes/skucode[2]        |DB:skunits:skucode: id=2     |
      |/Discounts/Discount/skucodes/skucode[3]       |DB:skunits:skucode: id=3   |
      | /Discounts/Discount/fromdate         | pastDate  |
      | /Discounts/Discount/todate           |  futureDate:30  |

    And I post the request with "POST_AddDiscount" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  | ACCESS_TOKEN |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result  |   false  |
      | $.Reason | fromdate pastDate cannot be less than the current date. 1!!      |
    And verify response time is less than "2500" milliseconds

