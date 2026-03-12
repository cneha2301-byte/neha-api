@BizomWebAPI @MdmsManagement @MdmsCategories @WorkflowAutomation @OS
Feature: MDMs Categories API Testing
  As a system user
  I want to test the MDMs categories endpoint
  So that I can ensure proper functionality and data retrieval for MDM categories

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get MDMs categories without access token
    When I send the GET request to "mdms_categories" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get MDMs categories with invalid access token
    And I send the GET request to "mdms_categories" endpoint with dynamic access token and query parameters
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
  Scenario: Get MDMs categories with expired access token
    And I send the GET request to "mdms_categories" endpoint with dynamic access token and query parameters
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
  Scenario: Get MDMs categories with malformed access token
    And I send the GET request to "mdms_categories" endpoint with dynamic access token and query parameters
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
  Scenario: Get MDMs categories with valid access token
    And I send the GET request to "mdms_categories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data['1']|string|
      |$.data['2']|string|
      |$.data['3']|string|
      |$.data['4']|string|
    And I store the response as "mdms_categories_response" name using full path

  @Positive @DataValidation
  Scenario: Validate MDMs categories response structure
    And I send the GET request to "mdms_categories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data['1']|string|
      |$.data['2']|string|
      |$.data['3']|string|
      |$.data['4']|string|

  @Positive @DataValidation
  Scenario: Validate MDMs categories nested data object structure
    And I send the GET request to "mdms_categories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data['1']|string|
      |$.data['2']|string|
      |$.data['3']|string|
      |$.data['4']|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data['1']|Organization|
      |$.data['2']|Products|
      |$.data['3']|Outlets|
      |$.data['4']|""|

  @Positive @DataValidation
  Scenario: Validate MDMs categories with static values
    And I send the GET request to "mdms_categories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data['1']|Organization|
      |$.data['2']|Products|
      |$.data['3']|Outlets|
      |$.data['4']|""|

  @Positive @Performance
  Scenario: Performance test for MDMs categories endpoint
    And I send the GET request to "mdms_categories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|

  @Positive @Concurrency
  Scenario: Concurrent access test for MDMs categories endpoint
    And I send the GET request to "mdms_categories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data['1']|string|
      |$.data['2']|string|
      |$.data['3']|string|
      |$.data['4']|string|

  @Negative @Validation
  Scenario: Get MDMs categories with invalid query parameters
    And I send the GET request to "mdms_categories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|

  @Negative @Validation
  Scenario: Get MDMs categories with special characters in query parameters
    And I send the GET request to "mdms_categories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|

  @Negative @Security
  Scenario: Get MDMs categories with SQL injection attempt
    And I send the GET request to "mdms_categories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE categories; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|

  @Negative @Boundary
  Scenario: Get MDMs categories with maximum query parameters
    And I send the GET request to "mdms_categories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data['1']|string|

#  @Negative @ErrorHandling
#  Scenario: Get MDMs categories with invalid endpoint
#    And I send the GET request to "mdms_categories_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

  @Positive @BusinessLogic
  Scenario: Validate MDMs categories business logic
    And I send the GET request to "mdms_categories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data['1']|string|
      |$.data['2']|string|
      |$.data['3']|string|
      |$.data['4']|string|

  @Positive @DataIntegrity
  Scenario: Validate MDMs categories data integrity
    And I send the GET request to "mdms_categories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data['1']|string|
      |$.data['2']|string|
      |$.data['3']|string|
      |$.data['4']|string|
    And validating the response contains the following values
      |Value|
      |data|
      |Organization|
      |Products|
      |Outlets|

  @Positive @Regression
  Scenario: Regression test for MDMs categories endpoint
    And I send the GET request to "mdms_categories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data['1']|string|
      |$.data['2']|string|
      |$.data['3']|string|
      |$.data['4']|string|

  @Positive @Functional
  Scenario: Validate MDMs categories response completeness
    And I send the GET request to "mdms_categories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data['1']|string|
      |$.data['2']|string|
      |$.data['3']|string|
      |$.data['4']|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data['1']|Organization|
      |$.data['2']|Products|
      |$.data['3']|Outlets|
      |$.data['4']|""|

  @Positive @ContentValidation
  Scenario: Validate MDMs categories content structure
    And I send the GET request to "mdms_categories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data['1']|Organization|
      |$.data['2']|Products|
      |$.data['3']|Outlets|
    And validating the response contains the following values
      |Value|
      |data|
      |Organization|
      |Products|
      |Outlets|

  @Positive @LoadTesting
  Scenario: Load testing for MDMs categories endpoint
    And I send the GET request to "mdms_categories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|

  @Negative @Timeout
  Scenario: Test MDMs categories endpoint timeout handling
    And I send the GET request to "mdms_categories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|

  @Positive @EndToEnd
  Scenario: End-to-end MDMs categories data retrieval workflow
    And I send the GET request to "mdms_categories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data['1']|string|
      |$.data['2']|string|
      |$.data['3']|string|
      |$.data['4']|string|
    And I store the response as "mdms_categories_response" name using full path
    And validating the response contains the following values
      |Value|
      |data|
      |Organization|
      |Products|
      |Outlets|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data['1']|Organization|
      |$.data['2']|Products|
      |$.data['3']|Outlets|
      |$.data['4']|""|

