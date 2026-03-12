@BizomWebAPI @SalesmanSalesReturnsManagement @SalesReturns @PaymentProcessing @OS
Feature: Get Sales Return API Testing
  As a system user
  I want to test the get sales return endpoint
  So that I can ensure proper functionality and data retrieval for salesman sales returns management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get sales return without access token
    When I send the GET request to "salemansalesreturns_get_sales_return" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  # @Negative @Security
  # Scenario: Get sales return with invalid access token
    # And I send the GET request to "salemansalesreturns_get_sales_return" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|invalid_token_12345|
    # Then I should see the response code as "200"
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.result|false|
      # |$.error.code|401|
      # |$.error.message|Invalid Access Token or Credentials|
    # And verify response time is less than "2500" milliseconds

  # @Negative @Security
  # Scenario: Get sales return with expired access token
    # And I send the GET request to "salemansalesreturns_get_sales_return" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|expired_token_12345|
    # Then I should see the response code as "200"
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.result|false|
      # |$.error.code|401|
      # |$.error.message|Invalid Access Token or Credentials|
    # And verify response time is less than "2500" milliseconds

  # @Negative @Security
  # Scenario: Get sales return with malformed access token
    # And I send the GET request to "salemansalesreturns_get_sales_return" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|malformed.token.here|
    # Then I should see the response code as "200"
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.result|false|
      # |$.error.code|401|
      # |$.error.message|Invalid Access Token or Credentials|
    # And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get sales return with valid access token
    And I send the GET request to "salemansalesreturns_get_sales_return" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "sales_return_response" name using full path

  @Positive @DataValidation
  Scenario: Validate sales return response structure
    And I send the GET request to "salemansalesreturns_get_sales_return" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.unmappedInvoice|array|
      |$.warehousePL|object|
      |$.warehousePL.dotmatrix|array|
      |$.warehousePL.regular|array|
      |$.tabledata|array|

  @Positive @DataValidation
  Scenario: Validate sales return tabledata array structure
    And I send the GET request to "salemansalesreturns_get_sales_return" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.tabledata|array|
      |$.tabledata[0]|object|
      |$.tabledata[0].Salemansalesreturn|object|
      |$.tabledata[0].Batch|object|
      |$.tabledata[0].Outlet|object|
      |$.tabledata[0].Reason|object|
      |$.tabledata[0].Skunit|object|
      |$.tabledata[0].User|object|
      |$.tabledata[0].Warehouse|object|

  # @Positive @DataValidation
  # Scenario: Validate sales return Salemansalesreturn object structure
    # And I send the GET request to "salemansalesreturns_get_sales_return" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|ACCESS_TOKEN|
    # Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    # And validating the response field data types
      # |JPath|ExpectedType|
      # |$.tabledata[0].Salemansalesreturn.id|number|
      # |$.tabledata[0].Salemansalesreturn.fordate|string|
      # |$.tabledata[0].Salemansalesreturn.quantity|number|
      # |$.tabledata[0].Salemansalesreturn.return_quantity|number|
      # |$.tabledata[0].Salemansalesreturn.reason_id|number|
      # |$.tabledata[0].Salemansalesreturn.reason|string|
      # |$.tabledata[0].Salemansalesreturn.salereturn_no|string|
      # |$.tabledata[0].Salemansalesreturn.transactionid|string|
      # |$.tabledata[0].Salemansalesreturn.unitprice|string|
      # |$.tabledata[0].Salemansalesreturn.actualprice|string|
      # |$.tabledata[0].Salemansalesreturn.outlet_id|number|
      # |$.tabledata[0].Salemansalesreturn.salesreturnstate_id|number|

  @Positive @DataValidation
  Scenario: Validate sales return specific data values
    And I send the GET request to "salemansalesreturns_get_sales_return" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.tabledata[0].Salemansalesreturn.reason|DB:reasons:reason: id=4|
      |$.tabledata[0].Outlet.name|DB:outlets:name: id=2|
      |$.tabledata[0].Skunit.name|DB:skunits:name: id=2|

  # @Positive @DataValidation
  # Scenario: Validate sales return with static values
    # And I send the GET request to "salemansalesreturns_get_sales_return" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|ACCESS_TOKEN|
    # Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.tabledata[0].Salemansalesreturn.id|1|
      # |$.tabledata[0].Salemansalesreturn.reason|"sampling"|
      # |$.tabledata[0].Salemansalesreturn.quantity|1|
      # |$.tabledata[0].Salemansalesreturn.return_quantity|1|
      # |$.tabledata[0].Salemansalesreturn.salereturn_no|"1"|
      # |$.tabledata[0].Reason.reason|"sampling"|
      # |$.tabledata[0].Salesreturnstate.name|"approved"|

  @Positive @Performance
  Scenario: Performance test for sales return endpoint
    And I send the GET request to "salemansalesreturns_get_sales_return" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: Concurrent access test for sales return endpoint
    And I send the GET request to "salemansalesreturns_get_sales_return" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get sales return with invalid query parameters
    And I send the GET request to "salemansalesreturns_get_sales_return" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get sales return with special characters in query parameters
    And I send the GET request to "salemansalesreturns_get_sales_return" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get sales return with SQL injection attempt
    And I send the GET request to "salemansalesreturns_get_sales_return" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE salemansalesreturns; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: Get sales return with maximum query parameters
    And I send the GET request to "salemansalesreturns_get_sales_return" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  # @Negative @ErrorHandling
  # Scenario: Get sales return with invalid endpoint
    # And I send the GET request to "salemansalesreturns_get_sales_return_invalid" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|ACCESS_TOKEN|
    # Then I should see the response code as "404"
    # And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate sales return business logic
    And I send the GET request to "salemansalesreturns_get_sales_return" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.tabledata[0].Salemansalesreturn.quantity|number|
      |$.tabledata[0].Salemansalesreturn.return_quantity|number|
      |$.tabledata[0].Salemansalesreturn.salesreturnstate_id|number|
      |$.tabledata[0].isActionAllowed|boolean|
      |$.tabledata[0].finalApprove|number|

  @Positive @DataIntegrity
  Scenario: Validate sales return data integrity
    And I send the GET request to "salemansalesreturns_get_sales_return" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.unmappedInvoice|array|
      |$.warehousePL|object|
      |$.warehousePL.dotmatrix|array|
      |$.warehousePL.regular|array|
      |$.tabledata|array|
      |$.tabledata[0].Salemansalesreturn|object|
      |$.tabledata[0].Batch|object|
      |$.tabledata[0].Outlet|object|
      |$.tabledata[0].Ewaybill|object|
      |$.tabledata[0].Payment|object|
      |$.tabledata[0].Reason|object|
      |$.tabledata[0].Salesreturnstate|object|
      |$.tabledata[0].Skunit|object|
      |$.tabledata[0].User|object|
      |$.tabledata[0].Warehouse|object|

  @Positive @Regression
  Scenario: Regression test for sales return endpoint
    And I send the GET request to "salemansalesreturns_get_sales_return" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.unmappedInvoice|array|
      |$.warehousePL|object|
      |$.tabledata|array|

  # @Positive @Functional
  # Scenario: Validate sales return response completeness
    # And I send the GET request to "salemansalesreturns_get_sales_return" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|ACCESS_TOKEN|
    # Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    # And validating the response field data types
      # |JPath|ExpectedType|
      # |$.tabledata|array|
      # |$.tabledata[0]|object|
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.tabledata[0].Salemansalesreturn.id|1|
      # |$.tabledata[0].Salemansalesreturn.reason|"sampling"|
      # |$.tabledata[0].Reason.reason|"sampling"|
      # |$.tabledata[0].Salesreturnstate.name|"approved"|

  # @Positive @ArrayValidation
  # Scenario: Validate sales return array structure and content
    # And I send the GET request to "salemansalesreturns_get_sales_return" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|ACCESS_TOKEN|
    # Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    # And validating the response field data types
      # |JPath|ExpectedType|
      # |$.tabledata|array|
      # |$.tabledata[0]|object|
      # |$.tabledata[1]|object|
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.tabledata[0].Salemansalesreturn.id|1|
      # |$.tabledata[0].Salemansalesreturn.salereturn_no|"1"|
      # |$.tabledata[1].Salemansalesreturn.id|2|
      # |$.tabledata[1].Salemansalesreturn.salereturn_no|"2"|

  @Positive @ContentValidation
  Scenario: Validate sales return content structure
    And I send the GET request to "salemansalesreturns_get_sales_return" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |unmappedInvoice|
      |warehousePL|
      |tabledata|
      |Salemansalesreturn|
      |Batch|
      |Outlet|
      |Reason|
      |Skunit|
      |User|
      |Warehouse|

  @Positive @LoadTesting
  Scenario: Load testing for sales return endpoint
    And I send the GET request to "salemansalesreturns_get_sales_return" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Negative @Timeout
  Scenario: Test sales return endpoint timeout handling
    And I send the GET request to "salemansalesreturns_get_sales_return" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds

  # @Positive @EndToEnd
  # Scenario: End-to-end sales return data retrieval workflow
    # And I send the GET request to "salemansalesreturns_get_sales_return" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|ACCESS_TOKEN|
    # Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    # And I store the response as "sales_return_response" name using full path
    # And validating the response field data types
      # |JPath|ExpectedType|
      # |$.unmappedInvoice|array|
      # |$.warehousePL|object|
      # |$.warehousePL.dotmatrix|array|
      # |$.warehousePL.regular|array|
      # |$.tabledata|array|
      # |$.tabledata[0].Salemansalesreturn|object|
      # |$.tabledata[0].Salemansalesreturn.id|number|
      # |$.tabledata[0].Salemansalesreturn.quantity|number|
      # |$.tabledata[0].Salemansalesreturn.reason|string|
      # |$.tabledata[0].Reason|object|
      # |$.tabledata[0].Skunit|object|
      # |$.tabledata[0].User|object|
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.tabledata[0].Salemansalesreturn.id|1|
      # |$.tabledata[0].Salemansalesreturn.reason|"sampling"|
      # |$.tabledata[0].Reason.reason|"sampling"|

  @Positive @EmptyArrayValidation
  Scenario: Validate sales return empty array responses
    And I send the GET request to "salemansalesreturns_get_sales_return" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.unmappedInvoice|array|
      |$.warehousePL.dotmatrix|array|
      |$.warehousePL.regular|array|

  @Positive @NestedObjectValidation
  Scenario: Validate sales return nested object structures
    And I send the GET request to "salemansalesreturns_get_sales_return" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.tabledata[0].Outlet.id|number|
      |$.tabledata[0].Outlet.name|string|
      |$.tabledata[0].Skunit.id|number|
      |$.tabledata[0].Skunit.name|string|
      |$.tabledata[0].Skunit.skucode|string|
      |$.tabledata[0].User.id|number|
      |$.tabledata[0].User.name|string|
      |$.tabledata[0].Warehouse.id|number|
      |$.tabledata[0].Warehouse.name|string|

  # @Positive @FieldValidation
  # Scenario: Validate sales return field completeness
    # And I send the GET request to "salemansalesreturns_get_sales_return" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|ACCESS_TOKEN|
    # Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    # And validating the response field data types
      # |JPath|ExpectedType|
      # |$.tabledata[0].Salemansalesreturn.deliverychallan_id|object|
      # |$.tabledata[0].Salemansalesreturn.fordate|string|
      # |$.tabledata[0].Salemansalesreturn.batch_id|number|
      # |$.tabledata[0].Salemansalesreturn.discountpercent|string|
      # |$.tabledata[0].Salemansalesreturn.discount|string|
      # |$.tabledata[0].Salemansalesreturn.foroutlet_id|number|
      # |$.tabledata[0].Salemansalesreturn.id|number|
      # |$.tabledata[0].Salemansalesreturn.replacementstate_id|number|
      # |$.tabledata[0].Salemansalesreturn.mfgdate|object|
      # |$.tabledata[0].Salemansalesreturn.outlet_id|number|
      # |$.tabledata[0].Salemansalesreturn.payment_id|number|
      # |$.tabledata[0].Salemansalesreturn.quantity|number|
      # |$.tabledata[0].Salemansalesreturn.reason_id|number|
      # |$.tabledata[0].Salemansalesreturn.batchno|string|
      # |$.tabledata[0].Salemansalesreturn.reason|string|
      # |$.tabledata[0].Salemansalesreturn.return_quantity|number|
      # |$.tabledata[0].Salemansalesreturn.salereturn_no|string|
      # |$.tabledata[0].Salemansalesreturn.salereturnrequest_id|object|
      # |$.tabledata[0].Salemansalesreturn.salesreturnstate_id|number|
      # |$.tabledata[0].Salemansalesreturn.transactionid|string|
      # |$.tabledata[0].Salemansalesreturn.unitprice|string|
      # |$.tabledata[0].Salemansalesreturn.actualprice|string|
      # |$.tabledata[0].isActionAllowed|boolean|
      # |$.tabledata[0].finalApprove|number|

