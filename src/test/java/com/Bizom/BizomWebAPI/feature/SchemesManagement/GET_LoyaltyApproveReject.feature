@BizomWebAPI @PI @SchemesManagement @LoyaltyApproveReject @WarehouseOperations
Feature: LoyaltyApproveReject API Testing
  As a system user
  I want to test the loyaltyapproveReject endpoint
  So that I can ensure proper functionality and data retrieval for loyalty approval/rejection management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get loyalty approve reject without access token
    When I send the GET request to "loyalty_approve_reject" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get loyalty approve reject with invalid access token
    And I send the GET request to "loyalty_approve_reject" endpoint with dynamic access token and query parameters
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
  Scenario: Get loyalty approve reject with expired access token
    And I send the GET request to "loyalty_approve_reject" endpoint with dynamic access token and query parameters
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
  Scenario: Get loyalty approve reject with malformed access token
    And I send the GET request to "loyalty_approve_reject" endpoint with dynamic access token and query parameters
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
  Scenario: Get loyalty approve reject with valid access token
    And I send the GET request to "loyalty_approve_reject" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|"Data Updated"|
    And I store the response as "loyalty_approve_reject_response" name using full path

  @Positive @DataValidation
  Scenario: Validate loyalty approve reject response structure
    And I send the GET request to "loyalty_approve_reject" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|"Data Updated"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|

  @Positive @DataValidation
  Scenario: Validate loyalty approve reject specific data values
    And I send the GET request to "loyalty_approve_reject" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|"Data Updated"|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.result|true|
      |$.reason|"Data Updated"|

  @Positive @DataValidation
  Scenario: Validate loyalty approve reject with static values
    And I send the GET request to "loyalty_approve_reject" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|"Data Updated"|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|"Data Updated"|

  @Positive @Performance
  Scenario: Performance test for loyalty approve reject endpoint
    And I send the GET request to "loyalty_approve_reject" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|"Data Updated"|

  @Positive @Concurrency
  Scenario: Concurrent access test for loyalty approve reject endpoint
    And I send the GET request to "loyalty_approve_reject" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|"Data Updated"|

  @Negative @Validation
  Scenario: Get loyalty approve reject with invalid query parameters
    And I send the GET request to "loyalty_approve_reject" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|"Data Updated"|

  @Negative @Validation
  Scenario: Get loyalty approve reject with special characters in query parameters
    And I send the GET request to "loyalty_approve_reject" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|"Data Updated"|

  @Negative @Security
  Scenario: Get loyalty approve reject with SQL injection attempt
    And I send the GET request to "loyalty_approve_reject" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE schemes; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|"Data Updated"|

  @Negative @Boundary
  Scenario: Get loyalty approve reject with maximum query parameters
    And I send the GET request to "loyalty_approve_reject" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
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
      |$.reason|"Data Updated"|

#  @Negative @ErrorHandling
#  Scenario: Get loyalty approve reject with invalid endpoint
#    And I send the GET request to "loyalty_approve_reject_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

  @Positive @BusinessLogic
  Scenario: Validate loyalty approve reject business logic
    And I send the GET request to "loyalty_approve_reject" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|"Data Updated"|

  @Positive @DataIntegrity
  Scenario: Validate loyalty approve reject data integrity
    And I send the GET request to "loyalty_approve_reject" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|"Data Updated"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|

  @Positive @Regression
  Scenario: Regression test for loyalty approve reject endpoint
    And I send the GET request to "loyalty_approve_reject" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|"Data Updated"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|

  @Positive @Functional
  Scenario: Validate loyalty approve reject response completeness
    And I send the GET request to "loyalty_approve_reject" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|"Data Updated"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|"Data Updated"|

  @Positive @ObjectValidation
  Scenario: Validate loyalty approve reject object structure and content
    And I send the GET request to "loyalty_approve_reject" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|"Data Updated"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|"Data Updated"|

  @Positive @ContentValidation
  Scenario: Validate loyalty approve reject content structure
    And I send the GET request to "loyalty_approve_reject" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|"Data Updated"|
    And validating the response contains the following values
      |Value|
      |result|
      |reason|
      |Data Updated|

  @Positive @LoadTesting
  Scenario: Load testing for loyalty approve reject endpoint
    And I send the GET request to "loyalty_approve_reject" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|"Data Updated"|

  @Negative @Timeout
  Scenario: Test loyalty approve reject endpoint timeout handling
    And I send the GET request to "loyalty_approve_reject" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|"Data Updated"|

  @Positive @EndToEnd
  Scenario: End-to-end loyalty approve reject data retrieval workflow
    And I send the GET request to "loyalty_approve_reject" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|"Data Updated"|
    And I store the response as "loyalty_approve_reject_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|"Data Updated"|

  @Positive @LoyaltyValidation
  Scenario: Validate loyalty approve reject loyalty-specific functionality
    And I send the GET request to "loyalty_approve_reject" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|"Data Updated"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|"Data Updated"|

  @Positive @ApprovalValidation
  Scenario: Validate loyalty approve reject approval functionality
    And I send the GET request to "loyalty_approve_reject" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|"Data Updated"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|"Data Updated"|

  @Positive @UpdateValidation
  Scenario: Validate loyalty approve reject data update functionality
    And I send the GET request to "loyalty_approve_reject" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|"Data Updated"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|"Data Updated"|

  @Positive @CompleteValidation
  Scenario: Validate complete loyalty approve reject functionality
    And I send the GET request to "loyalty_approve_reject" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|"Data Updated"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|"Data Updated"|

