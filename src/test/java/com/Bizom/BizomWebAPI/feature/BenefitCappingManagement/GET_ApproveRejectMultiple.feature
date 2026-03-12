@BizomWebAPI @PI @BenefitCappingManagement @ApproveRejectMultiple @ConfigurationSettings
#API curl is not correct and checked in athena but didn't got correct CURL.
Feature: Approve Reject Multiple API Testing
  As a system user
  I want to test the approve reject multiple endpoint
  So that I can ensure proper functionality and data retrieval for benefit capping plans approve reject multiple management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Approve reject multiple without access token
    When I send the GET request to "benefitcappingplans_approverejectmultiple" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Approve reject multiple with invalid access token
    And I send the GET request to "benefitcappingplans_approverejectmultiple" endpoint with dynamic access token and query parameters
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
  Scenario: TC_03 Approve reject multiple with expired access token
    And I send the GET request to "benefitcappingplans_approverejectmultiple" endpoint with dynamic access token and query parameters
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
  Scenario: TC_04 Approve reject multiple with malformed access token
    And I send the GET request to "benefitcappingplans_approverejectmultiple" endpoint with dynamic access token and query parameters
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
#  Scenario: TC_05 Approve reject multiple with valid access token
#    And I send the GET request to "benefitcappingplans_approverejectmultiple" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#    And I store the response as "approve_reject_multiple_response" name using full path

#  @Positive @DataValidation
#  Scenario: TC_06 Validate approve reject multiple response structure
#    And I send the GET request to "benefitcappingplans_approverejectmultiple" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#
#  @Positive @DataValidation
#  Scenario: TC_07 Validate approve reject multiple Reason field
#    And I send the GET request to "benefitcappingplans_approverejectmultiple" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#
#  @Positive @DataValidation
#  Scenario: TC_08 Validate approve reject multiple complete structure
#    And I send the GET request to "benefitcappingplans_approverejectmultiple" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#
#  @Positive @Performance
#  Scenario: TC_09 Performance test for approve reject multiple endpoint
#    And I send the GET request to "benefitcappingplans_approverejectmultiple" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#
#  @Positive @Concurrency
#  Scenario: TC_10 Concurrent access test for approve reject multiple endpoint
#    And I send the GET request to "benefitcappingplans_approverejectmultiple" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#
#  @Negative @Validation
#  Scenario: TC_11 Approve reject multiple with invalid query parameters
#    And I send the GET request to "benefitcappingplans_approverejectmultiple" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |invalid_param|invalid_value|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#
#  @Negative @Validation
#  Scenario: TC_12 Approve reject multiple with special characters in query parameters
#    And I send the GET request to "benefitcappingplans_approverejectmultiple" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#
#  @Negative @Security
#  Scenario: TC_13 Approve reject multiple with SQL injection attempt
#    And I send the GET request to "benefitcappingplans_approverejectmultiple" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|'; DROP TABLE benefitcappingplans; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|

  @Negative @ErrorHandling
  Scenario: TC_14 Approve reject multiple with invalid endpoint
    And I send the GET request to "benefitcappingplans_approverejectmultiple_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "404"
    And verify response time is less than "2500" milliseconds

#  @Positive @BusinessLogic
#  Scenario: TC_15 Validate approve reject multiple business logic
#    And I send the GET request to "benefitcappingplans_approverejectmultiple" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#
#  @Positive @DataIntegrity
#  Scenario: TC_16 Validate approve reject multiple data integrity
#    And I send the GET request to "benefitcappingplans_approverejectmultiple" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#
#  @Positive @Regression
#  Scenario: TC_17 Regression test for approve reject multiple endpoint
#    And I send the GET request to "benefitcappingplans_approverejectmultiple" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#
#  @Positive @Functional
#  Scenario: TC_18 Validate approve reject multiple response completeness
#    And I send the GET request to "benefitcappingplans_approverejectmultiple" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#    And I store the response as "approve_reject_multiple_response" name using full path
#    And validating the response contains the following values
#      |Value|
#      |Result|
#      |Reason|
#
#  @Positive @EndToEnd
#  Scenario: TC_19 End-to-end approve reject multiple data retrieval workflow
#    And I send the GET request to "benefitcappingplans_approverejectmultiple" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#    And I store the response as "approve_reject_multiple_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|

