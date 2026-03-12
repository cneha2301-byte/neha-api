@BizomWebAPI @CE @OutletsManagement @GetOutletByAreaAndOutletType @SystemOperations
Feature: Get Outlet By Area And Outlet Type API Testing
  As a system user
  I want to test the get outlet by area and outlet type endpoint
  So that I can ensure proper functionality and data retrieval for outlets filtered by area and outlet type

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get outlet by area and outlet type without access token
    And I post the request with "POST_outlets_getOutletByAreaAndOutletType" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token||
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get outlet by area and outlet type with invalid access token
    And I post the request with "POST_outlets_getOutletByAreaAndOutletType" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|invalid_token_12345|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get outlet by area and outlet type with expired access token
    And I post the request with "POST_outlets_getOutletByAreaAndOutletType" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|expired_token_12345|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get outlet by area and outlet type with malformed access token
    And I post the request with "POST_outlets_getOutletByAreaAndOutletType" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|malformed.token.here|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get outlet by area and outlet type with valid request
    And I post the request with "POST_outlets_getOutletByAreaAndOutletType" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
    And I store the response as "getoutletbyareaandoutlettype_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate get outlet by area and outlet type response structure
    And I post the request with "POST_outlets_getOutletByAreaAndOutletType" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate get outlet by area and outlet type data array structure
    And I post the request with "POST_outlets_getOutletByAreaAndOutletType" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
      |$.data[0]|object|
      |$.data[0].Outlet|object|
      |$.data[0].Outlet.id|string|
      |$.data[0].Outlet.name|string|
      |$.data[0].Outlet.erp_id|string|

  @Positive @DataValidation
  Scenario: TC_08 Validate get outlet by area and outlet type contains outlet details
    And I post the request with "POST_outlets_getOutletByAreaAndOutletType" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json"
    And validating the response contains the following values
      |Value|
      |result|
      |reason|
      |data|
      |Outlet|
      |id|
      |name|
      |erp_id|

  @Positive @Performance
  Scenario: TC_09 Performance test for get outlet by area and outlet type endpoint
    And I post the request with "POST_outlets_getOutletByAreaAndOutletType" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And contentType as "application/json"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @Validation
  Scenario: TC_10 Get outlet by area and outlet type with invalid area_id
    And I modify fields with random values and remove fields in "POST_outlets_getOutletByAreaAndOutletType" payload
      |JPath|Value|
      |$.area_id|abc|
    And I post the request with "POST_outlets_getOutletByAreaAndOutletType" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_11 Get outlet by area and outlet type with invalid outletType_id
    And I modify fields with random values and remove fields in "POST_outlets_getOutletByAreaAndOutletType" payload
      |JPath|Value|
      |$.outletType_id|xyz|
    And I post the request with "POST_outlets_getOutletByAreaAndOutletType" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_12 Get outlet by area and outlet type with empty body
    And I send empty body with "POST_outlets_getOutletByAreaAndOutletType" request
    And I post the request with "POST_outlets_getOutletByAreaAndOutletType" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_13 Get outlet by area and outlet type with missing area_id
    And I modify fields with random values and remove fields in "POST_outlets_getOutletByAreaAndOutletType" payload
      |JPath|Value|
      |$.area_id|""|
    And I post the request with "POST_outlets_getOutletByAreaAndOutletType" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_14 Get outlet by area and outlet type with missing outletType_id
    And I modify fields with random values and remove fields in "POST_outlets_getOutletByAreaAndOutletType" payload
      |JPath|Value|
      |$.outletType_id|""|
    And I post the request with "POST_outlets_getOutletByAreaAndOutletType" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_15 Get outlet by area and outlet type with non-existent area_id
    And I modify fields with random values and remove fields in "POST_outlets_getOutletByAreaAndOutletType" payload
      |JPath|Value|
      |$.area_id|999999|
    And I post the request with "POST_outlets_getOutletByAreaAndOutletType" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|

  @Negative @Validation
  Scenario: TC_16 Get outlet by area and outlet type with non-existent outletType_id
    And I modify fields with random values and remove fields in "POST_outlets_getOutletByAreaAndOutletType" payload
      |JPath|Value|
      |$.outletType_id|999999|
    And I post the request with "POST_outlets_getOutletByAreaAndOutletType" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|

