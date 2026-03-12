@BizomWebAPI @OS @PaymentsManagement @GetSkusBelowStockTurnOverRatio @SalesOperations
Feature: Get SKUs Below Stock Turnover Ratio API Testing
  As a system user
  I want to test the get SKUs below stock turnover ratio endpoint
  So that I can ensure proper functionality and data retrieval for payments management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

#  @Negative @Security
#  Scenario: Get SKUs below stock turnover ratio without access token
#    When I send the GET request to "payments_get_skus_below_stock_turnover_ratio" endpoint with path parameters
#      |Path|Value|
#      |id|0|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get SKUs below stock turnover ratio with invalid access token
#    And I send the GET request to "payments_get_skus_below_stock_turnover_ratio" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|invalid_token_12345|id|0|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get SKUs below stock turnover ratio with expired access token
#    And I send the GET request to "payments_get_skus_below_stock_turnover_ratio" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|expired_token_12345|id|0|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get SKUs below stock turnover ratio with malformed access token
#    And I send the GET request to "payments_get_skus_below_stock_turnover_ratio" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|malformed.token.here|id|0|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get SKUs below stock turnover ratio for ID 0 with valid access token
    And I send the GET request to "payments_get_skus_below_stock_turnover_ratio" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
    And I store the response as "skus_below_stock_turnover_ratio_response" name using full path

  @Positive @Smoke
  Scenario: Get SKUs below stock turnover ratio for ID 1 with valid access token
    And I send the GET request to "payments_get_skus_below_stock_turnover_ratio" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
    And I store the response as "skus_below_stock_turnover_ratio_response" name using full path

  @Positive @DataValidation
  Scenario: Validate SKUs below stock turnover ratio response structure
    And I send the GET request to "payments_get_skus_below_stock_turnover_ratio" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Positive @DataValidation
  Scenario: Validate SKUs below stock turnover ratio empty array response
    And I send the GET request to "payments_get_skus_below_stock_turnover_ratio" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
    And validating the response contains the following values
      |Value|
      |[]|

  @Negative @Validation
  Scenario: Get SKUs below stock turnover ratio with invalid ID
    And I send the GET request to "payments_get_skus_below_stock_turnover_ratio" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Negative @Validation
  Scenario: Get SKUs below stock turnover ratio with non-numeric ID
    And I send the GET request to "payments_get_skus_below_stock_turnover_ratio" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get SKUs below stock turnover ratio with negative ID
    And I send the GET request to "payments_get_skus_below_stock_turnover_ratio" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Positive @DataValidation
  Scenario: Validate SKUs below stock turnover ratio with zero ID
    And I send the GET request to "payments_get_skus_below_stock_turnover_ratio" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

#  @Negative @ErrorHandling
#  Scenario: Get SKUs below stock turnover ratio with invalid endpoint
#    And I send the GET request to "payments_get_skus_below_stock_turnover_ratio_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|id|0|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: Performance test for SKUs below stock turnover ratio endpoint
    And I send the GET request to "payments_get_skus_below_stock_turnover_ratio" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|0|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: Concurrent access test for SKUs below stock turnover ratio endpoint
    And I send the GET request to "payments_get_skus_below_stock_turnover_ratio" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Positive @BusinessLogic
  Scenario: Validate SKUs below stock turnover ratio business logic
    And I send the GET request to "payments_get_skus_below_stock_turnover_ratio" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Positive @DataIntegrity
  Scenario: Validate SKUs below stock turnover ratio data integrity
    And I send the GET request to "payments_get_skus_below_stock_turnover_ratio" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Positive @Regression
  Scenario: Regression test for SKUs below stock turnover ratio endpoint
    And I send the GET request to "payments_get_skus_below_stock_turnover_ratio" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Positive @Functional
  Scenario: Validate SKUs below stock turnover ratio response completeness
    And I send the GET request to "payments_get_skus_below_stock_turnover_ratio" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Positive @ArrayValidation
  Scenario: Validate SKUs below stock turnover ratio array structure
    And I send the GET request to "payments_get_skus_below_stock_turnover_ratio" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Positive @ContentValidation
  Scenario: Validate SKUs below stock turnover ratio content structure
    And I send the GET request to "payments_get_skus_below_stock_turnover_ratio" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Positive @LoadTesting
  Scenario: Load testing for SKUs below stock turnover ratio endpoint
    And I send the GET request to "payments_get_skus_below_stock_turnover_ratio" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|0|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Negative @Timeout
  Scenario: Test SKUs below stock turnover ratio endpoint timeout handling
    And I send the GET request to "payments_get_skus_below_stock_turnover_ratio" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|0|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Positive @EndToEnd
  Scenario: End-to-end SKUs below stock turnover ratio data retrieval workflow
    And I send the GET request to "payments_get_skus_below_stock_turnover_ratio" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "skus_below_stock_turnover_ratio_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Positive @IdParameterValidation
  Scenario: Validate SKUs below stock turnover ratio with different IDs
    And I send the GET request to "payments_get_skus_below_stock_turnover_ratio" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Positive @EmptyArrayValidation
  Scenario: Validate SKUs below stock turnover ratio empty array response
    And I send the GET request to "payments_get_skus_below_stock_turnover_ratio" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Positive @FieldValidation
  Scenario: Validate SKUs below stock turnover ratio response type
    And I send the GET request to "payments_get_skus_below_stock_turnover_ratio" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

