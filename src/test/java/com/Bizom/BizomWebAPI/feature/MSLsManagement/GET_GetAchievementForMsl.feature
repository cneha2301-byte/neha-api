@BizomWebAPI @MSLsManagement @MSLs @UserAccessManagement @OS
Feature: Get Achievement For MSL API Testing
  As a system user
  I want to test the get achievement for MSL endpoint
  So that I can ensure proper functionality and data retrieval for MSL achievement management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get achievement for MSL without access token
    When I send the GET request to "msls_get_achievement_for_msl" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get achievement for MSL with invalid access token
#    And I send the GET request to "msls_get_achievement_for_msl" endpoint with dynamic access token and query parameters
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
#  Scenario: Get achievement for MSL with expired access token
#    And I send the GET request to "msls_get_achievement_for_msl" endpoint with dynamic access token and query parameters
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
#  Scenario: Get achievement for MSL with malformed access token
#    And I send the GET request to "msls_get_achievement_for_msl" endpoint with dynamic access token and query parameters
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
  Scenario: Get achievement for MSL with valid access token
    And I send the GET request to "msls_get_achievement_for_msl" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|no data found|
      |$.data|[]|
    And I store the response as "msl_achievement_response" name using full path

  @Positive @DataValidation
  Scenario: Validate achievement for MSL response structure
    And I send the GET request to "msls_get_achievement_for_msl" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|no data found|
      |$.data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|

  @Positive @DataValidation
  Scenario: Validate achievement for MSL specific data values
    And I send the GET request to "msls_get_achievement_for_msl" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|no data found|
      |$.data|[]|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|no data found|
      |$.data|[]|

  @Positive @DataValidation
  Scenario: Validate achievement for MSL with static values
    And I send the GET request to "msls_get_achievement_for_msl" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|no data found|
      |$.data|[]|

  @Positive @Performance
  Scenario: Performance test for achievement for MSL endpoint
    And I send the GET request to "msls_get_achievement_for_msl" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|no data found|

  @Positive @Concurrency
  Scenario: Concurrent access test for achievement for MSL endpoint
    And I send the GET request to "msls_get_achievement_for_msl" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|no data found|

  @Negative @Validation
  Scenario: Get achievement for MSL with invalid query parameters
    And I send the GET request to "msls_get_achievement_for_msl" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|no data found|

  @Negative @Validation
  Scenario: Get achievement for MSL with special characters in query parameters
    And I send the GET request to "msls_get_achievement_for_msl" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|no data found|

  @Negative @Security
  Scenario: Get achievement for MSL with SQL injection attempt
    And I send the GET request to "msls_get_achievement_for_msl" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE msls; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|no data found|

  @Negative @Boundary
  Scenario: Get achievement for MSL with maximum query parameters
    And I send the GET request to "msls_get_achievement_for_msl" endpoint with dynamic access token and query parameters
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
      |$.Reason|no data found|

#  @Negative @ErrorHandling
#  Scenario: Get achievement for MSL with invalid endpoint
#    And I send the GET request to "msls_get_achievement_for_msl_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate achievement for MSL business logic
    And I send the GET request to "msls_get_achievement_for_msl" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|no data found|

  @Positive @DataIntegrity
  Scenario: Validate achievement for MSL data integrity
    And I send the GET request to "msls_get_achievement_for_msl" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|no data found|
      |$.data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|

  @Positive @Regression
  Scenario: Regression test for achievement for MSL endpoint
    And I send the GET request to "msls_get_achievement_for_msl" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|no data found|
      |$.data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|

  @Positive @Functional
  Scenario: Validate achievement for MSL response completeness
    And I send the GET request to "msls_get_achievement_for_msl" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|no data found|
      |$.data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

  @Positive @ArrayValidation
  Scenario: Validate achievement for MSL array structure and content
    And I send the GET request to "msls_get_achievement_for_msl" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|no data found|
      |$.data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

  @Positive @ContentValidation
  Scenario: Validate achievement for MSL content structure
    And I send the GET request to "msls_get_achievement_for_msl" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|no data found|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |data|
      |no data found|

  @Positive @LoadTesting
  Scenario: Load testing for achievement for MSL endpoint
    And I send the GET request to "msls_get_achievement_for_msl" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|no data found|

  @Negative @Timeout
  Scenario: Test achievement for MSL endpoint timeout handling
    And I send the GET request to "msls_get_achievement_for_msl" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|no data found|

  @Positive @EndToEnd
  Scenario: End-to-end achievement for MSL retrieval workflow
    And I send the GET request to "msls_get_achievement_for_msl" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|no data found|
      |$.data|[]|
    And I store the response as "msl_achievement_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|

