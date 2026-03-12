@BizomWebAPI  @Innovation @EwayBillsManagement @EditCredentials @DataProcessing
#this API have notice in response so for a time being we are not testing this API
Feature: Edit Credentials API Testing
  As a system user
  I want to test the edit credentials endpoint
  So that I can ensure proper functionality for editing eway bills credentials

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Edit credentials without access token
    When I send the GET request to "ewaybills_editcredentials" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Edit credentials with invalid access token
    And I send the GET request to "ewaybills_editcredentials" endpoint with dynamic access token and query parameters
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
  Scenario: TC_03 Edit credentials with expired access token
    And I send the GET request to "ewaybills_editcredentials" endpoint with dynamic access token and query parameters
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
  Scenario: TC_04 Edit credentials with malformed access token
    And I send the GET request to "ewaybills_editcredentials" endpoint with dynamic access token and query parameters
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
#  Scenario: TC_05 Edit credentials with valid access token
#    And I send the GET request to "ewaybills_editcredentials" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|Saved the credentials successfully.|
#    And I store the response as "edit_credentials_response" name using full path
#
#  @Positive @DataValidation
#  Scenario: TC_06 Validate edit credentials response structure
#    And I send the GET request to "ewaybills_editcredentials" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|Saved the credentials successfully.|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.reason|string|
#
#  @Positive @DataValidation
#  Scenario: TC_07 Validate edit credentials complete structure
#    And I send the GET request to "ewaybills_editcredentials" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|Saved the credentials successfully.|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.reason|string|
#
#  @Positive @Performance
#  Scenario: TC_08 Performance test for edit credentials endpoint
#    And I send the GET request to "ewaybills_editcredentials" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|Saved the credentials successfully.|
#
#  @Positive @Concurrency
#  Scenario: TC_09 Concurrent access test for edit credentials endpoint
#    And I send the GET request to "ewaybills_editcredentials" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|Saved the credentials successfully.|
#
#  @Negative @Validation
#  Scenario: TC_10 Edit credentials with invalid query parameters
#    And I send the GET request to "ewaybills_editcredentials" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |invalid_param|invalid_value|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|Saved the credentials successfully.|
#
#  @Negative @Validation
#  Scenario: TC_11 Edit credentials with special characters in query parameters
#    And I send the GET request to "ewaybills_editcredentials" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|Saved the credentials successfully.|
#
#  @Negative @Security
#  Scenario: TC_12 Edit credentials with SQL injection attempt
#    And I send the GET request to "ewaybills_editcredentials" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|'; DROP TABLE ewaybills; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|Saved the credentials successfully.|
#
#  @Negative @Boundary
#  Scenario: TC_13 Edit credentials with maximum query parameters
#    And I send the GET request to "ewaybills_editcredentials" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |param1|value1|
#      |param2|value2|
#      |param3|value3|
#      |param4|value4|
#      |param5|value5|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|Saved the credentials successfully.|
#
#  @Negative @ErrorHandling
#  Scenario: TC_14 Edit credentials with invalid endpoint
#    And I send the GET request to "ewaybills_editcredentials_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds
#
#  @Positive @BusinessLogic
#  Scenario: TC_15 Validate edit credentials business logic
#    And I send the GET request to "ewaybills_editcredentials" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|Saved the credentials successfully.|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.reason|string|
#
#  @Positive @DataIntegrity
#  Scenario: TC_16 Validate edit credentials data integrity
#    And I send the GET request to "ewaybills_editcredentials" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.reason|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|Saved the credentials successfully.|
#
#  @Positive @Regression
#  Scenario: TC_17 Regression test for edit credentials endpoint
#    And I send the GET request to "ewaybills_editcredentials" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|Saved the credentials successfully.|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.reason|string|
#
#  @Positive @Functional
#  Scenario: TC_18 Validate edit credentials response completeness
#    And I send the GET request to "ewaybills_editcredentials" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.reason|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|Saved the credentials successfully.|
#    And I store the response as "edit_credentials_response" name using full path
#    And validating the response contains the following values
#      |Value|
#      |result|
#      |reason|
#      |Saved the credentials successfully|
#
