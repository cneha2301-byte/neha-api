@BizomWebAPI @CE @OutletsManagement @GetOutletInfo @InventoryOperations
Feature: Get Outlet Info API Testing
  As a system user
  I want to test the get outlet info endpoint
  So that I can ensure accurate outlet master information is returned

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get outlet info without access token
    When I send the GET request to "outlets_get_outlet_info" endpoint with path parameters
      |Path|Value|
      |outletId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_02 Get outlet info with invalid access token
#    And I send the GET request to "outlets_get_outlet_info" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|invalid_token_12345|outletId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_03 Get outlet info with expired access token
#    And I send the GET request to "outlets_get_outlet_info" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|expired_token_12345|outletId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_04 Get outlet info with malformed access token
#    And I send the GET request to "outlets_get_outlet_info" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|malformed.token.here|outletId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get outlet info for outlet ID 1 with valid access token
    And I send the GET request to "outlets_get_outlet_info" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Outlets[0].Outletid|"1"|
      |$.Outlets[0].Outlet.name|"SLV Traders"|
      |$.Outlets[0].Outlet.address|"Bangalore"|
    And I store the response as "outlet_info_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate outlet info response structure
    And I send the GET request to "outlets_get_outlet_info" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Outlets|array|
      |$.Outlets[0].Outletid|string|
      |$.Outlets[0].Outlet|object|
      |$.Outlets[0].Outlet.outletLanguage|array|
      |$.Outlets[0].Outletareamapping|array|
      |$.Outlets[0].Outlet.is_lead|boolean|
      |$.Outlets[0].retailerOrderCount|number|

  @Positive @ContentValidation
  Scenario: TC_07 Validate outlet info specific field values
    And I send the GET request to "outlets_get_outlet_info" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Outlets[0].Outlet.phoneno|"9886145638"|
      |$.Outlets[0].Outlet.warehouse_id|"1"|
      |$.Outlets[0].Outlet.outletLanguage[0].Name|"SLV Traders"|
      |$.Outlets[0].Outlet.outletLanguage[0].Language|"en"|

  @Positive @ContentValidation
  Scenario: TC_08 Validate outlet info response contains required keys
    And I send the GET request to "outlets_get_outlet_info" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Outlets|
      |Outlet|
      |outletLanguage|
      |Outletareamapping|

  @Positive @DataIntegrity
  Scenario: TC_09 Validate outlet geo coordinates for outlet ID 1
    And I send the GET request to "outlets_get_outlet_info" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Outlets[0].Outlet.latitude|"24.74449027"|
      |$.Outlets[0].Outlet.longitude|"67.88417735"|
      |$.Outlets[0].Outlet.is_lead|false|

  @Positive @Performance
  Scenario: TC_10 Performance test for outlet info endpoint
    And I send the GET request to "outlets_get_outlet_info" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Positive @Regression
  Scenario: TC_11 Regression validation for outlet language metadata
    And I send the GET request to "outlets_get_outlet_info" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Outlets[0].Outlet.outletLanguage|array|
      |$.Outlets[0].Outlet.outletLanguage[0]|object|
      |$.Outlets[0].Outlet.outletLanguage[0].Name|string|
      |$.Outlets[0].Outlet.outletLanguage[0].Language|string|

  @Positive @ArrayValidation
  Scenario: TC_12 Validate outlet info list contents are present
    And I send the GET request to "outlets_get_outlet_info" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verifies the list is not empty
      |JPath|
      |$.Outlets|
      |$.Outlets[0].Outlet.outletLanguage|

  @Negative @ErrorHandling
  Scenario: TC_13 Get outlet info with invalid endpoint
    And I send the GET request to "outlets_get_outlet_info_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

