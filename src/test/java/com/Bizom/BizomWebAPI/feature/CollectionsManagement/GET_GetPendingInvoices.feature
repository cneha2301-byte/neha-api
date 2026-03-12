@BizomWebAPI @OS @CollectionsManagement @GetPendingInvoices @ReportsAnalyticsGroup2
Feature: Get Pending Invoices API Testing
  As a system user
  I want to test the get pending invoices endpoint
  So that I can ensure proper functionality and data retrieval for pending invoices in collections management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get pending invoices without access token
    When I send the GET request to "collections_get_pending_invoices" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get pending invoices with invalid access token
    And I send the GET request to "collections_get_pending_invoices" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get pending invoices with expired access token
    And I send the GET request to "collections_get_pending_invoices" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get pending invoices with malformed access token
    And I send the GET request to "collections_get_pending_invoices" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get pending invoices with valid access token
    And I send the GET request to "collections_get_pending_invoices" endpoint with dynamic access token and query parameters
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
    And I store the response as "pending_invoices_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate pending invoices response structure
    And I send the GET request to "collections_get_pending_invoices" endpoint with dynamic access token and query parameters
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
  Scenario: TC_07 Validate pending invoices response content
    And I send the GET request to "collections_get_pending_invoices" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|"0"|
      |$.recordsTotal|"0"|
      |$.recordsFiltered|"0"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

  @Positive @DataValidation
  Scenario: TC_08 Validate pending invoices array structure
    And I send the GET request to "collections_get_pending_invoices" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

  @Positive @Performance
  Scenario: TC_09 Performance test for pending invoices endpoint
    And I send the GET request to "collections_get_pending_invoices" endpoint with dynamic access token and query parameters
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
  Scenario: TC_10 Concurrent access test for pending invoices endpoint
    And I send the GET request to "collections_get_pending_invoices" endpoint with dynamic access token and query parameters
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

  @Positive @BusinessLogic
  Scenario: TC_11 Validate pending invoices business logic
    And I send the GET request to "collections_get_pending_invoices" endpoint with dynamic access token and query parameters
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

  @Positive @DataIntegrity
  Scenario: TC_12 Validate pending invoices data integrity
    And I send the GET request to "collections_get_pending_invoices" endpoint with dynamic access token and query parameters
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
  Scenario: TC_13 Regression test for pending invoices endpoint
    And I send the GET request to "collections_get_pending_invoices" endpoint with dynamic access token and query parameters
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
  Scenario: TC_14 Validate pending invoices response completeness
    And I send the GET request to "collections_get_pending_invoices" endpoint with dynamic access token and query parameters
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
      |$.recordsTotal|"0"|
      |$.recordsFiltered|"0"|

  @Positive @ArrayValidation
  Scenario: TC_15 Validate pending invoices array structure
    And I send the GET request to "collections_get_pending_invoices" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

  @Positive @ContentValidation
  Scenario: TC_16 Validate pending invoices content structure
    And I send the GET request to "collections_get_pending_invoices" endpoint with dynamic access token and query parameters
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
  Scenario: TC_17 Load testing for pending invoices endpoint
    And I send the GET request to "collections_get_pending_invoices" endpoint with dynamic access token and query parameters
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
  Scenario: TC_18 Test pending invoices endpoint timeout handling
    And I send the GET request to "collections_get_pending_invoices" endpoint with dynamic access token and query parameters
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
  Scenario: TC_19 End-to-end pending invoices retrieval workflow
    And I send the GET request to "collections_get_pending_invoices" endpoint with dynamic access token and query parameters
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
    And I store the response as "pending_invoices_response" name using full path

  @Negative @Validation
  Scenario: TC_20 Get pending invoices with invalid query parameters
    And I send the GET request to "collections_get_pending_invoices" endpoint with dynamic access token and query parameters
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
  Scenario: TC_21 Get pending invoices with special characters in query parameters
    And I send the GET request to "collections_get_pending_invoices" endpoint with dynamic access token and query parameters
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
  Scenario: TC_22 Get pending invoices with SQL injection attempt
    And I send the GET request to "collections_get_pending_invoices" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE collections; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.data|array|

  @Negative @ErrorHandling
  Scenario: TC_23 Get pending invoices with invalid endpoint
    And I send the GET request to "collections_get_pending_invoices_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

