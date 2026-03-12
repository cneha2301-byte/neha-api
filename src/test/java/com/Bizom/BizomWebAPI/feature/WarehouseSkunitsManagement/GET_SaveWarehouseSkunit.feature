@BizomWebAPI @WarehouseSkunitsManagement @SaveWarehouseSkunit @InventoryOperations
Feature: Save Warehouse SKUnit API Testing
  As a system user
  I want to test the save warehouse SKUnit endpoint
  So that I can ensure proper functionality for saving warehouse SKUnit data

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Save warehouse SKUnit without access token
    When I send the GET request to "GET_SaveWarehouseSkunit" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |skunit_id|DB:skunits:id: id=1 LIMIT 1|
      |warehouse_id|DB:warehouses:id: id=1 LIMIT 1|
      |mrp|200.00000|
      |price|25.00000|
      |focussku|0|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Save warehouse SKUnit with invalid access token
#    And I send the GET request to "GET_SaveWarehouseSkunit" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|invalid_token_12345|
#      |skunit_id|DB:skunits:id: id=1 LIMIT 1|
#      |warehouse_id|DB:warehouses:id: id=1 LIMIT 1|
#      |mrp|200.00000|
#      |price|25.00000|
#      |focussku|0|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Save warehouse SKUnit with expired access token
#    And I send the GET request to "GET_SaveWarehouseSkunit" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|expired_token_12345|
#      |skunit_id|DB:skunits:id: id=1 LIMIT 1|
#      |warehouse_id|DB:warehouses:id: id=1 LIMIT 1|
#      |mrp|200.00000|
#      |price|25.00000|
#      |focussku|0|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Save warehouse SKUnit with malformed access token
#    And I send the GET request to "GET_SaveWarehouseSkunit" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|malformed.token.here|
#      |skunit_id|DB:skunits:id: id=1 LIMIT 1|
#      |warehouse_id|DB:warehouses:id: id=1 LIMIT 1|
#      |mrp|200.00000|
#      |price|25.00000|
#      |focussku|0|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

#  @Positive @Smoke
#  Scenario: Save warehouse SKUnit with valid access token
#    And I send the GET request to "GET_SaveWarehouseSkunit" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |skunit_id|DB:skunits:id: id=1 LIMIT 1|
#      |warehouse_id|DB:warehouses:id: id=1 LIMIT 1|
#      |mrp|200.00000|
#      |price|25.00000|
#      |focussku|0|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|"Data updated successfully."|
#    And I store the response as "savewarehouseskunit_response" name using full path

#  @Positive @DataValidation
#  Scenario: Validate save warehouse SKUnit response structure
#    And I send the GET request to "GET_SaveWarehouseSkunit" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |skunit_id|DB:skunits:id: id=1 LIMIT 1|
#      |warehouse_id|DB:warehouses:id: id=1 LIMIT 1|
#      |mrp|200.00000|
#      |price|25.00000|
#      |focussku|0|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|"Data updated successfully."|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|

#  @Positive @DataValidation
#  Scenario: Validate save warehouse SKUnit with different values
#    And I send the GET request to "GET_SaveWarehouseSkunit" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |skunit_id|DB:skunits:id: id=2 LIMIT 1|
#      |warehouse_id|DB:warehouses:id: id=2 LIMIT 1|
#      |mrp|300.00000|
#      |price|50.00000|
#      |focussku|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|"Data updated successfully."|

  @Positive @DataValidation
  Scenario: Validate save warehouse SKUnit with static values
    And I send the GET request to "GET_SaveWarehouseSkunit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |skunit_id|1|
      |warehouse_id|1|
      |mrp|200.00000|
      |price|25.00000|
      |focussku|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data updated successfully."|

#  @Positive @Performance
#  Scenario: Performance test for save warehouse SKUnit endpoint
#    And I send the GET request to "GET_SaveWarehouseSkunit" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |skunit_id|DB:skunits:id: id=1 LIMIT 1|
#      |warehouse_id|DB:warehouses:id: id=1 LIMIT 1|
#      |mrp|200.00000|
#      |price|25.00000|
#      |focussku|0|
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|"Data updated successfully."|

