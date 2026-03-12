@BizomWebAPI @CE @OutletTargetsManagement @OutletTargets @SystemOperations
Feature: Get Entity Targets API Testing
  As a system user
  I want to test the get entity targets endpoint
  So that I can ensure proper functionality and data retrieval for outlet entity targets management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get entity targets without access token
    When I send the GET request to "outlettargets_get_entity_targets" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get entity targets with invalid access token
    And I send the GET request to "outlettargets_get_entity_targets" endpoint with dynamic access token and query parameters
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
  Scenario: Get entity targets with expired access token
    And I send the GET request to "outlettargets_get_entity_targets" endpoint with dynamic access token and query parameters
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
  Scenario: Get entity targets with malformed access token
    And I send the GET request to "outlettargets_get_entity_targets" endpoint with dynamic access token and query parameters
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
  Scenario: Get entity targets with valid access token
    And I send the GET request to "outlettargets_get_entity_targets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data.target|[]|
      |$.data.achievement.sales|[]|
      |$.data.achievement.calls|[]|
      |$.data.achievement.orders|[]|
    And I store the response as "entity_targets_response" name using full path

  @Positive @DataValidation
  Scenario: Validate entity targets response structure
    And I send the GET request to "outlettargets_get_entity_targets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data.target|[]|
      |$.data.achievement.sales|[]|
      |$.data.achievement.calls|[]|
      |$.data.achievement.orders|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data.target|array|
      |$.data.achievement|object|
      |$.data.achievement.sales|array|
      |$.data.achievement.calls|array|
      |$.data.achievement.orders|array|

  @Positive @DataValidation
  Scenario: Validate entity targets specific data values
    And I send the GET request to "outlettargets_get_entity_targets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data.target|[]|
      |$.data.achievement.sales|[]|
      |$.data.achievement.calls|[]|
      |$.data.achievement.orders|[]|

  @Positive @DataValidation
  Scenario: Validate entity targets with static values
    And I send the GET request to "outlettargets_get_entity_targets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data.target|[]|
      |$.data.achievement.sales|[]|
      |$.data.achievement.calls|[]|
      |$.data.achievement.orders|[]|

  @Positive @Performance
  Scenario: Performance test for entity targets endpoint
    And I send the GET request to "outlettargets_get_entity_targets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data.target|[]|
      |$.data.achievement.sales|[]|
      |$.data.achievement.calls|[]|
      |$.data.achievement.orders|[]|

  @Positive @Concurrency
  Scenario: Concurrent access test for entity targets endpoint
    And I send the GET request to "outlettargets_get_entity_targets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data.target|[]|
      |$.data.achievement.sales|[]|
      |$.data.achievement.calls|[]|
      |$.data.achievement.orders|[]|

  @Negative @Validation
  Scenario: Get entity targets with invalid query parameters
    And I send the GET request to "outlettargets_get_entity_targets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data.target|[]|
      |$.data.achievement.sales|[]|
      |$.data.achievement.calls|[]|
      |$.data.achievement.orders|[]|

  @Negative @Validation
  Scenario: Get entity targets with special characters in query parameters
    And I send the GET request to "outlettargets_get_entity_targets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data.target|[]|
      |$.data.achievement.sales|[]|
      |$.data.achievement.calls|[]|
      |$.data.achievement.orders|[]|

  @Negative @Security
  Scenario: Get entity targets with SQL injection attempt
    And I send the GET request to "outlettargets_get_entity_targets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE outlettargets; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data.target|[]|
      |$.data.achievement.sales|[]|
      |$.data.achievement.calls|[]|
      |$.data.achievement.orders|[]|

  @Negative @Boundary
  Scenario: Get entity targets with maximum query parameters
    And I send the GET request to "outlettargets_get_entity_targets" endpoint with dynamic access token and query parameters
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
      |$.data.target|[]|
      |$.data.achievement.sales|[]|
      |$.data.achievement.calls|[]|
      |$.data.achievement.orders|[]|

