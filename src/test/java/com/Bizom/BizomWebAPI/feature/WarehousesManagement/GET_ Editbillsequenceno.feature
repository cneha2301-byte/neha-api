@BizomWebAPI @CE @WarehousesManagement @WarehouseManagement @EditBillSequenceNo @SystemIntegration
Feature: Edit Bill Sequence Number API Testing
  As a system user
  I want to test the edit bill sequence number endpoint
  So that I can ensure proper functionality and data retrieval for warehouse billing sequences

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get edit bill sequence number without access token
    When I send the GET request to "warehouse_edit_bill_sequence_no" endpoint with path parameters
      |Path|Value|
      |warehouseId|3|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get edit bill sequence number with invalid access token
    And I send the GET request to "warehouse_edit_bill_sequence_no" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|warehouseId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get edit bill sequence number with expired access token
    And I send the GET request to "warehouse_edit_bill_sequence_no" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|warehouseId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get edit bill sequence number with malformed access token
    And I send the GET request to "warehouse_edit_bill_sequence_no" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|warehouseId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds


  @Negative @Validation
  Scenario: TC_05 Get edit bill sequence number with non-existent warehouse ID
    And I send the GET request to "warehouse_edit_bill_sequence_no" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds


  @Negative @Validation
  Scenario: TC_06 Get edit bill sequence number with negative warehouse ID
    And I send the GET request to "warehouse_edit_bill_sequence_no" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_07 Get edit bill sequence number with zero warehouse ID
    And I send the GET request to "warehouse_edit_bill_sequence_no" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_08 Get edit bill sequence number with very large warehouse ID
    And I send the GET request to "warehouse_edit_bill_sequence_no" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|999999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_09 Get edit bill sequence number with XSS attempt in warehouse ID
    And I send the GET request to "warehouse_edit_bill_sequence_no" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_10 Get edit bill sequence number with SQL injection attempt in warehouse ID
    And I send the GET request to "warehouse_edit_bill_sequence_no" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|3' OR '1'='1|
    Then I should see the response code as "500"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_11 Get edit bill sequence number with missing warehouse ID parameter
    When I send the GET request to "warehouse_edit_bill_sequence_no_no_params" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "500"
    And verify response time is less than "2500" milliseconds

   @Negative @AccessControl
  Scenario: TC_12 Validate unauthorized user cannot access warehouse sequence numbers
    And I send the GET request to "warehouse_edit_bill_sequence_no" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|UNAUTHORIZED_TOKEN|warehouseId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @ResponseHeaders
  Scenario: TC_13 Validate response headers for edit bill sequence number endpoint
    And I send the GET request to "warehouse_edit_bill_sequence_no" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|3|
    Then I should see the response code as "200"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Connection|keep-alive|
    And verify response time is less than "2500" milliseconds
