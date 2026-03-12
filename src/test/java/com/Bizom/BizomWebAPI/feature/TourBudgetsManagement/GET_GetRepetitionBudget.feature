@BizomWebAPI @TourBudgetsManagement @RepetitionBudget @OutletManagement @innovation
Feature: Get Repetition Budget API Testing
  As a system user
  I want to test the get repetition budget endpoint
  So that I can ensure proper functionality and data retrieval for tour budgets management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get repetition budget without access token
    When I send the GET request to "tourbudgets_get_repetition_budget" endpoint with path parameters
      |Path|Value|
      |warehouseId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get repetition budget with invalid access token
    And I send the GET request to "tourbudgets_get_repetition_budget" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|warehouseId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get repetition budget with expired access token
    And I send the GET request to "tourbudgets_get_repetition_budget" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|warehouseId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get repetition budget with malformed access token
    And I send the GET request to "tourbudgets_get_repetition_budget" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|warehouseId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get repetition budget with warehouse ID 1
    And I send the GET request to "tourbudgets_get_repetition_budget" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No repetion found"|
    And I store the response as "repetition_budget_response" name using full path

  @Positive @Smoke
  Scenario: Get repetition budget with warehouse ID 2
    And I send the GET request to "tourbudgets_get_repetition_budget" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No repetion found"|
    And I store the response as "repetition_budget_response" name using full path

  @Positive @DataValidation
  Scenario: Validate repetition budget response structure
    And I send the GET request to "tourbudgets_get_repetition_budget" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No repetion found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.repetitionBudget|array|

  @Positive @DataValidation
  Scenario: Validate repetition budget array structure
    And I send the GET request to "tourbudgets_get_repetition_budget" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No repetion found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.repetitionBudget|array|

  @Positive @DataValidation
  Scenario: Validate repetition budget with static values
    And I send the GET request to "tourbudgets_get_repetition_budget" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No repetion found"|
      |$.repetitionBudget|[]|

  @Negative @Validation
  Scenario: Get repetition budget with invalid warehouse ID
    And I send the GET request to "tourbudgets_get_repetition_budget" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No repetion found"|
      |$.repetitionBudget|[]|

  @Negative @Validation
  Scenario: Get repetition budget with non-numeric warehouse ID
    And I send the GET request to "tourbudgets_get_repetition_budget" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get repetition budget with negative warehouse ID
    And I send the GET request to "tourbudgets_get_repetition_budget" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get repetition budget with zero warehouse ID
    And I send the GET request to "tourbudgets_get_repetition_budget" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No repetion found"|
      |$.repetitionBudget|[]|

#  @Negative @ErrorHandling
#  Scenario: Get repetition budget with invalid endpoint
#    And I send the GET request to "tourbudgets_get_repetition_budget_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: Performance test for repetition budget endpoint
    And I send the GET request to "tourbudgets_get_repetition_budget" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: Concurrent access test for repetition budget endpoint
    And I send the GET request to "tourbudgets_get_repetition_budget" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No repetion found"|

  @Positive @BusinessLogic
  Scenario: Validate repetition budget business logic
    And I send the GET request to "tourbudgets_get_repetition_budget" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No repetion found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.repetitionBudget|array|

  @Positive @DataIntegrity
  Scenario: Validate repetition budget data integrity
    And I send the GET request to "tourbudgets_get_repetition_budget" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No repetion found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.repetitionBudget|array|

  @Positive @Regression
  Scenario: Regression test for repetition budget endpoint
    And I send the GET request to "tourbudgets_get_repetition_budget" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No repetion found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.repetitionBudget|array|

  @Positive @Functional
  Scenario: Validate repetition budget response completeness
    And I send the GET request to "tourbudgets_get_repetition_budget" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No repetion found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.repetitionBudget|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.repetitionBudget|[]|

  @Positive @ArrayValidation
  Scenario: Validate repetition budget array structure and content
    And I send the GET request to "tourbudgets_get_repetition_budget" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No repetion found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.repetitionBudget|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.repetitionBudget|[]|

  @Positive @ContentValidation
  Scenario: Validate repetition budget content structure
    And I send the GET request to "tourbudgets_get_repetition_budget" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No repetion found"|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |repetitionBudget|
      |No repetion found|

  @Positive @LoadTesting
  Scenario: Load testing for repetition budget endpoint
    And I send the GET request to "tourbudgets_get_repetition_budget" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No repetion found"|

  @Negative @Timeout
  Scenario: Test repetition budget endpoint timeout handling
    And I send the GET request to "tourbudgets_get_repetition_budget" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No repetion found"|

  @Positive @EndToEnd
  Scenario: End-to-end repetition budget data retrieval workflow
    And I send the GET request to "tourbudgets_get_repetition_budget" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No repetion found"|
    And I store the response as "repetition_budget_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.repetitionBudget|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.repetitionBudget|[]|

  @Positive @EmptyArrayValidation
  Scenario: Validate repetition budget empty array response
    And I send the GET request to "tourbudgets_get_repetition_budget" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No repetion found"|
      |$.repetitionBudget|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.repetitionBudget|array|

  @Positive @WarehouseParameterValidation
  Scenario: Validate repetition budget with different warehouse IDs
    And I send the GET request to "tourbudgets_get_repetition_budget" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No repetion found"|
      |$.repetitionBudget|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.repetitionBudget|array|

  @Positive @FieldValidation
  Scenario: Validate repetition budget field completeness
    And I send the GET request to "tourbudgets_get_repetition_budget" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No repetion found"|
      |$.repetitionBudget|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.repetitionBudget|array|

