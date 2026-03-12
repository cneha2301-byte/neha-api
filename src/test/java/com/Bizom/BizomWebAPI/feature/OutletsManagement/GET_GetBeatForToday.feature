@BizomWebAPI @CE @OutletsManagement @BeatForToday @SystemOperations
Feature: Get Beat For Today API Testing
  As a system user
  I want to test the get beat for today endpoint
  So that I can ensure proper functionality and data retrieval for today's beat information

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get beat for today without access token
    When I send the GET request to "outlets_get_beat_for_today" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get beat for today with invalid access token
    And I send the GET request to "outlets_get_beat_for_today" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get beat for today with expired access token
    And I send the GET request to "outlets_get_beat_for_today" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get beat for today with malformed access token
    And I send the GET request to "outlets_get_beat_for_today" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get beat for today with valid access token - no beats configured
    And I send the GET request to "outlets_get_beat_for_today" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Please set beats for this user first.|
    And I store the response as "beat_for_today_response" name using full path

  @Positive @Smoke
  Scenario: TC_06 Get beat for today with valid access token - beats configured
    And I send the GET request to "outlets_get_beat_for_today" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @DataValidation
  Scenario: TC_07 Validate beat for today response structure
    And I send the GET request to "outlets_get_beat_for_today" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @DataValidation
  Scenario: TC_08 Validate beat for today response with beats data
    And I send the GET request to "outlets_get_beat_for_today" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|

  @Positive @Performance
  Scenario: TC_09 Performance test for beat for today endpoint
    And I send the GET request to "outlets_get_beat_for_today" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for beat for today endpoint
    And I send the GET request to "outlets_get_beat_for_today" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Negative @Validation
  Scenario: TC_11 Get beat for today with invalid query parameters
    And I send the GET request to "outlets_get_beat_for_today" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Negative @Validation
  Scenario: TC_12 Get beat for today with special characters in query parameters
    And I send the GET request to "outlets_get_beat_for_today" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Negative @Security
  Scenario: TC_13 Get beat for today with SQL injection attempt
    And I send the GET request to "outlets_get_beat_for_today" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE beats; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Negative @Boundary
  Scenario: TC_14 Get beat for today with maximum query parameters
    And I send the GET request to "outlets_get_beat_for_today" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Negative @ErrorHandling
  Scenario: TC_15 Get beat for today with invalid endpoint
    And I send the GET request to "outlets_get_beat_for_today_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_16 Validate beat for today business logic - no beats configured
    And I send the GET request to "outlets_get_beat_for_today" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @BusinessLogic
  Scenario: TC_17 Validate beat for today business logic - beats configured
    And I send the GET request to "outlets_get_beat_for_today" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @DataIntegrity
  Scenario: TC_18 Validate beat for today data integrity
    And I send the GET request to "outlets_get_beat_for_today" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @Regression
  Scenario: TC_19 Regression test for beat for today endpoint
    And I send the GET request to "outlets_get_beat_for_today" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @Functional
  Scenario: TC_20 Validate beat for today response completeness
    And I send the GET request to "outlets_get_beat_for_today" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|

  @Positive @ContentValidation
  Scenario: TC_21 Validate beat for today content structure
    And I send the GET request to "outlets_get_beat_for_today" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|

  @Positive @LoadTesting
  Scenario: TC_22 Load testing for beat for today endpoint
    And I send the GET request to "outlets_get_beat_for_today" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Negative @Timeout
  Scenario: TC_23 Test beat for today endpoint timeout handling
    And I send the GET request to "outlets_get_beat_for_today" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @EndToEnd
  Scenario: TC_24 End-to-end beat for today data retrieval workflow
    And I send the GET request to "outlets_get_beat_for_today" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "beat_for_today_e2e_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Negative @BusinessRule
  Scenario: TC_25 Validate error message when beats not configured
    And I send the GET request to "outlets_get_beat_for_today" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Please set beats for this user first.|

  @Positive @ResponseFormat
  Scenario: TC_26 Validate beat for today response format consistency
    And I send the GET request to "outlets_get_beat_for_today" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @StatusCheck
  Scenario: TC_27 Validate beat for today status check
    And I send the GET request to "outlets_get_beat_for_today" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|

  @Positive @Reliability
  Scenario: TC_28 Reliability test for beat for today endpoint
    And I send the GET request to "outlets_get_beat_for_today" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @Idempotency
  Scenario: TC_29 Idempotency test for beat for today endpoint
    And I send the GET request to "outlets_get_beat_for_today" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "beat_first_call" name using full path
    And I send the GET request to "outlets_get_beat_for_today" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @CacheValidation
  Scenario: TC_30 Cache validation for beat for today endpoint
    And I send the GET request to "outlets_get_beat_for_today" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|


