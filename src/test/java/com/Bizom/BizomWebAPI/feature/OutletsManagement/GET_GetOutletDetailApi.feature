@BizomWebAPI @CE @OutletsManagement @GetOutletDetailAPI @InventoryOperations
  #Failing in login page
Feature: Get Outlet Detail API Testing
  As a system user
  I want to test the get outlet detail API endpoint
  So that I can ensure proper functionality and data retrieval for outlet details by order ID

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get outlet detail without access token
    When I send the GET request to "outlets_get_outlet_detail_api" endpoint with path parameters
      |Path|Value|
      |orderId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: TC_02 Get outlet detail with invalid access token
#    And I send the GET request to "outlets_get_outlet_detail_api" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|invalid_token_12345|orderId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#    And verify response time is less than "2000" milliseconds
#
#  @Negative @Security
#  Scenario: TC_03 Get outlet detail with expired access token
#    And I send the GET request to "outlets_get_outlet_detail_api" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|expired_token_12345|orderId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#    And verify response time is less than "2000" milliseconds
#
#  @Negative @Security
#  Scenario: TC_04 Get outlet detail with malformed access token
#    And I send the GET request to "outlets_get_outlet_detail_api" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|malformed.token.here|orderId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#    And verify response time is less than "2000" milliseconds
#
#  @Positive @Smoke
#  Scenario: TC_05 Get outlet detail for order ID 1 with valid access token
#    And I send the GET request to "outlets_get_outlet_detail_api" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|orderId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Data.Outlet.id|"1"|
#      |$.Data.Outlet.name|SLV Traders|
#    And I store the response as "outlet_detail_response" name using full path
#
#  @Negative @Validation
#  Scenario: TC_06 Get outlet detail with invalid order ID
#    And I send the GET request to "outlets_get_outlet_detail_api" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|orderId|abc|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#
#  @Negative @Validation
#  Scenario: TC_07 Get outlet detail with non-existent order ID
#    And I send the GET request to "outlets_get_outlet_detail_api" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|orderId|999999|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|

  @Negative @ErrorHandling
  Scenario: TC_08 Get outlet detail with invalid endpoint
    And I send the GET request to "outlets_get_outlet_detail_api_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: TC_09 Performance test for outlet detail endpoint
    And I send the GET request to "outlets_get_outlet_detail_api" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Regression
  Scenario: TC_10 Regression test for outlet detail endpoint
    And I send the GET request to "outlets_get_outlet_detail_api" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

#  @Positive @Smoke @DatabaseValidation
#  Scenario: TC_11 Get outlet detail for order ID 1 with database validation
#    And I send the GET request to "outlets_get_outlet_detail_api" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|orderId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Data.Outlet.name|DB:outlets:name: id=1|
#      |$.Data.Outlet.address|DB:outlets:address: id=1|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Data.Outlet|object|
#      |$.Data.Outlet.id|string|
#      |$.Data.Outlet.name|string|
#      |$.Data.Outletareamapping|array|
#      |$.Data.selectBeats|array|
#      |$.Data.Customoutletdata|array|
#      |$.Data.payeedata|array|
#      |$.Data.outletcontacts|array|
#      |$.Data.outletLanguage|array|
#      |$.Data.externalErpIds|array|
#
#  @Integration @DatabaseValidation
#  Scenario: TC_12 Validate outlet detail outlet name against database
#    And I send the GET request to "outlets_get_outlet_detail_api" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|orderId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Data.Outlet.name|DB:outlets:name: id=1|
#
#  @Integration @DatabaseValidation
#  Scenario: TC_13 Validate outlet detail outlet address against database
#    And I send the GET request to "outlets_get_outlet_detail_api" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|orderId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Data.Outlet.address|DB:outlets:address: id=1|
#
#  @Integration @DatabaseValidation
#  Scenario: TC_14 Validate outlet detail complete data integrity with database
#    And I send the GET request to "outlets_get_outlet_detail_api" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|orderId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Data.Outlet.name|DB:outlets:name: id=1|
#      |$.Data.Outlet.address|DB:outlets:address: id=1|
#
#  @Positive @DataValidation
#  Scenario: TC_15   Validate outlet detail response structure for order ID 1
#    And I send the GET request to "outlets_get_outlet_detail_api" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|orderId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Data.Outlet.id|"1"|
#      |$.Data.Outlet.name|SLV Traders|
#      |$.Data.Outlet.panno|"4321"|
#      |$.Data.Outlet.erp_id|trp123|
#      |$.Data.Outlet.address|Bangalore|
#      |$.Data.Outletareamapping|[]|
#      |$.Data.selectBeats|[]|
#      |$.Data.Customoutletdata|[]|
#      |$.Data.payeedata|[]|
#      |$.Data.outletcontacts|[]|
#      |$.Data.outletLanguage|[]|
#      |$.Data.externalErpIds|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Data.Outlet|object|
#      |$.Data.Outlet.id|string|
#      |$.Data.Outlet.name|string|
#      |$.Data.Outletareamapping|array|
#      |$.Data.selectBeats|array|
#      |$.Data.Customoutletdata|array|
#      |$.Data.payeedata|array|
#      |$.Data.outletcontacts|array|
#      |$.Data.outletLanguage|array|
#      |$.Data.externalErpIds|array|

