@BizomWebAPI @StagesManagement @StagesIndexApi @ProductManagement
Feature: Stages Index API Testing
  As a system user
  I want to test the stages index API endpoint
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
  Scenario: Get stages index API without access token
    When I send the GET request to "stages_index_api" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get stages index API with invalid access token
    And I send the GET request to "stages_index_api" endpoint with dynamic access token and query parameters
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
  Scenario: Get stages index API with expired access token
    And I send the GET request to "stages_index_api" endpoint with dynamic access token and query parameters
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
  Scenario: Get stages index API with malformed access token
    And I send the GET request to "stages_index_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

#  @Positive @Smoke
#  Scenario: Get stages index API with valid access token
#    And I send the GET request to "stages_index_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|0|
#      |$.iTotalDisplayRecords|0|
#    And I store the response as "stages_index_api_response" name using full path

#  @Positive @DataValidation
#  Scenario: Validate stages index API response structure
#    And I send the GET request to "stages_index_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|0|
#      |$.iTotalDisplayRecords|0|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.sEcho|number|
#      |$.iTotalRecords|number|
#      |$.iTotalDisplayRecords|number|
#      |$.aaData|array|

#  @Positive @DataValidation
#  Scenario: Validate stages index API with static values
#    And I send the GET request to "stages_index_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|0|
#      |$.iTotalDisplayRecords|0|
#      |$.aaData|[]|

#  @Positive @Performance
#  Scenario: Performance test for stages index API endpoint
#    And I send the GET request to "stages_index_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|0|
#      |$.iTotalDisplayRecords|0|

#  @Positive @Concurrency
#  Scenario: Concurrent access test for stages index API endpoint
#    And I send the GET request to "stages_index_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|0|
#      |$.iTotalDisplayRecords|0|

#  @Negative @Validation
#  Scenario: Get stages index API with invalid query parameters
#    And I send the GET request to "stages_index_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |invalid_param|invalid_value|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|0|
#      |$.iTotalDisplayRecords|0|

#  @Negative @Validation
#  Scenario: Get stages index API with special characters in query parameters
#    And I send the GET request to "stages_index_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|0|
#      |$.iTotalDisplayRecords|0|

#  @Negative @Security
#  Scenario: Get stages index API with SQL injection attempt
#    And I send the GET request to "stages_index_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|'; DROP TABLE stages; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|0|
#      |$.iTotalDisplayRecords|0|
#
#  @Negative @Boundary
#  Scenario: Get stages index API with maximum query parameters
#    And I send the GET request to "stages_index_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |param1|value1|
#      |param2|value2|
#      |param3|value3|
#      |param4|value4|
#      |param5|value5|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|0|
#      |$.iTotalDisplayRecords|0|
#
#  @Negative @ErrorHandling
#  Scenario: Get stages index API with invalid endpoint
#    And I send the GET request to "stages_index_api_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|
#
#  @Positive @BusinessLogic
#  Scenario: Validate stages index API business logic
#    And I send the GET request to "stages_index_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|0|
#      |$.iTotalDisplayRecords|0|
#
#  @Positive @DataIntegrity
#  Scenario: Validate stages index API data integrity
#    And I send the GET request to "stages_index_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|0|
#      |$.iTotalDisplayRecords|0|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.sEcho|number|
#      |$.iTotalRecords|number|
#      |$.iTotalDisplayRecords|number|
#      |$.aaData|array|
#
#  @Positive @Regression
#  Scenario: Regression test for stages index API endpoint
#    And I send the GET request to "stages_index_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|0|
#      |$.iTotalDisplayRecords|0|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.sEcho|number|
#      |$.iTotalRecords|number|
#      |$.iTotalDisplayRecords|number|
#      |$.aaData|array|
#
#  @Positive @Functional
#  Scenario: Validate stages index API response completeness
#    And I send the GET request to "stages_index_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|0|
#      |$.iTotalDisplayRecords|0|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.aaData|array|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.aaData|[]|
#
#  @Positive @ArrayValidation
#  Scenario: Validate stages index API array structure and content
#    And I send the GET request to "stages_index_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|0|
#      |$.iTotalDisplayRecords|0|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.aaData|array|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.aaData|[]|
