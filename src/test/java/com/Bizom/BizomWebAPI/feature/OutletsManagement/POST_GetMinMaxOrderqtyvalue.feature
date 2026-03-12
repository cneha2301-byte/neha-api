@BizomWebAPI @CE @OutletsManagement @GetMinMaxOrderqtyvalue @SystemOperations
Feature: Get Min Max Order Qty Value API Testing
  As a system user
  I want to test the get min max order qty value endpoint
  So that I can ensure proper functionality and data retrieval for minimum and maximum order quantity values

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get min max order qty value without access token
    And I post the request with "POST_outlets_getMinMaxOrderqtyvalue" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token||
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get min max order qty value with invalid access token
    And I post the request with "POST_outlets_getMinMaxOrderqtyvalue" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|invalid_token_12345|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get min max order qty value with expired access token
    And I post the request with "POST_outlets_getMinMaxOrderqtyvalue" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|expired_token_12345|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get min max order qty value with malformed access token
    And I post the request with "POST_outlets_getMinMaxOrderqtyvalue" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|malformed.token.here|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get min max order qty value with valid request
    And I post the request with "POST_outlets_getMinMaxOrderqtyvalue" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Errors|""|
      |$.OrderQty|[]|
    And I store the response as "getminmaxorderqtyvalue_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate get min max order qty value response structure
    And I post the request with "POST_outlets_getMinMaxOrderqtyvalue" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Errors|""|
      |$.OrderQty|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Errors|string|
      |$.OrderQty|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate get min max order qty value response contains expected fields
    And I post the request with "POST_outlets_getMinMaxOrderqtyvalue" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json"
    And validating the response contains the following values
      |Value|
      |Result|
      |Errors|
      |OrderQty|

  @Positive @Performance
  Scenario: TC_08 Performance test for get min max order qty value endpoint
    And I post the request with "POST_outlets_getMinMaxOrderqtyvalue" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And contentType as "application/json"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_09 Get min max order qty value with invalid outletIds format
    And I modify fields with random values and remove fields in "POST_outlets_getMinMaxOrderqtyvalue" payload
      |JPath|Value|
      |$.outletIds|["invalid"]|
    And I post the request with "POST_outlets_getMinMaxOrderqtyvalue" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_10 Get min max order qty value with invalid sendNewFormat
    And I modify fields with random values and remove fields in "POST_outlets_getMinMaxOrderqtyvalue" payload
      |JPath|Value|
      |$.sendNewFormat|abc|
    And I post the request with "POST_outlets_getMinMaxOrderqtyvalue" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_11 Get min max order qty value with empty body
    And I send empty body with "POST_outlets_getMinMaxOrderqtyvalue" request
    And I post the request with "POST_outlets_getMinMaxOrderqtyvalue" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_12 Get min max order qty value with missing outletIds
    And I modify fields with random values and remove fields in "POST_outlets_getMinMaxOrderqtyvalue" payload
      |JPath|Value|
      |$.outletIds|""|
    And I post the request with "POST_outlets_getMinMaxOrderqtyvalue" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_13 Get min max order qty value with missing sendNewFormat
    And I modify fields with random values and remove fields in "POST_outlets_getMinMaxOrderqtyvalue" payload
      |JPath|Value|
      |$.sendNewFormat|""|
    And I post the request with "POST_outlets_getMinMaxOrderqtyvalue" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_14 Get min max order qty value with empty outletIds array
    And I modify fields with random values and remove fields in "POST_outlets_getMinMaxOrderqtyvalue" payload
      |JPath|Value|
      |$.outletIds|[]|
    And I post the request with "POST_outlets_getMinMaxOrderqtyvalue" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_15 Get min max order qty value with non-existent outlet IDs
    And I modify fields with random values and remove fields in "POST_outlets_getMinMaxOrderqtyvalue" payload
      |JPath|Value|
      |$.outletIds|["999999,888888"]|
    And I post the request with "POST_outlets_getMinMaxOrderqtyvalue" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Negative @ErrorHandling
#  Scenario: TC_16 Get min max order qty value with invalid endpoint
#    And I post the request with "POST_outlets_getMinMaxOrderqtyvalue_invalid" payload with dynamic access token and query parameters
#      |Query|Value|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_17 Get min max order qty value with sendNewFormat set to 0
    And I modify fields with random values and remove fields in "POST_outlets_getMinMaxOrderqtyvalue" payload
      |JPath|Value|
      |$.sendNewFormat|0|
    And I post the request with "POST_outlets_getMinMaxOrderqtyvalue" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json"
    And the fields in response should match with expected values
      |$.Result|true|

  @Positive @BusinessLogic
  Scenario: TC_18 Get min max order qty value with different outlet IDs
    And I modify fields with random values and remove fields in "POST_outlets_getMinMaxOrderqtyvalue" payload
      |JPath|Value|
      |$.outletIds|["4,5,6"]|
    And I post the request with "POST_outlets_getMinMaxOrderqtyvalue" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @Regression
  Scenario: TC_19 Regression test for get min max order qty value endpoint
    And I post the request with "POST_outlets_getMinMaxOrderqtyvalue" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Errors|""|
      |$.OrderQty|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Errors|string|
      |$.OrderQty|array|

  @Positive @Concurrency
  Scenario: TC_20 Concurrent access test for get min max order qty value endpoint
    And I post the request with "POST_outlets_getMinMaxOrderqtyvalue" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @LoadTesting
  Scenario: TC_21 Load testing for get min max order qty value endpoint
    And I post the request with "POST_outlets_getMinMaxOrderqtyvalue" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And contentType as "application/json"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Timeout
  Scenario: TC_22 Test get min max order qty value endpoint timeout handling
    And I post the request with "POST_outlets_getMinMaxOrderqtyvalue" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And contentType as "application/json"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @EndToEnd
  Scenario: TC_23 End-to-end get min max order qty value workflow
    And I post the request with "POST_outlets_getMinMaxOrderqtyvalue" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Errors|""|
      |$.OrderQty|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Errors|string|
      |$.OrderQty|array|
    And I store the response as "getminmaxorderqtyvalue_response" name using full path

  @Positive @DataValidation
  Scenario: TC_24 Validate get min max order qty value OrderQty array structure
    And I post the request with "POST_outlets_getMinMaxOrderqtyvalue" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.OrderQty|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @Boundary
  Scenario: TC_25 Get min max order qty value with single outlet ID
    And I modify fields with random values and remove fields in "POST_outlets_getMinMaxOrderqtyvalue" payload
      |JPath|Value|
      |$.outletIds|["1"]|
    And I post the request with "POST_outlets_getMinMaxOrderqtyvalue" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @Boundary
  Scenario: TC_26 Get min max order qty value with many outlet IDs
    And I modify fields with random values and remove fields in "POST_outlets_getMinMaxOrderqtyvalue" payload
      |JPath|Value|
      |$.outletIds|["1,2,3,4,5,6,7,8,9,10"]|
    And I post the request with "POST_outlets_getMinMaxOrderqtyvalue" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @Integration
  Scenario: TC_27 Verify get min max order qty value endpoint integration
    And I post the request with "POST_outlets_getMinMaxOrderqtyvalue" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Errors|""|
    And I validate that the operation was successfully completed in the system

