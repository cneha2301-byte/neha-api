@BizomWebAPI @TransportersManagement @Transporters @UserManagement
Feature: Transporters Get Transporters API Testing
  As a system user
  I want to test the transporters getTransporters endpoint
  So that I can ensure proper functionality and data retrieval for transporters management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get transporters without access token
    When I send the GET request to "transporters_get_transporters" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get transporters with invalid access token
    And I send the GET request to "transporters_get_transporters" endpoint with dynamic access token and query parameters
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
  Scenario: Get transporters with expired access token
    And I send the GET request to "transporters_get_transporters" endpoint with dynamic access token and query parameters
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
  Scenario: Get transporters with malformed access token
    And I send the GET request to "transporters_get_transporters" endpoint with dynamic access token and query parameters
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
  Scenario: Get transporters with valid access token
    And I send the GET request to "transporters_get_transporters" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|No data found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.transporters|array|
    And I store the response as "transporters_response" name using full path

  @Positive @DataValidation
  Scenario: Validate transporters response structure
    And I send the GET request to "transporters_get_transporters" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|No data found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.transporters|array|

  @Positive @DataValidation
  Scenario: Validate transporters specific data values
    And I send the GET request to "transporters_get_transporters" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|No data found|
      |$.transporters|[]|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.result|false|
      |$.reason|No data found|

  @Positive @DataValidation
  Scenario: Validate transporters with static values
    And I send the GET request to "transporters_get_transporters" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|No data found|
      |$.transporters|[]|

  @Positive @Performance
  Scenario: Performance test for transporters endpoint
    And I send the GET request to "transporters_get_transporters" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|No data found|

  @Positive @Concurrency
  Scenario: Concurrent access test for transporters endpoint
    And I send the GET request to "transporters_get_transporters" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|No data found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.transporters|array|

  @Negative @Validation
  Scenario: Get transporters with invalid query parameters
    And I send the GET request to "transporters_get_transporters" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|No data found|

  @Negative @Validation
  Scenario: Get transporters with special characters in query parameters
    And I send the GET request to "transporters_get_transporters" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|No data found|

  @Negative @Security
  Scenario: Get transporters with SQL injection attempt
    And I send the GET request to "transporters_get_transporters" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE transporters; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|No data found|

  @Negative @Boundary
  Scenario: Get transporters with maximum query parameters
    And I send the GET request to "transporters_get_transporters" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|No data found|

#  @Negative @ErrorHandling
#  Scenario: Get transporters with invalid endpoint
#    And I send the GET request to "transporters_get_transporters_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

  @Positive @BusinessLogic
  Scenario: Validate transporters business logic
    And I send the GET request to "transporters_get_transporters" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|No data found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.transporters|array|

  @Positive @DataIntegrity
  Scenario: Validate transporters data integrity
    And I send the GET request to "transporters_get_transporters" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.transporters|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|No data found|
      |$.transporters|[]|
    And validating the response contains the following values
      |Value|
      |result|
      |reason|
      |transporters|
      |No data found|

  @Positive @Regression
  Scenario: Regression test for transporters endpoint
    And I send the GET request to "transporters_get_transporters" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|No data found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.transporters|array|

  @Positive @Functional
  Scenario: Validate transporters response completeness
    And I send the GET request to "transporters_get_transporters" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.transporters|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|No data found|
      |$.transporters|[]|

  @Positive @ArrayValidation
  Scenario: Validate transporters array structure and content
    And I send the GET request to "transporters_get_transporters" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.transporters|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|No data found|
      |$.transporters|[]|

  @Positive @ContentValidation
  Scenario: Validate transporters content structure
    And I send the GET request to "transporters_get_transporters" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|No data found|
    And validating the response contains the following values
      |Value|
      |result|
      |reason|
      |transporters|
      |No data found|

  @Positive @LoadTesting
  Scenario: Load testing for transporters endpoint
    And I send the GET request to "transporters_get_transporters" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|No data found|

  @Negative @Timeout
  Scenario: Test transporters endpoint timeout handling
    And I send the GET request to "transporters_get_transporters" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|No data found|

  @Positive @EndToEnd
  Scenario: End-to-end transporters data retrieval workflow
    And I send the GET request to "transporters_get_transporters" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "transporters_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.transporters|array|
    And validating the response contains the following values
      |Value|
      |result|
      |reason|
      |transporters|
      |No data found|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|No data found|
      |$.transporters|[]|

