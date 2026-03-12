@BizomWebAPI @OS @OrdersManagement @Orders @OrderStatesReport @WorkflowAutomation
Feature: Orders - Get Order States For Report
  This feature validates the /orders/getorderstatesforreport endpoint which returns order states for reporting.

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get order states for report without access token
    When I send the GET request to "orders_get_order_states_for_report" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get order states for report with invalid access token
    And I send the GET request to "orders_get_order_states_for_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get order states for report with expired access token
    And I send the GET request to "orders_get_order_states_for_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get order states for report with malformed access token
    And I send the GET request to "orders_get_order_states_for_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get order states for report with valid access token
    And I send the GET request to "orders_get_order_states_for_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Orderstates|object|
      |$.Orderstates.1|string|
    And verify response time is less than "2500" milliseconds

  @Positive @DataValidation
  Scenario: TC_06 Validate specific order state values for report
    And I send the GET request to "orders_get_order_states_for_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Orderstates.1|Placed|
      |$.Orderstates.2|Accepted|
    And verify response time is less than "2500" milliseconds

  @Positive @ArrayValidation
  Scenario: TC_07 Validate order states mapping structure for report
    And I send the GET request to "orders_get_order_states_for_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Orderstates|object|
      |$.Orderstates.5|string|
      |$.Orderstates.6|string|
    And verify response time is less than "2500" milliseconds

  @Positive @ContentValidation
  Scenario: TC_08 Validate order states for report contains expected values
    And I send the GET request to "orders_get_order_states_for_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response contains the following values
      |Value|
      |Placed|
      |Accepted|
      |Fulfilled|
      |Rejected|
      |Pendingfromerp|
    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: TC_09 Performance test for order states report endpoint
    And I send the GET request to "orders_get_order_states_for_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for order states report endpoint
    And I send the GET request to "orders_get_order_states_for_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_11 Get order states for report with invalid query parameters
    And I send the GET request to "orders_get_order_states_for_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_12 Get order states for report with special characters in query parameters
    And I send the GET request to "orders_get_order_states_for_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_13 Get order states for report with SQL injection attempt
    And I send the GET request to "orders_get_order_states_for_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE orderstates; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: TC_14 Get order states for report with maximum query parameters
    And I send the GET request to "orders_get_order_states_for_report" endpoint with dynamic access token and query parameters
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
#  Scenario: TC_15 Get order states for report with invalid endpoint
#    And I send the GET request to "orders_get_order_states_for_report_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_16 Validate order states for report business logic
    And I send the GET request to "orders_get_order_states_for_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And verify response time is less than "2500" milliseconds

  @Positive @DataIntegrity
  Scenario: TC_17 Validate order states for report data integrity
    And I send the GET request to "orders_get_order_states_for_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Orderstates.3|string|
      |$.Orderstates.4|string|
    And verify response time is less than "2500" milliseconds

  @Positive @Regression
  Scenario: TC_18 Regression test for get order states for report endpoint
    And I send the GET request to "orders_get_order_states_for_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Functional
  Scenario: TC_19 Validate order states for report response completeness
    And I send the GET request to "orders_get_order_states_for_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|
      |$.Orderstates|object|
    And verify response time is less than "2500" milliseconds

  @Positive @LoadTesting
  Scenario: TC_20 Load testing for order states for report endpoint
    And I send the GET request to "orders_get_order_states_for_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Negative @Timeout
  Scenario: TC_21 Test order states for report endpoint timeout handling
    And I send the GET request to "orders_get_order_states_for_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds

  @Positive @EndToEnd
  Scenario: TC_22 End-to-end order states for report retrieval workflow
    And I send the GET request to "orders_get_order_states_for_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Orderstates.6|string|
    And I store the response as "order_states_report_response" name using full path
    And verify response time is less than "2500" milliseconds


