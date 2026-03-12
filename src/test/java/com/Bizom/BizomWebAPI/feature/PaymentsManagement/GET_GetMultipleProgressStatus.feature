@BizomWebAPI @OS @PaymentsManagement @GetMultipleProgressStatus @SalesOperations
Feature: Get Multiple Progress Status API Testing
  As a system user
  I want to test the get multiple progress status endpoint
  So that I can ensure proper functionality and data retrieval for payments management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

#  @Negative @Security
#  Scenario: Get multiple progress status without access token
#    When I send the GET request to "payments_get_multiple_progress_status" endpoint
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get multiple progress status with invalid access token
#    And I send the GET request to "payments_get_multiple_progress_status" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|invalid_token_12345|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get multiple progress status with expired access token
#    And I send the GET request to "payments_get_multiple_progress_status" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|expired_token_12345|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get multiple progress status with malformed access token
#    And I send the GET request to "payments_get_multiple_progress_status" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|malformed.token.here|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get multiple progress status with valid access token
    And I send the GET request to "payments_get_multiple_progress_status" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.inProgress|false|
    And I store the response as "multiple_progress_status_response" name using full path

  @Positive @DataValidation
  Scenario: Validate multiple progress status response structure
    And I send the GET request to "payments_get_multiple_progress_status" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.inProgress|false|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
      |$.inProgress|boolean|

  @Positive @DataValidation
  Scenario: Validate multiple progress status data array structure
    And I send the GET request to "payments_get_multiple_progress_status" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.inProgress|false|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

  @Positive @DataValidation
  Scenario: Validate multiple progress status with static values
    And I send the GET request to "payments_get_multiple_progress_status" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Bill generation\/editing already in progress"|
      |$.data|[]|
      |$.inProgress|false|

  @Positive @Performance
  Scenario: Performance test for multiple progress status endpoint
    And I send the GET request to "payments_get_multiple_progress_status" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
      |$.inProgress|boolean|

  @Positive @Concurrency
  Scenario: Concurrent access test for multiple progress status endpoint
    And I send the GET request to "payments_get_multiple_progress_status" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.inProgress|false|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
      |$.inProgress|boolean|

  @Negative @Validation
  Scenario: Get multiple progress status with invalid query parameters
    And I send the GET request to "payments_get_multiple_progress_status" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
      |$.inProgress|boolean|

  @Negative @Validation
  Scenario: Get multiple progress status with special characters in query parameters
    And I send the GET request to "payments_get_multiple_progress_status" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
      |$.inProgress|boolean|

  @Negative @Security
  Scenario: Get multiple progress status with SQL injection attempt
    And I send the GET request to "payments_get_multiple_progress_status" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE payments; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
      |$.inProgress|boolean|

  @Negative @ErrorHandling
  Scenario: Get multiple progress status with invalid endpoint
    And I send the GET request to "payments_get_multiple_progress_status_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "404"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate multiple progress status business logic
    And I send the GET request to "payments_get_multiple_progress_status" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.inProgress|false|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
      |$.inProgress|boolean|

  @Positive @DataIntegrity
  Scenario: Validate multiple progress status data integrity
    And I send the GET request to "payments_get_multiple_progress_status" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Bill generation\/editing already in progress"|
      |$.data|[]|
      |$.inProgress|false|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
      |$.inProgress|boolean|

  @Positive @Regression
  Scenario: Regression test for multiple progress status endpoint
    And I send the GET request to "payments_get_multiple_progress_status" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
      |$.inProgress|boolean|

  @Positive @Functional
  Scenario: Validate multiple progress status response completeness
    And I send the GET request to "payments_get_multiple_progress_status" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Bill generation\/editing already in progress"|
      |$.data|[]|
      |$.inProgress|false|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
      |$.inProgress|boolean|

  @Positive @ArrayValidation
  Scenario: Validate multiple progress status array structure and content
    And I send the GET request to "payments_get_multiple_progress_status" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.inProgress|false|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data|[]|

  @Positive @ContentValidation
  Scenario: Validate multiple progress status content structure
    And I send the GET request to "payments_get_multiple_progress_status" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.inProgress|false|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |data|
      |inProgress|
      |Bill generation|

  @Positive @LoadTesting
  Scenario: Load testing for multiple progress status endpoint
    And I send the GET request to "payments_get_multiple_progress_status" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
      |$.inProgress|boolean|

  @Negative @Timeout
  Scenario: Test multiple progress status endpoint timeout handling
    And I send the GET request to "payments_get_multiple_progress_status" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
      |$.inProgress|boolean|

  @Positive @EndToEnd
  Scenario: End-to-end multiple progress status data retrieval workflow
    And I send the GET request to "payments_get_multiple_progress_status" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Bill generation\/editing already in progress"|
      |$.data|[]|
      |$.inProgress|false|
    And I store the response as "multiple_progress_status_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
      |$.inProgress|boolean|

  @Positive @EmptyArrayValidation
  Scenario: Validate multiple progress status empty array response
    And I send the GET request to "payments_get_multiple_progress_status" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Bill generation\/editing already in progress"|
      |$.data|[]|
      |$.inProgress|false|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

  @Positive @BooleanFieldValidation
  Scenario: Validate multiple progress status boolean fields
    And I send the GET request to "payments_get_multiple_progress_status" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.inProgress|false|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.inProgress|boolean|

  @Positive @ReasonFieldValidation
  Scenario: Validate multiple progress status reason field
    And I send the GET request to "payments_get_multiple_progress_status" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Reason|"Bill generation\/editing already in progress"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Reason|string|

  @Positive @FieldValidation
  Scenario: Validate multiple progress status field completeness
    And I send the GET request to "payments_get_multiple_progress_status" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Bill generation\/editing already in progress"|
      |$.data|[]|
      |$.inProgress|false|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
      |$.inProgress|boolean|

