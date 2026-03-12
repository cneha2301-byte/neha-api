@BizomWebAPI @ReportsManagement @PerformanceReport @OrderManagement @CE
Feature: Performance Report API Testing
  As a system user
  I want to test the performance report endpoint
  So that I can ensure proper functionality and data retrieval for performance reports

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

#  @Negative @Security
#  Scenario: Get performance report without access token
#    When I send the GET request to "reports_performance_report" endpoint with query parameters
#      |QueryParamName|QueryParamValue|
#      |data[users]||
#      |data[date]|17-11-2025|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get performance report with invalid access token
#    And I send the GET request to "reports_performance_report" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|invalid_token_12345|
#      |data[users]||
#      |data[date]|17-11-2025|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get performance report with expired access token
#    And I send the GET request to "reports_performance_report" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|expired_token_12345|
#      |data[users]||
#      |data[date]|17-11-2025|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get performance report with malformed access token
#    And I send the GET request to "reports_performance_report" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|malformed.token.here|
#      |data[users]||
#      |data[date]|17-11-2025|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds

#  @Positive @Smoke
#  Scenario: Get performance report with valid access token and date parameter
#    And I send the GET request to "reports_performance_report" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |data[users]||
#      |data[date]|17-11-2025|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|"No data found."|
#    And I store the response as "performance_report_response" name using full path

#  @Positive @DataValidation
#  Scenario: Validate performance report response structure
#    And I send the GET request to "reports_performance_report" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |data[users]||
#      |data[date]|17-11-2025|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|"No data found."|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Data|array|

#  @Positive @DataValidation
#  Scenario: Validate performance report data array structure
#    And I send the GET request to "reports_performance_report" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |data[users]||
#      |data[date]|17-11-2025|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|"No data found."|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Data|array|

#  @Positive @DataValidation
#  Scenario: Validate performance report with static values
#    And I send the GET request to "reports_performance_report" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |data[users]||
#      |data[date]|17-11-2025|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|"No data found."|
#      |$.Data|[]|

#  @Positive @Performance
#  Scenario: Performance test for performance report endpoint
#    And I send the GET request to "reports_performance_report" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |data[users]||
#      |data[date]|17-11-2025|
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|"No data found."|

#  @Positive @Concurrency
#  Scenario: Concurrent access test for performance report endpoint
#    And I send the GET request to "reports_performance_report" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |data[users]||
#      |data[date]|17-11-2025|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|"No data found."|

#  @Negative @Validation
#  Scenario: Get performance report with invalid query parameters
#    And I send the GET request to "reports_performance_report" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |data[users]||
#      |data[date]|17-11-2025|
#      |invalid_param|invalid_value|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|"No data found."|

#  @Negative @Validation
#  Scenario: Get performance report with special characters in query parameters
#    And I send the GET request to "reports_performance_report" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |data[users]||
#      |data[date]|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|"No data found."|

#  @Negative @Security
#  Scenario: Get performance report with SQL injection attempt
#    And I send the GET request to "reports_performance_report" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |data[users]||
#      |data[date]|'; DROP TABLE reports; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|"No data found."|

#  @Negative @Boundary
#  Scenario: Get performance report with maximum query parameters
#    And I send the GET request to "reports_performance_report" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |data[users]||
#      |data[date]|17-11-2025|
#      |param1|value1|
#      |param2|value2|
#      |param3|value3|
#      |param4|value4|
#      |param5|value5|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|"No data found."|

  @Negative @ErrorHandling
  Scenario: Get performance report with invalid endpoint
    And I send the GET request to "reports_performance_report_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |data[users]||
      |data[date]|17-11-2025|
    Then I should see the response code as "404"
    And verify response time is less than "2500" milliseconds

#  @Positive @BusinessLogic
#  Scenario: Validate performance report business logic
#    And I send the GET request to "reports_performance_report" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |data[users]||
#      |data[date]|17-11-2025|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|"No data found."|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Data|array|

#  @Positive @DataIntegrity
#  Scenario: Validate performance report data integrity
#    And I send the GET request to "reports_performance_report" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |data[users]||
#      |data[date]|17-11-2025|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|"No data found."|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Data|array|

#  @Positive @Regression
#  Scenario: Regression test for performance report endpoint
#    And I send the GET request to "reports_performance_report" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |data[users]||
#      |data[date]|17-11-2025|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|"No data found."|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Data|array|

#  @Positive @Functional
#  Scenario: Validate performance report response completeness
#    And I send the GET request to "reports_performance_report" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |data[users]||
#      |data[date]|17-11-2025|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|"No data found."|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Data|array|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Data|[]|

#  @Positive @ArrayValidation
#  Scenario: Validate performance report array structure and content
#    And I send the GET request to "reports_performance_report" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |data[users]||
#      |data[date]|17-11-2025|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|"No data found."|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Data|array|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Data|[]|

#  @Positive @ContentValidation
#  Scenario: Validate performance report content structure
#    And I send the GET request to "reports_performance_report" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |data[users]||
#      |data[date]|17-11-2025|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|"No data found."|
#    And validating the response contains the following values
#      |Value|
#      |Result|
#      |Reason|
#      |Data|
#      |No data found.|

#  @Positive @LoadTesting
#  Scenario: Load testing for performance report endpoint
#    And I send the GET request to "reports_performance_report" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |data[users]||
#      |data[date]|17-11-2025|
#    Then I should see the response code as "200"
#    And verify response time is less than "3000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|"No data found."|

#  @Negative @Timeout
#  Scenario: Test performance report endpoint timeout handling
#    And I send the GET request to "reports_performance_report" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |data[users]||
#      |data[date]|17-11-2025|
#    Then I should see the response code as "200"
#    And verify response time is less than "5000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|"No data found."|

#  @Positive @EndToEnd
#  Scenario: End-to-end performance report data retrieval workflow
#    And I send the GET request to "reports_performance_report" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |data[users]||
#      |data[date]|17-11-2025|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|"No data found."|
#    And I store the response as "performance_report_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Data|array|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Data|[]|

#  @Positive @EmptyArrayValidation
#  Scenario: Validate performance report empty array response
#    And I send the GET request to "reports_performance_report" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |data[users]||
#      |data[date]|17-11-2025|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|"No data found."|
#      |$.Data|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Data|array|

#  @Positive @DateParameterValidation
#  Scenario: Validate performance report with different date formats
#    And I send the GET request to "reports_performance_report" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |data[users]||
#      |data[date]|01-01-2024|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|"No data found."|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Data|array|

#  @Positive @UserParameterValidation
#  Scenario: Validate performance report with user parameter
#    And I send the GET request to "reports_performance_report" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |data[users]|1|
#      |data[date]|17-11-2025|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|"No data found."|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Data|array|

#  @Positive @FieldValidation
#  Scenario: Validate performance report field completeness
#    And I send the GET request to "reports_performance_report" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |data[users]||
#      |data[date]|17-11-2025|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|"No data found."|
#      |$.Data|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Data|array|

