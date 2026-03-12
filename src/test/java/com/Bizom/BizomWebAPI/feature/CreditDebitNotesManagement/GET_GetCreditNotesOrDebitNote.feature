@BizomWebAPI @CreditDebitNotesManagement @GetCreditNotesOrDebitNote @SupportingFunctions @PI
Feature: Get Credit Notes or Debit Note API Testing
  As a system user
  I want to test the get credit notes or debit note endpoint with date range and type filters
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
  Scenario: TC_01 Get credit notes or debit note without access token
    When I send the GET request to "cdnotes_get_credit_notes_or_debit_note" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |fromdate|2025-10-01|
      |todate|2025-10-02|
      |type|credit|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get credit notes or debit note with invalid access token
    And I send the GET request to "cdnotes_get_credit_notes_or_debit_note" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
      |fromdate|2025-10-01|
      |todate|2025-10-02|
      |type|credit|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get credit notes or debit note with expired access token
    And I send the GET request to "cdnotes_get_credit_notes_or_debit_note" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
      |fromdate|2025-10-01|
      |todate|2025-10-02|
      |type|credit|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get credit notes or debit note with malformed access token
    And I send the GET request to "cdnotes_get_credit_notes_or_debit_note" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
      |fromdate|2025-10-01|
      |todate|2025-10-02|
      |type|credit|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get credit notes with valid access token and date range
    And I send the GET request to "cdnotes_get_credit_notes_or_debit_note" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|2025-10-01|
      |todate|2025-10-02|
      |type|credit|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|object|
      |$.data|object|
      |$.data.Data|array|
    And I store the response as "credit_notes_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate credit notes response structure
    And I send the GET request to "cdnotes_get_credit_notes_or_debit_note" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|2025-10-01|
      |todate|2025-10-02|
      |type|credit|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|object|
      |$.data|object|
      |$.data.Data|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate credit notes response content
    And I send the GET request to "cdnotes_get_credit_notes_or_debit_note" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|2025-10-01|
      |todate|2025-10-02|
      |type|credit|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Reason.error|string|
      |$.Reason.message|string|
      |$.data.Data|array|

  @Positive @DataValidation
  Scenario: TC_08 Validate credit notes transaction data structure
    And I send the GET request to "cdnotes_get_credit_notes_or_debit_note" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|2025-10-01|
      |todate|2025-10-02|
      |type|credit|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data.Data[0].id|string|
      |$.data.Data[0].transactionid|string|
      |$.data.Data[0].foroutlet_id|string|
      |$.data.Data[0].outlet_id|string|
      |$.data.Data[0].amount|string|
      |$.data.Data[0].remainingamount|string|
      |$.data.Data[0].is_redeemed|string|
      |$.data.Data[0].created|string|
      |$.data.Data[0].modified|string|
      |$.data.Data[0].user_id|string|
      |$.data.Data[0].is_outletbalancededucted|string|
      |$.data.Data[0].transactiontype|string|
      |$.data.Data[0].transactiontype_id|string|

  @Positive @DataValidation
  Scenario: TC_09 Get debit notes with valid access token and date range
    And I send the GET request to "cdnotes_get_credit_notes_or_debit_note" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|2025-10-01|
      |todate|2025-10-02|
      |type|debit|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|object|
      |$.data.Data|array|

  @Positive @Performance
  Scenario: TC_10 Performance test for credit notes endpoint
    And I send the GET request to "cdnotes_get_credit_notes_or_debit_note" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|2025-10-01|
      |todate|2025-10-02|
      |type|credit|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.data.Data|array|

  @Positive @Concurrency
  Scenario: TC_11 Concurrent access test for credit notes endpoint
    And I send the GET request to "cdnotes_get_credit_notes_or_debit_note" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|2025-10-01|
      |todate|2025-10-02|
      |type|credit|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.data.Data|array|

  @Positive @BusinessLogic
  Scenario: TC_12 Validate credit notes business logic with different date ranges
    And I send the GET request to "cdnotes_get_credit_notes_or_debit_note" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|2025-09-01|
      |todate|2025-10-31|
      |type|credit|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.data.Data|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @DataIntegrity
  Scenario: TC_13 Validate credit notes data integrity
    And I send the GET request to "cdnotes_get_credit_notes_or_debit_note" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|2025-10-01|
      |todate|2025-10-02|
      |type|credit|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.data.Data|array|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |data|

  @Positive @Regression
  Scenario: TC_14 Regression test for credit notes endpoint
    And I send the GET request to "cdnotes_get_credit_notes_or_debit_note" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|2025-10-01|
      |todate|2025-10-02|
      |type|credit|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.data.Data|array|

  @Positive @Functional
  Scenario: TC_15 Validate credit notes response completeness
    And I send the GET request to "cdnotes_get_credit_notes_or_debit_note" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|2025-10-01|
      |todate|2025-10-02|
      |type|credit|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|object|
      |$.data|object|
      |$.data.Data|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @ArrayValidation
  Scenario: TC_16 Validate credit notes Data array structure
    And I send the GET request to "cdnotes_get_credit_notes_or_debit_note" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|2025-10-01|
      |todate|2025-10-02|
      |type|credit|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data.Data|array|

  @Positive @ContentValidation
  Scenario: TC_17 Validate credit notes content structure
    And I send the GET request to "cdnotes_get_credit_notes_or_debit_note" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|2025-10-01|
      |todate|2025-10-02|
      |type|credit|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |data|
      |Data|
      |transactionid|
      |amount|
      |remainingamount|

  @Positive @LoadTesting
  Scenario: TC_18 Load testing for credit notes endpoint
    And I send the GET request to "cdnotes_get_credit_notes_or_debit_note" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|2025-10-01|
      |todate|2025-10-02|
      |type|credit|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.data.Data|array|

  @Positive @Timeout
  Scenario: TC_19 Test credit notes endpoint timeout handling
    And I send the GET request to "cdnotes_get_credit_notes_or_debit_note" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|2025-10-01|
      |todate|2025-10-02|
      |type|credit|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.data.Data|array|

  @Positive @EndToEnd
  Scenario: TC_20 End-to-end credit notes retrieval workflow
    And I send the GET request to "cdnotes_get_credit_notes_or_debit_note" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|2025-10-01|
      |todate|2025-10-02|
      |type|credit|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
     |$.Result|boolean|
      |$.Reason|object|
      |$.data|object|
      |$.data.Data|array|
    And I store the response as "credit_notes_response" name using full path

  @Negative @Validation
  Scenario: TC_21 Get credit notes with missing fromdate parameter
    And I send the GET request to "cdnotes_get_credit_notes_or_debit_note" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |todate|2025-10-02|
      |type|credit|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.data.Data|array|

  @Negative @Validation
  Scenario: TC_22 Get credit notes with missing todate parameter
    And I send the GET request to "cdnotes_get_credit_notes_or_debit_note" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|2025-10-01|
      |type|credit|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
     |$.Result|boolean|
      |$.data.Data|array|

  @Negative @Validation
  Scenario: TC_23 Get credit notes with missing type parameter
    And I send the GET request to "cdnotes_get_credit_notes_or_debit_note" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|2025-10-01|
      |todate|2025-10-02|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.data.Data|array|

  @Negative @Validation
  Scenario: TC_24 Get credit notes with invalid date format
    And I send the GET request to "cdnotes_get_credit_notes_or_debit_note" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|invalid-date|
      |todate|2025-10-02|
      |type|credit|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.data.Data|array|

  @Negative @Validation
  Scenario: TC_25 Get credit notes with invalid type value
    And I send the GET request to "cdnotes_get_credit_notes_or_debit_note" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|2025-10-01|
      |todate|2025-10-02|
      |type|invalid_type|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.data.Data|array|

  @Negative @Validation
  Scenario: TC_26 Get credit notes with reversed date range
    And I send the GET request to "cdnotes_get_credit_notes_or_debit_note" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|2025-10-02|
      |todate|2025-10-01|
      |type|credit|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.data.Data|array|

  @Negative @Validation
  Scenario: TC_27 Get credit notes with special characters in query parameters
    And I send the GET request to "cdnotes_get_credit_notes_or_debit_note" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|<script>alert('XSS')</script>|
      |todate|2025-10-02|
      |type|credit|
    Then I should see the response code as "500"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_28 Get credit notes with invalid endpoint
    And I send the GET request to "cdnotes_get_credit_notes_or_debit_note_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|2025-10-01|
      |todate|2025-10-02|
      |type|credit|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

