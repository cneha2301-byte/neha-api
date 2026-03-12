@BizomWebAPI @CE @StatesManagement @StatesAPIX @ProductManagement
Feature: States API Testing
  As a system user
  I want to test the states API endpoint
  So that I can ensure proper functionality and data retrieval for states management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get states without access token
    When I send the GET request to "api_get_states" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get states with invalid access token
#    And I send the GET request to "api_get_states" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|invalid_token_12345|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds
#
#  @Negative @Security
#  Scenario: Get states with expired access token
#    And I send the GET request to "api_get_states" endpoint with dynamic access token and query parameters
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
#  Scenario: Get states with malformed access token
#    And I send the GET request to "api_get_states" endpoint with dynamic access token and query parameters
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
  Scenario: Get states with valid access token
    And I send the GET request to "api_get_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|States retrieved Successfully.|
    And I store the response as "states_response" name using full path

  @Positive @DataValidation
  Scenario: Validate states response structure
    And I send the GET request to "api_get_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|States retrieved Successfully.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|array|

  @Positive @DataValidation
  Scenario: Validate states specific data values
    And I send the GET request to "api_get_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|States retrieved Successfully.|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.data[0].State.name|DB:states:name: id=1|
      |$.data[0].State.code|DB:states:code: id=1|
      |$.data[1].State.name|DB:states:name: id=2|
      |$.data[1].State.code|DB:states:code: id=2|

  @Positive @DataValidation
  Scenario: Validate states with static values
    And I send the GET request to "api_get_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|States retrieved Successfully.|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data[0].State.id|"1"|
      |$.data[0].State.code|AN|
      |$.data[0].State.name|ANDAMAN AND NICOBAR ISLANDS|
      |$.data[0].State.statecode|"35"|
      |$.data[0].State.is_active|"1"|
      |$.data[0].State.country_id|"2"|
      |$.data[0].State.isunionterritories|"1"|
      |$.data[1].State.id|"2"|
      |$.data[1].State.code|AP|
      |$.data[1].State.name|ANDHRA PRADESH|
      |$.data[1].State.statecode|"28"|
      |$.data[1].State.is_active|"1"|
      |$.data[1].State.country_id|"2"|
      |$.data[1].State.isunionterritories|"0"|

  @Positive @Performance
  Scenario: Performance test for states endpoint
    And I send the GET request to "api_get_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|States retrieved Successfully.|

  @Positive @Concurrency
  Scenario: Concurrent access test for states endpoint
    And I send the GET request to "api_get_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|States retrieved Successfully.|

  @Negative @Validation
  Scenario: Get states with invalid query parameters
    And I send the GET request to "api_get_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|States retrieved Successfully.|

  @Negative @Validation
  Scenario: Get states with special characters in query parameters
    And I send the GET request to "api_get_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|States retrieved Successfully.|

  @Negative @Security
  Scenario: Get states with SQL injection attempt
    And I send the GET request to "api_get_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE states; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|States retrieved Successfully.|

  @Negative @Boundary
  Scenario: Get states with maximum query parameters
    And I send the GET request to "api_get_states" endpoint with dynamic access token and query parameters
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
      |$.reason|States retrieved Successfully.|

#  @Negative @ErrorHandling
#  Scenario: Get states with invalid endpoint
#    And I send the GET request to "api_get_states_invalid" endpoint with dynamic access token and query parameters
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
  Scenario: Validate states business logic
    And I send the GET request to "api_get_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|States retrieved Successfully.|

  @Positive @DataIntegrity
  Scenario: Validate states data integrity
    And I send the GET request to "api_get_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|States retrieved Successfully.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|array|
      |$.data[0].State|object|
      |$.data[0].State.id|string|
      |$.data[0].State.code|string|
      |$.data[0].State.name|string|
      |$.data[0].State.statecode|string|
      |$.data[0].State.is_active|string|
      |$.data[0].State.country_id|string|
      |$.data[0].State.isunionterritories|string|

  @Positive @Regression
  Scenario: Regression test for states endpoint
    And I send the GET request to "api_get_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|States retrieved Successfully.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|array|

  @Positive @Functional
  Scenario: Validate states response completeness
    And I send the GET request to "api_get_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|States retrieved Successfully.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data[0].State.id|"1"|
      |$.data[0].State.code|AN|
      |$.data[0].State.name|ANDAMAN AND NICOBAR ISLANDS|
      |$.data[0].State.statecode|"35"|
      |$.data[0].State.is_active|"1"|
      |$.data[0].State.country_id|"2"|
      |$.data[0].State.isunionterritories|"1"|

  @Positive @ArrayValidation
  Scenario: Validate states array structure and content
    And I send the GET request to "api_get_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|States retrieved Successfully.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
      |$.data[0]|object|
      |$.data[1]|object|
      |$.data[0].State|object|
      |$.data[1].State|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data[0].State.id|"1"|
      |$.data[0].State.code|AN|
      |$.data[0].State.name|ANDAMAN AND NICOBAR ISLANDS|
      |$.data[0].State.statecode|"35"|
      |$.data[0].State.is_active|"1"|
      |$.data[0].State.country_id|"2"|
      |$.data[0].State.isunionterritories|"1"|
      |$.data[1].State.id|"2"|
      |$.data[1].State.code|AP|
      |$.data[1].State.name|ANDHRA PRADESH|
      |$.data[1].State.statecode|"28"|
      |$.data[1].State.is_active|"1"|
      |$.data[1].State.country_id|"2"|
      |$.data[1].State.isunionterritories|"0"|

  @Positive @ContentValidation
  Scenario: Validate states content structure
    And I send the GET request to "api_get_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|States retrieved Successfully.|
    And validating the response contains the following values
      |Value|
      |data|
      |State|
      |id|
      |code|
      |name|
      |statecode|
      |is_active|
      |country_id|
      |isunionterritories|

  @Positive @LoadTesting
  Scenario: Load testing for states endpoint
    And I send the GET request to "api_get_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|States retrieved Successfully.|

  @Negative @Timeout
  Scenario: Test states endpoint timeout handling
    And I send the GET request to "api_get_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|States retrieved Successfully.|

  @Positive @EndToEnd
  Scenario: End-to-end states data retrieval workflow
    And I send the GET request to "api_get_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|States retrieved Successfully.|
    And I store the response as "states_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data[0].State.id|"1"|
      |$.data[0].State.code|AN|
      |$.data[0].State.name|ANDAMAN AND NICOBAR ISLANDS|
      |$.data[0].State.statecode|"35"|
      |$.data[0].State.is_active|"1"|
      |$.data[0].State.country_id|"2"|
      |$.data[0].State.isunionterritories|"1"|
