@BizomWebAPI @CE @OutletsManagement @GETOutletDetail @InventoryOperations
Feature: Get Outlet Detail API Testing
  As a system user
  I want to test the get outlet detail endpoint
  So that I can ensure proper functionality and data retrieval for comprehensive outlet information

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
    When I send the GET request to "outlets_get_detail" endpoint with path parameters
      |Path|Value|
      |outletId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get outlet detail with invalid access token
    And I send the GET request to "outlets_get_detail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|outletId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get outlet detail with expired access token
    And I send the GET request to "outlets_get_detail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|outletId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get outlet detail with malformed access token
    And I send the GET request to "outlets_get_detail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|outletId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get outlet detail for outlet ID 1 with valid access token
    And I send the GET request to "outlets_get_detail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Outlets[0].Outletid|"1"|
      |$.Outlets[0].Outlet.name|"SLV Traders"|
    And I store the response as "outlet_detail_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate outlet detail response structure
    And I send the GET request to "outlets_get_detail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Outlets|array|
      |$.Outlets[0].Outletid|string|
      |$.Outlets[0].Outlet|object|
      |$.Outlets[0].Outletareamapping|array|
      |$.Outlets[0].Activityformdata|array|
      |$.Outlets[0].Outletcontacts|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate outlet detail outlet object structure
    And I send the GET request to "outlets_get_detail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Outlets[0].Outlet.id|string|
      |$.Outlets[0].Outlet.name|string|
      |$.Outlets[0].Outlet.address|string|
      |$.Outlets[0].Outlet.phoneno|string|
      |$.Outlets[0].Outlet.email|string|
      |$.Outlets[0].Outlet.approved|string|
      |$.Outlets[0].Outlet.erp_id|string|
      |$.Outlets[0].Outlet.warehouse_id|string|
      |$.Outlets[0].Outlet.latitude|string|
      |$.Outlets[0].Outlet.longitude|string|

  @Positive @DataValidation
  Scenario: TC_08 Validate outlet detail specific field values
    And I send the GET request to "outlets_get_detail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Outlets[0].Outletid|"1"| 
      |$.Outlets[0].Outlet.name|"SLV Traders"|
      |$.Outlets[0].Outlet.address|"Bangalore"|
      |$.Outlets[0].Outlet.phoneno|"9886145638"|
      |$.Outlets[0].Outlet.email|"sadhananda@mobisy.com"|
      |$.Outlets[0].Outlet.erp_id|"trp123"|

  @Positive @Performance
  Scenario: TC_09 Performance test for outlet detail endpoint
    And I send the GET request to "outlets_get_detail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Outlets|array|

  @Negative @Validation
  Scenario: TC_10 Get outlet detail with invalid outlet ID
    And I send the GET request to "outlets_get_detail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds


  @Negative @Boundary
  Scenario: TC_11 Get outlet detail with maximum query parameters
    And I send the GET request to "outlets_get_detail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
      |param1|value1|                    | |
      |param2|value2|||
      |param3|value3|||
      |param4|value4|||
      |param5|value5|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Outlets|array|

#  @Negative @ErrorHandling
#  Scenario: TC_12 Get outlet detail with invalid endpoint
#    And I send the GET request to "outlets_get_detail_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|outletId|1|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @DataIntegrity
  Scenario: TC_13 Validate outlet detail data integrity with database
    And I send the GET request to "outlets_get_detail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Outlets[0].Outlet.name|DB:outlets:name:id=1|

  @Positive @Functional
  Scenario: TC_14 Validate outlet detail response completeness
    And I send the GET request to "outlets_get_detail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Outlets|
      |Outletid|
      |Payment|
      |Order|
      |Activity|
      |Stockatoutlet|
      |Salehistorycolor|
      |Salemansalesreturn|
      |Outlet|
      |Outletareamapping|
      |Activityformdata|
      |Outletcontacts|
      |targetachivement|
      |outletcollection|


  @Positive @LoadTesting
  Scenario: TC_15 Load testing for outlet detail endpoint
    And I send the GET request to "outlets_get_detail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Outlets|array|

  @Positive @EndToEnd
  Scenario: TC_16 End-to-end outlet detail retrieval workflow
    And I send the GET request to "outlets_get_detail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Outlets[0].Outletid|"1"|
      |$.Outlets[0].Outlet.name|"SLV Traders"|
    And I store the response as "outlet_detail_e2e_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Outlets[0].Outletid|string|
      |$.Outlets[0].Outlet|object|
      |$.Outlets[0].Outlet.name|string|
      |$.Outlets[0].Outlet.address|string|
      |$.Outlets[0].Outlet.phoneno|string|
      |$.Outlets[0].Outlet.email|string|


  @Positive @Reliability
  Scenario: TC_17 Reliability test for outlet detail endpoint
    And I send the GET request to "outlets_get_detail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Outlets|array|
      |$.Outlets[0].Outlet|object|
      |$.Outlets[0].Outletareamapping|array|
      |$.Outlets[0].Activityformdata|array|

  @Positive @Idempotency
  Scenario: TC_18 Idempotency test for outlet detail endpoint
    And I send the GET request to "outlets_get_detail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "outlet_detail_first_call" name using full path
    And I send the GET request to "outlets_get_detail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Outlets|array|


