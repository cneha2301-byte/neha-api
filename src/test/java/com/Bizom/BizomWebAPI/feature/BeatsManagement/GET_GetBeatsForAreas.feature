@BizomWebAPI @CE @BeatsManagement @GetBeatsForAreas @CoreBusinessOperations
Feature: Get Beats For Areas API Testing
  As a Bizom web API consumer
  I want to validate the get beats for areas endpoint
  So that I can ensure area-to-beat mappings are returned correctly

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get beats for areas without access token
    When I send the GET request to "getbeatsforareas" endpoint with path parameters
      |Path|Value|
      |areaId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get beats for areas with invalid access token
    And I send the GET request to "getbeatsforareas" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|areaId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get beats for areas with expired access token
    And I send the GET request to "getbeatsforareas" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|areaId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get beats for areas with malformed access token
    And I send the GET request to "getbeatsforareas" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|areaId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get beats for areas with valid access token
    And I send the GET request to "getbeatsforareas" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.pjpActivityForms|[]|
    And I store the response as "getBeatsForAreas_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate get beats for areas response structure
    And I send the GET request to "getbeatsforareas" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.pjpActivityForms|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.pjpActivityForms|array|

  @Positive @Performance
  Scenario: TC_07 Performance test for get beats for areas endpoint
    And I send the GET request to "getbeatsforareas" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|2|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: TC_08 Concurrent access test for get beats for areas endpoint
    And I send the GET request to "getbeatsforareas" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_09 Get beats for areas with invalid query parameters
    And I send the GET request to "getbeatsforareas" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|2|
      |invalid_param|invalid_value||     |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.pjpActivityForms|[]|
      |$.1|Silkboard (1)|

  @Negative @Validation
  Scenario: TC_10 Get beats for areas with special characters in query parameters
    And I send the GET request to "getbeatsforareas" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|2|
      |test_param|<script>alert('XSS')</script>|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_11 Get beats for areas with SQL injection attempt
    And I send the GET request to "getbeatsforareas" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|2|
      |test_param|'; DROP TABLE beats; --|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: TC_12 Get beats for areas with maximum query parameters
    And I send the GET request to "getbeatsforareas" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|2|
      |param1|value1||                   |
      |param2|value2||                   |
      |param3|value3||                   |
      |param4|value4||                   |
      |param5|value5|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_13 Get beats for areas with invalid endpoint
    And I send the GET request to "getbeatsforareas_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Regression @GetBeatsForAreas123
  Scenario: TC_14 Regression test for get beats for areas endpoint
    And I send the GET request to "getbeatsforareas" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.pjpActivityForms|[]|
      |$.1|"Silkboard (1)"|
      |$.25|"nrth (0)"|

  @Positive @LoadTesting
  Scenario: TC_15 Load testing for get beats for areas endpoint
    And I send the GET request to "getbeatsforareas" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|2|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Negative @Timeout
  Scenario: TC_16 Timeout handling for get beats for areas endpoint
    And I send the GET request to "getbeatsforareas" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|2|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds

  @Negative @Boundary
  Scenario: TC_17 Get beats for areas with non-existent area
    And I send the GET request to "getbeatsforareas" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|99999|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.pjpActivityForms|object|

