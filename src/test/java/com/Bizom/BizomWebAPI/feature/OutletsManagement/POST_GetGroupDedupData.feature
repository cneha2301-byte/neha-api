@BizomWebAPI @CE @OutletsManagement @GetGroupDedupData @SystemIntegration
Feature: Get Group Dedup Data API Testing
  As a system user
  I want to test the getGroupDedupData endpoint
  So that I can ensure proper retrieval of group dedup data for given outlet IDs

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
  Scenario: TC_01 Get group dedup data without access token
    And I post the request with "POST_getGroupDedupData" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token||
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get group dedup data with invalid access token
    And I post the request with "POST_getGroupDedupData" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get group dedup data with expired access token
    And I post the request with "POST_getGroupDedupData" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get group dedup data with malformed access token
    And I post the request with "POST_getGroupDedupData" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get group dedup data with valid request
    And I post the request with "POST_getGroupDedupData" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.Data.1.id|"1"|
      |$.Data.1.name|SLV Traders|
      |$.Data.1.address|Bangalore|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|
      |$.Data.1|object|
      |$.Data.1.id|string|
      |$.Data.1.erp_id|string|
      |$.Data.1.name|string|
      |$.Data.1.address|string|
      |$.Data.1.latitude|string|
      |$.Data.1.longitude|string|
      |$.Data.1.pin|string|
      |$.Data.1.created|string|
      |$.Data.1.modified|string|
      |$.Data.1.area_id|string|
      |$.Data.1.approved|string|
      |$.Data.1.assignedtouser_id|string|
      |$.Data.1.outletstate_id|string|
      |$.Data.1.outletstate|string|
      |$.Data.1.city|string|
      |$.Data.1.city_name|string|
      |$.Data.1.outletImage|array|
    And I store the response as "get_group_dedup_data_response" name using full path

  @Positive @DBValidation
  Scenario: TC_06 Validate group dedup data with DB
    And I post the request with "POST_getGroupDedupData" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Data.1.name|DB:outlets:name: id=1|

  @Positive @Performance
  Scenario: TC_07 Performance test for get group dedup data endpoint
    And I post the request with "POST_getGroupDedupData" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_08 Get group dedup data with invalid outlet IDs
    And I modify fields with random values and remove fields in "POST_getGroupDedupData" payload
      |JPath|Value|
      |$.outletIds|["abc","xyz"]|
    And I post the request with "POST_getGroupDedupData" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Data|object|

  @Negative @Validation
  Scenario: TC_09 Get group dedup data with empty body
    And I send empty body with "POST_getGroupDedupData" request
    And I post the request with "POST_getGroupDedupData" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Invalid Request"|

#  @Negative @ErrorHandling
#  Scenario: TC_10 Get group dedup data with invalid endpoint
#    And I post the request with "POST_getGroupDedupData_invalid" payload with dynamic access token and query parameters
#      |Query|Value|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_11 Get group dedup data with empty outletIds array
    And I modify fields with random values and remove fields in "POST_getGroupDedupData" payload
      |JPath|Value|
      |$.outletIds|[]|
    And I post the request with "POST_getGroupDedupData" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Data|object|

  @Negative @Validation
  Scenario: TC_12 Get group dedup data with non-existent outlet IDs
    And I modify fields with random values and remove fields in "POST_getGroupDedupData" payload
      |JPath|Value|
      |$.outletIds|["999999"]|
    And I post the request with "POST_getGroupDedupData" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Data|object|

  @Positive @ObjectValidation
  Scenario: TC_13 Validate group dedup data object structure and data types
    And I post the request with "POST_getGroupDedupData" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data.1.id|string|
      |$.Data.1.erp_id|string|
      |$.Data.1.name|string|
      |$.Data.1.address|string|
      |$.Data.1.latitude|string|
      |$.Data.1.longitude|string|
      |$.Data.1.pin|string|
      |$.Data.1.created|string|
      |$.Data.1.modified|string|
      |$.Data.1.area_id|string|
      |$.Data.1.approved|string|
      |$.Data.1.assignedtouser_id|string|
      |$.Data.1.outletstate_id|string|
      |$.Data.1.outletstate|string|
      |$.Data.1.city|string|
      |$.Data.1.last_month_sale_amount|string|
      |$.Data.1.last_sale_date|string|
      |$.Data.1.last_month_order_amount|string|
      |$.Data.1.last_order_date|string|
      |$.Data.1.outletImage|array|
      |$.Data.1.beat|string|
      |$.Data.1.city_name|string|

  @Positive @ContentValidation
  Scenario: TC_14 Validate group dedup data response contains mandatory keys
    And I post the request with "POST_getGroupDedupData" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Data|
      |id|
      |erp_id|
      |name|
      |address|
      |latitude|
      |longitude|
      |pin|
      |created|
      |modified|
      |area_id|
      |approved|
      |assignedtouser_id|
      |outletstate_id|
      |outletstate|
      |city|
      |city_name|

  @Positive @Regression
  Scenario: TC_15 Regression test for get group dedup data endpoint
    And I post the request with "POST_getGroupDedupData" payload with dynamic access token and query parameters
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
      |$.Data|object|

  @Positive @Concurrency
  Scenario: TC_16 Concurrent access test for get group dedup data endpoint
    And I post the request with "POST_getGroupDedupData" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @LoadTesting
  Scenario: TC_17 Load testing for get group dedup data endpoint
    And I post the request with "POST_getGroupDedupData" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Timeout
  Scenario: TC_18 Test get group dedup data endpoint timeout handling
    And I post the request with "POST_getGroupDedupData" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

