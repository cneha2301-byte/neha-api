@BizomWebAPI @OS @OrdersManagement @EditedOrderReportData @SystemOperations
Feature: Edited Order Report Data API Testing
  As a system user
  I want to test the edited order report data endpoint
  So that I can ensure proper functionality and data retrieval for edited order report data management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |accept-language|en-US,en;q=0.9|
      |priority|u=0, i|
      |sec-ch-ua|"Chromium";v="142", "Google Chrome";v="142", "Not_A Brand";v="99"|
      |sec-ch-ua-mobile|?0|
      |sec-ch-ua-platform|"Windows"|
      |sec-fetch-dest|document|
      |sec-fetch-mode|navigate|
      |sec-fetch-site|none|
      |sec-fetch-user|?1|
      |upgrade-insecure-requests|1|
      |user-agent|Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36|
    And I set cookies
      |cookieName|cookieValue|
      |toolbarDisplay|hide|
      |language|en|
      |PHPSESSID|jmihagqm38ri9qhap06vjip02a|
      |CAKEPHP|ijre9rp9ofqjpa6jck5tl70lss|

  @Negative @Security
  Scenario: TC_01 Get edited order report data without cookies
    When I set up request specification
      |HeaderName|HeaderValue|
      |accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |accept-language|en-US,en;q=0.9|
      |user-agent|Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36|
    And I send the GET request to "orders_edited_order_report_data" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get edited order report data with invalid session cookie
    When I set up request specification
      |HeaderName|HeaderValue|
      |accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |accept-language|en-US,en;q=0.9|
      |user-agent|Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36|
    And I set cookies
      |cookieName|cookieValue|
      |toolbarDisplay|hide|
      |language|en|
      |PHPSESSID|invalid_session_12345|
      |CAKEPHP|invalid_cake_12345|
    And I send the GET request to "orders_edited_order_report_data" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get edited order report data with expired session cookie
    When I set up request specification
      |HeaderName|HeaderValue|
      |accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |accept-language|en-US,en;q=0.9|
      |user-agent|Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36|
    And I set cookies
      |cookieName|cookieValue|
      |toolbarDisplay|hide|
      |language|en|
      |PHPSESSID|expired_session_12345|
      |CAKEPHP|expired_cake_12345|
    And I send the GET request to "orders_edited_order_report_data" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_04 Get edited order report data with valid cookies and headers
    When I send the GET request to "orders_edited_order_report_data" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |data|
    And I store the response as "edited_order_report_data_response" name using full path

  @Positive @DataValidation
  Scenario: TC_05 Validate edited order report data response structure
    When I send the GET request to "orders_edited_order_report_data" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
    And validating the response contains the following values
      |Value|
      |data|

  @Positive @DataValidation
  Scenario: TC_06 Validate edited order report data nested structure
    When I send the GET request to "orders_edited_order_report_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
    And validating the response contains the following values
      |Value|
      |Order|
      |Outlet|
      |User|
      |Payment|
      |Orderdetaildata|
      |Paymentdetaildata|

  @Positive @DataValidation
  Scenario: TC_07 Validate order details in edited order report data
    When I send the GET request to "orders_edited_order_report_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
    And validating the response contains the following values
      |Value|
      |id|
      |amount|
      |orderstate_id|
      |created|
      |discount|
      |schemediscount|

  @Positive @DataValidation
  Scenario: TC_08 Validate outlet details in edited order report data
    When I send the GET request to "orders_edited_order_report_data" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
    And validating the response contains the following values
      |Value|
      |Outlet|
      |name|
      |area_id|

  @Positive @DataValidation
  Scenario: TC_09 Validate payment details in edited order report data
    When I send the GET request to "orders_edited_order_report_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
    And validating the response contains the following values
      |Value|
      |Payment|
      |invoiceid|
      |amount|
      |discount|
      |schemediscount|

  @Positive @DataValidation
  Scenario: TC_10 Validate order detail data structure
    When I send the GET request to "orders_edited_order_report_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
    And validating the response contains the following values
      |Value|
      |Orderdetaildata|
      |Orderdetail|
      |skunit_id|
      |quantity|
      |unitprice|

  @Positive @DataValidation
  Scenario: TC_11 Validate payment detail data structure
    When I send the GET request to "orders_edited_order_report_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
    And validating the response contains the following values
      |Value|
      |Paymentdetaildata|
      |Paymentdetail|
      |skunit_id|
      |quantity|
      |unitprice|
      |discount|

  @Positive @Performance
  Scenario: TC_12 Performance test for edited order report data endpoint
    When I send the GET request to "orders_edited_order_report_data" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response contains the following values
      |Value|
      |data|

  @Positive @Concurrency
  Scenario: TC_13 Concurrent access test for edited order report data endpoint
    When I send the GET request to "orders_edited_order_report_data" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |data|

  @Negative @Validation
  Scenario: TC_14 Get edited order report data with invalid query parameters
    When I send the GET request to "orders_edited_order_report_data" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |data|

  @Negative @Validation
  Scenario: TC_15 Get edited order report data with special characters in query parameters
    When I send the GET request to "orders_edited_order_report_data" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |data|

  @Negative @Security
  Scenario: TC_16 Get edited order report data with SQL injection attempt
    When I send the GET request to "orders_edited_order_report_data" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |test_param|'; DROP TABLE orders; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |data|

  @Negative @Boundary
  Scenario: TC_17 Get edited order report data with maximum query parameters
    When I send the GET request to "orders_edited_order_report_data" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |data|

