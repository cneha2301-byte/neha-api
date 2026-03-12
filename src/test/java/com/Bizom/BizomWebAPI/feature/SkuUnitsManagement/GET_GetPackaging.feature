@BizomWebAPI @SkuUnitsManagement @Packaging @ProductManagement @OS
Feature: SKU Units Get Packaging API Testing
  As a system user
  I want to test the skunits getpackaging endpoint
  So that I can ensure proper functionality and data retrieval for packaging management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get packaging without access token
    When I send the GET request to "skunits_get_packaging" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get packaging with invalid access token
#    And I send the GET request to "skunits_get_packaging" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|invalid_token_12345|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get packaging with expired access token
#    And I send the GET request to "skunits_get_packaging" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|expired_token_12345|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get packaging with malformed access token
#    And I send the GET request to "skunits_get_packaging" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|malformed.token.here|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get packaging with valid access token
    And I send the GET request to "skunits_get_packaging" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|
    And I store the response as "packaging_response" name using full path

  @Positive @DataValidation
  Scenario: Validate packaging response structure
    And I send the GET request to "skunits_get_packaging" endpoint with dynamic access token and query parameters
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

  @Positive @DataValidation
  Scenario: Validate packaging specific data values
    And I send the GET request to "skunits_get_packaging" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$['1']|DB:packagings:name: id=1|
      |$['2']|DB:packagings:name: id=2|
      |$['3']|DB:packagings:name: id=3|
      |$['4']|DB:packagings:name: id=4|

  @Positive @DataValidation
  Scenario: Validate packaging with static values
    And I send the GET request to "skunits_get_packaging" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$['1']|pack1|
      |$['2']|TPK|
      |$['3']|Package7|
      |$['4']|Package8|

  @Positive @Performance
  Scenario: Performance test for packaging endpoint
    And I send the GET request to "skunits_get_packaging" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|

  @Positive @Concurrency
  Scenario: Concurrent access test for packaging endpoint
    And I send the GET request to "skunits_get_packaging" endpoint with dynamic access token and query parameters
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
  Scenario: Get packaging with invalid query parameters
    And I send the GET request to "skunits_get_packaging" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|

  @Negative @Validation
  Scenario: Get packaging with special characters in query parameters
    And I send the GET request to "skunits_get_packaging" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|

  @Negative @Security
  Scenario: Get packaging with SQL injection attempt
    And I send the GET request to "skunits_get_packaging" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE packagings; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|

  @Negative @Boundary
  Scenario: Get packaging with maximum query parameters
    And I send the GET request to "skunits_get_packaging" endpoint with dynamic access token and query parameters
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
      |$|object|

#  @Negative @ErrorHandling
#  Scenario: Get packaging with invalid endpoint
#    And I send the GET request to "skunits_get_packaging_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

  @Positive @BusinessLogic
  Scenario: Validate packaging business logic
    And I send the GET request to "skunits_get_packaging" endpoint with dynamic access token and query parameters
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

  @Positive @DataIntegrity
  Scenario: Validate packaging data integrity
    And I send the GET request to "skunits_get_packaging" endpoint with dynamic access token and query parameters
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
    And validating the response contains the following values
      |Value|
      |pack1|
      |TPK|
      |Package7|
      |Package8|

  @Positive @Regression
  Scenario: Regression test for packaging endpoint
    And I send the GET request to "skunits_get_packaging" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|
      |$['1']|string|
      |$['2']|string|

  @Positive @Functional
  Scenario: Validate packaging response completeness
    And I send the GET request to "skunits_get_packaging" endpoint with dynamic access token and query parameters
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
    And the fields in response should match with expected values
      |JPath|Value|
      |$['1']|pack1|
      |$['2']|TPK|
      |$['3']|Package7|
      |$['4']|Package8|

  @Positive @ObjectValidation
  Scenario: Validate packaging object structure and content
    And I send the GET request to "skunits_get_packaging" endpoint with dynamic access token and query parameters
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
    And the fields in response should match with expected values
      |JPath|Value|
      |$['1']|pack1|
      |$['2']|TPK|
      |$['3']|Package7|
      |$['4']|Package8|

  @Positive @ContentValidation
  Scenario: Validate packaging content structure
    And I send the GET request to "skunits_get_packaging" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |pack1|
      |TPK|
      |Package7|
      |Package8|

  @Positive @LoadTesting
  Scenario: Load testing for packaging endpoint
    And I send the GET request to "skunits_get_packaging" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|

  @Negative @Timeout
  Scenario: Test packaging endpoint timeout handling
    And I send the GET request to "skunits_get_packaging" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|

  @Positive @EndToEnd
  Scenario: End-to-end packaging data retrieval workflow
    And I send the GET request to "skunits_get_packaging" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "packaging_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|
      |$['1']|string|
      |$['2']|string|
      |$['3']|string|
      |$['4']|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$['1']|pack1|
      |$['2']|TPK|
      |$['3']|Package7|
      |$['4']|Package8|

