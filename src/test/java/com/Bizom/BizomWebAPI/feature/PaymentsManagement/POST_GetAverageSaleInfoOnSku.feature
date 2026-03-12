@BizomWebAPI @OS @PaymentsManagement @GetAverageSaleInfoOnSku @SystemOperations
Feature: Get Average Sale Info On SKU API Testing
  As a system user
  I want to test the get average sale info on SKU endpoint
  So that I can ensure proper functionality and data retrieval for average sale information based on outlet, SKU unit, and type

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get average sale info on SKU without access token
    And I post the request with "POST_payments_getAverageSaleInfoOnSku" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token||
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get average sale info on SKU with invalid access token
    And I post the request with "POST_payments_getAverageSaleInfoOnSku" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|"Invalid Access Token or Credentials"|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get average sale info on SKU with expired access token
    And I post the request with "POST_payments_getAverageSaleInfoOnSku" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|"Invalid Access Token or Credentials"|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get average sale info on SKU with malformed access token
    And I post the request with "POST_payments_getAverageSaleInfoOnSku" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|"Invalid Access Token or Credentials"|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get average sale info on SKU with valid request
    And I post the request with "POST_payments_getAverageSaleInfoOnSku" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data not found"|
    And I store the response as "getaveragesaleinfoonsku_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate get average sale info on SKU response structure
    And I post the request with "POST_payments_getAverageSaleInfoOnSku" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data not found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|

  @Positive @DataValidation
  Scenario: TC_07 Validate get average sale info on SKU Data object structure
    And I post the request with "POST_payments_getAverageSaleInfoOnSku" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data.outletId|string|
      |$.Data.skunitId|string|
      |$.Data.avgSaleData|number|
      |$.Data.soq|number|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Data|
      |outletId|
      |skunitId|
      |avgSaleData|
      |soq|

  @Positive @DataValidation
  Scenario: TC_08 Validate get average sale info on SKU Data object contains expected fields
    And I post the request with "POST_payments_getAverageSaleInfoOnSku" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Data.outletId|"4"|
      |$.Data.skunitId|"4"|
      |$.Data.avgSaleData|0|
      |$.Data.soq|0|

  @Positive @Performance
  Scenario: TC_09 Performance test for get average sale info on SKU endpoint
    And I post the request with "POST_payments_getAverageSaleInfoOnSku" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_10 Get average sale info on SKU with invalid outletId
    And I modify fields with random values and remove fields in "POST_payments_getAverageSaleInfoOnSku" payload
      |JPath|Value|
      |$.outletId|abc|
    And I post the request with "POST_payments_getAverageSaleInfoOnSku" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_11 Get average sale info on SKU with invalid skunitId
    And I modify fields with random values and remove fields in "POST_payments_getAverageSaleInfoOnSku" payload
      |JPath|Value|
      |$.skunitId|xyz|
    And I post the request with "POST_payments_getAverageSaleInfoOnSku" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_12 Get average sale info on SKU with invalid type
    And I modify fields with random values and remove fields in "POST_payments_getAverageSaleInfoOnSku" payload
      |JPath|Value|
      |$.type|invalid_type|
    And I post the request with "POST_payments_getAverageSaleInfoOnSku" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_13 Get average sale info on SKU with empty body
    And I send empty body with "POST_payments_getAverageSaleInfoOnSku" request
    And I post the request with "POST_payments_getAverageSaleInfoOnSku" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_14 Get average sale info on SKU with missing outletId
    And I modify fields with random values and remove fields in "POST_payments_getAverageSaleInfoOnSku" payload
      |JPath|Value|
      |$.outletId|""|
    And I post the request with "POST_payments_getAverageSaleInfoOnSku" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_15 Get average sale info on SKU with missing skunitId
    And I modify fields with random values and remove fields in "POST_payments_getAverageSaleInfoOnSku" payload
      |JPath|Value|
      |$.skunitId|""|
    And I post the request with "POST_payments_getAverageSaleInfoOnSku" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_16 Get average sale info on SKU with missing type
    And I modify fields with random values and remove fields in "POST_payments_getAverageSaleInfoOnSku" payload
      |JPath|Value|
      |$.type|""|
    And I post the request with "POST_payments_getAverageSaleInfoOnSku" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_17 Get average sale info on SKU with non-existent outletId
    And I modify fields with random values and remove fields in "POST_payments_getAverageSaleInfoOnSku" payload
      |JPath|Value|
      |$.outletId|999999|
    And I post the request with "POST_payments_getAverageSaleInfoOnSku" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_18 Get average sale info on SKU with non-existent skunitId
    And I modify fields with random values and remove fields in "POST_payments_getAverageSaleInfoOnSku" payload
      |JPath|Value|
      |$.skunitId|999999|
    And I post the request with "POST_payments_getAverageSaleInfoOnSku" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Negative @ErrorHandling
