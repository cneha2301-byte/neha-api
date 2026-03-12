@BizomWebAPI @CE @OutletsManagement @OutletHolderDetails @InventoryOperations
Feature: Get Outlet Holder Details API Testing
  As a system user
  I want to test the get outlet holder details endpoint
  So that I can ensure proper functionality and data retrieval for holder mapping by outlet ID

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get outlet holder details without access token
    When I send the GET request to "outlets_get_outlet_holder_details" endpoint with path parameters
      |Path|Value|
      |outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_02 Get outlet holder details with invalid access token
    And I send the GET request to "outlets_get_outlet_holder_details" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|outletId|2|
      And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_03 Get outlet holder details with expired access token
    And I send the GET request to "outlets_get_outlet_holder_details" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|outletId|2|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_04 Get outlet holder details with malformed access token
    And I send the GET request to "outlets_get_outlet_holder_details" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|outletId|2|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get outlet holder details for outlet ID 2 with valid access token
    And I send the GET request to "outlets_get_outlet_holder_details" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|"Data Present"|
      |$.Data[0].holderType|"ZONE"|
      |$.Data[0].holderIds[0]|"1"|
    And I store the response as "outlet_holder_details_response" name using full path

  @Positive @Functional
  Scenario: TC_06 Get outlet holder details for outlet ID 3 with valid access token
    And I send the GET request to "outlets_get_outlet_holder_details" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Data|array|
      |$.Data[0]|object|
      |$.Data[0].holderType|string|
      |$.Data[0].holderIds|array|

#  @Negative @ErrorHandling
#  Scenario: TC_07 Get outlet holder details with invalid endpoint
#    And I send the GET request to "outlets_get_outlet_holder_details_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|outletId|2|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: TC_08 Performance test for outlet holder details endpoint
    And I send the GET request to "outlets_get_outlet_holder_details" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Regression
  Scenario: TC_09 Regression test for outlet holder details endpoint
    And I send the GET request to "outlets_get_outlet_holder_details" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Positive @ArrayValidation
  Scenario: TC_10 Validate outlet holder details array structure and content
    And I send the GET request to "outlets_get_outlet_holder_details" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|
      |$.Data[0]|object|
      |$.Data[0].holderIds|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data[0].holderType|ZONE|
      |$.Data[1].holderType|SUBZONE|
      |$.Data[2].holderType|WAREHOUSE|
      |$.Data[3].holderType|AREA|
      |$.Data[4].holderType|OUTLET_CATEGORY|
      |$.Data[5].holderType|OUTLET_TYPE|

  @Positive @ContentValidation
  Scenario: TC_11 Validate outlet holder details content structure
    And I send the GET request to "outlets_get_outlet_holder_details" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      |Value|
      |Data|
      |holderType|
      |holderIds|

  @Positive @LoadTesting
  Scenario: TC_12 Load testing for outlet holder details endpoint
    And I send the GET request to "outlets_get_outlet_holder_details" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Negative @Timeout
  Scenario: TC_13 Test outlet holder details endpoint timeout handling
    And I send the GET request to "outlets_get_outlet_holder_details" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds

  @Positive @EndToEnd
  Scenario: TC_14 End-to-end outlet holder details retrieval workflow
    And I send the GET request to "outlets_get_outlet_holder_details" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|"Data Present"|
      |$.Data[0].holderType|"ZONE"|
    And I store the response as "outlet_holder_details_e2e_response" name using full path


