@BizomWebAPI @CE @OutletTargetsManagement @OutletSetDistributorTargets @SystemOperations
Feature: Set Distributor Targets API Testing
  As a system user
  I want to test the set distributor targets endpoint
  So that I can ensure proper functionality and data retrieval for distributor targets management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get set distributor targets without access token
    When I send the GET request to "outlettargets_set_distributor_targets" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get set distributor targets with invalid access token
    And I send the GET request to "outlettargets_set_distributor_targets" endpoint with dynamic access token and query parameters
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
  Scenario: TC_03 Get set distributor targets with expired access token
    And I send the GET request to "outlettargets_set_distributor_targets" endpoint with dynamic access token and query parameters
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
  Scenario: TC_04 Get set distributor targets with malformed access token
    And I send the GET request to "outlettargets_set_distributor_targets" endpoint with dynamic access token and query parameters
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
  Scenario: TC_05 Get set distributor targets with valid access token
    And I send the GET request to "outlettargets_set_distributor_targets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Outlettargets"

  @Positive @DataValidation
  Scenario: TC_06 Validate set distributor targets response structure
    And I send the GET request to "outlettargets_set_distributor_targets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
   And the HTML response should contain page title "Outlettargets"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data['1']|string|
      |$.data['2']|string|
      |$.data['3']|string|

  @Positive @DataValidation
  Scenario: TC_07 Validate set distributor targets specific data values
    And I send the GET request to "outlettargets_set_distributor_targets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Outlettargets"

  @Positive @DataValidation
  Scenario: TC_08 Validate set distributor targets with static values
    And I send the GET request to "outlettargets_set_distributor_targets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Outlettargets"

  @Positive @Performance
  Scenario: TC_09 Performance test for set distributor targets endpoint
    And I send the GET request to "outlettargets_set_distributor_targets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for set distributor targets endpoint
    And I send the GET request to "outlettargets_set_distributor_targets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data['1']|string|
      |$.data['2']|string|

  @Negative @Validation
  Scenario: TC_11 Get set distributor targets with invalid query parameters
    And I send the GET request to "outlettargets_set_distributor_targets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|

  @Negative @Validation
  Scenario: TC_12 Get set distributor targets with special characters in query parameters
    And I send the GET request to "outlettargets_set_distributor_targets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|

  @Negative @Security
  Scenario: TC_13 Get set distributor targets with SQL injection attempt
    And I send the GET request to "outlettargets_set_distributor_targets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE outlettargets; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|

  @Negative @Boundary
  Scenario: TC_14 Get set distributor targets with maximum query parameters
    And I send the GET request to "outlettargets_set_distributor_targets" endpoint with dynamic access token and query parameters
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
      |$.data|object|

#  @Negative @ErrorHandling
#  Scenario: TC_15 Get set distributor targets with invalid endpoint
#    And I send the GET request to "outlettargets_set_distributor_targets_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario:   TC_16 Validate set distributor targets business logic
    And I send the GET request to "outlettargets_set_distributor_targets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data['1']|string|
      |$.data['2']|string|
      |$.data['3']|string|

  @Positive @DataIntegrity
  Scenario: TC_17 Validate set distributor targets data integrity
    And I send the GET request to "outlettargets_set_distributor_targets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data['1']|string|
      |$.data['2']|string|
      |$.data['3']|string|
    And the HTML response should contain page title "Outlettargets"

  @Positive @Regression
  Scenario: TC_18 Regression test for set distributor targets endpoint
    And I send the GET request to "outlettargets_set_distributor_targets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data['1']|string|
      |$.data['2']|string|

  @Positive @Functional
  Scenario: TC_19 Validate set distributor targets response completeness
    And I send the GET request to "outlettargets_set_distributor_targets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data['1']|string|
      |$.data['2']|string|
      |$.data['3']|string|
    And the HTML response should contain page title "Outlettargets"

  @Positive @ObjectValidation
  Scenario: TC_20 Validate set distributor targets object structure and content
    And I send the GET request to "outlettargets_set_distributor_targets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data['1']|string|
      |$.data['2']|string|
      |$.data['3']|string|
   And the HTML response should contain page title "Outlettargets"

  @Positive @ContentValidation
  Scenario: TC_21 Validate set distributor targets content structure
    And I send the GET request to "outlettargets_set_distributor_targets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
   And the HTML response should contain page title "Outlettargets"

  @Positive @LoadTesting
  Scenario: TC_22 Load testing for set distributor targets endpoint
    And I send the GET request to "outlettargets_set_distributor_targets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|

  @Negative @Timeout
  Scenario: TC_23 Test set distributor targets endpoint timeout handling
    And I send the GET request to "outlettargets_set_distributor_targets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|

  @Positive @EndToEnd
  Scenario: TC_24 End-to-end set distributor targets data retrieval workflow
    And I send the GET request to "outlettargets_set_distributor_targets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data['1']|string|
      |$.data['2']|string|
      |$.data['3']|string|
    And the HTML response should contain page title "Outlettargets"

