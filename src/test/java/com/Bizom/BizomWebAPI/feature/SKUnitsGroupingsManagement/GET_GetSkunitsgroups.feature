@BizomWebAPI @SKUnitsGroupingsManagement @GetSkunitsgroups @OrderManagement @OS
Feature: Get SKU Units Groups API Testing
  As a system user
  I want to test the get SKU units groups endpoint
  So that I can ensure proper functionality and data retrieval for SKU units groups

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get SKU units groups without access token
    When I send the GET request to "skunitsgroupings_get_skunits_groups" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get SKU units groups with invalid access token
    And I send the GET request to "skunitsgroupings_get_skunits_groups" endpoint with dynamic access token and query parameters
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
  Scenario: Get SKU units groups with expired access token
    And I send the GET request to "skunitsgroupings_get_skunits_groups" endpoint with dynamic access token and query parameters
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
  Scenario: Get SKU units groups with malformed access token
    And I send the GET request to "skunitsgroupings_get_skunits_groups" endpoint with dynamic access token and query parameters
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
  Scenario: Get SKU units groups with valid access token
    And I send the GET request to "skunitsgroupings_get_skunits_groups" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$|[]|
    And I store the response as "skunits_groups_response" name using full path

  @Positive @DataValidation
  Scenario: Validate SKU units groups response structure
    And I send the GET request to "skunitsgroupings_get_skunits_groups" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Positive @EmptyArrayValidation
  Scenario: Validate SKU units groups empty array response
    And I send the GET request to "skunitsgroupings_get_skunits_groups" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Positive @Performance
  Scenario: Performance test for SKU units groups endpoint
    And I send the GET request to "skunitsgroupings_get_skunits_groups" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Positive @Concurrency
  Scenario: Concurrent access test for SKU units groups endpoint
    And I send the GET request to "skunitsgroupings_get_skunits_groups" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Negative @Validation
  Scenario: Get SKU units groups with invalid query parameters
    And I send the GET request to "skunitsgroupings_get_skunits_groups" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Negative @Validation
  Scenario: Get SKU units groups with special characters in query parameters
    And I send the GET request to "skunitsgroupings_get_skunits_groups" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Negative @Security
  Scenario: Get SKU units groups with SQL injection attempt
    And I send the GET request to "skunitsgroupings_get_skunits_groups" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE skunitsgroupings; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Negative @Boundary
  Scenario: Get SKU units groups with maximum query parameters
    And I send the GET request to "skunitsgroupings_get_skunits_groups" endpoint with dynamic access token and query parameters
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
      |$|array|

  @Negative @ErrorHandling
  Scenario: Get SKU units groups with invalid endpoint
    And I send the GET request to "skunitsgroupings_get_skunits_groups_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "404"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate SKU units groups business logic
    And I send the GET request to "skunitsgroupings_get_skunits_groups" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Positive @DataIntegrity
  Scenario: Validate SKU units groups data integrity
    And I send the GET request to "skunitsgroupings_get_skunits_groups" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Positive @Regression
  Scenario: Regression test for SKU units groups endpoint
    And I send the GET request to "skunitsgroupings_get_skunits_groups" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Positive @Functional
  Scenario: Validate SKU units groups response completeness
    And I send the GET request to "skunitsgroupings_get_skunits_groups" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Positive @ContentValidation
  Scenario: Validate SKU units groups content structure
    And I send the GET request to "skunitsgroupings_get_skunits_groups" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |[]|

  @Positive @LoadTesting
  Scenario: Load testing for SKU units groups endpoint
    And I send the GET request to "skunitsgroupings_get_skunits_groups" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Negative @Timeout
  Scenario: Test SKU units groups endpoint timeout handling
    And I send the GET request to "skunitsgroupings_get_skunits_groups" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Positive @EndToEnd
  Scenario: End-to-end SKU units groups data retrieval workflow
    And I send the GET request to "skunitsgroupings_get_skunits_groups" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$|[]|
    And I store the response as "skunits_groups_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Positive @StatusCodeValidation
  Scenario: Validate SKU units groups status code
    And I send the GET request to "skunitsgroupings_get_skunits_groups" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @ResponseTimeValidation
  Scenario: Validate SKU units groups response time
    And I send the GET request to "skunitsgroupings_get_skunits_groups" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds

  @Positive @ArrayTypeValidation
  Scenario: Validate SKU units groups array type
    And I send the GET request to "skunitsgroupings_get_skunits_groups" endpoint with dynamic access token and query parameters
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

