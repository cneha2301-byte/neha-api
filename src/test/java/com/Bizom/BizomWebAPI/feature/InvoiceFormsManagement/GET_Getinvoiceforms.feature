@BizomWebAPI @OS @InvoiceFormsManagement @Getinvoiceforms @UserAccessManagement
Feature: Get Invoice Forms API Testing
  As a system user
  I want to test the get invoice forms endpoint
  So that I can ensure proper functionality and data retrieval for invoice forms management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get invoice forms without access token
    When I send the GET request to "invoiceforms_getinvoiceforms" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get invoice forms with invalid access token
    And I send the GET request to "invoiceforms_getinvoiceforms" endpoint with dynamic access token and query parameters
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
  Scenario: TC_03 Get invoice forms with expired access token
    And I send the GET request to "invoiceforms_getinvoiceforms" endpoint with dynamic access token and query parameters
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
  Scenario: TC_04 Get invoice forms with malformed access token
    And I send the GET request to "invoiceforms_getinvoiceforms" endpoint with dynamic access token and query parameters
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
  Scenario: TC_05 Get invoice forms with valid access token
    And I send the GET request to "invoiceforms_getinvoiceforms" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And I store the response as "invoice_forms_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate invoice forms response structure
    And I send the GET request to "invoiceforms_getinvoiceforms" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.data|object|

  @Positive @DataValidation
  Scenario: TC_07 Validate invoice forms data object structure
    And I send the GET request to "invoiceforms_getinvoiceforms" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data.invoicetemplate2|string|
      |$.data.invoicetemplate3|string|

  @Positive @DataValidation
  Scenario: TC_08 Validate invoice forms data object contains invoice templates
    And I send the GET request to "invoiceforms_getinvoiceforms" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data.invoicetemplate2|string|
      |$.data.invoicetemplate3|string|
      |$.data.invoicetemplate4|string|
      |$.data.invoicetemplate5|string|
      |$.data.parakhinvoicetemplate|string|
      |$.data.signetinvoice|string|
      |$.data.maiyasinvoice|string|

  @Positive @DataValidation
  Scenario: TC_09 Validate invoice forms complete structure
    And I send the GET request to "invoiceforms_getinvoiceforms" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.data|object|
      |$.data.invoicetemplate2|string|
      |$.data.invoicetemplate3|string|

  @Positive @Performance
  Scenario: TC_10 Performance test for invoice forms endpoint
    And I send the GET request to "invoiceforms_getinvoiceforms" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @Concurrency
  Scenario: TC_11 Concurrent access test for invoice forms endpoint
    And I send the GET request to "invoiceforms_getinvoiceforms" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_12 Get invoice forms with invalid query parameters
    And I send the GET request to "invoiceforms_getinvoiceforms" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_13 Get invoice forms with special characters in query parameters
    And I send the GET request to "invoiceforms_getinvoiceforms" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Security
  Scenario: TC_14 Get invoice forms with SQL injection attempt
    And I send the GET request to "invoiceforms_getinvoiceforms" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE invoiceforms; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Boundary
  Scenario: TC_15 Get invoice forms with maximum query parameters
    And I send the GET request to "invoiceforms_getinvoiceforms" endpoint with dynamic access token and query parameters
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
      |$.Result|true|

#  @Negative @ErrorHandling
#  Scenario: TC_16 Get invoice forms with invalid endpoint
#    And I send the GET request to "invoiceforms_getinvoiceforms_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_17 Validate invoice forms business logic
    And I send the GET request to "invoiceforms_getinvoiceforms" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.data|object|

  @Positive @DataIntegrity
  Scenario: TC_18 Validate invoice forms data integrity
    And I send the GET request to "invoiceforms_getinvoiceforms" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.data|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @Regression
  Scenario: TC_19 Regression test for invoice forms endpoint
    And I send the GET request to "invoiceforms_getinvoiceforms" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.data|object|

  @Positive @Functional
  Scenario: TC_20 Validate invoice forms response completeness
    And I send the GET request to "invoiceforms_getinvoiceforms" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.data|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And I store the response as "invoice_forms_response" name using full path
    And validating the response contains the following values
      |Value|
      |Result|
      |data|
      |invoicetemplate2|
      |invoicetemplate3|
      |invoicetemplate4|
      |invoicetemplate5|

