@BizomWebAPI @CE @BeatsManagement @OutletsManagement @BeatMapOutlets @ConfigurationSettings
Feature: Get Beat Map Outlets API Testing
  As a Bizom web API consumer
  I want to validate the beat map outlets endpoint
  So that I can ensure beat level outlet mapping data is reliable

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get beat map outlets without access token
    When I send the GET request to "getbeatmapoutelts_by_id" endpoint with path parameters
      |Path|Value|
      |beatId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get beat map outlets with invalid access token
    And I send the GET request to "getbeatmapoutelts_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|beatId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get beat map outlets with expired access token
    And I send the GET request to "getbeatmapoutelts_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|beatId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04Get beat map outlets with malformed access token
    And I send the GET request to "getbeatmapoutelts_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|beatId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get beat map outlets with valid access token
    And I send the GET request to "getbeatmapoutelts_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verifies the list is not empty
      |JPath|
      |$.beat|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.beat[0].beat_id|"2"|
      |$.beat[0].beat_name|Anekal|
      |$.beat[0].outlet_id|"678"|
      |$.beat[0].sequence|"1"|
      |$.beat[0].outlet_name|utkarsh-test-outlet-1|
      |$.beat[0].area_name|Attibele|
      |$.beat[0].latitude|"12.90854975"|
      |$.beat[0].longitude|"77.60935508"|
    And I store the response as "getBeatMapOutelts_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate beat map outlets response structure
    And I send the GET request to "getbeatmapoutelts_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.beat[0].outlet_name|utkarsh-test-outlet-1|
      |$.beat[0].area_name|Attibele|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.beat|array|
      |$.beat[0]|object|

  @Positive @DataValidation
  Scenario: TC_07 Validate beat map outlets specific data values
    And I send the GET request to "getbeatmapoutelts_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|

      |$.beat[0].outlet_name|utkarsh-test-outlet-1|

      |$.beat[1].outlet_name|Paal General Store|

  @Positive @DataValidation
  Scenario: TC_08 Validate beat map outlets with static values
    And I send the GET request to "getbeatmapoutelts_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.beat[0].id|"973"|
      |$.beat[0].beat_name|Anekal|
      |$.beat[0].outlet_name|utkarsh-test-outlet-1|
      |$.beat[0].area_name|Attibele|
      |$.beat[0].weightage|"0"|
      |$.beat[0].capacity|"0"|
      |$.beat[1].id|"942"|
      |$.beat[1].outlet_name|Paal General Store|
      |$.beat[1].area_name|Attibele|
      |$.beat[1].sequence|"2"|
      |$.beat[2].id|"758"|
      |$.beat[2].outlet_name|Sadha Nanda|
      |$.beat[2].area_name|Dist Area|
      |$.beat[2].sequence|"3"|

  @Positive @Performance
  Scenario: TC_09 Performance test for beat map outlets endpoint
    And I send the GET request to "getbeatmapoutelts_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|2|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.beat[0].beat_id|"2"|

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for beat map outlets endpoint
    And I send the GET request to "getbeatmapoutelts_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.beat[0].outlet_name|utkarsh-test-outlet-1|

  @Negative @Validation
  Scenario: TC_11 Get beat map outlets with invalid query parameters
    And I send the GET request to "getbeatmapoutelts_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|2|
      |invalid_param|invalid_value|beatId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.beat[0].beat_id|"2"|

  @Negative @Validation
  Scenario: TC_12 Get beat map outlets with special characters in query parameters
    And I send the GET request to "getbeatmapoutelts_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|2|
      |test_param|<script>alert('XSS')</script>|beatId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.beat[0].beat_name|Anekal|

  @Negative @Security
  Scenario: TC_13 Get beat map outlets with SQL injection attempt
    And I send the GET request to "getbeatmapoutelts_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|2|
      |test_param|'; DROP TABLE beat; --|beatId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.beat[0].outlet_name|utkarsh-test-outlet-1|

  @Negative @Boundary
  Scenario: TC_14 Get beat map outlets with maximum query parameters
    And I send the GET request to "getbeatmapoutelts_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|2|
      |param1|value1|beatId|2|
      |param2|value2|beatId|2|
      |param3|value3|beatId|2|
      |param4|value4|beatId|2|
      |param5|value5|beatId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.beat[0].beat_id|"2"|

  @Negative @ErrorHandling
  Scenario: TC_15 Get beat map outlets with invalid endpoint
    And I send the GET request to "getbeatmapoutelts_by_id_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_16 Validate beat map outlets business logic
    And I send the GET request to "getbeatmapoutelts_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.beat[0].sequence|"1"|

  @Positive @DataIntegrity
  Scenario: TC_17 Validate beat map outlets data integrity
    And I send the GET request to "getbeatmapoutelts_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.beat[0].beat_id|"2"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.beat|array|
      |$.beat[0].beat_id|string|
      |$.beat[0].beat_name|string|

  @Positive @Regression
  Scenario: TC_18 Regression test for beat map outlets endpoint
    And I send the GET request to "getbeatmapoutelts_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.beat[0].outlet_name|utkarsh-test-outlet-1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.beat|array|

  @Positive @Functional
  Scenario: TC_19 Validate beat map outlets response completeness
    And I send the GET request to "getbeatmapoutelts_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.beat[0].beat_id|"2"|
      |$.beat[1].beat_id|"2"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.beat|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.beat[0].outlet_id|"678"|
      |$.beat[1].outlet_id|"6"|

  @Positive @ArrayValidation
  Scenario: TC_20 Validate beat map outlets array structure and content
    And I send the GET request to "getbeatmapoutelts_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.beat[0].beat_name|Anekal|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.beat|array|
      |$.beat[0]|object|
      |$.beat[1]|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.beat[0].outlet_name|utkarsh-test-outlet-1|
      |$.beat[1].outlet_name|Paal General Store|

  @Positive @ContentValidation
  Scenario: TC_21 Validate beat map outlets content structure
    And I send the GET request to "getbeatmapoutelts_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.beat[0].beat_id|"2"|
    And validating the response contains the following values
      |Value|
      |beat|
      |beat_id|
      |outlet_name|

  @Positive @LoadTesting
  Scenario: TC_22 Load testing for beat map outlets endpoint
    And I send the GET request to "getbeatmapoutelts_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|2|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.beat[0].beat_id|"2"|

  @Negative @Timeout
  Scenario: TC_23 Test beat map outlets endpoint timeout handling
    And I send the GET request to "getbeatmapoutelts_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|2|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.beat[0].beat_id|"2"|

  @Positive @EndToEnd
  Scenario: TC_24 End-to-end beat map outlets data retrieval workflow
    And I send the GET request to "getbeatmapoutelts_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.beat[0].beat_id|"2"|
      |$.beat[0].outlet_name|utkarsh-test-outlet-1|
    And I store the response as "getBeatMapOutelts_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.beat|array|
      |$.beat[0].beat_id|string|
      |$.beat[0].outlet_name|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.beat[1].outlet_name|Paal General Store|

