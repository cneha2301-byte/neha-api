@BizomWebAPI @PI @SchemesManagement @GetStaggeredQpsScheme @PaymentProcessing
Feature: GetStaggeredQpsScheme API Testing
  As a system user
  I want to test the getStaggeredQpsScheme endpoint
  So that I can ensure proper functionality and HTML page rendering for staggered QPS schemes

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get staggered QPS scheme without access token
    When I send the GET request to "get_staggered_qps_scheme" endpoint with path parameters
      |Path|Value|
      |warehouseId|1|
      |typeId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get staggered QPS scheme with invalid access token
    And I send the GET request to "get_staggered_qps_scheme" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|warehouseId|1|
      |||typeId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get staggered QPS scheme with expired access token
    And I send the GET request to "get_staggered_qps_scheme" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|warehouseId|1|
      |||typeId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get staggered QPS scheme with malformed access token
    And I send the GET request to "get_staggered_qps_scheme" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|warehouseId|1|
      |||typeId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_05 Get staggered QPS scheme with empty access token
    And I send the GET request to "get_staggered_qps_scheme" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token||warehouseId|1|
      |||typeId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_06 Get staggered QPS scheme with valid access token and verify HTML content
    And I send the GET request to "get_staggered_qps_scheme" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
      |||typeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the response body should contain "On Going Qps Scheme"
    And I store the response as "getstaggeredqpsscheme_response" name using full path

  @Positive @DataValidation
  Scenario: TC_07 Validate staggered QPS scheme HTML response structure
    And I send the GET request to "get_staggered_qps_scheme" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
      |||typeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the response body should contain "On Going Qps Scheme"

  @Negative @Validation
  Scenario: TC_08 Get staggered QPS scheme with invalid warehouseId
    And I send the GET request to "get_staggered_qps_scheme" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|abc|
      |||typeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_09 Get staggered QPS scheme with invalid typeId
    And I send the GET request to "get_staggered_qps_scheme" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
      |||typeId|xyz|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_10 Get staggered QPS scheme with non-existent warehouseId
    And I send the GET request to "get_staggered_qps_scheme" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|999999|
      |||typeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_11 Get staggered QPS scheme with non-existent typeId
    And I send the GET request to "get_staggered_qps_scheme" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
      |||typeId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_12 Get staggered QPS scheme with blank warehouseId
    And I send the GET request to "get_staggered_qps_scheme" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId||
      |||typeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_13 Get staggered QPS scheme with blank typeId
    And I send the GET request to "get_staggered_qps_scheme" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
      |||typeId||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_14 Get staggered QPS scheme with invalid endpoint
    And I send the GET request to "get_staggered_qps_scheme_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
      |||typeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: TC_15 Performance test for get staggered QPS scheme endpoint
    And I send the GET request to "get_staggered_qps_scheme" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
      |||typeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the response body should contain "On Going Qps Scheme"

  # @Positive @BusinessLogic
  # Scenario: TC_16 Get staggered QPS scheme with different warehouseId
    # And I send the GET request to "get_staggered_qps_scheme" endpoint with dynamic access token, path and query parameters
      # |QueryParamName|QueryParamValue|Path|Value|
      # |access_token|ACCESS_TOKEN|warehouseId|2|
      # |||typeId|1|
    # Then I should see the response code as "200"
    # And the HTML response should contain page title "Users"
    # And verify response time is less than "2500" milliseconds
    # And verify response headers
      # |HeaderName|HeaderValue|
      # |Content-Type|text/html; charset=UTF-8|

  @Positive @BusinessLogic
  Scenario: TC_17 Get staggered QPS scheme with different typeId
    And I send the GET request to "get_staggered_qps_scheme" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
      |||typeId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @Boundary
  Scenario: TC_18 Get staggered QPS scheme with zero warehouseId
    And I send the GET request to "get_staggered_qps_scheme" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|0|
      |||typeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Boundary
  Scenario: TC_19 Get staggered QPS scheme with zero typeId
    And I send the GET request to "get_staggered_qps_scheme" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
      |||typeId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Regression
  Scenario: TC_20 Regression test for get staggered QPS scheme endpoint
    And I send the GET request to "get_staggered_qps_scheme" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
      |||typeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the response body should contain "On Going Qps Scheme"

