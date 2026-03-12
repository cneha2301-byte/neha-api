@BizomWebAPI @OS @LoadoutsManagement @GetLoadoutsheetDatas @UserAccessManagement
Feature: Get Loadoutsheet Datas API Testing
  As a system user
  I want to test the get loadoutsheet datas endpoint
  So that I can ensure proper functionality and data retrieval for loadoutsheet data management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get loadoutsheet datas without access token
    When I send the GET request to "loadoutsheets_get_loadoutsheet_datas" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get loadoutsheet datas with invalid access token
    And I send the GET request to "loadoutsheets_get_loadoutsheet_datas" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get loadoutsheet datas with expired access token
    And I send the GET request to "loadoutsheets_get_loadoutsheet_datas" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get loadoutsheet datas with malformed access token
    And I send the GET request to "loadoutsheets_get_loadoutsheet_datas" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get loadoutsheet datas with valid access token
    And I send the GET request to "loadoutsheets_get_loadoutsheet_datas" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And I store the response as "loadoutsheet_datas_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate loadoutsheet datas response structure
    And I send the GET request to "loadoutsheets_get_loadoutsheet_datas" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Positive @DataTablesValidation
  Scenario: TC_07 Validate loadoutsheet datas DataTables structure
    And I send the GET request to "loadoutsheets_get_loadoutsheet_datas" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
      |$.aaData[0]|object|

  @Positive @DataValidation
  Scenario: TC_08 Validate loadoutsheet datas aaData object structure
    And I send the GET request to "loadoutsheets_get_loadoutsheet_datas" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData[0]|object|
      |$.aaData[0].created_date|string|
      |$.aaData[0].los_id|string|
      |$.aaData[0].los_no|string|
      |$.aaData[0].los_status|string|
      |$.aaData[0].narration|string|
      |$.aaData[0].total_weight|string|
      |$.aaData[0].user_empid|string|
      |$.aaData[0].user_id|string|
      |$.aaData[0].user_name|string|
      |$.aaData[0].vehicle_id|string|
      |$.aaData[0].vehicle_no|string|

  @Positive @DataValidation
  Scenario: TC_09 Validate loadoutsheet datas created_date field
    And I send the GET request to "loadoutsheets_get_loadoutsheet_datas" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData[0].created_date|string|

  @Positive @DataValidation
  Scenario: TC_10 Validate loadoutsheet datas los_id field
    And I send the GET request to "loadoutsheets_get_loadoutsheet_datas" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData[0].los_id|string|

  @Positive @DataValidation
  Scenario: TC_11 Validate loadoutsheet datas los_no field
    And I send the GET request to "loadoutsheets_get_loadoutsheet_datas" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData[0].los_no|string|

  @Positive @DataValidation
  Scenario: TC_12 Validate loadoutsheet datas total_weight field
    And I send the GET request to "loadoutsheets_get_loadoutsheet_datas" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData[0].total_weight|string|

  @Positive @DataValidation
  Scenario: TC_13 Validate loadoutsheet datas vehicle_id and vehicle_no fields
    And I send the GET request to "loadoutsheets_get_loadoutsheet_datas" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData[0].vehicle_id|string|
      |$.aaData[0].vehicle_no|string|

  @Positive @DataValidation
  Scenario: TC_14 Validate loadoutsheet datas user fields
    And I send the GET request to "loadoutsheets_get_loadoutsheet_datas" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData[0].user_id|string|
      |$.aaData[0].user_name|string|
      |$.aaData[0].user_empid|string|

  @Positive @DataValidation
  Scenario: TC_15 Validate loadoutsheet datas complete structure
    And I send the GET request to "loadoutsheets_get_loadoutsheet_datas" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
      |$.aaData[0]|object|
      |$.aaData[0].created_date|string|
      |$.aaData[0].los_id|string|
      |$.aaData[0].los_no|string|
      |$.aaData[0].los_status|string|
      |$.aaData[0].narration|string|
      |$.aaData[0].total_weight|string|
      |$.aaData[0].user_empid|string|
      |$.aaData[0].user_id|string|
      |$.aaData[0].user_name|string|
      |$.aaData[0].vehicle_id|string|
      |$.aaData[0].vehicle_no|string|

  @Positive @Performance
  Scenario: TC_16 Performance test for loadoutsheet datas endpoint
    And I send the GET request to "loadoutsheets_get_loadoutsheet_datas" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

  @Positive @Concurrency
  Scenario: TC_17 Concurrent access test for loadoutsheet datas endpoint
    And I send the GET request to "loadoutsheets_get_loadoutsheet_datas" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

  @Negative @Validation
  Scenario: TC_18 Get loadoutsheet datas with invalid query parameters
    And I send the GET request to "loadoutsheets_get_loadoutsheet_datas" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

  @Negative @Validation
  Scenario: TC_19 Get loadoutsheet datas with special characters in query parameters
    And I send the GET request to "loadoutsheets_get_loadoutsheet_datas" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

  @Negative @Security
  Scenario: TC_20 Get loadoutsheet datas with SQL injection attempt
    And I send the GET request to "loadoutsheets_get_loadoutsheet_datas" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE loadoutsheets; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

  @Negative @Boundary
  Scenario: TC_21 Get loadoutsheet datas with maximum query parameters
    And I send the GET request to "loadoutsheets_get_loadoutsheet_datas" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

