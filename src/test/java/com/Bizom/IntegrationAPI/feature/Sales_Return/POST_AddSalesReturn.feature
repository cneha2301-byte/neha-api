
# Author: Anjana Mohan
@SaleReturn @Sanity @All @Execution
Feature: This feature file is of the testcases of POST end point of Add SaleReturn Api
  @AddSalesReturnPositive
  Scenario: TC_01 Add SaleReturn -  positive case
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
      |/Salereturn/documentrefno|random|
    And I post the request with "POST_AddSaleReturn" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result     | true    |
      | $.Data[0] | Sale return added for 6  |
    And verify response time is less than "1500" milliseconds



  Scenario: TC_02 Add SaleReturn -  Invalid from outlet erp id
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
      |/Salereturn/documentrefno|random|
    And I post the request with "POST_AddSaleReturn" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result     | false    |
      | $.Reason | Erp Id 1111 are invalid  |


  Scenario: TC_03 Add SaleReturn -  Invalid To outlet erp id
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
      |/Salereturn/documentrefno|random|
    And I post the request with "POST_AddSaleReturn" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result     | false    |
      | $.Reason| Erp_id for toOutletId does not exist |


  Scenario: TC_04 Add SaleReturn -  from outlet erp id not passed or empty
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
      |/Salereturn/documentrefno|random|
    And I post the request with "POST_AddSaleReturn" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result     | false    |
      | $.Reason | fromERPId or fromOutletId is mandatory. |


  Scenario: TC_05 Add SaleReturn -  To outlet erp id not passed or empty
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
      |/Salereturn/documentrefno|random|
    And I post the request with "POST_AddSaleReturn" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result     | false    |
      | $.Reason | toERPId or toOutletId is mandatory. |

  Scenario: TC_06 Add SaleReturn -  Invalid userEmployeeId
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
      |/Salereturn/documentrefno|random|
    And I post the request with "POST_AddSaleReturn" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result     | false    |
      | $.Reason | The user does not exists. |

  Scenario: TC_07 Add SaleReturn -  for date not passed in body, should take current date by default
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
      |/Salereturn/documentrefno|random|
    And I post the request with "POST_AddSaleReturn" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result     | true    |
      | $.Data[0] | Sale return added for 6  |

  Scenario: TC_08 Add SaleReturn -  invalid skucode passed
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
      |/Salereturn/documentrefno|random|
    And I post the request with "POST_AddSaleReturn" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result     | false    |
      | $.Data[0] | skuCode 66 not found |

  Scenario: TC_09 Add SaleReturn -  empty skucode passed
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
      |/Salereturn/documentrefno|random|
    And I post the request with "POST_AddSaleReturn" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"

  Scenario: TC_10 Add SaleReturn -  qunatity/cases/units not passed or empty
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
      |/Salereturn/documentrefno|random|
    And I post the request with "POST_AddSaleReturn" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result     | false    |
      | $.Data[0] | The given skucode 6, quantity is zero. |
  Scenario: TC_11 Add new SaleReturn with same doc ref no
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
    And I post the request with "POST_AddSaleReturn" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result     | false    |
      | $.Reason | The document number already exists. |

