@BizomWebAPI @ShiftTimingsManagement @ShiftTimings @WarehouseOperations
Feature: Shift Timings AJAX Index New API Testing
  As a system user
  I want to test the shift timings AJAX index new endpoint
  So that I can ensure proper functionality and data retrieval for shift timings management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/x-www-form-urlencoded; charset=UTF-8|
      |Accept|application/json, text/javascript, */*; q=0.01|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |X-Requested-With|XMLHttpRequest|

#  @Negative @Security
#  Scenario: Get shift timings AJAX index new without access token
#    When I send the GET request to "shifttimings_ajaxindexnew" endpoint
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get shift timings AJAX index new with invalid access token
#    And I send the GET request to "shifttimings_ajaxindexnew" endpoint with dynamic access token and query parameters
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
#  Scenario: Get shift timings AJAX index new with expired access token
#    And I send the GET request to "shifttimings_ajaxindexnew" endpoint with dynamic access token and query parameters
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
#  Scenario: Get shift timings AJAX index new with malformed access token
#    And I send the GET request to "shifttimings_ajaxindexnew" endpoint with dynamic access token and query parameters
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
  Scenario: Get shift timings AJAX index new with valid access token
    And I send the GET request to "shifttimings_ajaxindexnew" endpoint with dynamic access token and query parameters
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
    And I store the response as "shifttimings_ajaxindexnew_response" name using full path

  @Positive @DataValidation
  Scenario: Validate shift timings AJAX index new response structure
    And I send the GET request to "shifttimings_ajaxindexnew" endpoint with dynamic access token and query parameters
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
    And validating the response contains the following values
      |Value|
      |draw|
      |recordsTotal|
      |recordsFiltered|
      |data|

  @Positive @DataValidation
  Scenario: Validate shift timings AJAX index new DataTables parameters with 9 columns
    And I send the GET request to "shifttimings_ajaxindexnew" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |draw|1|
      |columns[0][data]|0|
      |columns[0][searchable]|false|
      |columns[0][orderable]|false|
      |columns[1][data]|shift_name|
      |columns[1][searchable]|true|
      |columns[1][orderable]|false|
      |columns[2][data]|level|
      |columns[2][searchable]|false|
      |columns[2][orderable]|true|
      |columns[3][data]|start_time|
      |columns[3][searchable]|false|
      |columns[3][orderable]|true|
      |columns[4][data]|end_time|
      |columns[4][searchable]|false|
      |columns[4][orderable]|true|
      |columns[5][data]|roles|
      |columns[5][searchable]|false|
      |columns[5][orderable]|true|
      |columns[6][data]|designations|
      |columns[6][searchable]|false|
      |columns[6][orderable]|true|
      |columns[7][data]|status|
      |columns[7][searchable]|false|
      |columns[7][orderable]|false|
      |columns[8][data]|id|
      |columns[8][searchable]|false|
      |columns[8][orderable]|false|
      |start|0|
      |length|50|
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
  Scenario: Validate shift timings AJAX index new pagination with different start value
    And I send the GET request to "shifttimings_ajaxindexnew" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |draw|1|
      |start|10|
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
  Scenario: Validate shift timings AJAX index new pagination with different length value
    And I send the GET request to "shifttimings_ajaxindexnew" endpoint with dynamic access token and query parameters
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
  Scenario: Validate shift timings AJAX index new search parameters
    And I send the GET request to "shifttimings_ajaxindexnew" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |draw|1|
      |start|0|
      |length|50|
      |search[value]|test|
      |search[regex]|false|
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

  @Positive @Performance
  Scenario: Performance test for shift timings AJAX index new endpoint
    And I send the GET request to "shifttimings_ajaxindexnew" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |draw|1|
      |start|0|
      |length|50|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.data|array|

  @Positive @Concurrency
  Scenario: Concurrent access test for shift timings AJAX index new endpoint
    And I send the GET request to "shifttimings_ajaxindexnew" endpoint with dynamic access token and query parameters
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
    And validating the response contains the following values
      |Value|
      |draw|
      |recordsTotal|
      |recordsFiltered|
      |data|

  @Negative @Validation
  Scenario: Get shift timings AJAX index new with invalid query parameters
    And I send the GET request to "shifttimings_ajaxindexnew" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.data|array|

  @Negative @Validation
  Scenario: Get shift timings AJAX index new with special characters in query parameters
    And I send the GET request to "shifttimings_ajaxindexnew" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |draw|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.data|array|

  @Negative @Security
  Scenario: Get shift timings AJAX index new with SQL injection attempt
    And I send the GET request to "shifttimings_ajaxindexnew" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |search[value]|'; DROP TABLE shifttimings; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.data|array|

  @Negative @Boundary
  Scenario: Get shift timings AJAX index new with maximum query parameters
    And I send the GET request to "shifttimings_ajaxindexnew" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |draw|1|
      |start|0|
      |length|100|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.data|array|

#  @Negative @ErrorHandling
#  Scenario: Get shift timings AJAX index new with invalid endpoint
#    And I send the GET request to "shifttimings_ajaxindexnew_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate shift timings AJAX index new business logic
    And I send the GET request to "shifttimings_ajaxindexnew" endpoint with dynamic access token and query parameters
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
    And validating the response contains the following values
      |Value|
      |draw|
      |recordsTotal|
      |recordsFiltered|
      |data|

  @Positive @DataIntegrity
  Scenario: Validate shift timings AJAX index new data integrity
    And I send the GET request to "shifttimings_ajaxindexnew" endpoint with dynamic access token and query parameters
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
      |$.data|[]|

  @Positive @Regression
  Scenario: Regression test for shift timings AJAX index new endpoint
    And I send the GET request to "shifttimings_ajaxindexnew" endpoint with dynamic access token and query parameters
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
    And validating the response contains the following values
      |Value|
      |draw|
      |recordsTotal|
      |recordsFiltered|
      |data|

  @Positive @Functional
  Scenario: Validate shift timings AJAX index new response completeness
    And I send the GET request to "shifttimings_ajaxindexnew" endpoint with dynamic access token and query parameters
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
    And validating the response contains the following values
      |Value|
      |draw|
      |recordsTotal|
      |recordsFiltered|
      |data|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data|[]|

  @Positive @ArrayValidation
  Scenario: Validate shift timings AJAX index new array structure and content
    And I send the GET request to "shifttimings_ajaxindexnew" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |draw|1|
      |start|0|
      |length|50|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.draw|string|
    And validating the response contains the following values
      |Value|
      |draw|
      |recordsTotal|
      |recordsFiltered|
      |data|

  @Positive @ContentValidation
  Scenario: Validate shift timings AJAX index new content structure
    And I send the GET request to "shifttimings_ajaxindexnew" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |draw|1|
      |start|0|
      |length|50|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |draw|
      |recordsTotal|
      |recordsFiltered|
      |data|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.data|array|

  @Positive @LoadTesting
  Scenario: Load testing for shift timings AJAX index new endpoint
    And I send the GET request to "shifttimings_ajaxindexnew" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |draw|1|
      |start|0|
      |length|50|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.data|array|

  @Negative @Timeout
  Scenario: Test shift timings AJAX index new endpoint timeout handling
    And I send the GET request to "shifttimings_ajaxindexnew" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |draw|1|
      |start|0|
      |length|50|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.data|array|

  @Positive @EndToEnd
  Scenario: End-to-end shift timings AJAX index new data retrieval workflow
    And I send the GET request to "shifttimings_ajaxindexnew" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |draw|1|
      |columns[0][data]|0|
      |columns[0][searchable]|false|
      |columns[0][orderable]|false|
      |columns[1][data]|shift_name|
      |columns[1][searchable]|true|
      |columns[1][orderable]|false|
      |columns[2][data]|level|
      |columns[2][searchable]|false|
      |columns[2][orderable]|true|
      |columns[3][data]|start_time|
      |columns[3][searchable]|false|
      |columns[3][orderable]|true|
      |columns[4][data]|end_time|
      |columns[4][searchable]|false|
      |columns[4][orderable]|true|
      |columns[5][data]|roles|
      |columns[5][searchable]|false|
      |columns[5][orderable]|true|
      |columns[6][data]|designations|
      |columns[6][searchable]|false|
      |columns[6][orderable]|true|
      |columns[7][data]|status|
      |columns[7][searchable]|false|
      |columns[7][orderable]|false|
      |columns[8][data]|id|
      |columns[8][searchable]|false|
      |columns[8][orderable]|false|
      |start|0|
      |length|50|
      |search[value]||
      |search[regex]|false|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.data|array|
    And I store the response as "shifttimings_ajaxindexnew_response" name using full path
    And validating the response contains the following values
      |Value|
      |draw|
      |recordsTotal|
      |recordsFiltered|
      |data|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data|[]|

