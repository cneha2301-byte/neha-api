@BizomWebAPI @SupportingFunctions @ClaimTypesManagement @ValidateBlockClaimTypes @CE
Feature: Validate Block Claim Types API Testing
  As a system user
  I want to test the validateBlockClaimTypes endpoint
  So that I can ensure proper functionality and data retrieval for claim types validation

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Validate block claim types without access token
    When I send the GET request to "claimtypes_validateblockclaimtypes" endpoint with path parameters
      |Path|Value|
      |claimTypeId|17|
      |date|2025-08-29|
      |outletId|220|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Validate block claim types with invalid access token
    And I send the GET request to "claimtypes_validateblockclaimtypes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|claimTypeId|17|
      |language|en|date|2025-08-29|
      |||outletId|220|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Validate block claim types with expired access token
    And I send the GET request to "claimtypes_validateblockclaimtypes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|claimTypeId|17|
      |language|en|date|2025-08-29|
      |||outletId|220|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Validate block claim types with malformed access token
    And I send the GET request to "claimtypes_validateblockclaimtypes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|claimTypeId|17|
      |language|en|date|2025-08-29|
      |||outletId|220|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Validate block claim types with valid access token and path parameters - positive case
    And I send the GET request to "claimtypes_validateblockclaimtypes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|17|
      |language|en|date|2025-08-29|
      |||outletId|220|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And I store the response as "validateBlockClaimTypes_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate block claim types response structure
    And I send the GET request to "claimtypes_validateblockclaimtypes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|17|
      |language|en|date|2025-08-29|
      |||outletId|220|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.status|number|
      |$.data|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate block claim types specific data values
    And I send the GET request to "claimtypes_validateblockclaimtypes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|17|
      |language|en|date|2025-08-29|
      |||outletId|220|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"No Block Claim Type Found"|
      |$.status|400|
      |$.data|[]|

  @Positive @DataValidation
  Scenario: TC_08 Validate block claim types with static values
    And I send the GET request to "claimtypes_validateblockclaimtypes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|17|
      |language|en|date|2025-08-29|
      |||outletId|220|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.status|400|

  @Positive @Performance
  Scenario: TC_09 Performance test for validate block claim types endpoint
    And I send the GET request to "claimtypes_validateblockclaimtypes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|17|
      |language|en|date|2025-08-29|
      |||outletId|220|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for validate block claim types endpoint
    And I send the GET request to "claimtypes_validateblockclaimtypes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|17|
      |language|en|date|2025-08-29|
      |||outletId|220|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_11 Validate block claim types with missing claimTypeId path parameter
    And I send the GET request to "claimtypes_validateblockclaimtypes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId||
      |language|en|date|2025-08-29|
      |||outletId|220|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_12 Validate block claim types with missing date path parameter
    And I send the GET request to "claimtypes_validateblockclaimtypes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|17|
      |language|en|date||
      |||outletId|220|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_13 Validate block claim types with missing outletId path parameter
    And I send the GET request to "claimtypes_validateblockclaimtypes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|17|
      |language|en|date|2025-08-29|
      |||outletId||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_14 Validate block claim types with invalid claimTypeId path parameter
    And I send the GET request to "claimtypes_validateblockclaimtypes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|invalid_id|
      |language|en|date|2025-08-29|
      |||outletId|220|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_15 Validate block claim types with invalid date format path parameter
    And I send the GET request to "claimtypes_validateblockclaimtypes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|17|
      |language|en|date|invalid-date|
      |||outletId|220|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_16 Validate block claim types with invalid outletId path parameter
    And I send the GET request to "claimtypes_validateblockclaimtypes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|17|
      |language|en|date|2025-08-29|
      |||outletId|invalid_outlet|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_17 Validate block claim types with invalid query parameters
    And I send the GET request to "claimtypes_validateblockclaimtypes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|17|
      |language|en|date|2025-08-29|
      |invalid_param|invalid_value|outletId|220|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

