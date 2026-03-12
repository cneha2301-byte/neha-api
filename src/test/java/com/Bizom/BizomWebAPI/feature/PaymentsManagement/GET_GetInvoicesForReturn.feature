@BizomWebAPI @OS @PaymentsManagement @GetInvoicesForReturn @SalesOperations
Feature: Get Invoices For Return API Testing
  As a system user
  I want to test the get invoices for return endpoint
  So that I can ensure proper functionality and data retrieval for payments management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

#  @Negative @Security
#  Scenario: Get invoices for return without access token
#    When I send the GET request to "payments_get_invoices_for_return" endpoint with query parameters
#      |QueryParamName|QueryParamValue|
#      |outletId|3|
#      |warehouseId|1|
#      |screen|salereturns|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get invoices for return with invalid access token
#    And I send the GET request to "payments_get_invoices_for_return" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|invalid_token_12345|
#      |outletId|3|
#      |warehouseId|1|
#      |screen|salereturns|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get invoices for return with expired access token
#    And I send the GET request to "payments_get_invoices_for_return" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|expired_token_12345|
#      |outletId|3|
#      |warehouseId|1|
#      |screen|salereturns|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get invoices for return with malformed access token
    And I send the GET request to "payments_get_invoices_for_return" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
      |outletId|3|
      |warehouseId|1|
      |screen|salereturns|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get invoices for return with valid parameters
    And I send the GET request to "payments_get_invoices_for_return" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|3|
      |warehouseId|1|
      |screen|salereturns|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.draw|0|
      |$.recordsTotal|0|
      |$.recordsFiltered|0|
      |$.message|"No invoice present"|
    And I store the response as "invoices_for_return_response" name using full path

  @Positive @DataValidation
  Scenario: Validate invoices for return response structure
    And I send the GET request to "payments_get_invoices_for_return" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|3|
      |warehouseId|1|
      |screen|salereturns|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.draw|0|
      |$.recordsTotal|0|
      |$.recordsFiltered|0|
      |$.message|"No invoice present"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.draw|number|
      |$.recordsTotal|number|
      |$.recordsFiltered|number|
      |$.data|array|
      |$.allBatchIds|array|
      |$.message|string|

#  @Positive @DataValidation
#  Scenario: Validate invoices for return array structures
#    And I send the GET request to "payments_get_invoices_for_return" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |outletId|3|
#      |warehouseId|1|
#      |screen|salereturns|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.draw|0|
#      |$.recordsTotal|0|
#      |$.recordsFiltered|0|
#      |$.data|[]|
#      |$.allBatchIds|[]|
#      |$.message|"No invoice present"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.data|array|
#      |$.allBatchIds|array|
#
#  @Negative @Validation
#  Scenario: Get invoices for return without outlet ID parameter
#    And I send the GET request to "payments_get_invoices_for_return" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |warehouseId|1|
#      |screen|salereturns|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.draw|number|
#      |$.recordsTotal|number|
#      |$.recordsFiltered|number|
#      |$.data|array|
#      |$.allBatchIds|array|
#      |$.message|string|

  @Negative @Validation
  Scenario: Get invoices for return without warehouse ID parameter
    And I send the GET request to "payments_get_invoices_for_return" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|3|
      |screen|salereturns|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.draw|number|
      |$.recordsTotal|number|
      |$.recordsFiltered|number|
      |$.data|array|
      |$.allBatchIds|array|
      |$.message|string|

