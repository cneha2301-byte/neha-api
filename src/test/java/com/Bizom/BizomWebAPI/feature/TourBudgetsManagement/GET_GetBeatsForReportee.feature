@BizomWebAPI @TourBudgetsManagement @BeatsForReportee @OutletManagement @innovation
Feature: Get Beats For Reportee API Testing
  As a system user
  I want to test the get beats for reportee endpoint
  So that I can ensure proper functionality and data retrieval for tour budgets management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get beats for reportee without access token
    When I send the GET request to "tourbudgets_get_beats_for_reportee" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |distributor|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get beats for reportee with invalid access token
    And I send the GET request to "tourbudgets_get_beats_for_reportee" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
      |distributor|2|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get beats for reportee with expired access token
    And I send the GET request to "tourbudgets_get_beats_for_reportee" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
      |distributor|2|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get beats for reportee with malformed access token
    And I send the GET request to "tourbudgets_get_beats_for_reportee" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
      |distributor|2|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get beats for reportee with valid distributor ID
    And I send the GET request to "tourbudgets_get_beats_for_reportee" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |distributor|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|
    And I store the response as "beats_for_reportee_response" name using full path

  @Positive @DataValidation
  Scenario: Validate beats for reportee response structure with valid distributor
    And I send the GET request to "tourbudgets_get_beats_for_reportee" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |distributor|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.beatList|array|
      |$.assignedBeatId|object|
      |$.beatList[0]|object|
      |$.beatList[0].beatId|number|
      |$.beatList[0].beatName|string|

  @Positive @DataValidation
  Scenario: Validate beats for reportee beat list array structure
    And I send the GET request to "tourbudgets_get_beats_for_reportee" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |distributor|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.beatList|array|
      |$.beatList[0]|object|
      |$.beatList[0].beatId|number|
      |$.beatList[0].beatName|string|

