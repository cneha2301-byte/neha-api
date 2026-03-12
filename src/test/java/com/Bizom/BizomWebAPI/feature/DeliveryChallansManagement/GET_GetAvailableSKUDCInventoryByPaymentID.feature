@BizomWebAPI @CE @DeliveryChallansManagement @GetAvailableSKUDCInventoryByPaymentID @IntegrationServices
Feature: Get Available SKU DC Inventory By Payment ID API Testing
  As a system user
  I want to test the get available SKU DC inventory by payment ID endpoint
  So that I can ensure proper functionality and data retrieval for available SKU DC inventory by payment ID

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get available SKU DC inventory by payment ID without access token
    When I send the GET request to "deliverychallans_getavailableskudcinventorybypaymentid" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get available SKU DC inventory by payment ID with invalid access token
    And I send the GET request to "deliverychallans_getavailableskudcinventorybypaymentid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get available SKU DC inventory by payment ID with expired access token
    And I send the GET request to "deliverychallans_getavailableskudcinventorybypaymentid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get available SKU DC inventory by payment ID with malformed access token
    And I send the GET request to "deliverychallans_getavailableskudcinventorybypaymentid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get available SKU DC inventory by payment ID with valid access token
    And I send the GET request to "deliverychallans_getavailableskudcinventorybypaymentid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.availableInventory|[0]|
      |$.unitsPerCase|[]|
    And I store the response as "available_sku_dc_inventory_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate available SKU DC inventory by payment ID response structure
    And I send the GET request to "deliverychallans_getavailableskudcinventorybypaymentid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.availableInventory|[0]|
      |$.unitsPerCase|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.availableInventory|array|
      |$.unitsPerCase|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate available SKU DC inventory by payment ID availableInventory array structure
    And I send the GET request to "deliverychallans_getavailableskudcinventorybypaymentid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.availableInventory|array|
      |$.availableInventory[0]|number|

  @Positive @DataValidation
  Scenario: TC_08 Validate available SKU DC inventory by payment ID unitsPerCase array structure
    And I send the GET request to "deliverychallans_getavailableskudcinventorybypaymentid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.unitsPerCase|array|

  @Positive @DataValidation
  Scenario: TC_09 Validate available SKU DC inventory by payment ID with static values
    And I send the GET request to "deliverychallans_getavailableskudcinventorybypaymentid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.availableInventory[0]|0|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.availableInventory|array|
      |$.availableInventory[0]|number|
      |$.unitsPerCase|array|

  @Positive @Performance
  Scenario: TC_10 Performance test for available SKU DC inventory by payment ID endpoint
    And I send the GET request to "deliverychallans_getavailableskudcinventorybypaymentid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.availableInventory|[0]|
      |$.unitsPerCase|[]|

  @Positive @Concurrency
  Scenario: TC_11 Concurrent access test for available SKU DC inventory by payment ID endpoint
    And I send the GET request to "deliverychallans_getavailableskudcinventorybypaymentid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.availableInventory|[0]|
      |$.unitsPerCase|[]|

  @Negative @Validation
  Scenario: TC_12 Get available SKU DC inventory by payment ID with invalid query parameters
    And I send the GET request to "deliverychallans_getavailableskudcinventorybypaymentid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.availableInventory|[0]|
      |$.unitsPerCase|[]|

  @Negative @Validation
  Scenario: TC_13 Get available SKU DC inventory by payment ID with special characters in query parameters
    And I send the GET request to "deliverychallans_getavailableskudcinventorybypaymentid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.availableInventory|[0]|
      |$.unitsPerCase|[]|

  @Negative @Security
  Scenario: TC_14 Get available SKU DC inventory by payment ID with SQL injection attempt
    And I send the GET request to "deliverychallans_getavailableskudcinventorybypaymentid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE deliverychallans; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.availableInventory|[0]|
      |$.unitsPerCase|[]|

  @Negative @Boundary
  Scenario: TC_15 Get available SKU DC inventory by payment ID with maximum query parameters
    And I send the GET request to "deliverychallans_getavailableskudcinventorybypaymentid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.availableInventory|[0]|
      |$.unitsPerCase|[]|

#  @Negative @ErrorHandling
#  Scenario: TC_16 Get available SKU DC inventory by payment ID with invalid endpoint
#    And I send the GET request to "deliverychallans_getavailableskudcinventorybypaymentid_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_17 Validate available SKU DC inventory by payment ID business logic
    And I send the GET request to "deliverychallans_getavailableskudcinventorybypaymentid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.availableInventory|[0]|
      |$.unitsPerCase|[]|
      |$.availableInventory[0]|0|

  @Positive @DataIntegrity
  Scenario: TC_18 Validate available SKU DC inventory by payment ID data integrity
    And I send the GET request to "deliverychallans_getavailableskudcinventorybypaymentid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.availableInventory|[0]|
      |$.unitsPerCase|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.availableInventory|array|
      |$.unitsPerCase|array|
      |$.availableInventory[0]|number|

  @Positive @Regression
  Scenario: TC_19 Regression test for available SKU DC inventory by payment ID endpoint
    And I send the GET request to "deliverychallans_getavailableskudcinventorybypaymentid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.availableInventory|[0]|
      |$.unitsPerCase|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.availableInventory|array|
      |$.unitsPerCase|array|

  @Positive @Functional
  Scenario: TC_20 Validate available SKU DC inventory by payment ID response completeness
    And I send the GET request to "deliverychallans_getavailableskudcinventorybypaymentid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.availableInventory|[0]|
      |$.unitsPerCase|[]|
      |$.availableInventory[0]|0|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.availableInventory|array|
      |$.unitsPerCase|array|
      |$.availableInventory[0]|number|

  @Positive @ArrayValidation
  Scenario: TC_21 Validate available SKU DC inventory by payment ID array structure and content
    And I send the GET request to "deliverychallans_getavailableskudcinventorybypaymentid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.availableInventory|array|
      |$.unitsPerCase|array|
      |$.availableInventory[0]|number|

  @Positive @ContentValidation
  Scenario: TC_22 Validate available SKU DC inventory by payment ID content structure
    And I send the GET request to "deliverychallans_getavailableskudcinventorybypaymentid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |availableInventory|
      |unitsPerCase|

  @Positive @LoadTesting
  Scenario: TC_23 Load testing for available SKU DC inventory by payment ID endpoint
    And I send the GET request to "deliverychallans_getavailableskudcinventorybypaymentid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.availableInventory|[0]|
      |$.unitsPerCase|[]|

  @Negative @Timeout
  Scenario: TC_24 Test available SKU DC inventory by payment ID endpoint timeout handling
    And I send the GET request to "deliverychallans_getavailableskudcinventorybypaymentid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.availableInventory|[0]|
      |$.unitsPerCase|[]|

  @Positive @EndToEnd
  Scenario: TC_25 End-to-end available SKU DC inventory by payment ID data retrieval workflow
    And I send the GET request to "deliverychallans_getavailableskudcinventorybypaymentid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.availableInventory|[0]|
      |$.unitsPerCase|[]|
      |$.availableInventory[0]|0|
    And I store the response as "available_sku_dc_inventory_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.availableInventory|array|
      |$.unitsPerCase|array|
      |$.availableInventory[0]|number|

