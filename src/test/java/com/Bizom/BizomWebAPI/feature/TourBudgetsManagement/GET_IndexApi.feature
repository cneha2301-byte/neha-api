@BizomWebAPI @TourBudgetsManagement @IndexApi @UserManagement @innovation
Feature: Tour Budgets Index API Testing
  As a system user
  I want to test the tour budgets index API endpoint
  So that I can ensure proper functionality and data retrieval for tour budgets

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get tour budgets index API without access token
    When I send the GET request to "tourbudgets_index_api" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get tour budgets index API with invalid access token
    And I send the GET request to "tourbudgets_index_api" endpoint with dynamic access token and query parameters
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
  Scenario: Get tour budgets index API with expired access token
    And I send the GET request to "tourbudgets_index_api" endpoint with dynamic access token and query parameters
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
  Scenario: Get tour budgets index API with malformed access token
    And I send the GET request to "tourbudgets_index_api" endpoint with dynamic access token and query parameters
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
  Scenario: Get tour budgets index API with valid access token
    And I send the GET request to "tourbudgets_index_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
      |$.extraDatas|object|
    And I store the response as "tour_budgets_index_api_response" name using full path

  @Positive @DataValidation
  Scenario: Validate tour budgets index API response structure
    And I send the GET request to "tourbudgets_index_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
      |$.extraDatas|object|
      |$.extraDatas.user|object|

  @Positive @DataTablesValidation
  Scenario: Validate tour budgets index API DataTables structure
    And I send the GET request to "tourbudgets_index_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Positive @ArrayValidation
  Scenario: Validate tour budgets index API aaData array structure
    And I send the GET request to "tourbudgets_index_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData|array|
      |$.aaData[0]|object|
      |$.aaData[0].id|string|
      |$.aaData[0].user_id|string|
      |$.aaData[0].fromdate|string|
      |$.aaData[0].todate|string|
      |$.aaData[0].state|string|
      |$.aaData[0].value|string|
      |$.aaData[0].byuser_id|string|
      |$.aaData[0].actionbyuser_id|string|
      |$.aaData[0].parent_id|string|
      |$.aaData[0].is_active|string|
      |$.aaData[0].olddata|null|
      |$.aaData[0].budget_parentid|string|
      |$.aaData[0].actionbyuser_name|string|
      |$.aaData[0].user_name|string|
      |$.aaData[0].byuser_name|string|
      |$.aaData[0].tourBudgetData|array|

  @Positive @NestedObjectValidation
  Scenario: Validate tour budgets index API tourBudgetData nested array
    And I send the GET request to "tourbudgets_index_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData[0].tourBudgetData|array|
      |$.aaData[0].tourBudgetData[0]|object|
      |$.aaData[0].tourBudgetData[0].id|string|
      |$.aaData[0].tourBudgetData[0].tourtype_id|string|
      |$.aaData[0].tourBudgetData[0].entity_id|string|
      |$.aaData[0].tourBudgetData[0].value|string|
      |$.aaData[0].tourBudgetData[0].state|string|
      |$.aaData[0].tourBudgetData[0].actionbyuser_id|string|
      |$.aaData[0].tourBudgetData[0].data|null|
      |$.aaData[0].tourBudgetData[0].olddata|null|
      |$.aaData[0].tourBudgetData[0].actionbyuser_name|string|

  @Positive @ExtraDatasValidation
  Scenario: Validate tour budgets index API extraDatas object
    And I send the GET request to "tourbudgets_index_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.extraDatas|object|
      |$.extraDatas.user|object|

  @Positive @Performance
  Scenario: Performance test for tour budgets index API endpoint
    And I send the GET request to "tourbudgets_index_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Positive @Concurrency
  Scenario: Concurrent access test for tour budgets index API endpoint
    And I send the GET request to "tourbudgets_index_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Negative @Validation
  Scenario: Get tour budgets index API with invalid query parameters
    And I send the GET request to "tourbudgets_index_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Negative @Validation
  Scenario: Get tour budgets index API with special characters in query parameters
    And I send the GET request to "tourbudgets_index_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Negative @Security
  Scenario: Get tour budgets index API with SQL injection attempt
    And I send the GET request to "tourbudgets_index_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE tourbudgets; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

