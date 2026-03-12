@EntityPricingApproval @EntityPricing @Sanity @All @Execution @allPost
Feature: TC5099 This feature file is of the testcases of GET end point of entity pricing approvals

  @EntityPricingApprovalPositive
  Scenario: TC_01 Pricing -  positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type| application/xml|
    And I modify fields with random values and remove fields in "POST_updateWarehousePrice" XML payload
      | XPath         | Value |
      |data/InventoryPrice/warehouseErpId|   trp123   |
      |data/InventoryPrice/skuCode      |   Cuba       |
      | data/InventoryPrice/toentityType |warehouses    |
      |data/InventoryPrice/toentityTypeErpId |trp133    |
    And I post the request with "POST_updateWarehousePrice" xml payload with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader         |xmlValue       |
      | Response.Result       |1              |
      | Response.Reason       |Price has been updated successfully.|
    And verify response time is less than "1500" milliseconds

  @EntityPricingApprovalNegative
  Scenario: TC_02 Pricing - negative case - warehouseErpId empty
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "POST_updateWarehousePrice" XML payload
      | XPath         | Value |
      |data/InventoryPrice/warehouseErpId|      |
      |data/InventoryPrice/skuCode      |   Cuba       |
      | data/InventoryPrice/toentityType |warehouses    |
      |data/InventoryPrice/toentityTypeErpId |trp133    |
    And I post the request with "POST_updateWarehousePrice" xml payload with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader    |xmlValue  |
      | Response.Result  |0         |
      | Response.Reason  |The erp_id can not be empty.|
    And verify response time is less than "1500" milliseconds

  @EntityPricingApprovalNegative
  Scenario: TC_03 Pricing - negative case - wrong warehouseErpId
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/xml|
    And I modify fields with random values and remove fields in "POST_updateWarehousePrice" XML payload
      | XPath         | Value |
      |data/InventoryPrice/warehouseErpId|   rgrthdthn   |
      |data/InventoryPrice/skuCode      |   Cuba       |
      | data/InventoryPrice/toentityType |warehouses    |
      |data/InventoryPrice/toentityTypeErpId |trp133    |
    And I post the request with "POST_updateWarehousePrice" xml payload with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader    |xmlValue  |
      | Response.Result  |0         |
      | Response.Reason  |Warehouse Erp Id rgrthdthn are invalid.|
    And verify response time is less than "1500" milliseconds

  @EntityPricingApprovalNegative
  Scenario: TC_04 Pricing - negative case - skuCode empty
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "POST_updateWarehousePrice" XML payload
      | XPath         | Value |
      |data/InventoryPrice/warehouseErpId|   trp123   |
      |data/InventoryPrice/skuCode      |          |
      | data/InventoryPrice/toentityType |warehouses    |
      |data/InventoryPrice/toentityTypeErpId |trp133    |
    And I post the request with "POST_updateWarehousePrice" xml payload with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader    |xmlValue  |
      | Response.Result  |0         |
      | Response.Reason  |invalid data The skucode can not be empty.|
    And verify response time is less than "1500" milliseconds

  @EntityPricingApprovalNegative
  Scenario: TC_05 Pricing - negative case - wrong skuCode
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/xml|
    And I modify fields with random values and remove fields in "POST_updateWarehousePrice" XML payload
      | XPath         | Value |
      |data/InventoryPrice/warehouseErpId|   trp123   |
      |data/InventoryPrice/skuCode      |vdngbfvgrhthj|
      | data/InventoryPrice/toentityType |warehouses    |
      |data/InventoryPrice/toentityTypeErpId |trp133    |
    And I post the request with "POST_updateWarehousePrice" xml payload with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader    |xmlValue  |
      | Response.Result  |0         |
      | Response.Reason  |invalid dataSku code vdngbfvgrhthj are invalid|
    And verify response time is less than "1500" milliseconds

  @EntityPricingApprovalNegative
  Scenario: TC_06 Pricing - negative case - toentityType empty
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "POST_updateWarehousePrice" XML payload
      | XPath         | Value |
      |data/InventoryPrice/warehouseErpId|   trp123   |
      |data/InventoryPrice/skuCode      |Cuba|
      | data/InventoryPrice/toentityType |    |
      |data/InventoryPrice/toentityTypeErpId |trp133    |
    And I post the request with "POST_updateWarehousePrice" xml payload with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader    |xmlValue  |
      | Response.Result  |0         |
      | Response.Reason  |invalid data|
      | Response.ResultArray.Reason  |toentityType is mandatory|
    And verify response time is less than "1500" milliseconds

  @EntityPricingApprovalNegative
  Scenario: TC_07 Pricing - negative case - wrong toentityType
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/xml|
    And I modify fields with random values and remove fields in "POST_updateWarehousePrice" XML payload
      | XPath         | Value |
      |data/InventoryPrice/warehouseErpId|   trp123   |
      |data/InventoryPrice/skuCode      |Cuba|
      | data/InventoryPrice/toentityType |dthrghtf    |
      |data/InventoryPrice/toentityTypeErpId |trp133    |
    And I post the request with "POST_updateWarehousePrice" xml payload with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader    |xmlValue  |
      | Response.Result  |0         |
      | Response.Reason  |invalid data|
      | Response.ResultArray.Reason  |toentityType dthrghtf Invalid|
    And verify response time is less than "1500" milliseconds

  @EntityPricingApprovalNegative
  Scenario: TC_08 Pricing - negative case - wrong toentityTypeErpId
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/xml|
    And I modify fields with random values and remove fields in "POST_updateWarehousePrice" XML payload
      | XPath         | Value |
      |data/InventoryPrice/warehouseErpId|   trp123   |
      |data/InventoryPrice/skuCode      |   Cuba       |
      | data/InventoryPrice/toentityType |warehouses    |
      |data/InventoryPrice/toentityTypeErpId |vjyhdcvjktufwgvuiqfe    |
    And I post the request with "POST_updateWarehousePrice" xml payload with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader    |xmlValue  |
      | Response.Result  |0         |
      | Response.Reason  |Warehouse Erp Id vjyhdcvjktufwgvuiqfe are invalid.|
    And verify response time is less than "1500" milliseconds

  @EntityPricingWithWrongResourceURI
  Scenario: TC_09 Pricing -  Post API with wrong Resource URI
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type| application/xml|

    And I post the request with "Invalid_updateWarehousePrice" xml payload with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "404"
    And verify response time is less than "1500" milliseconds

  @EntityPricingWithoutToken
  Scenario: TC_10 Pricing - Post API with out Access token
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type| application/xml|
    And I modify fields with random values and remove fields in "POST_updateWarehousePrice" XML payload
      | XPath         | Value |
      |data/InventoryPrice/warehouseErpId|   trp123   |
      |data/InventoryPrice/skuCode      |   Cuba       |
      | data/InventoryPrice/toentityType |warehouses    |
      |data/InventoryPrice/toentityTypeErpId |trp133    |

    And I post the request with "POST_updateWarehousePrice" xml payload with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |  |
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      | JPath     | Value |
      | error   |  invalid_request   |
    And verify response time is less than "1500" milliseconds

  @EntityPricingWithWrongToken
  Scenario: TC_11 Pricing - Post API with out Access token
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type| application/xml|
    And I modify fields with random values and remove fields in "POST_updateWarehousePrice" XML payload
      | XPath         | Value |
      |data/InventoryPrice/warehouseErpId|   trp123   |
      |data/InventoryPrice/skuCode      |   Cuba       |
      | data/InventoryPrice/toentityType |warehouses    |
      |data/InventoryPrice/toentityTypeErpId |trp133    |
    And I post the request with "POST_updateWarehousePrice" xml payload with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |  xyz |
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      | JPath     | Value |
      | error   |  invalid_grant |
    And verify response time is less than "1500" milliseconds

  @EntityPricingWithoutBody
  Scenario: TC_12 Pricing -  Post API with empty Body
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type| application/xml|

    And I send empty body with "POST_updateWarehousePrice" request
    And I post the request with "POST_updateWarehousePrice" xml payload with dynamic access token and query parameters
      |Query         |Value |
      |access_token  |ACCESS_TOKEN |
    Then I should see the response code as "200"
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader     | xmlValue |
      | Response.Reason   | invalid data |
    And verify response time is less than "1500" milliseconds



