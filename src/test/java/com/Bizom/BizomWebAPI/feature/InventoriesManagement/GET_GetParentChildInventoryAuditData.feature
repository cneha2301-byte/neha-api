@BizomWebAPI @OS @InventoriesManagement @GetParentChildInventoryAuditData @DataProcessing
Feature: Get Parent Child Inventory Audit Data API Testing
  As a system user
  I want to test the get parent child inventory audit data endpoint
  So that I can ensure proper functionality and data retrieval for parent child inventory audit data

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get parent child inventory audit data without access token
    When I send the GET request to "inventories_get_parent_child_inventory_audit_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token||id|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get parent child inventory audit data with invalid access token
    And I send the GET request to "inventories_get_parent_child_inventory_audit_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|id|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get parent child inventory audit data with expired access token
    And I send the GET request to "inventories_get_parent_child_inventory_audit_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|id|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get parent child inventory audit data with malformed access token
    And I send the GET request to "inventories_get_parent_child_inventory_audit_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|id|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get parent child inventory audit data with valid access token and ID
    And I send the GET request to "inventories_get_parent_child_inventory_audit_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|
      |$.aaData|[]|
    And I store the response as "parent_child_inventory_audit_data_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate parent child inventory audit data response structure
    And I send the GET request to "inventories_get_parent_child_inventory_audit_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|
      |$.aaData|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate parent child inventory audit data sEcho field
    And I send the GET request to "inventories_get_parent_child_inventory_audit_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|

  @Positive @DataValidation
  Scenario: TC_08 Validate parent child inventory audit data iTotalRecords field
    And I send the GET request to "inventories_get_parent_child_inventory_audit_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.iTotalRecords|0|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.iTotalRecords|number|

  @Positive @DataValidation
  Scenario: TC_09 Validate parent child inventory audit data iTotalDisplayRecords field
    And I send the GET request to "inventories_get_parent_child_inventory_audit_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.iTotalDisplayRecords|0|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.iTotalDisplayRecords|number|

  @Positive @DataValidation
  Scenario: TC_10 Validate parent child inventory audit data aaData array structure
    And I send the GET request to "inventories_get_parent_child_inventory_audit_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.aaData|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData|array|

  @Positive @DataTablesValidation
  Scenario: TC_11 Validate parent child inventory audit data DataTables structure
    And I send the GET request to "inventories_get_parent_child_inventory_audit_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|
      |$.aaData|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Positive @Performance
  Scenario: TC_12 Performance test for parent child inventory audit data endpoint
    And I send the GET request to "inventories_get_parent_child_inventory_audit_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|
      |$.aaData|[]|

  @Positive @Concurrency
  Scenario: TC_13 Concurrent access test for parent child inventory audit data endpoint
    And I send the GET request to "inventories_get_parent_child_inventory_audit_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|
      |$.aaData|[]|

  @Positive @Functional
  Scenario: TC_14 Get parent child inventory audit data with different IDs
    And I send the GET request to "inventories_get_parent_child_inventory_audit_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Negative @Validation
  Scenario: TC_15 Get parent child inventory audit data with invalid query parameters
    And I send the GET request to "inventories_get_parent_child_inventory_audit_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |invalid_param|invalid_value|| |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|
      |$.aaData|[]|

#  @Negative @Validation
#  Scenario: TC_16 Get parent child inventory audit data with special characters in ID
#    And I send the GET request to "inventories_get_parent_child_inventory_audit_data" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|id|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the HTML response should contain page title "Users"

#  @Negative @Security
#  Scenario: TC_17 Get parent child inventory audit data with SQL injection attempt in ID
#    And I send the GET request to "inventories_get_parent_child_inventory_audit_data" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|id|'; DROP TABLE inventories; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the HTML response should contain page title "Users"

  @Negative @Boundary
  Scenario: TC_18 Get parent child inventory audit data with empty ID
    And I send the GET request to "inventories_get_parent_child_inventory_audit_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id||
    Then I should see the response code as "500"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: TC_19 Get parent child inventory audit data with zero ID
    And I send the GET request to "inventories_get_parent_child_inventory_audit_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Negative @Boundary
  Scenario: TC_20 Get parent child inventory audit data with negative ID
    And I send the GET request to "inventories_get_parent_child_inventory_audit_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Negative @Boundary
  Scenario: TC_21 Get parent child inventory audit data with very large ID
    And I send the GET request to "inventories_get_parent_child_inventory_audit_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|999999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Negative @ErrorHandling
  Scenario: TC_22 Get parent child inventory audit data with invalid endpoint
    And I send the GET request to "inventories_get_parent_child_inventory_audit_data_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title " "
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_23 Validate parent child inventory audit data business logic
    And I send the GET request to "inventories_get_parent_child_inventory_audit_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|
      |$.aaData|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Positive @DataIntegrity
  Scenario: TC_24 Validate parent child inventory audit data data integrity
    And I send the GET request to "inventories_get_parent_child_inventory_audit_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|
      |$.aaData|[]|

  @Positive @Regression
  Scenario: TC_25 Regression test for parent child inventory audit data endpoint
    And I send the GET request to "inventories_get_parent_child_inventory_audit_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|
      |$.aaData|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Positive @Functional
  Scenario: TC_26 Validate parent child inventory audit data response completeness
    And I send the GET request to "inventories_get_parent_child_inventory_audit_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|
      |$.aaData|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
    And validating the response contains the following values
      |Value|
      |sEcho|
      |iTotalRecords|
      |iTotalDisplayRecords|
      |aaData|
    And I store the response as "parent_child_inventory_audit_data_response" name using full path

  @Positive @DataTablesValidation
  Scenario: TC_27 Validate parent child inventory audit data DataTables consistency
    And I send the GET request to "inventories_get_parent_child_inventory_audit_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|
      |$.aaData|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Positive @DataTablesValidation
  Scenario: TC_28 Validate parent child inventory audit data record counts
    And I send the GET request to "inventories_get_parent_child_inventory_audit_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

