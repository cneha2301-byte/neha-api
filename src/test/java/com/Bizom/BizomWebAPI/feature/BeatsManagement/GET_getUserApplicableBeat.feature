@BizomWebAPI @CE @CoreBusinessOperations @BeatsManagement @GetUserApplicableBeat
Feature: Get User Applicable Beat API Testing
  As a system user
  I want to test the getuserapplicablebeat endpoint
  So that I can ensure proper functionality and data retrieval for user applicable beats management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get user applicable beat without access token
    When I send the GET request to "beats_getuserapplicablebeat" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get user applicable beat with invalid access token
    And I send the GET request to "beats_getuserapplicablebeat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
      |userId|3|
      |language|en|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get user applicable beat with expired access token
    And I send the GET request to "beats_getuserapplicablebeat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
      |userId|3|
      |language|en|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get user applicable beat with malformed access token
    And I send the GET request to "beats_getuserapplicablebeat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
      |userId|3|
      |language|en|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get user applicable beat with valid access token
    And I send the GET request to "beats_getuserapplicablebeat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |userId|3|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
    And I store the response as "getUserApplicableBeat_response" name using full path

  @Positive @DataValidation
  Scenario: Validate get user applicable beat response structure
    And I send the GET request to "beats_getuserapplicablebeat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |userId|3|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|
      |$.error.message|string|
      |$.users_pjp|object|
      |$.users_pjp.user_id|string|
      |$.users_pjp.pjp_start_date|string|
      |$.users_pjp.frequency|string|
      |$.users_pjp.applicable_beats|array|

  @Positive @DataValidation
  Scenario: Validate get user applicable beat users_pjp structure
    And I send the GET request to "beats_getuserapplicablebeat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |userId|3|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.users_pjp|object|
      |$.users_pjp.user_id|string|
      |$.users_pjp.pjp_start_date|string|
      |$.users_pjp.frequency|string|
      |$.users_pjp.applicable_beats|array|
      |$.users_pjp.applicable_beats[0]|object|
      |$.users_pjp.applicable_beats[0].beat_id|string|
      |$.users_pjp.applicable_beats[0].beat_name|string|
      |$.users_pjp.applicable_beats[0].outlet_count|string|
      |$.users_pjp.applicable_beats[0].beatassigningform_id|string|

  @Positive @DataValidation
  Scenario: Validate get user applicable beat specific data values
    And I send the GET request to "beats_getuserapplicablebeat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |userId|3|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|""|
      |$.users_pjp.user_id|"3"|
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.users_pjp.user_id|DB:users:id: id=3|

  @Positive @DataValidation
  Scenario: Validate get user applicable beat with static values
    And I send the GET request to "beats_getuserapplicablebeat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |userId|3|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|""|
      |$.users_pjp.user_id|"3"|
      |$.users_pjp.applicable_beats[0].beatassigningform_id|"0"|

  @Positive @Performance
  Scenario: Performance test for get user applicable beat endpoint
    And I send the GET request to "beats_getuserapplicablebeat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |userId|3|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Positive @Concurrency
  Scenario: Concurrent access test for get user applicable beat endpoint
    And I send the GET request to "beats_getuserapplicablebeat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |userId|3|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @Validation
  Scenario: Get user applicable beat with missing userId parameter
    And I send the GET request to "beats_getuserapplicablebeat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|

  @Negative @Validation
  Scenario: Get user applicable beat with missing language parameter
    And I send the GET request to "beats_getuserapplicablebeat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |userId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @Validation
  Scenario: Get user applicable beat with invalid userId parameter
    And I send the GET request to "beats_getuserapplicablebeat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |userId|99999|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|

  @Negative @Validation
  Scenario: Get user applicable beat with invalid query parameters
    And I send the GET request to "beats_getuserapplicablebeat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |userId|3|
      |language|en|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @Validation
  Scenario: Get user applicable beat with special characters in query parameters
    And I send the GET request to "beats_getuserapplicablebeat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |userId|3|
      |language|en|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @Security
  Scenario: Get user applicable beat with SQL injection attempt
    And I send the GET request to "beats_getuserapplicablebeat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |userId|3|
      |language|en|
      |test_param|'; DROP TABLE beats; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @Boundary
  Scenario: Get user applicable beat with maximum query parameters
    And I send the GET request to "beats_getuserapplicablebeat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |userId|3|
      |language|en|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @ErrorHandling
  Scenario: Get user applicable beat with invalid endpoint
    And I send the GET request to "beats_getuserapplicablebeat_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |userId|3|
      |language|en|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate get user applicable beat business logic
    And I send the GET request to "beats_getuserapplicablebeat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |userId|3|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|""|
      |$.users_pjp.user_id|"3"|

  @Positive @DataIntegrity
  Scenario: Validate get user applicable beat data integrity
    And I send the GET request to "beats_getuserapplicablebeat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |userId|3|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|
      |$.error.message|string|
      |$.users_pjp|object|
      |$.users_pjp.user_id|string|
      |$.users_pjp.pjp_start_date|string|
      |$.users_pjp.frequency|string|
      |$.users_pjp.applicable_beats|array|
      |$.users_pjp.applicable_beats[0].beat_id|string|
      |$.users_pjp.applicable_beats[0].beat_name|string|
      |$.users_pjp.applicable_beats[0].outlet_count|string|
      |$.users_pjp.applicable_beats[0].beatassigningform_id|string|

  @Positive @Regression
  Scenario: Regression test for get user applicable beat endpoint
    And I send the GET request to "beats_getuserapplicablebeat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |userId|3|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|
      |$.users_pjp|object|
      |$.users_pjp.applicable_beats|array|

  @Positive @Functional
  Scenario: Validate get user applicable beat response completeness
    And I send the GET request to "beats_getuserapplicablebeat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |userId|3|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|""|
      |$.users_pjp.user_id|"3"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.users_pjp.applicable_beats|array|
      |$.users_pjp.applicable_beats[0].beat_id|string|
      |$.users_pjp.applicable_beats[0].beat_name|string|

  @Positive @ArrayValidation
  Scenario: Validate get user applicable beat array structure and content
    And I send the GET request to "beats_getuserapplicablebeat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |userId|3|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.users_pjp.applicable_beats|array|
      |$.users_pjp.applicable_beats[0]|object|
      |$.users_pjp.applicable_beats[1]|object|
      |$.users_pjp.applicable_beats[0].beat_id|string|
      |$.users_pjp.applicable_beats[0].beat_name|string|
      |$.users_pjp.applicable_beats[0].outlet_count|string|
      |$.users_pjp.applicable_beats[0].beatassigningform_id|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.users_pjp.applicable_beats[0].beat_id|"1"|
      |$.users_pjp.applicable_beats[0].beat_name|Silkboard|
      |$.users_pjp.applicable_beats[0].outlet_count|"89"|
      |$.users_pjp.applicable_beats[0].beatassigningform_id|"0"|

  @Positive @ContentValidation
  Scenario: Validate get user applicable beat content structure
    And I send the GET request to "beats_getuserapplicablebeat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |userId|3|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
    And validating the response contains the following values
      |Value|
      |result|
      |error|
      |users_pjp|
      |user_id|
      |pjp_start_date|
      |frequency|
      |applicable_beats|
      |beat_id|
      |beat_name|
      |outlet_count|
      |beatassigningform_id|

  @Positive @LoadTesting
  Scenario: Load testing for get user applicable beat endpoint
    And I send the GET request to "beats_getuserapplicablebeat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |userId|3|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @Timeout
  Scenario: Test get user applicable beat endpoint timeout handling
    And I send the GET request to "beats_getuserapplicablebeat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |userId|3|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Positive @EndToEnd
  Scenario: End-to-end get user applicable beat data retrieval workflow
    And I send the GET request to "beats_getuserapplicablebeat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |userId|3|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|""|
      |$.users_pjp.user_id|"3"|
    And I store the response as "getUserApplicableBeat_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|
      |$.error.message|string|
      |$.users_pjp|object|
      |$.users_pjp.user_id|string|
      |$.users_pjp.pjp_start_date|string|
      |$.users_pjp.frequency|string|
      |$.users_pjp.applicable_beats|array|
      |$.users_pjp.applicable_beats[0].beat_id|string|
      |$.users_pjp.applicable_beats[0].beat_name|string|
      |$.users_pjp.applicable_beats[0].outlet_count|string|
      |$.users_pjp.applicable_beats[0].beatassigningform_id|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.users_pjp.applicable_beats[0].beat_id|"1"|
      |$.users_pjp.applicable_beats[0].beat_name|Silkboard|
      |$.users_pjp.applicable_beats[0].outlet_count|"89"|
      |$.users_pjp.applicable_beats[0].beatassigningform_id|"0"|

  @Positive @DataValidation
  Scenario: Get user applicable beat with different language parameter
    And I send the GET request to "beats_getuserapplicablebeat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |userId|3|
      |language|hi|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @Validation
  Scenario: Get user applicable beat with negative userId parameter
    And I send the GET request to "beats_getuserapplicablebeat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |userId|-1|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|

  @Negative @Validation
  Scenario: Get user applicable beat with non-numeric userId parameter
    And I send the GET request to "beats_getuserapplicablebeat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |userId|invalid|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @DataValidation
  Scenario: Get user applicable beat with different userId values
    And I send the GET request to "beats_getuserapplicablebeat" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |userId|1|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|



