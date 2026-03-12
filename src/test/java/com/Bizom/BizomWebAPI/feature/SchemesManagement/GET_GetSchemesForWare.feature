@BizomWebAPI @PI @SchemesManagement @GetSchemesForWare @PaymentProcessing
Feature: GetSchemesForWare API Testing
  As a system user
  I want to test the getschemesforware endpoint
  So that I can ensure proper functionality and data retrieval for schemes for warehouse

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get schemes for ware without access token
    When I send the GET request to "get_schemes_for_ware" endpoint with path parameters
      |Path|Value|
      |warehouseId|1|
      |typeId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get schemes for ware with invalid access token
    And I send the GET request to "get_schemes_for_ware" endpoint with dynamic access token, path and query parameters
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
  Scenario: TC_03 Get schemes for ware with expired access token
    And I send the GET request to "get_schemes_for_ware" endpoint with dynamic access token, path and query parameters
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
  Scenario: TC_04 Get schemes for ware with malformed access token
    And I send the GET request to "get_schemes_for_ware" endpoint with dynamic access token, path and query parameters
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
  Scenario: TC_05 Get schemes for ware with empty access token
    And I send the GET request to "get_schemes_for_ware" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token||warehouseId|1|
      |||typeId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_06 Verify Reason field when no scheme present
    And I send the GET request to "get_schemes_for_ware" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
      |||typeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Reason|"No scheme present"|

  @Positive @DataValidation
  Scenario: TC_07 Validate get schemes for ware response structure
    And I send the GET request to "get_schemes_for_ware" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
      |||typeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No scheme present"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Negative @Validation
  Scenario: TC_08 Get schemes for ware with invalid warehouseId
    And I send the GET request to "get_schemes_for_ware" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|abc|
      |||typeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_09 Get schemes for ware with invalid typeId
    And I send the GET request to "get_schemes_for_ware" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
      |||typeId|xyz|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_10 Get schemes for ware with non-existent warehouseId
    And I send the GET request to "get_schemes_for_ware" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|999999|
      |||typeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_11 Get schemes for ware with non-existent typeId
    And I send the GET request to "get_schemes_for_ware" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
      |||typeId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_12 Get schemes for ware with blank warehouseId
    And I send the GET request to "get_schemes_for_ware" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId||
      |||typeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_13 Get schemes for ware with blank typeId
    And I send the GET request to "get_schemes_for_ware" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
      |||typeId||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_14 Get schemes for ware with invalid endpoint
    And I send the GET request to "get_schemes_for_ware_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
      |||typeId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: TC_15 Performance test for get schemes for ware endpoint
    And I send the GET request to "get_schemes_for_ware" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
      |||typeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Reason|"No scheme present"|

  @Positive @BusinessLogic
  Scenario: TC_16 Get schemes for ware with different warehouseId
    And I send the GET request to "get_schemes_for_ware" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
      |||typeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_17 Get schemes for ware with different typeId
    And I send the GET request to "get_schemes_for_ware" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
      |||typeId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Boundary
  Scenario: TC_18 Get schemes for ware with zero warehouseId
    And I send the GET request to "get_schemes_for_ware" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|0|
      |||typeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Boundary
  Scenario: TC_19 Get schemes for ware with zero typeId
    And I send the GET request to "get_schemes_for_ware" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
      |||typeId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Boundary
  Scenario: TC_20 Get schemes for ware with very large warehouseId
    And I send the GET request to "get_schemes_for_ware" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2147483647|
      |||typeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Boundary
  Scenario: TC_21 Get schemes for ware with very large typeId
    And I send the GET request to "get_schemes_for_ware" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
      |||typeId|2147483647|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Regression
  Scenario: TC_22 Regression test for get schemes for ware endpoint
    And I send the GET request to "get_schemes_for_ware" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
      |||typeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No scheme present"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
    And I store the response as "getschemesforware_response" name using full path

  @Positive @DataValidation
  Scenario: TC_23 Validate get schemes for ware response contains required fields
    And I send the GET request to "get_schemes_for_ware" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
      |||typeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|