#  Scenario: TC_19 Get average sale info on SKU with invalid endpoint
#    And I post the request with "POST_payments_getAverageSaleInfoOnSku_invalid" payload with dynamic access token and query parameters
#      |Query|Value|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_20 Get average sale info on SKU with different outletId
    And I modify fields with random values and remove fields in "POST_payments_getAverageSaleInfoOnSku" payload
      |JPath|Value|
      |$.outletId|1|
    And I post the request with "POST_payments_getAverageSaleInfoOnSku" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @BusinessLogic
  Scenario: TC_21 Get average sale info on SKU with different skunitId
    And I modify fields with random values and remove fields in "POST_payments_getAverageSaleInfoOnSku" payload
      |JPath|Value|
      |$.skunitId|1|
    And I post the request with "POST_payments_getAverageSaleInfoOnSku" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @BusinessLogic
  Scenario: TC_22 Get average sale info on SKU with different type
    And I modify fields with random values and remove fields in "POST_payments_getAverageSaleInfoOnSku" payload
      |JPath|Value|
      |$.type|sale|
    And I post the request with "POST_payments_getAverageSaleInfoOnSku" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @Regression
  Scenario: TC_23 Regression test for get average sale info on SKU endpoint
    And I post the request with "POST_payments_getAverageSaleInfoOnSku" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data not found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|
      |$.Data.outletId|string|
      |$.Data.skunitId|string|
      |$.Data.avgSaleData|number|
      |$.Data.soq|number|

  @Positive @Concurrency
  Scenario: TC_24 Concurrent access test for get average sale info on SKU endpoint
    And I post the request with "POST_payments_getAverageSaleInfoOnSku" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @LoadTesting
  Scenario: TC_25 Load testing for get average sale info on SKU endpoint
    And I post the request with "POST_payments_getAverageSaleInfoOnSku" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Timeout
  Scenario: TC_26 Test get average sale info on SKU endpoint timeout handling
    And I post the request with "POST_payments_getAverageSaleInfoOnSku" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @EndToEnd
  Scenario: TC_27 End-to-end get average sale info on SKU workflow
    And I post the request with "POST_payments_getAverageSaleInfoOnSku" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data not found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|
      |$.Data.outletId|string|
      |$.Data.skunitId|string|
      |$.Data.avgSaleData|number|
      |$.Data.soq|number|
    And I store the response as "getaveragesaleinfoonsku_response" name using full path

  @Positive @DataValidation
  Scenario: TC_28 Validate get average sale info on SKU Data numeric fields
    And I post the request with "POST_payments_getAverageSaleInfoOnSku" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data.avgSaleData|number|
      |$.Data.soq|number|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @Boundary
  Scenario: TC_29 Get average sale info on SKU with very large outletId
    And I modify fields with random values and remove fields in "POST_payments_getAverageSaleInfoOnSku" payload
      |JPath|Value|
      |$.outletId|2147483647|
    And I post the request with "POST_payments_getAverageSaleInfoOnSku" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Boundary
  Scenario: TC_30 Get average sale info on SKU with very large skunitId
    And I modify fields with random values and remove fields in "POST_payments_getAverageSaleInfoOnSku" payload
      |JPath|Value|
      |$.skunitId|2147483647|
    And I post the request with "POST_payments_getAverageSaleInfoOnSku" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Boundary
  Scenario: TC_31 Get average sale info on SKU with zero outletId
    And I modify fields with random values and remove fields in "POST_payments_getAverageSaleInfoOnSku" payload
      |JPath|Value|
      |$.outletId|0|
    And I post the request with "POST_payments_getAverageSaleInfoOnSku" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Boundary
  Scenario: TC_32 Get average sale info on SKU with zero skunitId
    And I modify fields with random values and remove fields in "POST_payments_getAverageSaleInfoOnSku" payload
      |JPath|Value|
      |$.skunitId|0|
    And I post the request with "POST_payments_getAverageSaleInfoOnSku" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Integration
  Scenario: TC_33 Verify get average sale info on SKU endpoint integration
    And I post the request with "POST_payments_getAverageSaleInfoOnSku" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data not found"|
      |$.Data.outletId|"4"|
      |$.Data.skunitId|"4"|
    And I validate that the operation was successfully completed in the system

