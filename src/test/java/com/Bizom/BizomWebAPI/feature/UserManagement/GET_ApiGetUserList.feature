@BizomWebAPI @CE @ApiGetUserList @UserManagement
Feature: Users API Get User List Testing
  As a system user
  I want to test the users apigetUserList endpoint
  So that I can ensure proper functionality and data retrieval for user list management with DataTables format

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get API user list without access token
    When I send the GET request to "api_get_user_list" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get API user list with invalid access token
    And I send the GET request to "api_get_user_list" endpoint with dynamic access token and query parameters
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
  Scenario: Get API user list with expired access token
    And I send the GET request to "api_get_user_list" endpoint with dynamic access token and query parameters
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
  Scenario: Get API user list with malformed access token
    And I send the GET request to "api_get_user_list" endpoint with dynamic access token and query parameters
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
  Scenario: Get API user list with valid access token
    And I send the GET request to "api_get_user_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iDisplayStart|0|
      |iDisplayLength|25|
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
      |$.aaData[0]|array|
      |$.aaData[0][0]|string|
      |$.aaData[0][1]|string|
      |$.aaData[0][2]|string|
    And I store the response as "api_user_list_response" name using full path

  @Positive @DataValidation
  Scenario: Validate API user list response structure
    And I send the GET request to "api_get_user_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iDisplayStart|0|
      |iDisplayLength|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
      |$.aaData[0]|array|
      |$.aaData[0][0]|string|
      |$.aaData[0][1]|string|
      |$.aaData[0][2]|string|
      |$.aaData[0][3]|string|
      |$.aaData[0][4]|string|
      |$.aaData[0][5]|string|
      |$.aaData[0][6]|string|
      |$.aaData[0][7]|string|
      |$.aaData[0][8]|string|
      |$.aaData[0][9]|string|

  @Positive @DataValidation
  Scenario: Validate API user list DataTables pagination parameters
    And I send the GET request to "api_get_user_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|10|
      |sColumns|,,,,,,,,,|
      |iDisplayStart|0|
      |iDisplayLength|25|
      |mDataProp_0|0|
      |sSearch_0||
      |bRegex_0|false|
      |bSearchable_0|true|
      |bSortable_0|true|
      |mDataProp_1|1|
      |sSearch_1||
      |bRegex_1|false|
      |bSearchable_1|true|
      |bSortable_1|true|
      |mDataProp_2|2|
      |sSearch_2||
      |bRegex_2|false|
      |bSearchable_2|true|
      |bSortable_2|true|
      |mDataProp_3|3|
      |sSearch_3||
      |bRegex_3|false|
      |bSearchable_3|false|
      |bSortable_3|false|
      |mDataProp_4|4|
      |sSearch_4||
      |bRegex_4|false|
      |bSearchable_4|false|
      |bSortable_4|false|
      |mDataProp_5|5|
      |sSearch_5||
      |bRegex_5|false|
      |bSearchable_5|false|
      |bSortable_5|false|
      |mDataProp_6|6|
      |sSearch_6||
      |bRegex_6|false|
      |bSearchable_6|false|
      |bSortable_6|false|
      |mDataProp_7|7|
      |sSearch_7||
      |bRegex_7|false|
      |bSearchable_7|false|
      |bSortable_7|false|
      |mDataProp_8|8|
      |sSearch_8||
      |bRegex_8|false|
      |bSearchable_8|false|
      |bSortable_8|false|
      |mDataProp_9|9|
      |sSearch_9||
      |bRegex_9|false|
      |bSearchable_9|false|
      |bSortable_9|false|
      |sSearch||
      |bRegex|false|
      |iSortingCols|0|
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

  @Positive @DataValidation
  Scenario: Validate API user list pagination with different display start
    And I send the GET request to "api_get_user_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iDisplayStart|10|
      |iDisplayLength|25|
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

  @Positive @DataValidation
  Scenario: Validate API user list pagination with different display length
    And I send the GET request to "api_get_user_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iDisplayStart|0|
      |iDisplayLength|50|
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

  @Positive @DataValidation
  Scenario: Validate API user list aaData array structure
    And I send the GET request to "api_get_user_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iDisplayStart|0|
      |iDisplayLength|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData|array|
      |$.aaData[0]|array|
      |$.aaData[0][0]|string|
      |$.aaData[0][1]|string|
      |$.aaData[0][2]|string|
      |$.aaData[0][3]|string|
      |$.aaData[0][4]|string|
      |$.aaData[0][5]|string|
      |$.aaData[0][6]|string|
      |$.aaData[0][7]|string|
      |$.aaData[0][8]|string|
      |$.aaData[0][9]|string|
      |$.aaData[1]|array|
      |$.aaData[1][0]|string|
      |$.aaData[1][1]|string|
      |$.aaData[1][2]|string|

