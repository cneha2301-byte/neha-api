@BizomWebAPI @UserClaimTypesManagement @UserClaimGetAssign @UserManagement
Feature: Assign User Claim Types API Testing
  As a system user
  I want to test the assign user claim types endpoint
  So that I can ensure proper functionality and HTML page rendering for user claim types assignment

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get assign user claim types without access token
    When I send the GET request to "userclaimtypes_assign" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get assign user claim types with invalid access token
    And I send the GET request to "userclaimtypes_assign" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title ""
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get assign user claim types with expired access token
    And I send the GET request to "userclaimtypes_assign" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title ""
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get assign user claim types with malformed access token
    And I send the GET request to "userclaimtypes_assign" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the HTML response should contain page title ""
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get assign user claim types with valid access token
    And I send the GET request to "userclaimtypes_assign" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Userclaimtypes"
    And I store the response as "assign_user_claim_types_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate assign user claim types HTML response structure
    And I send the GET request to "userclaimtypes_assign" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @HTMLValidation
  Scenario: TC_07 Validate assign user claim types HTML page title
    And I send the GET request to "userclaimtypes_assign" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Userclaimtypes"

  @Positive @HTMLValidation
  Scenario: TC_08 Validate assign user claim types HTML structure
    And I send the GET request to "userclaimtypes_assign" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And validating the response contains the following values
      |Value|
      |html|
      |head|
      |title|
      |body|

  @Positive @Performance
  Scenario: TC_09 Performance test for assign user claim types endpoint
    And I send the GET request to "userclaimtypes_assign" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the HTML response should contain page title "Userclaimtypes"

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for assign user claim types endpoint
    And I send the GET request to "userclaimtypes_assign" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Userclaimtypes"

  @Negative @Validation
  Scenario: TC_11 Get assign user claim types with invalid query parameters
    And I send the GET request to "userclaimtypes_assign" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Userclaimtypes"

  @Negative @Validation
  Scenario: TC_12 Get assign user claim types with special characters in query parameters
    And I send the GET request to "userclaimtypes_assign" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Userclaimtypes"

  @Negative @Security
  Scenario: TC_13 Get assign user claim types with SQL injection attempt
    And I send the GET request to "userclaimtypes_assign" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE userclaimtypes; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Userclaimtypes"

  @Negative @Boundary
  Scenario: TC_14 Get assign user claim types with maximum query parameters
    And I send the GET request to "userclaimtypes_assign" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Userclaimtypes"

#  @Negative @ErrorHandling
#  Scenario: TC_15 Get assign user claim types with invalid endpoint
#    And I send the GET request to "userclaimtypes_assign_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_16 Validate assign user claim types business logic
    And I send the GET request to "userclaimtypes_assign" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Userclaimtypes"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @DataIntegrity
  Scenario: TC_17 Validate assign user claim types data integrity
    And I send the GET request to "userclaimtypes_assign" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Userclaimtypes"
    And validating the response contains the following values
      |Value|
      |Userclaimtypes|
      |html|
      |body|

  @Positive @Regression
  Scenario: TC_18 Regression test for assign user claim types endpoint
    And I send the GET request to "userclaimtypes_assign" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Userclaimtypes"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @Functional
  Scenario: TC_19 Validate assign user claim types response completeness
    And I send the GET request to "userclaimtypes_assign" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Userclaimtypes"
    And validating the response contains the following values
      |Value|
      |html|
      |head|
      |title|
      |body|
      |Userclaimtypes|
    And I store the response as "assign_user_claim_types_response" name using full path

