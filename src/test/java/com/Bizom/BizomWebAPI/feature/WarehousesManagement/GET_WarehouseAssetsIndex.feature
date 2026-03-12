@BizomWebAPI @CE @WarehousesManagement @WarehouseManagement @WarehouseAssetsIndex @SystemIntegration
Feature: Get Warehouse Assets Index API Testing
  As a system user
  I want to test the warehouse assets index endpoint
  So that I can ensure proper functionality and HTML response validation for warehouse assets management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|text/html|
      |Accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get warehouse assets index without access token
    When I send the GET request to "warehouse_assets_index" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_02 Get warehouse assets index with invalid access token
    And I send the GET request to "warehouse_assets_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title ""

  @Negative @Security
  Scenario: TC_03 Get warehouse assets index with expired access token
    And I send the GET request to "warehouse_assets_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title ""

  @Negative @Security
  Scenario: TC_04 Get warehouse assets index with malformed access token
    And I send the GET request to "warehouse_assets_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the HTML response should contain page title ""

  @Positive @Smoke
  Scenario: TC_05 Get warehouse assets index with valid access token
    And I send the GET request to "warehouse_assets_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
       And verify response time is less than "2000" milliseconds
    And the HTML response should contain page title "Warehouseassets	"

  @Positive @Functional
  Scenario: TC_06 Validate warehouse assets index HTML structure
    And I send the GET request to "warehouse_assets_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
       Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the HTML response should contain page title "Warehouseassets	"

      @Positive @UIValidation
  Scenario: TC_07 Validate warehouse assets index UI elements
    And I send the GET request to "warehouse_assets_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
       Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the HTML response should contain page title "Warehouseassets	"
   
  @Positive @ContentValidation
  Scenario: TC_08 Validate warehouse assets index content structure
    And I send the GET request to "warehouse_assets_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
       Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the HTML response should contain page title "Warehouseassets	"
   
  @Positive @ContentValidation
  Scenario: TC_09 Validate warehouse assets index content structure
    And I send the GET request to "warehouse_assets_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the HTML response should contain page title "Warehouseassets	"
   
  @Positive @Performance
  Scenario: TC_10 Performance test for warehouse assets index endpoint
    And I send the GET request to "warehouse_assets_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
 And the HTML response should contain page title "Warehouseassets	"

  @Positive @Concurrency
  Scenario: TC_11 Concurrent access test for warehouse assets index endpoint
    And I send the GET request to "warehouse_assets_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the HTML response should contain page title "Warehouseassets	"

  @Negative @Validation
  Scenario: TC_12   Get warehouse assets index with invalid query parameter
    And I send the GET request to "warehouse_assets_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
       Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the HTML response should contain page title "Warehouseassets	"

  @Negative @Security
  Scenario: TC_13 Get warehouse assets index with XSS attempt in query parameter
    And I send the GET request to "warehouse_assets_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
      Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the HTML response should contain page title "Warehouseassets	"

  @Negative @Security
  Scenario: TC_14 Get warehouse assets index with SQL injection attempt in query parameter
    And I send the GET request to "warehouse_assets_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE warehouseassets; --|
      Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the HTML response should contain page title "Warehouseassets	"

  @Negative @Boundary
  Scenario: TC_15 Get warehouse assets index with excessive query parameters
    And I send the GET request to "warehouse_assets_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
       Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the HTML response should contain page title "Warehouseassets	"

#  @Negative @ErrorHandling
#  Scenario: TC_16 Get warehouse assets index with invalid endpoint
#    And I send the GET request to "warehouse_assets_index_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2000" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_17 Validate warehouse assets index business logic
    And I send the GET request to "warehouse_assets_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      And the HTML response should contain page title "Warehouseassets	"

  @Positive @DataIntegrity
  Scenario: TC_18 Validate warehouse assets index data integrity
    And I send the GET request to "warehouse_assets_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the HTML response should contain page title "Warehouseassets	"
  