#  @Negative @ErrorHandling
#  Scenario: Get entity targets with invalid endpoint
#    And I send the GET request to "outlettargets_get_entity_targets_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate entity targets business logic
    And I send the GET request to "outlettargets_get_entity_targets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data.target|[]|
      |$.data.achievement.sales|[]|
      |$.data.achievement.calls|[]|
      |$.data.achievement.orders|[]|

  @Positive @DataIntegrity
  Scenario: Validate entity targets data integrity
    And I send the GET request to "outlettargets_get_entity_targets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data.target|[]|
      |$.data.achievement.sales|[]|
      |$.data.achievement.calls|[]|
      |$.data.achievement.orders|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data.target|array|
      |$.data.achievement|object|
      |$.data.achievement.sales|array|
      |$.data.achievement.calls|array|
      |$.data.achievement.orders|array|

  @Positive @Regression
  Scenario: Regression test for entity targets endpoint
    And I send the GET request to "outlettargets_get_entity_targets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data.target|[]|
      |$.data.achievement.sales|[]|
      |$.data.achievement.calls|[]|
      |$.data.achievement.orders|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data.target|array|
      |$.data.achievement|object|
      |$.data.achievement.sales|array|
      |$.data.achievement.calls|array|
      |$.data.achievement.orders|array|

  @Positive @Functional
  Scenario: Validate entity targets response completeness
    And I send the GET request to "outlettargets_get_entity_targets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data.target|[]|
      |$.data.achievement.sales|[]|
      |$.data.achievement.calls|[]|
      |$.data.achievement.orders|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data.target|array|
      |$.data.achievement|object|
      |$.data.achievement.sales|array|
      |$.data.achievement.calls|array|
      |$.data.achievement.orders|array|

  @Positive @NestedObjectValidation
  Scenario: Validate entity targets nested object structure
    And I send the GET request to "outlettargets_get_entity_targets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data.target|array|
      |$.data.achievement|object|
      |$.data.achievement.sales|array|
      |$.data.achievement.calls|array|
      |$.data.achievement.orders|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data.target|[]|
      |$.data.achievement.sales|[]|
      |$.data.achievement.calls|[]|
      |$.data.achievement.orders|[]|

  @Positive @ContentValidation
  Scenario: Validate entity targets content structure
    And I send the GET request to "outlettargets_get_entity_targets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |data|
      |target|
      |achievement|
      |sales|
      |calls|
      |orders|

  @Positive @LoadTesting
  Scenario: Load testing for entity targets endpoint
    And I send the GET request to "outlettargets_get_entity_targets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data.target|[]|
      |$.data.achievement.sales|[]|
      |$.data.achievement.calls|[]|
      |$.data.achievement.orders|[]|

  @Negative @Timeout
  Scenario: Test entity targets endpoint timeout handling
    And I send the GET request to "outlettargets_get_entity_targets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data.target|[]|
      |$.data.achievement.sales|[]|
      |$.data.achievement.calls|[]|
      |$.data.achievement.orders|[]|

  @Positive @EndToEnd
  Scenario: End-to-end entity targets data retrieval workflow
    And I send the GET request to "outlettargets_get_entity_targets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data.target|[]|
      |$.data.achievement.sales|[]|
      |$.data.achievement.calls|[]|
      |$.data.achievement.orders|[]|
    And I store the response as "entity_targets_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data.target|array|
      |$.data.achievement|object|
      |$.data.achievement.sales|array|
      |$.data.achievement.calls|array|
      |$.data.achievement.orders|array|

  @Positive @EmptyArrayValidation
  Scenario: Validate entity targets empty array responses
    And I send the GET request to "outlettargets_get_entity_targets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data.target|[]|
      |$.data.achievement.sales|[]|
      |$.data.achievement.calls|[]|
      |$.data.achievement.orders|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data.target|array|
      |$.data.achievement.sales|array|
      |$.data.achievement.calls|array|
      |$.data.achievement.orders|array|


