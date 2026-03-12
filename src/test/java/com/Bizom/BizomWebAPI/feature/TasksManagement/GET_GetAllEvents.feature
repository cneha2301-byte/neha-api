@BizomWebAPI @TasksManagement @GetAllEvents @OutletManagement @innovation
Feature: Get All Events API Testing
  As a system user
  I want to test the get all events endpoint
  So that I can ensure proper functionality and data retrieval for all events

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get all events without access token
    When I send the GET request to "tasks_get_all_events" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get all events with invalid access token
    And I send the GET request to "tasks_get_all_events" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get all events with expired access token
    And I send the GET request to "tasks_get_all_events" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get all events with malformed access token
    And I send the GET request to "tasks_get_all_events" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get all events with valid access token
    And I send the GET request to "tasks_get_all_events" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
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
      |$.customtags|array|
    And I store the response as "all_events_response" name using full path

  @Positive @DataValidation
  Scenario: Validate all events response structure
    And I send the GET request to "tasks_get_all_events" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
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
      |$.customtags|array|
      |$.customtags[0]|object|
      |$.customtags[0].Tag|object|

  @Positive @CustomTagsValidation
  Scenario: Validate all events customtags array structure
    And I send the GET request to "tasks_get_all_events" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.customtags|array|
      |$.customtags[0]|object|
      |$.customtags[0].Tag|object|
      |$.customtags[0].Tag.id|string|
      |$.customtags[0].Tag.name|string|
      |$.customtags[0].Tag.imageurl|string|
      |$.customtags[0].Tag.source|string|
      |$.customtags[0].Tag.parent_id|number|
      |$.customtags[0].Tag.value|string|
      |$.customtags[0].Tag.label|string|

  @Positive @TagObjectValidation
  Scenario: Validate all events Tag object structure
    And I send the GET request to "tasks_get_all_events" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.customtags[0].Tag|object|
      |$.customtags[0].Tag.id|string|
      |$.customtags[0].Tag.name|string|
      |$.customtags[0].Tag.imageurl|string|
      |$.customtags[0].Tag.source|string|
      |$.customtags[0].Tag.parent_id|number|
      |$.customtags[0].Tag.value|string|
      |$.customtags[0].Tag.label|string|

  @Positive @Performance
  Scenario: Performance test for all events endpoint
    And I send the GET request to "tasks_get_all_events" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.customtags|array|

  @Positive @Concurrency
  Scenario: Concurrent access test for all events endpoint
    And I send the GET request to "tasks_get_all_events" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.customtags|array|

  @Negative @Validation
  Scenario: Get all events with invalid query parameters
    And I send the GET request to "tasks_get_all_events" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.customtags|array|

  @Negative @Validation
  Scenario: Get all events with special characters in query parameters
    And I send the GET request to "tasks_get_all_events" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.customtags|array|

  @Negative @Security
  Scenario: Get all events with SQL injection attempt
    And I send the GET request to "tasks_get_all_events" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE tasks; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.customtags|array|

  @Negative @ErrorHandling
  Scenario: Get all events with invalid endpoint
    And I send the GET request to "tasks_get_all_events_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "404"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate all events business logic
    And I send the GET request to "tasks_get_all_events" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
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
      |$.customtags|array|

  @Positive @DataIntegrity
  Scenario: Validate all events data integrity
    And I send the GET request to "tasks_get_all_events" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.customtags|array|
      |$.customtags[0].Tag|object|
      |$.customtags[0].Tag.id|string|
      |$.customtags[0].Tag.name|string|
      |$.customtags[0].Tag.source|string|
      |$.customtags[0].Tag.label|string|

  @Positive @Regression
  Scenario: Regression test for all events endpoint
    And I send the GET request to "tasks_get_all_events" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.customtags|array|

  @Positive @Functional
  Scenario: Validate all events response completeness
    And I send the GET request to "tasks_get_all_events" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
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
      |$.customtags|array|
      |$.customtags[0].Tag|object|

  @Positive @ArrayValidation
  Scenario: Validate all events customtags array structure and content
    And I send the GET request to "tasks_get_all_events" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.customtags|array|
      |$.customtags[0]|object|
      |$.customtags[0].Tag|object|
      |$.customtags[1]|object|
      |$.customtags[1].Tag|object|

  @Positive @NestedObjectValidation
  Scenario: Validate all events nested Tag object structure
    And I send the GET request to "tasks_get_all_events" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.customtags[0].Tag.id|string|
      |$.customtags[0].Tag.name|string|
      |$.customtags[0].Tag.imageurl|string|
      |$.customtags[0].Tag.source|string|
      |$.customtags[0].Tag.parent_id|number|
      |$.customtags[0].Tag.value|string|
      |$.customtags[0].Tag.label|string|

  @Positive @ContentValidation
  Scenario: Validate all events content structure
    And I send the GET request to "tasks_get_all_events" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |customtags|
      |Tag|
      |id|
      |name|
      |source|
      |label|

  @Positive @LoadTesting
  Scenario: Load testing for all events endpoint
    And I send the GET request to "tasks_get_all_events" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.customtags|array|

  @Negative @Timeout
  Scenario: Test all events endpoint timeout handling
    And I send the GET request to "tasks_get_all_events" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.customtags|array|

  @Positive @EndToEnd
  Scenario: End-to-end all events data retrieval workflow
    And I send the GET request to "tasks_get_all_events" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And I store the response as "all_events_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.customtags|array|
      |$.customtags[0].Tag|object|
      |$.customtags[0].Tag.id|string|
      |$.customtags[0].Tag.name|string|
      |$.customtags[0].Tag.source|string|
      |$.customtags[0].Tag.label|string|

  @Positive @ResultFieldValidation
  Scenario: Validate all events Result field
    And I send the GET request to "tasks_get_all_events" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|

  @Positive @ReasonFieldValidation
  Scenario: Validate all events Reason field
    And I send the GET request to "tasks_get_all_events" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Reason|string|

  @Positive @CustomTagsArrayValidation
  Scenario: Validate all events customtags array with Tag objects
    And I send the GET request to "tasks_get_all_events" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.customtags|array|
      |$.customtags[0]|object|
      |$.customtags[0].Tag|object|
      |$.customtags[0].Tag.id|string|
      |$.customtags[0].Tag.name|string|
      |$.customtags[0].Tag.imageurl|string|
      |$.customtags[0].Tag.source|string|
      |$.customtags[0].Tag.parent_id|number|
      |$.customtags[0].Tag.value|string|
      |$.customtags[0].Tag.label|string|


