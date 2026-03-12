@BizomWebAPI @LanguagesManagement @LanguagesAjaxIndexNew @UserAccessManagement
Feature: Languages AJAX Index New API Testing
  As a system user
  I want to test the languages ajaxindexNew endpoint
  So that I can ensure proper functionality and data retrieval for languages management with DataTables format

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|application/json, text/javascript, */*; q=0.01|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

#  @Negative @Security
#  Scenario: Get languages AJAX index new without access token
#    When I send the GET request to "languages_ajaxindexnew" endpoint
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get languages AJAX index new with invalid access token
#    And I send the GET request to "languages_ajaxindexnew" endpoint with dynamic access token and query parameters
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
#  Scenario: Get languages AJAX index new with expired access token
#    And I send the GET request to "languages_ajaxindexnew" endpoint with dynamic access token and query parameters
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
#  Scenario: Get languages AJAX index new with malformed access token
#    And I send the GET request to "languages_ajaxindexnew" endpoint with dynamic access token and query parameters
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
  Scenario: Get languages AJAX index new with valid access token
    And I send the GET request to "languages_ajaxindexnew" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |draw|1|
      |start|0|
      |length|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|"1"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.data|array|
    And I store the response as "languages_ajaxindexnew_response" name using full path

  @Positive @DataValidation
  Scenario: Validate languages AJAX index new response structure
    And I send the GET request to "languages_ajaxindexnew" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |draw|1|
      |start|0|
      |length|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.data|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|"1"|

  @Positive @DataValidation
  Scenario: Validate languages AJAX index new DataTables pagination parameters with 4 columns
    And I send the GET request to "languages_ajaxindexnew" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |draw|1|
      |columns[0][data]|id|
      |columns[0][searchable]|true|
      |columns[0][orderable]|true|
      |columns[1][data]|language|
      |columns[1][searchable]|true|
      |columns[1][orderable]|true|
      |columns[2][data]|language_code|
      |columns[2][searchable]|false|
      |columns[2][orderable]|true|
      |columns[3][data]||
      |columns[3][searchable]|false|
      |columns[3][orderable]|false|
      |order[0][column]|0|
      |order[0][dir]|asc|
      |start|0|
      |length|25|
      |search[value]||
      |search[regex]|false|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|"1"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.data|array|

  @Positive @DataValidation
  Scenario: Validate languages AJAX index new pagination with different start value
    And I send the GET request to "languages_ajaxindexnew" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |draw|1|
      |start|10|
      |length|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.data|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|"1"|

  @Positive @DataValidation
  Scenario: Validate languages AJAX index new pagination with different length value
    And I send the GET request to "languages_ajaxindexnew" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |draw|1|
      |start|0|
      |length|50|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.data|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|"1"|

  @Positive @DataValidation
  Scenario: Validate languages AJAX index new data array structure
    And I send the GET request to "languages_ajaxindexnew" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |draw|1|
      |start|0|
      |length|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|"1"|
      |$.recordsTotal|"0"|
      |$.recordsFiltered|"0"|
      |$.data|[]|

  @Positive @DataValidation
  Scenario: Validate languages AJAX index new with static values
    And I send the GET request to "languages_ajaxindexnew" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |draw|1|
      |start|0|
      |length|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|"1"|
      |$.recordsTotal|"0"|
      |$.recordsFiltered|"0"|
      |$.data|[]|

  @Positive @Performance
  Scenario: Performance test for languages AJAX index new endpoint
    And I send the GET request to "languages_ajaxindexnew" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |draw|1|
      |start|0|
      |length|25|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|"1"|

  @Positive @Concurrency
  Scenario: Concurrent access test for languages AJAX index new endpoint
    And I send the GET request to "languages_ajaxindexnew" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |draw|1|
      |start|0|
      |length|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|"1"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.data|array|

  @Negative @Validation
  Scenario: Get languages AJAX index new with invalid query parameters
    And I send the GET request to "languages_ajaxindexnew" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

  @Negative @Validation
  Scenario: Get languages AJAX index new with special characters in query parameters
    And I send the GET request to "languages_ajaxindexnew" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

  @Negative @Security
  Scenario: Get languages AJAX index new with SQL injection attempt
    And I send the GET request to "languages_ajaxindexnew" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE languages; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

  @Negative @Boundary
  Scenario: Get languages AJAX index new with maximum query parameters
    And I send the GET request to "languages_ajaxindexnew" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |draw|1|
      |start|0|
      |length|100|
      |param1|value1|
      |param2|value2|
      |param3|value3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|"1"|

#  @Negative @ErrorHandling
#  Scenario: Get languages AJAX index new with invalid endpoint
#    And I send the GET request to "languages_ajaxindexnew_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

  @Positive @BusinessLogic
  Scenario: Validate languages AJAX index new business logic
    And I send the GET request to "languages_ajaxindexnew" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |draw|1|
      |start|0|
      |length|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|"1"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.data|array|

  @Positive @DataIntegrity
  Scenario: Validate languages AJAX index new data integrity
    And I send the GET request to "languages_ajaxindexnew" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |draw|1|
      |start|0|
      |length|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.data|array|
    And validating the response contains the following values
      |Value|
      |draw|
      |recordsTotal|
      |recordsFiltered|
      |data|

  @Positive @Regression
  Scenario: Regression test for languages AJAX index new endpoint
    And I send the GET request to "languages_ajaxindexnew" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |draw|1|
      |start|0|
      |length|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|"1"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.data|array|

  @Positive @Functional
  Scenario: Validate languages AJAX index new response completeness
    And I send the GET request to "languages_ajaxindexnew" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |draw|1|
      |start|0|
      |length|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.data|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|"1"|
      |$.recordsTotal|"0"|
      |$.recordsFiltered|"0"|
      |$.data|[]|

  @Positive @ArrayValidation
  Scenario: Validate languages AJAX index new array structure and content
    And I send the GET request to "languages_ajaxindexnew" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |draw|1|
      |start|0|
      |length|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.data|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|"1"|
      |$.recordsTotal|"0"|
      |$.recordsFiltered|"0"|
      |$.data|[]|

  @Positive @ContentValidation
  Scenario: Validate languages AJAX index new content structure
    And I send the GET request to "languages_ajaxindexnew" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |draw|1|
      |start|0|
      |length|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|"1"|
    And validating the response contains the following values
      |Value|
      |draw|
      |recordsTotal|
      |recordsFiltered|
      |data|

  @Positive @LoadTesting
  Scenario: Load testing for languages AJAX index new endpoint
    And I send the GET request to "languages_ajaxindexnew" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |draw|1|
      |start|0|
      |length|25|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|"1"|

  @Negative @Timeout
  Scenario: Test languages AJAX index new endpoint timeout handling
    And I send the GET request to "languages_ajaxindexnew" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |draw|1|
      |start|0|
      |length|25|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|"1"|

  @Positive @EndToEnd
  Scenario: End-to-end languages AJAX index new data retrieval workflow
    And I send the GET request to "languages_ajaxindexnew" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |draw|1|
      |columns[0][data]|id|
      |columns[0][searchable]|true|
      |columns[0][orderable]|true|
      |columns[1][data]|language|
      |columns[1][searchable]|true|
      |columns[1][orderable]|true|
      |columns[2][data]|language_code|
      |columns[2][searchable]|false|
      |columns[2][orderable]|true|
      |columns[3][data]||
      |columns[3][searchable]|false|
      |columns[3][orderable]|false|
      |order[0][column]|0|
      |order[0][dir]|asc|
      |start|0|
      |length|25|
      |search[value]||
      |search[regex]|false|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|"1"|
      |$.recordsTotal|"0"|
      |$.recordsFiltered|"0"|
      |$.data|[]|
    And I store the response as "languages_ajaxindexnew_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.data|array|
    And validating the response contains the following values
      |Value|
      |draw|
      |recordsTotal|
      |recordsFiltered|
      |data|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|"1"|
      |$.recordsTotal|"0"|
      |$.recordsFiltered|"0"|
      |$.data|[]|

