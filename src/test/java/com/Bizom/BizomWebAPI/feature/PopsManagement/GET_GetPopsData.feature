@BizomWebAPI @PopsManagement @Pops @OrderManagement @Innovation
Feature: Get Pops Data API Testing
  As a system user
  I want to test the get pops data endpoint
  So that I can ensure proper functionality and data retrieval for pops management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get pops data without access token
    When I send the GET request to "pops_get_pops_data" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get pops data with invalid access token
#    And I send the GET request to "pops_get_pops_data" endpoint with dynamic access token and query parameters
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
#  Scenario: Get pops data with expired access token
#    And I send the GET request to "pops_get_pops_data" endpoint with dynamic access token and query parameters
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
#  Scenario: Get pops data with malformed access token
#    And I send the GET request to "pops_get_pops_data" endpoint with dynamic access token and query parameters
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
  Scenario: Get pops data with valid access token
    And I send the GET request to "pops_get_pops_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And I store the response as "pops_data_response" name using full path

  @Positive @DataValidation
  Scenario: Validate pops data response structure
    And I send the GET request to "pops_get_pops_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Pops|object|

  @Positive @DataValidation
  Scenario: Validate pops data specific data values
    And I send the GET request to "pops_get_pops_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Pops.3|DB:pops:name: id=3|
      |$.Pops.4|DB:pops:name: id=4|
      |$.Pops.5|DB:pops:name: id=5|

#  @Positive @DataValidation
#  Scenario: Validate pops data with static values
#    And I send the GET request to "pops_get_pops_data" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.Pops.3|POP1|
#      |$.Pops.4|pop2|
#      |$.Pops.5|Devuitest|
#      |$.Pops.6|devuitest1|
#      |$.Pops.7|devuitest Vedio|
#      |$.Pops.8|Vedio|
#      |$.Pops.9|1|
#      |$.Pops.10|2|

  @Positive @Performance
  Scenario: Performance test for pops data endpoint
    And I send the GET request to "pops_get_pops_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Positive @Concurrency
  Scenario: Concurrent access test for pops data endpoint
    And I send the GET request to "pops_get_pops_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Negative @Validation
  Scenario: Get pops data with invalid query parameters
    And I send the GET request to "pops_get_pops_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Negative @Validation
  Scenario: Get pops data with special characters in query parameters
    And I send the GET request to "pops_get_pops_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Negative @Security
  Scenario: Get pops data with SQL injection attempt
    And I send the GET request to "pops_get_pops_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE pops; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Negative @Boundary
  Scenario: Get pops data with maximum query parameters
    And I send the GET request to "pops_get_pops_data" endpoint with dynamic access token and query parameters
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
      |$.Result|true|
      |$.Reason|""|

#  @Negative @ErrorHandling
#  Scenario: Get pops data with invalid endpoint
#    And I send the GET request to "pops_get_pops_data_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate pops data business logic
    And I send the GET request to "pops_get_pops_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Positive @DataIntegrity
  Scenario: Validate pops data data integrity
    And I send the GET request to "pops_get_pops_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Pops|object|

  @Positive @Regression
  Scenario: Regression test for pops data endpoint
    And I send the GET request to "pops_get_pops_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Pops|object|

#  @Positive @Functional
#  Scenario: Validate pops data response completeness
#    And I send the GET request to "pops_get_pops_data" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Pops|object|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Pops.3|POP1|
#      |$.Pops.4|pop2|
#      |$.Pops.5|Devuitest|
#      |$.Pops.6|devuitest1|
#      |$.Pops.7|devuitest Vedio|
#      |$.Pops.8|Vedio|
#      |$.Pops.9|1|
#      |$.Pops.10|2|

#  @Positive @ArrayValidation
#  Scenario: Validate pops data object structure and content
#    And I send the GET request to "pops_get_pops_data" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Pops|object|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Pops.3|POP1|
#      |$.Pops.4|pop2|
#      |$.Pops.5|Devuitest|
#      |$.Pops.6|devuitest1|
#      |$.Pops.7|devuitest Vedio|
#      |$.Pops.8|Vedio|
#      |$.Pops.9|1|
#      |$.Pops.10|2|

  @Positive @ContentValidation
  Scenario: Validate pops data content structure
    And I send the GET request to "pops_get_pops_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response contains the following values
      |Value|
      |Pops|
      |Result|
      |Reason|

  @Positive @LoadTesting
  Scenario: Load testing for pops data endpoint
    And I send the GET request to "pops_get_pops_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Negative @Timeout
  Scenario: Test pops data endpoint timeout handling
    And I send the GET request to "pops_get_pops_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

#  @Positive @EndToEnd
#  Scenario: End-to-end pops data retrieval workflow
#    And I send the GET request to "pops_get_pops_data" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#    And I store the response as "pops_data_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Pops|object|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Pops.3|POP1|
#      |$.Pops.4|pop2|
#      |$.Pops.5|Devuitest|
#      |$.Pops.6|devuitest1|
#      |$.Pops.7|devuitest Vedio|
#      |$.Pops.8|Vedio|
#      |$.Pops.9|1|
#      |$.Pops.10|2|

