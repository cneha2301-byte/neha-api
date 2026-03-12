@BizomWebAPI @PopsManagement @Pops @OrderManagement @Innovation
Feature: Pops Index Data API Testing
  As a system user
  I want to test the pops index data endpoint
  So that I can ensure proper functionality and data retrieval for pops index data management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get pops index data without access token
    When I send the GET request to "pops_index_data" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get pops index data with invalid access token
#    And I send the GET request to "pops_index_data" endpoint with dynamic access token and query parameters
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
#  Scenario: Get pops index data with expired access token
#    And I send the GET request to "pops_index_data" endpoint with dynamic access token and query parameters
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
#  Scenario: Get pops index data with malformed access token
#    And I send the GET request to "pops_index_data" endpoint with dynamic access token and query parameters
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
#  Scenario: Get pops index data with valid access token
#    And I send the GET request to "pops_index_data" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |draw|2|
#      |start|0|
#      |length|50|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"2"|
#      |$.recordsTotal|"1"|
#      |$.recordsFiltered|"1"|
#    And I store the response as "pops_index_data_response" name using full path

#  @Positive @DataValidation
#  Scenario: Validate pops index data response structure
#    And I send the GET request to "pops_index_data" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |draw|2|
#      |start|0|
#      |length|50|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"2"|
#      |$.recordsTotal|"1"|
#      |$.recordsFiltered|"1"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.draw|string|
#      |$.recordsTotal|string|
#      |$.recordsFiltered|string|
#      |$.data|array|
#      |$.data[0]|object|
#      |$.data[0].id|string|
#      |$.data[0].name|string|
#      |$.data[0].url|string|
#      |$.data[0].collateral_types_id|string|
#      |$.data[0].startdate|string|
#      |$.data[0].enddate|string|
#      |$.data[0].is_active|string|
#      |$.data[0].collateralTypeID|string|
#      |$.data[0].collateralTypeName|string|

#  @Positive @DataValidation
#  Scenario: Validate pops index data specific data values
#    And I send the GET request to "pops_index_data" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |draw|2|
#      |start|0|
#      |length|50|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"2"|
#      |$.recordsTotal|"1"|
#      |$.recordsFiltered|"1"|
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.data[0].id|DB:pops:id: id=1|
#      |$.data[0].name|DB:pops:name: id=1|
#      |$.data[0].collateral_types_id|DB:pops:collateral_types_id: id=1|

#  @Positive @DataValidation
#  Scenario: Validate pops index data with static values
#    And I send the GET request to "pops_index_data" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |draw|2|
#      |start|0|
#      |length|50|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"2"|
#      |$.recordsTotal|"1"|
#      |$.recordsFiltered|"1"|
#      |$.data[0].id|"1"|
#      |$.data[0].name|Parle|
#      |$.data[0].url|4702121_77e82aaepop1.jpg|
#      |$.data[0].collateral_types_id|"1"|
#      |$.data[0].startdate|2021-06-15 00:00:00|
#      |$.data[0].enddate|2021-07-31 00:00:00|
#      |$.data[0].is_active|"0"|
#      |$.data[0].collateralTypeID|"1"|
#      |$.data[0].collateralTypeName|IMAGE|

#  @Positive @Performance
#  Scenario: Performance test for pops index data endpoint
#    And I send the GET request to "pops_index_data" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |draw|2|
#      |start|0|
#      |length|50|
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"2"|
#      |$.recordsTotal|"1"|
#      |$.recordsFiltered|"1"|

#  @Positive @Concurrency
#  Scenario: Concurrent access test for pops index data endpoint
#    And I send the GET request to "pops_index_data" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |draw|2|
#      |start|0|
#      |length|50|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"2"|
#      |$.recordsTotal|"1"|
#      |$.recordsFiltered|"1"|

#  @Negative @Validation
#  Scenario: Get pops index data with invalid query parameters
#    And I send the GET request to "pops_index_data" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |draw|2|
#      |start|0|
#      |length|50|
#      |invalid_param|invalid_value|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"2"|
#      |$.recordsTotal|"1"|
#      |$.recordsFiltered|"1"|

