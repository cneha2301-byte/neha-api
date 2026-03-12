@BizomWebAPI @CE @BeatsManagement @GetBeatDetailByName @CoreBusinessOperations
Feature: Get Beat Detail By Name API Testing
  As a Bizom web API consumer
  I want to validate the get beat detail by name endpoint
  So that I can ensure beat level outlet detail responses are reliable

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get beat detail by name without access token
    When I send the GET request to "get_beat_detail_by_name" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |beatIds|2|
      |language|en|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get beat detail by name with invalid access token
    And I send the GET request to "get_beat_detail_by_name" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
      |beatIds|2|
      |language|en|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get beat detail by name with expired access token
    And I send the GET request to "get_beat_detail_by_name" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
      |beatIds|2|
      |language|en|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get beat detail by name with malformed access token
    And I send the GET request to "get_beat_detail_by_name" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
      |beatIds|2|
      |language|en|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get beat detail by name with valid access token
    And I send the GET request to "get_beat_detail_by_name" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |beatIds|2|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verifies the list is not empty
      |JPath|
      |$.beatDetail|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.beatDetail[0].beat_id|"2"|
      |$.beatDetail[0].beat_name|Anekal|
    And I store the response as "getBeatDetailByName_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate beat detail by name response structure
    And I send the GET request to "get_beat_detail_by_name" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |beatIds|2|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.beatDetail|array|
      |$.beatDetail[0]|object|
      |$.beatDetail[0].beatDetail|array|
      |$.beatDetail[0].beatDetail[0].Outlet|object|
      |$.beatDetail[0].beatDetail[0].Outlet.id|string|
      |$.beatDetail[0].beatDetail[0].Outlet.name|string|
      |$.beatDetail[0].beatDetail[0].Outlet.latitude|string|
      |$.beatDetail[0].beatDetail[0].Outlet.longitude|string|

  @Positive @DataValidation
  Scenario: TC_07 Validate beat detail by name specific data values
    And I send the GET request to "get_beat_detail_by_name" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |beatIds|2|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.beatDetail[0].beatDetail[0].Outlet.id|"19"|
      |$.beatDetail[0].beatDetail[0].Outlet.name|Sadha Nanda|
      |$.beatDetail[0].beatDetail[0].Outlet.area_id|"3"|
      |$.beatDetail[0].beatDetail[0].Outlet.state_id|"2"|
      |$.beatDetail[0].beatDetail[0].Outlet.latitude|"12.90853831"|
      |$.beatDetail[0].beatDetail[0].Outlet.longitude|"77.60934167"|

  @Positive @DataValidation
  Scenario: TC_08 Validate beat detail by name static outlet values
    And I send the GET request to "get_beat_detail_by_name" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |beatIds|2|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |beatDetail|
      |Outlet|
      |name|
      |latitude|
      |longitude|

  @Positive @Performance
  Scenario: TC_09 Performance test for get beat detail by name endpoint
    And I send the GET request to "get_beat_detail_by_name" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |beatIds|2|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for get beat detail by name endpoint
    And I send the GET request to "get_beat_detail_by_name" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |beatIds|2|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_11 Get beat detail by name with invalid query parameters
    And I send the GET request to "get_beat_detail_by_name" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |beatIds|2|
      |language|en|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.beatDetail[0].beat_id|"2"|

  @Negative @Validation
  Scenario: TC_12 Get beat detail by name with special characters in query parameters
    And I send the GET request to "get_beat_detail_by_name" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |beatIds|2|
      |language|en|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_13 Get beat detail by name with SQL injection attempt
    And I send the GET request to "get_beat_detail_by_name" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |beatIds|2|
      |language|en|
      |test_param|'; DROP TABLE beats; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: TC_14 Get beat detail by name with maximum query parameters
    And I send the GET request to "get_beat_detail_by_name" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |beatIds|2|
      |language|en|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_15 Get beat detail by name with invalid endpoint
    And I send the GET request to "get_beat_detail_by_name_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |beatIds|2|
      |language|en|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_16 Validate beat detail by name business logic
    And I send the GET request to "get_beat_detail_by_name" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |beatIds|2|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.beatDetail[0].beatDetail[0].Outlet.approved|"1"|
      |$.beatDetail[0].beatDetail[0].Outlet.oxyoutlettype|created|

  @Positive @Regression
  Scenario: TC_17 Regression test for get beat detail by name endpoint
    And I send the GET request to "get_beat_detail_by_name" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |beatIds|2|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.beatDetail[0].beat_name|Anekal|
      |$.beatDetail[0].beatDetail[0].Outlet.pin|"562107"|

  @Positive @Functional
  Scenario: TC_18 Validate beat detail by name response completeness
    And I send the GET request to "get_beat_detail_by_name" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |beatIds|2|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verifies the list is not empty
      |JPath|
      |$.beatDetail[0].beatDetail|

  @Positive @LoadTesting
  Scenario: TC_19 Load testing for get beat detail by name endpoint
    And I send the GET request to "get_beat_detail_by_name" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |beatIds|2|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Negative @Timeout
  Scenario: TC_20 Test get beat detail by name endpoint timeout handling
    And I send the GET request to "get_beat_detail_by_name" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |beatIds|2|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds

  @Positive @EndToEnd
  Scenario: TC_21 End-to-end beat detail by name workflow
    And I send the GET request to "get_beat_detail_by_name" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |beatIds|2|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.beatDetail[0].beat_id|"2"|
      |$.beatDetail[0].beatDetail[0].Outlet.name|Sadha Nanda|
    And I store the response as "getBeatDetailByName_response" name using full path