#  @Negative @Security
#  Scenario: TC_18 Validate block claim types with special characters in path parameters
#    And I send the GET request to "claimtypes_validateblockclaimtypes" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|claimTypeId|<script>alert('XSS')</script>|
#      |language|en|date|2025-08-29|
#      |||outletId|220|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_19 Validate block claim types with SQL injection attempt in path parameters
#    And I send the GET request to "claimtypes_validateblockclaimtypes" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|claimTypeId|'; DROP TABLE claimtypes; --|
#      |language|en|date|2025-08-29|
#      |||outletId|220|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: TC_20 Validate block claim types with maximum path parameters
    And I send the GET request to "claimtypes_validateblockclaimtypes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|999999999|
      |language|en|date|2025-12-31|
      |||outletId|999999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Boundary
  Scenario: TC_21 Validate block claim types with negative path parameters
    And I send the GET request to "claimtypes_validateblockclaimtypes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|-1|
      |language|en|date|2025-08-29|
      |||outletId|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Negative @ErrorHandling
#  Scenario: TC_22 Validate block claim types with invalid endpoint
#    And I send the GET request to "claimtypes_validateblockclaimtypes_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|claimTypeId|17|
#      |language|en|date|2025-08-29|
#      |||outletId|220|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_23 Validate block claim types business logic
    And I send the GET request to "claimtypes_validateblockclaimtypes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|17|
      |language|en|date|2025-08-29|
      |||outletId|220|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.status|400|

  @Positive @DataIntegrity
  Scenario: TC_24 Validate block claim types data integrity
    And I send the GET request to "claimtypes_validateblockclaimtypes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|17|
      |language|en|date|2025-08-29|
      |||outletId|220|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.status|number|
      |$.data|array|

  @Positive @Regression
  Scenario: TC_25 Regression test for validate block claim types endpoint
    And I send the GET request to "claimtypes_validateblockclaimtypes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|17|
      |language|en|date|2025-08-29|
      |||outletId|220|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.status|number|
      |$.data|array|

  @Positive @Functional
  Scenario: TC_26 Validate block claim types response completeness
    And I send the GET request to "claimtypes_validateblockclaimtypes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|17|
      |language|en|date|2025-08-29|
      |||outletId|220|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"No Block Claim Type Found"|
      |$.status|400|
      |$.data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.status|number|
      |$.data|array|

  @Positive @ArrayValidation
  Scenario: TC_27 Validate block claim types array structure and content
    And I send the GET request to "claimtypes_validateblockclaimtypes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|17|
      |language|en|date|2025-08-29|
      |||outletId|220|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

  @Positive @ContentValidation
  Scenario: TC_28 Validate block claim types content structure
    And I send the GET request to "claimtypes_validateblockclaimtypes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|17|
      |language|en|date|2025-08-29|
      |||outletId|220|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |status|
      |data|

  @Positive @LoadTesting
  Scenario: TC_29 Load testing for validate block claim types endpoint
    And I send the GET request to "claimtypes_validateblockclaimtypes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|17|
      |language|en|date|2025-08-29|
      |||outletId|220|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Timeout
  Scenario: TC_30 Test validate block claim types endpoint timeout handling
    And I send the GET request to "claimtypes_validateblockclaimtypes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|17|
      |language|en|date|2025-08-29|
      |||outletId|220|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @EndToEnd
  Scenario: TC_31 End-to-end validate block claim types data retrieval workflow
    And I send the GET request to "claimtypes_validateblockclaimtypes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|17|
      |language|en|date|2025-08-29|
      |||outletId|220|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"No Block Claim Type Found"|
      |$.status|400|
      |$.data|[]|
    And I store the response as "validateBlockClaimTypes_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.status|number|
      |$.data|array|

  @Positive @DataValidation
  Scenario: TC_32 Validate block claim types with different claimTypeId values
    And I send the GET request to "claimtypes_validateblockclaimtypes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|1|
      |language|en|date|2025-08-29|
      |||outletId|220|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @DataValidation
  Scenario: TC_33 Validate block claim types with different date values
    And I send the GET request to "claimtypes_validateblockclaimtypes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|17|
      |language|en|date|2025-01-01|
      |||outletId|220|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @DataValidation
  Scenario: TC_34 Validate block claim types with different outletId values
    And I send the GET request to "claimtypes_validateblockclaimtypes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|17|
      |language|en|date|2025-08-29|
      |||outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @DataValidation
  Scenario: TC_35 Validate block claim types with different language parameter
    And I send the GET request to "claimtypes_validateblockclaimtypes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|17|
      |language|hi|date|2025-08-29|
      |||outletId|220|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|