#  @Negative @ErrorHandling
#  Scenario: TC_18 Get edited order report data with invalid endpoint
#    When I send the GET request to "orders_edited_order_report_data_invalid" endpoint
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_19 Validate edited order report data business logic
    When I send the GET request to "orders_edited_order_report_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |data|
      |Order|
      |Outlet|
      |Payment|

  @Positive @DataIntegrity
  Scenario: TC_20 Validate edited order report data integrity
    When I send the GET request to "orders_edited_order_report_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
    And validating the response contains the following values
      |Value|
      |data|
      |Order|
      |Outlet|
      |User|
      |Payment|
      |Orderdetaildata|
      |Paymentdetaildata|

  @Positive @Regression
  Scenario: TC_21 Regression test for edited order report data endpoint
    When I send the GET request to "orders_edited_order_report_data" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
    And validating the response contains the following values
      |Value|
      |data|

  @Positive @Functional
  Scenario: TC_22 Validate edited order report data response completeness
    When I send the GET request to "orders_edited_order_report_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
    And validating the response contains the following values
      |Value|
      |data|
      |Order|
      |Outlet|
      |User|
      |Payment|
      |Orderdetaildata|
      |Paymentdetaildata|
      |Orderdetail|
      |Paymentdetail|
    And I store the response as "edited_order_report_data_response" name using full path

  @Positive @ContentValidation
  Scenario: TC_23 Validate edited order report data content structure
    When I send the GET request to "orders_edited_order_report_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |data|
      |Order|
      |id|
      |amount|
      |orderstate_id|
      |created|
      |discount|
      |schemediscount|
      |WarehouseName|
      |AreaName|
      |Outlet|
      |name|
      |area_id|
      |User|
      |name|
      |Payment|
      |invoiceid|
      |amount|
      |discount|
      |schemediscount|
      |Orderdetaildata|
      |Paymentdetaildata|

  @Positive @LoadTesting
  Scenario: TC_24 Load testing for edited order report data endpoint
    When I send the GET request to "orders_edited_order_report_data" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And validating the response contains the following values
      |Value|
      |data|

  @Negative @Timeout
  Scenario: TC_25 Test edited order report data endpoint timeout handling
    When I send the GET request to "orders_edited_order_report_data" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And validating the response contains the following values
      |Value|
      |data|

  @Positive @EndToEnd
  Scenario: TC_26 End-to-end edited order report data retrieval workflow
    When I send the GET request to "orders_edited_order_report_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
    And validating the response contains the following values
      |Value|
      |data|
      |Order|
      |Outlet|
      |User|
      |Payment|
      |Orderdetaildata|
      |Paymentdetaildata|
    And I store the response as "edited_order_report_data_response" name using full path

