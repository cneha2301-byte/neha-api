@BizomWebAPI @ClaimApprovalsManagement @GetApprovers @ConfigurationSettings @CE
Feature: Get Claim Approvers API Testing
  As a system user
  I want to test the get claim approvers endpoint
  So that I can ensure proper functionality and data retrieval for claim approvers management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get claim approvers without access token
    When I send the GET request to "getapprovers" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Users"

  @Negative @Security
  Scenario: TC_02 Get claim approvers with invalid access token
    And I send the GET request to "getapprovers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get claim approvers with expired access token
    And I send the GET request to "getapprovers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get claim approvers with malformed access token
    And I send the GET request to "getapprovers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get claim approvers with valid access token
    And I send the GET request to "getapprovers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
      |$.Response.Users|[]|
    And I store the response as "getapprovers_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate claim approvers response structure
    And I send the GET request to "getapprovers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
      |$.Response.Users|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response|object|
      |$.Response.Result|string|
      |$.Response.Reason|string|
      |$.Response.Users|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate claim approvers specific data values
    And I send the GET request to "getapprovers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
      |$.Response.Users|[]|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
      |$.Response.Users|[]|

  @Positive @DataValidation
  Scenario: TC_08 Validate claim approvers with static values
    And I send the GET request to "getapprovers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
      |$.Response.Users|[]|

  @Positive @Performance
  Scenario: TC_09 Performance test for claim approvers endpoint
    And I send the GET request to "getapprovers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
      |$.Response.Users|[]|

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for claim approvers endpoint
    And I send the GET request to "getapprovers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
      |$.Response.Users|[]|

  @Negative @Validation
  Scenario: TC_11 Get claim approvers with invalid query parameters
    And I send the GET request to "getapprovers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
      |$.Response.Users|[]|

  @Negative @Validation
  Scenario: TC_12 Get claim approvers with special characters in query parameters
    And I send the GET request to "getapprovers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
      |$.Response.Users|[]|

  @Negative @Security
  Scenario: TC_13 Get claim approvers with SQL injection attempt
    And I send the GET request to "getapprovers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE claimapprovers; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
      |$.Response.Users|[]|

  @Negative @Boundary
  Scenario: TC_14 Get claim approvers with maximum query parameters
    And I send the GET request to "getapprovers" endpoint with dynamic access token and query parameters
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
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
      |$.Response.Users|[]|

  @Negative @ErrorHandling
  Scenario: TC_15 Get claim approvers with invalid endpoint
    And I send the GET request to "getapprovers_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_404_NOT_FOUND"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_16 Validate claim approvers business logic
    And I send the GET request to "getapprovers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
      |$.Response.Users|[]|

  @Positive @DataIntegrity
  Scenario: TC_17 Validate claim approvers data integrity
    And I send the GET request to "getapprovers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
      |$.Response.Users|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response|object|
      |$.Response.Result|string|
      |$.Response.Reason|string|
      |$.Response.Users|array|

  @Positive @Regression
  Scenario: TC_18 Regression test for claim approvers endpoint
    And I send the GET request to "getapprovers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
      |$.Response.Users|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response|object|
      |$.Response.Result|string|
      |$.Response.Reason|string|
      |$.Response.Users|array|

  @Positive @Functional
  Scenario: TC_19 Validate claim approvers response completeness
    And I send the GET request to "getapprovers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
      |$.Response.Users|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response|object|
      |$.Response.Result|string|
      |$.Response.Reason|string|
      |$.Response.Users|array|

  @Positive @ArrayValidation
  Scenario: TC_20 Validate claim approvers array structure and content
    And I send the GET request to "getapprovers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
      |$.Response.Users|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response|object|
      |$.Response.Result|string|
      |$.Response.Reason|string|
      |$.Response.Users|array|

  @Positive @ContentValidation
  Scenario: TC_21 Validate claim approvers content structure
    And I send the GET request to "getapprovers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
      |$.Response.Users|[]|
    And validating the response contains the following values
      |Value|
      |Response|
      |Result|
      |Reason|
      |Users|

  @Positive @LoadTesting
  Scenario: TC_22 Load testing for claim approvers endpoint
    And I send the GET request to "getapprovers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
      |$.Response.Users|[]|

  @Negative @Timeout
  Scenario: TC_23 Test claim approvers endpoint timeout handling
    And I send the GET request to "getapprovers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
      |$.Response.Users|[]|

  @Positive @EndToEnd
  Scenario: TC_24 End-to-end claim approvers data retrieval workflow
    And I send the GET request to "getapprovers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
      |$.Response.Users|[]|
    And I store the response as "getapprovers_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response|object|
      |$.Response.Result|string|
      |$.Response.Reason|string|
      |$.Response.Users|array|

  @Positive @DataHandling
  Scenario: TC_25 Validate claim approvers data handling
    And I send the GET request to "getapprovers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
      |$.Response.Users|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response|object|
      |$.Response.Result|string|
      |$.Response.Reason|string|
      |$.Response.Users|array|

  @Positive @ResponseStructure
  Scenario: TC_26 Validate claim approvers response structure consistency
    And I send the GET request to "getapprovers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
      |$.Response.Users|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response|object|
      |$.Response.Result|string|
      |$.Response.Reason|string|
      |$.Response.Users|array|

  @Positive @EmptyDataHandling
  Scenario: TC_27 Validate claim approvers empty data handling
    And I send the GET request to "getapprovers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
      |$.Response.Users|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response.Users|array|
