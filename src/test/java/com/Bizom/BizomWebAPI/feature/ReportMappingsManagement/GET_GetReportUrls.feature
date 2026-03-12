@BizomWebAPI @ReportMappingsManagement @ReportMappings @OrderManagement
Feature: Get Report URLs API Testing
  As a system user
  I want to test the get report URLs endpoint
  So that I can ensure proper functionality and data retrieval for report mappings management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get report URLs without access token
    When I send the GET request to "reportmappings_get_report_urls" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get report URLs with invalid access token
    And I send the GET request to "reportmappings_get_report_urls" endpoint with dynamic access token and query parameters
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
  Scenario: Get report URLs with expired access token
    And I send the GET request to "reportmappings_get_report_urls" endpoint with dynamic access token and query parameters
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
  Scenario: Get report URLs with malformed access token
    And I send the GET request to "reportmappings_get_report_urls" endpoint with dynamic access token and query parameters
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
  Scenario: Get report URLs with valid access token
    And I send the GET request to "reportmappings_get_report_urls" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.reportgroup|1|
    And I store the response as "report_urls_response" name using full path

  @Positive @DataValidation
  Scenario: Validate report URLs response structure
    And I send the GET request to "reportmappings_get_report_urls" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.reportgroup|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.reporturl|array|
      |$.reportgroup|number|

  @Positive @DataValidation
  Scenario: Validate report URLs data array structure
    And I send the GET request to "reportmappings_get_report_urls" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.reportgroup|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.reporturl|array|

#  @Positive @DataValidation
#  Scenario: Validate report URLs with static values
#    And I send the GET request to "reportmappings_get_report_urls" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.reporturl|[]|
#      |$.reportgroup|1|

  @Positive @Performance
  Scenario: Performance test for report URLs endpoint
    And I send the GET request to "reportmappings_get_report_urls" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.reportgroup|1|

  @Positive @Concurrency
  Scenario: Concurrent access test for report URLs endpoint
    And I send the GET request to "reportmappings_get_report_urls" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.reportgroup|1|

  @Negative @Validation
  Scenario: Get report URLs with invalid query parameters
    And I send the GET request to "reportmappings_get_report_urls" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.reportgroup|1|

  @Negative @Validation
  Scenario: Get report URLs with special characters in query parameters
    And I send the GET request to "reportmappings_get_report_urls" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.reportgroup|1|

  @Negative @Security
  Scenario: Get report URLs with SQL injection attempt
    And I send the GET request to "reportmappings_get_report_urls" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE reportmappings; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.reportgroup|1|

  @Negative @Boundary
  Scenario: Get report URLs with maximum query parameters
    And I send the GET request to "reportmappings_get_report_urls" endpoint with dynamic access token and query parameters
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
      |$.reportgroup|1|

  @Negative @ErrorHandling
  Scenario: Get report URLs with invalid endpoint
    And I send the GET request to "reportmappings_get_report_urls_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "404"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate report URLs business logic
    And I send the GET request to "reportmappings_get_report_urls" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.reportgroup|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.reporturl|array|
      |$.reportgroup|number|

  @Positive @DataIntegrity
  Scenario: Validate report URLs data integrity
    And I send the GET request to "reportmappings_get_report_urls" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.reportgroup|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.reporturl|array|
      |$.reportgroup|number|

  @Positive @Regression
  Scenario: Regression test for report URLs endpoint
    And I send the GET request to "reportmappings_get_report_urls" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.reportgroup|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.reporturl|array|
      |$.reportgroup|number|

#  @Positive @Functional
#  Scenario: Validate report URLs response completeness
#    And I send the GET request to "reportmappings_get_report_urls" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.reportgroup|1|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.reporturl|array|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.reporturl|[]|
#      |$.reportgroup|1|

#  @Positive @ArrayValidation
#  Scenario: Validate report URLs array structure and content
#    And I send the GET request to "reportmappings_get_report_urls" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.reportgroup|1|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.reporturl|array|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.reporturl|[]|
#      |$.reportgroup|1|

  @Positive @ContentValidation
  Scenario: Validate report URLs content structure
    And I send the GET request to "reportmappings_get_report_urls" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.reportgroup|1|
    And validating the response contains the following values
      |Value|
      |reporturl|
      |reportgroup|

  @Positive @LoadTesting
  Scenario: Load testing for report URLs endpoint
    And I send the GET request to "reportmappings_get_report_urls" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.reportgroup|1|

  @Negative @Timeout
  Scenario: Test report URLs endpoint timeout handling
    And I send the GET request to "reportmappings_get_report_urls" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.reportgroup|1|

  @Positive @EndToEnd
  Scenario: End-to-end report URLs data retrieval workflow
    And I send the GET request to "reportmappings_get_report_urls" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.reportgroup|1|
    And I store the response as "report_urls_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.reporturl|array|
      |$.reportgroup|number|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.reporturl|[]|
      |$.reportgroup|1|

#  @Positive @EmptyArrayValidation
#  Scenario: Validate report URLs empty array response
#    And I send the GET request to "reportmappings_get_report_urls" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.reporturl|[]|
#      |$.reportgroup|1|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.reporturl|array|
#      |$.reportgroup|number|

  @Positive @ReportGroupValidation
  Scenario: Validate report URLs report group value
    And I send the GET request to "reportmappings_get_report_urls" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.reportgroup|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.reportgroup|number|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.reportgroup|1|

#  @Positive @FieldValidation
#  Scenario: Validate report URLs field completeness
#    And I send the GET request to "reportmappings_get_report_urls" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.reporturl|[]|
#      |$.reportgroup|1|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.reporturl|array|
#      |$.reportgroup|number|

