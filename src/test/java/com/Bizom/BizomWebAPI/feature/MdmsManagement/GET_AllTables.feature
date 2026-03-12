@BizomWebAPI @MdmsManagement @AllTables @WorkflowAutomation @OS
Feature: All Tables API Testing
  As a system user
  I want to test the all tables endpoint
  So that I can ensure proper functionality and data retrieval for all table names

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get all tables without access token
    When I send the GET request to "all_tables" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get all tables with invalid access token
    And I send the GET request to "all_tables" endpoint with dynamic access token and query parameters
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
  Scenario: Get all tables with expired access token
    And I send the GET request to "all_tables" endpoint with dynamic access token and query parameters
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
  Scenario: Get all tables with malformed access token
    And I send the GET request to "all_tables" endpoint with dynamic access token and query parameters
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
  Scenario: Get all tables with valid access token
    And I send the GET request to "all_tables" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
      |$.data[0]|string|
    And I store the response as "all_tables_response" name using full path

  @Positive @DataValidation
  Scenario: Validate all tables response structure
    And I send the GET request to "all_tables" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
      |$.data[0]|string|
      |$.data[1]|string|
      |$.data[2]|string|

  @Positive @DataValidation
  Scenario: Validate all tables array content
    And I send the GET request to "all_tables" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
      |$.data[0]|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data[0]|activities|
      |$.data[1]|activityformdatas|
      |$.data[2]|activityformdatatypes|

  @Positive @DataValidation
  Scenario: Validate all tables with static values
    And I send the GET request to "all_tables" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data[0]|activities|
      |$.data[1]|activityformdatas|
      |$.data[2]|activityformdatatypes|
      |$.data[3]|activityformfields|
      |$.data[4]|activityformfieldtypes|
      |$.data[5]|activitypictures|
      |$.data[6]|activitytypes|

  @Positive @Performance
  Scenario: Performance test for all tables endpoint
    And I send the GET request to "all_tables" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

  @Positive @Concurrency
  Scenario: Concurrent access test for all tables endpoint
    And I send the GET request to "all_tables" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
      |$.data[0]|string|
      |$.data[1]|string|
      |$.data[2]|string|

  @Negative @Validation
  Scenario: Get all tables with invalid query parameters
    And I send the GET request to "all_tables" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

  @Negative @Validation
  Scenario: Get all tables with special characters in query parameters
    And I send the GET request to "all_tables" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

  @Negative @Security
  Scenario: Get all tables with SQL injection attempt
    And I send the GET request to "all_tables" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE mdms; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

  @Negative @Boundary
  Scenario: Get all tables with maximum query parameters
    And I send the GET request to "all_tables" endpoint with dynamic access token and query parameters
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
      |$.data|array|
      |$.data[0]|string|

#  @Negative @ErrorHandling
#  Scenario: Get all tables with invalid endpoint
#    And I send the GET request to "all_tables_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

  @Positive @BusinessLogic
  Scenario: Validate all tables business logic
    And I send the GET request to "all_tables" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
      |$.data[0]|string|
      |$.data[1]|string|
      |$.data[2]|string|

  @Positive @DataIntegrity
  Scenario: Validate all tables data integrity
    And I send the GET request to "all_tables" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
      |$.data[0]|string|
      |$.data[1]|string|
      |$.data[2]|string|
    And validating the response contains the following values
      |Value|
      |data|
      |activities|
      |activityformdatas|
      |activityformdatatypes|
      |activityformfields|
      |activityformfieldtypes|
      |activitypictures|
      |activitytypes|
      |areas|
      |beats|
      |brands|
      |categories|
      |outlets|
      |users|
      |zones|

  @Positive @Regression
  Scenario: Regression test for all tables endpoint
    And I send the GET request to "all_tables" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
      |$.data[0]|string|
      |$.data[1]|string|
      |$.data[2]|string|

  @Positive @Functional
  Scenario: Validate all tables response completeness
    And I send the GET request to "all_tables" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
      |$.data[0]|string|
      |$.data[1]|string|
      |$.data[2]|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data[0]|activities|
      |$.data[1]|activityformdatas|
      |$.data[2]|activityformdatatypes|
      |$.data[3]|activityformfields|
      |$.data[4]|activityformfieldtypes|
      |$.data[5]|activitypictures|
      |$.data[6]|activitytypes|

  @Positive @ArrayValidation
  Scenario: Validate all tables array structure and content
    And I send the GET request to "all_tables" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
      |$.data[0]|string|
      |$.data[1]|string|
      |$.data[2]|string|
      |$.data[3]|string|
      |$.data[4]|string|
      |$.data[5]|string|
      |$.data[6]|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data[0]|activities|
      |$.data[1]|activityformdatas|
      |$.data[2]|activityformdatatypes|
      |$.data[3]|activityformfields|
      |$.data[4]|activityformfieldtypes|
      |$.data[5]|activitypictures|
      |$.data[6]|activitytypes|

  @Positive @ContentValidation
  Scenario: Validate all tables content structure
    And I send the GET request to "all_tables" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |data|
      |activities|
      |activityformdatas|
      |activityformdatatypes|
      |activityformfields|
      |activityformfieldtypes|
      |activitypictures|
      |activitytypes|
      |areas|
      |beats|
      |brands|
      |categories|
      |outlets|
      |users|
      |zones|

  @Positive @LoadTesting
  Scenario: Load testing for all tables endpoint
    And I send the GET request to "all_tables" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

  @Negative @Timeout
  Scenario: Test all tables endpoint timeout handling
    And I send the GET request to "all_tables" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

  @Positive @EndToEnd
  Scenario: End-to-end all tables data retrieval workflow
    And I send the GET request to "all_tables" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
      |$.data[0]|string|
      |$.data[1]|string|
      |$.data[2]|string|
    And I store the response as "all_tables_response" name using full path
    And validating the response contains the following values
      |Value|
      |data|
      |activities|
      |activityformdatas|
      |activityformdatatypes|
      |activityformfields|
      |activityformfieldtypes|
      |activitypictures|
      |activitytypes|
      |areas|
      |beats|
      |brands|
      |categories|
      |outlets|
      |users|
      |zones|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data[0]|activities|
      |$.data[1]|activityformdatas|
      |$.data[2]|activityformdatatypes|
      |$.data[3]|activityformfields|
      |$.data[4]|activityformfieldtypes|
      |$.data[5]|activitypictures|
      |$.data[6]|activitytypes|

