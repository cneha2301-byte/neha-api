@BizomWebAPI @SchemesManagement @GetPaymentModeSchemes @PaymentProcessing
Feature: GetPaymentModeSchemes API Testing
  As a system user
  I want to test the getPaymentModeSchemes endpoint
  So that I can ensure proper functionality and data retrieval for payment mode schemes

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get payment mode schemes without access token
    When I send the GET request to "get_payment_mode_schemes" endpoint with path parameters
      |Path|Value|
      |warehouseId|2|
      |outletId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get payment mode schemes with invalid access token
    And I send the GET request to "get_payment_mode_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|warehouseId|2|
      |||outletId|2|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get payment mode schemes with expired access token
    And I send the GET request to "get_payment_mode_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|warehouseId|2|
      |||outletId|2|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get payment mode schemes with malformed access token
    And I send the GET request to "get_payment_mode_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|warehouseId|2|
      |||outletId|2|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_05 Get payment mode schemes with empty access token
    And I send the GET request to "get_payment_mode_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token||warehouseId|2|
      |||outletId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke @DBValidation
  Scenario: TC_06 Get payment mode schemes with valid access token
    And I send the GET request to "get_payment_mode_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
      |||outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|
      |$.Data.128.Schemegroup.name|DB:schemegroups:name: id=128|
      |$.Data.128.Schemegroup.erp_id|DB:schemegroups:erp_id: id=128|
    And I store the response as "get_payment_mode_schemes_response" name using full path

  @Positive @DataValidation
  Scenario: TC_07 Validate payment mode schemes response structure
    And I send the GET request to "get_payment_mode_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
      |||outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verifies the field is present in the response
      |JPath|
      |$.Result|
      |$.Reason|
      |$.Data|

  @Positive @DataValidation
  Scenario: TC_08 Validate payment mode schemes response data types
    And I send the GET request to "get_payment_mode_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
      |||outletId|2|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|

  @Positive @ContentValidation
  Scenario: TC_09 Validate payment mode schemes response contains key business objects
    And I send the GET request to "get_payment_mode_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
      |||outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Schemegroup|
      |slabs|
      |paymentmodes|
      |collectionmode|

  @Positive @ResponseHeaders
  Scenario: TC_10 Verify payment mode schemes response headers
    And I send the GET request to "get_payment_mode_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
      |||outletId|2|
    Then I should see the response code as "200"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json; charset=UTF-8|
      |Connection|keep-alive|
    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: TC_11 Performance test for payment mode schemes endpoint
    And I send the GET request to "get_payment_mode_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
      |||outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @Concurrency
  Scenario: TC_12 Concurrent access test for payment mode schemes endpoint
    And I send the GET request to "get_payment_mode_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
      |||outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_13 Get payment mode schemes with invalid query parameters
    And I send the GET request to "get_payment_mode_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
      |invalid_param|invalid_value|outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_14 Get payment mode schemes with special characters in query parameters
    And I send the GET request to "get_payment_mode_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
      |test_param|<script>alert('XSS')</script>|outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Security
  Scenario: TC_15 Get payment mode schemes with SQL injection attempt in query parameter
    And I send the GET request to "get_payment_mode_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
      |test_param|'; DROP TABLE schemegroups; --|outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Boundary
  Scenario: TC_16 Get payment mode schemes with maximum query parameters
    And I send the GET request to "get_payment_mode_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
      |param1|value1|outletId|2|
      |param2|value2|||
      |param3|value3|||
      |param4|value4|||
      |param5|value5|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_17 Get payment mode schemes with blank warehouseId
    And I send the GET request to "get_payment_mode_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId||
      |||outletId|2|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Invalid Warehouse / Outlet Id / Payment mode|
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_18 Get payment mode schemes with blank outletId
    And I send the GET request to "get_payment_mode_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
      |||outletId||
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Invalid Warehouse / Outlet Id / Payment mode|
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_19 Get payment mode schemes with non-existent outletId
    And I send the GET request to "get_payment_mode_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
      |||outletId|999999|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Invalid Warehouse / Outlet Id / Payment mode|
    And verify response time is less than "2500" milliseconds

  @Positive @Boundary
  Scenario: TC_20 Get payment mode schemes with zero warehouseId
    And I send the GET request to "get_payment_mode_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|0|
      |||outletId|2|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Invalid Warehouse / Outlet Id / Payment mode|
    And verify response time is less than "2500" milliseconds

  @Positive @Boundary
  Scenario: TC_21 Get payment mode schemes with zero outletId
    And I send the GET request to "get_payment_mode_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
      |||outletId|0|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Invalid Warehouse / Outlet Id / Payment mode|
    And verify response time is less than "2500" milliseconds