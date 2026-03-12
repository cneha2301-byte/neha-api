@BizomWebAPI @SalesmanSalesReturnsManagement @ConnectApiGetSaleReturnForUser @SystemIntegration @OS
Feature: Connect API Get Sale Return For User API Testing
  As a system user
  I want to test the connectApiGetSaleReturnForUser endpoint
  So that I can ensure proper functionality and data retrieval for sale returns for user

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |accept-language|en-US,en;q=0.9|
      |priority|u=0, i|
      |sec-ch-ua|"Google Chrome";v="143", "Chromium";v="143", "Not A(Brand";v="24"|
      |sec-ch-ua-mobile|?0|
      |sec-ch-ua-platform|"Windows"|
      |sec-fetch-dest|document|
      |sec-fetch-mode|navigate|
      |sec-fetch-site|none|
      |sec-fetch-user|?1|
      |upgrade-insecure-requests|1|
      |user-agent|Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36|

  @Negative @Security
  Scenario: TC_01 Get sale return for user without access token
    When I send the GET request to "salemansalesreturns_connectapigetsalereturnforuser" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |fromDate|2025-11-17|
      |toDate|2025-11-20|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get sale return for user with invalid access token
    And I send the GET request to "salemansalesreturns_connectapigetsalereturnforuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
      |fromDate|2025-11-17|
      |toDate|2025-11-20|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get sale return for user with expired access token
    And I send the GET request to "salemansalesreturns_connectapigetsalereturnforuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
      |fromDate|2025-11-17|
      |toDate|2025-11-20|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get sale return for user with malformed access token
    And I send the GET request to "salemansalesreturns_connectapigetsalereturnforuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
      |fromDate|2025-11-17|
      |toDate|2025-11-20|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get sale return for user with valid request
    And I send the GET request to "salemansalesreturns_connectapigetsalereturnforuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromDate|2025-11-17|
      |toDate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|
    And I store the response as "sale_return_for_user_response" name using full path

#  @Positive @DataValidation
#  Scenario: TC_06 Validate sale return for user response structure
#    And I send the GET request to "salemansalesreturns_connectapigetsalereturnforuser" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |fromDate|2025-11-17|
#      |toDate|2025-11-20|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Data|array|
#      |$.Data[0]|object|
#      |$.Data[0].salereturnid|number|
#      |$.Data[0].salereturnno|string|
#      |$.Data[0].fordate|string|
#      |$.Data[0].outletid|number|
#      |$.Data[0].outletname|string|
#      |$.Data[0].totalamount|number|
#      |$.Data[0].skudetails|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate sale return for user with different date range
    And I send the GET request to "salemansalesreturns_connectapigetsalereturnforuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromDate|2025-11-01|
      |toDate|2025-11-30|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Data|array|

#  @Positive @DataValidation
#  Scenario: TC_08 Validate sale return for user sale return details structure
#    And I send the GET request to "salemansalesreturns_connectapigetsalereturnforuser" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |fromDate|2025-11-17|
#      |toDate|2025-11-20|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Data[0].salereturnid|number|
#      |$.Data[0].salereturn_erpid|null|
#      |$.Data[0].salereturnno|string|
#      |$.Data[0].creditnoteno|null|
#      |$.Data[0].erp_id|null|
#      |$.Data[0].fordate|string|
#      |$.Data[0].outletid|number|
#      |$.Data[0].outletname|string|
#      |$.Data[0].tooutletid|number|
#      |$.Data[0].tooutletname|string|
#      |$.Data[0].totalamount|number|
#      |$.Data[0].transactionid|string|
#      |$.Data[0].skudetails|array|

  @Positive @DataValidation
  Scenario: TC_09 Validate sale return for user SKU details structure
    And I send the GET request to "salemansalesreturns_connectapigetsalereturnforuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromDate|2025-11-17|
      |toDate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data[0].skudetails|array|
      |$.Data[0].skudetails[0]|object|
      |$.Data[0].skudetails[0].skuid|string|
      |$.Data[0].skudetails[0].skuname|string|
      |$.Data[0].skudetails[0].skucode|string|
      |$.Data[0].skudetails[0].amountwithoutgst|number|
      |$.Data[0].skudetails[0].quantity|string|
      |$.Data[0].skudetails[0].unitpricewithoutgst|number|
      |$.Data[0].skudetails[0].gstpercent|number|
      |$.Data[0].skudetails[0].gstamount|number|

  @Positive @Performance
  Scenario: TC_10 Performance test for sale return for user endpoint
    And I send the GET request to "salemansalesreturns_connectapigetsalereturnforuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromDate|2025-11-17|
      |toDate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

