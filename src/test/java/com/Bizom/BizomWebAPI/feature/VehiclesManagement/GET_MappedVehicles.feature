@BizomWebAPI @VehiclesManagement @MappedVehicles @SystemIntegration
Feature: Mapped Vehicles API Testing
  As a system user
  I want to test the mapped vehicles endpoint
  So that I can ensure proper functionality and data retrieval for mapped vehicles management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get mapped vehicles without access token
    When I send the GET request to "mapped_vehicles" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get mapped vehicles with invalid access token
    And I send the GET request to "mapped_vehicles" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get mapped vehicles with expired access token
    And I send the GET request to "mapped_vehicles" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get mapped vehicles with malformed access token
    And I send the GET request to "mapped_vehicles" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get mapped vehicles with valid access token
    And I send the GET request to "mapped_vehicles" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Vehicles data found in the system.|
    And I store the response as "mapped_vehicles_response" name using full path

  @Positive @DataValidation
  Scenario: Validate mapped vehicles response structure
    And I send the GET request to "mapped_vehicles" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Vehicles data found in the system.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|

  @Positive @DataValidation
  Scenario: Validate mapped vehicles specific data values
    And I send the GET request to "mapped_vehicles" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Vehicles data found in the system.|
    And I verify API response at path with DB and static values
      |JPath|Value|
     
      |$.data[0].brand|DB:vehicles:brand: id=1|
      |$.data[0].model|DB:vehicles:model: id=1|
      |$.data[0].vehicleno|DB:vehicles:vehicleno: id=1|
      |$.data[0].color|DB:vehicles:color: id=1|

  @Positive @DataValidation
  Scenario: Validate mapped vehicles with static values
    And I send the GET request to "mapped_vehicles" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Vehicles data found in the system.|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data[0].id|"1"|
      |$.data[0].warehouse_id|"1"|
      |$.data[0].brand|tata|
      |$.data[0].model|t|
      |$.data[0].vehicleno|t|
      |$.data[0].color|t|
      |$.data[0].vehicle_capacity|"12.00000"|
      |$.data[0].capacity_weight|"0.00"|
      |$.data[0].volumetype_id|"0"|
      |$.data[0].is_active|"1"|
     |$.data[1].id|"2"|
      |$.data[1].warehouse_id|"5"|
      |$.data[1].brand|ag|
      |$.data[1].model|g|
      |$.data[1].vehicleno|g|
      |$.data[1].color|g|
      |$.data[1].vehicle_capacity|"6.00000"|
      |$.data[1].capacity_weight|"0.00"|
      |$.data[1].volumetype_id|"0"|
      |$.data[1].is_active|"1"|

  @Positive @Performance
  Scenario: Performance test for mapped vehicles endpoint
    And I send the GET request to "mapped_vehicles" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Vehicles data found in the system.|

  @Positive @Concurrency
  Scenario: Concurrent access test for mapped vehicles endpoint
    And I send the GET request to "mapped_vehicles" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Vehicles data found in the system.|

  @Negative @Validation
  Scenario: Get mapped vehicles with invalid query parameters
    And I send the GET request to "mapped_vehicles" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Vehicles data found in the system.|

  @Negative @Validation
  Scenario: Get mapped vehicles with special characters in query parameters
    And I send the GET request to "mapped_vehicles" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Vehicles data found in the system.|

  @Negative @Security
  Scenario: Get mapped vehicles with SQL injection attempt
    And I send the GET request to "mapped_vehicles" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE vehicles; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Vehicles data found in the system.|

  @Negative @Boundary
  Scenario: Get mapped vehicles with maximum query parameters
    And I send the GET request to "mapped_vehicles" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Vehicles data found in the system.|

