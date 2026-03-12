@BizomWebAPI @OS @PaymentsManagement @GetInvoices @SalesOperations
Feature: Get Invoices API Testing
  As a system user
  I want to test the get invoices endpoint
  So that I can ensure proper functionality and data retrieval for payments management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get invoices without access token
    When I send the GET request to "payments_get_invoices" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |outletId|2|
      |warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get invoices with invalid access token
    And I send the GET request to "payments_get_invoices" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
      |outletId|2|
      |warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get invoices with expired access token
    And I send the GET request to "payments_get_invoices" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
      |outletId|2|
      |warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get invoices with malformed access token
    And I send the GET request to "payments_get_invoices" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
      |outletId|2|
      |warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get invoices with valid outlet ID and warehouse ID
    And I send the GET request to "payments_get_invoices" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|2|
      |warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
    And I store the response as "invoices_response" name using full path

  @Positive @DataValidation
  Scenario: Validate invoices response structure
    And I send the GET request to "payments_get_invoices" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|2|
      |warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Positive @DataValidation
  Scenario: Validate invoices aaData array structure
    And I send the GET request to "payments_get_invoices" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|2|
      |warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData|array|
      |$.aaData[0]|object|

  @Positive @DataValidation
  Scenario: Validate invoices data object field types
    And I send the GET request to "payments_get_invoices" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|2|
      |warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData[0].area_id|string|
      |$.aaData[0].billno|string|
      |$.aaData[0].fordate|string|
      |$.aaData[0].id|string|
      |$.aaData[0].invoiceid|string|
      |$.aaData[0].outlet_id|string|
      |$.aaData[0].pendingamount|string|
      |$.aaData[0].roundedamount|string|
      |$.aaData[0].shippingfromoutlet_id|string|

  @Positive @DataValidation
  Scenario: Validate invoices all data object fields exist
    And I send the GET request to "payments_get_invoices" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|2|
      |warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData[0]|object|
      |$.aaData[0].area_id|string|
      |$.aaData[0].billno|string|
      |$.aaData[0].fordate|string|
      |$.aaData[0].id|string|
      |$.aaData[0].invoiceid|string|
      |$.aaData[0].outlet_id|string|
      |$.aaData[0].pendingamount|string|
      |$.aaData[0].roundedamount|string|
      |$.aaData[0].shippingfromoutlet_id|string|

  @Negative @Validation
  Scenario: Get invoices without outlet ID parameter
    And I send the GET request to "payments_get_invoices" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Negative @Validation
  Scenario: Get invoices without warehouse ID parameter
    And I send the GET request to "payments_get_invoices" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Negative @Validation
  Scenario: Get invoices with invalid outlet ID
    And I send the GET request to "payments_get_invoices" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|999999|
      |warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Negative @Validation
  Scenario: Get invoices with invalid warehouse ID
    And I send the GET request to "payments_get_invoices" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|2|
      |warehouseId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Negative @Validation
  Scenario: Get invoices with non-numeric outlet ID
    And I send the GET request to "payments_get_invoices" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|abc|
      |warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get invoices with non-numeric warehouse ID
    And I send the GET request to "payments_get_invoices" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|2|
      |warehouseId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get invoices with negative outlet ID
    And I send the GET request to "payments_get_invoices" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|-1|
      |warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Negative @Validation
  Scenario: Get invoices with negative warehouse ID
    And I send the GET request to "payments_get_invoices" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|2|
      |warehouseId|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Negative @Validation
  Scenario: Get invoices with zero outlet ID
    And I send the GET request to "payments_get_invoices" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|0|
      |warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Negative @Validation
  Scenario: Get invoices with zero warehouse ID
    And I send the GET request to "payments_get_invoices" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|2|
      |warehouseId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Negative @Validation
  Scenario: Get invoices with special characters in query parameters
    And I send the GET request to "payments_get_invoices" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|<script>alert('XSS')</script>|
      |warehouseId|1 |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get invoices with SQL injection attempt
    And I send the GET request to "payments_get_invoices" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|'; DROP TABLE invoices; --|
      |warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Negative @ErrorHandling
