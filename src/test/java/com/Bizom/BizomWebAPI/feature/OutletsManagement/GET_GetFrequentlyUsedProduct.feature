@BizomWebAPI @CE @OutletsManagement @OutletsFrequentlyUsedProduct @InventoryOperations
Feature: Get Frequently Used Product API Testing
  As a system user
  I want to test the get frequently used product endpoint
  So that I can ensure proper functionality and data retrieval for frequently used products by order ID

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get frequently used product without access token
    When I send the GET request to "outlets_get_frequently_used_product" endpoint with path parameters
      |Path|Value|
      |orderId|3|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_02 Get frequently used product with invalid access token
    And I send the GET request to "outlets_get_frequently_used_product" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|orderId|3|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"   
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_03 Get frequently used product with expired access token
    And I send the GET request to "outlets_get_frequently_used_product" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|orderId|3|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_04 Get frequently used product with malformed access token
    And I send the GET request to "outlets_get_frequently_used_product" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|orderId|3|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get frequently used product for order ID 3 with valid access token
    And I send the GET request to "outlets_get_frequently_used_product" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.data|["6","5"]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|

  @Positive @Functional
  Scenario: TC_06 Get frequently used product for another order ID with valid access token
    And I send the GET request to "outlets_get_frequently_used_product" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|

  @Negative @Validation
  Scenario: TC_07 Get frequently used product with invalid order ID
    And I send the GET request to "outlets_get_frequently_used_product" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_08 Get frequently used product with non-existent order ID
    And I send the GET request to "outlets_get_frequently_used_product" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @ErrorHandling
  Scenario: TC_09 Get frequently used product with invalid endpoint
    And I send the GET request to "outlets_get_frequently_used_product_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|3|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: TC_10 Performance test for frequently used product endpoint
    And I send the GET request to "outlets_get_frequently_used_product" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|3|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Regression
  Scenario: TC_11 Regression test for frequently used product endpoint
    And I send the GET request to "outlets_get_frequently_used_product" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Positive @DataValidation
  Scenario: TC_12 Validate frequently used product response completeness for order ID 3
    And I send the GET request to "outlets_get_frequently_used_product" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.data|["6","5"]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data[0]|"6"|
      |$.data[1]|"5"|
