@editSaleReturn @Sanity @All @Execution
Feature: This feature file is of the testcases of POST end point of Edit SaleReturn Api
  @EditSalesReturnPositive
  Scenario: TC_01 edit SaleReturn -  positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "POST_AddSaleReturn" XML payload
      | XPath         | Value       |
      |/Salereturn/fordate|2025-09-10|
      |/Salereturn/documentrefno|PRIMDOC003|
      |/Salereturn/edit_salereturn|1|
    And I post the request with "POST_AddSaleReturn" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result     | true    |
      | $.Data[0] | Sale return added for 6  |
    And verify response time is less than "1500" milliseconds



  Scenario: TC_02 edit SaleReturn -  Invalid from outlet erp id
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "POST_AddSaleReturn" XML payload
      | XPath         | Value       |
      |/Salereturn/fromERPId|1111|
      |/Salereturn/fordate|2025-09-10|
      |/Salereturn/documentrefno|PRIMDOC003|
      |/Salereturn/edit_salereturn|1|
    And I post the request with "POST_AddSaleReturn" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result     | false    |
      | $.Reason | Erp Id 1111 are invalid  |


  Scenario: TC_03 edit SaleReturn -  Invalid To outlet erp id
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "POST_AddSaleReturn" XML payload
      | XPath         | Value       |
      |/Salereturn/toOutletId|1111|
      |/Salereturn/fordate|2025-09-10|
      |/Salereturn/documentrefno|PRIMDOC003|
      |/Salereturn/edit_salereturn|1|
    And I post the request with "POST_AddSaleReturn" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result     | false    |
      | $.Reason| Erp_id for toOutletId does not exist |


  Scenario: TC_04 edit SaleReturn -  from outlet erp id not passed or empty
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "POST_AddSaleReturn" XML payload
      | XPath         | Value       |
      |/Salereturn/fromERPId| |
      |/Salereturn/fordate|2025-09-10|
      |/Salereturn/documentrefno|PRIMDOC003|
      |/Salereturn/edit_salereturn|1|
    And I post the request with "POST_AddSaleReturn" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result     | false    |
      | $.Reason | fromERPId or fromOutletId is mandatory. |


  Scenario: TC_05 edit SaleReturn -  To outlet erp id not passed or empty
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "POST_AddSaleReturn" XML payload
      | XPath         | Value       |
      |/Salereturn/toOutletId| |
      |/Salereturn/fordate|2025-09-10|
      |/Salereturn/documentrefno|PRIMDOC003|
      |/Salereturn/edit_salereturn|1|
    And I post the request with "POST_AddSaleReturn" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result     | false    |
      | $.Reason | toERPId or toOutletId is mandatory. |

  Scenario: TC_06 edit SaleReturn -  Inavlid userEmployeeId
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "POST_AddSaleReturn" XML payload
      | XPath         | Value       |
      |/Salereturn/userEmployeeId| 1111|
      |/Salereturn/fordate|2025-09-10|
      |/Salereturn/documentrefno|PRIMDOC003|
      |/Salereturn/edit_salereturn|1|
    And I post the request with "POST_AddSaleReturn" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result     | false    |
      | $.Reason | The user does not exists. |

  Scenario: TC_07 edit SaleReturn -  for date not passed in body, should take current date by default
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "POST_AddSaleReturn" XML payload
      | XPath         | Value       |
      |/Salereturn/fordate| |
      |/Salereturn/documentrefno|PRIMDOC003|
      |/Salereturn/edit_salereturn|1|
    And I post the request with "POST_AddSaleReturn" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result     | true    |
      | $.Data[0] | Sale return added for 6  |

  Scenario: TC_08 edit SaleReturn -  invalid skucode passed
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "POST_AddSaleReturn" XML payload
      | XPath         | Value       |
      |/Salereturn/Sku/skuCode|66|
      |/Salereturn/documentrefno|PRIMDOC003|
      |/Salereturn/edit_salereturn|1|
    And I post the request with "POST_AddSaleReturn" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result     | false    |
      | $.Data[0] | skuCode 66 not found |

  Scenario: TC_09 edit SaleReturn -  empty skucode passed
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "POST_AddSaleReturn" XML payload
      | XPath         | Value       |
      |/Salereturn/Sku/skuCode|66|
      |/Salereturn/edit_salereturn|1|
    And I post the request with "POST_AddSaleReturn" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"

  Scenario: TC_10 edit SaleReturn -  qunatity/cases/units not passed or empty
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "POST_AddSaleReturn" XML payload
      | XPath         | Value       |
      |/Salereturn/Sku/cases||
      |/Salereturn/Sku/units||
      |/Salereturn/Sku/quantity||
      |/Salereturn/documentrefno|PRIMDOC003|
      |/Salereturn/edit_salereturn|1|
    And I post the request with "POST_AddSaleReturn" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result     | false    |
      | $.Data[0] | The given skucode 6, quantity is zero. |

  Scenario: TC_11 edit SaleReturn -  DB validation
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "POST_AddSaleReturn" XML payload
      | XPath         | Value       |
      |/Salereturn/fordate|2025-09-10|
      |/Salereturn/documentrefno|PRIMDOC003|
      |/Salereturn/edit_salereturn|1|
    And I post the request with "POST_AddSaleReturn" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result     | true    |
      | $.saveData[0].skuCode | "6" |
      | $.saveData[0].reason_id |4|
    And I verify API response at path with DB and static values
      |JPath|Value|
      | $.saveData[0].skunit_id | DB:skunits:id: skuCode=6|
      | $.saveData[0].reason_id | DB:salemansalesreturns:reason_id: skunit_id=6&user_id=1|