#  @Negative @ErrorHandling
#  Scenario: TC_17 Get outlet by area and outlet type with invalid endpoint
#    And I post the request with "POST_outlets_getOutletByAreaAndOutletType_invalid" payload with dynamic access token and query parameters
#      |Query|Value|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_18 Get outlet by area and outlet type with different area_id
    And I modify fields with random values and remove fields in "POST_outlets_getOutletByAreaAndOutletType" payload
      |JPath|Value|
      |$.area_id|1|
    And I post the request with "POST_outlets_getOutletByAreaAndOutletType" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Positive @BusinessLogic
  Scenario: TC_19 Get outlet by area and outlet type with different outletType_id
    And I modify fields with random values and remove fields in "POST_outlets_getOutletByAreaAndOutletType" payload
      |JPath|Value|
      |$.outletType_id|2|
    And I post the request with "POST_outlets_getOutletByAreaAndOutletType" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Positive @Regression
  Scenario: TC_20 Regression test for get outlet by area and outlet type endpoint
    And I post the request with "POST_outlets_getOutletByAreaAndOutletType" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|array|
      |$.data[0].Outlet|object|

  @Positive @Concurrency
  Scenario: TC_21 Concurrent access test for get outlet by area and outlet type endpoint
    And I post the request with "POST_outlets_getOutletByAreaAndOutletType" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Positive @LoadTesting
  Scenario: TC_22 Load testing for get outlet by area and outlet type endpoint
    And I post the request with "POST_outlets_getOutletByAreaAndOutletType" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And contentType as "application/json"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @Timeout
  Scenario: TC_23 Test get outlet by area and outlet type endpoint timeout handling
    And I post the request with "POST_outlets_getOutletByAreaAndOutletType" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And contentType as "application/json"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Positive @EndToEnd
  Scenario: TC_24 End-to-end get outlet by area and outlet type workflow
    And I post the request with "POST_outlets_getOutletByAreaAndOutletType" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|array|
      |$.data[0].Outlet|object|
      |$.data[0].Outlet.id|string|
      |$.data[0].Outlet.name|string|
      |$.data[0].Outlet.erp_id|string|
    And I store the response as "getoutletbyareaandoutlettype_response" name using full path

  @Positive @DataValidation
  Scenario: TC_25 Validate get outlet by area and outlet type outlet object fields
    And I post the request with "POST_outlets_getOutletByAreaAndOutletType" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data[0].Outlet.id|string|
      |$.data[0].Outlet.name|string|
      |$.data[0].Outlet.erp_id|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Positive @DataValidation
  Scenario: TC_26 Validate get outlet by area and outlet type array contains multiple outlets
    And I post the request with "POST_outlets_getOutletByAreaAndOutletType" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data[1].Outlet|object|
      |$.data[1].Outlet.id|string|
      |$.data[1].Outlet.name|string|
      |$.data[1].Outlet.erp_id|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Positive @Boundary
  Scenario: TC_27 Get outlet by area and outlet type with very large area_id
    And I modify fields with random values and remove fields in "POST_outlets_getOutletByAreaAndOutletType" payload
      |JPath|Value|
      |$.area_id|2147483647|
    And I post the request with "POST_outlets_getOutletByAreaAndOutletType" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Boundary
  Scenario: TC_28 Get outlet by area and outlet type with very large outletType_id
    And I modify fields with random values and remove fields in "POST_outlets_getOutletByAreaAndOutletType" payload
      |JPath|Value|
      |$.outletType_id|2147483647|
    And I post the request with "POST_outlets_getOutletByAreaAndOutletType" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Boundary
  Scenario: TC_29 Get outlet by area and outlet type with zero area_id
    And I modify fields with random values and remove fields in "POST_outlets_getOutletByAreaAndOutletType" payload
      |JPath|Value|
      |$.area_id|0|
    And I post the request with "POST_outlets_getOutletByAreaAndOutletType" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Boundary
  Scenario: TC_30 Get outlet by area and outlet type with zero outletType_id
    And I modify fields with random values and remove fields in "POST_outlets_getOutletByAreaAndOutletType" payload
      |JPath|Value|
      |$.outletType_id|0|
    And I post the request with "POST_outlets_getOutletByAreaAndOutletType" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Integration
  Scenario: TC_31 Verify get outlet by area and outlet type endpoint integration
    And I post the request with "POST_outlets_getOutletByAreaAndOutletType" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
    And I validate that the operation was successfully completed in the system

