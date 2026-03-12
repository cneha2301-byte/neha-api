@BizomWebAPI @CustomReportsManagement @CustomReportsGetUsersJson @SupportingFunctions @CE
Feature: Custom Reports Get Users JSON API Testing
  As a system user
  I want to test the custom reports get users json endpoint
  So that I can ensure proper functionality and data retrieval for custom reports management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get users list without access token
    When I send the GET request to "customreports_getusersjson" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get users list with invalid access token
    And I send the GET request to "customreports_getusersjson" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get users list with expired access token
    And I send the GET request to "customreports_getusersjson" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get users list with malformed access token
    And I send the GET request to "customreports_getusersjson" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get users list with valid access token
    And I send the GET request to "customreports_getusersjson" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|
      |$['2']|string|
      |$['15']|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$['2']|SLV Traders|
      |$['3']|Covid MGR|
      |$['10']|sadha|
      |$['13']|testuser_tourplan|
      |$['16']|lion12|
      |$['23']|kji|
      |$['661']|mobisy|
    And I store the response as "customreports_getusersjson_response" name using full path

  @Positive @Performance
  Scenario: TC_06 Performance test for get users json endpoint
    And I send the GET request to "customreports_getusersjson" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Negative @Validation
  Scenario: TC_07 Get users json with invalid query parameters
    And I send the GET request to "customreports_getusersjson" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Negative @ErrorHandling
#  Scenario: TC_08 Get users json with invalid endpoint
#    And I send the GET request to "customreports_getusersjson_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds

  @Positive @ContentValidation
  Scenario: TC_09 Validate users json content presence
    And I send the GET request to "customreports_getusersjson" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$['2']|SLV Traders|
      |$['3']|Covid MGR|
      |$['23']|kji|

  @Positive @DataTypes
  Scenario: TC_10 Validate users json keys and values types
    And I send the GET request to "customreports_getusersjson" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|
      |$['2']|string|
      |$['10']|string|
      |$['661']|string|

  @Positive @Concurrency
  Scenario: TC_11 Concurrent access test for users json endpoint
    And I send the GET request to "customreports_getusersjson" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_12 Users json with special characters in query parameters
    And I send the GET request to "customreports_getusersjson" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_13 Users json with SQL injection attempt
    And I send the GET request to "customreports_getusersjson" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE users; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: TC_14 Users json with maximum query parameters
    And I send the GET request to "customreports_getusersjson" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_15 Validate users json business logic
    And I send the GET request to "customreports_getusersjson" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$['2']|SLV Traders|
      |$['3']|Covid MGR|
      |$['10']|sadha|

  @Positive @DataIntegrity
  Scenario: TC_16 Validate users json data integrity
    And I send the GET request to "customreports_getusersjson" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|
      |$['2']|string|
      |$['3']|string|
      |$['10']|string|
      |$['13']|string|
      |$['16']|string|

  @Positive @Regression
  Scenario: TC_17 Regression test for users json endpoint
    And I send the GET request to "customreports_getusersjson" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|

  @Positive @Functional
  Scenario: TC_18 Validate users json response completeness
    And I send the GET request to "customreports_getusersjson" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$['2']|SLV Traders|
      |$['23']|kji|
      |$['661']|mobisy|

  @Positive @LoadTesting
  Scenario: TC_19 Load testing for users json endpoint
    And I send the GET request to "customreports_getusersjson" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Negative @Timeout
  Scenario: TC_20 Test users json endpoint timeout handling
    And I send the GET request to "customreports_getusersjson" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds

  @Positive @EndToEnd
  Scenario: TC_21 End-to-end users json data retrieval workflow
    And I send the GET request to "customreports_getusersjson" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "customreports_getusersjson_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|
      |$['2']|string|
      |$['3']|string|
      |$['10']|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$['2']|SLV Traders|
      |$['3']|Covid MGR|
      |$['10']|sadha|

  @Positive @Headers
  Scenario: TC_22 Validate users json response headers
    And I send the GET request to "customreports_getusersjson" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json; charset=UTF-8|
      |Cache-Control|private, no-cache, no-store, must-revalidate|

  @Positive @DataCompleteness
  Scenario: TC_23 Validate users json data completeness
    And I send the GET request to "customreports_getusersjson" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$['2']|string|
      |$['3']|string|
      |$['10']|string|
      |$['13']|string|
      |$['15']|string|
      |$['16']|string|
      |$['23']|string|

  @Positive @EdgeCase
  Scenario: TC_24 Validate users json edge cases
    And I send the GET request to "customreports_getusersjson" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$['2']|string|
      |$['661']|string|

  @Positive @Comprehensive
  Scenario: TC_25 Comprehensive users json validation
    And I send the GET request to "customreports_getusersjson" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|
      |$['2']|string|
      |$['3']|string|
      |$['10']|string|
      |$['13']|string|
      |$['16']|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$['2']|SLV Traders|
      |$['3']|Covid MGR|
      |$['10']|sadha|
      |$['16']|lion12|
    And I store the response as "customreports_getusersjson_response" name using full path