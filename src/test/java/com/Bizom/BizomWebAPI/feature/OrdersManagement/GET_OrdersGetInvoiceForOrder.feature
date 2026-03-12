@BizomWebAPI @OS @OrdersManagement @Orders @GETOrderInvoices @WorkflowAutomation
Feature: Orders - Get Invoice For Order
  This feature validates the /orders/getinvoicefororder endpoint which returns invoice ids for orders.

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get invoice for order without access token
    When I send the GET request to "orders_get_invoice_for_order" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get invoice for order with invalid access token
    And I send the GET request to "orders_get_invoice_for_order" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get invoice for order with expired access token
    And I send the GET request to "orders_get_invoice_for_order" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get invoice for order with malformed access token
    And I send the GET request to "orders_get_invoice_for_order" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get invoice for order with valid access token
    And I send the GET request to "orders_get_invoice_for_order" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.invoiceid|array|
      |$.invoiceid[0]|string|
    And verify response time is less than "2500" milliseconds

  @Positive @DataValidation
  Scenario: TC_06 Validate invoice array is present and non-empty
    And I send the GET request to "orders_get_invoice_for_order" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And verify response time is less than "2500" milliseconds

  @Positive @ArrayValidation
  Scenario: TC_07 Validate invoice ids array structure
    And I send the GET request to "orders_get_invoice_for_order" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.invoiceid|array|
      |$.invoiceid[0]|string|
      |$.invoiceid[1]|string|
    And verify response time is less than "2500" milliseconds

  @Positive @ContentValidation
  Scenario: TC_08 Validate role invoice response contains expected keys
    And I send the GET request to "orders_get_invoice_for_order" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |invoiceid|
    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: TC_09 Performance test for get invoice for order endpoint
    And I send the GET request to "orders_get_invoice_for_order" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for get invoice for order endpoint
    And I send the GET request to "orders_get_invoice_for_order" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_11 Get invoice for order with invalid query parameters
    And I send the GET request to "orders_get_invoice_for_order" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_12 Get invoice for order with special characters in query parameters
    And I send the GET request to "orders_get_invoice_for_order" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_13 Get invoice for order with SQL injection attempt
    And I send the GET request to "orders_get_invoice_for_order" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE invoices; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: TC_14 Get invoice for order with maximum query parameters
    And I send the GET request to "orders_get_invoice_for_order" endpoint with dynamic access token and query parameters
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
#  Scenario: TC_15 Get invoice for order with invalid endpoint
#    And I send the GET request to "orders_get_invoice_for_order_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_16 Validate invoice for order business logic
    And I send the GET request to "orders_get_invoice_for_order" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.invoiceid[0]|string|
    And verify response time is less than "2500" milliseconds

  @Positive @DataIntegrity
  Scenario: TC_17 Validate invoice for order data integrity
    And I send the GET request to "orders_get_invoice_for_order" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.invoiceid[1]|string|
    And verify response time is less than "2500" milliseconds

  @Positive @Regression
  Scenario: TC_18 Regression test for get invoice for order endpoint
    And I send the GET request to "orders_get_invoice_for_order" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Functional
  Scenario: TC_19 Validate invoice for order response completeness
    And I send the GET request to "orders_get_invoice_for_order" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|
      |$.invoiceid|array|
    And verify response time is less than "2500" milliseconds

  @Positive @LoadTesting
  Scenario: TC_20 Load testing for get invoice for order endpoint
    And I send the GET request to "orders_get_invoice_for_order" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Negative @Timeout
  Scenario: TC_21 Test get invoice for order endpoint timeout handling
    And I send the GET request to "orders_get_invoice_for_order" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds

  @Positive @EndToEnd
  Scenario: TC_22 End-to-end invoice retrieval workflow
    And I send the GET request to "orders_get_invoice_for_order" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.invoiceid|array|
    And I store the response as "invoice_for_order_response" name using full path
    And verify response time is less than "2500" milliseconds


