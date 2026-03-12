@BizomWebAPI @PI @SchemesManagement @GetApprovalSequence @PaymentProcessing
Feature: Get Approval Sequence API Testing
  As a system user
  I want to test the get approval sequence endpoint
  So that I can ensure proper functionality and data retrieval for approval sequences

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get approval sequence without access token
    When I send the GET request to "schemes_getapprovalsequence" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get approval sequence with invalid access token
    And I send the GET request to "schemes_getapprovalsequence" endpoint with dynamic access token and query parameters
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
  Scenario: TC_03 Get approval sequence with expired access token
    And I send the GET request to "schemes_getapprovalsequence" endpoint with dynamic access token and query parameters
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
  Scenario: TC_04 Get approval sequence with malformed access token
    And I send the GET request to "schemes_getapprovalsequence" endpoint with dynamic access token and query parameters
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
  Scenario: TC_05 Get approval sequence with valid access token
    And I send the GET request to "schemes_getapprovalsequence" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
    And I store the response as "approval_sequence_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate approval sequence response structure
    And I send the GET request to "schemes_getapprovalsequence" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate approval sequence array can be empty
    And I send the GET request to "schemes_getapprovalsequence" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$|[]|

  @Positive @DataValidation
  Scenario: TC_08 Validate approval sequence array structure when populated
    And I send the GET request to "schemes_getapprovalsequence" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Positive @Performance
  Scenario: TC_09 Performance test for approval sequence endpoint
    And I send the GET request to "schemes_getapprovalsequence" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for approval sequence endpoint
    And I send the GET request to "schemes_getapprovalsequence" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Negative @Validation
  Scenario: TC_11 Get approval sequence with invalid query parameters
    And I send the GET request to "schemes_getapprovalsequence" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Negative @ErrorHandling
  Scenario: TC_12 Get approval sequence with invalid endpoint
    And I send the GET request to "schemes_getapprovalsequence_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_13 Validate approval sequence business logic
    And I send the GET request to "schemes_getapprovalsequence" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Positive @DataIntegrity
  Scenario: TC_14 Validate approval sequence data integrity
    And I send the GET request to "schemes_getapprovalsequence" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$|[]|

  @Positive @Regression
  Scenario: TC_15 Regression test for approval sequence endpoint
    And I send the GET request to "schemes_getapprovalsequence" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Positive @Functional
  Scenario: TC_16 Validate approval sequence response completeness
    And I send the GET request to "schemes_getapprovalsequence" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$|[]|
    And I store the response as "approval_sequence_response" name using full path

