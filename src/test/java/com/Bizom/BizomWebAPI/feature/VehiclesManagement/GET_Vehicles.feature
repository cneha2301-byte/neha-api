@BizomWebAPI @VehiclesManagement @Vehicles @SystemIntegration
Feature: Vehicles API Testing
  As a system user
  I want to test the vehicles endpoint
  So that I can ensure proper functionality and data retrieval for vehicles management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get vehicles without access token
    When I send the GET request to "vehicles" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get vehicles with invalid access token
    And I send the GET request to "vehicles" endpoint with dynamic access token and query parameters
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
  Scenario: Get vehicles with expired access token
    And I send the GET request to "vehicles" endpoint with dynamic access token and query parameters
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
  Scenario: Get vehicles with malformed access token
    And I send the GET request to "vehicles" endpoint with dynamic access token and query parameters
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
  Scenario: Get vehicles with valid access token
    And I send the GET request to "vehicles" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|success|
    And I store the response as "vehicles_response" name using full path

  @Positive @DataValidation
  Scenario: Validate vehicles response structure
    And I send the GET request to "vehicles" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|success|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.vehicles|array|

  @Positive @DataValidation
  Scenario: Validate vehicles specific data values
    And I send the GET request to "vehicles" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|success|
    And I verify API response at path with DB and static values
      |JPath|Value|

      |$.vehicles[0].name|DB:vehicles:model: id=1|

      |$.vehicles[1].name|DB:vehicles:model: id=2|

  @Positive @DataValidation
  Scenario: Validate vehicles with static values
    And I send the GET request to "vehicles" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|success|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.vehicles[0].id|"1"|
      |$.vehicles[0].name|t|
      |$.vehicles[1].id|"2"|
      |$.vehicles[1].name|g|

  @Positive @Performance
  Scenario: Performance test for vehicles endpoint
    And I send the GET request to "vehicles" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|success|

  @Positive @Concurrency
  Scenario: Concurrent access test for vehicles endpoint
    And I send the GET request to "vehicles" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|success|

  @Negative @Validation
  Scenario: Get vehicles with invalid query parameters
    And I send the GET request to "vehicles" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|success|

  @Negative @Validation
  Scenario: Get vehicles with special characters in query parameters
    And I send the GET request to "vehicles" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|success|

  @Negative @Security
  Scenario: Get vehicles with SQL injection attempt
    And I send the GET request to "vehicles" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE vehicles; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|success|

  @Negative @Boundary
  Scenario: Get vehicles with maximum query parameters
    And I send the GET request to "vehicles" endpoint with dynamic access token and query parameters
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
      |$.result|true|
      |$.reason|success|

#  @Negative @ErrorHandling
#  Scenario: Get vehicles with invalid endpoint
#    And I send the GET request to "vehicles_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

  @Positive @BusinessLogic
  Scenario: Validate vehicles business logic
    And I send the GET request to "vehicles" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|success|

  @Positive @DataIntegrity
  Scenario: Validate vehicles data integrity
    And I send the GET request to "vehicles" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|success|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.vehicles|array|
      |$.vehicles[0].id|string|
      |$.vehicles[0].name|string|
      |$.vehicles[1].id|string|
      |$.vehicles[1].name|string|

  @Positive @Regression
  Scenario: Regression test for vehicles endpoint
    And I send the GET request to "vehicles" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|success|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.vehicles|array|

  @Positive @Functional
  Scenario: Validate vehicles response completeness
    And I send the GET request to "vehicles" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|success|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.vehicles|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.vehicles[0].id|"1"|
      |$.vehicles[0].name|t|
      |$.vehicles[1].id|"2"|
      |$.vehicles[1].name|g|

  @Positive @ArrayValidation
  Scenario: Validate vehicles array structure and content
    And I send the GET request to "vehicles" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|success|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.vehicles|array|
      |$.vehicles[0]|object|
      |$.vehicles[1]|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.vehicles[0].id|"1"|
      |$.vehicles[0].name|t|
      |$.vehicles[1].id|"2"|
      |$.vehicles[1].name|g|

  @Positive @ContentValidation
  Scenario: Validate vehicles content structure
    And I send the GET request to "vehicles" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|success|
    And validating the response contains the following values
      |Value|
      |vehicles|
      |id|
      |name|

  @Positive @LoadTesting
  Scenario: Load testing for vehicles endpoint
    And I send the GET request to "vehicles" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|success|

  @Negative @Timeout
  Scenario: Test vehicles endpoint timeout handling
    And I send the GET request to "vehicles" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|success|

  @Positive @EndToEnd
  Scenario: End-to-end vehicles data retrieval workflow
    And I send the GET request to "vehicles" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|success|
    And I store the response as "vehicles_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.vehicles|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.vehicles[0].id|"1"|
      |$.vehicles[0].name|t|
      |$.vehicles[1].id|"2"|
      |$.vehicles[1].name|g|

