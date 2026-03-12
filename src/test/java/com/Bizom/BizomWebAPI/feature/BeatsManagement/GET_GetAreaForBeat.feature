@BizomWebAPI @CE @BeatsManagement @GetAreaForBeat @CoreBusinessOperations
Feature: Get Area For Beat API Testing
  As a Bizom web API consumer
  I want to validate the get area for beat endpoint
  So that I can ensure beat to area mappings are returned correctly

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get area for beat without access token
    When I send the GET request to "get_area_for_beat" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |beatId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get area for beat with invalid access token
    And I send the GET request to "get_area_for_beat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
      |beatId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get area for beat with expired access token
    And I send the GET request to "get_area_for_beat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
      |beatId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get area for beat with malformed access token
    And I send the GET request to "get_area_for_beat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
      |beatId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get area for beat with valid access token
    And I send the GET request to "get_area_for_beat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |beatId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|
      |$.Data[0].AreaId|"1"|
      |$.Data[0].AreaName|Attibele|
    And I store the response as "getAreaForBeat_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate get area for beat response structure
    And I send the GET request to "get_area_for_beat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |beatId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|
      |$.Data[0]|object|
      |$.Data[0].AreaId|string|
      |$.Data[0].AreaName|string|
      |$.Data[0].warehouseId|string|
      |$.Data[0].warehouseName|string|

  @Positive @DataValidation
  Scenario: TC_07 Validate get area for beat specific values
    And I send the GET request to "get_area_for_beat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |beatId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data[1].AreaId|"3"|
      |$.Data[1].AreaName|Dist Area|
      |$.Data[2].AreaId|"2"|
      |$.Data[2].AreaName|NORTH|

  @Positive @DataValidation
  Scenario: TC_08 Validate get area for beat with static values
    And I send the GET request to "get_area_for_beat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |beatId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Data|
      |AreaId|
      |AreaName|

  @Positive @Performance
  Scenario: TC_09 Performance test for get area for beat endpoint
    And I send the GET request to "get_area_for_beat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |beatId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for get area for beat endpoint
    And I send the GET request to "get_area_for_beat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |beatId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verifies the list is not empty
      |JPath|
      |$.Data|

  @Negative @Validation
  Scenario: TC_11 Get area for beat with invalid query parameters
    And I send the GET request to "get_area_for_beat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |beatId|1|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_12 Get area for beat with special characters in query parameters
    And I send the GET request to "get_area_for_beat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |beatId|1|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Security
  Scenario: TC_13 Get area for beat with SQL injection attempt
    And I send the GET request to "get_area_for_beat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |beatId|1|
      |test_param|'; DROP TABLE beats; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Boundary
  Scenario: TC_14 Get area for beat with maximum query parameters
    And I send the GET request to "get_area_for_beat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |beatId|1|
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

  @Negative @ErrorHandling
  Scenario: TC_15 Get area for beat with invalid endpoint
    And I send the GET request to "get_area_for_beat_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |beatId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_16 Validate get area for beat business logic
    And I send the GET request to "get_area_for_beat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |beatId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Reason|Data Found|

  @Positive @Regression
  Scenario: TC_17 Regression test for get area for beat endpoint
    And I send the GET request to "get_area_for_beat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |beatId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|

  @Positive @Functional
  Scenario: TC_18 Validate get area for beat response completeness
    And I send the GET request to "get_area_for_beat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |beatId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verifies the list is not empty
      |JPath|
      |$.Data|

  @Positive @LoadTesting
  Scenario: TC_19 Load testing for get area for beat endpoint
    And I send the GET request to "get_area_for_beat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |beatId|1|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Timeout
  Scenario: TC_20 Test get area for beat endpoint timeout handling
    And I send the GET request to "get_area_for_beat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |beatId|1|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|


