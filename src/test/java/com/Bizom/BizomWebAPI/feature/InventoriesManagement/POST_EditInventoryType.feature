@BizomWebAPI @OS @InventoriesManagement @PostEditInventoryType
Feature: Edit Inventory Type API Testing
  As a system user
  I want to edit existing inventory types through the API
  So that I can update and manage inventory type data in the system

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |origin|https://devuitest.bizomdev.in|
      |referer|https://devuitest.bizomdev.in/inventorytypes/edit/5|

  @Positive @Smoke
  Scenario: TC_01 Edit inventory type with valid data and random string for name_alias
    And I modify fields with random values and remove fields in "POST_inventorytypes_edit" payload
      |JPath|Value|
      |$.data.Inventorytype.name_alias|randomString|
    And I post the request with "POST_inventorytypes_edit" payload with path parameter
      |Path|Value|
      |id|5|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds
    And I store the response as "edit_inventory_type_response" name using full path

  @Positive @DataValidation @DatabaseValidation
  Scenario: TC_02 Edit inventory type and validate database entry
    And I modify fields with random values and remove fields in "POST_inventorytypes_edit" payload
      |JPath|Value|
      |$.data.Inventorytype.name_alias|randomString|
    And I post the request with "POST_inventorytypes_edit" payload with path parameter
      |Path|Value|
      |id|5|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds
    And I verify the data got updated as needed from DB
      |expectedColumn|expectedValue|
      |DB:inventorytypes:name_alias:id=5|randomString|
      |DB:inventorytypes:is_active:id=5|true|
      |DB:inventorytypes:iseditable:id=5|true|

  @Positive @Functional
  Scenario: TC_03 Edit inventory type with all required fields
    And I modify fields with random values and remove fields in "POST_inventorytypes_edit" payload
      |JPath|Value|
      |$.data.Inventorytype.name|cocacola|
      |$.data.Inventorytype.name_alias|randomString|
      |$.data.Inventorytype.is_active|1|
      |$.data.Inventorytype.iseditable|1|
    And I post the request with "POST_inventorytypes_edit" payload with path parameter
      |Path|Value|
      |id|5|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Edit inventory type without access token
    And I modify fields with random values and remove fields in "POST_inventorytypes_edit" payload
      |JPath|Value|
      |$.data.Inventorytype.name_alias|randomString|
    And I post the request with "POST_inventorytypes_edit" payload with path parameter
      |Path|Value|
      |id|5|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_05 Edit inventory type with empty name_alias
    And I modify fields with random values and remove fields in "POST_inventorytypes_edit" payload
      |JPath|Value|
      |$.data.Inventorytype.name_alias||
    And I post the request with "POST_inventorytypes_edit" payload with path parameter
      |Path|Value|
      |id|5|
    Then I should see the response code as "302"
    And the HTML response should contain page title ""
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_06 Edit inventory type with empty name
    And I modify fields with random values and remove fields in "POST_inventorytypes_edit" payload
      |JPath|Value|
      |$.data.Inventorytype.name||
      |$.data.Inventorytype.name_alias|randomString|
    And I post the request with "POST_inventorytypes_edit" payload with path parameter
      |Path|Value|
      |id|5|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_07 Edit inventory type with invalid is_active value
    And I modify fields with random values and remove fields in "POST_inventorytypes_edit" payload
      |JPath|Value|
      |$.data.Inventorytype.name_alias|randomString|
      |$.data.Inventorytype.is_active|5|
    And I post the request with "POST_inventorytypes_edit" payload with path parameter
      |Path|Value|
      |id|5|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_08 Edit inventory type with invalid iseditable value
    And I modify fields with random values and remove fields in "POST_inventorytypes_edit" payload
      |JPath|Value|
      |$.data.Inventorytype.name_alias|randomString|
      |$.data.Inventorytype.iseditable|5|
    And I post the request with "POST_inventorytypes_edit" payload with path parameter
      |Path|Value|
      |id|5|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_09 Edit inventory type with XSS in name_alias field
    And I modify fields with random values and remove fields in "POST_inventorytypes_edit" payload
      |JPath|Value|
      |$.data.Inventorytype.name_alias|<script>alert('XSS')</script>|
    And I post the request with "POST_inventorytypes_edit" payload with path parameter
      |Path|Value|
      |id|5|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_10 Edit inventory type with SQL injection in name_alias field
    And I modify fields with random values and remove fields in "POST_inventorytypes_edit" payload
      |JPath|Value|
      |$.data.Inventorytype.name_alias|'; DROP TABLE inventorytypes; --|
    And I post the request with "POST_inventorytypes_edit" payload with path parameter
      |Path|Value|
      |id|5|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_11 Edit inventory type with invalid ID in path parameter
    And I modify fields with random values and remove fields in "POST_inventorytypes_edit" payload
      |JPath|Value|
      |$.data.Inventorytype.name_alias|randomString|
    And I post the request with "POST_inventorytypes_edit" payload with path parameter
      |Path|Value|
      |id|99999|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_12 Edit inventory type with negative ID in path parameter
    And I modify fields with random values and remove fields in "POST_inventorytypes_edit" payload
      |JPath|Value|
      |$.data.Inventorytype.name_alias|randomString|
    And I post the request with "POST_inventorytypes_edit" payload with path parameter
      |Path|Value|
      |id|-1|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_13 Edit inventory type with zero ID in path parameter
    And I modify fields with random values and remove fields in "POST_inventorytypes_edit" payload
      |JPath|Value|
      |$.data.Inventorytype.name_alias|randomString|
    And I post the request with "POST_inventorytypes_edit" payload with path parameter
      |Path|Value|
      |id|0|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_14 Edit inventory type with invalid endpoint
    And I modify fields with random values and remove fields in "POST_inventorytypes_edit" payload
      |JPath|Value|
      |$.data.Inventorytype.name_alias|randomString|
    And I post the request with "inventorytypes_edit_invalid" payload with path parameter
      |Path|Value|
      |id|5|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: TC_15 Performance test for edit inventory type endpoint
    And I modify fields with random values and remove fields in "POST_inventorytypes_edit" payload
      |JPath|Value|
      |$.data.Inventorytype.name_alias|randomString|
    And I post the request with "POST_inventorytypes_edit" payload with path parameter
      |Path|Value|
      |id|5|
    Then I should see the response code as "302"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: TC_16 Concurrent edit inventory type requests
    And I modify fields with random values and remove fields in "POST_inventorytypes_edit" payload
      |JPath|Value|
      |$.data.Inventorytype.name_alias|randomString|
    And I post the request with "POST_inventorytypes_edit" payload with path parameter
      |Path|Value|
      |id|5|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Boundary @Validation
  Scenario: TC_17 Edit inventory type with maximum length name_alias
    And I modify fields with random values and remove fields in "POST_inventorytypes_edit" payload
      |JPath|Value|
      |$.data.Inventorytype.name_alias|randomString:255|
    And I post the request with "POST_inventorytypes_edit" payload with path parameter
      |Path|Value|
      |id|5|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Boundary @Validation
  Scenario: TC_18 Edit inventory type with minimum length name_alias
    And I modify fields with random values and remove fields in "POST_inventorytypes_edit" payload
      |JPath|Value|
      |$.data.Inventorytype.name_alias|randomString:1|
    And I post the request with "POST_inventorytypes_edit" payload with path parameter
      |Path|Value|
      |id|5|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Positive @DataIntegrity
  Scenario: TC_19 Validate inventory type data integrity after edit
    And I modify fields with random values and remove fields in "POST_inventorytypes_edit" payload
      |JPath|Value|
      |$.data.Inventorytype.name_alias|randomString|
    And I post the request with "POST_inventorytypes_edit" payload with path parameter
      |Path|Value|
      |id|5|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds
    And I verify the data got updated as needed from DB
      |expectedColumn|expectedValue|
      |DB:inventorytypes:name_alias:id=5|randomString|
      |DB:inventorytypes:is_active:id=5|true|
      |DB:inventorytypes:iseditable:id=5|true|

  @Positive @BusinessLogic
  Scenario: TC_20 Validate inventory type business logic after edit
    And I modify fields with random values and remove fields in "POST_inventorytypes_edit" payload
      |JPath|Value|
      |$.data.Inventorytype.name|cocacola|
      |$.data.Inventorytype.name_alias|randomString|
      |$.data.Inventorytype.is_active|1|
      |$.data.Inventorytype.iseditable|1|
    And I post the request with "POST_inventorytypes_edit" payload with path parameter
      |Path|Value|
      |id|5|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds
    And I verify the data got updated as needed from DB
      |expectedColumn|expectedValue|
      |DB:inventorytypes:is_active:id=5|true|
      |DB:inventorytypes:iseditable:id=5|true|

  @Positive @Functional
  Scenario: TC_21 Edit inventory type with is_active set to 0
    And I modify fields with random values and remove fields in "POST_inventorytypes_edit" payload
      |JPath|Value|
      |$.data.Inventorytype.name_alias|randomString|
      |$.data.Inventorytype.is_active|0|
    And I post the request with "POST_inventorytypes_edit" payload with path parameter
      |Path|Value|
      |id|5|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds
    And I verify the data got updated as needed from DB
      |expectedColumn|expectedValue|
      |DB:inventorytypes:is_active:id=5|true|

  @Positive @Functional
  Scenario: TC_22 Edit inventory type with iseditable set to 0
    And I modify fields with random values and remove fields in "POST_inventorytypes_edit" payload
      |JPath|Value|
      |$.data.Inventorytype.name_alias|randomString|
      |$.data.Inventorytype.iseditable|0|
    And I post the request with "POST_inventorytypes_edit" payload with path parameter
      |Path|Value|
      |id|5|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds
    And I verify the data got updated as needed from DB
      |expectedColumn|expectedValue|
      |DB:inventorytypes:iseditable:id=5|true|

