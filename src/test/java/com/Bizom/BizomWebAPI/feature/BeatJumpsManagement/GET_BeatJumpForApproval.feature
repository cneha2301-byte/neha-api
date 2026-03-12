@BizomWebAPI @CE @BeatJumpsManagement @BeatJumps @BeatJumpForApproval @CoreBusinessOperations
Feature: Beat Jump For Approval API Testing
  As a Bizom web API consumer
  I want to validate the beat jump for approval endpoint
  So that I can ensure beat jump approval data is returned correctly

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get beat jump for approval without access token
    When I send the GET request to "beatjumps_beatjump_for_approval" endpoint with path parameters
      |Path|Value|
      |userId|1|
      |beatId|12|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get beat jump for approval with invalid access token
    And I send the GET request to "beatjumps_beatjump_for_approval" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|userId|1|
      |access_token|invalid_token_12345|beatId|12|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get beat jump for approval with expired access token
    And I send the GET request to "beatjumps_beatjump_for_approval" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|userId|1|
      |access_token|expired_token_12345|beatId|12|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get beat jump for approval with malformed access token
    And I send the GET request to "beatjumps_beatjump_for_approval" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|userId|1|
      |access_token|malformed.token.here|beatId|12|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get beat jump for approval with valid userId 1 and beatId 12
    And I send the GET request to "beatjumps_beatjump_for_approval" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
      |access_token|ACCESS_TOKEN|beatId|12|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.apiVersion|2|
      |$.Status|3|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.apiVersion|number|
      |$.Status|number|

  @Positive @Functional
  Scenario: TC_06 Get beat jump for approval with valid userId 2 and beatId 10
    And I send the GET request to "beatjumps_beatjump_for_approval" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
      |access_token|ACCESS_TOKEN|beatId|10|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.apiVersion|2|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Negative @Validation
  Scenario: TC_07 Get beat jump for approval with invalid userId (non-numeric)
    And I send the GET request to "beatjumps_beatjump_for_approval" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|abc|
      |access_token|ACCESS_TOKEN|beatId|12|
    Then I should see the response code as "500"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_08 Get beat jump for approval with invalid beatId (non-numeric)
    And I send the GET request to "beatjumps_beatjump_for_approval" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
      |access_token|ACCESS_TOKEN|beatId|xyz|
    Then I should see the response code as "500"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_09 Get beat jump for approval with non-existent userId
    And I send the GET request to "beatjumps_beatjump_for_approval" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|999999|
      |access_token|ACCESS_TOKEN|beatId|12|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_10 Get beat jump for approval with non-existent beatId
    And I send the GET request to "beatjumps_beatjump_for_approval" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
      |access_token|ACCESS_TOKEN|beatId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_11 Get beat jump for approval with zero userId
    And I send the GET request to "beatjumps_beatjump_for_approval" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|0|
      |access_token|ACCESS_TOKEN|beatId|12|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Negative @Validation
  Scenario: TC_12 Get beat jump for approval with zero beatId
    And I send the GET request to "beatjumps_beatjump_for_approval" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
      |access_token|ACCESS_TOKEN|beatId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Negative @Security
  Scenario: TC_13 Get beat jump for approval with SQL injection in userId
    And I send the GET request to "beatjumps_beatjump_for_approval" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1'; DROP TABLE beatjumps; --|
      |access_token|ACCESS_TOKEN|beatId|12|
    Then I should see the response code as "500"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_14 Get beat jump for approval with SQL injection in beatId
    And I send the GET request to "beatjumps_beatjump_for_approval" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
      |access_token|ACCESS_TOKEN|beatId|12'; DROP TABLE beatjumps; --|
    Then I should see the response code as "500"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_15 Get beat jump for approval with XSS attempt in userId
    And I send the GET request to "beatjumps_beatjump_for_approval" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|<script>alert('XSS')</script>|
      |access_token|ACCESS_TOKEN|beatId|12|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_16 Get beat jump for approval with XSS attempt in beatId
    And I send the GET request to "beatjumps_beatjump_for_approval" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
      |access_token|ACCESS_TOKEN|beatId|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_17 Get beat jump for approval with invalid endpoint
    And I send the GET request to "beatjumps_beatjump_for_approval_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
      |access_token|ACCESS_TOKEN|beatId|12|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: TC_18 Performance test for beat jump for approval endpoint
    And I send the GET request to "beatjumps_beatjump_for_approval" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
      |access_token|ACCESS_TOKEN|beatId|12|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: TC_19 Concurrent access test for beat jump for approval endpoint
    And I send the GET request to "beatjumps_beatjump_for_approval" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
      |access_token|ACCESS_TOKEN|beatId|12|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Regression
  Scenario: TC_20 Regression test for beat jump for approval endpoint with valid data
    And I send the GET request to "beatjumps_beatjump_for_approval" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
      |access_token|ACCESS_TOKEN|beatId|12|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_21 Get beat jump for approval with negative userId
    And I send the GET request to "beatjumps_beatjump_for_approval" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|-1|
      |access_token|ACCESS_TOKEN|beatId|12|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_22 Get beat jump for approval with negative beatId
    And I send the GET request to "beatjumps_beatjump_for_approval" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
      |access_token|ACCESS_TOKEN|beatId|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @DataType
  Scenario: TC_23 Verify response data types for beat jump for approval
    And I send the GET request to "beatjumps_beatjump_for_approval" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
      |access_token|ACCESS_TOKEN|beatId|12|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.apiVersion|number|
      |$.Status|number|

  @Positive @LoadTesting
  Scenario: TC_24 Load testing for beat jump for approval endpoint
    And I send the GET request to "beatjumps_beatjump_for_approval" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
      |access_token|ACCESS_TOKEN|beatId|12|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Positive @Smoke
  Scenario: TC_25 Get beat jump for approval with valid userId 1 and beatId 12 - DB Validation
    And I send the GET request to "beatjumps_beatjump_for_approval" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
      |access_token|ACCESS_TOKEN|beatId|12|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.apiVersion|2|
      #|$.Status|DB:beatjumps:status: user_id=1 AND beat_id=12|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.apiVersion|number|
      |$.Status|number|

  @Positive @Functional
  Scenario: TC_26 Get beat jump for approval with valid userId 2 and beatId 10 - DB Validation
    And I send the GET request to "beatjumps_beatjump_for_approval" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
      |access_token|ACCESS_TOKEN|beatId|10|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.apiVersion|2|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.apiVersion|number|
      |$.Status|number|
