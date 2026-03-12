@BizomWebAPI @MappingsManagement @GetAllMappings @WorkflowAutomation @Innovation
Feature: Get All Mappings API Testing
  As a system user
  I want to test the get all mappings endpoint
  So that I can ensure proper functionality and data retrieval for all mappings

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get all mappings without access token
    When I send the GET request to "get_all_mappings" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get all mappings with invalid access token
    And I send the GET request to "get_all_mappings" endpoint with dynamic access token and query parameters
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
  Scenario: Get all mappings with expired access token
    And I send the GET request to "get_all_mappings" endpoint with dynamic access token and query parameters
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
  Scenario: Get all mappings with malformed access token
    And I send the GET request to "get_all_mappings" endpoint with dynamic access token and query parameters
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
  Scenario: Get all mappings with valid access token
    And I send the GET request to "get_all_mappings" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
      |$.status|200|
    And I store the response as "get_all_mappings_response" name using full path

  @Positive @DataValidation
  Scenario: Validate get all mappings response structure
    And I send the GET request to "get_all_mappings" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
      |$.status|200|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|object|
      |$.data.getAllMappings|array|
      |$.status|number|

  @Positive @DataValidation
  Scenario: Validate get all mappings nested data object structure
    And I send the GET request to "get_all_mappings" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data.getAllMappings|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
      |$.status|200|
      |$.data.getAllMappings|[]|

  @Positive @DataValidation
  Scenario: Validate get all mappings with static values
    And I send the GET request to "get_all_mappings" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
      |$.status|200|
      |$.data.getAllMappings|[]|

  @Positive @Performance
  Scenario: Performance test for get all mappings endpoint
    And I send the GET request to "get_all_mappings" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
      |$.status|200|

  @Positive @Concurrency
  Scenario: Concurrent access test for get all mappings endpoint
    And I send the GET request to "get_all_mappings" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
      |$.status|200|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|object|
      |$.data.getAllMappings|array|
      |$.status|number|

  @Negative @Validation
  Scenario: Get all mappings with invalid query parameters
    And I send the GET request to "get_all_mappings" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
      |$.status|200|

  @Negative @Validation
  Scenario: Get all mappings with special characters in query parameters
    And I send the GET request to "get_all_mappings" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
      |$.status|200|

  @Negative @Security
  Scenario: Get all mappings with SQL injection attempt
    And I send the GET request to "get_all_mappings" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE mappings; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
      |$.status|200|

  @Negative @Boundary
  Scenario: Get all mappings with maximum query parameters
    And I send the GET request to "get_all_mappings" endpoint with dynamic access token and query parameters
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
      |$.result|true|
      |$.reason|""|
      |$.status|200|

#  @Negative @ErrorHandling
#  Scenario: Get all mappings with invalid endpoint
#    And I send the GET request to "get_all_mappings_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate get all mappings business logic
    And I send the GET request to "get_all_mappings" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
      |$.status|200|

  @Positive @DataIntegrity
  Scenario: Validate get all mappings data integrity
    And I send the GET request to "get_all_mappings" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|object|
      |$.data.getAllMappings|array|
      |$.status|number|
    And validating the response contains the following values
      |Value|
      |result|
      |reason|
      |data|
      |getAllMappings|
      |status|

  @Positive @Regression
  Scenario: Regression test for get all mappings endpoint
    And I send the GET request to "get_all_mappings" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
      |$.status|200|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|object|
      |$.data.getAllMappings|array|
      |$.status|number|

  @Positive @Functional
  Scenario: Validate get all mappings response completeness
    And I send the GET request to "get_all_mappings" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|object|
      |$.data.getAllMappings|array|
      |$.status|number|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
      |$.status|200|
      |$.data.getAllMappings|[]|

  @Positive @ArrayValidation
  Scenario: Validate get all mappings array structure and content
    And I send the GET request to "get_all_mappings" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|object|
      |$.data.getAllMappings|array|
      |$.status|number|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
      |$.status|200|
      |$.data.getAllMappings|[]|

  @Positive @ContentValidation
  Scenario: Validate get all mappings content structure
    And I send the GET request to "get_all_mappings" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
      |$.status|200|
    And validating the response contains the following values
      |Value|
      |result|
      |reason|
      |data|
      |getAllMappings|
      |status|

  @Positive @LoadTesting
  Scenario: Load testing for get all mappings endpoint
    And I send the GET request to "get_all_mappings" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
      |$.status|200|

  @Negative @Timeout
  Scenario: Test get all mappings endpoint timeout handling
    And I send the GET request to "get_all_mappings" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
      |$.status|200|

  @Positive @EndToEnd
  Scenario: End-to-end get all mappings data retrieval workflow
    And I send the GET request to "get_all_mappings" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
      |$.status|200|
      |$.data.getAllMappings|[]|
    And I store the response as "get_all_mappings_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|object|
      |$.data.getAllMappings|array|
      |$.status|number|

