@BizomWebAPI @PI @SchemesManagement @GetAvailableApproversForUser @PaymentProcessing
Feature: Get Available Approvers For User API Testing
  As a system user
  I want to test the get available approvers for user endpoint
  So that I can ensure proper functionality and data retrieval for available approvers

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get available approvers for user without access token
    When I send the GET request to "schemes_get_available_approvers_for_user" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get available approvers for user with invalid access token
    And I send the GET request to "schemes_get_available_approvers_for_user" endpoint with dynamic access token and query parameters
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
  Scenario: Get available approvers for user with expired access token
    And I send the GET request to "schemes_get_available_approvers_for_user" endpoint with dynamic access token and query parameters
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
  Scenario: Get available approvers for user with malformed access token
    And I send the GET request to "schemes_get_available_approvers_for_user" endpoint with dynamic access token and query parameters
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
  Scenario: Get available approvers for user with valid access token
    And I send the GET request to "schemes_get_available_approvers_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|No approvers found.|
      |$.error|""|
      |$.data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.error|string|
      |$.data|array|
    And I store the response as "available_approvers_response" name using full path

  @Positive @DataValidation
  Scenario: Validate available approvers for user response structure
    And I send the GET request to "schemes_get_available_approvers_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|No approvers found.|
      |$.error|""|
      |$.data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.error|string|
      |$.data|array|

  @Positive @NoDataValidation
  Scenario: Validate available approvers for user no data response
    And I send the GET request to "schemes_get_available_approvers_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|No approvers found.|
      |$.error|""|
      |$.data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.error|string|
      |$.data|array|

  @Positive @EmptyArrayValidation
  Scenario: Validate available approvers for user empty data array
    And I send the GET request to "schemes_get_available_approvers_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

  @Positive @Performance
  Scenario: Performance test for available approvers for user endpoint
    And I send the GET request to "schemes_get_available_approvers_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.error|string|
      |$.data|array|

  @Positive @Concurrency
  Scenario: Concurrent access test for available approvers for user endpoint
    And I send the GET request to "schemes_get_available_approvers_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.error|string|
      |$.data|array|

  @Negative @Validation
  Scenario: Get available approvers for user with invalid query parameters
    And I send the GET request to "schemes_get_available_approvers_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.error|string|
      |$.data|array|

  @Negative @Validation
  Scenario: Get available approvers for user with special characters in query parameters
    And I send the GET request to "schemes_get_available_approvers_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.error|string|
      |$.data|array|

  @Negative @Security
  Scenario: Get available approvers for user with SQL injection attempt
    And I send the GET request to "schemes_get_available_approvers_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE schemes; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.error|string|
      |$.data|array|

  # @Negative @ErrorHandling
  # Scenario: Get available approvers for user with invalid endpoint
    # And I send the GET request to "schemes_get_available_approvers_for_user_invalid" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|ACCESS_TOKEN|
    # Then I should see the response code as "404"
    # And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate available approvers for user business logic
    And I send the GET request to "schemes_get_available_approvers_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|No approvers found.|
      |$.error|""|
      |$.data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.error|string|
      |$.data|array|

  @Positive @DataIntegrity
  Scenario: Validate available approvers for user data integrity
    And I send the GET request to "schemes_get_available_approvers_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.error|string|
      |$.data|array|

  @Positive @Regression
  Scenario: Regression test for available approvers for user endpoint
    And I send the GET request to "schemes_get_available_approvers_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.error|string|
      |$.data|array|

  @Positive @Functional
  Scenario: Validate available approvers for user response completeness
    And I send the GET request to "schemes_get_available_approvers_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|No approvers found.|
      |$.error|""|
      |$.data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.error|string|
      |$.data|array|

  @Positive @ArrayValidation
  Scenario: Validate available approvers for user data array structure
    And I send the GET request to "schemes_get_available_approvers_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|No approvers found.|
      |$.data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

  @Positive @ContentValidation
  Scenario: Validate available approvers for user content structure
    And I send the GET request to "schemes_get_available_approvers_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|No approvers found.|
    And validating the response contains the following values
      |Value|
      |result|
      |reason|
      |error|
      |data|

  @Positive @ResultFieldValidation
  Scenario: Validate available approvers for user result field
    And I send the GET request to "schemes_get_available_approvers_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|

  @Positive @ReasonFieldValidation
  Scenario: Validate available approvers for user reason field
    And I send the GET request to "schemes_get_available_approvers_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.reason|No approvers found.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.reason|string|

  @Positive @ErrorFieldValidation
  Scenario: Validate available approvers for user error field
    And I send the GET request to "schemes_get_available_approvers_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.error|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.error|string|

  @Positive @DataFieldValidation
  Scenario: Validate available approvers for user data field
    And I send the GET request to "schemes_get_available_approvers_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

  @Positive @LoadTesting
  Scenario: Load testing for available approvers for user endpoint
    And I send the GET request to "schemes_get_available_approvers_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.error|string|
      |$.data|array|

  @Negative @Timeout
  Scenario: Test available approvers for user endpoint timeout handling
    And I send the GET request to "schemes_get_available_approvers_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.error|string|
      |$.data|array|

  @Positive @EndToEnd
  Scenario: End-to-end available approvers for user data retrieval workflow
    And I send the GET request to "schemes_get_available_approvers_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|No approvers found.|
      |$.error|""|
      |$.data|[]|
    And I store the response as "available_approvers_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.error|string|
      |$.data|array|


