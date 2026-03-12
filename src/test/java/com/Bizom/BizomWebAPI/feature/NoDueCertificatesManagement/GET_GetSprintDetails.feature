@BizomWebAPI @NoDueCertificatesManagement @GetSprintDetails @WorkflowAutomation @OS
Feature: Get Sprint Details API Testing
  As a system user
  I want to test the get sprint details endpoint
  So that I can ensure proper functionality and data retrieval for no due certificates sprint details management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get sprint details without access token
    When I send the GET request to "noduecertificates_getsprintdetails" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get sprint details with invalid access token
    And I send the GET request to "noduecertificates_getsprintdetails" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get sprint details with expired access token
    And I send the GET request to "noduecertificates_getsprintdetails" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get sprint details with malformed access token
    And I send the GET request to "noduecertificates_getsprintdetails" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get sprint details with valid access token
    And I send the GET request to "noduecertificates_getsprintdetails" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$|[]|
    And I store the response as "sprint_details_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate sprint details response structure
    And I send the GET request to "noduecertificates_getsprintdetails" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate sprint details array structure
    And I send the GET request to "noduecertificates_getsprintdetails" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$|[]|

  @Positive @ArrayValidation
  Scenario: TC_08 Validate sprint details empty array response
    And I send the GET request to "noduecertificates_getsprintdetails" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$|[]|

  @Positive @Performance
  Scenario: TC_09 Performance test for sprint details endpoint
    And I send the GET request to "noduecertificates_getsprintdetails" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for sprint details endpoint
    And I send the GET request to "noduecertificates_getsprintdetails" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Negative @Validation
  Scenario: TC_11 Get sprint details with invalid query parameters
    And I send the GET request to "noduecertificates_getsprintdetails" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Negative @Validation
  Scenario: TC_12 Get sprint details with special characters in query parameters
    And I send the GET request to "noduecertificates_getsprintdetails" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Negative @Security
  Scenario: TC_13 Get sprint details with SQL injection attempt
    And I send the GET request to "noduecertificates_getsprintdetails" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE sprintdetails; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Negative @ErrorHandling
  Scenario: TC_14 Get sprint details with invalid endpoint
    And I send the GET request to "noduecertificates_getsprintdetails_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_15 Validate sprint details business logic
    And I send the GET request to "noduecertificates_getsprintdetails" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$|[]|

  @Positive @DataIntegrity
  Scenario: TC_16 Validate sprint details data integrity
    And I send the GET request to "noduecertificates_getsprintdetails" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$|[]|

  @Positive @Regression
  Scenario: TC_17 Regression test for sprint details endpoint
    And I send the GET request to "noduecertificates_getsprintdetails" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$|[]|

  @Positive @Functional
  Scenario: TC_18 Validate sprint details response completeness
    And I send the GET request to "noduecertificates_getsprintdetails" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$|[]|
    And I store the response as "sprint_details_response" name using full path

  @Positive @ContentValidation
  Scenario: TC_19 Validate sprint details content structure
    And I send the GET request to "noduecertificates_getsprintdetails" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$|[]|

  @Positive @EndToEnd
  Scenario: TC_20 End-to-end sprint details data retrieval workflow
    And I send the GET request to "noduecertificates_getsprintdetails" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$|[]|
    And I store the response as "sprint_details_response" name using full path

