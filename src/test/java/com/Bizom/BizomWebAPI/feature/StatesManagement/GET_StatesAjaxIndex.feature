@BizomWebAPI @CE @StatesManagement @StatesAjaxIndex @OutletManagement
Feature: States Ajax Index Testing
  As a system user
  I want to test the states ajax index endpoint
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
  Scenario: Get states ajax index without access token
    When I send the GET request to "states_ajax_index" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get states ajax index with invalid access token
#    And I send the GET request to "states_ajax_index" endpoint with dynamic access token and query parameters
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
#  Scenario: Get states ajax index with expired access token
#    And I send the GET request to "states_ajax_index" endpoint with dynamic access token and query parameters
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
#  Scenario: Get states ajax index with malformed access token
#    And I send the GET request to "states_ajax_index" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|malformed.token.here|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

#  @Positive @Smoke
#  Scenario: Get states ajax index with valid access token
#    And I send the GET request to "states_ajax_index" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"0"|
#      |$.recordsTotal|"39"|
#      |$.recordsFiltered|"39"|
#    And I store the response as "states_ajax_response" name using full path

#  @Positive @DataValidation
#  Scenario: Validate states ajax index response structure
#    And I send the GET request to "states_ajax_index" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"0"|
#      |$.recordsTotal|"39"|
#      |$.recordsFiltered|"39"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.draw|string|
#      |$.recordsTotal|string|
#      |$.recordsFiltered|string|
#      |$.data|array|

#  @Positive @DataValidation
#  Scenario: Validate states ajax index specific data values
#    And I send the GET request to "states_ajax_index" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"0"|
#      |$.recordsTotal|"39"|
#      |$.recordsFiltered|"39"|
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.data[0].name|DB:states:name: id=1|
#      |$.data[0].code|DB:states:code: id=1|
#      |$.data[1].name|DB:states:name: id=2|
#      |$.data[1].code|DB:states:code: id=2|

#  @Positive @DataValidation
#  Scenario: Validate states ajax index with static values
#    And I send the GET request to "states_ajax_index" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"0"|
#      |$.recordsTotal|"39"|
#      |$.recordsFiltered|"39"|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.data[0].id|"1"|
#      |$.data[0].code|AN|
#      |$.data[0].name|ANDAMAN AND NICOBAR ISLANDS|
#      |$.data[0].isunionterritories|"1"|
#      |$.data[0].country|India|
#      |$.data[0].is_active|"1"|
#      |$.data[0].created|-0001-11-30 00:00:00|
#      |$.data[0].modified|-0001-11-30 00:00:00|
#      |$.data[0].country_id|"2"|
#      |$.data[1].id|"2"|
#      |$.data[1].code|AP|
#      |$.data[1].name|ANDHRA PRADESH|
#      |$.data[1].isunionterritories|"0"|
#      |$.data[1].country|India|
#      |$.data[1].is_active|"1"|
#      |$.data[1].created|-0001-11-30 00:00:00|
#      |$.data[1].modified|-0001-11-30 00:00:00|
#      |$.data[1].country_id|"2"|

#  @Positive @Performance
#  Scenario: Performance test for states ajax index endpoint
#    And I send the GET request to "states_ajax_index" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"0"|
#      |$.recordsTotal|"39"|
#      |$.recordsFiltered|"39"|

#  @Positive @Concurrency
#  Scenario: Concurrent access test for states ajax index endpoint
#    And I send the GET request to "states_ajax_index" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"0"|
#      |$.recordsTotal|"39"|
#      |$.recordsFiltered|"39"|

#  @Negative @Validation
#  Scenario: Get states ajax index with invalid query parameters
#    And I send the GET request to "states_ajax_index" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |invalid_param|invalid_value|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"0"|
#      |$.recordsTotal|"39"|
#      |$.recordsFiltered|"39"|

#  @Negative @Validation
#  Scenario: Get states ajax index with special characters in query parameters
#    And I send the GET request to "states_ajax_index" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"0"|
#      |$.recordsTotal|"39"|
#      |$.recordsFiltered|"39"|

