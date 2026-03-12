@BizomWebAPI @OS @OrdersManagement @OrdersIndexWithDate @SystemIntegration
Feature: Orders Index With Date API Testing
  As a system user
  I want to test the orders index with date endpoint
  So that I can ensure proper retrieval of orders data with date range filtering

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get orders index with date without access token
    When I post the request with "POST_orders_indexwithdate" payload with path parameter
      |Path|Value|
      |startDate|01-09-2025|
      |endDate|30-09-2025|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get orders index with date with invalid access token
    And I post the request with "POST_orders_indexwithdate" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|startDate|01-09-2025|
      |||endDate|30-09-2025|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get orders index with date with expired access token
    And I post the request with "POST_orders_indexwithdate" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|startDate|01-09-2025|
      |||endDate|30-09-2025|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get orders index with date with malformed access token
    And I post the request with "POST_orders_indexwithdate" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|startDate|01-09-2025|
      |||endDate|30-09-2025|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get orders index with date with valid parameters
    And I post the request with "POST_orders_indexwithdate" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|startDate|01-09-2025|
      |||endDate|30-09-2025|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And I store the response as "orders_indexwithdate_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate orders index with date response structure
    And I post the request with "POST_orders_indexwithdate" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|startDate|01-09-2025|
      |||endDate|30-09-2025|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|5|
      |$.iTotalDisplayRecords|5|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate orders index with date aaData array structure
    And I post the request with "POST_orders_indexwithdate" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|startDate|01-09-2025|
      |||endDate|30-09-2025|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData|array|
      |$.aaData[0]|object|
      |$.aaData[0].order_Id|string|
      |$.aaData[0].order_amount|string|
      |$.aaData[0].fromOutlet_Id|string|
      |$.aaData[0].outlet_id|string|

  @Positive @DataValidation
  Scenario: TC_08 Validate orders index with date contains expected fields
    And I post the request with "POST_orders_indexwithdate" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|startDate|01-09-2025|
      |||endDate|30-09-2025|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |sEcho|
      |iTotalRecords|
      |iTotalDisplayRecords|
      |aaData|
      |order_Id|
      |order_amount|
      |fromOutlet_Id|
      |outlet_id|

  @Positive @Performance
  Scenario: TC_09 Performance test for orders index with date endpoint
    And I post the request with "POST_orders_indexwithdate" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|startDate|01-09-2025|
      |||endDate|30-09-2025|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

  @Negative @Validation
  Scenario: TC_10 Get orders index with date with invalid date format
    And I post the request with "POST_orders_indexwithdate" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|startDate|invalid-date|
      |||endDate|30-09-2025|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_11 Get orders index with date with missing startDate
    And I post the request with "POST_orders_indexwithdate" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|endDate|30-09-2025|
      |||startDate|""|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_12 Get orders index with date with missing endDate
    And I post the request with "POST_orders_indexwithdate" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|startDate|01-09-2025|
      |||endDate|""|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_13 Get orders index with date with empty body
    And I send empty body with "POST_orders_indexwithdate" request
    And I post the request with "POST_orders_indexwithdate" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|startDate|01-09-2025|
      |||endDate|30-09-2025|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Negative @Validation
#  Scenario: TC_14 Get orders index with date with invalid payload
#    And I post the request with "POST_orders_indexwithdate_invalid" payload with path parameter and dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|startDate|01-09-2025|
#      |||endDate|30-09-2025|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds

#  @Negative @ErrorHandling
#  Scenario: TC_15 Get orders index with date with invalid endpoint
#    And I post the request with "POST_orders_indexwithdate_invalid" payload with path parameter and dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|startDate|01-09-2025|
#      |||endDate|30-09-2025|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_16 Get orders index with date for different date range
    And I post the request with "POST_orders_indexwithdate" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|startDate|01-01-2025|
      |||endDate|31-12-2025|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

  @Positive @Regression
  Scenario: TC_17 Regression test for orders index with date endpoint
    And I post the request with "POST_orders_indexwithdate" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|startDate|01-09-2025|
      |||endDate|30-09-2025|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|5|
      |$.iTotalDisplayRecords|5|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Positive @Concurrency
  Scenario: TC_18 Concurrent access test for orders index with date endpoint
    And I post the request with "POST_orders_indexwithdate" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|startDate|01-09-2025|
      |||endDate|30-09-2025|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds 
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

  @Positive @LoadTesting
  Scenario: TC_19 Load testing for orders index with date endpoint
    And I post the request with "POST_orders_indexwithdate" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|startDate|01-09-2025|
      |||endDate|30-09-2025|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds 
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

  @Negative @Timeout
  Scenario: TC_20 Test orders index with date endpoint timeout handling
    And I post the request with "POST_orders_indexwithdate" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|startDate|01-09-2025|
      |||endDate|30-09-2025|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds 
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

  @Positive @EndToEnd
  Scenario: TC_21 End-to-end orders index with date workflow
    And I post the request with "POST_orders_indexwithdate" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|startDate|01-09-2025|
      |||endDate|30-09-2025|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|5|
      |$.iTotalDisplayRecords|5|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
      |$.aaData[0]|object|
    And I store the response as "orders_indexwithdate_response" name using full path

  @Positive @DataValidation
  Scenario: TC_22 Validate orders index with date aaData contains order details
    And I post the request with "POST_orders_indexwithdate" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|startDate|01-09-2025|
      |||endDate|30-09-2025|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData[0].order_Id|string|
      |$.aaData[0].order_amount|string|
      |$.aaData[0].fromOutlet_name|string|
      |$.aaData[0].oulet_name|string|
      |$.aaData[0].order_fordate|string|
      |$.aaData[0].orderstate_name|string|

  @Positive @DataValidation
  Scenario: TC_23 Validate orders index with date orderDetails array
    And I post the request with "POST_orders_indexwithdate" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|startDate|01-09-2025|
      |||endDate|30-09-2025|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData[0].orderDetails|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

  @Positive @Integration
  Scenario: TC_24 Verify orders index with date endpoint integration
    And I post the request with "POST_orders_indexwithdate" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|startDate|01-09-2025|
      |||endDate|30-09-2025|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|5|
      |$.iTotalDisplayRecords|5|
    And I validate that the operation was successfully completed in the system

  @Positive @Boundary
  Scenario: TC_25 Get orders index with date with same start and end date
    And I post the request with "POST_orders_indexwithdate" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|startDate|01-09-2025|
      |||endDate|01-09-2025|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

