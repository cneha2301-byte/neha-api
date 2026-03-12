@BizomWebAPI @CE @OutletsManagement @GetPendingInvoicesMultiDistributor @InventoryOperations
Feature: Get Pending Invoices Multi Distributor API Testing
  As a system user
  I want to test the get pending invoices multi distributor endpoint
  So that I can ensure pending invoice details are returned correctly for outlet-distributor pairs

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get pending invoices multi distributor without access token
    When I send the GET request to "outlets_get_pending_invoices_multi_distributor" endpoint with path parameters
      |Path|Value|
      |outletId|2|
      |distributorId|25|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_02 Get pending invoices multi distributor with invalid access token
#    And I send the GET request to "outlets_get_pending_invoices_multi_distributor" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|invalid_token_12345|outletId|2|
#      |||distributorId|25|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_03 Get pending invoices multi distributor with expired access token
#    And I send the GET request to "outlets_get_pending_invoices_multi_distributor" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|expired_token_12345|outletId|2|
#      |||distributorId|25|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_04 Get pending invoices multi distributor with malformed access token
#    And I send the GET request to "outlets_get_pending_invoices_multi_distributor" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|malformed.token.here|outletId|2|
#      |||distributorId|25|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

#  @Positive @Smoke
#  Scenario: TC_05 Get pending invoices multi distributor with valid access token
#    And I send the GET request to "outlets_get_pending_invoices_multi_distributor" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|outletId|2|
#      |||distributorId|25|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|"Data not found"|
#      |$.Data|[]|
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|"Data not found"|
#      |$.Data|[]|
#    And I store the response as "pending_invoices_multi_distributor_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate pending invoices multi distributor response structure
    And I send the GET request to "outlets_get_pending_invoices_multi_distributor" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
      |||distributorId|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|

  @Positive @Performance
  Scenario: TC_08 Performance test for pending invoices multi distributor endpoint
    And I send the GET request to "outlets_get_pending_invoices_multi_distributor" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
      |||distributorId|25|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

#  @Positive @Regression
#  Scenario: TC_09 Regression test for pending invoices multi distributor endpoint
#    And I send the GET request to "outlets_get_pending_invoices_multi_distributor" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|outletId|2|
#      |||distributorId|25|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|"Data not found"|

#  @Negative @Validation
#  Scenario: TC_10 Get pending invoices multi distributor with invalid distributor id
#    And I send the GET request to "outlets_get_pending_invoices_multi_distributor" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|outletId|2|
#      |||distributorId|999999|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|"Data not found"|

  @Negative @Validation
  Scenario: TC_11 Get pending invoices multi distributor using special characters in query parameters
    And I send the GET request to "outlets_get_pending_invoices_multi_distributor" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
      |test_param|<script>alert('XSS')</script>|distributorId|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Negative @Security
  Scenario: TC_12 Get pending invoices multi distributor with SQL injection attempt
    And I send the GET request to "outlets_get_pending_invoices_multi_distributor" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
      |test_param|'; DROP TABLE outlets; --|distributorId|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Negative @Boundary
  Scenario: TC_13 Get pending invoices multi distributor with large outlet identifier
    And I send the GET request to "outlets_get_pending_invoices_multi_distributor" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|9999999999|
      |||distributorId|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Negative @ErrorHandling
#  Scenario: TC_14 Get pending invoices multi distributor using invalid endpoint
#    And I send the GET request to "outlets_get_pending_invoices_multi_distributor_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|outletId|2|
#      |||distributorId|25|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the HTML response should contain page title "Users"

