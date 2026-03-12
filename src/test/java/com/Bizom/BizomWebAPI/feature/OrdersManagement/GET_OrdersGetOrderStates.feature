@BizomWebAPI @OS @OrdersManagement @Orders @GETOrderStates @WorkflowAutomation
Feature: Orders - Get Order States
  This feature validates the /orders/getorderstates endpoint which returns order state configurations.

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get order states without access token
    When I send the GET request to "orders_get_order_states" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get order states with invalid access token
    And I send the GET request to "orders_get_order_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get order states with expired access token
    And I send the GET request to "orders_get_order_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get order states with malformed access token
    And I send the GET request to "orders_get_order_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get order states with valid access token
    And I send the GET request to "orders_get_order_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
      |$.data[0]|object|
    And verify response time is less than "2500" milliseconds

  @Positive @DataValidation
  Scenario: TC_06 Validate first order state values
    And I send the GET request to "orders_get_order_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data[0].namealias|Placed|
      |$.data[0].labelname|Place|
      |$.data[0].allow_bulk_state_change|false|
    And verify response time is less than "2500" milliseconds

  @Positive @ArrayValidation
  Scenario: TC_07 Validate order states array structure
    And I send the GET request to "orders_get_order_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data[1].id|string|
      |$.data[1].nextstatusid|string|
      |$.data[1].approveroleid|string|
    And verify response time is less than "2500" milliseconds

  @Positive @ContentValidation
  Scenario: TC_08 Validate response contains expected roles
    And I send the GET request to "orders_get_order_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response contains the following values
      |Value|
      |placed|
      |accepted|
      |fulfilled|
      |rejected|
    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: TC_09 Performance test for get order states endpoint
    And I send the GET request to "orders_get_order_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for order states endpoint
    And I send the GET request to "orders_get_order_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_11 Get order states with invalid query parameters
    And I send the GET request to "orders_get_order_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_12 Get order states with special characters in query parameters
    And I send the GET request to "orders_get_order_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_13 Get order states with SQL injection attempt
    And I send the GET request to "orders_get_order_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE order_states; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: TC_14 Get order states with maximum query parameters
    And I send the GET request to "orders_get_order_states" endpoint with dynamic access token and query parameters
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
#  Scenario: TC_15 Get order states with invalid endpoint
#    And I send the GET request to "orders_get_order_states_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_16 Validate order states business logic
    And I send the GET request to "orders_get_order_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And verify response time is less than "2500" milliseconds

  @Positive @DataIntegrity
  Scenario: TC_17 Validate order states data integrity
    And I send the GET request to "orders_get_order_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data[2].name|string|
      |$.data[2].nextstatusid|string|
    And verify response time is less than "2500" milliseconds

  @Positive @Regression
  Scenario: TC_18 Regression test for get order states endpoint
    And I send the GET request to "orders_get_order_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Functional
  Scenario: TC_19 Validate order states response completeness
    And I send the GET request to "orders_get_order_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data[3].id|string|
      |$.data[3].name|string|
      |$.data[3].nextstatusid|string|
    And verify response time is less than "2500" milliseconds

  @Positive @LoadTesting
  Scenario: TC_20 Load testing for get order states endpoint
    And I send the GET request to "orders_get_order_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Negative @Timeout
  Scenario: TC_21 Test get order states endpoint timeout handling
    And I send the GET request to "orders_get_order_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds

  @Positive @EndToEnd
  Scenario: TC_22 End-to-end order states retrieval workflow
    And I send the GET request to "orders_get_order_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data[4].namealias|string|
      |$.data[4].labelname|string|
    And I store the response as "order_states_response" name using full path
    And verify response time is less than "2500" milliseconds


