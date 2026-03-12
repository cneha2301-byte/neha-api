@BizomWebAPI @ClaimTypesManagement @ClaimTypes @GetAggregateAndKPiDefaultValues @SystemIntegration @CE
Feature: Get Aggregate And KPI Default Values API Testing
  As a system user
  I want to test the get aggregate and KPI default values endpoint
  So that I can ensure proper functionality and data retrieval for aggregate and KPI default values

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get aggregate and KPI default values without access token
    When I send the GET request to "claimtypes_get_aggregate_and_kpi_default_values" endpoint with path parameters
      |Path|Value|
      |claimTypeId|1|
      |date|2025-08-25|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get aggregate and KPI default values with invalid access token
    And I send the GET request to "claimtypes_get_aggregate_and_kpi_default_values" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|claimTypeId|1|
      |language|en|date|2025-08-25|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get aggregate and KPI default values with expired access token
    And I send the GET request to "claimtypes_get_aggregate_and_kpi_default_values" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|claimTypeId|1|
      |language|en|date|2025-08-25|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get aggregate and KPI default values with malformed access token
    And I send the GET request to "claimtypes_get_aggregate_and_kpi_default_values" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|claimTypeId|1|
      |language|en|date|2025-08-25|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: Get aggregate and KPI default values for claim type ID 1 and date 2025-08-25 with valid access token
    And I send the GET request to "claimtypes_get_aggregate_and_kpi_default_values" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|1|
      |language|en|date|2025-08-25|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No Aggregate and Default Values Found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|
    And I store the response as "getAggregateAndKPiDefaultValues_response" name using full path

  @Positive @Functional
  Scenario: Get aggregate and KPI default values for claim type ID 2 and date 2025-01-01 with valid access token
    And I send the GET request to "claimtypes_get_aggregate_and_kpi_default_values" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|2|
      |language|en|date|2025-01-01|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|
    And I store the response as "getAggregateAndKPiDefaultValues_response" name using full path

  @Positive @Functional
  Scenario: Get aggregate and KPI default values for claim type ID 3 and date 2025-12-31 with valid access token
    And I send the GET request to "claimtypes_get_aggregate_and_kpi_default_values" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|3|
      |language|en|date|2025-12-31|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|
    And I store the response as "getAggregateAndKPiDefaultValues_response" name using full path

  @Positive @Functional
  Scenario: Get aggregate and KPI default values with different language parameter
    And I send the GET request to "claimtypes_get_aggregate_and_kpi_default_values" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|1|
      |language|hi|date|2025-08-25|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|
    And I store the response as "getAggregateAndKPiDefaultValues_response" name using full path

  @Negative @Validation
  Scenario: Get aggregate and KPI default values with invalid claim type ID
    And I send the GET request to "claimtypes_get_aggregate_and_kpi_default_values" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|abc|
      |language|en|date|2025-08-25|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|

  @Negative @Validation
  Scenario: Get aggregate and KPI default values with non-existent claim type ID
    And I send the GET request to "claimtypes_get_aggregate_and_kpi_default_values" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|999999|
      |language|en|date|2025-08-25|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|

  @Negative @Validation
  Scenario: Get aggregate and KPI default values with invalid date format
    And I send the GET request to "claimtypes_get_aggregate_and_kpi_default_values" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|1|
      |language|en|date|25-08-2025|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|

  @Negative @Validation
  Scenario: Get aggregate and KPI default values with invalid date
    And I send the GET request to "claimtypes_get_aggregate_and_kpi_default_values" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|1|
      |language|en|date|2025-13-45|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|

  @Negative @Validation
  Scenario: Get aggregate and KPI default values with invalid language parameter
    And I send the GET request to "claimtypes_get_aggregate_and_kpi_default_values" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|1|
      |language|invalid_lang|date|2025-08-25|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|

  @Negative @Validation
  Scenario: Get aggregate and KPI default values with missing language parameter
    And I send the GET request to "claimtypes_get_aggregate_and_kpi_default_values" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|1|
      |||date|2025-08-25|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|

  @Negative @ErrorHandling
  Scenario: Get aggregate and KPI default values with invalid endpoint
    And I send the GET request to "claimtypes_get_aggregate_and_kpi_default_values_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|1|
      |language|en|date|2025-08-25|
    Then I should see the response code as "404"
    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance test for get aggregate and KPI default values endpoint
    And I send the GET request to "claimtypes_get_aggregate_and_kpi_default_values" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|1|
      |language|en|date|2025-08-25|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Regression
  Scenario: Regression test for get aggregate and KPI default values endpoint
    And I send the GET request to "claimtypes_get_aggregate_and_kpi_default_values" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|1|
      |language|en|date|2025-08-25|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No Aggregate and Default Values Found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|
    And I store the response as "getAggregateAndKPiDefaultValues_response" name using full path

  @Positive @DataValidation
  Scenario: Validate response structure for get aggregate and KPI default values
    And I send the GET request to "claimtypes_get_aggregate_and_kpi_default_values" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|1|
      |language|en|date|2025-08-25|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No Aggregate and Default Values Found|
      |$.Data|{}|
    And I store the response as "getAggregateAndKPiDefaultValues_response" name using full path

