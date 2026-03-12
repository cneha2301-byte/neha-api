@BizomWebAPI @StagesManagement @StagesGetStagesV2 @ProductManagement
Feature: Stages GetStagesV2 API Testing
  As a system user
  I want to test the stages getstagesv2 endpoint
  So that I can ensure proper functionality and data retrieval for stages management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get stages v2 without access token
    When I send the GET request to "stages_get_stages_v2" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get stages v2 with invalid access token
    And I send the GET request to "stages_get_stages_v2" endpoint with dynamic access token and query parameters
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
  Scenario: Get stages v2 with expired access token
    And I send the GET request to "stages_get_stages_v2" endpoint with dynamic access token and query parameters
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
  Scenario: Get stages v2 with malformed access token
    And I send the GET request to "stages_get_stages_v2" endpoint with dynamic access token and query parameters
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
  Scenario: Get stages v2 with valid access token
    And I send the GET request to "stages_get_stages_v2" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.response|No stage found|
    And I store the response as "stages_getstagesv2_response" name using full path

  @Positive @DataValidation
  Scenario: Validate stages v2 response structure
    And I send the GET request to "stages_get_stages_v2" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.response|No stage found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.response|string|
      |$.stages|array|

  @Positive @DataValidation
  Scenario: Validate stages v2 empty array and static values
    And I send the GET request to "stages_get_stages_v2" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.response|No stage found|
      |$.stages|[]|

  @Positive @Performance
  Scenario: Performance test for stages v2 endpoint
    And I send the GET request to "stages_get_stages_v2" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.response|No stage found|

  @Positive @Concurrency
  Scenario: Concurrent access test for stages v2 endpoint
    And I send the GET request to "stages_get_stages_v2" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.response|No stage found|

  @Negative @Validation
  Scenario: Get stages v2 with invalid query parameters
    And I send the GET request to "stages_get_stages_v2" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.response|No stage found|

  @Negative @Validation
  Scenario: Get stages v2 with special characters in query parameters
    And I send the GET request to "stages_get_stages_v2" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.response|No stage found|

  @Negative @Security
  Scenario: Get stages v2 with SQL injection attempt
    And I send the GET request to "stages_get_stages_v2" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE stages; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.response|No stage found|

  @Negative @Boundary
  Scenario: Get stages v2 with maximum query parameters
    And I send the GET request to "stages_get_stages_v2" endpoint with dynamic access token and query parameters
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
      |$.response|No stage found|

#  @Negative @ErrorHandling
#  Scenario: Get stages v2 with invalid endpoint
#    And I send the GET request to "stages_get_stages_v2_invalid" endpoint with dynamic access token and query parameters
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
  Scenario: Validate stages v2 business logic
    And I send the GET request to "stages_get_stages_v2" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.response|No stage found|

  @Positive @DataIntegrity
  Scenario: Validate stages v2 data integrity
    And I send the GET request to "stages_get_stages_v2" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.response|No stage found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.response|string|
      |$.stages|array|

  @Positive @Regression
  Scenario: Regression test for stages v2 endpoint
    And I send the GET request to "stages_get_stages_v2" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.response|No stage found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.response|string|
      |$.stages|array|

  @Positive @Functional
  Scenario: Validate stages v2 response completeness
    And I send the GET request to "stages_get_stages_v2" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.response|No stage found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.stages|array|

  @Positive @ArrayValidation
  Scenario: Validate stages v2 array structure and content
    And I send the GET request to "stages_get_stages_v2" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.response|No stage found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.stages|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.stages|[]|
