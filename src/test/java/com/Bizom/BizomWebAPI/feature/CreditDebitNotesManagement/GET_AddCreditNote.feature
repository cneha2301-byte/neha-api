@BizomWebAPI @CreditDebitNotesManagement @AddCreditNote @SupportingFunctions @PI
Feature: Add Credit Note API Testing
  As a system user
  I want to test the add credit note endpoint
  So that I can ensure proper functionality for adding credit/debit notes in the system

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get add credit note page without access token
    When I send the GET request to "cdnotes_addcreditnote" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get add credit note page with invalid access token
    And I send the GET request to "cdnotes_addcreditnote" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get add credit note page with expired access token
    And I send the GET request to "cdnotes_addcreditnote" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get add credit note page with malformed access token
    And I send the GET request to "cdnotes_addcreditnote" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get add credit note page with valid access token
    And I send the GET request to "cdnotes_addcreditnote" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And I store the response as "add_credit_note_response" name using full path

  @Positive @HTMLValidation
  Scenario: TC_06 Validate add credit note HTML page structure
    And I send the GET request to "cdnotes_addcreditnote" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And validating the response contains the following values
      |Value|
      |html|
      |head|
      |title|
      |body|

  @Positive @ContentValidation
  Scenario: TC_07 Validate add credit note HTML page content
    And I send the GET request to "cdnotes_addcreditnote" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And validating the response contains the following values
      |Value|
      |html|
      |head|
      |title|
      |body|
      |fieldset-heading|
      |Add Credit / Debit note|
      |Credit|
      |Debit|

  @Positive @DataValidation
  Scenario: TC_08 Validate add credit note page fieldset heading
    And I send the GET request to "cdnotes_addcreditnote" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And validating the response contains the following values
      |Value|
      |fieldset-heading|
      |Add Credit / Debit note|

  @Positive @Performance
  Scenario: TC_09 Performance test for add credit note endpoint
    And I send the GET request to "cdnotes_addcreditnote" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for add credit note endpoint
    And I send the GET request to "cdnotes_addcreditnote" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Negative @Validation
  Scenario: TC_11 Get add credit note page with invalid query parameters
    And I send the GET request to "cdnotes_addcreditnote" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Negative @Validation
  Scenario: TC_12 Get add credit note page with special characters in query parameters
    And I send the GET request to "cdnotes_addcreditnote" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Negative @Security
  Scenario: TC_13 Get add credit note page with SQL injection attempt
    And I send the GET request to "cdnotes_addcreditnote" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE cdnotes; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Negative @Boundary
  Scenario: TC_14 Get add credit note page with maximum query parameters
    And I send the GET request to "cdnotes_addcreditnote" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Negative @ErrorHandling
  Scenario: TC_15 Get add credit note page with invalid endpoint
    And I send the GET request to "cdnotes_addcreditnote_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_16 Validate add credit note page business logic
    And I send the GET request to "cdnotes_addcreditnote" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And validating the response contains the following values
      |Value|
      |fieldset-heading|
      |Add Credit / Debit note|
      |Credit|
      |Debit|

  @Positive @DataIntegrity
  Scenario: TC_17 Validate add credit note page data integrity
    And I send the GET request to "cdnotes_addcreditnote" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And validating the response contains the following values
      |Value|
      |html|
      |head|
      |title|
      |body|
      |fieldset-heading|
      |Add Credit / Debit note|

  @Positive @Regression
  Scenario: TC_18 Regression test for add credit note endpoint
    And I send the GET request to "cdnotes_addcreditnote" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And validating the response contains the following values
      |Value|
      |fieldset-heading|
      |Add Credit / Debit note|

  @Positive @Functional
  Scenario: TC_19 Validate add credit note page response completeness
    And I send the GET request to "cdnotes_addcreditnote" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And validating the response contains the following values
      |Value|
      |html|
      |head|
      |title|
      |body|
      |fieldset-heading|
      |Add Credit / Debit note|
      |Credit|
      |Debit|

  @Positive @ObjectValidation
  Scenario: TC_20 Validate add credit note page HTML structure and content
    And I send the GET request to "cdnotes_addcreditnote" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And validating the response contains the following values
      |Value|
      |html|
      |head|
      |title|
      |body|
      |div|
      |class|
      |fieldset-heading|
      |Add Credit / Debit note|

  @Positive @ContentValidation
  Scenario: TC_21 Validate add credit note page content structure
    And I send the GET request to "cdnotes_addcreditnote" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And validating the response contains the following values
      |Value|
      |fieldset-heading|
      |Add Credit / Debit note|
      |Credit|
      |Debit|
      |note|

  @Positive @LoadTesting
  Scenario: TC_22 Load testing for add credit note endpoint
    And I send the GET request to "cdnotes_addcreditnote" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Negative @Timeout
  Scenario: TC_23 Test add credit note endpoint timeout handling
    And I send the GET request to "cdnotes_addcreditnote" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @EndToEnd
  Scenario: TC_24 End-to-end add credit note page data retrieval workflow
    And I send the GET request to "cdnotes_addcreditnote" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And validating the response contains the following values
      |Value|
      |html|
      |head|
      |title|
      |body|
      |div|
      |class|
      |fieldset-heading|
      |Add Credit / Debit note|
      |Credit|
      |Debit|
    And I store the response as "add_credit_note_response" name using full path