#  @Negative @Security
#  Scenario: Get states ajax index with SQL injection attempt
#    And I send the GET request to "states_ajax_index" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|'; DROP TABLE states; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"0"|
#      |$.recordsTotal|"39"|
#      |$.recordsFiltered|"39"|

#  @Negative @Boundary
#  Scenario: Get states ajax index with maximum query parameters
#    And I send the GET request to "states_ajax_index" endpoint with dynamic access token and query parameters
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
#      |$.draw|"0"|
#      |$.recordsTotal|"39"|
#      |$.recordsFiltered|"39"|

#  @Negative @ErrorHandling
#  Scenario: Get states ajax index with invalid endpoint
#    And I send the GET request to "states_ajax_index_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

#  @Positive @BusinessLogic
#  Scenario: Validate states ajax index business logic
#    And I send the GET request to "states_ajax_index" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"0"|
#      |$.recordsTotal|"39"|
#      |$.recordsFiltered|"39"|

#  @Positive @DataIntegrity
#  Scenario: Validate states ajax index data integrity
#    And I send the GET request to "states_ajax_index" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"0"|
#      |$.recordsTotal|"39"|
#      |$.recordsFiltered|"39"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.draw|string|
#      |$.recordsTotal|string|
#      |$.recordsFiltered|string|
#      |$.data|array|
#      |$.data[0]|object|
#      |$.data[0].id|string|
#      |$.data[0].code|string|
#      |$.data[0].name|string|
#      |$.data[0].isunionterritories|string|
#      |$.data[0].country|string|
#      |$.data[0].is_active|string|
#      |$.data[0].created|string|
#      |$.data[0].modified|string|
#      |$.data[0].country_id|string|

#  @Positive @Regression
#  Scenario: Regression test for states ajax index endpoint
#    And I send the GET request to "states_ajax_index" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"0"|
#      |$.recordsTotal|"39"|
#      |$.recordsFiltered|"39"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.draw|string|
#      |$.recordsTotal|string|
#      |$.recordsFiltered|string|
#      |$.data|array|

#  @Positive @Functional
#  Scenario: Validate states ajax index response completeness
#    And I send the GET request to "states_ajax_index" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"0"|
#      |$.recordsTotal|"39"|
#      |$.recordsFiltered|"39"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.data|array|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.data[0].id|"1"|
#      |$.data[0].code|AN|
#      |$.data[0].name|ANDAMAN AND NICOBAR ISLANDS|
#      |$.data[0].isunionterritories|"1"|
#      |$.data[0].country|India|
#      |$.data[0].is_active|"1"|
#      |$.data[0].created|-0001-11-30 00:00:00|
#      |$.data[0].modified|-0001-11-30 00:00:00|
#      |$.data[0].country_id|"2"|