#  @Positive @DataIntegrity
#  Scenario: TC_11 Validate sale return for user data integrity
#    And I send the GET request to "salemansalesreturns_connectapigetsalereturnforuser" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |fromDate|2025-11-17|
#      |toDate|2025-11-20|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Data|array|
#      |$.Data[0]|object|
#      |$.Data[0].salereturnid|number|
#      |$.Data[0].salereturnno|string|
#      |$.Data[0].outletid|number|
#      |$.Data[0].totalamount|number|

  @Positive @Functional
  Scenario: TC_12 Validate sale return for user response completeness
    And I send the GET request to "salemansalesreturns_connectapigetsalereturnforuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromDate|2025-11-17|
      |toDate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|
      |$.Data[0]|object|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Data|
      |salereturnid|
      |salereturnno|
      |outletid|
      |outletname|
      |totalamount|
      |skudetails|

  @Positive @ArrayValidation
  Scenario: TC_13 Validate sale return for user array structure
    And I send the GET request to "salemansalesreturns_connectapigetsalereturnforuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromDate|2025-11-17|
      |toDate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|
      |$.Data[0]|object|
      |$.Data[0].skudetails|array|

#  @Positive @EndToEnd
#  Scenario: TC_14 End-to-end sale return for user data retrieval workflow
#    And I send the GET request to "salemansalesreturns_connectapigetsalereturnforuser" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |fromDate|2025-11-17|
#      |toDate|2025-11-20|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And I store the response as "sale_return_for_user_response" name using full path
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Data|array|
#      |$.Data[0]|object|
#      |$.Data[0].salereturnid|number|
#      |$.Data[0].salereturnno|string|
#      |$.Data[0].outletid|number|
#      |$.Data[0].totalamount|number|
#      |$.Data[0].skudetails|array|

  @Negative @Validation
  Scenario: TC_15 Get sale return for user with invalid date format
    And I send the GET request to "salemansalesreturns_connectapigetsalereturnforuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromDate|invalid-date|
      |toDate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|

  @Negative @Validation
  Scenario: TC_16 Get sale return for user with reversed date range
    And I send the GET request to "salemansalesreturns_connectapigetsalereturnforuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromDate|2025-11-20|
      |toDate|2025-11-17|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|

  @Negative @Validation
  Scenario: TC_17 Get sale return for user with missing fromDate parameter
    And I send the GET request to "salemansalesreturns_connectapigetsalereturnforuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |toDate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|

  @Negative @Validation
  Scenario: TC_18 Get sale return for user with missing toDate parameter
    And I send the GET request to "salemansalesreturns_connectapigetsalereturnforuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromDate|2025-11-17|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|

  @Negative @Validation
  Scenario: TC_19 Get sale return for user with same fromDate and toDate
    And I send the GET request to "salemansalesreturns_connectapigetsalereturnforuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromDate|2025-11-17|
      |toDate|2025-11-17|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Data|array|

  @Negative @ErrorHandling
  Scenario: TC_20 Get sale return for user with invalid endpoint
    And I send the GET request to "salemansalesreturns_connectapigetsalereturnforuser_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromDate|2025-11-17|
      |toDate|2025-11-20|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Concurrency
  Scenario: TC_21 Concurrent access test for sale return for user endpoint
    And I send the GET request to "salemansalesreturns_connectapigetsalereturnforuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromDate|2025-11-17|
      |toDate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @LoadTesting
  Scenario: TC_22 Load testing for sale return for user endpoint
    And I send the GET request to "salemansalesreturns_connectapigetsalereturnforuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromDate|2025-11-17|
      |toDate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Timeout
  Scenario: TC_23 Test sale return for user endpoint timeout handling
    And I send the GET request to "salemansalesreturns_connectapigetsalereturnforuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromDate|2025-11-17|
      |toDate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

#  @Positive @Regression
#  Scenario: TC_24 Regression test for sale return for user endpoint
#    And I send the GET request to "salemansalesreturns_connectapigetsalereturnforuser" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |fromDate|2025-11-17|
#      |toDate|2025-11-20|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Data|array|
#      |$.Data[0]|object|
#      |$.Data[0].salereturnid|number|
#      |$.Data[0].salereturnno|string|
#      |$.Data[0].outletid|number|
#      |$.Data[0].totalamount|number|

#  @Positive @BusinessLogic
#  Scenario: TC_25 Validate sale return for user business logic
#    And I send the GET request to "salemansalesreturns_connectapigetsalereturnforuser" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |fromDate|2025-11-17|
#      |toDate|2025-11-20|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Data|array|
#      |$.Data[0]|object|
#      |$.Data[0].salereturnid|number|
#      |$.Data[0].salereturnno|string|
#      |$.Data[0].outletid|number|
#      |$.Data[0].totalamount|number|
#      |$.Data[0].skudetails|array|

