@BizomWebAPI @OS @InventoriesManagement @UpdateAlertLevel @SystemIntegration
Feature: Update Alert Level API Testing
  As a system user
  I want to test the updatealertlevel endpoint
  So that I can ensure alert levels can be updated successfully

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
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
  Scenario: TC_01 Update alert level without access token
    When I send the GET request to "inventories_updatealertlevel" endpoint with path parameters
      |Path|Value|
      |inventoryId|1|
      |warehouseId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Update alert level with invalid access token
    And I send the GET request to "inventories_updatealertlevel" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|inventoryId|1|
      |||warehouseId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Update alert level with expired access token
    And I send the GET request to "inventories_updatealertlevel" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|inventoryId|1|
      |||warehouseId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Update alert level with malformed access token
    And I send the GET request to "inventories_updatealertlevel" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|inventoryId|1|
      |||warehouseId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Update alert level with valid request
    And I send the GET request to "inventories_updatealertlevel" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|inventoryId|1|
      |||warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.success|"1"|
      |$.message|"<h3 style='color:#0099ff;'>Alert level saved successfully.</h3>"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.success|string|
      |$.message|string|
    And I store the response as "update_alert_level_response" name using full path

  @Positive @Performance
  Scenario: TC_06 Performance test for update alert level endpoint
    And I send the GET request to "inventories_updatealertlevel" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|inventoryId|1|
      |||warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.success|"1"|

  @Negative @Validation
  Scenario: TC_07 Update alert level with invalid inventory ID
    And I send the GET request to "inventories_updatealertlevel" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|inventoryId|abc|
      |||warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.success|string|

  @Negative @Validation
  Scenario: TC_08 Update alert level with invalid warehouse ID
    And I send the GET request to "inventories_updatealertlevel" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|inventoryId|1|
      |||warehouseId|xyz|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.success|string|

#  @Negative @ErrorHandling
#  Scenario: TC_09 Update alert level with invalid endpoint
#    And I send the GET request to "inventories_updatealertlevel_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|inventoryId|1|
#      |||warehouseId|1|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @ContentValidation
  Scenario: TC_10 Validate update alert level response contains mandatory keys
    And I send the GET request to "inventories_updatealertlevel" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|inventoryId|1|
      |||warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |success|
      |message|

  @Positive @Regression
  Scenario: TC_11 Regression test for update alert level endpoint
    And I send the GET request to "inventories_updatealertlevel" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|inventoryId|1|
      |||warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.success|"1"|
      |$.message|"<h3 style='color:#0099ff;'>Alert level saved successfully.</h3>"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.success|string|
      |$.message|string|

  @Positive @Concurrency
  Scenario: TC_12 Concurrent access test for update alert level endpoint
    And I send the GET request to "inventories_updatealertlevel" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|inventoryId|1|
      |||warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.success|"1"|

  @Positive @LoadTesting
  Scenario: TC_13 Load testing for update alert level endpoint
    And I send the GET request to "inventories_updatealertlevel" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|inventoryId|1|
      |||warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.success|"1"|

  @Negative @Timeout
  Scenario: TC_14 Test update alert level endpoint timeout handling
    And I send the GET request to "inventories_updatealertlevel" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|inventoryId|1|
      |||warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.success|"1"|


