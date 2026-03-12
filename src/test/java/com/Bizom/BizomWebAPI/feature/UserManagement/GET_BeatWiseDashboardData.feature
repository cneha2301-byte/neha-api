@BizomWebAPI @CE @GetBeatWiseDashboardData @UserManagement
Feature: Beat Wise Dashboard Data API Testing
  As a system user
  I want to test the beat wise dashboard data endpoint
  So that I can ensure proper functionality and data retrieval for beat wise dashboard management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get beat wise dashboard data without access token
    When I send the GET request to "users_beatwisedashboarddata" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get beat wise dashboard data with invalid access token
    And I send the GET request to "users_beatwisedashboarddata" endpoint with dynamic access token and query parameters
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
  Scenario: TC_03 Get beat wise dashboard data with expired access token
    And I send the GET request to "users_beatwisedashboarddata" endpoint with dynamic access token and query parameters
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
  Scenario: TC_04 Get beat wise dashboard data with malformed access token
    And I send the GET request to "users_beatwisedashboarddata" endpoint with dynamic access token and query parameters
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
  Scenario: TC_05 Get beat wise dashboard data with valid access token
    And I send the GET request to "users_beatwisedashboarddata" endpoint with dynamic access token and query parameters
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
    And I store the response as "beat_wise_dashboard_data_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate beat wise dashboard data response structure
    And I send the GET request to "users_beatwisedashboarddata" endpoint with dynamic access token and query parameters
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

  @Positive @DataValidation
  Scenario: TC_07 Validate beat wise dashboard data DataTables structure
    And I send the GET request to "users_beatwisedashboarddata" endpoint with dynamic access token and query parameters
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

  @Positive @DataValidation
  Scenario: TC_08 Validate beat wise dashboard data aaData array structure
    And I send the GET request to "users_beatwisedashboarddata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData|array|
      |$.aaData[0]|object|

  @Positive @DataValidation
  Scenario: TC_09 Validate beat wise dashboard data aaData object fields
    And I send the GET request to "users_beatwisedashboarddata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData[0]|object|
      |$.aaData[0].beat_id|string|
      |$.aaData[0].beat_name|string|
      |$.aaData[0].headquarter_name|string|
      |$.aaData[0].pjp_date|string|
      |$.aaData[0].user_id|string|
      |$.aaData[0].user_name|string|
      |$.aaData[0].outlet_count|number|
      |$.aaData[0].area_name|string|
      |$.aaData[0].distributorerpcode|string|
      |$.aaData[0].distributor|string|
      |$.aaData[0].distributorId|string|
      |$.aaData[0].zoneId|string|
      |$.aaData[0].orgmapping|string|

  @Positive @DataValidation
  Scenario: TC_10 Validate beat wise dashboard data complete structure
    And I send the GET request to "users_beatwisedashboarddata" endpoint with dynamic access token and query parameters
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
      |$.aaData[0].beat_id|string|
      |$.aaData[0].beat_name|string|
      |$.aaData[0].outlet_count|number|
      |$.aaData[0].distributor|string|
      |$.aaData[0].distributorId|string|
      |$.aaData[0].zoneId|string|

  @Positive @DataValidation
  Scenario: TC_11 Validate beat wise dashboard data record counts consistency
    And I send the GET request to "users_beatwisedashboarddata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
    And validating the response contains the following values
      |Value|
      |sEcho|
      |iTotalRecords|
      |iTotalDisplayRecords|
      |aaData|

  @Positive @Performance
  Scenario: TC_12 Performance test for beat wise dashboard data endpoint
    And I send the GET request to "users_beatwisedashboarddata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

  @Positive @Concurrency
  Scenario: TC_13 Concurrent access test for beat wise dashboard data endpoint
    And I send the GET request to "users_beatwisedashboarddata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

  @Negative @Validation
  Scenario: TC_14 Get beat wise dashboard data with invalid query parameters
    And I send the GET request to "users_beatwisedashboarddata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Negative @Validation
  Scenario: TC_15 Get beat wise dashboard data with special characters in query parameters
    And I send the GET request to "users_beatwisedashboarddata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Negative @Security
  Scenario: TC_16 Get beat wise dashboard data with SQL injection attempt
    And I send the GET request to "users_beatwisedashboarddata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE users; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

#  @Negative @ErrorHandling
#  Scenario: TC_17 Get beat wise dashboard data with invalid endpoint
#    And I send the GET request to "users_beatwisedashboarddata_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_18 Validate beat wise dashboard data business logic
    And I send the GET request to "users_beatwisedashboarddata" endpoint with dynamic access token and query parameters
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
      |$.aaData[0].beat_id|string|
      |$.aaData[0].beat_name|string|
      |$.aaData[0].outlet_count|number|

  @Positive @DataIntegrity
  Scenario: TC_19 Validate beat wise dashboard data data integrity
    And I send the GET request to "users_beatwisedashboarddata" endpoint with dynamic access token and query parameters
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
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

  @Positive @Regression
  Scenario: TC_20 Regression test for beat wise dashboard data endpoint
    And I send the GET request to "users_beatwisedashboarddata" endpoint with dynamic access token and query parameters
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
      |$.aaData[0].beat_id|string|
      |$.aaData[0].beat_name|string|
      |$.aaData[0].outlet_count|number|
      |$.aaData[0].distributor|string|

  @Positive @Functional
  Scenario: TC_21 Validate beat wise dashboard data response completeness
    And I send the GET request to "users_beatwisedashboarddata" endpoint with dynamic access token and query parameters
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
      |$.aaData[0].beat_id|string|
      |$.aaData[0].beat_name|string|
      |$.aaData[0].headquarter_name|string|
      |$.aaData[0].pjp_date|string|
      |$.aaData[0].user_id|string|
      |$.aaData[0].user_name|string|
      |$.aaData[0].outlet_count|number|
      |$.aaData[0].area_name|string|
      |$.aaData[0].distributorerpcode|string|
      |$.aaData[0].distributor|string|
      |$.aaData[0].distributorId|string|
      |$.aaData[0].zoneId|string|
      |$.aaData[0].orgmapping|string|
    And validating the response contains the following values
      |Value|
      |sEcho|
      |iTotalRecords|
      |iTotalDisplayRecords|
      |aaData|
      |beat_id|
      |beat_name|
      |outlet_count|
      |distributor|
    And I store the response as "beat_wise_dashboard_data_response" name using full path

