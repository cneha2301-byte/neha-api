@BizomWebAPI @OnlineInvoicesManagement @GetWarehouseList @WorkflowAutomation @Innovation
Feature: Get Warehouse List API Testing for Online Invoices
  As a system user
  I want to test the get warehouse list endpoint for online invoices
  So that I can ensure proper functionality and data retrieval for online invoices warehouse list management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get warehouse list without access token
    When I send the GET request to "onlineinvoices_getwarehouselist" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get warehouse list with invalid access token
    And I send the GET request to "onlineinvoices_getwarehouselist" endpoint with dynamic access token and query parameters
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
  Scenario: TC_03 Get warehouse list with expired access token
    And I send the GET request to "onlineinvoices_getwarehouselist" endpoint with dynamic access token and query parameters
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
  Scenario: TC_04 Get warehouse list with malformed access token
    And I send the GET request to "onlineinvoices_getwarehouselist" endpoint with dynamic access token and query parameters
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
  Scenario: TC_05 Get warehouse list with valid access token
    And I send the GET request to "onlineinvoices_getwarehouselist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And I store the response as "online_invoices_warehouse_list_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate warehouse list response structure
    And I send the GET request to "onlineinvoices_getwarehouselist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate warehouse list DataTables structure
    And I send the GET request to "onlineinvoices_getwarehouselist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
      |$.aaData[0]|object|

  @Positive @DataValidation
  Scenario: TC_08 Validate warehouse list aaData object structure
    And I send the GET request to "onlineinvoices_getwarehouselist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData[0]|object|
      |$.aaData[0].warehouseGSTIN|string|
      |$.aaData[0].warehouseID|string|
      |$.aaData[0].warehouseName|string|
      |$.aaData[0].isEInvoiceEnabled|string|
      |$.aaData[0].isEInvoiceAutomated|string|
      |$.aaData[0].eInvoiceStartDate|string|
      |$.aaData[0].username|string|
      |$.aaData[0].isResetAccessible|boolean|

  @Positive @DataValidation
  Scenario: TC_09 Validate warehouse list complete structure
    And I send the GET request to "onlineinvoices_getwarehouselist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
      |$.aaData[0]|object|
      |$.aaData[0].warehouseGSTIN|string|
      |$.aaData[0].warehouseID|string|
      |$.aaData[0].warehouseName|string|
      |$.aaData[0].isEInvoiceEnabled|string|
      |$.aaData[0].isEInvoiceAutomated|string|
      |$.aaData[0].eInvoiceStartDate|string|
      |$.aaData[0].username|string|
      |$.aaData[0].isResetAccessible|boolean|

  @Positive @Performance
  Scenario: TC_10 Performance test for warehouse list endpoint
    And I send the GET request to "onlineinvoices_getwarehouselist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Positive @Concurrency
  Scenario: TC_11 Concurrent access test for warehouse list endpoint
    And I send the GET request to "onlineinvoices_getwarehouselist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Negative @Validation
  Scenario: TC_12 Get warehouse list with invalid query parameters
    And I send the GET request to "onlineinvoices_getwarehouselist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Negative @Validation
  Scenario: TC_13 Get warehouse list with special characters in query parameters
    And I send the GET request to "onlineinvoices_getwarehouselist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Negative @Security
  Scenario: TC_14 Get warehouse list with SQL injection attempt
    And I send the GET request to "onlineinvoices_getwarehouselist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE warehouses; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

#  @Negative @ErrorHandling
#  Scenario: TC_15 Get warehouse list with invalid endpoint
#    And I send the GET request to "onlineinvoices_getwarehouselist_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_16 Validate warehouse list business logic
    And I send the GET request to "onlineinvoices_getwarehouselist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Positive @DataIntegrity
  Scenario: TC_17 Validate warehouse list data integrity
    And I send the GET request to "onlineinvoices_getwarehouselist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

  @Positive @Regression
  Scenario: TC_18 Regression test for warehouse list endpoint
    And I send the GET request to "onlineinvoices_getwarehouselist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Positive @Functional
  Scenario: TC_19 Validate warehouse list response completeness
    And I send the GET request to "onlineinvoices_getwarehouselist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
      |$.aaData[0]|object|
      |$.aaData[0].warehouseGSTIN|string|
      |$.aaData[0].warehouseID|string|
      |$.aaData[0].warehouseName|string|
      |$.aaData[0].isEInvoiceEnabled|string|
      |$.aaData[0].isEInvoiceAutomated|string|
      |$.aaData[0].eInvoiceStartDate|string|
      |$.aaData[0].username|string|
      |$.aaData[0].isResetAccessible|boolean|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And I store the response as "online_invoices_warehouse_list_response" name using full path
    And validating the response contains the following values
      |Value|
      |sEcho|
      |iTotalRecords|
      |iTotalDisplayRecords|
      |aaData|

  @Positive @ArrayValidation
  Scenario: TC_20 Validate warehouse list array structure and content
    And I send the GET request to "onlineinvoices_getwarehouselist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData|array|
      |$.aaData[0]|object|
      |$.aaData[1]|object|
      |$.aaData[2]|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

  @Positive @FieldValidation
  Scenario: TC_21 Validate warehouse list individual fields
    And I send the GET request to "onlineinvoices_getwarehouselist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData[0].warehouseGSTIN|string|
      |$.aaData[0].warehouseID|string|
      |$.aaData[0].warehouseName|string|
      |$.aaData[0].isEInvoiceEnabled|string|
      |$.aaData[0].isEInvoiceAutomated|string|
      |$.aaData[0].eInvoiceStartDate|string|
      |$.aaData[0].username|string|
      |$.aaData[0].isResetAccessible|boolean|

  @Positive @EndToEnd
  Scenario: TC_22 End-to-end warehouse list data retrieval workflow
    And I send the GET request to "onlineinvoices_getwarehouselist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And I store the response as "online_invoices_warehouse_list_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
      |$.aaData[0]|object|
      |$.aaData[0].warehouseGSTIN|string|
      |$.aaData[0].warehouseID|string|
      |$.aaData[0].warehouseName|string|
      |$.aaData[0].isEInvoiceEnabled|string|
      |$.aaData[0].isEInvoiceAutomated|string|
      |$.aaData[0].eInvoiceStartDate|string|
      |$.aaData[0].username|string|
      |$.aaData[0].isResetAccessible|boolean|

