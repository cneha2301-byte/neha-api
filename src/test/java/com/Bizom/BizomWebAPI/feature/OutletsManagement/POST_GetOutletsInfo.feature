@BizomWebAPI @CE @OutletsManagement @GetOutletsInfo @SystemIntegration
Feature: Get Outlets Info API Testing
  As a system user
  I want to test the getOutletsinfo endpoint
  So that I can ensure proper retrieval of outlet information for given outlet IDs

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
  Scenario: TC_01 Get outlets info without access token
    And I post the request with "POST_getOutletsInfo" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token||
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get outlets info with invalid access token
    And I post the request with "POST_getOutletsInfo" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|invalid_token_12345|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get outlets info with expired access token
    And I post the request with "POST_getOutletsInfo" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|expired_token_12345|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get outlets info with malformed access token
    And I post the request with "POST_getOutletsInfo" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|malformed.token.here|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get outlets info with valid request
    And I post the request with "POST_getOutletsInfo" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.Outlets[0].Outletid|"4"|
      |$.Outlets[0].Outlet.id|"4"|
      |$.Outlets[0].Outlet.name|Anmol Kirana|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Outlets|array|
      |$.Outlets[0]|object|
      |$.Outlets[0].Outletid|string|
      |$.Outlets[0].Outlet|object|
      |$.Outlets[0].Outlet.id|string|
      |$.Outlets[0].Outlet.name|string|
      |$.Outlets[0].Outlet.address|string|
      |$.Outlets[0].Outlet.approved|string|
      |$.Outlets[0].Outlet.area_id|string|
      |$.Outlets[0].Outlet.city_id|string|
      |$.Outlets[0].Outlet.district_id|string|
      |$.Outlets[0].Outlet.created|string|
      |$.Outlets[0].Outlet.modified|string|
      |$.Outlets[0].Outlet.latitude|string|
      |$.Outlets[0].Outlet.longitude|string|
      |$.Outlets[0].Outlet.phoneno|string|
      |$.Outlets[0].Outlet.ownername|string|
      |$.Outlets[0].Outlet.ownermobile|string|
      |$.Outlets[0].Outlet.pin|string|
    And I store the response as "get_outlets_info_response" name using full path

  @Positive @DBValidation
  Scenario: TC_06 Validate outlet info with DB
    And I post the request with "POST_getOutletsInfo" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Outlets[0].Outlet.name|DB:outlets:name: id=4|

  @Positive @Performance
  Scenario: TC_07 Performance test for get outlets info endpoint
    And I post the request with "POST_getOutletsInfo" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_08 Get outlets info with invalid outlet IDs
    And I modify fields with random values and remove fields in "POST_getOutletsInfo" payload
      |JPath|Value|
      |$.outletIds|["abc","xyz"]|
    And I post the request with "POST_getOutletsInfo" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Outlets|array|

  @Negative @Validation
  Scenario: TC_09 Get outlets info with empty body
    And I send empty body with "POST_getOutletsInfo" request
    And I post the request with "POST_getOutletsInfo" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No data found."|

#  @Negative @ErrorHandling
#  Scenario: TC_10 Get outlets info with invalid endpoint
#    And I post the request with "POST_getOutletsInfo_invalid" payload with dynamic access token and query parameters
#      |Query|Value|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_11 Get outlets info with empty outletIds array
    And I modify fields with random values and remove fields in "POST_getOutletsInfo" payload
      |JPath|Value|
      |$.outletIds|[]|
    And I post the request with "POST_getOutletsInfo" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Outlets|array|

  @Negative @Validation
  Scenario: TC_12 Get outlets info with non-existent outlet IDs
    And I modify fields with random values and remove fields in "POST_getOutletsInfo" payload
      |JPath|Value|
      |$.outletIds|["999999","999998"]|
    And I post the request with "POST_getOutletsInfo" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Outlets|array|

  @Positive @ObjectValidation
  Scenario: TC_13 Validate outlet object structure and data types
    And I post the request with "POST_getOutletsInfo" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Outlets[0].Outlet.id|string|
      |$.Outlets[0].Outlet.name|string|
      |$.Outlets[0].Outlet.address|string|
      |$.Outlets[0].Outlet.approved|string|
      |$.Outlets[0].Outlet.approved_date|string|
      |$.Outlets[0].Outlet.area_id|string|
      |$.Outlets[0].Outlet.created|string|
      |$.Outlets[0].Outlet.modified|string|
      |$.Outlets[0].Outlet.latitude|string|
      |$.Outlets[0].Outlet.longitude|string|
      |$.Outlets[0].Outlet.phoneno|string|
      |$.Outlets[0].Outlet.ownername|string|
      |$.Outlets[0].Outlet.ownermobile|string|
      |$.Outlets[0].Outlet.pin|string|
      |$.Outlets[0].Outlet.outletcategory_id|string|
      |$.Outlets[0].Outlet.outlettype_id|string|
      |$.Outlets[0].Outlet.outletstate_id|string|
      |$.Outlets[0].Outlet.gstinno|string|

  @Positive @ContentValidation
  Scenario: TC_14 Validate outlets info response contains mandatory keys
    And I post the request with "POST_getOutletsInfo" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Outlets|
      |Outletid|
      |Outlet|
      |id|
      |name|
      |address|
      |approved|
      |created|
      |modified|
      |phoneno|
      |ownername|
      |ownermobile|
      |pin|

  @Positive @Regression
  Scenario: TC_15 Regression test for get outlets info endpoint
    And I post the request with "POST_getOutletsInfo" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Outlets|array|

  @Positive @Concurrency
  Scenario: TC_16 Concurrent access test for get outlets info endpoint
    And I post the request with "POST_getOutletsInfo" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @LoadTesting
  Scenario: TC_17 Load testing for get outlets info endpoint
    And I post the request with "POST_getOutletsInfo" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Timeout
  Scenario: TC_18 Test get outlets info endpoint timeout handling
    And I post the request with "POST_getOutletsInfo" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

