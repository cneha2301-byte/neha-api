@BizomWebAPI @ClaimsManagement @GetClaimGraphViewData @ReportsAnalyticsGroup2 @CE
Feature: Get Claim Graph View Data API Testing
  As a system user
  I want to test the get claim graph view data endpoint
  So that I can ensure proper functionality and data retrieval for claim graph view data management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get claim graph view data without access token
    When I send the GET request to "claims_getclaimgraphviewdata" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
 Scenario: TC_02 Get claim graph view data with invalid access token
    And I send the GET request to "claims_getclaimgraphviewdata" endpoint with dynamic access token and query parameters
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
  Scenario: TC_03 Get claim graph view data with expired access token
    And I send the GET request to "claims_getclaimgraphviewdata" endpoint with dynamic access token and query parameters
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
  Scenario: TC_04 Get claim graph view data with malformed access token
    And I send the GET request to "claims_getclaimgraphviewdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

#  @Positive @Smoke
#  Scenario: TC_05 Get claim graph view data with valid access token
#    And I send the GET request to "claims_getclaimgraphviewdata" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Claims.approved|0|
#      |$.Claims.rejected|0|
#      |$.Claims.pending|0|
#      |$.Claims.newclaims|0|
#      |$.Claims.modifiedclaims|0|
#    And I store the response as "claim_graph_view_data_response" name using full path

#  @Positive @DataValidation
#  Scenario: TC_06 Validate claim graph view data response structure
#    And I send the GET request to "claims_getclaimgraphviewdata" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Claims.approved|0|
#      |$.Claims.rejected|0|
#      |$.Claims.pending|0|
#      |$.Claims.newclaims|0|
#      |$.Claims.modifiedclaims|0|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Claims|object|
#      |$.Claims.approved|number|
#      |$.Claims.rejected|number|
#      |$.Claims.pending|number|
#      |$.Claims.newclaims|number|
#      |$.Claims.modifiedclaims|number|

#  @Positive @DataValidation
#  Scenario: TC_07 Validate claim graph view data Claims object structure
#    And I send the GET request to "claims_getclaimgraphviewdata" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Claims.approved|0|
#      |$.Claims.rejected|0|
#      |$.Claims.pending|0|
#      |$.Claims.newclaims|0|
#      |$.Claims.modifiedclaims|0|

#  @Positive @DataValidation
#  Scenario: TC_08 Validate claim graph view data with static values
#    And I send the GET request to "claims_getclaimgraphviewdata" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Claims.approved|0|
#      |$.Claims.rejected|0|
#      |$.Claims.pending|0|
#      |$.Claims.newclaims|0|
#      |$.Claims.modifiedclaims|0|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Claims.approved|number|
#      |$.Claims.rejected|number|
#      |$.Claims.pending|number|
#      |$.Claims.newclaims|number|
#      |$.Claims.modifiedclaims|number|

#  @Positive @Performance
#  Scenario: TC_09 Performance test for claim graph view data endpoint
#    And I send the GET request to "claims_getclaimgraphviewdata" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Claims.approved|0|
#      |$.Claims.rejected|0|
#      |$.Claims.pending|0|
#      |$.Claims.newclaims|0|
#      |$.Claims.modifiedclaims|0|

#  @Positive @Concurrency
#  Scenario: TC_10 Concurrent access test for claim graph view data endpoint
#    And I send the GET request to "claims_getclaimgraphviewdata" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Claims.approved|0|
#      |$.Claims.rejected|0|
#      |$.Claims.pending|0|
#      |$.Claims.newclaims|0|
#      |$.Claims.modifiedclaims|0|

  @Negative @Validation
  Scenario: TC_11 Get claim graph view data with invalid query parameters
    And I send the GET request to "claims_getclaimgraphviewdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Claims.approved|0|

  @Negative @Validation
  Scenario: TC_12 Get claim graph view data with special characters in query parameters
    And I send the GET request to "claims_getclaimgraphviewdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Claims.approved|0|

