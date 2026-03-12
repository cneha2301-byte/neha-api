@BizomWebAPI @ApprovalSequencesManagement @GetRules @MasterDataManagement @CE
Feature: Get Rules API Testing
  As a system user
  I want to test the get rules endpoint
  So that I can ensure proper functionality and data retrieval for approval sequence rules

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get rules without access token
    When I send the GET request to "approvalsequences_getrules" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get rules with invalid access token
    And I send the GET request to "approvalsequences_getrules" endpoint with dynamic access token and query parameters
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
  Scenario: TC_03 Get rules with expired access token
    And I send the GET request to "approvalsequences_getrules" endpoint with dynamic access token and query parameters
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
  Scenario: TC_04 Get rules with malformed access token
    And I send the GET request to "approvalsequences_getrules" endpoint with dynamic access token and query parameters
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
  Scenario: TC_05 Get rules with valid access token
    And I send the GET request to "approvalsequences_getrules" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And I store the response as "rules_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate rules response structure
    And I send the GET request to "approvalsequences_getrules" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Rules found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.rules|object|

  @Positive @DataValidation
  Scenario: TC_07 Validate rules object structure
    And I send the GET request to "approvalsequences_getrules" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.rules|object|
      |$.rules.1|string|
      |$.rules.2|string|
      |$.rules.3|string|
      |$.rules.4|string|
      |$.rules.5|string|

  @Positive @DataValidation
  Scenario: TC_08 Validate rules with static values
    And I send the GET request to "approvalsequences_getrules" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Rules found"|
      |$.rules.1|"less than"|
      |$.rules.2|"greater than"|
      |$.rules.3|"less than equal to"|
      |$.rules.4|"greater than equal to"|
      |$.rules.5|"between"|

  @Positive @Performance
  Scenario: TC_09 Performance test for rules endpoint
    And I send the GET request to "approvalsequences_getrules" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for rules endpoint
    And I send the GET request to "approvalsequences_getrules" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_11 Get rules with invalid query parameters
    And I send the GET request to "approvalsequences_getrules" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_12 Get rules with special characters in query parameters
    And I send the GET request to "approvalsequences_getrules" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Security
  Scenario: TC_13 Get rules with SQL injection attempt
    And I send the GET request to "approvalsequences_getrules" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE rules; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Boundary
  Scenario: TC_14 Get rules with maximum query parameters
    And I send the GET request to "approvalsequences_getrules" endpoint with dynamic access token and query parameters
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
  Scenario: TC_15 Get rules with invalid endpoint
    And I send the GET request to "approvalsequences_getrules_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_404_NOT_FOUND"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_16 Validate rules business logic
    And I send the GET request to "approvalsequences_getrules" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Rules found"|
      |$.rules.1|"less than"|
      |$.rules.2|"greater than"|
      |$.rules.3|"less than equal to"|
      |$.rules.4|"greater than equal to"|
      |$.rules.5|"between"|

  @Positive @DataIntegrity
  Scenario: TC_17 Validate rules data integrity
    And I send the GET request to "approvalsequences_getrules" endpoint with dynamic access token and query parameters
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
      |$.rules|object|
      |$.rules.1|string|
      |$.rules.2|string|
      |$.rules.3|string|
      |$.rules.4|string|
      |$.rules.5|string|

  @Positive @Regression
  Scenario: TC_18 Regression test for rules endpoint
    And I send the GET request to "approvalsequences_getrules" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Rules found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.rules|object|

  @Positive @Functional
  Scenario: TC_19 Validate rules response completeness
    And I send the GET request to "approvalsequences_getrules" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Rules found"|
      |$.rules.1|"less than"|
      |$.rules.2|"greater than"|
      |$.rules.3|"less than equal to"|
      |$.rules.4|"greater than equal to"|
      |$.rules.5|"between"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.rules|object|
      |$.rules.1|string|
      |$.rules.2|string|
      |$.rules.3|string|
      |$.rules.4|string|
      |$.rules.5|string|

  @Positive @ObjectValidation
  Scenario: TC_20 Validate rules object structure and content
    And I send the GET request to "approvalsequences_getrules" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.rules|object|
      |$.rules.1|string|
      |$.rules.2|string|
      |$.rules.3|string|
      |$.rules.4|string|
      |$.rules.5|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.rules.1|"less than"|
      |$.rules.2|"greater than"|
      |$.rules.3|"less than equal to"|
      |$.rules.4|"greater than equal to"|
      |$.rules.5|"between"|

  @Positive @ContentValidation
  Scenario: TC_21 Validate rules content structure
    And I send the GET request to "approvalsequences_getrules" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |rules|
      |less than|
      |greater than|
      |between|

  @Positive @LoadTesting
  Scenario: TC_22 Load testing for rules endpoint
    And I send the GET request to "approvalsequences_getrules" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Timeout
  Scenario: TC_23 Test rules endpoint timeout handling
    And I send the GET request to "approvalsequences_getrules" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @EndToEnd
  Scenario: TC_24 End-to-end rules data retrieval workflow
    And I send the GET request to "approvalsequences_getrules" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Rules found"|
      |$.rules.1|"less than"|
      |$.rules.2|"greater than"|
      |$.rules.3|"less than equal to"|
      |$.rules.4|"greater than equal to"|
      |$.rules.5|"between"|
    And I store the response as "rules_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.rules|object|
      |$.rules.1|string|
      |$.rules.2|string|
      |$.rules.3|string|
      |$.rules.4|string|
      |$.rules.5|string|

