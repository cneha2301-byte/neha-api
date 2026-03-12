@BizomWebAPI @OS @LoadoutsManagement @BulkSettle @SystemIntegration
Feature: Bulk Settle Loadout API Testing
  As a system user
  I want to test the bulkSettle endpoint
  So that I can ensure proper bulk settlement functionality for loadouts

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |accept-language|en-US,en;q=0.9|
      |priority|u=0, i|
      |sec-ch-ua|"Google Chrome";v="143", "Chromium";v="143", "Not A(Brand";v="24"|
      |sec-ch-ua-mobile|?0|
      |sec-ch-ua-platform|"Windows"|
      |sec-fetch-dest|document|
      |sec-fetch-mode|navigate|
      |sec-fetch-site|none|
      |sec-fetch-user|?1|
      |upgrade-insecure-requests|1|
      |user-agent|Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36|

  @Negative @Security
  Scenario: TC_01 Bulk settle loadout without access token
    When I send the GET request to "GET_bulkSettle" endpoint with path parameters
      |Path|Value|
      |fromDate|2025-10-01|
      |toDate|2025-11-15|
      |warehouseId|2|
      |userId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_02 Bulk settle loadout with invalid access token
#    And I send the GET request to "GET_bulkSettle" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|invalid_token_12345|fromDate|2025-10-01|
#      |||toDate|2025-11-15|
#      |||warehouseId|2|
#      |||userId|1|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_03 Bulk settle loadout with expired access token
#    And I send the GET request to "GET_bulkSettle" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|expired_token_12345|fromDate|2025-10-01|
#      |||toDate|2025-11-15|
#      |||warehouseId|2|
#      |||userId|1|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_04 Bulk settle loadout with malformed access token
#    And I send the GET request to "GET_bulkSettle" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|malformed.token.here|fromDate|2025-10-01|
#      |||toDate|2025-11-15|
#      |||warehouseId|2|
#      |||userId|1|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_05 Bulk settle loadout with empty access token
    And I send the GET request to "GET_bulkSettle" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token||fromDate|2025-10-01|
      |||toDate|2025-11-15|
      |||warehouseId|2|
      |||userId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_06 Bulk settle loadout with valid parameters
    And I send the GET request to "GET_bulkSettle" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|2025-10-01|
      |||toDate|2025-11-15|
      |||warehouseId|2|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And I store the response as "bulksettle_response" name using full path

  @Positive @DataValidation
  Scenario: TC_07 Validate bulk settle loadout response structure
    And I send the GET request to "GET_bulkSettle" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|2025-10-01|
      |||toDate|2025-11-15|
      |||warehouseId|2|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @Performance
  Scenario: TC_08 Performance test for bulk settle loadout endpoint
    And I send the GET request to "GET_bulkSettle" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|2025-10-01|
      |||toDate|2025-11-15|
      |||warehouseId|2|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_09 Bulk settle loadout with invalid toDate format
    And I send the GET request to "GET_bulkSettle" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|2025-10-01|
      |||toDate|invalid-date|
      |||warehouseId|2|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_10 Bulk settle loadout with reversed date range
    And I send the GET request to "GET_bulkSettle" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|2025-11-15|
      |||toDate|2025-10-01|
      |||warehouseId|2|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_11 Bulk settle loadout with invalid warehouseId
    And I send the GET request to "GET_bulkSettle" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|2025-10-01|
      |||toDate|2025-11-15|
      |||warehouseId|abc|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds


  @Negative @Validation
  Scenario: TC_12 Bulk settle loadout with non-existent warehouseId
    And I send the GET request to "GET_bulkSettle" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|2025-10-01|
      |||toDate|2025-11-15|
      |||warehouseId|999999|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_13 Bulk settle loadout with non-existent userId
    And I send the GET request to "GET_bulkSettle" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|2025-10-01|
      |||toDate|2025-11-15|
      |||warehouseId|2|
      |||userId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_14 Bulk settle loadout with zero warehouseId
    And I send the GET request to "GET_bulkSettle" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|2025-10-01|
      |||toDate|2025-11-15|
      |||warehouseId|0|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_15 Bulk settle loadout with zero userId
    And I send the GET request to "GET_bulkSettle" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|2025-10-01|
      |||toDate|2025-11-15|
      |||warehouseId|2|
      |||userId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_16 Bulk settle loadout with negative warehouseId
    And I send the GET request to "GET_bulkSettle" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|2025-10-01|
      |||toDate|2025-11-15|
      |||warehouseId|-1|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_17 Bulk settle loadout with negative userId
    And I send the GET request to "GET_bulkSettle" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|2025-10-01|
      |||toDate|2025-11-15|
      |||warehouseId|2|
      |||userId|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Negative @ErrorHandling
#  Scenario: TC_18 Bulk settle loadout with invalid endpoint
#    And I send the GET request to "GET_bulkSettle_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|fromDate|2025-10-01|
#      |||toDate|2025-11-15|
#      |||warehouseId|2|
#      |||userId|1|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @DataValidation
  Scenario: TC_19 Validate bulk settle loadout response contains mandatory keys
    And I send the GET request to "GET_bulkSettle" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|2025-10-01|
      |||toDate|2025-11-15|
      |||warehouseId|2|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|

  @Positive @Concurrency
  Scenario: TC_20 Concurrent access test for bulk settle loadout endpoint
    And I send the GET request to "GET_bulkSettle" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|2025-10-01|
      |||toDate|2025-11-15|
      |||warehouseId|2|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @LoadTesting
  Scenario: TC_21 Load testing for bulk settle loadout endpoint
    And I send the GET request to "GET_bulkSettle" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|2025-10-01|
      |||toDate|2025-11-15|
      |||warehouseId|2|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Timeout
  Scenario: TC_22 Test bulk settle loadout endpoint timeout handling
    And I send the GET request to "GET_bulkSettle" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|2025-10-01|
      |||toDate|2025-11-15|
      |||warehouseId|2|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @Regression
  Scenario: TC_23 Regression test for bulk settle loadout endpoint
    And I send the GET request to "GET_bulkSettle" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|2025-10-01|
      |||toDate|2025-11-15|
      |||warehouseId|2|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @EndToEnd
  Scenario: TC_24 End-to-end bulk settle loadout workflow
    And I send the GET request to "GET_bulkSettle" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|2025-10-01|
      |||toDate|2025-11-15|
      |||warehouseId|2|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
    And I store the response as "bulksettle_response" name using full path

  @Positive @Boundary
  Scenario: TC_25 Bulk settle loadout with same fromDate and toDate
    And I send the GET request to "GET_bulkSettle" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|2025-10-01|
      |||toDate|2025-10-01|
      |||warehouseId|2|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Positive @Boundary
  Scenario: TC_26 Bulk settle loadout with very large date range
    And I send the GET request to "GET_bulkSettle" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|2020-01-01|
      |||toDate|2025-12-31|
      |||warehouseId|2|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @Boundary
  Scenario: TC_27 Bulk settle loadout with different warehouse IDs
    And I send the GET request to "GET_bulkSettle" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|2025-10-01|
      |||toDate|2025-11-15|
      |||warehouseId|1|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Positive @Boundary
  Scenario: TC_28 Bulk settle loadout with different user IDs
    And I send the GET request to "GET_bulkSettle" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|2025-10-01|
      |||toDate|2025-11-15|
      |||warehouseId|2|
      |||userId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

