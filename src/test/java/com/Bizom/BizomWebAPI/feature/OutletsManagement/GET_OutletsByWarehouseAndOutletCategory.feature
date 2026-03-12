@BizomWebAPI @CE @OutletsManagement @OutletsByWarehouseAndOutletCategory @SalesOperations
Feature: Outlets By Warehouse And Outlet Category API Testing
  As a system user
  I want to test the outlets by warehouse and outlet category endpoint
  So that I can ensure outlet listing filtered by warehouse and category is returned correctly

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get outlets by warehouse and outlet category without access token
    When I send the GET request to "outlets_by_warehouse_and_outlet_category" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get outlets by warehouse and outlet category with invalid access token
    And I send the GET request to "outlets_by_warehouse_and_outlet_category" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get outlets by warehouse and outlet category with expired access token
    And I send the GET request to "outlets_by_warehouse_and_outlet_category" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get outlets by warehouse and outlet category with malformed access token
    And I send the GET request to "outlets_by_warehouse_and_outlet_category" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get outlets by warehouse and outlet category with valid access token
    And I send the GET request to "outlets_by_warehouse_and_outlet_category" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
      |$.Model|[]|
      |$.Data|[]|
      |$.Outlets|[]|
    And I store the response as "outlets_by_warehouse_category_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate outlets by warehouse and outlet category response structure
    And I send the GET request to "outlets_by_warehouse_and_outlet_category" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Model|array|
      |$.Data|array|
      |$.Outlets|array|

  @Positive @Performance
  Scenario: TC_07 Performance test for outlets by warehouse and outlet category endpoint
    And I send the GET request to "outlets_by_warehouse_and_outlet_category" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Positive @Concurrency
  Scenario: TC_08 Concurrent access test for outlets by warehouse and outlet category endpoint
    And I send the GET request to "outlets_by_warehouse_and_outlet_category" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Positive @LoadTesting
  Scenario: TC_09 Load testing for outlets by warehouse and outlet category endpoint
    And I send the GET request to "outlets_by_warehouse_and_outlet_category" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Positive @Regression
  Scenario: TC_10 Regression test for outlets by warehouse and outlet category endpoint
    And I send the GET request to "outlets_by_warehouse_and_outlet_category" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @Positive @EndToEnd
  Scenario: TC_11 End-to-end outlets by warehouse and outlet category data retrieval workflow
    And I send the GET request to "outlets_by_warehouse_and_outlet_category" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
      |$.Model|[]|
      |$.Data|[]|
      |$.Outlets|[]|
    And I store the response as "outlets_by_warehouse_category_response" name using full path

  @Negative @Validation
  Scenario: TC_12 Get outlets by warehouse and outlet category with invalid query parameters
    And I send the GET request to "outlets_by_warehouse_and_outlet_category" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Negative @Validation
  Scenario: TC_13 Get outlets by warehouse and outlet category using special characters in query parameters
    And I send the GET request to "outlets_by_warehouse_and_outlet_category" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Negative @Security
  Scenario: TC_14 Get outlets by warehouse and outlet category with SQL injection attempt
    And I send the GET request to "outlets_by_warehouse_and_outlet_category" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE outlets; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Negative @Boundary
  Scenario: TC_15 Get outlets by warehouse and outlet category with excessive query parameters
    And I send the GET request to "outlets_by_warehouse_and_outlet_category" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

#  @Negative @ErrorHandling
#  Scenario: TC_16 Get outlets by warehouse and outlet category using invalid endpoint
#    And I send the GET request to "outlets_by_warehouse_and_outlet_category_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the HTML response should contain page title "Users"

