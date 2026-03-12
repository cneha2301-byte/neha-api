@BizomWebAPI @PI @SchemesManagement @GetSchemesForWarehouses @PaymentProcessing
Feature: GetSchemesForWarehouses API Testing
  As a system user
  I want to test the getschemesforwarehouses endpoint
  So that I can ensure proper functionality and data retrieval for schemes for warehouses

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get schemes for warehouses without access token
    When I send the GET request to "get_schemes_for_warehouses" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get schemes for warehouses with invalid access token
    And I send the GET request to "get_schemes_for_warehouses" endpoint with dynamic access token and query parameters
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
  Scenario: Get schemes for warehouses with expired access token
    And I send the GET request to "get_schemes_for_warehouses" endpoint with dynamic access token and query parameters
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
  Scenario: Get schemes for warehouses with malformed access token
    And I send the GET request to "get_schemes_for_warehouses" endpoint with dynamic access token and query parameters
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
  Scenario: Get schemes for warehouses with valid access token
    And I send the GET request to "get_schemes_for_warehouses" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|
    And I store the response as "schemes_for_warehouses_response" name using full path

  @Positive @DataValidation
  Scenario: Validate schemes for warehouses response structure
    And I send the GET request to "get_schemes_for_warehouses" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|array|

  @Positive @DataValidation
  Scenario: Validate schemes for warehouses specific data values
    And I send the GET request to "get_schemes_for_warehouses" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|

  @Positive @DataValidation
  Scenario: Validate schemes for warehouses with static values
    And I send the GET request to "get_schemes_for_warehouses" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|

  @Positive @Performance
  Scenario: Performance test for schemes for warehouses endpoint
    And I send the GET request to "get_schemes_for_warehouses" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|

  @Positive @Concurrency
  Scenario: Concurrent access test for schemes for warehouses endpoint
    And I send the GET request to "get_schemes_for_warehouses" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|

  @Negative @Validation
  Scenario: Get schemes for warehouses with invalid query parameters
    And I send the GET request to "get_schemes_for_warehouses" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|

  @Negative @Validation
  Scenario: Get schemes for warehouses with special characters in query parameters
    And I send the GET request to "get_schemes_for_warehouses" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|

  @Negative @Security
  Scenario: Get schemes for warehouses with SQL injection attempt
    And I send the GET request to "get_schemes_for_warehouses" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE schemes; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|

  @Negative @Boundary
  Scenario: Get schemes for warehouses with maximum query parameters
    And I send the GET request to "get_schemes_for_warehouses" endpoint with dynamic access token and query parameters
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
      |$.error|[]|

  # @Negative @ErrorHandling
  # Scenario: Get schemes for warehouses with invalid endpoint
    # And I send the GET request to "get_schemes_for_warehouses_invalid" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|ACCESS_TOKEN|
    # Then I should see the response code as "404"
    # And verify response time is less than "2500" milliseconds
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.error|not_found|
      # |$.message|Endpoint not found|

  @Positive @BusinessLogic
  Scenario: Validate schemes for warehouses business logic
    And I send the GET request to "get_schemes_for_warehouses" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|

  @Positive @DataIntegrity
  Scenario: Validate schemes for warehouses data integrity
    And I send the GET request to "get_schemes_for_warehouses" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|array|

  @Positive @Regression
  Scenario: Regression test for schemes for warehouses endpoint
    And I send the GET request to "get_schemes_for_warehouses" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|array|

  @Positive @Functional
  Scenario: Validate schemes for warehouses response completeness
    And I send the GET request to "get_schemes_for_warehouses" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|

  @Positive @ArrayValidation
  Scenario: Validate schemes for warehouses array structure and content
    And I send the GET request to "get_schemes_for_warehouses" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|

  @Positive @ContentValidation
  Scenario: Validate schemes for warehouses content structure
    And I send the GET request to "get_schemes_for_warehouses" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|
    And validating the response contains the following values
      |Value|
      |result|
      |error|

  @Positive @LoadTesting
  Scenario: Load testing for schemes for warehouses endpoint
    And I send the GET request to "get_schemes_for_warehouses" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|

  @Negative @Timeout
  Scenario: Test schemes for warehouses endpoint timeout handling
    And I send the GET request to "get_schemes_for_warehouses" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|

  @Positive @EndToEnd
  Scenario: End-to-end schemes for warehouses data retrieval workflow
    And I send the GET request to "get_schemes_for_warehouses" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|
    And I store the response as "schemes_for_warehouses_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|

  @Positive @WarehouseValidation
  Scenario: Validate warehouse schemes data structure
    And I send the GET request to "get_schemes_for_warehouses" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|

  @Positive @SchemeValidation
  Scenario: Validate scheme availability for warehouses
    And I send the GET request to "get_schemes_for_warehouses" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|

  @Positive @SuccessValidation
  Scenario: Validate successful response structure
    And I send the GET request to "get_schemes_for_warehouses" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|

  @Positive @CompleteValidation
  Scenario: Validate complete schemes for warehouses data structure
    And I send the GET request to "get_schemes_for_warehouses" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|