#  @Negative @Validation
#  Scenario: Get pops index data with special characters in query parameters
#    And I send the GET request to "pops_index_data" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |draw|2|
#      |start|0|
#      |length|50|
#      |search[value]|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"2"|
#      |$.recordsTotal|"1"|
#      |$.recordsFiltered|"1"|

#  @Negative @Security
#  Scenario: Get pops index data with SQL injection attempt
#    And I send the GET request to "pops_index_data" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |draw|2|
#      |start|0|
#      |length|50|
#      |search[value]|'; DROP TABLE pops; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"2"|
#      |$.recordsTotal|"1"|
#      |$.recordsFiltered|"1"|

#  @Negative @Boundary
#  Scenario: Get pops index data with maximum query parameters
#    And I send the GET request to "pops_index_data" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |draw|2|
#      |start|0|
#      |length|50|
#      |columns[0][data]|0|
#      |columns[0][searchable]|true|
#      |columns[0][orderable]|true|
#      |columns[1][data]|1|
#      |columns[1][searchable]|true|
#      |columns[1][orderable]|true|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"2"|
#      |$.recordsTotal|"1"|
#      |$.recordsFiltered|"1"|

#  @Negative @ErrorHandling
#  Scenario: Get pops index data with invalid endpoint
#    And I send the GET request to "pops_index_data_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |draw|2|
#      |start|0|
#      |length|50|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds

#  @Positive @BusinessLogic
#  Scenario: Validate pops index data business logic
#    And I send the GET request to "pops_index_data" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |draw|2|
#      |start|0|
#      |length|50|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"2"|
#      |$.recordsTotal|"1"|
#      |$.recordsFiltered|"1"|

#  @Positive @DataIntegrity
#  Scenario: Validate pops index data data integrity
#    And I send the GET request to "pops_index_data" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |draw|2|
#      |start|0|
#      |length|50|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"2"|
#      |$.recordsTotal|"1"|
#      |$.recordsFiltered|"1"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.draw|string|
#      |$.recordsTotal|string|
#      |$.recordsFiltered|string|
#      |$.data|array|
#      |$.data[0].id|string|
#      |$.data[0].name|string|
#      |$.data[0].url|string|
#      |$.data[0].collateral_types_id|string|
#      |$.data[0].startdate|string|
#      |$.data[0].enddate|string|
#      |$.data[0].is_active|string|
#      |$.data[0].collateralTypeID|string|
#      |$.data[0].collateralTypeName|string|

#  @Positive @Regression
#  Scenario: Regression test for pops index data endpoint
#    And I send the GET request to "pops_index_data" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |draw|2|
#      |start|0|
#      |length|50|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"2"|
#      |$.recordsTotal|"1"|
#      |$.recordsFiltered|"1"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.draw|string|
#      |$.recordsTotal|string|
#      |$.recordsFiltered|string|
#      |$.data|array|

#  @Positive @Functional
#  Scenario: Validate pops index data response completeness
#    And I send the GET request to "pops_index_data" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |draw|2|
#      |start|0|
#      |length|50|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"2"|
#      |$.recordsTotal|"1"|
#      |$.recordsFiltered|"1"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.data|array|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.data[0].id|"1"|
#      |$.data[0].name|Parle|
#      |$.data[0].url|4702121_77e82aaepop1.jpg|
#      |$.data[0].collateral_types_id|"1"|
#      |$.data[0].startdate|2021-06-15 00:00:00|
#      |$.data[0].enddate|2021-07-31 00:00:00|
#      |$.data[0].is_active|"0"|
#      |$.data[0].collateralTypeID|"1"|
#      |$.data[0].collateralTypeName|IMAGE|

