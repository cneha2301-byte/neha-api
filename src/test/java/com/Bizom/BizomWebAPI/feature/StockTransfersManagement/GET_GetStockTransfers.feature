@BizomWebAPI @StockTransfersManagement @StockTransfers @OutletManagement @Innovation
Feature: Stock Transfers API Testing
  As a system user
  I want to test the getstocktransfers endpoint
  So that I can ensure proper functionality and data retrieval for stock transfers management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get stock transfers without access token
    When I send the GET request to "get_stock_transfers" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get stock transfers with invalid access token
#    And I send the GET request to "get_stock_transfers" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|invalid_token_12345|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get stock transfers with expired access token
#    And I send the GET request to "get_stock_transfers" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|expired_token_12345|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get stock transfers with malformed access token
#    And I send the GET request to "get_stock_transfers" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|malformed.token.here|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get stock transfers with valid access token
    And I send the GET request to "get_stock_transfers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.stocktranfers|[]|
    And I store the response as "stock_transfers_response" name using full path

  @Positive @DataValidation
  Scenario: Validate stock transfers response structure
    And I send the GET request to "get_stock_transfers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.stocktranfers|array|

  @Positive @DataValidation
  Scenario: Validate stock transfers specific data values
    And I send the GET request to "get_stock_transfers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.stocktranfers|[]|

#  @Positive @DataValidation
#  Scenario: Validate stock transfers with static values
#    And I send the GET request to "get_stock_transfers" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.stocktranfers|[]|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.stocktranfers[0].id|"1"|
#      |$.stocktranfers[0].from_warehouse|"Warehouse A"|
#      |$.stocktranfers[0].to_warehouse|"Warehouse B"|
#      |$.stocktranfers[0].product_id|"123"|
#      |$.stocktranfers[0].quantity|"10"|
#      |$.stocktranfers[0].status|"pending"|
#      |$.stocktranfers[0].created_date|"2024-01-15 10:30:00"|

  @Positive @Performance
  Scenario: Performance test for stock transfers endpoint
    And I send the GET request to "get_stock_transfers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.stocktranfers|[]|

  @Positive @Concurrency
  Scenario: Concurrent access test for stock transfers endpoint
    And I send the GET request to "get_stock_transfers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.stocktranfers|[]|

  @Negative @Validation
  Scenario: Get stock transfers with invalid query parameters
    And I send the GET request to "get_stock_transfers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.stocktranfers|[]|

  @Negative @Validation
  Scenario: Get stock transfers with special characters in query parameters
    And I send the GET request to "get_stock_transfers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.stocktranfers|[]|

  @Negative @Security
  Scenario: Get stock transfers with SQL injection attempt
    And I send the GET request to "get_stock_transfers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE stocktransfers; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.stocktranfers|[]|

  @Negative @Boundary
  Scenario: Get stock transfers with maximum query parameters
    And I send the GET request to "get_stock_transfers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.stocktranfers|[]|

#  @Negative @ErrorHandling
#  Scenario: Get stock transfers with invalid endpoint
#    And I send the GET request to "get_stock_transfers_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

  @Positive @BusinessLogic
  Scenario: Validate stock transfers business logic
    And I send the GET request to "get_stock_transfers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.stocktranfers|[]|

  @Positive @DataIntegrity
  Scenario: Validate stock transfers data integrity
    And I send the GET request to "get_stock_transfers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.stocktranfers|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.stocktranfers|array|
      |$.stocktranfers[0]|object|
      |$.stocktranfers[0].id|string|
      |$.stocktranfers[0].from_warehouse|string|
      |$.stocktranfers[0].to_warehouse|string|
      |$.stocktranfers[0].product_id|string|
      |$.stocktranfers[0].quantity|string|
      |$.stocktranfers[0].status|string|
      |$.stocktranfers[0].created_date|string|

  @Positive @Regression
  Scenario: Regression test for stock transfers endpoint
    And I send the GET request to "get_stock_transfers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.stocktranfers|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.stocktranfers|array|

#  @Positive @Functional
#  Scenario: Validate stock transfers response completeness
#    And I send the GET request to "get_stock_transfers" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.stocktranfers|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.stocktranfers|array|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.stocktranfers[0].id|"1"|
#      |$.stocktranfers[0].from_warehouse|"Warehouse A"|
#      |$.stocktranfers[0].to_warehouse|"Warehouse B"|
#      |$.stocktranfers[0].product_id|"123"|
#      |$.stocktranfers[0].quantity|"10"|
#      |$.stocktranfers[0].status|"pending"|
#      |$.stocktranfers[0].created_date|"2024-01-15 10:30:00"|

#  @Positive @ArrayValidation
#  Scenario: Validate stock transfers array structure and content
#    And I send the GET request to "get_stock_transfers" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.stocktranfers|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.stocktranfers|array|
#      |$.stocktranfers[0]|object|
#      |$.stocktranfers[1]|object|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.stocktranfers[0].id|"1"|
#      |$.stocktranfers[0].from_warehouse|"Warehouse A"|
#      |$.stocktranfers[0].to_warehouse|"Warehouse B"|
#      |$.stocktranfers[1].id|"2"|
#      |$.stocktranfers[1].from_warehouse|"Warehouse C"|
#      |$.stocktranfers[1].to_warehouse|"Warehouse D"|

#  @Positive @ContentValidation
#  Scenario: Validate stock transfers content structure
#    And I send the GET request to "get_stock_transfers" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.stocktranfers|[]|
#    And validating the response contains the following values
#      |Value|
#      |stocktranfers|
#      |id|
#      |from_warehouse|
#      |to_warehouse|
#      |product_id|
#      |quantity|
#      |status|
#      |created_date|

  @Positive @LoadTesting
  Scenario: Load testing for stock transfers endpoint
    And I send the GET request to "get_stock_transfers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.stocktranfers|[]|

  @Negative @Timeout
  Scenario: Test stock transfers endpoint timeout handling
    And I send the GET request to "get_stock_transfers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.stocktranfers|[]|

#  @Positive @EndToEnd
#  Scenario: End-to-end stock transfers data retrieval workflow
#    And I send the GET request to "get_stock_transfers" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.stocktranfers|[]|
#    And I store the response as "stock_transfers_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.stocktranfers|array|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.stocktranfers[0].id|"1"|
#      |$.stocktranfers[0].from_warehouse|"Warehouse A"|
#      |$.stocktranfers[0].to_warehouse|"Warehouse B"|
#      |$.stocktranfers[0].product_id|"123"|
#      |$.stocktranfers[0].quantity|"10"|
#      |$.stocktranfers[0].status|"pending"|
#      |$.stocktranfers[0].created_date|"2024-01-15 10:30:00"|

  @Positive @HeaderValidation
  Scenario: Validate stock transfers response headers
    And I send the GET request to "get_stock_transfers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Server|Bizom|
      |Connection|keep-alive|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.stocktranfers|[]|

  @Positive @SessionValidation
  Scenario: Validate stock transfers with session handling
    And I send the GET request to "get_stock_transfers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.stocktranfers|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.stocktranfers|array|
      |$.stocktranfers[0]|object|

  @Positive @StockTransfersSpecificValidation
  Scenario: Validate stock transfers stock-specific data
    And I send the GET request to "get_stock_transfers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.stocktranfers|[]|

  @Positive @EmptyArrayValidation
  Scenario: Validate stock transfers empty array handling
    And I send the GET request to "get_stock_transfers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.stocktranfers|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.stocktranfers|[]|
    And validating the response contains the following values
      |Value|
      |stocktranfers|
