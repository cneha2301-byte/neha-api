@BizomWebAPI @OS @PaymentsManagement @GetProgressStatus @SalesOperations
Feature: Get Progress Status API Testing
  As a system user
  I want to test the get progress status endpoint
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
#  Scenario: Get progress status without access token
#    When I send the GET request to "payments_get_progress_status" endpoint with path parameters
#      |Path|Value|
#      |paymentId|23|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get progress status with invalid access token
#    And I send the GET request to "payments_get_progress_status" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|invalid_token_12345|paymentId|23|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get progress status with expired access token
#    And I send the GET request to "payments_get_progress_status" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|expired_token_12345|paymentId|23|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get progress status with malformed access token
#    And I send the GET request to "payments_get_progress_status" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|malformed.token.here|paymentId|23|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds

#  @Positive @Smoke
#  Scenario: Get progress status for payment ID 23 with valid access token
#    And I send the GET request to "payments_get_progress_status" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|paymentId|23|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.inProgress|false|
#    And I store the response as "progress_status_response" name using full path

#  @Positive @Smoke
#  Scenario: Get progress status for payment ID 1 with valid access token
#    And I send the GET request to "payments_get_progress_status" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|paymentId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.inProgress|false|
#    And I store the response as "progress_status_response" name using full path

#  @Positive @DataValidation
#  Scenario: Validate progress status response structure
#    And I send the GET request to "payments_get_progress_status" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|paymentId|23|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.inProgress|false|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.data|array|
#      |$.inProgress|boolean|

#  @Positive @DataValidation
#  Scenario: Validate progress status data array structure
#    And I send the GET request to "payments_get_progress_status" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|paymentId|23|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.inProgress|false|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.data|array|

#  @Positive @DataValidation
#  Scenario: Validate progress status with static values
#    And I send the GET request to "payments_get_progress_status" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|paymentId|23|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data|[]|
#      |$.inProgress|false|

  @Negative @Validation
  Scenario: Get progress status with invalid payment ID
    And I send the GET request to "payments_get_progress_status" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|paymentId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
      |$.inProgress|boolean|

  @Negative @Validation
  Scenario: Get progress status with non-numeric payment ID
    And I send the GET request to "payments_get_progress_status" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|paymentId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get progress status with negative payment ID
    And I send the GET request to "payments_get_progress_status" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|paymentId|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
      |$.inProgress|boolean|

  @Negative @Validation
  Scenario: Get progress status with zero payment ID
    And I send the GET request to "payments_get_progress_status" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|paymentId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
      |$.inProgress|boolean|

#  @Negative @ErrorHandling
#  Scenario: Get progress status with invalid endpoint
#    And I send the GET request to "payments_get_progress_status_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|paymentId|23|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: Performance test for progress status endpoint
    And I send the GET request to "payments_get_progress_status" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|paymentId|23|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

#  @Positive @Concurrency
#  Scenario: Concurrent access test for progress status endpoint
#    And I send the GET request to "payments_get_progress_status" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|paymentId|23|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.inProgress|false|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.data|array|
#      |$.inProgress|boolean|

#  @Positive @BusinessLogic
#  Scenario: Validate progress status business logic
#    And I send the GET request to "payments_get_progress_status" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|paymentId|23|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.inProgress|false|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.data|array|
#      |$.inProgress|boolean|

#  @Positive @DataIntegrity
#  Scenario: Validate progress status data integrity
#    And I send the GET request to "payments_get_progress_status" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|paymentId|23|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.inProgress|false|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.data|array|
#      |$.inProgress|boolean|

#  @Positive @Regression
#  Scenario: Regression test for progress status endpoint
#    And I send the GET request to "payments_get_progress_status" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|paymentId|23|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.data|array|
#      |$.inProgress|boolean|

#  @Positive @Functional
#  Scenario: Validate progress status response completeness
#    And I send the GET request to "payments_get_progress_status" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|paymentId|23|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.inProgress|false|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.data|array|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.data|[]|

#  @Positive @ArrayValidation
#  Scenario: Validate progress status array structure and content
#    And I send the GET request to "payments_get_progress_status" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|paymentId|23|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.inProgress|false|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.data|array|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.data|[]|

#  @Positive @ContentValidation
#  Scenario: Validate progress status content structure
#    And I send the GET request to "payments_get_progress_status" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|paymentId|23|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.inProgress|false|
#    And validating the response contains the following values
#      |Value|
#      |Result|
#      |Reason|
#      |data|
#      |inProgress|

#  @Positive @LoadTesting
#  Scenario: Load testing for progress status endpoint
#    And I send the GET request to "payments_get_progress_status" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|paymentId|23|
#    Then I should see the response code as "200"
#    And verify response time is less than "3000" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.data|array|
#      |$.inProgress|boolean|

#  @Negative @Timeout
#  Scenario: Test progress status endpoint timeout handling
#    And I send the GET request to "payments_get_progress_status" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|paymentId|23|
#    Then I should see the response code as "200"
#    And verify response time is less than "5000" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.data|array|
#      |$.inProgress|boolean|

#  @Positive @EndToEnd
#  Scenario: End-to-end progress status data retrieval workflow
#    And I send the GET request to "payments_get_progress_status" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|paymentId|23|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.inProgress|false|
#    And I store the response as "progress_status_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.data|array|
#      |$.inProgress|boolean|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.data|[]|

#  @Positive @EmptyArrayValidation
#  Scenario: Validate progress status empty array response
#    And I send the GET request to "payments_get_progress_status" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|paymentId|23|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data|[]|
#      |$.inProgress|false|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.data|array|

#  @Positive @PaymentIdParameterValidation
#  Scenario: Validate progress status with different payment IDs
#    And I send the GET request to "payments_get_progress_status" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|paymentId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.data|array|
#      |$.inProgress|boolean|

#  @Positive @BooleanFieldValidation
#  Scenario: Validate progress status boolean fields
#    And I send the GET request to "payments_get_progress_status" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|paymentId|23|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.inProgress|false|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.inProgress|boolean|

#  @Positive @FieldValidation
#  Scenario: Validate progress status field completeness
#    And I send the GET request to "payments_get_progress_status" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|paymentId|23|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data|[]|
#      |$.inProgress|false|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.data|array|
#      |$.inProgress|boolean|

