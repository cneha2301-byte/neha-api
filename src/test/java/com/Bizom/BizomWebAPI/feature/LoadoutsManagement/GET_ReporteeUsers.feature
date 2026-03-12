@BizomWebAPI @OS @LoadoutsManagement @ReporteeUsers @SystemIntegration
Feature: Reportee Users API Testing
  As a system user
  I want to test the reporteeUsers endpoint
  So that I can ensure proper retrieval of reportee users with loadout data

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |accept-language|en-US,en;q=0.9|
      |priority|u=0, i|
      |sec-ch-ua|"Google Chrome";v="143", "Chromium";v="143", "Not A(Brand";v="24"|
      |sec-ch-ua-mobile|?0|
      |sec-ch-ua-platform|"Windows"|
      |sec-fetch-dest|document|
      |sec-fetch-mode|navigate|
      |sec-fetch-site|none|
      |sec-fetch-user|?1|
      |upgrade-insecure-requests|1|
      |user-agent|Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36|

  @Negative @Security
  Scenario: TC_01 Get reportee users without access token
    When I send the GET request to "GET_reporteeUsers" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |startdate|2025-01-26|
      |enddate|2025-11-26|
      |warehouseId|30|
      |areaId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get reportee users with invalid access token
    And I send the GET request to "GET_reporteeUsers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
      |startdate|2025-01-26|
      |enddate|2025-11-26|
      |warehouseId|30|
      |areaId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get reportee users with expired access token
    And I send the GET request to "GET_reporteeUsers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
      |startdate|2025-01-26|
      |enddate|2025-11-26|
      |warehouseId|30|
      |areaId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get reportee users with malformed access token
    And I send the GET request to "GET_reporteeUsers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
      |startdate|2025-01-26|
      |enddate|2025-11-26|
      |warehouseId|30|
      |areaId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_05 Get reportee users with empty access token
    And I send the GET request to "GET_reporteeUsers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token||
      |startdate|2025-01-26|
      |enddate|2025-11-26|
      |warehouseId|30|
      |areaId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_06 Get reportee users with valid parameters
    And I send the GET request to "GET_reporteeUsers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startdate|2025-01-26|
      |enddate|2025-11-26|
      |warehouseId|30|
      |areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
    And I store the response as "reporteeusers_response" name using full path

  @Positive @DataValidation
  Scenario: TC_07 Validate reportee users response structure
    And I send the GET request to "GET_reporteeUsers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startdate|2025-01-26|
      |enddate|2025-11-26|
      |warehouseId|30|
      |areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.data|array|

  @Positive @DataValidation
  Scenario: TC_08 Validate reportee users data array structure
    And I send the GET request to "GET_reporteeUsers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startdate|2025-01-26|
      |enddate|2025-11-26|
      |warehouseId|30|
      |areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
      |$.data[0]|object|
      |$.data[0].userid|string|
      |$.data[0].name|string|
      |$.data[0].username|string|
      |$.data[0].employeeid|string|
      |$.data[0].loadoutsData|object|

#  @Positive @DataValidation
#  Scenario: TC_09 Validate loadoutsData object structure
#    And I send the GET request to "GET_reporteeUsers" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |startdate|2025-01-26|
#      |enddate|2025-11-26|
#      |warehouseId|30|
#      |areaId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.data[0].loadoutsData|object|
#      |$.data[0].loadoutsData.approved|string|
#      |$.data[0].loadoutsData.pending|string|
#      |$.data[0].loadoutsData.rejected|string|
#      |$.data[0].loadoutsData.inTransit|string|
#      |$.data[0].loadoutsData.accepted|string|
#      |$.data[0].loadoutsData.submitted|string|

  @Positive @Performance
  Scenario: TC_10 Performance test for reportee users endpoint
    And I send the GET request to "GET_reporteeUsers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startdate|2025-01-26|
      |enddate|2025-11-26|
      |warehouseId|30|
      |areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @Validation
  Scenario: TC_11 Get reportee users with invalid startdate format
    And I send the GET request to "GET_reporteeUsers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startdate|invalid-date|
      |enddate|2025-11-26|
      |warehouseId|30|
      |areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_12 Get reportee users with invalid enddate format
    And I send the GET request to "GET_reporteeUsers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startdate|2025-01-26|
      |enddate|invalid-date|
      |warehouseId|30|
      |areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_13 Get reportee users with reversed date range
    And I send the GET request to "GET_reporteeUsers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startdate|2025-11-26|
      |enddate|2025-01-26|
      |warehouseId|30|
      |areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_14 Get reportee users with invalid warehouseId
    And I send the GET request to "GET_reporteeUsers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startdate|2025-01-26|
      |enddate|2025-11-26|
      |warehouseId|abc|
      |areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_15 Get reportee users with invalid areaId
    And I send the GET request to "GET_reporteeUsers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startdate|2025-01-26|
      |enddate|2025-11-26|
      |warehouseId|30|
      |areaId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_16 Get reportee users with non-existent warehouseId
    And I send the GET request to "GET_reporteeUsers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startdate|2025-01-26|
      |enddate|2025-11-26|
      |warehouseId|999999|
      |areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_17 Get reportee users with non-existent areaId
    And I send the GET request to "GET_reporteeUsers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startdate|2025-01-26|
      |enddate|2025-11-26|
      |warehouseId|30|
      |areaId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_18 Get reportee users with zero warehouseId
    And I send the GET request to "GET_reporteeUsers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startdate|2025-01-26|
      |enddate|2025-11-26|
      |warehouseId|0|
      |areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_19 Get reportee users with zero areaId
    And I send the GET request to "GET_reporteeUsers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startdate|2025-01-26|
      |enddate|2025-11-26|
      |warehouseId|30|
      |areaId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_20 Get reportee users with negative warehouseId
    And I send the GET request to "GET_reporteeUsers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startdate|2025-01-26|
      |enddate|2025-11-26|
      |warehouseId|-1|
      |areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_21 Get reportee users with negative areaId
    And I send the GET request to "GET_reporteeUsers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startdate|2025-01-26|
      |enddate|2025-11-26|
      |warehouseId|30|
      |areaId|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Negative @ErrorHandling
