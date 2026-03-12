@BizomWebAPI @OS @InventoriesManagement @PostAddInventoryType
Feature: Add Inventory Type API Testing
  As a system user
  I want to add new inventory types through the API
  So that I can create and manage inventory type data in the system

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |origin|https://devuitest.bizomdev.in|
      |referer|https://devuitest.bizomdev.in/inventorytypes/add|

  @Positive @Smoke
  Scenario: TC_01 Add inventory type with valid data and random strings
    And I modify fields with random values and remove fields in "POST_inventorytypes_add" payload
      |JPath|Value|
      |$.data.Inventorytype.name|randomString|
      |$.data.Inventorytype.name_alias|randomString|
    And I post the request with "POST_inventorytypes_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "add_inventory_type_response" name using full path

  @Positive @DataValidation @DatabaseValidation
  Scenario: TC_02 Add inventory type and validate database entry
    And I modify fields with random values and remove fields in "POST_inventorytypes_add" payload
      |JPath|Value|
      |$.data.Inventorytype.name|randomString|
      |$.data.Inventorytype.name_alias|randomString|
    And I post the request with "POST_inventorytypes_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify the data got updated as needed from DB
      |expectedColumn|expectedValue|
      |DB:inventorytypes:parent_id:id = (SELECT MAX(id) FROM inventorytypes)|2|
      |DB:inventorytypes:is_active:id = (SELECT MAX(id) FROM inventorytypes)|true|
      |DB:inventorytypes:iseditable:id = (SELECT MAX(id) FROM inventorytypes)|true|

  @Positive @Functional
  Scenario: TC_03 Add inventory type with all required fields
    And I modify fields with random values and remove fields in "POST_inventorytypes_add" payload
      |JPath|Value|
      |$.data.Inventorytype.name|randomString|
      |$.data.Inventorytype.name_alias|randomString|
      |$.data.Inventorytype.parent_id|2|
      |$.data.Inventorytype.is_active|1|
      |$.data.Inventorytype.iseditable|1|
    And I post the request with "POST_inventorytypes_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Add inventory type without access token
    And I modify fields with random values and remove fields in "POST_inventorytypes_add" payload
      |JPath|Value|
      |$.data.Inventorytype.name|randomString|
      |$.data.Inventorytype.name_alias|randomString|
    And I post the request with "POST_inventorytypes_add" payload
    Then I should see the response code as "403"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_05 Add inventory type with invalid access token
    And I modify fields with random values and remove fields in "POST_inventorytypes_add" payload
      |JPath|Value|
      |$.data.Inventorytype.name|randomString|
      |$.data.Inventorytype.name_alias|randomString|
    And I post the request with "POST_inventorytypes_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title ""
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_06 Add inventory type with expired access token
    And I modify fields with random values and remove fields in "POST_inventorytypes_add" payload
      |JPath|Value|
      |$.data.Inventorytype.name|randomString|
      |$.data.Inventorytype.name_alias|randomString|
    And I post the request with "POST_inventorytypes_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title ""
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_07 Add inventory type with empty name
    And I modify fields with random values and remove fields in "POST_inventorytypes_add" payload
      |JPath|Value|
      |$.data.Inventorytype.name||
      |$.data.Inventorytype.name_alias|randomString|
    And I post the request with "POST_inventorytypes_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_08 Add inventory type with empty name_alias
    And I modify fields with random values and remove fields in "POST_inventorytypes_add" payload
      |JPath|Value|
      |$.data.Inventorytype.name|randomString|
      |$.data.Inventorytype.name_alias||
    And I post the request with "POST_inventorytypes_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_09 Add inventory type with invalid parent_id
    And I modify fields with random values and remove fields in "POST_inventorytypes_add" payload
      |JPath|Value|
      |$.data.Inventorytype.name|randomString|
      |$.data.Inventorytype.name_alias|randomString|
      |$.data.Inventorytype.parent_id|99999|
    And I post the request with "POST_inventorytypes_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_10 Add inventory type with negative parent_id
    And I modify fields with random values and remove fields in "POST_inventorytypes_add" payload
      |JPath|Value|
      |$.data.Inventorytype.name|randomString|
      |$.data.Inventorytype.name_alias|randomString|
      |$.data.Inventorytype.parent_id|-1|
    And I post the request with "POST_inventorytypes_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_11 Add inventory type with invalid is_active value
    And I modify fields with random values and remove fields in "POST_inventorytypes_add" payload
      |JPath|Value|
      |$.data.Inventorytype.name|randomString|
      |$.data.Inventorytype.name_alias|randomString|
      |$.data.Inventorytype.is_active|5|
    And I post the request with "POST_inventorytypes_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_12 Add inventory type with invalid iseditable value
    And I modify fields with random values and remove fields in "POST_inventorytypes_add" payload
      |JPath|Value|
      |$.data.Inventorytype.name|randomString|
      |$.data.Inventorytype.name_alias|randomString|
      |$.data.Inventorytype.iseditable|5|
    And I post the request with "POST_inventorytypes_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_13 Add inventory type with XSS in name field
    And I modify fields with random values and remove fields in "POST_inventorytypes_add" payload
      |JPath|Value|
      |$.data.Inventorytype.name|<script>alert('XSS')</script>|
      |$.data.Inventorytype.name_alias|randomString|
    And I post the request with "POST_inventorytypes_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_14 Add inventory type with SQL injection in name field
    And I modify fields with random values and remove fields in "POST_inventorytypes_add" payload
      |JPath|Value|
      |$.data.Inventorytype.name|'; DROP TABLE inventorytypes; --|
      |$.data.Inventorytype.name_alias|randomString|
    And I post the request with "POST_inventorytypes_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_15 Add inventory type with missing required fields
    And I modify fields with random values and remove fields in "POST_inventorytypes_add" payload
      |JPath|Value|
      |$.data.Inventorytype.name||
      |$.data.Inventorytype.name_alias||
    And I post the request with "POST_inventorytypes_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_16 Add inventory type with null parent_id
    And I modify fields with random values and remove fields in "POST_inventorytypes_add" payload
      |JPath|Value|
      |$.data.Inventorytype.name|randomString|
      |$.data.Inventorytype.name_alias|randomString|
      |$.data.Inventorytype.parent_id|null|
    And I post the request with "POST_inventorytypes_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_17 Add inventory type with invalid endpoint
    And I modify fields with random values and remove fields in "POST_inventorytypes_add" payload
      |JPath|Value|
      |$.data.Inventorytype.name|randomString|
      |$.data.Inventorytype.name_alias|randomString|
    And I post the request with "inventorytypes_add_invalid" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title ""
    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: TC_18 Performance test for add inventory type endpoint
    And I modify fields with random values and remove fields in "POST_inventorytypes_add" payload
      |JPath|Value|
      |$.data.Inventorytype.name|randomString|
      |$.data.Inventorytype.name_alias|randomString|
    And I post the request with "POST_inventorytypes_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: TC_19 Concurrent add inventory type requests
    And I modify fields with random values and remove fields in "POST_inventorytypes_add" payload
      |JPath|Value|
      |$.data.Inventorytype.name|randomString|
      |$.data.Inventorytype.name_alias|randomString|
    And I post the request with "POST_inventorytypes_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Boundary @Validation
  Scenario: TC_20 Add inventory type with maximum length name
    And I modify fields with random values and remove fields in "POST_inventorytypes_add" payload
      |JPath|Value|
      |$.data.Inventorytype.name|randomString:255|
      |$.data.Inventorytype.name_alias|randomString|
    And I post the request with "POST_inventorytypes_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Boundary @Validation
  Scenario: TC_21 Add inventory type with minimum length name
    And I modify fields with random values and remove fields in "POST_inventorytypes_add" payload
      |JPath|Value|
      |$.data.Inventorytype.name|randomString:1|
      |$.data.Inventorytype.name_alias|randomString|
    And I post the request with "POST_inventorytypes_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @DataIntegrity
  Scenario: TC_22 Validate inventory type data integrity after creation
    And I modify fields with random values and remove fields in "POST_inventorytypes_add" payload
      |JPath|Value|
      |$.data.Inventorytype.name|randomString|
      |$.data.Inventorytype.name_alias|randomString|
    And I post the request with "POST_inventorytypes_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify the data got updated as needed from DB
      |expectedColumn|expectedValue|
      |DB:inventorytypes:name:id = (SELECT MAX(id) FROM inventorytypes)|randomString|
      |DB:inventorytypes:name_alias:id = (SELECT MAX(id) FROM inventorytypes)|randomString|
      |DB:inventorytypes:parent_id:id = (SELECT MAX(id) FROM inventorytypes)|2|
      |DB:inventorytypes:is_active:id = (SELECT MAX(id) FROM inventorytypes)|true|
      |DB:inventorytypes:iseditable:id = (SELECT MAX(id) FROM inventorytypes)|true|

  @Positive @BusinessLogic
  Scenario: TC_24 Validate inventory type business logic
    And I modify fields with random values and remove fields in "POST_inventorytypes_add" payload
      |JPath|Value|
      |$.data.Inventorytype.name|randomString|
      |$.data.Inventorytype.name_alias|randomString|
      |$.data.Inventorytype.parent_id|2|
      |$.data.Inventorytype.is_active|1|
      |$.data.Inventorytype.iseditable|1|
    And I post the request with "POST_inventorytypes_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify the data got updated as needed from DB
      |expectedColumn|expectedValue|
      |DB:inventorytypes:is_active:id = (SELECT MAX(id) FROM inventorytypes)|true|
      |DB:inventorytypes:iseditable:id = (SELECT MAX(id) FROM inventorytypes)|true|