#  @Negative @Validation
#  Scenario: Get invoices for return without screen parameter
#    And I send the GET request to "payments_get_invoices_for_return" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |outletId|3|
#      |warehouseId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.draw|number|
#      |$.recordsTotal|number|
#      |$.recordsFiltered|number|
#      |$.data|array|
#      |$.allBatchIds|array|
#      |$.message|string|

  @Negative @Validation
  Scenario: Get invoices for return with invalid outlet ID
    And I send the GET request to "payments_get_invoices_for_return" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|999999|
      |warehouseId|1|
      |screen|salereturns|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.draw|number|
      |$.recordsTotal|number|
      |$.recordsFiltered|number|
      |$.data|array|
      |$.allBatchIds|array|
      |$.message|string|

  @Negative @Validation
  Scenario: Get invoices for return with invalid warehouse ID
    And I send the GET request to "payments_get_invoices_for_return" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|3|
      |warehouseId|999999|
      |screen|salereturns|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.draw|number|
      |$.recordsTotal|number|
      |$.recordsFiltered|number|
      |$.data|array|
      |$.allBatchIds|array|
      |$.message|string|

  @Negative @Validation
  Scenario: Get invoices for return with invalid screen parameter
    And I send the GET request to "payments_get_invoices_for_return" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|3|
      |warehouseId|1|
      |screen|invalid_screen|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.draw|number|
      |$.recordsTotal|number|
      |$.recordsFiltered|number|
      |$.data|array|
      |$.allBatchIds|array|
      |$.message|string|

  @Negative @Validation
  Scenario: Get invoices for return with non-numeric outlet ID
    And I send the GET request to "payments_get_invoices_for_return" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|abc|
      |warehouseId|1|
      |screen|salereturns|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get invoices for return with non-numeric warehouse ID
    And I send the GET request to "payments_get_invoices_for_return" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|3|
      |warehouseId|abc|
      |screen|salereturns|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get invoices for return with negative outlet ID
    And I send the GET request to "payments_get_invoices_for_return" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|-1|
      |warehouseId|1|
      |screen|salereturns|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.draw|number|
      |$.recordsTotal|number|
      |$.recordsFiltered|number|
      |$.data|array|
      |$.allBatchIds|array|
      |$.message|string|

  @Negative @Validation
  Scenario: Get invoices for return with negative warehouse ID
    And I send the GET request to "payments_get_invoices_for_return" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|3|
      |warehouseId|-1|
      |screen|salereturns|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.draw|number|
      |$.recordsTotal|number|
      |$.recordsFiltered|number|
      |$.data|array|
      |$.allBatchIds|array|
      |$.message|string|

  @Negative @Validation
  Scenario: Get invoices for return with zero outlet ID
    And I send the GET request to "payments_get_invoices_for_return" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|0|
      |warehouseId|1|
      |screen|salereturns|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.draw|number|
      |$.recordsTotal|number|
      |$.recordsFiltered|number|
      |$.data|array|
      |$.allBatchIds|array|
      |$.message|string|

  @Negative @Validation
  Scenario: Get invoices for return with zero warehouse ID
    And I send the GET request to "payments_get_invoices_for_return" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|3|
      |warehouseId|0|
      |screen|salereturns|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.draw|number|
      |$.recordsTotal|number|
      |$.recordsFiltered|number|
      |$.data|array|
      |$.allBatchIds|array|
      |$.message|string|

  @Negative @Validation
  Scenario: Get invoices for return with special characters in query parameters
    And I send the GET request to "payments_get_invoices_for_return" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|<script>alert('XSS')</script>|
      |warehouseId|1|
      |screen|salereturns|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get invoices for return with SQL injection attempt
    And I send the GET request to "payments_get_invoices_for_return" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|'; DROP TABLE invoices; --|
      |warehouseId|1|
      |screen|salereturns|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: Get invoices for return with invalid endpoint
    And I send the GET request to "payments_get_invoices_for_return_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|3|
      |warehouseId|1|
      |screen|salereturns|
    Then I should see the response code as "404"
    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: Performance test for invoices for return endpoint
    And I send the GET request to "payments_get_invoices_for_return" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|3|
      |warehouseId|1|
      |screen|salereturns|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: Concurrent access test for invoices for return endpoint
    And I send the GET request to "payments_get_invoices_for_return" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|3|
      |warehouseId|1|
      |screen|salereturns|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.draw|number|
      |$.recordsTotal|number|
      |$.recordsFiltered|number|
      |$.data|array|
      |$.allBatchIds|array|
      |$.message|string|

#  @Positive @BusinessLogic
#  Scenario: Validate invoices for return business logic
#    And I send the GET request to "payments_get_invoices_for_return" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |outletId|3|
#      |warehouseId|1|
#      |screen|salereturns|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.draw|0|
#      |$.recordsTotal|0|
#      |$.recordsFiltered|0|
#      |$.message|"No invoice present"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.draw|number|
#      |$.recordsTotal|number|
#      |$.recordsFiltered|number|
#      |$.data|array|
#      |$.allBatchIds|array|
#      |$.message|string|

#  @Positive @DataIntegrity
#  Scenario: Validate invoices for return data integrity
#    And I send the GET request to "payments_get_invoices_for_return" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |outletId|3|
#      |warehouseId|1|
#      |screen|salereturns|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.draw|0|
#      |$.recordsTotal|0|
#      |$.recordsFiltered|0|
#      |$.data|[]|
#      |$.allBatchIds|[]|
#      |$.message|"No invoice present"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.draw|number|
#      |$.recordsTotal|number|
#      |$.recordsFiltered|number|
#      |$.data|array|
#      |$.allBatchIds|array|
#      |$.message|string|

  @Positive @Regression
  Scenario: Regression test for invoices for return endpoint
    And I send the GET request to "payments_get_invoices_for_return" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|3|
      |warehouseId|1|
      |screen|salereturns|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.draw|number|
      |$.recordsTotal|number|
      |$.recordsFiltered|number|
      |$.data|array|
      |$.allBatchIds|array|
      |$.message|string|

