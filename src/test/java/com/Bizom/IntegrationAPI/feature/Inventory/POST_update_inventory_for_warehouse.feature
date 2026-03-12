@UpdateInventoryForWarehouse @all @sanity @Execution @allPost

Feature: This feature file is of the testcases of POST API end points of update inventory for warehouse.


  @test1
  Scenario: TC_01 - Update Inventory For Warehouse - Positive Case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/xml|
    And I modify fields with random values and remove fields in "update_inventory_for_warehouse" XML payload
      |XPath                             |Value                 |
      |/data/Inventory/availableInventory|randomInt             |
    And I post the request with "update_inventory_for_warehouse" xml payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN                 |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |true           |
      |$.Reason         |"success"      |
      |$.status[0].Inventory[0].reason    |"Inventory updated"|
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "2000" milliseconds


  @test2
  Scenario: TC_02 - Update Inventory For Warehouse - Negative Case - Wrong Warehouse ERP ID
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/xml|
    And I modify fields with random values and remove fields in "update_inventory_for_warehouse" XML payload
      |XPath                              |Value                |
      |/data/Inventory/warehouseErpId     |trpqwqap123          |
      |/data/Inventory/availableInventory |randomInt            |
    And I post the request with "update_inventory_for_warehouse" xml payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN                 |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath                   |Value             |
      |$.Result                |false             |
      |$.ReasonArray[0].result |false             |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "2000" milliseconds


  @test3
  Scenario: TC_03 - Update Inventory For Warehouse - Negative Case - Empty Warehouse ERP ID
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/xml|
    And I modify fields with random values and remove fields in "update_inventory_for_warehouse" XML payload
      |XPath                              |Value                |
      |/data/Inventory/warehouseErpId     |                     |
      |/data/Inventory/availableInventory |randomInt            |
    And I post the request with "update_inventory_for_warehouse" xml payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN                 |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath                   |Value                                     |
      |$.Result                |false                                     |
      |$.Reason                |" The erp_id can not be empty."            |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "2000" milliseconds

  # TODO: Complete the null response validation
  @test4
  Scenario: TC_04 - Update Inventory For Warehouse - Negative Case - Remove Warehouse ERP ID Field
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/xml|
    And I remove the fields from XML "update_inventory_for_warehouse" payload
      |XPath                              |Value                |
      |/data/Inventory/warehouseErpId     |                     |
    And I post the request with "update_inventory_for_warehouse" xml payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN                 |
    Then I should see the response code as "200"
    And validating the response contains the following values
      |  Value  |
      |null|
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "2000" milliseconds


  @test5
  Scenario: TC_05 - Update Inventory For Warehouse - Negative Case - Wrong SKU Code
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/xml|
    And I modify fields with random values and remove fields in "update_inventory_for_warehouse" XML payload
      |XPath                              |Value                |
      |/data/Inventory/skuCode            |Fanuye          |
      |/data/Inventory/availableInventory |randomInt            |
    And I post the request with "update_inventory_for_warehouse" xml payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN                 |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath                   |Value             |
      |$.Result                |false             |
      |$.ReasonArray[0].result |false             |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "2000" milliseconds


  @test6
  Scenario: TC_06 - Update Inventory For Warehouse - Negative Case - Empty SKU Code
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/xml|
    And I modify fields with random values and remove fields in "update_inventory_for_warehouse" XML payload
      |XPath                              |Value                |
      |/data/Inventory/skuCode            |                     |
      |/data/Inventory/availableInventory |randomInt            |
    And I post the request with "update_inventory_for_warehouse" xml payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN                 |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath                   |Value                                                                      |
      |$.Result                |false                                                                      |
      |$.ReasonArray[0].Reason |"Both skuCode and skuId cannot be empty. Provide at least one."            |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "2000" milliseconds


  @test7
  Scenario: TC_07 - Update Inventory For Warehouse - Negative Case - Remove SKU Code Field
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/xml|
    And I modify fields with random values and remove fields in "update_inventory_for_warehouse" XML payload
      |XPath                              |Value                |
      |/data/Inventory/skuCode            |null                 |
      |/data/Inventory/availableInventory |randomInt            |
    And I post the request with "update_inventory_for_warehouse" xml payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN                 |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath                   |Value                                                                      |
      |$.Result                |false                                                                      |
      |$.ReasonArray[0].Reason |"Both skuCode and skuId cannot be empty. Provide at least one."            |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "2000" milliseconds


  @test8
  Scenario: TC_08 - Update Inventory For Warehouse - Negative Case - Empty Warehouse ERP ID and SKU Code
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/xml|
    And I modify fields with random values and remove fields in "update_inventory_for_warehouse" XML payload
      |XPath                              |Value                |
      |/data/Inventory/warehouseErpId     |                     |
      |/data/Inventory/skuCode            |                     |
      |/data/Inventory/availableInventory |randomInt            |
    And I post the request with "update_inventory_for_warehouse" xml payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN                 |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath                   |Value                                     |
      |$.Result                |false                                     |
      |$.Reason                |" The erp_id can not be empty."            |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "2000" milliseconds

  # TODO: Complete the null response validation
  @test9
  Scenario: TC_09 - Update Inventory For Warehouse - Negative Case - Remove Warehouse ERP ID and SKU Code Field
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/xml|
    And I remove the fields from XML "update_inventory_for_warehouse" payload
      |XPath                              |Value                |
      |/data/Inventory/warehouseErpId     |null                 |
      |/data/Inventory/skuCode            |null                 |
    And I post the request with "update_inventory_for_warehouse" xml payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN                 |
    Then I should see the response code as "200"
    And validating the response contains the following values
      |  Value  |
      |null|
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "2000" milliseconds


  # Some bug or something to be understood.
  @test10
  Scenario: TC_10 - Update Inventory For Warehouse - Negative Case - Zero Available Inventory
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/xml|
    And I modify fields with random values and remove fields in "update_inventory_for_warehouse" XML payload
      |XPath                              |Value                |
      |/data/Inventory/availableInventory |0                    |
    And I post the request with "update_inventory_for_warehouse" xml payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN                 |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath                   |Value                                                                 |
      |$.Result                |true                                                                  |
      |$.ReasonArray[0].reason |"Inventory updated"|
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "2000" milliseconds


  # This is also dicey it takes positive or sometimes add one or subtract one
  @test11
  Scenario: TC_11 - Update Inventory For Warehouse - Negative Case - Negative Available Inventory
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/xml|
    And I modify fields with random values and remove fields in "update_inventory_for_warehouse" XML payload
      |XPath                              |Value                |
      |/data/Inventory/availableInventory |-12                    |
    And I post the request with "update_inventory_for_warehouse" xml payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN                 |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath                   |Value                                                                 |
      |$.Result                |true                                                                  |
      |$.ReasonArray[0].reason |"Inventory updated"                                                   |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "2000" milliseconds


  @test12
  Scenario: TC_12 - Update Inventory For Warehouse - Negative Case - Empty Available Inventory
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/xml|
    And I modify fields with random values and remove fields in "update_inventory_for_warehouse" XML payload
      |XPath                              |Value                |
      |/data/Inventory/availableInventory |                     |
    And I post the request with "update_inventory_for_warehouse" xml payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN                 |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath                   |Value                                                                      |
      |$.Result                |false                                                                      |
      |$.ReasonArray[0].result |false                                                                      |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "2000" milliseconds

  # TODO: Complete the null response validation
  @test13
  Scenario: TC_13 - Update Inventory For Warehouse - Negative Case - Remove Availbale Inventory Field
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/xml|
    And I remove the fields from XML "update_inventory_for_warehouse" payload
      |XPath                              |Value                |
      |/data/Inventory/availableInventory |null                 |
    And I post the request with "update_inventory_for_warehouse" xml payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN                 |
    Then I should see the response code as "200"
    And validating the response contains the following values
      |  Value  |
      |  null   |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "2000" milliseconds


  @test14
  Scenario: TC_14 - Update Inventory For Warehouse - Negative Case - Empty Warehouse ERP ID ,SKU Code and Available Inventory
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/xml|
    And I modify fields with random values and remove fields in "update_inventory_for_warehouse" XML payload
      |XPath                              |Value                |
      |/data/Inventory/warehouseErpId     |                     |
      |/data/Inventory/skuCode            |                     |
      |/data/Inventory/availableInventory |                     |
    And I post the request with "update_inventory_for_warehouse" xml payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN                 |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath                   |Value                                     |
      |$.Result                |false                                     |
      |$.Reason                |" The erp_id can not be empty."            |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "2000" milliseconds

  # TODO: Complete the null response validation
  @test15
  Scenario: TC_15 - Update Inventory For Warehouse - Negative Case - Remove Warehouse ERP ID ,SKU Code and Available Inventory Field
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/xml|
    And I remove the fields from XML "update_inventory_for_warehouse" payload
      |XPath                              |Value                |
      |/data/Inventory/warehouseErpId     |null                 |
      |/data/Inventory/skuCode            |null                 |
    And I post the request with "update_inventory_for_warehouse" xml payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN                 |
    Then I should see the response code as "200"
    And validating the response contains the following values
      |  Value  |
      |  null|
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "2000" milliseconds