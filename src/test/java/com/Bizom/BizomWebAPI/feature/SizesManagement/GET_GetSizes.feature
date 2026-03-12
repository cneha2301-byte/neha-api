@BizomWebAPI @CE @SizesManagement @GetSizes @WarehouseOperations
Feature: Get Sizes API Testing
  As a system user
  I want to test the get sizes endpoint
  So that I can ensure proper functionality and data retrieval for sizes management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Cache-Control|max-age=0|

  @Negative @Security
  Scenario: Get sizes without access token
    When I send the GET request to "sizes_get" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get sizes with invalid access token
    And I send the GET request to "sizes_get" endpoint with dynamic access token and query parameters
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
  Scenario: Get sizes with expired access token
    And I send the GET request to "sizes_get" endpoint with dynamic access token and query parameters
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
  Scenario: Get sizes with malformed access token
    And I send the GET request to "sizes_get" endpoint with dynamic access token and query parameters
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
  Scenario: Get sizes with valid access token
    And I send the GET request to "sizes_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|
      |$['1']|string|
      |$['2']|string|
    And I store the response as "sizes_get_response" name using full path

  @Positive @DataValidation
  Scenario: Validate sizes response structure and types
    And I send the GET request to "sizes_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|
      |$['1']|string|
      |$['2']|string|
      |$['3']|string|
      |$['4']|string|
      |$['5']|string|

#  @Positive @DataValidation
#  Scenario: Validate sizes specific data values
#    And I send the GET request to "sizes_get" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$['1']|s1|
#      |$['2']|200|
#      |$['3']|100|

#  @Positive @DataValidation
#  Scenario: Validate sizes with static values
#    And I send the GET request to "sizes_get" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|object|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$['1']|s1|
#      |$['2']|200|
#      |$['3']|100|
#      |$['4']|200|
#      |$['5']|200|

  @Positive @Performance
  Scenario: Performance test for get sizes endpoint
    And I send the GET request to "sizes_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|

  @Positive @Concurrency
  Scenario: Concurrent access test for get sizes endpoint
    And I send the GET request to "sizes_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|
      |$['1']|string|
      |$['2']|string|

  @Negative @Validation
  Scenario: Get sizes with invalid query parameters
    And I send the GET request to "sizes_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|

  @Negative @Validation
  Scenario: Get sizes with special characters in query parameters
    And I send the GET request to "sizes_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|

  @Negative @Security
  Scenario: Get sizes with SQL injection attempt
    And I send the GET request to "sizes_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE sizes; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|

  @Negative @Boundary
  Scenario: Get sizes with maximum query parameters
    And I send the GET request to "sizes_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
      |param6|value6|
      |param7|value7|
      |param8|value8|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|

  @Negative @ErrorHandling
  Scenario: Get sizes with invalid endpoint
    And I send the GET request to "sizes_get_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "404"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate sizes business logic
    And I send the GET request to "sizes_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|
      |$['1']|string|
      |$['2']|string|
    And validating the response contains the following values
      |Value|
      |s1|
      |200|
      |100|

  @Positive @DataIntegrity
  Scenario: Validate sizes data integrity
    And I send the GET request to "sizes_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|
      |$['1']|string|
      |$['2']|string|
    And validating the response contains the following values
      |Value|
      |s1|
      |200|
      |100|

  @Positive @Regression
  Scenario: Regression test for get sizes endpoint
    And I send the GET request to "sizes_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|
      |$['1']|string|
      |$['2']|string|

#  @Positive @Functional
#  Scenario: Validate sizes response completeness
#    And I send the GET request to "sizes_get" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|object|
#      |$['1']|string|
#      |$['2']|string|
#      |$['3']|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$['1']|s1|
#      |$['2']|200|
#      |$['3']|100|

  @Positive @ContentValidation
  Scenario: Validate sizes content structure
    And I send the GET request to "sizes_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |s1|
      |200|
      |100|
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|
      |$['1']|string|
      |$['2']|string|
      |$['3']|string|

  @Positive @LoadTesting
  Scenario: Load testing for get sizes endpoint
    And I send the GET request to "sizes_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|

  @Negative @Timeout
  Scenario: Test get sizes endpoint timeout handling
    And I send the GET request to "sizes_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|

#  @Positive @EndToEnd
#  Scenario: End-to-end sizes data retrieval workflow
#    And I send the GET request to "sizes_get" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|object|
#      |$['1']|string|
#      |$['2']|string|
#      |$['3']|string|
#    And I store the response as "sizes_get_response" name using full path
#    And validating the response contains the following values
#      |Value|
#      |s1|
#      |200|
#      |100|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$['1']|s1|
#      |$['2']|200|
#      |$['3']|100|