#  @Positive @Concurrency
#  Scenario: Concurrent access test for save warehouse SKUnit endpoint
#    And I send the GET request to "GET_SaveWarehouseSkunit" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |skunit_id|DB:skunits:id: id=1 LIMIT 1|
#      |warehouse_id|DB:warehouses:id: id=1 LIMIT 1|
#      |mrp|200.00000|
#      |price|25.00000|
#      |focussku|0|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|"Data updated successfully."|

  @Negative @Validation
  Scenario: Save warehouse SKUnit with invalid skunit_id
    And I send the GET request to "GET_SaveWarehouseSkunit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |skunit_id|999999|
      |warehouse_id|DB:warehouses:id: id=1 LIMIT 1|
      |mrp|200.00000|
      |price|25.00000|
      |focussku|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Save warehouse SKUnit with invalid warehouse_id
    And I send the GET request to "GET_SaveWarehouseSkunit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |skunit_id|DB:skunits:id: id=1 LIMIT 1|
      |warehouse_id|999999|
      |mrp|200.00000|
      |price|25.00000|
      |focussku|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Save warehouse SKUnit with missing mrp parameter
    And I send the GET request to "GET_SaveWarehouseSkunit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |skunit_id|DB:skunits:id: id=1 LIMIT 1|
      |warehouse_id|DB:warehouses:id: id=1 LIMIT 1|
      |price|25.00000|
      |focussku|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Save warehouse SKUnit with missing price parameter
    And I send the GET request to "GET_SaveWarehouseSkunit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |skunit_id|DB:skunits:id: id=1 LIMIT 1|
      |warehouse_id|DB:warehouses:id: id=1 LIMIT 1|
      |mrp|200.00000|
      |focussku|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Save warehouse SKUnit with negative mrp value
    And I send the GET request to "GET_SaveWarehouseSkunit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |skunit_id|DB:skunits:id: id=1 LIMIT 1|
      |warehouse_id|DB:warehouses:id: id=1 LIMIT 1|
      |mrp|-100.00000|
      |price|25.00000|
      |focussku|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Save warehouse SKUnit with negative price value
    And I send the GET request to "GET_SaveWarehouseSkunit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |skunit_id|DB:skunits:id: id=1 LIMIT 1|
      |warehouse_id|DB:warehouses:id: id=1 LIMIT 1|
      |mrp|200.00000|
      |price|-50.00000|
      |focussku|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Save warehouse SKUnit with invalid focussku value
    And I send the GET request to "GET_SaveWarehouseSkunit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |skunit_id|DB:skunits:id: id=1 LIMIT 1|
      |warehouse_id|DB:warehouses:id: id=1 LIMIT 1|
      |mrp|200.00000|
      |price|25.00000|
      |focussku|999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Save warehouse SKUnit with special characters in parameters
    And I send the GET request to "GET_SaveWarehouseSkunit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |skunit_id|<script>alert('XSS')</script>|
      |warehouse_id|DB:warehouses:id: id=1 LIMIT 1|
      |mrp|200.00000|
      |price|25.00000|
      |focussku|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Save warehouse SKUnit with SQL injection attempt
    And I send the GET request to "GET_SaveWarehouseSkunit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |skunit_id|'; DROP TABLE warehouseskunits; --|
      |warehouse_id|DB:warehouses:id: id=1 LIMIT 1|
      |mrp|200.00000|
      |price|25.00000|
      |focussku|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Negative @Boundary
#  Scenario: Save warehouse SKUnit with maximum query parameters
#    And I send the GET request to "GET_SaveWarehouseSkunit" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |skunit_id|DB:skunits:id: id=1 LIMIT 1|
#      |warehouse_id|DB:warehouses:id: id=1 LIMIT 1|
#      |mrp|200.00000|
#      |price|25.00000|
#      |focussku|0|
#      |_|1764793879444|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|"Data updated successfully."|