#  @Negative @ErrorHandling
#  Scenario: TC_22 Get loadoutsheet datas with invalid endpoint
#    And I send the GET request to "loadoutsheets_get_loadoutsheet_datas_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_23 Validate loadoutsheet datas business logic
    And I send the GET request to "loadoutsheets_get_loadoutsheet_datas" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
      |$.aaData[0]|object|
      |$.aaData[0].los_id|string|
      |$.aaData[0].los_no|string|
      |$.aaData[0].vehicle_id|string|

  @Positive @DataIntegrity
  Scenario: TC_24 Validate loadoutsheet datas data integrity
    And I send the GET request to "loadoutsheets_get_loadoutsheet_datas" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
      |$.aaData[0]|object|
      |$.aaData[0].created_date|string|
      |$.aaData[0].los_id|string|
      |$.aaData[0].los_no|string|
      |$.aaData[0].los_status|string|
      |$.aaData[0].narration|string|
      |$.aaData[0].total_weight|string|
      |$.aaData[0].user_empid|string|
      |$.aaData[0].user_id|string|
      |$.aaData[0].user_name|string|
      |$.aaData[0].vehicle_id|string|
      |$.aaData[0].vehicle_no|string|

  @Positive @Regression
  Scenario: TC_25 Regression test for loadoutsheet datas endpoint
    And I send the GET request to "loadoutsheets_get_loadoutsheet_datas" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
      |$.aaData[0]|object|

  @Positive @Functional
  Scenario: TC_26 Validate loadoutsheet datas response completeness
    And I send the GET request to "loadoutsheets_get_loadoutsheet_datas" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
      |$.aaData[0]|object|
      |$.aaData[0].created_date|string|
      |$.aaData[0].los_id|string|
      |$.aaData[0].los_no|string|
      |$.aaData[0].los_status|string|
      |$.aaData[0].narration|string|
      |$.aaData[0].total_weight|string|
      |$.aaData[0].user_empid|string|
      |$.aaData[0].user_id|string|
      |$.aaData[0].user_name|string|
      |$.aaData[0].vehicle_id|string|
      |$.aaData[0].vehicle_no|string|
    And validating the response contains the following values
      |Value|
      |sEcho|
      |iTotalRecords|
      |iTotalDisplayRecords|
      |aaData|
      |created_date|
      |los_id|
      |los_no|
    And I store the response as "loadoutsheet_datas_response" name using full path

  @Positive @DataTablesValidation
  Scenario: TC_27 Validate loadoutsheet datas DataTables consistency
    And I send the GET request to "loadoutsheets_get_loadoutsheet_datas" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
      |$.aaData[0]|object|

  @Positive @DataTablesValidation
  Scenario: TC_28 Validate loadoutsheet datas record counts and data consistency
    And I send the GET request to "loadoutsheets_get_loadoutsheet_datas" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
      |$.aaData[0]|object|
    And validating the response contains the following values
      |Value|
      |aaData|
      |los_id|
      |vehicle_id|

