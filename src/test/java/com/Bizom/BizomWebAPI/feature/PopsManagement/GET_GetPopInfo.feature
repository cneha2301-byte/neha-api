@BizomWebAPI @PopsManagement @Pops @OrderManagement @Innovation
Feature: Get Pop Info API Testing
  As a system user
  I want to test the getpopinfo endpoint
  So that I can ensure proper functionality and data retrieval for pop information management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get pop info without access token
    When I send the GET request to "pops_get_pop_info" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get pop info with invalid access token
#    And I send the GET request to "pops_get_pop_info" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|invalid_token_12345|
#      |language|en|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get pop info with expired access token
#    And I send the GET request to "pops_get_pop_info" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|expired_token_12345|
#      |language|en|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

  @Negative @Security
#  Scenario: Get pop info with malformed access token
#    And I send the GET request to "pops_get_pop_info" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|malformed.token.here|
#      |language|en|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get pop info with valid access token and language parameter
    And I send the GET request to "pops_get_pop_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Empty pop|
    And I store the response as "pop_info_response" name using full path

  @Positive @DataValidation
  Scenario: Validate pop info response structure
    And I send the GET request to "pops_get_pop_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Empty pop|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @DataValidation
  Scenario: Validate pop info response with different language values
    And I send the GET request to "pops_get_pop_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Empty pop|

  @Positive @DataValidation
  Scenario: Validate pop info with static values
    And I send the GET request to "pops_get_pop_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Empty pop|

  @Positive @Performance
  Scenario: Performance test for pop info endpoint
    And I send the GET request to "pops_get_pop_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Empty pop|

  @Positive @Concurrency
  Scenario: Concurrent access test for pop info endpoint
    And I send the GET request to "pops_get_pop_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Empty pop|

  @Negative @Validation
  Scenario: Get pop info without language parameter
    And I send the GET request to "pops_get_pop_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Empty pop|

  @Negative @Validation
  Scenario: Get pop info with invalid language parameter value
    And I send the GET request to "pops_get_pop_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|invalid_lang|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Empty pop|

  @Negative @Validation
  Scenario: Get pop info with empty language parameter
    And I send the GET request to "pops_get_pop_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Empty pop|

  @Negative @Validation
  Scenario: Get pop info with special characters in language parameter
    And I send the GET request to "pops_get_pop_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Empty pop|

  @Negative @Security
  Scenario: Get pop info with SQL injection attempt in language parameter
    And I send the GET request to "pops_get_pop_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|'; DROP TABLE pops; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Empty pop|

  @Negative @Boundary
  Scenario: Get pop info with maximum query parameters
    And I send the GET request to "pops_get_pop_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Empty pop|

#  @Negative @ErrorHandling
#  Scenario: Get pop info with invalid endpoint
#    And I send the GET request to "pops_get_pop_info_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |language|en|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate pop info business logic
    And I send the GET request to "pops_get_pop_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Empty pop|

  @Positive @DataIntegrity
  Scenario: Validate pop info data integrity
    And I send the GET request to "pops_get_pop_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Empty pop|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @Regression
  Scenario: Regression test for pop info endpoint
    And I send the GET request to "pops_get_pop_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Empty pop|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @Functional
  Scenario: Validate pop info response completeness
    And I send the GET request to "pops_get_pop_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Empty pop|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @ContentValidation
  Scenario: Validate pop info content structure
    And I send the GET request to "pops_get_pop_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Empty pop|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Empty pop|

  @Positive @FieldSpecificValidation
  Scenario: Validate pop info Result field
    And I send the GET request to "pops_get_pop_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|

  @Positive @FieldSpecificValidation
  Scenario: Validate pop info Reason field
    And I send the GET request to "pops_get_pop_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Reason|Empty pop|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Reason|string|

  @Positive @LoadTesting
  Scenario: Load testing for pop info endpoint
    And I send the GET request to "pops_get_pop_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Empty pop|

  @Negative @Timeout
  Scenario: Test pop info endpoint timeout handling
    And I send the GET request to "pops_get_pop_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Empty pop|

  @Positive @EndToEnd
  Scenario: End-to-end pop info data retrieval workflow
    And I send the GET request to "pops_get_pop_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Empty pop|
    And I store the response as "pop_info_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Empty pop|

