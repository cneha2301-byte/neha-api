@BizomWebAPI @WarehouseSkunitsManagement @AssignSkunitToWarehouse  @CE @InventoryOperations
Feature: This feature file is of the testcases of POST end point of assign SKU unit to warehouse

#-------------------------------------------------------------------------------------------------

#  @Test_1-positive
#  Scenario: TC_01 AssignSkunitToWarehouse - positive case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_AssignSkunitToWarehouse" payload
#      |JPath       |Value       |
#      |$.data.SKUNIT_ID.quantity  | randomInt |
#      |$.data.SKUNIT_ID.price  | randomInt |
#      |$.data.SKUNIT_ID.mrp  | randomInt |
#    And I replace "SKUNIT_ID" placeholder key with "DB:skunits:id: id=1 LIMIT 1" in "POST_AssignSkunitToWarehouse" payload
#    And I post the request with "POST_AssignSkunitToWarehouse" payload with dynamic access token and query parameters
#      |Query         |Value                           |
#      |access_token  |ACCESS_TOKEN  |
#      |skunitId  |DB:skunits:id: id=1 LIMIT 1 |
#      |selectedWarehouseIds  |DB:warehouses:id: id=1 LIMIT 1 |
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      | JPath     | Value |
#      | $.result  | true  |
#      | $.error.message  | "Warehouse SKUnit Updated. " |
#    And verify response time is less than "2500" milliseconds
#    And I verify the data got updated as needed from DB
#      |expectedColumn|expectedValue|
#      |DB:warehouseskunits:quantity: skunit_id=(SELECT id FROM skunits WHERE id=1 LIMIT 1) AND warehouse_id=(SELECT id FROM warehouses WHERE id=1 LIMIT 1)|randomString|
#      |DB:warehouseskunits:price: skunit_id=(SELECT id FROM skunits WHERE id=1 LIMIT 1) AND warehouse_id=(SELECT id FROM warehouses WHERE id=1 LIMIT 1)|randomString|
#      |DB:warehouseskunits:mrp: skunit_id=(SELECT id FROM skunits WHERE id=1 LIMIT 1) AND warehouse_id=(SELECT id FROM warehouses WHERE id=1 LIMIT 1)|randomString|
#
#  #-----------------------------------------------------------------------------------------------------
#
#  @Test_2-negative
#  Scenario: TC_02 AssignSkunitToWarehouse without access token - Negative case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_AssignSkunitToWarehouse" payload
#      |JPath       |Value       |
#      |$.data.SKUNIT_ID.quantity  | randomInt |
#      |$.data.SKUNIT_ID.price  | randomInt |
#      |$.data.SKUNIT_ID.mrp  | randomInt |
#    And I replace SKUNIT_ID placeholder with skunitId in "POST_AssignSkunitToWarehouse" payload
#    And I post the request with "POST_AssignSkunitToWarehouse" payload with dynamic access token and query parameters
#      |Query         |Value                           |
#      |access_token  |  |
#      |skunitId  |DB:skunits:id: id=1 LIMIT 1 |
#      |selectedWarehouseIds  |DB:warehouses:id: id=1 LIMIT 1 |
#    Then I should see the response code as "401"
#    And the fields in response should match with expected values
#      | JPath     | Value    |
#      |$.error    |"invalid_request"|
#    And verify response time is less than "2500" milliseconds
#
#  #-----------------------------------------------------------------------------------------------------
#
#  @Test_3-negative
#  Scenario: TC_03 AssignSkunitToWarehouse - blank quantity case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_AssignSkunitToWarehouse" payload
#      |JPath       |Value       |
#      |$.data.SKUNIT_ID.quantity  |  |
#      |$.data.SKUNIT_ID.price  | randomInt |
#      |$.data.SKUNIT_ID.mrp  | randomInt |
#    And I replace SKUNIT_ID placeholder with skunitId in "POST_AssignSkunitToWarehouse" payload
#    And I post the request with "POST_AssignSkunitToWarehouse" payload with dynamic access token and query parameters
#      |Query         |Value                           |
#      |access_token  |ACCESS_TOKEN  |
#      |skunitId  |DB:skunits:id: id=1 LIMIT 1 |
#      |selectedWarehouseIds  |DB:warehouses:id: id=1 LIMIT 1 |
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#
#  #-----------------------------------------------------------------------------------------------------
#
#  @Test_4-negative
#  Scenario: TC_04 AssignSkunitToWarehouse - blank price case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_AssignSkunitToWarehouse" payload
#      |JPath       |Value       |
#      |$.data.SKUNIT_ID.quantity  | randomInt |
#      |$.data.SKUNIT_ID.price  |  |
#      |$.data.SKUNIT_ID.mrp  | randomInt |
#    And I replace SKUNIT_ID placeholder with skunitId in "POST_AssignSkunitToWarehouse" payload
#    And I post the request with "POST_AssignSkunitToWarehouse" payload with dynamic access token and query parameters
#      |Query         |Value                           |
#      |access_token  |ACCESS_TOKEN  |
#      |skunitId  |DB:skunits:id: id=1 LIMIT 1 |
#      |selectedWarehouseIds  |DB:warehouses:id: id=1 LIMIT 1 |
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#
#  #-----------------------------------------------------------------------------------------------------
#
#  @Test_5-negative
#  Scenario: TC_05 AssignSkunitToWarehouse - blank mrp case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_AssignSkunitToWarehouse" payload
#      |JPath       |Value       |
#      |$.data.SKUNIT_ID.quantity  | randomInt |
#      |$.data.SKUNIT_ID.price  | randomInt |
#      |$.data.SKUNIT_ID.mrp  |  |
#    And I replace SKUNIT_ID placeholder with skunitId in "POST_AssignSkunitToWarehouse" payload
#    And I post the request with "POST_AssignSkunitToWarehouse" payload with dynamic access token and query parameters
#      |Query         |Value                           |
#      |access_token  |ACCESS_TOKEN  |
#      |skunitId  |DB:skunits:id: id=1 LIMIT 1 |
#      |selectedWarehouseIds  |DB:warehouses:id: id=1 LIMIT 1 |
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#
#  #-----------------------------------------------------------------------------------------------------
#
#  @Test_6-negative
#  Scenario: TC_06 AssignSkunitToWarehouse - no quantity case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_AssignSkunitToWarehouse" payload
#      |JPath       |Value       |
#      |$.data.SKUNIT_ID.quantity  | null |
#      |$.data.SKUNIT_ID.price  | randomInt |
#      |$.data.SKUNIT_ID.mrp  | randomInt |
#    And I replace SKUNIT_ID placeholder with skunitId in "POST_AssignSkunitToWarehouse" payload
#    And I post the request with "POST_AssignSkunitToWarehouse" payload with dynamic access token and query parameters
#      |Query         |Value                           |
#      |access_token  |ACCESS_TOKEN  |
#      |skunitId  |DB:skunits:id: id=1 LIMIT 1 |
#      |selectedWarehouseIds  |DB:warehouses:id: id=1 LIMIT 1 |
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#
#  #-----------------------------------------------------------------------------------------------------
#
#  @Test_7-negative
#  Scenario: TC_07 AssignSkunitToWarehouse - no price case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_AssignSkunitToWarehouse" payload
#      |JPath       |Value       |
#      |$.data.SKUNIT_ID.quantity  | randomInt |
#      |$.data.SKUNIT_ID.price  | null |
#      |$.data.SKUNIT_ID.mrp  | randomInt |
#    And I replace SKUNIT_ID placeholder with skunitId in "POST_AssignSkunitToWarehouse" payload
#    And I post the request with "POST_AssignSkunitToWarehouse" payload with dynamic access token and query parameters
#      |Query         |Value                           |
#      |access_token  |ACCESS_TOKEN  |
#      |skunitId  |DB:skunits:id: id=1 LIMIT 1 |
#      |selectedWarehouseIds  |DB:warehouses:id: id=1 LIMIT 1 |
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#
#  #-----------------------------------------------------------------------------------------------------
#
#  @Test_8-negative
#  Scenario: TC_08 AssignSkunitToWarehouse - no mrp case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_AssignSkunitToWarehouse" payload
#      |JPath       |Value       |
#      |$.data.SKUNIT_ID.quantity  | randomInt |
#      |$.data.SKUNIT_ID.price  | randomInt |
#      |$.data.SKUNIT_ID.mrp  | null |
#    And I replace SKUNIT_ID placeholder with skunitId in "POST_AssignSkunitToWarehouse" payload
#    And I post the request with "POST_AssignSkunitToWarehouse" payload with dynamic access token and query parameters
#      |Query         |Value                           |
#      |access_token  |ACCESS_TOKEN  |
#      |skunitId  |DB:skunits:id: id=1 LIMIT 1 |
#      |selectedWarehouseIds  |DB:warehouses:id: id=1 LIMIT 1 |
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#
#  #-----------------------------------------------------------------------------------------------------
#
#  @Test_9-negative
#  Scenario: TC_09 AssignSkunitToWarehouse - invalid skunitId case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_AssignSkunitToWarehouse" payload
#      |JPath       |Value       |
#      |$.data.SKUNIT_ID.quantity  | randomInt |
#      |$.data.SKUNIT_ID.price  | randomInt |
#      |$.data.SKUNIT_ID.mrp  | randomInt |
#    And I replace SKUNIT_ID placeholder with skunitId in "POST_AssignSkunitToWarehouse" payload
#    And I post the request with "POST_AssignSkunitToWarehouse" payload with dynamic access token and query parameters
#      |Query         |Value                           |
#      |access_token  |ACCESS_TOKEN  |
#      |skunitId  |999999 |
#      |selectedWarehouseIds  |DB:warehouses:id: id=1 LIMIT 1 |
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#
#  #-----------------------------------------------------------------------------------------------------
#
#  @Test_10-negative
#  Scenario: TC_10 AssignSkunitToWarehouse - invalid warehouseId case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_AssignSkunitToWarehouse" payload
#      |JPath       |Value       |
#      |$.data.SKUNIT_ID.quantity  | randomInt |
#      |$.data.SKUNIT_ID.price  | randomInt |
#      |$.data.SKUNIT_ID.mrp  | randomInt |
#    And I replace SKUNIT_ID placeholder with skunitId in "POST_AssignSkunitToWarehouse" payload
#    And I post the request with "POST_AssignSkunitToWarehouse" payload with dynamic access token and query parameters
#      |Query         |Value                           |
#      |access_token  |ACCESS_TOKEN  |
#      |skunitId  |DB:skunits:id: id=1 LIMIT 1 |
#      |selectedWarehouseIds  |999999 |
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#
#  #-----------------------------------------------------------------------------------------------------
#
#  @Test_11-negative
#  Scenario: TC_11 AssignSkunitToWarehouse - wrong Resource URI
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I post the request with "POST_AssignSkunitToWarehouse_invalid" payload with dynamic access token and query parameters
#      |Query         |Value     |
#      |access_token  |ACCESS_TOKEN  |
#      |skunitId  |DB:skunits:id: id=1 LIMIT 1 |
#      |selectedWarehouseIds  |DB:warehouses:id: id=1 LIMIT 1 |
#    Then I should see the response code as "404"
#    And verify response time is less than "1000" milliseconds
#
#  #-----------------------------------------------------------------------------------------------------
#
#  @Test_12-negative
#  Scenario: TC_12 AssignSkunitToWarehouse - wrong Access Token
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_AssignSkunitToWarehouse" payload
#      |JPath       |Value       |
#      |$.data.SKUNIT_ID.quantity  | randomInt |
#      |$.data.SKUNIT_ID.price  | randomInt |
#      |$.data.SKUNIT_ID.mrp  | randomInt |
#    And I replace SKUNIT_ID placeholder with skunitId in "POST_AssignSkunitToWarehouse" payload
#    And I post the request with "POST_AssignSkunitToWarehouse" payload with dynamic access token and query parameters
#      |Query         |Value |
#      |access_token  | xyz |
#      |skunitId  |DB:skunits:id: id=1 LIMIT 1 |
#      |selectedWarehouseIds  |DB:warehouses:id: id=1 LIMIT 1 |
#    Then I should see the response code as "401"
#    And the fields in response should match with expected values
#      | JPath     | Value |
#      | error   |  invalid_grant   |
#    And verify response time is less than "500" milliseconds

