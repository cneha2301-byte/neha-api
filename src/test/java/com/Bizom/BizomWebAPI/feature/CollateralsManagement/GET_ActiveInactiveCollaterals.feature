@BizomWebAPI @CollateralsManagement @ActiveInactiveCollaterals @ReportsAnalyticsGroup2 @Innovation
Feature: Active Inactive Collaterals API Testing
  As a system user
  I want to test the active inactive collaterals endpoint
  So that I can ensure proper functionality and data retrieval for collaterals management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get active inactive collaterals without access token
    When I send the GET request to "collaterals_active_inactive" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get active inactive collaterals with invalid access token
    And I send the GET request to "collaterals_active_inactive" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get active inactive collaterals with expired access token
    And I send the GET request to "collaterals_active_inactive" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get active inactive collaterals with malformed access token
    And I send the GET request to "collaterals_active_inactive" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get active inactive collaterals with valid access token
    And I send the GET request to "collaterals_active_inactive" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.isActive|string|
    And I store the response as "active_inactive_collaterals_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate active inactive collaterals response structure
    And I send the GET request to "collaterals_active_inactive" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.isActive|string|

  @Positive @DataValidation
  Scenario: TC_07 Validate active inactive collaterals response content
    And I send the GET request to "collaterals_active_inactive" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.isActive|string|

  @Positive @DataValidation
  Scenario: TC_08 Validate active inactive collaterals isActive field
    And I send the GET request to "collaterals_active_inactive" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.isActive|string|
    And validating the response contains the following values
      |Value|
      |Result|
      |isActive|

  @Positive @Performance
  Scenario: TC_09 Performance test for active inactive collaterals endpoint
    And I send the GET request to "collaterals_active_inactive" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.isActive|string|

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for active inactive collaterals endpoint
    And I send the GET request to "collaterals_active_inactive" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.isActive|string|

  @Positive @BusinessLogic
  Scenario: TC_11 Validate active inactive collaterals business logic
    And I send the GET request to "collaterals_active_inactive" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.isActive|string|

  @Positive @DataIntegrity
  Scenario: TC_12 Validate active inactive collaterals data integrity
    And I send the GET request to "collaterals_active_inactive" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.isActive|string|
    And validating the response contains the following values
      |Value|
      |Result|
      |isActive|

  @Positive @Regression
  Scenario: TC_13 Regression test for active inactive collaterals endpoint
    And I send the GET request to "collaterals_active_inactive" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.isActive|string|

  @Positive @Functional
  Scenario: TC_14 Validate active inactive collaterals response completeness
    And I send the GET request to "collaterals_active_inactive" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.isActive|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Positive @ContentValidation
  Scenario: TC_15 Validate active inactive collaterals content structure
    And I send the GET request to "collaterals_active_inactive" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Result|
      |isActive|

  @Positive @LoadTesting
  Scenario: TC_16 Load testing for active inactive collaterals endpoint
    And I send the GET request to "collaterals_active_inactive" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.isActive|string|

  @Positive @Timeout
  Scenario: TC_17 Test active inactive collaterals endpoint timeout handling
    And I send the GET request to "collaterals_active_inactive" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.isActive|string|

  @Positive @EndToEnd
  Scenario: TC_18 End-to-end active inactive collaterals retrieval workflow
    And I send the GET request to "collaterals_active_inactive" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.isActive|string|
    And I store the response as "active_inactive_collaterals_response" name using full path

  @Negative @Validation
  Scenario: TC_19 Get active inactive collaterals with invalid query parameters
    And I send the GET request to "collaterals_active_inactive" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.isActive|string|

  @Negative @Validation
  Scenario: TC_20 Get active inactive collaterals with special characters in query parameters
    And I send the GET request to "collaterals_active_inactive" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.isActive|string|

  @Negative @Security
  Scenario: TC_21 Get active inactive collaterals with SQL injection attempt
    And I send the GET request to "collaterals_active_inactive" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE collaterals; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.isActive|string|

  @Negative @Boundary
  Scenario: TC_22 Get active inactive collaterals with maximum query parameters
    And I send the GET request to "collaterals_active_inactive" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.isActive|string|

  @Negative @ErrorHandling
  Scenario: TC_23 Get active inactive collaterals with invalid endpoint
    And I send the GET request to "collaterals_active_inactive_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