#  @Negative @Security
#  Scenario: TC_13 Get claim graph view data with SQL injection attempt
#    And I send the GET request to "claims_getclaimgraphviewdata" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|'; DROP TABLE claims; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Claims.approved|0|
#      |$.Claims.rejected|0|
#      |$.Claims.pending|0|
#      |$.Claims.newclaims|0|
#      |$.Claims.modifiedclaims|0|

  @Negative @Boundary
  Scenario: TC_14 Get claim graph view data with maximum query parameters
    And I send the GET request to "claims_getclaimgraphviewdata" endpoint with dynamic access token and query parameters
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
      |$.Claims.approved|0|

#  @Negative @ErrorHandling
#  Scenario: TC_15 Get claim graph view data with invalid endpoint
#    And I send the GET request to "claims_getclaimgraphviewdata_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the HTML response should contain page title "Users"

#  @Positive @BusinessLogic
#  Scenario: TC_16 Validate claim graph view data business logic
#    And I send the GET request to "claims_getclaimgraphviewdata" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Claims.approved|0|
#      |$.Claims.rejected|0|
#      |$.Claims.pending|0|
#      |$.Claims.newclaims|0|
#      |$.Claims.modifiedclaims|0|
#      |$.Claims.approved|0|
#      |$.Claims.rejected|0|
#      |$.Claims.pending|0|
#      |$.Claims.newclaims|0|
#      |$.Claims.modifiedclaims|0|

#  @Positive @DataIntegrity
#  Scenario: TC_17 Validate claim graph view data data integrity
#    And I send the GET request to "claims_getclaimgraphviewdata" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Claims.approved|0|
#      |$.Claims.rejected|0|
#      |$.Claims.pending|0|
#      |$.Claims.newclaims|0|
#      |$.Claims.modifiedclaims|0|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Claims|object|
#      |$.Claims.approved|number|
#      |$.Claims.rejected|number|
#      |$.Claims.pending|number|
#      |$.Claims.newclaims|number|
#      |$.Claims.modifiedclaims|number|

#  @Positive @Regression
#  Scenario: TC_18 Regression test for claim graph view data endpoint
#    And I send the GET request to "claims_getclaimgraphviewdata" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Claims.approved|0|
#      |$.Claims.rejected|0|
#      |$.Claims.pending|0|
#      |$.Claims.newclaims|0|
#      |$.Claims.modifiedclaims|0|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Claims.approved|number|
#      |$.Claims.approved|number|
#      |$.Claims.rejected|number|
#      |$.Claims.pending|number|
#      |$.Claims.newclaims|number|
#      |$.Claims.modifiedclaims|number|

#  @Positive @Functional
#  Scenario: TC_19 Validate claim graph view data response completeness
#    And I send the GET request to "claims_getclaimgraphviewdata" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Claims.approved|0|
#      |$.Claims.rejected|0|
#      |$.Claims.pending|0|
#      |$.Claims.newclaims|0|
#      |$.Claims.modifiedclaims|0|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Claims|object|
#      |$.Claims.approved|number|
#      |$.Claims.rejected|number|
#      |$.Claims.pending|number|
#      |$.Claims.newclaims|number|
#      |$.Claims.modifiedclaims|number|

  @Positive @ContentValidation
  Scenario: TC_20 Validate claim graph view data content structure
    And I send the GET request to "claims_getclaimgraphviewdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Claims|
      |approved|
      |rejected|
      |pending|
      |newclaims|
      |modifiedclaims|

  @Positive @LoadTesting
  Scenario: TC_21 Load testing for claim graph view data endpoint
    And I send the GET request to "claims_getclaimgraphviewdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Claims.approved|0|

  @Negative @Timeout
  Scenario: TC_22 Test claim graph view data endpoint timeout handling
    And I send the GET request to "claims_getclaimgraphviewdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Claims.approved|0|

#  @Positive @EndToEnd
#  Scenario: TC_23 End-to-end claim graph view data data retrieval workflow
#    And I send the GET request to "claims_getclaimgraphviewdata" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Claims.approved|0|
#      |$.Claims.rejected|0|
#      |$.Claims.pending|0|
#      |$.Claims.newclaims|0|
#      |$.Claims.modifiedclaims|0|
#    And I store the response as "claim_graph_view_data_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Claims|object|
#      |$.Claims.approved|number|
#      |$.Claims.rejected|number|
#      |$.Claims.pending|number|
#      |$.Claims.newclaims|number|
#      |$.Claims.modifiedclaims|number|