#  @Negative @ErrorHandling
#  Scenario: Save warehouse SKUnit with invalid endpoint
#    And I send the GET request to "GET_SaveWarehouseSkunit_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |skunit_id|DB:skunits:id: id=1 LIMIT 1|
#      |warehouse_id|DB:warehouses:id: id=1 LIMIT 1|
#      |mrp|200.00000|
#      |price|25.00000|
#      |focussku|0|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds

#  @Positive @BusinessLogic
#  Scenario: Validate save warehouse SKUnit business logic
#    And I send the GET request to "GET_SaveWarehouseSkunit" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |skunit_id|DB:skunits:id: id=1 LIMIT 1|
#      |warehouse_id|DB:warehouses:id: id=1 LIMIT 1|
#      |mrp|200.00000|
#      |price|25.00000|
#      |focussku|0|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|"Data updated successfully."|

#  @Positive @DataIntegrity
#  Scenario: Validate save warehouse SKUnit data integrity
#    And I send the GET request to "GET_SaveWarehouseSkunit" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |skunit_id|DB:skunits:id: id=1 LIMIT 1|
#      |warehouse_id|DB:warehouses:id: id=1 LIMIT 1|
#      |mrp|200.00000|
#      |price|25.00000|
#      |focussku|0|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|"Data updated successfully."|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|

#  @Positive @Regression
#  Scenario: Regression test for save warehouse SKUnit endpoint
#    And I send the GET request to "GET_SaveWarehouseSkunit" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |skunit_id|DB:skunits:id: id=1 LIMIT 1|
#      |warehouse_id|DB:warehouses:id: id=1 LIMIT 1|
#      |mrp|200.00000|
#      |price|25.00000|
#      |focussku|0|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|"Data updated successfully."|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|

#  @Positive @Functional
#  Scenario: Validate save warehouse SKUnit response completeness
#    And I send the GET request to "GET_SaveWarehouseSkunit" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |skunit_id|DB:skunits:id: id=1 LIMIT 1|
#      |warehouse_id|DB:warehouses:id: id=1 LIMIT 1|
#      |mrp|200.00000|
#      |price|25.00000|
#      |focussku|0|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|"Data updated successfully."|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|

#  @Positive @ContentValidation
#  Scenario: Validate save warehouse SKUnit content structure
#    And I send the GET request to "GET_SaveWarehouseSkunit" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |skunit_id|DB:skunits:id: id=1 LIMIT 1|
#      |warehouse_id|DB:warehouses:id: id=1 LIMIT 1|
#      |mrp|200.00000|
#      |price|25.00000|
#      |focussku|0|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|"Data updated successfully."|
#    And validating the response contains the following values
#      |Value|
#      |Result|
#      |Reason|
#      |Data updated successfully|

#  @Positive @LoadTesting
#  Scenario: Load testing for save warehouse SKUnit endpoint
#    And I send the GET request to "GET_SaveWarehouseSkunit" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |skunit_id|DB:skunits:id: id=1 LIMIT 1|
#      |warehouse_id|DB:warehouses:id: id=1 LIMIT 1|
#      |mrp|200.00000|
#      |price|25.00000|
#      |focussku|0|
#    Then I should see the response code as "200"
#    And verify response time is less than "3000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|"Data updated successfully."|

#  @Negative @Timeout
#  Scenario: Test save warehouse SKUnit endpoint timeout handling
#    And I send the GET request to "GET_SaveWarehouseSkunit" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |skunit_id|DB:skunits:id: id=1 LIMIT 1|
#      |warehouse_id|DB:warehouses:id: id=1 LIMIT 1|
#      |mrp|200.00000|
#      |price|25.00000|
#      |focussku|0|
#    Then I should see the response code as "200"
#    And verify response time is less than "5000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|"Data updated successfully."|

#  @Positive @EndToEnd
#  Scenario: End-to-end save warehouse SKUnit data update workflow
#    And I send the GET request to "GET_SaveWarehouseSkunit" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |skunit_id|DB:skunits:id: id=1 LIMIT 1|
#      |warehouse_id|DB:warehouses:id: id=1 LIMIT 1|
#      |mrp|200.00000|
#      |price|25.00000|
#      |focussku|0|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|"Data updated successfully."|
#    And I store the response as "savewarehouseskunit_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|