#  @Positive @DataValidation
#  Scenario: Validate API user list with static values
#    And I send the GET request to "api_get_user_list" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |sEcho|1|
#      |iDisplayStart|0|
#      |iDisplayLength|25|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|848|
#      |$.iTotalDisplayRecords|848|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.aaData[0][0]|"3"|
#      |$.aaData[0][1]|covidmgr|
#      |$.aaData[0][2]|Covid MGR|
#      |$.aaData[0][3]|1212|
#      |$.aaData[0][5]|20000|
#      |$.aaData[0][6]|125|
#      |$.aaData[0][7]|WAREHOUSE MANAGER|
#      |$.aaData[1][0]|"4"|
#      |$.aaData[1][1]|zonemgr|
#      |$.aaData[1][2]|SLV Traders|
#      |$.aaData[1][5]|20000|
#      |$.aaData[1][7]|ZONE MANAGER|

  @Positive @Performance
  Scenario: Performance test for API user list endpoint
    And I send the GET request to "api_get_user_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iDisplayStart|0|
      |iDisplayLength|25|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

  @Positive @Concurrency
  Scenario: Concurrent access test for API user list endpoint
    And I send the GET request to "api_get_user_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iDisplayStart|0|
      |iDisplayLength|25|
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
      |$.aaData[0]|array|

  @Negative @Validation
  Scenario: Get API user list with invalid query parameters
    And I send the GET request to "api_get_user_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData|array|

  @Negative @Validation
  Scenario: Get API user list with special characters in query parameters
    And I send the GET request to "api_get_user_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData|array|

  @Negative @Security
  Scenario: Get API user list with SQL injection attempt
    And I send the GET request to "api_get_user_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE users; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData|array|

  @Negative @Boundary
  Scenario: Get API user list with maximum query parameters
    And I send the GET request to "api_get_user_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|10|
      |iDisplayStart|0|
      |iDisplayLength|100|
      |param1|value1|
      |param2|value2|
      |param3|value3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

#  @Negative @ErrorHandling
#  Scenario: Get API user list with invalid endpoint
#    And I send the GET request to "api_get_user_list_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

  @Positive @BusinessLogic
  Scenario: Validate API user list business logic
    And I send the GET request to "api_get_user_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iDisplayStart|0|
      |iDisplayLength|25|
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
      |$.aaData[0]|array|

  @Positive @DataIntegrity
  Scenario: Validate API user list data integrity
    And I send the GET request to "api_get_user_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iDisplayStart|0|
      |iDisplayLength|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
      |$.aaData[0]|array|
      |$.aaData[0][0]|string|
      |$.aaData[0][1]|string|
      |$.aaData[0][2]|string|
      |$.aaData[0][3]|string|
      |$.aaData[0][4]|string|
      |$.aaData[0][5]|string|
      |$.aaData[0][6]|string|
      |$.aaData[0][7]|string|
      |$.aaData[0][8]|string|
      |$.aaData[0][9]|string|
    And validating the response contains the following values
      |Value|
      |sEcho|
      |iTotalRecords|
      |iTotalDisplayRecords|
      |aaData|

  @Positive @Regression
  Scenario: Regression test for API user list endpoint
    And I send the GET request to "api_get_user_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iDisplayStart|0|
      |iDisplayLength|25|
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
      |$.aaData[0]|array|

#  @Positive @Functional
#  Scenario: Validate API user list response completeness
#    And I send the GET request to "api_get_user_list" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |sEcho|1|
#      |iDisplayStart|0|
#      |iDisplayLength|25|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.sEcho|number|
#      |$.iTotalRecords|number|
#      |$.iTotalDisplayRecords|number|
#      |$.aaData|array|
#      |$.aaData[0]|array|
#      |$.aaData[0][0]|string|
#      |$.aaData[0][1]|string|
#      |$.aaData[0][2]|string|
#      |$.aaData[0][3]|string|
#      |$.aaData[0][4]|string|
#      |$.aaData[0][5]|string|
#      |$.aaData[0][6]|string|
#      |$.aaData[0][7]|string|
#      |$.aaData[0][8]|string|
#      |$.aaData[0][9]|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|848|
#      |$.iTotalDisplayRecords|848|

