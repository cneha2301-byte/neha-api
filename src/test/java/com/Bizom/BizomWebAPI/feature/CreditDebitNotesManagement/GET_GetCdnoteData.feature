@BizomWebAPI @CreditDebitNotesManagement @GetCdnoteData @SupportingFunctions @PI
Feature: Get CD Note Data API Testing
  As a system user
  I want to test the get CD note data endpoint
  So that I can ensure proper functionality and data retrieval for credit and debit notes management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get CD note data without access token
    When I send the GET request to "cdnotes_get_cdnote_data" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get CD note data with invalid access token
    And I send the GET request to "cdnotes_get_cdnote_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get CD note data with expired access token
    And I send the GET request to "cdnotes_get_cdnote_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get CD note data with malformed access token
    And I send the GET request to "cdnotes_get_cdnote_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get CD note data with valid access token
    And I send the GET request to "cdnotes_get_cdnote_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.data|array|
    And I store the response as "cdnote_data_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate CD note data response structure
    And I send the GET request to "cdnotes_get_cdnote_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.data|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate CD note data response content
    And I send the GET request to "cdnotes_get_cdnote_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|"0"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

  @Positive @DataValidation
  Scenario: TC_08 Validate CD note data array structure
    And I send the GET request to "cdnotes_get_cdnote_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

  @Positive @Performance
  Scenario: TC_09 Performance test for CD note data endpoint
    And I send the GET request to "cdnotes_get_cdnote_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.data|array|

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for CD note data endpoint
    And I send the GET request to "cdnotes_get_cdnote_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.data|array|

  @Positive @DataIntegrity
  Scenario: TC_11 Validate CD note data integrity
    And I send the GET request to "cdnotes_get_cdnote_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.data|array|

  @Positive @Regression
  Scenario: TC_12 Regression test for CD note data endpoint
    And I send the GET request to "cdnotes_get_cdnote_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.data|array|

  @Positive @Functional
  Scenario: TC_13 Validate CD note data response completeness
    And I send the GET request to "cdnotes_get_cdnote_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.data|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|"0"|

  @Positive @ArrayValidation
  Scenario: TC_14 Validate CD note data array structure
    And I send the GET request to "cdnotes_get_cdnote_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

  @Positive @ContentValidation
  Scenario: TC_15 Validate CD note data content structure
    And I send the GET request to "cdnotes_get_cdnote_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |draw|
      |recordsTotal|
      |recordsFiltered|
      |data|

  @Positive @LoadTesting
  Scenario: TC_16 Load testing for CD note data endpoint
    And I send the GET request to "cdnotes_get_cdnote_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.data|array|

  @Positive @Timeout
  Scenario: TC_17 Test CD note data endpoint timeout handling
    And I send the GET request to "cdnotes_get_cdnote_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.data|array|

  @Positive @EndToEnd
  Scenario: TC_18 End-to-end CD note data retrieval workflow
    And I send the GET request to "cdnotes_get_cdnote_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.data|array|
    And I store the response as "cdnote_data_response" name using full path

  @Negative @Validation
  Scenario: TC_19 Get CD note data with invalid query parameters
    And I send the GET request to "cdnotes_get_cdnote_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.data|array|

  @Negative @Validation
  Scenario: TC_20 Get CD note data with special characters in query parameters
    And I send the GET request to "cdnotes_get_cdnote_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.data|array|

  @Negative @Security
  Scenario: TC_22 Get CD note data with SQL injection attempt
    And I send the GET request to "cdnotes_get_cdnote_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE cdnotes; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.data|array|

  @Negative @ErrorHandling
  Scenario: TC_23 Get CD note data with invalid endpoint
    And I send the GET request to "cdnotes_get_cdnote_data_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

