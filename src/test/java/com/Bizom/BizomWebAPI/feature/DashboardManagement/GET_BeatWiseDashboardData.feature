@BizomWebAPI @Innovation @DashboardManagement @BeatWiseDashboardData @SupportingFunctions
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
    When I send the GET request to "beat_wise_dashboard_data" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get beat wise dashboard data with invalid access token
    And I send the GET request to "beat_wise_dashboard_data" endpoint with dynamic access token and query parameters
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
    And I send the GET request to "beat_wise_dashboard_data" endpoint with dynamic access token and query parameters
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
    And I send the GET request to "beat_wise_dashboard_data" endpoint with dynamic access token and query parameters
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
    And I send the GET request to "beat_wise_dashboard_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason.error|""|
      |$.Reason.message|""|
      |$.data[0].beat_id|"34"|
      |$.data[0].beat_name|b1|
      |$.data[0].headquarter_name|null|
      |$.data[0].pjp_date|2024-11-09|
      |$.data[0].user_id|"8"|
      |$.data[0].user_name|SLV Traders|
      |$.data[0].employeeid|null|
      |$.data[0].zone_name|NORTH|
      |$.data[0].outlet_count|1|
      |$.data[0].active_outlet_count|1|
      |$.data[0].inactive_outlet_count|0|
      |$.data[0].distributorerpcode|trp133|
      |$.data[0].distributor|SLV DISTRIBUTOR|
      |$.data[0].area_name|Attibele|
      |$.data[0].distributorId|"2"|
      |$.data[0].zoneId|"1"|
      |$.data[0].distributorsalemanagerId|"7"|
      |$.data[0].distributorsalemanagerHQ|null|
      |$.data[0].distributorsalemanagerName|Sadha Nanda|
    And I store the response as "beat_wise_dashboard_data_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate beat wise dashboard data response structure
    And I send the GET request to "beat_wise_dashboard_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason.error|""|
      |$.Reason.message|""|
      |$.data[0].beat_id|"34"|
      |$.data[0].beat_name|b1|
      |$.data[0].headquarter_name|null|
      |$.data[0].pjp_date|2024-11-09|
      |$.data[0].user_id|"8"|
      |$.data[0].user_name|SLV Traders|
      |$.data[0].employeeid|null|
      |$.data[0].zone_name|NORTH|
      |$.data[0].outlet_count|1|
      |$.data[0].active_outlet_count|1|
      |$.data[0].inactive_outlet_count|0|
      |$.data[0].distributorerpcode|trp133|
      |$.data[0].distributor|SLV DISTRIBUTOR|
      |$.data[0].area_name|Attibele|
      |$.data[0].distributorId|"2"|
      |$.data[0].zoneId|"1"|
      |$.data[0].distributorsalemanagerId|"7"|
      |$.data[0].distributorsalemanagerHQ|null|
      |$.data[0].distributorsalemanagerName|Sadha Nanda|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|object|
      |$.Reason.error|string|
      |$.Reason.message|string|
      |$.data|array|
      |$.data[0]|object|
      |$.data[0].beat_id|string|
      |$.data[0].beat_name|string|
      |$.data[0].headquarter_name|null|
      |$.data[0].pjp_date|string|
      |$.data[0].user_id|string|
      |$.data[0].user_name|string|
      |$.data[0].employeeid|null|
      |$.data[0].zone_name|string|
      |$.data[0].outlet_count|number|
      |$.data[0].active_outlet_count|number|
      |$.data[0].inactive_outlet_count|number|
      |$.data[0].distributorerpcode|string|
      |$.data[0].distributor|string|
      |$.data[0].area_name|string|
      |$.data[0].distributorId|string|

  @Positive @DataValidation
  Scenario: TC_07 Validate beat wise dashboard data response completeness
    And I send the GET request to "beat_wise_dashboard_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason.error|""|
      |$.Reason.message|""|
      |$.data[0].beat_id|"34"|
      |$.data[0].beat_name|b1|
      |$.data[0].headquarter_name|null|
      |$.data[0].pjp_date|2024-11-09|
      |$.data[0].user_id|"8"|
      |$.data[0].user_name|SLV Traders|
      |$.data[0].employeeid|null|
      |$.data[0].zone_name|NORTH|
      |$.data[0].outlet_count|1|
      |$.data[0].active_outlet_count|1|
      |$.data[0].inactive_outlet_count|0|
      |$.data[0].distributorerpcode|trp133|
      |$.data[0].distributor|SLV DISTRIBUTOR|
      |$.data[0].area_name|Attibele|
      |$.data[0].distributorId|"2"|
      |$.data[0].zoneId|"1"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|object|
      |$.Reason.error|string|
      |$.Reason.message|string|
      |$.data|array|
      |$.data[0]|object|
      |$.data[1]|object|

  @Positive @Performance
  Scenario: TC_08 Performance test for beat wise dashboard data endpoint
    And I send the GET request to "beat_wise_dashboard_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason.error|""|
      |$.Reason.message|""|
      |$.data[0].beat_id|"34"|
      |$.data[0].beat_name|b1|
      |$.data[0].user_id|"8"|
      |$.data[0].user_name|SLV Traders|
      |$.data[0].zone_name|NORTH|
      |$.data[0].outlet_count|1|
      |$.data[0].active_outlet_count|1|
      |$.data[0].inactive_outlet_count|0|
      |$.data[0].distributorerpcode|trp133|
      |$.data[0].distributor|SLV DISTRIBUTOR|
      |$.data[0].area_name|Attibele|
      |$.data[0].distributorId|"2"|
      |$.data[0].zoneId|"1"|
      |$.data[0].distributorsalemanagerId|"7"|
      |$.data[0].distributorsalemanagerName|Sadha Nanda|
    
  @Positive @Concurrency
  Scenario: TC_09 Concurrent access test for beat wise dashboard data endpoint
    And I send the GET request to "beat_wise_dashboard_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason.error|""|
      |$.Reason.message|""|
      |$.data[0].beat_id|"34"|
      |$.data[0].beat_name|b1|
      |$.data[0].user_id|"8"|
      |$.data[0].user_name|SLV Traders|
      |$.data[0].zone_name|NORTH|
      |$.data[0].outlet_count|1|
      |$.data[0].active_outlet_count|1|
      |$.data[0].inactive_outlet_count|0|
      |$.data[0].distributorerpcode|trp133|
      |$.data[0].distributor|SLV DISTRIBUTOR|
      |$.data[0].area_name|Attibele|
      |$.data[0].distributorId|"2"|
      |$.data[0].zoneId|"1"|
      |$.data[0].distributorsalemanagerId|"7"|
      |$.data[0].distributorsalemanagerName|Sadha Nanda|

  @Negative @Validation
  Scenario: TC_10 Get beat wise dashboard data with invalid query parameters
    And I send the GET request to "beat_wise_dashboard_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason.error|""|
      |$.Reason.message|""|
      |$.data[0].beat_id|"34"|
      |$.data[0].beat_name|b1|
      |$.data[0].user_id|"8"|
      |$.data[0].user_name|SLV Traders|
      |$.data[0].zone_name|NORTH|
      |$.data[0].outlet_count|1|
      |$.data[0].active_outlet_count|1|
      |$.data[0].inactive_outlet_count|0|
      |$.data[0].distributorerpcode|trp133|
      |$.data[0].distributor|SLV DISTRIBUTOR|
      |$.data[0].area_name|Attibele|
      |$.data[0].distributorId|"2"|
      |$.data[0].zoneId|"1"|
      |$.data[0].distributorsalemanagerId|"7"|
      |$.data[0].distributorsalemanagerName|Sadha Nanda|

  @Negative @Validation
  Scenario: TC_11 Get beat wise dashboard data with special characters in query parameters
    And I send the GET request to "beat_wise_dashboard_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason.error|""|
      |$.Reason.message|""|
      |$.data[0].beat_id|"34"|
      |$.data[0].beat_name|b1|
      |$.data[0].user_id|"8"|
      |$.data[0].user_name|SLV Traders|
      |$.data[0].zone_name|NORTH|
      |$.data[0].outlet_count|1|
      |$.data[0].active_outlet_count|1|
      |$.data[0].inactive_outlet_count|0|
      |$.data[0].distributorerpcode|trp133|
      |$.data[0].distributor|SLV DISTRIBUTOR|
      |$.data[0].area_name|Attibele|
      |$.data[0].distributorId|"2"|
      |$.data[0].zoneId|"1"|
      |$.data[0].distributorsalemanagerId|"7"|
      |$.data[0].distributorsalemanagerName|Sadha Nanda|

  @Negative @Security
  Scenario: TC_12 Get beat wise dashboard data with SQL injection attempt
    And I send the GET request to "beat_wise_dashboard_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE users; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason.error|""|
      |$.Reason.message|""|
      |$.data[0].beat_id|"34"|
      |$.data[0].beat_name|b1|
      |$.data[0].user_id|"8"|
      |$.data[0].user_name|SLV Traders|
      |$.data[0].zone_name|NORTH|
      |$.data[0].outlet_count|1|
      |$.data[0].active_outlet_count|1|
      |$.data[0].inactive_outlet_count|0|
      |$.data[0].distributorerpcode|trp133|
      |$.data[0].distributor|SLV DISTRIBUTOR|
      |$.data[0].area_name|Attibele|
      |$.data[0].distributorId|"2"|
      |$.data[0].zoneId|"1"|
      |$.data[0].distributorsalemanagerId|"7"|
      |$.data[0].distributorsalemanagerName|Sadha Nanda|

  @Negative @Boundary
  Scenario: TC_13 Get beat wise dashboard data with maximum query parameters
    And I send the GET request to "beat_wise_dashboard_data" endpoint with dynamic access token and query parameters
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
      |$.Result|true|
      |$.Reason.error|""|
      |$.Reason.message|""|
      |$.data[0].beat_id|"34"|
      |$.data[0].beat_name|b1|
      |$.data[0].user_id|"8"|
      |$.data[0].user_name|SLV Traders|
      |$.data[0].zone_name|NORTH|
      |$.data[0].outlet_count|1|
      |$.data[0].active_outlet_count|1|
      |$.data[0].inactive_outlet_count|0|
      |$.data[0].distributorerpcode|trp133|
      |$.data[0].distributor|SLV DISTRIBUTOR|
      |$.data[0].area_name|Attibele|
      |$.data[0].distributorId|"2"|
      |$.data[0].zoneId|"1"|
      |$.data[0].distributorsalemanagerId|"7"|
      |$.data[0].distributorsalemanagerName|Sadha Nanda|