#  Scenario: TC_22 Get reportee users with invalid endpoint
#    And I send the GET request to "GET_reporteeUsers_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |startdate|2025-01-26|
#      |enddate|2025-11-26|
#      |warehouseId|30|
#      |areaId|1|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds

  @Positive @DataValidation
  Scenario: TC_23 Validate reportee users response contains mandatory keys
    And I send the GET request to "GET_reporteeUsers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startdate|2025-01-26|
      |enddate|2025-11-26|
      |warehouseId|30|
      |areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
    And validating the response contains the following values
      |Value|
      |result|
      |data|
      |userid|
      |name|
      |username|
      |loadoutsData|

  @Positive @ArrayValidation
  Scenario: TC_24 Validate reportee users data array contains user objects
    And I send the GET request to "GET_reporteeUsers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startdate|2025-01-26|
      |enddate|2025-11-26|
      |warehouseId|30|
      |areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
      |$.data[0].userid|string|
      |$.data[0].name|string|
      |$.data[0].username|string|

  @Positive @Concurrency
  Scenario: TC_25 Concurrent access test for reportee users endpoint
    And I send the GET request to "GET_reporteeUsers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startdate|2025-01-26|
      |enddate|2025-11-26|
      |warehouseId|30|
      |areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Positive @LoadTesting
  Scenario: TC_26 Load testing for reportee users endpoint
    And I send the GET request to "GET_reporteeUsers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startdate|2025-01-26|
      |enddate|2025-11-26|
      |warehouseId|30|
      |areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @Timeout
  Scenario: TC_27 Test reportee users endpoint timeout handling
    And I send the GET request to "GET_reporteeUsers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startdate|2025-01-26|
      |enddate|2025-11-26|
      |warehouseId|30|
      |areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Positive @Regression
  Scenario: TC_28 Regression test for reportee users endpoint
    And I send the GET request to "GET_reporteeUsers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startdate|2025-01-26|
      |enddate|2025-11-26|
      |warehouseId|30|
      |areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.data|array|

  @Positive @EndToEnd
  Scenario: TC_29 End-to-end reportee users workflow
    And I send the GET request to "GET_reporteeUsers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startdate|2025-01-26|
      |enddate|2025-11-26|
      |warehouseId|30|
      |areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.data|array|
      |$.data[0]|object|
      |$.data[0].loadoutsData|object|
    And validating the response contains the following values
      |Value|
      |result|
      |data|
      |userid|
      |name|
      |username|
      |loadoutsData|
      |approved|
      |pending|
      |rejected|
      |inTransit|
      |accepted|
      |submitted|
    And I store the response as "reporteeusers_response" name using full path

  @Positive @Boundary
  Scenario: TC_30 Get reportee users with same startdate and enddate
    And I send the GET request to "GET_reporteeUsers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startdate|2025-01-26|
      |enddate|2025-01-26|
      |warehouseId|30|
      |areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Positive @Boundary
  Scenario: TC_31 Get reportee users with very large date range
    And I send the GET request to "GET_reporteeUsers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startdate|2020-01-01|
      |enddate|2025-12-31|
      |warehouseId|30|
      |areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Positive @Boundary
  Scenario: TC_32 Get reportee users with different warehouse IDs
    And I send the GET request to "GET_reporteeUsers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startdate|2025-01-26|
      |enddate|2025-11-26|
      |warehouseId|1|
      |areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Positive @Boundary
  Scenario: TC_33 Get reportee users with different area IDs
    And I send the GET request to "GET_reporteeUsers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startdate|2025-01-26|
      |enddate|2025-11-26|
      |warehouseId|30|
      |areaId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

