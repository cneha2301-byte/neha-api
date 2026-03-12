@BizomWebAPI @CallsManagement @Calls @DailySalesReportData @ReportingAndAnalytics
Feature: Daily Sales Report Data API Testing
  As a Bizom web API consumer
  I want to validate the daily sales report data endpoint
  So that I can ensure accurate sales reporting data is returned

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get daily sales report data without access token
    When I send the GET request to "calls_dailysalesreportdata" endpoint with query parameters
      |queryparamname|queryparamvalue|
      |user_id|3|
      |fordate|13-04-2022|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get daily sales report data with invalid access token
    And I send the GET request to "calls_dailysalesreportdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
      |user_id|3|
      |fordate|13-04-2022|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get daily sales report data with expired access token
    And I send the GET request to "calls_dailysalesreportdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
      |user_id|3|
      |fordate|13-04-2022|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get daily sales report data with malformed access token
    And I send the GET request to "calls_dailysalesreportdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
      |user_id|3|
      |fordate|13-04-2022|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get daily sales report data with valid access token and valid user_id 3
    And I send the GET request to "calls_dailysalesreportdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |user_id|3|
      |fordate|13-04-2022|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.summary.Tc|0|
      |$.summary.Pc|0|
      |$.summary.convert|0|
      |$.summary.convert_quantiy|0|
      |$.summary.order_amount|0|
      |$.summary.sales_amount|0|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.summary|object|
      |$.summary.Tc|number|
      |$.summary.Pc|number|
      |$.summary.convert|number|
      |$.summary.convert_quantiy|number|
      |$.summary.order_quantity|string|
      |$.summary.sales_quantity|string|
      |$.summary.order_amount|number|
      |$.summary.sales_amount|number|

  @Positive @Functional
  Scenario: TC_06 Get daily sales report data with valid user_id 2 and different date
    And I send the GET request to "calls_dailysalesreportdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |user_id|2|
      |fordate|12-04-2022|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.summary.Tc|0|
      |$.summary.Pc|0|

  @Positive @Functional
  Scenario: TC_07 Get daily sales report data with valid user_id 1 and another date
    And I send the GET request to "calls_dailysalesreportdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |user_id|1|
      |fordate|11-04-2022|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.summary|object|

  @Negative @Validation
  Scenario: TC_08 Get daily sales report data with invalid user_id (non-numeric)
    And I send the GET request to "calls_dailysalesreportdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |user_id|abc|
      |fordate|13-04-2022|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|

  @Negative @Validation
  Scenario: TC_09 Get daily sales report data with invalid date format
    And I send the GET request to "calls_dailysalesreportdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |user_id|3|
      |fordate|invalid-date|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|

  @Negative @Validation
  Scenario: TC_10 Get daily sales report data with non-existent user_id
    And I send the GET request to "calls_dailysalesreportdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |user_id|999999|
      |fordate|13-04-2022|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_11 Get daily sales report data with zero user_id
    And I send the GET request to "calls_dailysalesreportdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |user_id|0|
      |fordate|13-04-2022|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|

  @Negative @Validation
  Scenario: TC_12 Get daily sales report data with negative user_id
    And I send the GET request to "calls_dailysalesreportdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |user_id|-1|
      |fordate|13-04-2022|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|

  @Negative @Validation
  Scenario: TC_13 Get daily sales report data with missing user_id parameter
    And I send the GET request to "calls_dailysalesreportdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|13-04-2022|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|

  @Negative @Validation
  Scenario: TC_14 Get daily sales report data with missing fordate parameter
    And I send the GET request to "calls_dailysalesreportdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |user_id|3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|

  @Negative @Security
  Scenario: TC_15 Get daily sales report data with SQL injection in user_id
    And I send the GET request to "calls_dailysalesreportdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |user_id|3'; DROP TABLE calls; --|
      |fordate|13-04-2022|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_16 Get daily sales report data with SQL injection in fordate
    And I send the GET request to "calls_dailysalesreportdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |user_id|3|
      |fordate|13-04-2022'; DROP TABLE calls; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_17 Get daily sales report data with XSS attempt in user_id
    And I send the GET request to "calls_dailysalesreportdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |user_id|<script>alert('XSS')</script>|
      |fordate|13-04-2022|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_18 Get daily sales report data with XSS attempt in fordate
    And I send the GET request to "calls_dailysalesreportdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |user_id|3|
      |fordate|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_19 Get daily sales report data with command injection attempt
    And I send the GET request to "calls_dailysalesreportdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |user_id|3|
      |fordate|13-04-2022; rm -rf /|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_20 Get daily sales report data with invalid endpoint
    And I send the GET request to "calls_dailysalesreportdata_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |user_id|3|
      |fordate|13-04-2022|
    Then I should see the response code as "404"
    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: TC_21 Performance test for daily sales report data endpoint
    And I send the GET request to "calls_dailysalesreportdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |user_id|3|
      |fordate|13-04-2022|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: TC_22 Concurrent access test for daily sales report data endpoint
    And I send the GET request to "calls_dailysalesreportdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |user_id|3|
      |fordate|13-04-2022|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Regression
  Scenario: TC_23 Regression test for daily sales report data endpoint with valid data
    And I send the GET request to "calls_dailysalesreportdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |user_id|3|
      |fordate|13-04-2022|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.summary.Tc|0|

  @Negative @Validation
  Scenario: TC_24 Get daily sales report data with future date
    And I send the GET request to "calls_dailysalesreportdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |user_id|3|
      |fordate|31-12-2099|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_25 Get daily sales report data with very old date
    And I send the GET request to "calls_dailysalesreportdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |user_id|3|
      |fordate|01-01-2000|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @DataType
  Scenario: TC_26 Verify response data types for daily sales report data
    And I send the GET request to "calls_dailysalesreportdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |user_id|3|
      |fordate|13-04-2022|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.summary|object|
      |$.summary.Tc|number|
      |$.summary.Pc|number|
      |$.summary.convert|number|
      |$.summary.convert_quantiy|number|
      |$.summary.order_quantity|string|
      |$.summary.sales_quantity|string|
      |$.summary.order_amount|number|
      |$.summary.sales_amount|number|

  @Positive @LoadTesting
  Scenario: TC_27 Load testing for daily sales report data endpoint
    And I send the GET request to "calls_dailysalesreportdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |user_id|3|
      |fordate|13-04-2022|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Positive @SummaryValidation
  Scenario: TC_28 Verify summary structure contains all required fields
    And I send the GET request to "calls_dailysalesreportdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |user_id|3|
      |fordate|13-04-2022|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.summary.Tc|0|
      |$.summary.Pc|0|
      |$.summary.convert|0|
      |$.summary.convert_quantiy|0|
      |$.summary.order_quantity|""|
      |$.summary.sales_quantity|""|
      |$.summary.order_amount|0|
      |$.summary.sales_amount|0|

  @Positive @Smoke
  Scenario: TC_29 Get daily sales report data with valid access token and valid user_id 3 - DB Validation
    And I send the GET request to "calls_dailysalesreportdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |user_id|3|
      |fordate|13-04-2022|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.summary.Tc|0|
      |$.summary.Pc|0|
      |$.summary.convert|DB:calls:conversion_count: user_id=3 AND date=13-04-2022|
      |$.summary.order_amount|0|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.summary|object|
      |$.summary.Tc|number|
      |$.summary.Pc|number|
      |$.summary.convert|number|

  @Positive @Functional
  Scenario: TC_30 Get daily sales report data with valid user_id 2 and date validation against DB
    And I send the GET request to "calls_dailysalesreportdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |user_id|2|
      |fordate|12-04-2022|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.summary.Tc|DB:calls:target_calls: user_id=2 AND date=12-04-2022|
      |$.summary.Pc|DB:calls:productive_calls: user_id=2 AND date=12-04-2022|
      |$.summary.order_amount|0|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.summary|object|
