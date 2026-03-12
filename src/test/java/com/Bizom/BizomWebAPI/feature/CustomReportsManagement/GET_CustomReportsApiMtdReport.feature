@BizomWebAPI @CustomReportsManagement @CustomReportsApiMtdReport @SupportingFunctions @CE
Feature: Custom Reports API MTD Report Testing
  As a system user
  I want to test the custom reports API MTD report endpoint
  So that I can ensure proper functionality and data retrieval for custom reports management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get API MTD report without access token
    When I send the GET request to "customreports_apimtdreport" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get API MTD report with invalid access token
    And I send the GET request to "customreports_apimtdreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get API MTD report with expired access token
    And I send the GET request to "customreports_apimtdreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get API MTD report with malformed access token
    And I send the GET request to "customreports_apimtdreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get API MTD report with valid access token
    And I send the GET request to "customreports_apimtdreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

  @Positive @DataValidation
  Scenario: TC_06 Validate API MTD report response structure
    And I send the GET request to "customreports_apimtdreport" endpoint with dynamic access token and query parameters
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

  @Positive @DataValidation
  Scenario: TC_07 Validate API MTD report specific data values
    And I send the GET request to "customreports_apimtdreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.aaData[0][0]|"2"|
      |$.aaData[0][1]|"SLV Traders"|

  @Positive @Performance
  Scenario: TC_08 Performance test for API MTD report endpoint
    And I send the GET request to "customreports_apimtdreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: TC_09 Concurrent access test for API MTD report endpoint
    And I send the GET request to "customreports_apimtdreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_10 API MTD report with invalid query parameters
    And I send the GET request to "customreports_apimtdreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_11 API MTD report with special characters in query parameters
    And I send the GET request to "customreports_apimtdreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_12 API MTD report with SQL injection attempt
    And I send the GET request to "customreports_apimtdreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE customreports; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: TC_13 API MTD report with maximum query parameters
    And I send the GET request to "customreports_apimtdreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Negative @ErrorHandling
#  Scenario: TC_14 API MTD report invalid endpoint
#    And I send the GET request to "customreports_apimtdreport_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds

  @Positive @NumericValidation
  Scenario: TC_15 Validate numeric columns in API MTD report rows
    And I send the GET request to "customreports_apimtdreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData[0]|array|
      |$.aaData[0][0]|string|
      |$.aaData[0][1]|string|
      |$.aaData[0][2]|number|
      |$.aaData[0][19]|number|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.aaData[0][2]|0|
      |$.aaData[0][19]|0|
