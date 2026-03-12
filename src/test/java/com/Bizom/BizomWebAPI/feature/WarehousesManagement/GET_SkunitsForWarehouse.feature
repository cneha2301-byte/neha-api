@BizomWebAPI @CE @WarehousesManagement @WarehouseManagement @SkunitsForWarehouse @SystemIntegration
Feature: SK Units for Warehouse API Testing
  As a system user
  I want to test the SK units for warehouse endpoint
  So that I can ensure proper functionality and data retrieval for SK units associated with specific warehouses

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get SK units for warehouse without access token
    When I send the GET request to "warehouse_skunits_for_warehouse" endpoint with path parameters
      |Path|Value|
      |warehouseId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get SK units for warehouse with invalid access token
#    And I send the GET request to "warehouse_skunits_for_warehouse" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|invalid_token_12345|warehouseId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get SK units for warehouse with expired access token
#    And I send the GET request to "warehouse_skunits_for_warehouse" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|expired_token_12345|warehouseId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get SK units for warehouse with malformed access token
#    And I send the GET request to "warehouse_skunits_for_warehouse" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|malformed.token.here|warehouseId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: Get SK units for warehouse with valid warehouse ID 1
    And I send the GET request to "warehouse_skunits_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data fetched successfully.|
      |$.data|[]|
    And I store the response as "skunits_warehouse_1_response" name using full path

  @Positive @Functional
  Scenario: Get SK units for warehouse with valid warehouse ID 2
    And I send the GET request to "warehouse_skunits_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data fetched successfully.|
      |$.data|[]|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.outlets.1|DB:skunits:name: id=1|
      |$.outlets.3|DB:skunits:name: id=3|
      |$.outlets.5|DB:skunits:name: id=5|
      |$.outlets.6|DB:skunits:name: id=6|
      |$.outlets.13|TC_163_1|
      |$.outlets.14|TC_163_2|
      |$.outlets.15|TC_162_1|
      |$.outlets.16|TC_162_2|
      |$.outlets.18|50-50|

  @Positive @Functional
  Scenario: Get SK units for warehouse with valid warehouse ID 3
    And I send the GET request to "warehouse_skunits_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data fetched successfully.|
      |$.data|[]|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.outlets.18|50-50|

  @Positive @Functional
  Scenario: Get SK units for warehouse with valid warehouse ID 4
    And I send the GET request to "warehouse_skunits_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|4|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data fetched successfully.|
      |$.data|[]|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.outlets.6|DB:skunits:name: id=6|
      |$.outlets.18|50-50|

  @Positive @DataValidation
  Scenario: Validate SK units for warehouse response structure for warehouse ID 1
    And I send the GET request to "warehouse_skunits_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data fetched successfully.|
      |$.data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
      |$.outlets|object|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.outlets.1|DB:skunits:name: id=1|
      |$.outlets.3|DB:skunits:name: id=3|
      |$.outlets.4|DB:skunits:name: id=4|
      |$.outlets.5|DB:skunits:name: id=5 |
      |$.outlets.6|DB:skunits:name: id=6|

  @Positive @DataValidation
  Scenario: Validate SK units for warehouse specific data values for warehouse ID 1
    And I send the GET request to "warehouse_skunits_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data fetched successfully.|
      |$.data|[]|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.outlets.1|DB:skunits:name: id=1|
      |$.outlets.3|DB:skunits:name: id=3|
      |$.outlets.4|DB:skunits:name: id=4|
      |$.outlets.5|DB:skunits:name: id=5 |
      |$.outlets.6|DB:skunits:name: id=6|

  @Positive @DataValidation
  Scenario: Validate SK units for warehouse with empty result for non-existent warehouse
    And I send the GET request to "warehouse_skunits_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|999|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|false|


  @Positive @Performance
  Scenario: Performance test for SK units for warehouse endpoint
    And I send the GET request to "warehouse_skunits_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data fetched successfully.|
      |$.data|[]|

  @Positive @Concurrency
  Scenario: Concurrent access test for SK units for warehouse endpoint
    And I send the GET request to "warehouse_skunits_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data fetched successfully.|
      |$.data|[]|

#  @Negative @Validation
#  Scenario: Get SK units for warehouse with invalid warehouse ID format
#    And I send the GET request to "warehouse_skunits_for_warehouse" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|invalid_id|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|data not found|

  @Negative @Validation
  Scenario: Get SK units for warehouse with negative warehouse ID
    And I send the GET request to "warehouse_skunits_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No SKUs found for the given warehouse ID.|

  @Negative @Validation
  Scenario: Get SK units for warehouse with zero warehouse ID
    And I send the GET request to "warehouse_skunits_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Invalid params passed.|

  @Negative @Validation
  Scenario: Get SK units for warehouse with very large warehouse ID
    And I send the GET request to "warehouse_skunits_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|999999999|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|false|


#  @Negative @Security
#  Scenario: Get SK units for warehouse with XSS attempt in warehouse ID
#    And I send the GET request to "warehouse_skunits_for_warehouse" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|data not found|

  @Negative @Boundary
  Scenario: Get SK units for warehouse with boundary warehouse ID value
    And I send the GET request to "warehouse_skunits_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data fetched successfully.|
      |$.data|[]|

#  @Negative @ErrorHandling
#  Scenario: Get SK units for warehouse with invalid endpoint
#    And I send the GET request to "warehouse_skunits_for_warehouse_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "404"
#    And verify response time is less than "2000" milliseconds
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

  @Positive @BusinessLogic
  Scenario: Validate SK units for warehouse business logic
    And I send the GET request to "warehouse_skunits_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data fetched successfully.|
      |$.data|[]|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.outlets.1|DB:skunits:name: id=1|
      |$.outlets.3|DB:skunits:name: id=3|
      |$.outlets.4|DB:skunits:name: id=4|
      |$.outlets.5|DB:skunits:name: id=5 |
      |$.outlets.6|DB:skunits:name: id=6|

  @Positive @DataIntegrity
  Scenario: Validate SK units for warehouse data integrity
    And I send the GET request to "warehouse_skunits_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data fetched successfully.|
      |$.data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
      |$.outlets|object|

  @Positive @Regression
  Scenario: Regression test for SK units for warehouse endpoint
    And I send the GET request to "warehouse_skunits_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data fetched successfully.|
      |$.data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
      |$.outlets|object|
