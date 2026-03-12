@InventoryForWarehouse @sanity @all @allGet @Execution

Feature: This feature file is of the testcases of GET end point of inventory for warehouse.

  @test1
  Scenario: TC_01 - List Inventory For Warehouse - Positive Case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I send the GET request to "inventory_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |pageno        |1              |
      |warehouse_erpid|trp123        |
      |is_active      |1             |
      |access_token   |ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath                |Value          |
      |$.Result      |"true"         |
      |$.Inventories[0].Inventory.id|"1"|
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "2000" milliseconds

    @test2
    Scenario: TC_02 - List Inventory For Warehouse- Nagative Case - removal of parameters
      Given I set up base URI for transactions
      When I set up request specification
        |HeaderName|HeaderValue|
        |Accept|*/*|
        |Accept-Encoding|gzip,deflate, br|
        |Connection|keep-alive|
        |Content-Type|application/json|
      And I send the GET request to "inventory_for_warehouse" endpoint with dynamic access token and query parameters
        |QueryParamName|QueryParamValue|
        |access_token   |ACCESS_TOKEN|
      Then I should see the response code as "200"
      And the fields in response should match with expected values
        |JPath                |Value          |
        |$.Result             |"true"         |
        |$.Inventories[0].Inventory.id|"1"|
      And verify response headers
        |HeaderName|HeaderValue|
        |Content-Type|text/html; charset=UTF-8|
      And verify response time is less than "1500" milliseconds

  @test3
  Scenario: TC_03 - List Inventory For Warehouse - Negative Case - removal of access token
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I send the GET request to "inventory_for_warehouse" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |pageno        |1              |
      |warehouse_erpid|trp123        |
      |is_active      |1             |
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      |JPath               |Value           |
      |$.error             |"invalid_request"|
      |$.error_description |"The access token was not found."        |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "1200" milliseconds

  @InventoryForWarehouseWithInvalidAccessToken
  Scenario: TC_04 - List Inventory For Warehouse - Negative Case - Invalid access token
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I send the GET request to "inventory_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |pageno        |1              |
      |warehouse_erpid|trp123        |
      |is_active      |1             |
      |access_token   |randomDouble|
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      |JPath                |Value          |
      |error              |invalid_grant    |
      |error_description  | The access token provided is invalid.|
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "2000" milliseconds

  @InventoryForWarehouseWithWrongResourceURI
  Scenario: TC_05 - List Inventory For Warehouse - With Wrong Resource URI
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I send the GET request to "Invalid_inventory_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |pageno        |1              |
      |warehouse_erpid|trp123        |
      |is_active      |1             |
      |access_token   |ACCESS_TOKEN|
    Then I should see the response code as "404"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "2000" milliseconds

  Scenario: TC_06 - List Inventory For Warehouse - With Invalid warehouses_erpid
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I send the GET request to "inventory_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |pageno        |1              |
      |warehouse_erpid|   randomInt    |
      |is_active      |1             |
      |access_token   |ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath                |Value          |
      |Result               | false         |
      |Reason               |"Invalid data passed."|
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "2000" milliseconds