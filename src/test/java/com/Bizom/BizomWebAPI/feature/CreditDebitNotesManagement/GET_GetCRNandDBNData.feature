@BizomWebAPI @CreditDebitNotesManagement @GetCRNandDBNData @SupportingFunctions @PI
Feature: Get CRN and DBN Data API Testing
  As a system user
  I want to test the get CRN and DBN data endpoint
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
  Scenario: TC_01 Get CRN and DBN data without access token
    When I send the GET request to "cdnotes_get_crn_and_dbn_data" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get CRN and DBN data with invalid access token
    And I send the GET request to "cdnotes_get_crn_and_dbn_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get CRN and DBN data with expired access token
    And I send the GET request to "cdnotes_get_crn_and_dbn_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get CRN and DBN data with malformed access token
    And I send the GET request to "cdnotes_get_crn_and_dbn_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get CRN and DBN data with valid access token
    And I send the GET request to "cdnotes_get_crn_and_dbn_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
    And I store the response as "crn_and_dbn_data_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate CRN and DBN data response structure
    And I send the GET request to "cdnotes_get_crn_and_dbn_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate CRN and DBN data array content
    And I send the GET request to "cdnotes_get_crn_and_dbn_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

  @Positive @Performance
  Scenario: TC_08 Performance test for CRN and DBN data endpoint
    And I send the GET request to "cdnotes_get_crn_and_dbn_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

  @Positive @Concurrency
  Scenario: TC_09 Concurrent access test for CRN and DBN data endpoint
    And I send the GET request to "cdnotes_get_crn_and_dbn_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

  @Negative @Validation
  Scenario: TC_10 Get CRN and DBN data with invalid query parameters
    And I send the GET request to "cdnotes_get_crn_and_dbn_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

  @Negative @Validation
  Scenario: TC_11 Get CRN and DBN data with special characters in query parameters
    And I send the GET request to "cdnotes_get_crn_and_dbn_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

  @Negative @Security
  Scenario: TC_12 Get CRN and DBN data with SQL injection attempt
    And I send the GET request to "cdnotes_get_crn_and_dbn_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE cdnotes; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

  @Negative @Boundary
  Scenario: TC_13 Get CRN and DBN data with maximum query parameters
    And I send the GET request to "cdnotes_get_crn_and_dbn_data" endpoint with dynamic access token and query parameters
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
      |$.data|array|

  @Negative @ErrorHandling
  Scenario: TC_14 Get CRN and DBN data with invalid endpoint
    And I send the GET request to "cdnotes_get_crn_and_dbn_data_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_15 Validate CRN and DBN data business logic
    And I send the GET request to "cdnotes_get_crn_and_dbn_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

  @Positive @DataIntegrity
  Scenario: TC_16 Validate CRN and DBN data integrity
    And I send the GET request to "cdnotes_get_crn_and_dbn_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

  @Positive @Regression
  Scenario: TC_17 Regression test for CRN and DBN data endpoint
    And I send the GET request to "cdnotes_get_crn_and_dbn_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

  @Positive @Functional
  Scenario: TC_18 Validate CRN and DBN data response completeness
    And I send the GET request to "cdnotes_get_crn_and_dbn_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

  @Positive @ArrayValidation
  Scenario: TC_19 Validate CRN and DBN data array structure
    And I send the GET request to "cdnotes_get_crn_and_dbn_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

  @Positive @ContentValidation
  Scenario: TC_20 Validate CRN and DBN data content structure
    And I send the GET request to "cdnotes_get_crn_and_dbn_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |data|

  @Positive @LoadTesting
  Scenario: TC_21 Load testing for CRN and DBN data endpoint
    And I send the GET request to "cdnotes_get_crn_and_dbn_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

  @Negative @Timeout
  Scenario: TC_22 Test CRN and DBN data endpoint timeout handling
    And I send the GET request to "cdnotes_get_crn_and_dbn_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

  @Positive @EndToEnd
  Scenario: TC_23 End-to-end CRN and DBN data retrieval workflow
    And I send the GET request to "cdnotes_get_crn_and_dbn_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
    And I store the response as "crn_and_dbn_data_response" name using full path

