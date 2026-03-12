@BizomWebAPI @CE @OutletsManagement @GetOutletSaleLedger @InventoryOperations
Feature: Get Outlet Sale Ledger API Testing
  As a system user
  I want to validate the outlet sale ledger endpoint
  So that I can ensure accurate transaction history is returned

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get outlet sale ledger without access token
    When I send the GET request to "outlets_get_outletsaleledger" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |outletId|2|
      |warehouseId|2|
      |fromDate|2020-07-03|
      |toDate|2025-10-01|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "3000" milliseconds

#  @Negative @Security
#  Scenario: TC_02 Get outlet sale ledger with invalid access token
#    And I send the GET request to "outlets_get_outletsaleledger" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|invalid_token_12345|
#      |outletId|2|
#      |warehouseId|2|
#      |fromDate|2020-07-03|
#      |toDate|2025-10-01|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#    And verify response time is less than "3000" milliseconds

#  @Negative @Security
#  Scenario: TC_03 Get outlet sale ledger with expired access token
#    And I send the GET request to "outlets_get_outletsaleledger" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|expired_token_12345|
#      |outletId|2|
#      |warehouseId|2|
#      |fromDate|2020-07-03|
#      |toDate|2025-10-01|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#    And verify response time is less than "3000" milliseconds

#  @Negative @Security
#  Scenario: TC_04 Get outlet sale ledger with malformed access token
#    And I send the GET request to "outlets_get_outletsaleledger" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|malformed.token.here|
#      |outletId|2|
#      |warehouseId|2|
#      |fromDate|2020-07-03|
#      |toDate|2025-10-01|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#    And verify response time is less than "3000" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get outlet sale ledger with valid access token
    And I send the GET request to "outlets_get_outletsaleledger" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|2|
      |warehouseId|2|
      |fromDate|2020-07-03|
      |toDate|2025-10-01|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.data[0].Cdnote.transaction_type|"cashcollection"|
    And verifies the list is not empty
      |JPath|
      |$.data|
    And I store the response as "outlet_sale_ledger_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate outlet sale ledger response structure
    And I send the GET request to "outlets_get_outletsaleledger" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|2|
      |warehouseId|2|
      |fromDate|2020-07-03|
      |toDate|2025-10-01|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.data|array|
      |$.data[0].Cdnote|object|
      |$.data[0].Cdnote.amount|string|
      |$.data[0].Cdnote.transaction_type|string|

  @Positive @ContentValidation
  Scenario: TC_07 Validate outlet sale ledger contains expected keys
    And I send the GET request to "outlets_get_outletsaleledger" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|2|
      |warehouseId|2|
      |fromDate|2020-07-03|
      |toDate|2025-10-01|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |result|
      |data|
      |Cdnote|
      |transaction_type|
      |amount|

  @Positive @DataValidation
  Scenario: TC_08 Validate outlet sale ledger credit and debit entries
    And I send the GET request to "outlets_get_outletsaleledger" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|2|
      |warehouseId|2|
      |fromDate|2020-07-03|
      |toDate|2025-10-01|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data[0].Cdnote.type|"CREDIT"|
      |$.data[1].Cdnote.type|"DEBIT"|

  @Positive @Functional
  Scenario: TC_09 Get outlet sale ledger with different date range
    And I send the GET request to "outlets_get_outletsaleledger" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|2|
      |warehouseId|2|
      |fromDate|2023-12-01|
      |toDate|2023-12-31|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: TC_10 Performance test for outlet sale ledger endpoint
    And I send the GET request to "outlets_get_outletsaleledger" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|2|
      |warehouseId|2|
      |fromDate|2020-07-03|
      |toDate|2025-10-01|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Positive @LoadTesting
  Scenario: TC_11 Load testing for outlet sale ledger endpoint
    And I send the GET request to "outlets_get_outletsaleledger" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|2|
      |warehouseId|2|
      |fromDate|2020-07-03|
      |toDate|2025-10-01|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @Validation
  Scenario: TC_12 Get outlet sale ledger with invalid outlet ID
    And I send the GET request to "outlets_get_outletsaleledger" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|abc|
      |warehouseId|2|
      |fromDate|2020-07-03|
      |toDate|2025-10-01|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Negative @Validation
  Scenario: TC_13 Get outlet sale ledger with invalid date range
    And I send the GET request to "outlets_get_outletsaleledger" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|2|
      |warehouseId|2|
      |fromDate|2025-10-01|
      |toDate|2020-07-03|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_14 Get outlet sale ledger with invalid endpoint
    And I send the GET request to "outlets_get_outletsaleledger_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|2|
      |warehouseId|2|
      |fromDate|2020-07-03|
      |toDate|2025-10-01|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "3000" milliseconds

  @Negative @Timeout
  Scenario: TC_15 Timeout validation for outlet sale ledger endpoint
    And I send the GET request to "outlets_get_outletsaleledger" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|2|
      |warehouseId|2|
      |fromDate|2020-07-03|
      |toDate|2025-10-01|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds

  @Positive @EndToEnd
  Scenario: TC_16 End-to-end outlet sale ledger workflow validation
    And I send the GET request to "outlets_get_outletsaleledger" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|2|
      |warehouseId|2|
      |fromDate|2020-07-03|
      |toDate|2025-10-01|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.data[0].Cdnote.transaction_type|"cashcollection"|
      |$.data[0].Cdnote.type|"CREDIT"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data[0].Cdnote.id|string|
      |$.data[0].Cdnote.transaction_type|string|
      |$.data[0].Cdnote.amount|string|