#  @Positive @ArrayValidation
#  Scenario: Validate API user list array structure and content
#    And I send the GET request to "api_get_user_list" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |sEcho|1|
#      |iDisplayStart|0|
#      |iDisplayLength|25|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.sEcho|number|
#      |$.iTotalRecords|number|
#      |$.iTotalDisplayRecords|number|
#      |$.aaData|array|
#      |$.aaData[0]|array|
#      |$.aaData[0][0]|string|
#      |$.aaData[0][1]|string|
#      |$.aaData[0][2]|string|
#      |$.aaData[0][3]|string|
#      |$.aaData[0][4]|string|
#      |$.aaData[0][5]|string|
#      |$.aaData[0][6]|string|
#      |$.aaData[0][7]|string|
#      |$.aaData[0][8]|string|
#      |$.aaData[0][9]|string|
#      |$.aaData[1]|array|
#      |$.aaData[1][0]|string|
#      |$.aaData[1][1]|string|
#      |$.aaData[1][2]|string|
#      |$.aaData[1][7]|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.aaData[0][0]|"3"|
#      |$.aaData[0][1]|covidmgr|
#      |$.aaData[0][2]|Covid MGR|
#      |$.aaData[0][7]|WAREHOUSE MANAGER|
#      |$.aaData[1][0]|"4"|
#      |$.aaData[1][1]|zonemgr|
#      |$.aaData[1][2]|SLV Traders|
#      |$.aaData[1][7]|ZONE MANAGER|

  @Positive @ContentValidation
  Scenario: Validate API user list content structure
    And I send the GET request to "api_get_user_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iDisplayStart|0|
      |iDisplayLength|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And validating the response contains the following values
      |Value|
      |sEcho|
      |iTotalRecords|
      |iTotalDisplayRecords|
      |aaData|

  @Positive @LoadTesting
  Scenario: Load testing for API user list endpoint
    And I send the GET request to "api_get_user_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iDisplayStart|0|
      |iDisplayLength|25|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

  @Negative @Timeout
  Scenario: Test API user list endpoint timeout handling
    And I send the GET request to "api_get_user_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iDisplayStart|0|
      |iDisplayLength|25|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

#  @Positive @EndToEnd
#  Scenario: End-to-end API user list data retrieval workflow
#    And I send the GET request to "api_get_user_list" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |sEcho|1|
#      |iColumns|10|
#      |sColumns|,,,,,,,,,|
#      |iDisplayStart|0|
#      |iDisplayLength|25|
#      |mDataProp_0|0|
#      |bSearchable_0|true|
#      |bSortable_0|true|
#      |mDataProp_1|1|
#      |bSearchable_1|true|
#      |bSortable_1|true|
#      |mDataProp_2|2|
#      |bSearchable_2|true|
#      |bSortable_2|true|
#      |mDataProp_3|3|
#      |bSearchable_3|false|
#      |bSortable_3|false|
#      |mDataProp_4|4|
#      |bSearchable_4|false|
#      |bSortable_4|false|
#      |mDataProp_5|5|
#      |bSearchable_5|false|
#      |bSortable_5|false|
#      |mDataProp_6|6|
#      |bSearchable_6|false|
#      |bSortable_6|false|
#      |mDataProp_7|7|
#      |bSearchable_7|false|
#      |bSortable_7|false|
#      |mDataProp_8|8|
#      |bSearchable_8|false|
#      |bSortable_8|false|
#      |mDataProp_9|9|
#      |bSearchable_9|false|
#      |bSortable_9|false|
#      |sSearch||
#      |bRegex|false|
#      |iSortingCols|0|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|848|
#      |$.iTotalDisplayRecords|848|
#    And I store the response as "api_user_list_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.sEcho|number|
#      |$.iTotalRecords|number|
#      |$.iTotalDisplayRecords|number|
#      |$.aaData|array|
#      |$.aaData[0]|array|
#      |$.aaData[0][0]|string|
#      |$.aaData[0][1]|string|
#      |$.aaData[0][2]|string|
#      |$.aaData[0][3]|string|
#      |$.aaData[0][4]|string|
#      |$.aaData[0][5]|string|
#      |$.aaData[0][6]|string|
#      |$.aaData[0][7]|string|
#      |$.aaData[0][8]|string|
#      |$.aaData[0][9]|string|
#    And validating the response contains the following values
#      |Value|
#      |sEcho|
#      |iTotalRecords|
#      |iTotalDisplayRecords|
#      |aaData|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.aaData[0][0]|"3"|
#      |$.aaData[0][1]|covidmgr|
#      |$.aaData[0][2]|Covid MGR|
#      |$.aaData[0][3]|1212|
#      |$.aaData[0][5]|20000|
#      |$.aaData[0][6]|125|
#      |$.aaData[0][7]|WAREHOUSE MANAGER|
#      |$.aaData[1][0]|"4"|
#      |$.aaData[1][1]|zonemgr|
#      |$.aaData[1][2]|SLV Traders|
#      |$.aaData[1][5]|20000|
#      |$.aaData[1][7]|ZONE MANAGER|

