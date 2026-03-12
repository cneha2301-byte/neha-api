@BizomWebAPI @SettingsManagement @GetSettingForWarehouse @SystemOperations @CE
Feature: GetSettingForWarehouse API Testing
  As a system user
  I want to test the getSettingForWarehouse endpoint
  So that I can ensure proper functionality and data retrieval for warehouse settings

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get setting for warehouse without access token
    When I send the GET request to "get_setting_for_warehouse" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |warehouseId|1|
      |settingName|orderonphone|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get setting for warehouse with invalid access token
    And I send the GET request to "get_setting_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
      |warehouseId|1|
      |settingName|orderonphone|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get setting for warehouse with expired access token
    And I send the GET request to "get_setting_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
      |warehouseId|1|
      |settingName|orderonphone|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get setting for warehouse with malformed access token
    And I send the GET request to "get_setting_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
      |warehouseId|1|
      |settingName|orderonphone|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_05 Get setting for warehouse with empty access token
    And I send the GET request to "get_setting_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token||
      |warehouseId|1|
      |settingName|orderonphone|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_06 Get setting for warehouse with valid parameters
    And I send the GET request to "get_setting_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|1|
      |settingName|orderonphone|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.Settings.orderonphone|"2"|
    And I store the response as "getsettingforwarehouse_response" name using full path

  @Positive @DataValidation
  Scenario: TC_07 Validate get setting for warehouse response structure
    And I send the GET request to "get_setting_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|1|
      |settingName|orderonphone|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.Settings.orderonphone|"2"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Settings|object|
      |$.Settings.orderonphone|string|

  @Positive @DataValidation
  Scenario: TC_08 Validate get setting for warehouse Settings object structure
    And I send the GET request to "get_setting_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|1|
      |settingName|orderonphone|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Settings|
      |orderonphone|

  @Negative @Validation
  Scenario: TC_09 Get setting for warehouse with invalid warehouseId
    And I send the GET request to "get_setting_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|abc|
      |settingName|orderonphone|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_10 Get setting for warehouse with invalid settingName
    And I send the GET request to "get_setting_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|1|
      |settingName|invalid_setting|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_11 Get setting for warehouse with non-existent warehouseId
    And I send the GET request to "get_setting_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|999999|
      |settingName|orderonphone|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_12 Get setting for warehouse with missing warehouseId
    And I send the GET request to "get_setting_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |settingName|orderonphone|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_13 Get setting for warehouse with missing settingName
    And I send the GET request to "get_setting_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_14 Get setting for warehouse with blank warehouseId
    And I send the GET request to "get_setting_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId||
      |settingName|orderonphone|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_15 Get setting for warehouse with blank settingName
    And I send the GET request to "get_setting_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|1|
      |settingName||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Negative @ErrorHandling
#  Scenario: TC_16 Get setting for warehouse with invalid endpoint
#    And I send the GET request to "get_setting_for_warehouse_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |warehouseId|1|
#      |settingName|orderonphone|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: TC_17 Performance test for get setting for warehouse endpoint
    And I send the GET request to "get_setting_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|1|
      |settingName|orderonphone|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @BusinessLogic
  Scenario: TC_18 Get setting for warehouse with different warehouseId
    And I send the GET request to "get_setting_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|2|
      |settingName|orderonphone|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @BusinessLogic
  Scenario: TC_19 Get setting for warehouse with different settingName
    And I send the GET request to "get_setting_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|1|
      |settingName|anothersetting|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"

  @Positive @Boundary
  Scenario: TC_20 Get setting for warehouse with zero warehouseId
    And I send the GET request to "get_setting_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|0|
      |settingName|orderonphone|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Boundary
  Scenario: TC_21 Get setting for warehouse with very large warehouseId
    And I send the GET request to "get_setting_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|2147483647|
      |settingName|orderonphone|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Regression
  Scenario: TC_22 Regression test for get setting for warehouse endpoint
    And I send the GET request to "get_setting_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|1|
      |settingName|orderonphone|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.Settings.orderonphone|"2"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Settings|object|
      |$.Settings.orderonphone|string|
    And I store the response as "getsettingforwarehouse_response" name using full path