#  @Negative @ErrorHandling
#  Scenario: Get mapped vehicles with invalid endpoint
#    And I send the GET request to "mapped_vehicles_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

  @Positive @BusinessLogic
  Scenario: Validate mapped vehicles business logic
    And I send the GET request to "mapped_vehicles" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Vehicles data found in the system.|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.data[0].brand|DB:vehicles:brand: id=1|
      |$.data[0].model|DB:vehicles:model: id=1|
      |$.data[0].vehicleno|DB:vehicles:vehicleno: id=1|
      |$.data[0].color|DB:vehicles:color: id=1|


  @Positive @DataIntegrity
  Scenario: Validate mapped vehicles data integrity
    And I send the GET request to "mapped_vehicles" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Vehicles data found in the system.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
      |$.data[0].id|string|
      |$.data[0].warehouse_id|string|
      |$.data[0].brand|string|
      |$.data[0].model|string|
      |$.data[0].vehicleno|string|
      |$.data[0].color|string|
      |$.data[0].vehicle_capacity|string|
      |$.data[0].capacity_weight|string|
      |$.data[0].volumetype_id|string|
      |$.data[0].is_active|string|
      |$.data[0].modified|string|
      |$.data[0].created|string|

  @Positive @Regression
  Scenario: Regression test for mapped vehicles endpoint
    And I send the GET request to "mapped_vehicles" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Vehicles data found in the system.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|

  @Positive @Functional
  Scenario: Validate mapped vehicles response completeness
    And I send the GET request to "mapped_vehicles" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Vehicles data found in the system.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data[0].id|"1"|
      |$.data[0].warehouse_id|"1"|
      |$.data[0].brand|tata|
      |$.data[0].model|t|
      |$.data[0].vehicleno|t|
      |$.data[0].color|t|
      |$.data[0].vehicle_capacity|"12.00000"|
      |$.data[0].capacity_weight|"0.00"|
      |$.data[0].volumetype_id|"0"|
      |$.data[0].is_active|"1"|
     |$.data[1].id|"2"|
      |$.data[1].warehouse_id|"5"|
      |$.data[1].brand|ag|
      |$.data[1].model|g|
      |$.data[1].vehicleno|g|
      |$.data[1].color|g|
      |$.data[1].vehicle_capacity|"6.00000"|
      |$.data[1].capacity_weight|"0.00"|
      |$.data[1].volumetype_id|"0"|
      |$.data[1].is_active|"1"|

  @Positive @ArrayValidation
  Scenario: Validate mapped vehicles array structure and content
    And I send the GET request to "mapped_vehicles" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Vehicles data found in the system.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
      |$.data[0]|object|
      |$.data[1]|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data[0].id|"1"|
      |$.data[0].warehouse_id|"1"|
      |$.data[0].brand|tata|
      |$.data[0].model|t|
      |$.data[0].vehicleno|t|
      |$.data[0].color|t|
      |$.data[0].vehicle_capacity|"12.00000"|
      |$.data[0].capacity_weight|"0.00"|
      |$.data[0].volumetype_id|"0"|
      |$.data[0].is_active|"1"|
     |$.data[1].id|"2"|
      |$.data[1].warehouse_id|"5"|
      |$.data[1].brand|ag|
      |$.data[1].model|g|
      |$.data[1].vehicleno|g|
      |$.data[1].color|g|
      |$.data[1].vehicle_capacity|"6.00000"|
      |$.data[1].capacity_weight|"0.00"|
      |$.data[1].volumetype_id|"0"|
      |$.data[1].is_active|"1"|

  @Positive @ContentValidation
  Scenario: Validate mapped vehicles content structure
    And I send the GET request to "mapped_vehicles" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Vehicles data found in the system.|
    And validating the response contains the following values
      |Value|
      |data|
      |id|
      |warehouse_id|
      |brand|
      |model|
      |vehicleno|
      |color|
      |vehicle_capacity|
      |capacity_weight|
      |volumetype_id|
      |is_active|
      |modified|
      |created|

  @Positive @LoadTesting
  Scenario: Load testing for mapped vehicles endpoint
    And I send the GET request to "mapped_vehicles" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Vehicles data found in the system.|

  @Negative @Timeout
  Scenario: Test mapped vehicles endpoint timeout handling
    And I send the GET request to "mapped_vehicles" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Vehicles data found in the system.|

  @Positive @EndToEnd
  Scenario: End-to-end mapped vehicles data retrieval workflow
    And I send the GET request to "mapped_vehicles" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Vehicles data found in the system.|
    And I store the response as "mapped_vehicles_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data[0].id|"1"|
      |$.data[0].warehouse_id|"1"|
      |$.data[0].brand|tata|
      |$.data[0].model|t|
      |$.data[0].vehicleno|t|
      |$.data[0].color|t|
      |$.data[0].vehicle_capacity|"12.00000"|
      |$.data[0].capacity_weight|"0.00"|
      |$.data[0].volumetype_id|"0"|
      |$.data[0].is_active|"1"|
     |$.data[1].id|"2"|
      |$.data[1].warehouse_id|"5"|
      |$.data[1].brand|ag|
      |$.data[1].model|g|
      |$.data[1].vehicleno|g|
      |$.data[1].color|g|
      |$.data[1].vehicle_capacity|"6.00000"|
      |$.data[1].capacity_weight|"0.00"|
      |$.data[1].volumetype_id|"0"|
      |$.data[1].is_active|"1"|

  @Positive @VehicleDataValidation
  Scenario: Validate vehicle data completeness and accuracy
    And I send the GET request to "mapped_vehicles" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Vehicles data found in the system.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data[0].id|string|
      |$.data[0].warehouse_id|string|
      |$.data[0].brand|string|
      |$.data[0].model|string|
      |$.data[0].vehicleno|string|
      |$.data[0].color|string|
      |$.data[0].vehicle_capacity|string|
      |$.data[0].capacity_weight|string|
      |$.data[0].volumetype_id|string|
      |$.data[0].is_active|string|
      |$.data[0].modified|string|
      |$.data[0].created|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data[0].id|"1"|
      |$.data[0].warehouse_id|"1"|
      |$.data[0].brand|tata|
      |$.data[0].model|t|
      |$.data[0].vehicleno|t|
      |$.data[0].color|t|
      |$.data[0].vehicle_capacity|"12.00000"|
      |$.data[0].capacity_weight|"0.00"|
      |$.data[0].volumetype_id|"0"|
      |$.data[0].is_active|"1"|

  @Positive @WarehouseMapping
  Scenario: Validate warehouse mapping for vehicles
    And I send the GET request to "mapped_vehicles" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Vehicles data found in the system.|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data[0].warehouse_id|"1"|
      |$.data[1].warehouse_id|"5"|

  @Positive @VehicleCapacityValidation
  Scenario: Validate vehicle capacity data accuracy
    And I send the GET request to "mapped_vehicles" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Vehicles data found in the system.|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data[0].vehicle_capacity|"12.00000"|
      |$.data[0].capacity_weight|"0.00"|
      |$.data[1].vehicle_capacity|"6.00000"|
      |$.data[1].capacity_weight|"0.00"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data[0].vehicle_capacity|string|
      |$.data[0].capacity_weight|string|
      |$.data[1].vehicle_capacity|string|
      |$.data[1].capacity_weight|string|

  @Positive @VehicleStatusValidation
  Scenario: Validate vehicle status and timestamps
    And I send the GET request to "mapped_vehicles" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Vehicles data found in the system.|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data[0].is_active|"1"|
      |$.data[1].is_active|"1"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data[0].is_active|string|
      |$.data[0].modified|string|
      |$.data[0].created|string|
      |$.data[1].is_active|string|
      |$.data[1].modified|string|
      |$.data[1].created|string|

