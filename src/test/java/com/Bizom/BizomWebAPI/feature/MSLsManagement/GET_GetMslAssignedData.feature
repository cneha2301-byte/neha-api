@BizomWebAPI @MSLsManagement @MSLs @UserAccessManagement @OS
Feature: Get MSL Assigned Data API Testing
  As a system user
  I want to test the get MSL assigned data endpoint
  So that I can ensure proper functionality and data retrieval for MSL assigned data management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get MSL assigned data without access token
    When I send the GET request to "msls_get_msl_assigned_data" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get MSL assigned data with invalid access token
#    And I send the GET request to "msls_get_msl_assigned_data" endpoint with dynamic access token and query parameters
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
#  Scenario: Get MSL assigned data with expired access token
#    And I send the GET request to "msls_get_msl_assigned_data" endpoint with dynamic access token and query parameters
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
#  Scenario: Get MSL assigned data with malformed access token
#    And I send the GET request to "msls_get_msl_assigned_data" endpoint with dynamic access token and query parameters
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
  Scenario: Get MSL assigned data with valid access token
    And I send the GET request to "msls_get_msl_assigned_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Msl data not found|
      |$.mslids|[]|
    And I store the response as "msl_assigned_data_response" name using full path

  @Positive @DataValidation
  Scenario: Validate MSL assigned data response structure
    And I send the GET request to "msls_get_msl_assigned_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Msl data not found|
      |$.mslids|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.mslids|array|

  @Positive @DataValidation
  Scenario: Validate MSL assigned data specific data values
    And I send the GET request to "msls_get_msl_assigned_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Msl data not found|
      |$.mslids|[]|

  @Positive @DataValidation
  Scenario: Validate MSL assigned data with static values
    And I send the GET request to "msls_get_msl_assigned_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Msl data not found|
      |$.mslids|[]|

  @Positive @Performance
  Scenario: Performance test for MSL assigned data endpoint
    And I send the GET request to "msls_get_msl_assigned_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Msl data not found|
      |$.mslids|[]|

  @Positive @Concurrency
  Scenario: Concurrent access test for MSL assigned data endpoint
    And I send the GET request to "msls_get_msl_assigned_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Msl data not found|
      |$.mslids|[]|

  @Negative @Validation
  Scenario: Get MSL assigned data with invalid query parameters
    And I send the GET request to "msls_get_msl_assigned_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Msl data not found|
      |$.mslids|[]|

  @Negative @Validation
  Scenario: Get MSL assigned data with special characters in query parameters
    And I send the GET request to "msls_get_msl_assigned_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Msl data not found|
      |$.mslids|[]|

  @Negative @Security
  Scenario: Get MSL assigned data with SQL injection attempt
    And I send the GET request to "msls_get_msl_assigned_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE msls; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Msl data not found|
      |$.mslids|[]|

  @Negative @Boundary
  Scenario: Get MSL assigned data with maximum query parameters
    And I send the GET request to "msls_get_msl_assigned_data" endpoint with dynamic access token and query parameters
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
      |$.Result|false|
      |$.Reason|Msl data not found|
      |$.mslids|[]|

#  @Negative @ErrorHandling
#  Scenario: Get MSL assigned data with invalid endpoint
#    And I send the GET request to "msls_get_msl_assigned_data_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate MSL assigned data business logic
    And I send the GET request to "msls_get_msl_assigned_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Msl data not found|
      |$.mslids|[]|

  @Positive @DataIntegrity
  Scenario: Validate MSL assigned data data integrity
    And I send the GET request to "msls_get_msl_assigned_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Msl data not found|
      |$.mslids|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.mslids|array|

  @Positive @Regression
  Scenario: Regression test for MSL assigned data endpoint
    And I send the GET request to "msls_get_msl_assigned_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Msl data not found|
      |$.mslids|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.mslids|array|

  @Positive @Functional
  Scenario: Validate MSL assigned data response completeness
    And I send the GET request to "msls_get_msl_assigned_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Msl data not found|
      |$.mslids|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.mslids|array|

  @Positive @ContentValidation
  Scenario: Validate MSL assigned data content structure
    And I send the GET request to "msls_get_msl_assigned_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Msl data not found|
      |$.mslids|[]|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |mslids|
      |Msl data not found|

  @Positive @LoadTesting
  Scenario: Load testing for MSL assigned data endpoint
    And I send the GET request to "msls_get_msl_assigned_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Msl data not found|
      |$.mslids|[]|

  @Negative @Timeout
  Scenario: Test MSL assigned data endpoint timeout handling
    And I send the GET request to "msls_get_msl_assigned_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Msl data not found|
      |$.mslids|[]|

  @Positive @EndToEnd
  Scenario: End-to-end MSL assigned data data retrieval workflow
    And I send the GET request to "msls_get_msl_assigned_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Msl data not found|
      |$.mslids|[]|
    And I store the response as "msl_assigned_data_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.mslids|array|

  @Positive @EmptyArrayValidation
  Scenario: Validate MSL assigned data empty array response
    And I send the GET request to "msls_get_msl_assigned_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Msl data not found|
      |$.mslids|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.mslids|array|



