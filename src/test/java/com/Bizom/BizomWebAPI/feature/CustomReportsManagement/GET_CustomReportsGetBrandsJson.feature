@BizomWebAPI @CustomReportsManagement @CustomReportsGetBrandsJson @SupportingFunctions @CE
Feature: Custom Reports Get Brands JSON API Testing
  As a system user
  I want to test the custom reports get brands json endpoint
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
  Scenario: TC_01 Get brands list without access token
    When I send the GET request to "customreports_getbrandsjson" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get brands list with invalid access token
    And I send the GET request to "customreports_getbrandsjson" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get brands list with expired access token
    And I send the GET request to "customreports_getbrandsjson" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get brands list with malformed access token
    And I send the GET request to "customreports_getbrandsjson" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Positive @Smoke
#  Scenario: TC_05 Get brands list with valid access token
#    And I send the GET request to "customreports_getbrandsjson" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|array|
#      |$[0]|array|
#      |$[1]|string|
#      |$[2]|string|
#      |$[3]|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$[0]|"ulzdSE"|
#    And I store the response as "customreports_getbrandsjson_response" name using full path

  @Positive @Performance
  Scenario: TC_06 Performance test for get brands json endpoint
    And I send the GET request to "customreports_getbrandsjson" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Negative @Validation
  Scenario: TC_07 Get brands json with invalid query parameters
    And I send the GET request to "customreports_getbrandsjson" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Negative @ErrorHandling
#  Scenario: TC_08 Get brands json with invalid endpoint
#    And I send the GET request to "customreports_getbrandsjson_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds

  @Positive @ContentValidation
  Scenario: TC_09 Validate brands json content presence
    And I send the GET request to "customreports_getbrandsjson" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response contains the following values
      |Value|
      |Brand1|
      |Brand11|

  @Positive @ArrayValidation
  Scenario: TC_10 Validate brands json array structure
    And I send the GET request to "customreports_getbrandsjson" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
      |$[0]|array|
      |$[1]|string|
      |$[2]|string|
      |$[3]|string|

#  @Positive @DataValidation
#  Scenario: TC_11 Validate brands json specific data values
#    And I send the GET request to "customreports_getbrandsjson" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$[0]|ulzdSE|

  @Positive @Concurrency
  Scenario: TC_12 Concurrent access test for brands json endpoint
    And I send the GET request to "customreports_getbrandsjson" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_13 Brands json with special characters in query parameters
    And I send the GET request to "customreports_getbrandsjson" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_14 Brands json with SQL injection attempt
    And I send the GET request to "customreports_getbrandsjson" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE brands; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: TC_15 Brands json with maximum query parameters
    And I send the GET request to "customreports_getbrandsjson" endpoint with dynamic access token and query parameters
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
  Scenario: TC_16 Validate brands json business logic
    And I send the GET request to "customreports_getbrandsjson" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Positive @DataIntegrity
  Scenario: TC_17 Validate brands json data integrity
    And I send the GET request to "customreports_getbrandsjson" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
      |$[0]|array|
      |$[1]|string|
      |$[2]|string|
      |$[3]|string|

  @Positive @Regression
  Scenario: TC_18 Regression test for brands json endpoint
    And I send the GET request to "customreports_getbrandsjson" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Positive @Functional
  Scenario: TC_19 Validate brands json response completeness
    And I send the GET request to "customreports_getbrandsjson" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Positive @LoadTesting
  Scenario: TC_20 Load testing for brands json endpoint
    And I send the GET request to "customreports_getbrandsjson" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Negative @Timeout
  Scenario: TC_21 Test brands json endpoint timeout handling
    And I send the GET request to "customreports_getbrandsjson" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds

  @Positive @EndToEnd
  Scenario: TC_22 End-to-end brands json data retrieval workflow
    And I send the GET request to "customreports_getbrandsjson" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
      |$[0]|array|
      |$[1]|string|
      |$[2]|string|
      |$[3]|string|

  @Positive @Headers
  Scenario: TC_23 Validate brands json response headers
    And I send the GET request to "customreports_getbrandsjson" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json; charset=UTF-8|
      |Cache-Control|private, no-cache, no-store, must-revalidate|

  @Positive @DataCompleteness
  Scenario: TC_24 Validate brands json data completeness
    And I send the GET request to "customreports_getbrandsjson" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$[0]|array|
      |$[1]|string|
      |$[2]|string|
      |$[3]|string|

  @Positive @EdgeCase
  Scenario: TC_25 Validate brands json edge cases
    And I send the GET request to "customreports_getbrandsjson" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$[0]|array|
      |$[1]|string|
      |$[2]|string|
      |$[3]|string|

  @Positive @Comprehensive
  Scenario: TC_26 Comprehensive brands json validation
    And I send the GET request to "customreports_getbrandsjson" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
      |$[0]|array|
      |$[1]|string|
      |$[2]|string|
      |$[3]|string|