#  @Positive @ArrayValidation
#  Scenario: Validate states ajax index array structure and content
#    And I send the GET request to "states_ajax_index" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"0"|
#      |$.recordsTotal|"39"|
#      |$.recordsFiltered|"39"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.data|array|
#      |$.data[0]|object|
#      |$.data[1]|object|
#      |$.data[2]|object|
#      |$.data[3]|object|
#      |$.data[4]|object|
#      |$.data[5]|object|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.data[0].id|"1"|
#      |$.data[0].code|AN|
#      |$.data[0].name|ANDAMAN AND NICOBAR ISLANDS|
#      |$.data[0].isunionterritories|"1"|
#      |$.data[0].country|India|
#      |$.data[0].is_active|"1"|
#      |$.data[0].created|-0001-11-30 00:00:00|
#      |$.data[0].modified|-0001-11-30 00:00:00|
#      |$.data[0].country_id|"2"|
#      |$.data[1].id|"2"|
#      |$.data[1].code|AP|
#      |$.data[1].name|ANDHRA PRADESH|
#      |$.data[1].isunionterritories|"0"|
#      |$.data[1].country|India|
#      |$.data[1].is_active|"1"|
#      |$.data[1].created|-0001-11-30 00:00:00|
#      |$.data[1].modified|-0001-11-30 00:00:00|
#      |$.data[1].country_id|"2"|
#      |$.data[2].id|"3"|
#      |$.data[2].code|AR|
#      |$.data[2].name|ARUNACHAL PRADESH|
#      |$.data[2].isunionterritories|"0"|
#      |$.data[2].country|India|
#      |$.data[2].is_active|"1"|
#      |$.data[2].created|-0001-11-30 00:00:00|
#      |$.data[2].modified|-0001-11-30 00:00:00|
#      |$.data[2].country_id|"2"|
#      |$.data[3].id|"4"|
#      |$.data[3].code|AS|
#      |$.data[3].name|ASSAM|
#      |$.data[3].isunionterritories|"0"|
#      |$.data[3].country|India|
#      |$.data[3].is_active|"1"|
#      |$.data[3].created|-0001-11-30 00:00:00|
#      |$.data[3].modified|-0001-11-30 00:00:00|
#      |$.data[3].country_id|"2"|
#      |$.data[4].id|"5"|
#      |$.data[4].code|BR|
#      |$.data[4].name|BIHAR|
#      |$.data[4].isunionterritories|"0"|
#      |$.data[4].country|India|
#      |$.data[4].is_active|"1"|
#      |$.data[4].created|-0001-11-30 00:00:00|
#      |$.data[4].modified|-0001-11-30 00:00:00|
#      |$.data[4].country_id|"2"|
#      |$.data[5].id|"6"|
#      |$.data[5].code|CG|
#      |$.data[5].name|CHHATTISGARH|
#      |$.data[5].isunionterritories|"0"|
#      |$.data[5].country|India|
#      |$.data[5].is_active|"1"|
#      |$.data[5].created|-0001-11-30 00:00:00|
#      |$.data[5].modified|-0001-11-30 00:00:00|
#      |$.data[5].country_id|"2"|

#  @Positive @ContentValidation
#  Scenario: Validate states ajax index content structure
#    And I send the GET request to "states_ajax_index" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"0"|
#      |$.recordsTotal|"39"|
#      |$.recordsFiltered|"39"|
#    And validating the response contains the following values
#      |Value|
#      |draw|
#      |recordsTotal|
#      |recordsFiltered|
#      |data|
#      |id|
#      |code|
#      |name|
#      |isunionterritories|
#      |country|
#      |is_active|
#      |created|
#      |modified|
#      |country_id|

#  @Positive @LoadTesting
#  Scenario: Load testing for states ajax index endpoint
#    And I send the GET request to "states_ajax_index" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "3000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"0"|
#      |$.recordsTotal|"39"|
#      |$.recordsFiltered|"39"|

#  @Negative @Timeout
#  Scenario: Test states ajax index endpoint timeout handling
#    And I send the GET request to "states_ajax_index" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "5000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"0"|
#      |$.recordsTotal|"39"|
#      |$.recordsFiltered|"39"|

#  @Positive @EndToEnd
#  Scenario: End-to-end states ajax index data retrieval workflow
#    And I send the GET request to "states_ajax_index" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"0"|
#      |$.recordsTotal|"39"|
#      |$.recordsFiltered|"39"|
#    And I store the response as "states_ajax_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.draw|string|
#      |$.recordsTotal|string|
#      |$.recordsFiltered|string|
#      |$.data|array|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.data[0].id|"1"|
#      |$.data[0].code|AN|
#      |$.data[0].name|ANDAMAN AND NICOBAR ISLANDS|
#      |$.data[0].isunionterritories|"1"|
#      |$.data[0].country|India|
#      |$.data[0].is_active|"1"|
#      |$.data[0].created|-0001-11-30 00:00:00|
#      |$.data[0].modified|-0001-11-30 00:00:00|
#      |$.data[0].country_id|"2"|
