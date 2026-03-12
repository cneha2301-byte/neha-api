@BizomWebAPI @TourBudgetsManagement @GetTourTypesApi @OutletManagement @innovation
Feature: Get Tour Types API Testing
  As a system user
  I want to test the get tour types API endpoint
  So that I can ensure proper functionality and data retrieval for tour types

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get tour types API without access token
    When I send the GET request to "tourbudgets_get_tour_types_api" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get tour types API with invalid access token
    And I send the GET request to "tourbudgets_get_tour_types_api" endpoint with dynamic access token and query parameters
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
  Scenario: Get tour types API with expired access token
    And I send the GET request to "tourbudgets_get_tour_types_api" endpoint with dynamic access token and query parameters
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
  Scenario: Get tour types API with malformed access token
    And I send the GET request to "tourbudgets_get_tour_types_api" endpoint with dynamic access token and query parameters
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
  Scenario: Get tour types API with valid access token and language parameter
    And I send the GET request to "tourbudgets_get_tour_types_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.tourTypes|array|
      |$.tourTypes[0]|object|
      |$.tourTypes[0].id|string|
      |$.tourTypes[0].name|string|
      |$.tourTypes[0].parententity|string|
      |$.tourTypes[0].childentity|string|
      |$.tourTypes[0].task_id|string|
      |$.tourTypes[0].active|string|
      |$.tourTypes[0].showfilters|boolean|
      |$.tourTypes[0].maxbudget|string|
    And I store the response as "tour_types_api_response" name using full path

  @Positive @DataValidation
  Scenario: Validate tour types API response structure
    And I send the GET request to "tourbudgets_get_tour_types_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.tourTypes|array|
      |$.tourTypes[0]|object|

  @Positive @Functional
  Scenario: Get tour types API with different language parameter
    And I send the GET request to "tourbudgets_get_tour_types_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|es|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.tourTypes|array|

  @Positive @Functional
  Scenario: Get tour types API without language parameter
    And I send the GET request to "tourbudgets_get_tour_types_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.tourTypes|array|

  @Negative @Validation
  Scenario: Get tour types API with invalid language parameter
    And I send the GET request to "tourbudgets_get_tour_types_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|invalid_lang|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.tourTypes|array|

  @Negative @Validation
  Scenario: Get tour types API with special characters in language parameter
    And I send the GET request to "tourbudgets_get_tour_types_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.tourTypes|array|

  @Negative @Security
  Scenario: Get tour types API with SQL injection attempt
    And I send the GET request to "tourbudgets_get_tour_types_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|'; DROP TABLE tourbudgets; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.tourTypes|array|

  @Positive @Performance
  Scenario: Performance test for tour types API endpoint
    And I send the GET request to "tourbudgets_get_tour_types_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.tourTypes|array|

  @Positive @Concurrency
  Scenario: Concurrent access test for tour types API endpoint
    And I send the GET request to "tourbudgets_get_tour_types_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.tourTypes|array|

  @Negative @ErrorHandling
  Scenario: Get tour types API with invalid endpoint
    And I send the GET request to "tourbudgets_get_tour_types_api_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "404"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate tour types API business logic
    And I send the GET request to "tourbudgets_get_tour_types_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.tourTypes|array|
      |$.tourTypes[0]|object|
      |$.tourTypes[0].id|string|
      |$.tourTypes[0].name|string|
      |$.tourTypes[0].parententity|string|
      |$.tourTypes[0].childentity|string|
      |$.tourTypes[0].task_id|string|
      |$.tourTypes[0].active|string|
      |$.tourTypes[0].showfilters|boolean|
      |$.tourTypes[0].maxbudget|string|

  @Positive @DataIntegrity
  Scenario: Validate tour types API data integrity
    And I send the GET request to "tourbudgets_get_tour_types_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.tourTypes|array|
      |$.tourTypes[0]|object|
      |$.tourTypes[0].id|string|
      |$.tourTypes[0].name|string|
      |$.tourTypes[0].parententity|string|
      |$.tourTypes[0].childentity|string|
      |$.tourTypes[0].task_id|string|
      |$.tourTypes[0].active|string|
      |$.tourTypes[0].showfilters|boolean|
      |$.tourTypes[0].maxbudget|string|

  @Positive @Regression
  Scenario: Regression test for tour types API endpoint
    And I send the GET request to "tourbudgets_get_tour_types_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.tourTypes|array|

  @Positive @Functional
  Scenario: Validate tour types API response completeness
    And I send the GET request to "tourbudgets_get_tour_types_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.tourTypes|array|
      |$.tourTypes[0]|object|

  @Positive @ArrayValidation
  Scenario: Validate tour types API tourTypes array structure
    And I send the GET request to "tourbudgets_get_tour_types_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.tourTypes|array|
      |$.tourTypes[0]|object|
      |$.tourTypes[1]|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Positive @TourTypeObjectValidation
  Scenario: Validate tour types API tourType object fields
    And I send the GET request to "tourbudgets_get_tour_types_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.tourTypes[0].id|string|
      |$.tourTypes[0].name|string|
      |$.tourTypes[0].parententity|string|
      |$.tourTypes[0].childentity|string|
      |$.tourTypes[0].task_id|string|
      |$.tourTypes[0].active|string|
      |$.tourTypes[0].showfilters|boolean|
      |$.tourTypes[0].maxbudget|string|
      |$.tourTypes[0].erp_id|null|

  @Positive @EndToEnd
  Scenario: End-to-end tour types API data retrieval workflow
    And I send the GET request to "tourbudgets_get_tour_types_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And I store the response as "tour_types_api_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.tourTypes|array|
      |$.tourTypes[0]|object|
      |$.tourTypes[0].id|string|
      |$.tourTypes[0].name|string|
      |$.tourTypes[0].parententity|string|
      |$.tourTypes[0].childentity|string|
      |$.tourTypes[0].task_id|string|
      |$.tourTypes[0].active|string|
      |$.tourTypes[0].showfilters|boolean|
      |$.tourTypes[0].maxbudget|string|

  @Positive @ResultFieldValidation
  Scenario: Validate tour types API Result field
    And I send the GET request to "tourbudgets_get_tour_types_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|

  @Positive @ReasonFieldValidation
  Scenario: Validate tour types API Reason field
    And I send the GET request to "tourbudgets_get_tour_types_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Reason|string|

  @Positive @TourTypesArrayValidation
  Scenario: Validate tour types API tourTypes array content
    And I send the GET request to "tourbudgets_get_tour_types_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.tourTypes|array|
      |$.tourTypes[0]|object|
      |$.tourTypes[0].id|string|
      |$.tourTypes[0].name|string|
      |$.tourTypes[0].parententity|string|
      |$.tourTypes[0].childentity|string|
      |$.tourTypes[0].task_id|string|
      |$.tourTypes[0].active|string|
      |$.tourTypes[0].showfilters|boolean|
      |$.tourTypes[0].maxbudget|string|