#  @Positive @ArrayValidation
#  Scenario: Validate pops index data array structure and content
#    And I send the GET request to "pops_index_data" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |draw|2|
#      |start|0|
#      |length|50|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"2"|
#      |$.recordsTotal|"1"|
#      |$.recordsFiltered|"1"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.data|array|
#      |$.data[0]|object|
#      |$.data[0].id|string|
#      |$.data[0].name|string|
#      |$.data[0].url|string|
#      |$.data[0].collateral_types_id|string|
#      |$.data[0].startdate|string|
#      |$.data[0].enddate|string|
#      |$.data[0].is_active|string|
#      |$.data[0].collateralTypeID|string|
#      |$.data[0].collateralTypeName|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.data[0].id|"1"|
#      |$.data[0].name|Parle|
#      |$.data[0].url|4702121_77e82aaepop1.jpg|
#      |$.data[0].collateral_types_id|"1"|
#      |$.data[0].startdate|2021-06-15 00:00:00|
#      |$.data[0].enddate|2021-07-31 00:00:00|
#      |$.data[0].is_active|"0"|
#      |$.data[0].collateralTypeID|"1"|
#      |$.data[0].collateralTypeName|IMAGE|

#  @Positive @ContentValidation
#  Scenario: Validate pops index data content structure
#    And I send the GET request to "pops_index_data" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |draw|2|
#      |start|0|
#      |length|50|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"2"|
#      |$.recordsTotal|"1"|
#      |$.recordsFiltered|"1"|
#    And validating the response contains the following values
#      |Value|
#      |draw|
#      |recordsTotal|
#      |recordsFiltered|
#      |data|
#      |id|
#      |name|
#      |url|
#      |collateral_types_id|
#      |startdate|
#      |enddate|
#      |is_active|
#      |collateralTypeID|
#      |collateralTypeName|

#  @Positive @LoadTesting
#  Scenario: Load testing for pops index data endpoint
#    And I send the GET request to "pops_index_data" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |draw|2|
#      |start|0|
#      |length|50|
#    Then I should see the response code as "200"
#    And verify response time is less than "3000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"2"|
#      |$.recordsTotal|"1"|
#      |$.recordsFiltered|"1"|

  @Negative @Timeout
  Scenario: Test pops index data endpoint timeout handling
    And I send the GET request to "pops_index_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |draw|2|
      |start|0|
      |length|50|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|"2"|
      |$.recordsTotal|"1"|
      |$.recordsFiltered|"1"|

#  @Positive @EndToEnd
#  Scenario: End-to-end pops index data retrieval workflow
#    And I send the GET request to "pops_index_data" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |draw|2|
#      |start|0|
#      |length|50|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"2"|
#      |$.recordsTotal|"1"|
#      |$.recordsFiltered|"1"|
#    And I store the response as "pops_index_data_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.draw|string|
#      |$.recordsTotal|string|
#      |$.recordsFiltered|string|
#      |$.data|array|
#      |$.data[0].id|string|
#      |$.data[0].name|string|
#      |$.data[0].url|string|
#      |$.data[0].collateral_types_id|string|
#      |$.data[0].startdate|string|
#      |$.data[0].enddate|string|
#      |$.data[0].is_active|string|
#      |$.data[0].collateralTypeID|string|
#      |$.data[0].collateralTypeName|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.data[0].id|"1"|
#      |$.data[0].name|Parle|
#      |$.data[0].url|4702121_77e82aaepop1.jpg|
#      |$.data[0].collateral_types_id|"1"|
#      |$.data[0].startdate|2021-06-15 00:00:00|
#      |$.data[0].enddate|2021-07-31 00:00:00|
#      |$.data[0].is_active|"0"|
#      |$.data[0].collateralTypeID|"1"|
#      |$.data[0].collateralTypeName|IMAGE|

#  @Positive @Pagination
#  Scenario: Test pops index data with pagination parameters
#    And I send the GET request to "pops_index_data" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |draw|3|
#      |start|0|
#      |length|10|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"3"|
#      |$.recordsTotal|"1"|
#      |$.recordsFiltered|"1"|

#  @Positive @Pagination
#  Scenario: Test pops index data with different page size
#    And I send the GET request to "pops_index_data" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |draw|1|
#      |start|0|
#      |length|25|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"1"|
#      |$.recordsTotal|"1"|
#      |$.recordsFiltered|"1"|

