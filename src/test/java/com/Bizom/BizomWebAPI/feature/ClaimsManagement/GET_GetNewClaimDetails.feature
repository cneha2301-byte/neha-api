@BizomWebAPI @ClaimsManagement @GetNewClaimDetails @ReportsAnalyticsGroup2 @CE
Feature: Get New Claim Details API Testing
  As a system user
  I want to test the get new claim details endpoint
  So that I can ensure proper functionality and data retrieval for new claim details within a date range for a specific user

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get new claim details without access token
    When I send the GET request to "claims_getnewclaimdetails" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token||fromdate|2025-10-04|
      |||todate|2025-10-05|
      |||userId|25|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get new claim details with invalid access token
    And I send the GET request to "claims_getnewclaimdetails" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|fromdate|2025-10-04|
      |||todate|2025-10-05|
      |||userId|25|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get new claim details with expired access token
    And I send the GET request to "claims_getnewclaimdetails" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|fromdate|2025-10-04|
      |||todate|2025-10-05|
      |||userId|25|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get new claim details with malformed access token
    And I send the GET request to "claims_getnewclaimdetails" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|fromdate|2025-10-04|
      |||todate|2025-10-05|
      |||userId|25|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get new claim details with valid access token
    And I send the GET request to "claims_getnewclaimdetails" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2025-10-04|
      |||todate|2025-10-05|
      |||userId|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And I store the response as "new_claim_details_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate new claim details response structure
    And I send the GET request to "claims_getnewclaimdetails" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2025-10-04|
      |||todate|2025-10-05|
      |||userId|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"No Data Found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @Functional
  Scenario: TC_07 Get new claim details with different date range
    And I send the GET request to "claims_getnewclaimdetails" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2025-09-01|
      |||todate|2025-10-31|
      |||userId|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @Functional
  Scenario: TC_08 Get new claim details with different user ID
    And I send the GET request to "claims_getnewclaimdetails" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2025-10-04|
      |||todate|2025-10-05|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @Performance
  Scenario: TC_09 Performance test for new claim details endpoint
    And I send the GET request to "claims_getnewclaimdetails" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2025-10-04|
      |||todate|2025-10-05|
      |||userId|25|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for new claim details endpoint
    And I send the GET request to "claims_getnewclaimdetails" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2025-10-04|
      |||todate|2025-10-05|
      |||userId|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_11 Get new claim details with invalid date format
    And I send the GET request to "claims_getnewclaimdetails" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|invalid-date|
      |||todate|2025-10-05|
      |||userId|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Negative @Validation
  Scenario: TC_12 Get new claim details with invalid user ID
    And I send the GET request to "claims_getnewclaimdetails" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2025-10-04|
      |||todate|2025-10-05|
      |||userId|99999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Negative @Validation
  Scenario: TC_13 Get new claim details with reversed date range
    And I send the GET request to "claims_getnewclaimdetails" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2025-10-05|
      |||todate|2025-10-04|
      |||userId|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

#  @Negative @Validation
#  Scenario: TC_14 Get new claim details with special characters in path parameters
#    And I send the GET request to "claims_getnewclaimdetails" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|fromdate|<script>alert('XSS')</script>|
#      |||todate|2025-10-05|
#      |||userId|25|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_15 Get new claim details with SQL injection attempt in path parameters
#    And I send the GET request to "claims_getnewclaimdetails" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|fromdate|'; DROP TABLE claims; --|
#      |||todate|2025-10-05|
#      |||userId|25|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_16 Get new claim details with invalid query parameters
    And I send the GET request to "claims_getnewclaimdetails" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2025-10-04|
      |||todate|2025-10-05|
      |||userId|25|
      |invalid_param|invalid_value|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

#  @Negative @ErrorHandling
#  Scenario: TC_17 Get new claim details with invalid endpoint
#    And I send the GET request to "claims_getnewclaimdetails_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|fromdate|2025-10-04|
#      |||todate|2025-10-05|
#      |||userId|25|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the HTML response should contain page title "Users"

  @Positive @BusinessLogic
  Scenario: TC_18 Validate new claim details business logic
    And I send the GET request to "claims_getnewclaimdetails" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2025-10-04|
      |||todate|2025-10-05|
      |||userId|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"No Data Found"|

  @Positive @DataIntegrity
  Scenario: TC_19 Validate new claim details data integrity
    And I send the GET request to "claims_getnewclaimdetails" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2025-10-04|
      |||todate|2025-10-05|
      |||userId|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @Regression
  Scenario: TC_20 Regression test for new claim details endpoint
    And I send the GET request to "claims_getnewclaimdetails" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2025-10-04|
      |||todate|2025-10-05|
      |||userId|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"No Data Found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @Functional
  Scenario: TC_21 Validate new claim details response completeness
    And I send the GET request to "claims_getnewclaimdetails" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2025-10-04|
      |||todate|2025-10-05|
      |||userId|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"No Data Found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @ContentValidation
  Scenario: TC_22 Validate new claim details content structure
    And I send the GET request to "claims_getnewclaimdetails" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2025-10-04|
      |||todate|2025-10-05|
      |||userId|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |No Data Found|

  @Positive @LoadTesting
  Scenario: TC_23 Load testing for new claim details endpoint
    And I send the GET request to "claims_getnewclaimdetails" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2025-10-04|
      |||todate|2025-10-05|
      |||userId|25|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Timeout
  Scenario: TC_24 Test new claim details endpoint timeout handling
    And I send the GET request to "claims_getnewclaimdetails" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2025-10-04|
      |||todate|2025-10-05|
      |||userId|25|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @EndToEnd
  Scenario: TC_25 End-to-end new claim details data retrieval workflow
    And I send the GET request to "claims_getnewclaimdetails" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2025-10-04|
      |||todate|2025-10-05|
      |||userId|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"No Data Found"|
    And I store the response as "new_claim_details_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

