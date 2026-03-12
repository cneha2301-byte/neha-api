@BizomWebAPI @EntityTagsManagement @EntityTags @GetTypeWiseData @DataProcessing @OS
Feature: Get Type Wise Data API Testing
  As a Bizom web API consumer
  I want to validate the get type wise data endpoint
  So that I can ensure entity tag options are returned correctly based on type

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get type wise data without access token
    When I send the GET request to "entitytags_get_type_wise_data" endpoint with path parameters
      |Path|Value|
      |entityType|collaterals|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get type wise data with invalid access token
    And I send the GET request to "entitytags_get_type_wise_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|entityType|collaterals|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get type wise data with expired access token
    And I send the GET request to "entitytags_get_type_wise_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|entityType|collaterals|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get type wise data with malformed access token
    And I send the GET request to "entitytags_get_type_wise_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|entityType|collaterals|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get type wise data with valid access token
    And I send the GET request to "entitytags_get_type_wise_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType|collaterals|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data.1|Maaza|
      |$.data.2|cuba|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
    And I store the response as "getTypeWiseData_response" name using full path

  @Positive @Performance
  Scenario: TC_06 Performance test for get type wise data endpoint
    And I send the GET request to "entitytags_get_type_wise_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType|collaterals|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: TC_07 Concurrent access test for get type wise data endpoint
    And I send the GET request to "entitytags_get_type_wise_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType|collaterals|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Negative @Validation
#  Scenario: TC_08 Get type wise data with invalid entity type
#    And I send the GET request to "entitytags_get_type_wise_data" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|entityType|invalidType|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_09 Get type wise data with SQL injection attempt
#    And I send the GET request to "entitytags_get_type_wise_data" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|entityType|'; DROP TABLE entitytags; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: TC_10 Get type wise data with maximum query parameters
    And I send the GET request to "entitytags_get_type_wise_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType|collaterals|
      |param1|value1||                                 |
      |param2|value2||                                 |
      |param3|value3||                                 |
      |param4|value4||                                 |
      |param5|value5||                                 |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Negative @ErrorHandling
#  Scenario: TC_11 Get type wise data with invalid endpoint
#    And I send the GET request to "entitytags_get_type_wise_data_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|entityType|collaterals|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @Regression
  Scenario: TC_12 Regression test for get type wise data endpoint
    And I send the GET request to "entitytags_get_type_wise_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType|collaterals|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|

  @Positive @LoadTesting
  Scenario: TC_13 Load testing for get type wise data endpoint
    And I send the GET request to "entitytags_get_type_wise_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType|collaterals|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Negative @Timeout
  Scenario: TC_14 Timeout handling for get type wise data endpoint
    And I send the GET request to "entitytags_get_type_wise_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType|collaterals|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds

  @Positive @EndToEnd
  Scenario: TC_15 End-to-end get type wise data workflow
    And I send the GET request to "entitytags_get_type_wise_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType|collaterals|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data.1|Maaza|
      |$.data.2|cuba|
    And I store the response as "getTypeWiseData_response" name using full path