#  @Negative @ErrorHandling
#  Scenario: TC_14 Get beat wise dashboard data with invalid endpoint
#    And I send the GET request to "beat_wise_dashboard_data_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the HTML response should contain page title "Users"
    
  @Positive @BusinessLogic
  Scenario: TC_15 Validate beat wise dashboard data business logic
    And I send the GET request to "beat_wise_dashboard_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason.error|""|
      |$.Reason.message|""|
      |$.data[0].beat_id|"34"|
      |$.data[0].beat_name|b1|
      |$.data[0].user_id|"8"|
      |$.data[0].user_name|SLV Traders|
      |$.data[0].zone_name|NORTH|
      |$.data[0].outlet_count|1|
      |$.data[0].active_outlet_count|1|
      |$.data[0].inactive_outlet_count|0|
      |$.data[0].distributorerpcode|trp133|
      |$.data[0].distributor|SLV DISTRIBUTOR|
      |$.data[0].area_name|Attibele|
      |$.data[0].distributorId|"2"|
      |$.data[0].zoneId|"1"|
      |$.data[0].distributorsalemanagerId|"7"|
      |$.data[0].distributorsalemanagerName|Sadha Nanda|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.data[0].beat_name|DB:beats:name: id=34|
      |$.data[0].user_name|DB:users:name: id=8|

  @Positive @DataIntegrity
  Scenario: TC_16 Validate beat wise dashboard data data integrity
    And I send the GET request to "beat_wise_dashboard_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason.error|""|
      |$.Reason.message|""|
      |$.data[0].beat_id|"34"|
      |$.data[0].beat_name|b1|
      |$.data[0].user_id|"8"|
      |$.data[0].user_name|SLV Traders|
      |$.data[0].zone_name|NORTH|
      |$.data[0].outlet_count|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|object|
      |$.Reason.error|string|
      |$.Reason.message|string|
      |$.data|array|
      |$.data[0]|object|
      |$.data[0].beat_id|string|
      |$.data[0].beat_name|string|
      |$.data[0].headquarter_name|null|
      |$.data[0].pjp_date|string|
      |$.data[0].user_id|string|
      |$.data[0].user_name|string|
      |$.data[0].employeeid|null|
      |$.data[0].zone_name|string|
      |$.data[0].outlet_count|number|
      |$.data[0].active_outlet_count|number|
      |$.data[0].inactive_outlet_count|number|
      |$.data[0].distributorerpcode|string|
      |$.data[0].distributor|string|
      |$.data[0].area_name|string|

  @Positive @Regression
  Scenario: TC_17 Regression test for beat wise dashboard data endpoint
    And I send the GET request to "beat_wise_dashboard_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason.error|""|
      |$.Reason.message|""|
      |$.data[0].beat_id|"34"|
      |$.data[0].beat_name|b1|
      |$.data[0].user_id|"8"|
      |$.data[0].user_name|SLV Traders|
      |$.data[0].zone_name|NORTH|
      |$.data[0].outlet_count|1|
      |$.data[0].active_outlet_count|1|
      |$.data[0].inactive_outlet_count|0|
      |$.data[0].distributorerpcode|trp133|
      |$.data[0].distributor|SLV DISTRIBUTOR|
      |$.data[0].area_name|Attibele|
      |$.data[0].distributorId|"2"|
      |$.data[0].zoneId|"1"|
      |$.data[0].distributorsalemanagerId|"7"|
      |$.data[0].distributorsalemanagerName|Sadha Nanda|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|object|
      |$.Reason.error|string|
      |$.Reason.message|string|
      |$.data|array|
      |$.data[0]|object|
      |$.data[0].beat_id|string|
      |$.data[0].beat_name|string|
      |$.data[0].headquarter_name|null|
      |$.data[0].pjp_date|string|
      |$.data[0].user_id|string|
      |$.data[0].user_name|string|
      |$.data[0].employeeid|null|
      |$.data[0].zone_name|string|
      |$.data[0].outlet_count|number|
      |$.data[0].active_outlet_count|number|

  @Positive @Functional
  Scenario: TC_18 Validate beat wise dashboard data response completeness
    And I send the GET request to "beat_wise_dashboard_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason.error|""|
      |$.Reason.message|""|
      |$.data[0].beat_id|"34"|
      |$.data[0].beat_name|b1|
      |$.data[0].headquarter_name|null|
      |$.data[0].pjp_date|2024-11-09|
      |$.data[0].user_id|"8"|
      |$.data[0].user_name|SLV Traders|
      |$.data[0].employeeid|null|
      |$.data[0].zone_name|NORTH|
      |$.data[0].outlet_count|1|
      |$.data[0].active_outlet_count|1|
      |$.data[0].inactive_outlet_count|0|
      |$.data[0].distributorerpcode|trp133|
      |$.data[0].distributor|SLV DISTRIBUTOR|
      |$.data[0].area_name|Attibele|
      |$.data[0].distributorId|"2"|
      |$.data[0].zoneId|"1"|
      |$.data[0].distributorsalemanagerId|"7"|
      |$.data[0].distributorsalemanagerHQ|null|
      |$.data[0].distributorsalemanagerName|Sadha Nanda|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|object|
      |$.Reason.error|string|
      |$.Reason.message|string|
      |$.data|array|
      |$.data[0]|object|
      |$.data[1]|object|

  @Positive @ArrayValidation
  Scenario: TC_19 Validate beat wise dashboard data array structure and content
    And I send the GET request to "beat_wise_dashboard_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason.error|""|
      |$.Reason.message|""|
      |$.data[0].beat_id|"34"|
      |$.data[0].beat_name|b1|
      |$.data[0].headquarter_name|null|
      |$.data[0].pjp_date|2024-11-09|
      |$.data[0].user_id|"8"|
      |$.data[0].user_name|SLV Traders|
      |$.data[0].employeeid|null|
      |$.data[0].zone_name|NORTH|
      |$.data[0].outlet_count|1|
      |$.data[0].active_outlet_count|1|
      |$.data[0].inactive_outlet_count|0|
      |$.data[0].distributorerpcode|trp133|
      |$.data[0].distributor|SLV DISTRIBUTOR|
      |$.data[0].area_name|Attibele|
      |$.data[0].distributorId|"2"|
      |$.data[0].zoneId|"1"|
      |$.data[0].distributorsalemanagerId|"7"|
      |$.data[0].distributorsalemanagerHQ|null|
      |$.data[0].distributorsalemanagerName|Sadha Nanda|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|object|
      |$.Reason.error|string|
      |$.Reason.message|string|
      |$.data|array|
      |$.data[0]|object|
      |$.data[1]|object|

  @Positive @ContentValidation
  Scenario: TC_20 Validate beat wise dashboard data content structure
    And I send the GET request to "beat_wise_dashboard_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason.error|""|
      |$.Reason.message|""|
      |$.data[0].beat_id|"34"|
      |$.data[0].beat_name|b1|
      |$.data[0].user_id|"8"|
      |$.data[0].user_name|SLV Traders|
      |$.data[0].zone_name|NORTH|
      |$.data[0].outlet_count|1|
      |$.data[0].active_outlet_count|1|
      |$.data[0].inactive_outlet_count|0|
      |$.data[0].distributorerpcode|trp133|
      |$.data[0].distributor|SLV DISTRIBUTOR|
      |$.data[0].area_name|Attibele|
      |$.data[0].distributorId|"2"|
      |$.data[0].zoneId|"1"|
      |$.data[0].distributorsalemanagerId|"7"|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |data|
      |beat_id|
      |beat_name|
      |user_id|
      |user_name|
      |zone_name|
      |outlet_count|
      |active_outlet_count|
      |inactive_outlet_count|
      |distributorerpcode|
      |distributor|
      |area_name|
      |distributorId|
      |zoneId|
      |distributorsalemanagerId|
      |distributorsalemanagerName|
      |salesmanagerId|
      |salesmanagerName|
      |zonemanagerId|
      |zonemanagerName|
      |orgmapping|
      |SLV Traders|
      |SLV DISTRIBUTOR|
      |Sadha Nanda|

  @Positive @LoadTesting
  Scenario: TC_21 Load testing for beat wise dashboard data endpoint
    And I send the GET request to "beat_wise_dashboard_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason.error|""|
      |$.Reason.message|""|
      |$.data[0].beat_id|"34"|
      |$.data[0].beat_name|b1|
      |$.data[0].user_id|"8"|
      |$.data[0].user_name|SLV Traders|
      |$.data[0].zone_name|NORTH|
      |$.data[0].outlet_count|1|
      |$.data[0].active_outlet_count|1|
      |$.data[0].inactive_outlet_count|0|
      |$.data[0].distributorerpcode|trp133|
      |$.data[0].distributor|SLV DISTRIBUTOR|
      |$.data[0].area_name|Attibele|
      |$.data[0].distributorId|"2"|
      |$.data[0].zoneId|"1"|
      |$.data[0].distributorsalemanagerId|"7"|
      |$.data[0].distributorsalemanagerName|Sadha Nanda|

  @Negative @Timeout
  Scenario: TC_22 Test beat wise dashboard data endpoint timeout handling
    And I send the GET request to "beat_wise_dashboard_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason.error|""|
      |$.Reason.message|""|
      |$.data[0].beat_id|"34"|
      |$.data[0].beat_name|b1|
      |$.data[0].user_id|"8"|
      |$.data[0].user_name|SLV Traders|
      |$.data[0].zone_name|NORTH|
      |$.data[0].outlet_count|1|
      |$.data[0].active_outlet_count|1|
      |$.data[0].inactive_outlet_count|0|
      |$.data[0].distributorerpcode|trp133|
      |$.data[0].distributor|SLV DISTRIBUTOR|
      |$.data[0].area_name|Attibele|
      |$.data[0].distributorId|"2"|
      |$.data[0].zoneId|"1"|
      |$.data[0].distributorsalemanagerId|"7"|
      |$.data[0].distributorsalemanagerName|Sadha Nanda|

  @Positive @EndToEnd
  Scenario: TC_23 End-to-end beat wise dashboard data retrieval workflow
    And I send the GET request to "beat_wise_dashboard_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason.error|""|
      |$.Reason.message|""|
    And I store the response as "beat_wise_dashboard_data_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|object|
      |$.Reason.error|string|
      |$.Reason.message|string|
      |$.data|array|
      |$.data[0]|object|
      |$.data[1]|object|

  @Positive @BeatWiseDashboardValidation
  Scenario: TC_24 Validate beat wise dashboard data accuracy
    And I send the GET request to "beat_wise_dashboard_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason.error|""|
      |$.Reason.message|""|
      |$.data[0].beat_id|"34"|
      |$.data[0].beat_name|b1|
      |$.data[0].headquarter_name|null|
      |$.data[0].pjp_date|2024-11-09|
      |$.data[0].user_id|"8"|
      |$.data[0].user_name|SLV Traders|
      |$.data[0].employeeid|null|
      |$.data[0].zone_name|NORTH|
      |$.data[0].outlet_count|1|
      |$.data[0].active_outlet_count|1|
      |$.data[0].inactive_outlet_count|0|
      |$.data[0].distributorerpcode|trp133|
      |$.data[0].distributor|SLV DISTRIBUTOR|
      |$.data[0].area_name|Attibele|
      |$.data[0].distributorId|"2"|
      |$.data[0].zoneId|"1"|
      |$.data[0].distributorsalemanagerId|"7"|
      |$.data[0].distributorsalemanagerHQ|null|
      |$.data[0].distributorsalemanagerName|Sadha Nanda|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|object|
      |$.Reason.error|string|
      |$.Reason.message|string|
      |$.data|array|
      |$.data[0]|object|
      |$.data[0].beat_id|string|
      |$.data[0].beat_name|string|
      |$.data[0].headquarter_name|null|
      |$.data[0].pjp_date|string|
      |$.data[0].user_id|string|
      |$.data[0].user_name|string|
      |$.data[0].employeeid|null|
      |$.data[0].zone_name|string|
      |$.data[0].outlet_count|number|
      |$.data[0].active_outlet_count|number|
      |$.data[0].inactive_outlet_count|number|
      |$.data[0].distributorerpcode|string|
      |$.data[0].distributor|string|
      |$.data[0].area_name|string|
      |$.data[0].distributorId|string|
      |$.data[0].zoneId|string|
      |$.data[0].distributorsalemanagerId|string|
      |$.data[0].distributorsalemanagerHQ|null|
      |$.data[0].distributorsalemanagerName|string|

  @Positive @UserManagementValidation
  Scenario: TC_25 Validate beat wise dashboard data user management interface
    And I send the GET request to "beat_wise_dashboard_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason.error|""|
      |$.Reason.message|""|
      |$.data[0].beat_id|"34"|
      |$.data[0].beat_name|b1|
      |$.data[0].user_id|"8"|
      |$.data[0].user_name|SLV Traders|
      |$.data[0].zone_name|NORTH|
      |$.data[0].outlet_count|1|
      |$.data[0].active_outlet_count|1|
      |$.data[0].inactive_outlet_count|0|
      |$.data[0].distributorerpcode|trp133|
      |$.data[0].distributor|SLV DISTRIBUTOR|
      |$.data[0].area_name|Attibele|
      |$.data[0].distributorId|"2"|
      |$.data[0].zoneId|"1"|
      |$.data[0].distributorsalemanagerId|"7"|
      |$.data[0].distributorsalemanagerName|Sadha Nanda|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.data[0].beat_name|DB:beats:name: id=34|
      |$.data[0].user_name|DB:users:name: id=8|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|object|
      |$.Reason.error|string|
      |$.Reason.message|string|
      |$.data|array|
      |$.data[0]|object|
      |$.data[0].beat_id|string|
      |$.data[0].beat_name|string|
      |$.data[0].headquarter_name|null|
      |$.data[0].pjp_date|string|
      |$.data[0].user_id|string|
      |$.data[0].user_name|string|
      |$.data[0].employeeid|null|
      |$.data[0].zone_name|string|
      |$.data[0].outlet_count|number|
      |$.data[0].active_outlet_count|number|
      |$.data[0].inactive_outlet_count|number|
      |$.data[0].distributorerpcode|string|
      |$.data[0].distributor|string|
      |$.data[0].area_name|string|
      |$.data[0].distributorId|string|
      |$.data[0].zoneId|string|