#  Scenario: Get invoices with invalid endpoint
#    And I send the GET request to "payments_get_invoices_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |outletId|2|
#      |warehouseId|1|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: Performance test for invoices endpoint
    And I send the GET request to "payments_get_invoices" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|2|
      |warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: Concurrent access test for invoices endpoint
    And I send the GET request to "payments_get_invoices" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|2|
      |warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Positive @BusinessLogic
  Scenario: Validate invoices business logic
    And I send the GET request to "payments_get_invoices" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|2|
      |warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
      |$.aaData[0]|object|
      |$.aaData[0].area_id|string|
      |$.aaData[0].billno|string|
      |$.aaData[0].fordate|string|
      |$.aaData[0].id|string|
      |$.aaData[0].invoiceid|string|
      |$.aaData[0].outlet_id|string|
      |$.aaData[0].pendingamount|string|
      |$.aaData[0].roundedamount|string|
      |$.aaData[0].shippingfromoutlet_id|string|

  @Positive @DataIntegrity
  Scenario: Validate invoices data integrity
    And I send the GET request to "payments_get_invoices" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|2|
      |warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
      |$.aaData[0]|object|
      |$.aaData[0].area_id|string|
      |$.aaData[0].billno|string|
      |$.aaData[0].fordate|string|
      |$.aaData[0].id|string|
      |$.aaData[0].invoiceid|string|
      |$.aaData[0].outlet_id|string|
      |$.aaData[0].pendingamount|string|
      |$.aaData[0].roundedamount|string|
      |$.aaData[0].shippingfromoutlet_id|string|

  @Positive @Regression
  Scenario: Regression test for invoices endpoint
    And I send the GET request to "payments_get_invoices" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|2|
      |warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Positive @Functional
  Scenario: Validate invoices response completeness
    And I send the GET request to "payments_get_invoices" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|2|
      |warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData|array|
      |$.aaData[0]|object|
      |$.aaData[0].area_id|string|
      |$.aaData[0].billno|string|
      |$.aaData[0].fordate|string|
      |$.aaData[0].id|string|
      |$.aaData[0].invoiceid|string|
      |$.aaData[0].outlet_id|string|
      |$.aaData[0].pendingamount|string|
      |$.aaData[0].roundedamount|string|
      |$.aaData[0].shippingfromoutlet_id|string|

  @Positive @ArrayValidation
  Scenario: Validate invoices array structure and content types
    And I send the GET request to "payments_get_invoices" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|2|
      |warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData|array|
      |$.aaData[0]|object|
      |$.aaData[1]|object|
      |$.aaData[0].area_id|string|
      |$.aaData[0].billno|string|
      |$.aaData[0].id|string|
      |$.aaData[0].invoiceid|string|
      |$.aaData[0].outlet_id|string|

#  @Positive @ContentValidation
#  Scenario: Validate invoices content structure
#    And I send the GET request to "payments_get_invoices" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |outletId|2|
#      |warehouseId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response contains the following values
#      |Value|
#      |sEcho|
#      |iTotalRecords|
#      |iTotalDisplayRecords|
#      |aaData|
#      |area_id|
#      |billno|
#      |fordate|
#      |id|
#      |invoiceid|
#      |outlet_id|
#      |pendingamount|
#      |roundedamount|
#      |shippingfromoutlet_id|

  @Positive @LoadTesting
  Scenario: Load testing for invoices endpoint
    And I send the GET request to "payments_get_invoices" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|2|
      |warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Negative @Timeout
  Scenario: Test invoices endpoint timeout handling
    And I send the GET request to "payments_get_invoices" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|2|
      |warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Positive @EndToEnd
  Scenario: End-to-end invoices data retrieval workflow
    And I send the GET request to "payments_get_invoices" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|2|
      |warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "invoices_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
      |$.aaData[0]|object|
      |$.aaData[0].area_id|string|
      |$.aaData[0].billno|string|
      |$.aaData[0].fordate|string|
      |$.aaData[0].id|string|
      |$.aaData[0].invoiceid|string|
      |$.aaData[0].outlet_id|string|
      |$.aaData[0].pendingamount|string|
      |$.aaData[0].roundedamount|string|
      |$.aaData[0].shippingfromoutlet_id|string|

  @Positive @DataTablesValidation
  Scenario: Validate invoices DataTables structure
    And I send the GET request to "payments_get_invoices" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|2|
      |warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Positive @ParameterValidation
  Scenario: Validate invoices with different outlet and warehouse ID combinations
    And I send the GET request to "payments_get_invoices" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|1|
      |warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Positive @FieldTypeValidation
  Scenario: Validate invoices all field data types
    And I send the GET request to "payments_get_invoices" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|2|
      |warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
      |$.aaData[0]|object|
      |$.aaData[0].area_id|string|
      |$.aaData[0].billno|string|
      |$.aaData[0].fordate|string|
      |$.aaData[0].id|string|
      |$.aaData[0].invoiceid|string|
      |$.aaData[0].outlet_id|string|
      |$.aaData[0].pendingamount|string|
      |$.aaData[0].roundedamount|string|
      |$.aaData[0].shippingfromoutlet_id|string|