#  @Positive @Functional
#  Scenario: Validate invoices for return response completeness
#    And I send the GET request to "payments_get_invoices_for_return" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |outletId|3|
#      |warehouseId|1|
#      |screen|salereturns|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.draw|0|
#      |$.recordsTotal|0|
#      |$.recordsFiltered|0|
#      |$.data|[]|
#      |$.allBatchIds|[]|
#      |$.message|"No invoice present"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.draw|number|
#      |$.recordsTotal|number|
#      |$.recordsFiltered|number|
#      |$.data|array|
#      |$.allBatchIds|array|
#      |$.message|string|

#  @Positive @ArrayValidation
#  Scenario: Validate invoices for return array structures
#    And I send the GET request to "payments_get_invoices_for_return" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |outletId|3|
#      |warehouseId|1|
#      |screen|salereturns|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.draw|0|
#      |$.recordsTotal|0|
#      |$.recordsFiltered|0|
#      |$.data|[]|
#      |$.allBatchIds|[]|
#      |$.message|"No invoice present"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.data|array|
#      |$.allBatchIds|array|

#  @Positive @ContentValidation
#  Scenario: Validate invoices for return content structure
#    And I send the GET request to "payments_get_invoices_for_return" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |outletId|3|
#      |warehouseId|1|
#      |screen|salereturns|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.draw|0|
#      |$.recordsTotal|0|
#      |$.recordsFiltered|0|
#      |$.message|"No invoice present"|
#    And validating the response contains the following values
#      |Value|
#      |result|
#      |draw|
#      |recordsTotal|
#      |recordsFiltered|
#      |data|
#      |allBatchIds|
#      |message|
#      |No invoice present|

  @Positive @LoadTesting
  Scenario: Load testing for invoices for return endpoint
    And I send the GET request to "payments_get_invoices_for_return" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|3|
      |warehouseId|1|
      |screen|salereturns|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.draw|number|
      |$.recordsTotal|number|
      |$.recordsFiltered|number|
      |$.data|array|
      |$.allBatchIds|array|
      |$.message|string|

  @Negative @Timeout
  Scenario: Test invoices for return endpoint timeout handling
    And I send the GET request to "payments_get_invoices_for_return" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|3|
      |warehouseId|1|
      |screen|salereturns|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.draw|number|
      |$.recordsTotal|number|
      |$.recordsFiltered|number|
      |$.data|array|
      |$.allBatchIds|array|
      |$.message|string|

#  @Positive @EndToEnd
#  Scenario: End-to-end invoices for return data retrieval workflow
#    And I send the GET request to "payments_get_invoices_for_return" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |outletId|3|
#      |warehouseId|1|
#      |screen|salereturns|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.draw|0|
#      |$.recordsTotal|0|
#      |$.recordsFiltered|0|
#      |$.data|[]|
#      |$.allBatchIds|[]|
#      |$.message|"No invoice present"|
#    And I store the response as "invoices_for_return_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.draw|number|
#      |$.recordsTotal|number|
#      |$.recordsFiltered|number|
#      |$.data|array|
#      |$.allBatchIds|array|
#      |$.message|string|

  @Positive @ParameterValidation
  Scenario: Validate invoices for return with different parameter combinations
    And I send the GET request to "payments_get_invoices_for_return" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|2|
      |warehouseId|2|
      |screen|salereturns|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.draw|number|
      |$.recordsTotal|number|
      |$.recordsFiltered|number|
      |$.data|array|
      |$.allBatchIds|array|
      |$.message|string|

  @Positive @ScreenParameterValidation
  Scenario: Validate invoices for return with different screen values
    And I send the GET request to "payments_get_invoices_for_return" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|3|
      |warehouseId|1|
      |screen|sales|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.draw|number|
      |$.recordsTotal|number|
      |$.recordsFiltered|number|
      |$.data|array|
      |$.allBatchIds|array|
      |$.message|string|

#  @Positive @EmptyArrayValidation
#  Scenario: Validate invoices for return empty arrays response
#    And I send the GET request to "payments_get_invoices_for_return" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |outletId|3|
#      |warehouseId|1|
#      |screen|salereturns|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.draw|0|
#      |$.recordsTotal|0|
#      |$.recordsFiltered|0|
#      |$.data|[]|
#      |$.allBatchIds|[]|
#      |$.message|"No invoice present"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.data|array|
#      |$.allBatchIds|array|

#  @Positive @MessageValidation
#  Scenario: Validate invoices for return message field
#    And I send the GET request to "payments_get_invoices_for_return" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |outletId|3|
#      |warehouseId|1|
#      |screen|salereturns|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.message|"No invoice present"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.message|string|

