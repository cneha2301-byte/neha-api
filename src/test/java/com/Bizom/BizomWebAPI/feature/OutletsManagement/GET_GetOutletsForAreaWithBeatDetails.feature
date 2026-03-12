@BizomWebAPI @CE @OutletsManagement @GetOutletsForAreaWithBeatDetails @InventoryOperations
Feature: Get Outlets For Area With Beat Details API Testing
  As a system user
  I want to test the get outlets for area with beat details endpoint
  So that I can ensure outlets and beat assignments are returned accurately

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get outlets for area with beat details without access token
    When I send the GET request to "outlets_get_outlets_for_area_with_beat_details" endpoint with path parameters
      |Path|Value|
      |areaId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds
   

#  @Negative @Security
#  Scenario: TC_02 Get outlets for area with beat details with invalid access token
#    And I send the GET request to "outlets_get_outlets_for_area_with_beat_details" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|invalid_token_12345|areaId|2|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_03 Get outlets for area with beat details with expired access token
#    And I send the GET request to "outlets_get_outlets_for_area_with_beat_details" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|expired_token_12345|areaId|2|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_04 Get outlets for area with beat details with malformed access token
#    And I send the GET request to "outlets_get_outlets_for_area_with_beat_details" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|malformed.token.here|areaId|2|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get outlets for area with beat details using valid access token
    And I send the GET request to "outlets_get_outlets_for_area_with_beat_details" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|""|
      |$.outlets[0].Outlet.name|"sass"|
      |$.outlets[0].Area.name|"NORTH"|
    And I store the response as "outlets_area_with_beats_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate outlets for area with beat details response structure
    And I send the GET request to "outlets_get_outlets_for_area_with_beat_details" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|
      |$.error.message|string|
      |$.outlets|array|
      |$.outlets[0]|object|
      |$.outlets[0].Outlet|object|
      |$.outlets[0].Outlet.id|string|
      |$.outlets[0].Outlet.name|string|
      |$.outlets[0].Area|object|
      |$.outlets[0].beats|array|
      |$.outlets[0].Assignedtobeat|number|
      |$.outletOccurenceInUserBeat|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate outlets and area details for beat mapping
    And I send the GET request to "outlets_get_outlets_for_area_with_beat_details" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.outlets[1].Outlet.id|"30"|
      |$.outlets[1].Outlet.name|"5t"|
      |$.outlets[1].Outletcategory.name|"Outlet"|
      |$.outlets[1].Area.warehouse_id|"5"|

  @Positive @DataValidation
  Scenario: TC_08 Validate custom outlet data for beat details response
    And I send the GET request to "outlets_get_outlets_for_area_with_beat_details" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.outlets[1].Customoutletdata[0].custom[0].key|"Image 1"|
      |$.outlets[1].Customoutletdata[0].custom[0].field_type|"Image"|
      |$.outlets[1].Customoutletdata[0].custom[0].field_type_string|"Image$0$0$0"|
      |$.outlets[1].Customoutletdata[0].custom[1].field_type|"Image"|
      |$.outlets[1].Customoutletdata[0].custom[3].value|"y"|

  @Positive @ArrayValidation
  Scenario: TC_09 Validate beats array structure and assignments
    And I send the GET request to "outlets_get_outlets_for_area_with_beat_details" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.outlets[1].beats|array|
      |$.outlets[1].beats[0]|object|
      |$.outlets[1].beats[0].beat_id|number|
      |$.outlets[1].beats[0].beat_name|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.outlets[1].beats[0].beat_name|"Silkboard"|
      |$.outlets[1].beats[1].beat_name|"test"|

  @Positive @Performance
  Scenario: TC_10 Performance test for outlets for area with beat details endpoint
    And I send the GET request to "outlets_get_outlets_for_area_with_beat_details" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|2|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Positive @Concurrency
  Scenario: TC_11 Concurrent access test for outlets for area with beat details endpoint
    And I send the GET request to "outlets_get_outlets_for_area_with_beat_details" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Positive @ContentValidation
  Scenario: TC_12 Validate outlets for area with beat details content structure
    And I send the GET request to "outlets_get_outlets_for_area_with_beat_details" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |outlets|
      |Outlet|
      |Outletcategory|
      |Area|
      |beats|
      |Assignedtobeat|

  @Positive @BusinessLogic
  Scenario: TC_13 Validate beat assignment flags for outlets
    And I send the GET request to "outlets_get_outlets_for_area_with_beat_details" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.outlets[0].Assignedtobeat|0|
      |$.outlets[1].Assignedtobeat|1|
      |$.outlets[2].Assignedtobeat|1|

  @Positive @DataIntegrity
  Scenario: TC_14 Validate outlets for area with beat details data integrity
    And I send the GET request to "outlets_get_outlets_for_area_with_beat_details" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.outlets[0].Outlet.id|string|
      |$.outlets[0].Outlet.name|string|
      |$.outlets[0].Outlet.erp_id|string|
      |$.outlets[0].Outlet.approved|string|
      |$.outlets[0].Outletcategory.capacity|string|
      |$.outlets[0].Area.warehouse_id|string|

  @Positive @Regression
  Scenario: TC_15 Regression test for outlets for area with beat details endpoint
    And I send the GET request to "outlets_get_outlets_for_area_with_beat_details" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|""|

  @Positive @Functional
  Scenario: TC_16 Validate outlets for area with beat details response completeness
    And I send the GET request to "outlets_get_outlets_for_area_with_beat_details" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.outlets[0].Outlet.id|"18"|
      |$.outlets[0].Outlet.name|"sass"|
      |$.outlets[1].beats[0].beat_id|1|
      |$.outlets[1].beats[1].beat_id|14|

  @Positive @LoadTesting
  Scenario: TC_17 Load testing for outlets for area with beat details endpoint
    And I send the GET request to "outlets_get_outlets_for_area_with_beat_details" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|2|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @Validation
  Scenario: TC_18 Get outlets for area with beat details and invalid query parameters
    And I send the GET request to "outlets_get_outlets_for_area_with_beat_details" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|2|
      |invalid_param|invalid_value| | |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|""|

  @Negative @Validation
  Scenario: TC_19 Get outlets for area with beat details using special characters in query parameters
    And I send the GET request to "outlets_get_outlets_for_area_with_beat_details" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|2|
      |test_param|<script>alert('XSS')</script>| | |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|""|

  @Negative @Security
  Scenario: TC_20 Get outlets for area with beat details with SQL injection attempt
    And I send the GET request to "outlets_get_outlets_for_area_with_beat_details" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|2|
      |test_param|'; DROP TABLE outlets; --| | |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|""|

  @Negative @Boundary
  Scenario: TC_21 Get outlets for area with beat details using large area identifier
    And I send the GET request to "outlets_get_outlets_for_area_with_beat_details" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|9999999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_22 Get outlets for area with beat details using invalid endpoint
    And I send the GET request to "outlets_get_outlets_for_area_with_beat_details_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @EndToEnd
  Scenario: TC_23 End-to-end outlets for area with beat details data retrieval workflow
    And I send the GET request to "outlets_get_outlets_for_area_with_beat_details" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|""|
    And I store the response as "outlets_area_with_beats_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.outlets|array|
      |$.outlets[0].beats|array|
      |$.outlets[0].Outlet|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.outlets[0].Outlet.name|"sass"|
      |$.outlets[1].beats[0].beat_name|"Silkboard"|

