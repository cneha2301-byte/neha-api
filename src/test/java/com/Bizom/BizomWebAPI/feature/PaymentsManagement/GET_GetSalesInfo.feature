@BizomWebAPI @OS @PaymentsManagement @GetSalesInfo @SalesOperations
Feature: Get Sales Info API Testing
  As a system user
  I want to test the get sales info endpoint with date range, warehouse and outlet parameters
  So that I can ensure proper functionality and data retrieval for sales information by date range, warehouse and outlet

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get sales info without access token
    When I send the GET request to "payments_getsalesinfo" endpoint with path parameters
      |Path|Value|
      |fromDate|2022-01-22|
      |toDate|2022-03-22|
      |warehouseId|1|
      |outletId|2|
      |includeDetails|true|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get sales info with invalid access token
#    And I send the GET request to "payments_getsalesinfo" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|invalid_token_12345|fromDate|2022-01-22|
#      |||toDate|2022-03-22|
#      |||warehouseId|1|
#      |||outletId|2|
#      |||includeDetails|true|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get sales info with expired access token
#    And I send the GET request to "payments_getsalesinfo" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|expired_token_12345|fromDate|2022-01-22|
#      |||toDate|2022-03-22|
#      |||warehouseId|1|
#      |||outletId|2|
#      |||includeDetails|true|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get sales info with malformed access token
#    And I send the GET request to "payments_getsalesinfo" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|malformed.token.here|fromDate|2022-01-22|
#      |||toDate|2022-03-22|
#      |||warehouseId|1|
#      |||outletId|2|
#      |||includeDetails|true|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: Get sales info with valid access token - fromDate 2022-01-22, toDate 2022-03-22, warehouseId 1, outletId 2, includeDetails true
    And I send the GET request to "payments_getsalesinfo" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|2022-01-22|
      |||toDate|2022-03-22|
      |||warehouseId|1|
      |||outletId|2|
      |||includeDetails|true|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.result|"true"|
      |$.Reason|""|
      |$.reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.result|string|
      |$.Reason|string|
      |$.reason|string|
      |$.Payments|array|

  @Positive @Functional
  Scenario: Get sales info with different date range
    And I send the GET request to "payments_getsalesinfo" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|2022-02-01|
      |||toDate|2022-02-28|
      |||warehouseId|1|
      |||outletId|2|
      |||includeDetails|true|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Payments|array|

#  @Positive @Functional
#  Scenario: Get sales info with different warehouse and outlet
#    And I send the GET request to "payments_getsalesinfo" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|fromDate|2022-01-22|
#      |||toDate|2022-03-22|
#      |||warehouseId|2|
#      |||outletId|1|
#      |||includeDetails|true|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|string|
#      |$.Payments|array|

  @Positive @Functional
  Scenario: Get sales info with includeDetails set to false
    And I send the GET request to "payments_getsalesinfo" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|2022-01-22|
      |||toDate|2022-03-22|
      |||warehouseId|1|
      |||outletId|2|
      |||includeDetails|false|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Payments|array|

  @Negative @Validation
  Scenario: Get sales info with invalid date format
    And I send the GET request to "payments_getsalesinfo" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|invalid-date|
      |||toDate|2022-03-22|
      |||warehouseId|1|
      |||outletId|2|
      |||includeDetails|true|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

#  @Negative @Validation
#  Scenario: Get sales info with invalid warehouse ID
#    And I send the GET request to "payments_getsalesinfo" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|fromDate|2022-01-22|
#      |||toDate|2022-03-22|
#      |||warehouseId|abc|
#      |||outletId|2|
#      |||includeDetails|true|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds

#  @Negative @Validation
#  Scenario: Get sales info with invalid outlet ID
#    And I send the GET request to "payments_getsalesinfo" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|fromDate|2022-01-22|
#      |||toDate|2022-03-22|
#      |||warehouseId|1|
#      |||outletId|abc|
#      |||includeDetails|true|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds

#  @Negative @Validation
#  Scenario: Get sales info with non-existent warehouse ID
#    And I send the GET request to "payments_getsalesinfo" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|fromDate|2022-01-22|
#      |||toDate|2022-03-22|
#      |||warehouseId|999999|
#      |||outletId|2|
#      |||includeDetails|true|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: Get sales info with non-existent outlet ID
    And I send the GET request to "payments_getsalesinfo" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|2022-01-22|
      |||toDate|2022-03-22|
      |||warehouseId|1|
      |||outletId|999999|
      |||includeDetails|true|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: Get sales info with toDate before fromDate
    And I send the GET request to "payments_getsalesinfo" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|2022-03-22|
      |||toDate|2022-01-22|
      |||warehouseId|1|
      |||outletId|2|
      |||includeDetails|true|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @ErrorHandling
  Scenario: Get sales info with invalid endpoint
    And I send the GET request to "payments_getsalesinfo_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|2022-01-22|
      |||toDate|2022-03-22|
      |||warehouseId|1|
      |||outletId|2|
      |||includeDetails|true|
    Then I should see the response code as "404"
    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance test for get sales info endpoint
    And I send the GET request to "payments_getsalesinfo" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|2022-01-22|
      |||toDate|2022-03-22|
      |||warehouseId|1|
      |||outletId|2|
      |||includeDetails|true|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Regression
  Scenario: Regression test for get sales info endpoint
    And I send the GET request to "payments_getsalesinfo" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|2022-01-22|
      |||toDate|2022-03-22|
      |||warehouseId|1|
      |||outletId|2|
      |||includeDetails|true|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.result|"true"|
      |$.Reason|""|
      |$.reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.result|string|
      |$.Reason|string|
      |$.reason|string|
      |$.Payments|array|
      |$.Payments[0]|object|
      |$.Payments[0].Payment|object|
      |$.Payments[0].Warehouse|object|
      |$.Payments[0].Outlet|object|

  @Positive @DataValidation
  Scenario: Validate payments array structure and content
    And I send the GET request to "payments_getsalesinfo" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|2022-01-22|
      |||toDate|2022-03-22|
      |||warehouseId|1|
      |||outletId|2|
      |||includeDetails|true|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.result|"true"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Payments|array|
      |$.Payments[0].Payment|object|
      |$.Payments[0].Payment.id|string|
      |$.Payments[0].Payment.amount|string|
      |$.Payments[0].Payment.outlet_id|string|
      |$.Payments[0].Warehouse|object|
      |$.Payments[0].Warehouse.name|string|
      |$.Payments[0].Warehouse.id|string|
      |$.Payments[0].Outlet|object|
      |$.Payments[0].Outlet.name|string|
      |$.Payments[0].Outlet.id|string|
      |$.Payments[0].User|object|
      |$.Payments[0].User.id|string|
      |$.Payments[0].User.name|string|

  @Positive @Smoke
  Scenario: Get sales info with valid access token - DB validation
    And I send the GET request to "payments_getsalesinfo" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|2022-01-22|
      |||toDate|2022-03-22|
      |||warehouseId|1|
      |||outletId|2|
      |||includeDetails|true|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|"true"|
      |$.result|"true"|
      |$.Reason|""|
      |$.reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.result|string|
      |$.Reason|string|
      |$.reason|string|
      |$.Payments|array|