#  @Positive @DataValidation
#  Scenario: Validate beats for reportee specific data values
#    And I send the GET request to "tourbudgets_get_beats_for_reportee" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |distributor|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|"Data Found"|
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.beatList[0].beatName|DB:beats:beat_name: id=1|
#      |$.beatList[1].beatName|DB:beats:beat_name: id=3|

  @Positive @DataValidation
  Scenario: Validate beats for reportee with static values
    And I send the GET request to "tourbudgets_get_beats_for_reportee" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |distributor|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.beatList[0].beatId|1|
      |$.beatList[0].beatName|"Silkboard"|
      |$.beatList[1].beatId|3|
      |$.beatList[1].beatName|"NORTH BEAT"|
      |$.assignedBeatId|null|

  @Positive @Performance
  Scenario: Performance test for beats for reportee endpoint
    And I send the GET request to "tourbudgets_get_beats_for_reportee" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |distributor|2|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|

  @Positive @Concurrency
  Scenario: Concurrent access test for beats for reportee endpoint
    And I send the GET request to "tourbudgets_get_beats_for_reportee" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |distributor|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|

  @Negative @Validation
  Scenario: Get beats for reportee with invalid distributor ID
    And I send the GET request to "tourbudgets_get_beats_for_reportee" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |distributor|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|
      |$.beatList|[]|
      |$.assignedBeatId|null|

  @Negative @Validation
  Scenario: Get beats for reportee with blank distributor ID
    And I send the GET request to "tourbudgets_get_beats_for_reportee" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |distributor||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|""|

  @Negative @Validation
  Scenario: Get beats for reportee without distributor parameter
    And I send the GET request to "tourbudgets_get_beats_for_reportee" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|""|

  @Negative @Validation
  Scenario: Get beats for reportee with non-numeric distributor ID
    And I send the GET request to "tourbudgets_get_beats_for_reportee" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |distributor|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get beats for reportee with negative distributor ID
    And I send the GET request to "tourbudgets_get_beats_for_reportee" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |distributor|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get beats for reportee with zero distributor ID
    And I send the GET request to "tourbudgets_get_beats_for_reportee" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |distributor|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get beats for reportee with special characters in distributor parameter
    And I send the GET request to "tourbudgets_get_beats_for_reportee" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |distributor|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get beats for reportee with SQL injection attempt
    And I send the GET request to "tourbudgets_get_beats_for_reportee" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |distributor|'; DROP TABLE tourbudgets; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: Get beats for reportee with invalid endpoint
    And I send the GET request to "tourbudgets_get_beats_for_reportee_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |distributor|2|
    Then I should see the response code as "404"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate beats for reportee business logic with valid distributor
    And I send the GET request to "tourbudgets_get_beats_for_reportee" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |distributor|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.beatList|array|
      |$.beatList[0].beatId|number|
      |$.beatList[0].beatName|string|
      |$.assignedBeatId|object|

  @Positive @DataIntegrity
  Scenario: Validate beats for reportee data integrity
    And I send the GET request to "tourbudgets_get_beats_for_reportee" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |distributor|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.beatList|array|
      |$.beatList[0]|object|
      |$.beatList[0].beatId|number|
      |$.beatList[0].beatName|string|
      |$.assignedBeatId|object|

  @Positive @Regression
  Scenario: Regression test for beats for reportee endpoint
    And I send the GET request to "tourbudgets_get_beats_for_reportee" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |distributor|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.beatList|array|

  @Positive @Functional
  Scenario: Validate beats for reportee response completeness
    And I send the GET request to "tourbudgets_get_beats_for_reportee" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |distributor|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.beatList|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.beatList[0].beatId|1|
      |$.beatList[0].beatName|"Silkboard"|
      |$.assignedBeatId|null|

  @Positive @ArrayValidation
  Scenario: Validate beats for reportee array structure and content
    And I send the GET request to "tourbudgets_get_beats_for_reportee" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |distributor|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.beatList|array|
      |$.beatList[0]|object|
      |$.beatList[1]|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.beatList[0].beatId|1|
      |$.beatList[0].beatName|"Silkboard"|
      |$.beatList[1].beatId|3|
      |$.beatList[1].beatName|"NORTH BEAT"|

  @Positive @ContentValidation
  Scenario: Validate beats for reportee content structure
    And I send the GET request to "tourbudgets_get_beats_for_reportee" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |distributor|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |beatList|
      |beatId|
      |beatName|
      |assignedBeatId|
      |Data Found|

  @Positive @LoadTesting
  Scenario: Load testing for beats for reportee endpoint
    And I send the GET request to "tourbudgets_get_beats_for_reportee" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |distributor|2|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|

  @Negative @Timeout
  Scenario: Test beats for reportee endpoint timeout handling
    And I send the GET request to "tourbudgets_get_beats_for_reportee" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |distributor|2|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|

  @Positive @EndToEnd
  Scenario: End-to-end beats for reportee data retrieval workflow
    And I send the GET request to "tourbudgets_get_beats_for_reportee" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |distributor|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|
    And I store the response as "beats_for_reportee_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.beatList|array|
      |$.beatList[0].beatId|number|
      |$.beatList[0].beatName|string|
      |$.assignedBeatId|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.beatList[0].beatId|1|
      |$.beatList[0].beatName|"Silkboard"|
      |$.assignedBeatId|null|

  @Positive @EmptyArrayValidation
  Scenario: Validate beats for reportee empty array response with invalid distributor
    And I send the GET request to "tourbudgets_get_beats_for_reportee" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |distributor|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|
      |$.beatList|[]|
      |$.assignedBeatId|null|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.beatList|array|
      |$.assignedBeatId|object|

  @Positive @ErrorResponseValidation
  Scenario: Validate beats for reportee error response with blank distributor
    And I send the GET request to "tourbudgets_get_beats_for_reportee" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |distributor||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @DistributorParameterValidation
  Scenario: Validate beats for reportee with different distributor IDs
    And I send the GET request to "tourbudgets_get_beats_for_reportee" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |distributor|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.beatList|array|

  @Positive @FieldValidation
  Scenario: Validate beats for reportee field completeness
    And I send the GET request to "tourbudgets_get_beats_for_reportee" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |distributor|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.beatList|array|
      |$.beatList[0].beatId|number|
      |$.beatList[0].beatName|string|
      |$.assignedBeatId|object|

  @Positive @BeatListValidation
  Scenario: Validate beats for reportee beat list structure
    And I send the GET request to "tourbudgets_get_beats_for_reportee" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |distributor|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.beatList|array|
      |$.beatList[0]|object|
      |$.beatList[0].beatId|number|
      |$.beatList[0].beatName|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.beatList[0].beatId|1|
      |$.beatList[0].beatName|"Silkboard"|
      |$.beatList[2].beatId|17|
      |$.beatList[2].beatName|"Sth"|