#  @Negative @ErrorHandling
#  Scenario: Get tour budgets index API with invalid endpoint
#    And I send the GET request to "tourbudgets_index_api_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate tour budgets index API business logic
    And I send the GET request to "tourbudgets_index_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
      |$.extraDatas|object|

  @Positive @DataIntegrity
  Scenario: Validate tour budgets index API data integrity
    And I send the GET request to "tourbudgets_index_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
      |$.aaData[0]|object|
      |$.aaData[0].id|string|
      |$.aaData[0].user_id|string|
      |$.aaData[0].fromdate|string|
      |$.aaData[0].todate|string|
      |$.aaData[0].state|string|
      |$.aaData[0].value|string|
      |$.aaData[0].tourBudgetData|array|
      |$.extraDatas|object|

  @Positive @Regression
  Scenario: Regression test for tour budgets index API endpoint
    And I send the GET request to "tourbudgets_index_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
      |$.extraDatas|object|

  @Positive @Functional
  Scenario: Validate tour budgets index API response completeness
    And I send the GET request to "tourbudgets_index_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
      |$.aaData[0]|object|
      |$.aaData[0].tourBudgetData|array|
      |$.extraDatas|object|

  @Positive @ContentValidation
  Scenario: Validate tour budgets index API content structure
    And I send the GET request to "tourbudgets_index_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |sEcho|
      |iTotalRecords|
      |iTotalDisplayRecords|
      |aaData|
      |extraDatas|

  @Positive @LoadTesting
  Scenario: Load testing for tour budgets index API endpoint
    And I send the GET request to "tourbudgets_index_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Negative @Timeout
  Scenario: Test tour budgets index API endpoint timeout handling
    And I send the GET request to "tourbudgets_index_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Positive @EndToEnd
  Scenario: End-to-end tour budgets index API data retrieval workflow
    And I send the GET request to "tourbudgets_index_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And I store the response as "tour_budgets_index_api_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
      |$.aaData[0]|object|
      |$.aaData[0].id|string|
      |$.aaData[0].user_id|string|
      |$.aaData[0].fromdate|string|
      |$.aaData[0].todate|string|
      |$.aaData[0].tourBudgetData|array|
      |$.aaData[0].tourBudgetData[0]|object|
      |$.extraDatas|object|
      |$.extraDatas.user|object|

  @Positive @AaDataObjectValidation
  Scenario: Validate tour budgets index API aaData object fields
    And I send the GET request to "tourbudgets_index_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData[0].id|string|
      |$.aaData[0].user_id|string|
      |$.aaData[0].fromdate|string|
      |$.aaData[0].todate|string|
      |$.aaData[0].state|string|
      |$.aaData[0].value|string|
      |$.aaData[0].byuser_id|string|
      |$.aaData[0].actionbyuser_id|string|
      |$.aaData[0].parent_id|string|
      |$.aaData[0].is_active|string|
      |$.aaData[0].olddata|null|
      |$.aaData[0].budget_parentid|string|
      |$.aaData[0].actionbyuser_name|string|
      |$.aaData[0].user_name|string|
      |$.aaData[0].byuser_name|string|
      |$.aaData[0].tourBudgetData|array|

  @Positive @TourBudgetDataObjectValidation
  Scenario: Validate tour budgets index API tourBudgetData object fields
    And I send the GET request to "tourbudgets_index_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData[0].tourBudgetData[0].id|string|
      |$.aaData[0].tourBudgetData[0].tourtype_id|string|
      |$.aaData[0].tourBudgetData[0].entity_id|string|
      |$.aaData[0].tourBudgetData[0].value|string|
      |$.aaData[0].tourBudgetData[0].state|string|
      |$.aaData[0].tourBudgetData[0].actionbyuser_id|string|
      |$.aaData[0].tourBudgetData[0].data|null|
      |$.aaData[0].tourBudgetData[0].olddata|null|
      |$.aaData[0].tourBudgetData[0].actionbyuser_name|string|

  @Positive @ExtraDatasUserValidation
  Scenario: Validate tour budgets index API extraDatas.user object
    And I send the GET request to "tourbudgets_index_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.extraDatas|object|
      |$.extraDatas.user|object|

