@BizomWebAPI @VehiclesManagement @VehicleManagement @VehicleCapacity @SystemIntegration
Feature: Vehicle Capacity API Testing
  As a system user
  I want to test the vehicle capacity endpoint
  So that I can ensure proper functionality and data retrieval for vehicle capacities

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get vehicle capacity without access token
    When I send the GET request to "vehicle_capacity" endpoint with path parameters
      |Path|Value|
      |vehicleId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get vehicle capacity with invalid access token
    And I send the GET request to "vehicle_capacity" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|vehicleId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get vehicle capacity with expired access token
    And I send the GET request to "vehicle_capacity" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|vehicleId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get vehicle capacity with malformed access token
    And I send the GET request to "vehicle_capacity" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|vehicleId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

#  @Positive @Smoke
#  Scenario: Get vehicle capacity for vehicle ID 1 with valid access token
#    And I send the GET request to "vehicle_capacity" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|vehicleId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data.vehiclecapacity|12.00000|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.data|object|
#      |$.data.vehiclecapacity|string|

#  @Positive @Functional
#  Scenario: Get vehicle capacity for vehicle ID 2 with valid access token
#    And I send the GET request to "vehicle_capacity" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|vehicleId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data.vehiclecapacity|6.00000|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.data|object|
#      |$.data.vehiclecapacity|string|

  @Negative @Validation
  Scenario: Get vehicle capacity with invalid vehicle ID
    And I send the GET request to "vehicle_capacity" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|vehicleId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Invalid vehicleId|

  @Negative @Validation
  Scenario: Get vehicle capacity with non-existent vehicle ID
    And I send the GET request to "vehicle_capacity" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|vehicleId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Invalid vehicleId|

#  @Negative @ErrorHandling
#  Scenario: Get vehicle capacity with invalid endpoint
#    And I send the GET request to "vehicle_capacity_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|vehicleId|1|
#    Then I should see the response code as "404"
#    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance test for vehicle capacity endpoint
    And I send the GET request to "vehicle_capacity" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|vehicleId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Regression
  Scenario: Regression test for vehicle capacity endpoint
    And I send the GET request to "vehicle_capacity" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|vehicleId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

#  @Positive @Smoke
#  Scenario: Get vehicle capacity for vehicle ID 1 with valid access token
#    And I send the GET request to "vehicle_capacity" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|vehicleId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data.vehiclecapacity|DB:vehicles:vehicle_capacity: id=1|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.data|object|
#      |$.data.vehiclecapacity|string|

#  @Positive @Functional
#  Scenario: Get vehicle capacity for vehicle ID 2 with valid access token
#    And I send the GET request to "vehicle_capacity" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|vehicleId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data.vehiclecapacity|DB:vehicles:vehicle_capacity: id=2|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.data|object|
#      |$.data.vehiclecapacity|string|

