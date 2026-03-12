@BizomWebAPI @TaskLocationsManagement @GetTasklocations @OutletManagement @Innovation
Feature: Get Task Locations API Testing
  As a system user
  I want to test the get task locations endpoint
  So that I can ensure proper functionality and data retrieval for task locations

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get task locations without access token
    When I send the GET request to "tasklocations_get_tasklocations" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get task locations with invalid access token
    And I send the GET request to "tasklocations_get_tasklocations" endpoint with dynamic access token and query parameters
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
  Scenario: Get task locations with expired access token
    And I send the GET request to "tasklocations_get_tasklocations" endpoint with dynamic access token and query parameters
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
  Scenario: Get task locations with malformed access token
    And I send the GET request to "tasklocations_get_tasklocations" endpoint with dynamic access token and query parameters
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
  Scenario: Get task locations with valid access token
    And I send the GET request to "tasklocations_get_tasklocations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No data found.|
    And I store the response as "tasklocations_response" name using full path

  @Positive @DataValidation
  Scenario: Validate task locations response structure
    And I send the GET request to "tasklocations_get_tasklocations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No data found.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Tasklocations|array|

  @Positive @DataValidation
  Scenario: Validate task locations array structure
    And I send the GET request to "tasklocations_get_tasklocations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No data found.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Tasklocations|array|

  @Positive @DataValidation
  Scenario: Validate task locations empty array response
    And I send the GET request to "tasklocations_get_tasklocations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No data found.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Tasklocations|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Tasklocations|[]|

  @Positive @Performance
  Scenario: Performance test for task locations endpoint
    And I send the GET request to "tasklocations_get_tasklocations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No data found.|

  @Positive @Concurrency
  Scenario: Concurrent access test for task locations endpoint
    And I send the GET request to "tasklocations_get_tasklocations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No data found.|

#  @Negative @Validation
#  Scenario: Get task locations with invalid query parameters
#    And I send the GET request to "tasklocations_get_tasklocations" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |invalid_param|invalid_value|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Tasklocations|array|

#  @Negative @Validation
#  Scenario: Get task locations with special characters in query parameters
#    And I send the GET request to "tasklocations_get_tasklocations" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Tasklocations|array|

#  @Negative @Security
#  Scenario: Get task locations with SQL injection attempt
#    And I send the GET request to "tasklocations_get_tasklocations" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|'; DROP TABLE tasklocations; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Tasklocations|array|

#  @Negative @Boundary
#  Scenario: Get task locations with maximum query parameters
#    And I send the GET request to "tasklocations_get_tasklocations" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |param1|value1|
#      |param2|value2|
#      |param3|value3|
#      |param4|value4|
#      |param5|value5|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Tasklocations|array|

  @Negative @ErrorHandling
  Scenario: Get task locations with invalid endpoint
    And I send the GET request to "tasklocations_get_tasklocations_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "404"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate task locations business logic
    And I send the GET request to "tasklocations_get_tasklocations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No data found.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Tasklocations|array|

  @Positive @DataIntegrity
  Scenario: Validate task locations data integrity
    And I send the GET request to "tasklocations_get_tasklocations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No data found.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Tasklocations|array|

  @Positive @Regression
  Scenario: Regression test for task locations endpoint
    And I send the GET request to "tasklocations_get_tasklocations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No data found.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Tasklocations|array|

  @Positive @Functional
  Scenario: Validate task locations response completeness
    And I send the GET request to "tasklocations_get_tasklocations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No data found.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Tasklocations|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Tasklocations|[]|

  @Positive @ArrayValidation
  Scenario: Validate task locations array structure and content
    And I send the GET request to "tasklocations_get_tasklocations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No data found.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Tasklocations|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Tasklocations|[]|

  @Positive @ContentValidation
  Scenario: Validate task locations content structure
    And I send the GET request to "tasklocations_get_tasklocations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No data found.|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Tasklocations|

  @Positive @ResultFieldValidation
  Scenario: Validate task locations result field
    And I send the GET request to "tasklocations_get_tasklocations" endpoint with dynamic access token and query parameters
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

  @Positive @ReasonFieldValidation
  Scenario: Validate task locations reason field
    And I send the GET request to "tasklocations_get_tasklocations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Reason|No data found.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Reason|string|

  @Positive @TasklocationsFieldValidation
  Scenario: Validate task locations Tasklocations field
    And I send the GET request to "tasklocations_get_tasklocations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Tasklocations|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Tasklocations|array|

  @Positive @LoadTesting
  Scenario: Load testing for task locations endpoint
    And I send the GET request to "tasklocations_get_tasklocations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No data found.|

  @Negative @Timeout
  Scenario: Test task locations endpoint timeout handling
    And I send the GET request to "tasklocations_get_tasklocations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No data found.|

  @Positive @EndToEnd
  Scenario: End-to-end task locations data retrieval workflow
    And I send the GET request to "tasklocations_get_tasklocations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No data found.|
    And I store the response as "tasklocations_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Tasklocations|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Tasklocations|[]|


