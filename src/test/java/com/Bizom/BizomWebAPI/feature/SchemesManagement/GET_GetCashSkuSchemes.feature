@BizomWebAPI @PI @SchemesManagement @GetCashSkuSchemes @PaymentProcessing
Feature: GetCashSkuSchemes API Testing
  As a system user
  I want to test the getcashskuschemes endpoint
  So that I can ensure proper functionality and data retrieval for cash SKU schemes

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get cash SKU schemes without access token
    When I send the GET request to "get_cash_sku_schemes" endpoint with path parameters
      |Path|Value|
      |warehouseId|3|
      |typeId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get cash SKU schemes with invalid access token
    And I send the GET request to "get_cash_sku_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|warehouseId|3|
      |||typeId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get cash SKU schemes with expired access token
    And I send the GET request to "get_cash_sku_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|warehouseId|3|
      |||typeId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get cash SKU schemes with malformed access token
    And I send the GET request to "get_cash_sku_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|warehouseId|3|
      |||typeId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_05 Get cash SKU schemes with empty access token
    And I send the GET request to "get_cash_sku_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token||warehouseId|3|
      |||typeId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_06 Get cash SKU schemes with valid parameters
    And I send the GET request to "get_cash_sku_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|3|
      |||typeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.qpsCashSkuScheme|[]|
    And I store the response as "getcashskuschemes_response" name using full path

  @Positive @DataValidation
  Scenario: TC_07 Validate get cash SKU schemes response structure
    And I send the GET request to "get_cash_sku_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|3|
      |||typeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.qpsCashSkuScheme|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.qpsCashSkuScheme|array|

  @Positive @DataValidation
  Scenario: TC_08 Validate get cash SKU schemes response contains required fields
    And I send the GET request to "get_cash_sku_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|3|
      |||typeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |result|
      |qpsCashSkuScheme|

  @Negative @Validation
  Scenario: TC_09 Get cash SKU schemes with invalid warehouseId
    And I send the GET request to "get_cash_sku_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|abc|
      |||typeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_10 Get cash SKU schemes with invalid typeId
    And I send the GET request to "get_cash_sku_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|3|
      |||typeId|xyz|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_11 Get cash SKU schemes with non-existent warehouseId
    And I send the GET request to "get_cash_sku_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|999999|
      |||typeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_12 Get cash SKU schemes with non-existent typeId
    And I send the GET request to "get_cash_sku_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|3|
      |||typeId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_13 Get cash SKU schemes with blank warehouseId
    And I send the GET request to "get_cash_sku_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId||
      |||typeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_14 Get cash SKU schemes with blank typeId
    And I send the GET request to "get_cash_sku_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|3|
      |||typeId||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_15 Get cash SKU schemes with invalid endpoint
    And I send the GET request to "get_cash_sku_schemes_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|3|
      |||typeId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: TC_16 Performance test for get cash SKU schemes endpoint
    And I send the GET request to "get_cash_sku_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|3|
      |||typeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Positive @BusinessLogic
  Scenario: TC_17 Get cash SKU schemes with different warehouseId
    And I send the GET request to "get_cash_sku_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
      |||typeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Positive @BusinessLogic
  Scenario: TC_18 Get cash SKU schemes with different typeId
    And I send the GET request to "get_cash_sku_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|3|
      |||typeId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Positive @Boundary
  Scenario: TC_19 Get cash SKU schemes with zero warehouseId
    And I send the GET request to "get_cash_sku_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|0|
      |||typeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Boundary
  Scenario: TC_20 Get cash SKU schemes with zero typeId
    And I send the GET request to "get_cash_sku_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|3|
      |||typeId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Boundary
  Scenario: TC_21 Get cash SKU schemes with very large warehouseId
    And I send the GET request to "get_cash_sku_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2147483647|
      |||typeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Boundary
  Scenario: TC_22 Get cash SKU schemes with very large typeId
    And I send the GET request to "get_cash_sku_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|3|
      |||typeId|2147483647|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Regression
  Scenario: TC_23 Regression test for get cash SKU schemes endpoint
    And I send the GET request to "get_cash_sku_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|3|
      |||typeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.qpsCashSkuScheme|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.qpsCashSkuScheme|array|
    And I store the response as "getcashskuschemes_response" name using full path

