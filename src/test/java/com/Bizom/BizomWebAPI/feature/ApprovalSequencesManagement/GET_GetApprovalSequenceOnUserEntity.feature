@BizomWebAPI @ApprovalSequencesManagement @GetApprovalSequenceOnUserEntity @MasterDataManagement @CE
Feature: Get Approval Sequence On User Entity API Testing
  As a system user
  I want to test the get approval sequence on user entity endpoint
  So that I can ensure proper functionality and data retrieval for approval sequences on user entities

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get approval sequence on user entity without access token
    When I send the GET request to "approvalsequences_getapprovalsequenceonuserentity" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get approval sequence on user entity with invalid access token
    And I send the GET request to "approvalsequences_getapprovalsequenceonuserentity" endpoint with dynamic access token and query parameters
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
  Scenario: TC_03 Get approval sequence on user entity with expired access token
    And I send the GET request to "approvalsequences_getapprovalsequenceonuserentity" endpoint with dynamic access token and query parameters
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
  Scenario: TC_04 Get approval sequence on user entity with malformed access token
    And I send the GET request to "approvalsequences_getapprovalsequenceonuserentity" endpoint with dynamic access token and query parameters
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
  Scenario: TC_05 Get approval sequence on user entity with valid access token
    And I send the GET request to "approvalsequences_getapprovalsequenceonuserentity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And I store the response as "approval_sequence_on_user_entity_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate approval sequence on user entity response structure
    And I send the GET request to "approvalsequences_getapprovalsequenceonuserentity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"No data found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate approval sequence on user entity Data array structure
    And I send the GET request to "approvalsequences_getapprovalsequenceonuserentity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|

  @Positive @DataValidation
  Scenario: TC_08 Validate approval sequence on user entity with static values
    And I send the GET request to "approvalsequences_getapprovalsequenceonuserentity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"No data found"|
      |$.Data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|

  @Positive @Performance
  Scenario: TC_09 Performance test for approval sequence on user entity endpoint
    And I send the GET request to "approvalsequences_getapprovalsequenceonuserentity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for approval sequence on user entity endpoint
    And I send the GET request to "approvalsequences_getapprovalsequenceonuserentity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_11 Get approval sequence on user entity with invalid query parameters
    And I send the GET request to "approvalsequences_getapprovalsequenceonuserentity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_12 Get approval sequence on user entity with special characters in query parameters
    And I send the GET request to "approvalsequences_getapprovalsequenceonuserentity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Security
  Scenario: TC_13 Get approval sequence on user entity with SQL injection attempt
    And I send the GET request to "approvalsequences_getapprovalsequenceonuserentity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE approvalsequences; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Boundary
  Scenario: TC_14 Get approval sequence on user entity with maximum query parameters
    And I send the GET request to "approvalsequences_getapprovalsequenceonuserentity" endpoint with dynamic access token and query parameters
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
      |$.Result|true|

  @Negative @ErrorHandling
  Scenario: TC_15 Get approval sequence on user entity with invalid endpoint
    And I send the GET request to "approvalsequences_getapprovalsequenceonuserentity_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_404_NOT_FOUND"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_16 Validate approval sequence on user entity business logic
    And I send the GET request to "approvalsequences_getapprovalsequenceonuserentity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"No data found"|
      |$.Data|[]|

  @Positive @DataIntegrity
  Scenario: TC_17 Validate approval sequence on user entity data integrity
    And I send the GET request to "approvalsequences_getapprovalsequenceonuserentity" endpoint with dynamic access token and query parameters
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
      |$.Reason|string|
      |$.Data|array|

  @Positive @Regression
  Scenario: TC_18 Regression test for approval sequence on user entity endpoint
    And I send the GET request to "approvalsequences_getapprovalsequenceonuserentity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"No data found"|
      |$.Data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|

  @Positive @Functional
  Scenario: TC_19 Validate approval sequence on user entity response completeness
    And I send the GET request to "approvalsequences_getapprovalsequenceonuserentity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"No data found"|
      |$.Data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|

  @Positive @ArrayValidation
  Scenario: TC_20 Validate approval sequence on user entity array structure and content
    And I send the GET request to "approvalsequences_getapprovalsequenceonuserentity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|

  @Positive @ContentValidation
  Scenario: TC_21 Validate approval sequence on user entity content structure
    And I send the GET request to "approvalsequences_getapprovalsequenceonuserentity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Data|
      |No data found|

  @Positive @LoadTesting
  Scenario: TC_22 Load testing for approval sequence on user entity endpoint
    And I send the GET request to "approvalsequences_getapprovalsequenceonuserentity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Timeout
  Scenario: TC_23 Test approval sequence on user entity endpoint timeout handling
    And I send the GET request to "approvalsequences_getapprovalsequenceonuserentity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @EndToEnd
  Scenario: TC_24 End-to-end approval sequence on user entity data retrieval workflow
    And I send the GET request to "approvalsequences_getapprovalsequenceonuserentity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"No data found"|
      |$.Data|[]|
    And I store the response as "approval_sequence_on_user_entity_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|

