@BizomWebAPI @CE @OutletsManagement @GetOutlet @InventoryOperations
Feature: Get Outlet API Testing
  As a system user
  I want to test the get outlet endpoint
  So that I can ensure proper functionality and data retrieval for individual outlet information

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get outlet without access token
    When I send the GET request to "outlets_get_outlet" endpoint with path parameters
      |Path|Value|
      |outletId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get outlet with invalid access token
    And I send the GET request to "outlets_get_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|outletId|1|
    Then I should see the response code as "200"
     And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get outlet with expired access token
    And I send the GET request to "outlets_get_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|outletId|1|
    Then I should see the response code as "200"
     And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get outlet with malformed access token
    And I send the GET request to "outlets_get_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|outletId|1|
    Then I should see the response code as "200"
     And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get outlet for outlet ID 1 with valid access token
    And I send the GET request to "outlets_get_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.data.Outlet.id|"1"|
      |$.data.Outlet.name|"SLV Traders"|
    And I store the response as "outlet_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate outlet response structure
    And I send the GET request to "outlets_get_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.data|object|
      |$.data.Outlet|object|

  @Positive @DataValidation
  Scenario: TC_07 Validate outlet object structure
    And I send the GET request to "outlets_get_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data.Outlet.id|string|
      |$.data.Outlet.name|string|
      |$.data.Outlet.address|string|
      |$.data.Outlet.phoneno|string|
      |$.data.Outlet.email|string|
      |$.data.Outlet.erp_id|string|
      |$.data.Outlet.warehouse_id|string|
      |$.data.Outlet.latitude|string|
      |$.data.Outlet.longitude|string|
      |$.data.Outlet.approved|string|
      |$.data.Outlet.isdistributor|string|

  @Positive @DataValidation
  Scenario: TC_08 Validate outlet specific field values
    And I send the GET request to "outlets_get_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.data.Outlet.id|"1"|
      |$.data.Outlet.name|"SLV Traders"|
      |$.data.Outlet.address|"Bangalore"|
      |$.data.Outlet.phoneno|"9886145638"|
      |$.data.Outlet.email|"sadhananda@mobisy.com"|
      |$.data.Outlet.erp_id|"trp123"|
      |$.data.Outlet.approved|"1"|

  @Positive @Functional
  Scenario: TC_09 Get outlet for outlet ID 2 with valid access token
    And I send the GET request to "outlets_get_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.data.Outlet|object|

  @Positive @Performance
  Scenario: TC_10 Performance test for outlet endpoint
    And I send the GET request to "outlets_get_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Negative @Validation
  Scenario: TC_11 Get outlet with invalid outlet ID
    And I send the GET request to "outlets_get_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: TC_12 Get outlet with maximum query parameters
    And I send the GET request to "outlets_get_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
      |param1|value1|                    | |
      |param2|value2|                    | |
      |param3|value3|                    | |
      |param4|value4|                    | |
      |param5|value5|                    | |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

#  @Negative @ErrorHandling
#  Scenario: TC_13 Get outlet with invalid endpoint
#    And I send the GET request to "outlets_get_outlet_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|outletId|1|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_14 Validate outlet business logic fields
    And I send the GET request to "outlets_get_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data.Outlet.approved|string|
      |$.data.Outlet.isdistributor|string|
      |$.data.Outlet.is_outlet|string|
      |$.data.Outlet.is_lead|boolean|

  @Positive @DataIntegrity
  Scenario: TC_15 Validate outlet data integrity with database
    And I send the GET request to "outlets_get_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.data.Outlet.name|DB:outlets:name:id=1|

  @Positive @Regression
  Scenario: TC_16 Regression test for outlet endpoint
    And I send the GET request to "outlets_get_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.data|object|
      |$.data.Outlet|object|

  @Positive @Functional
  Scenario: TC_17 Validate outlet response completeness
    And I send the GET request to "outlets_get_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |data|
      |Outlet|
      |id|
      |name|
      |address|
      |phoneno|
      |email|
      |warehouse_id|
      |latitude|
      |longitude|

  @Negative @Timeout
  Scenario: TC_18 Test outlet endpoint timeout handling
    And I send the GET request to "outlets_get_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Positive @EndToEnd
  Scenario: TC_19 End-to-end outlet retrieval workflow
    And I send the GET request to "outlets_get_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.data.Outlet.id|"1"|
      |$.data.Outlet.name|"SLV Traders"|
      |$.data.Outlet.address|"Bangalore"|
      |$.data.Outlet.phoneno|"9886145638"|
      |$.data.Outlet.email|"sadhananda@mobisy.com"|
      |$.data.Outlet.erp_id|"trp123"|
    And I store the response as "outlet_e2e_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.data|object|
      |$.data.Outlet|object|
      |$.data.Outlet.id|string|
      |$.data.Outlet.name|string|
      |$.data.Outlet.address|string|
      |$.data.Outlet.phoneno|string|
      |$.data.Outlet.email|string|

  @Positive @DataValidation
  Scenario: TC_20 Validate outlet location data
    And I send the GET request to "outlets_get_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data.Outlet.latitude|"24.74449027"|
      |$.data.Outlet.longitude|"67.88417735"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data.Outlet.latitude|string|
      |$.data.Outlet.longitude|string|

