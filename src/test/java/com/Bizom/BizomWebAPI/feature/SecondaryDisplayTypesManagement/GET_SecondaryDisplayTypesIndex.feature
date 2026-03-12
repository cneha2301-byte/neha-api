@BizomWebAPI @SecondaryDisplayTypesManagement @SecondaryDisplayTypes @WarehouseOperations
Feature: Secondary Display Types Index API Testing
  As a system user
  I want to test the secondary display types index endpoint
  So that I can ensure proper functionality and data retrieval for secondary display types management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|application/json, text/javascript, */*; q=0.01|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |X-Requested-With|XMLHttpRequest|

#  @Negative @Security
#  Scenario: Get secondary display types index without access token
#    When I send the GET request to "secondarydisplaytypes_index" endpoint
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get secondary display types index with invalid access token
    And I send the GET request to "secondarydisplaytypes_index" endpoint with dynamic access token and query parameters
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
  Scenario: Get secondary display types index with expired access token
    And I send the GET request to "secondarydisplaytypes_index" endpoint with dynamic access token and query parameters
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
  Scenario: Get secondary display types index with malformed access token
    And I send the GET request to "secondarydisplaytypes_index" endpoint with dynamic access token and query parameters
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
  Scenario: Get secondary display types index with valid access token
    And I send the GET request to "secondarydisplaytypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|4|
      |iDisplayStart|0|
      |iDisplayLength|50|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
    And I store the response as "secondarydisplaytypes_response" name using full path

  @Positive @DataValidation
  Scenario: Validate secondary display types index response structure
    And I send the GET request to "secondarydisplaytypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iDisplayStart|0|
      |iDisplayLength|50|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Positive @DataValidation
  Scenario: Validate secondary display types index DataTables pagination parameters
    And I send the GET request to "secondarydisplaytypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|4|
      |sColumns|,,,|
      |iDisplayStart|0|
      |iDisplayLength|50|
      |mDataProp_0|0|
      |sSearch_0||
      |bRegex_0|false|
      |bSearchable_0|true|
      |bSortable_0|true|
      |mDataProp_1|1|
      |sSearch_1||
      |bRegex_1|false|
      |bSearchable_1|true|
      |bSortable_1|true|
      |sSearch||
      |bRegex|false|
      |iSortCol_0|0|
      |sSortDir_0|asc|
      |iSortingCols|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Positive @DataValidation
  Scenario: Validate secondary display types index pagination with different display start
    And I send the GET request to "secondarydisplaytypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iDisplayStart|10|
      |iDisplayLength|50|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Positive @DataValidation
  Scenario: Validate secondary display types index pagination with different display length
    And I send the GET request to "secondarydisplaytypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iDisplayStart|0|
      |iDisplayLength|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Positive @DataValidation
  Scenario: Validate secondary display types index sorting parameters
    And I send the GET request to "secondarydisplaytypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iDisplayStart|0|
      |iDisplayLength|50|
      |iSortCol_0|0|
      |sSortDir_0|desc|
      |iSortingCols|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Positive @Performance
  Scenario: Performance test for secondary display types index endpoint
    And I send the GET request to "secondarydisplaytypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iDisplayStart|0|
      |iDisplayLength|50|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

  @Positive @Concurrency
  Scenario: Concurrent access test for secondary display types index endpoint
    And I send the GET request to "secondarydisplaytypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iDisplayStart|0|
      |iDisplayLength|50|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

#  @Negative @Validation
#  Scenario: Get secondary display types index with invalid query parameters
#    And I send the GET request to "secondarydisplaytypes_index" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |invalid_param|invalid_value|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|

  @Negative @Validation
  Scenario: Get secondary display types index with special characters in query parameters
    And I send the GET request to "secondarydisplaytypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|

#  @Negative @Security
#  Scenario: Get secondary display types index with SQL injection attempt
#    And I send the GET request to "secondarydisplaytypes_index" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |sSearch|'; DROP TABLE secondarydisplaytypes; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|

  @Negative @Boundary
  Scenario: Get secondary display types index with maximum query parameters
    And I send the GET request to "secondarydisplaytypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|10|
      |iDisplayStart|0|
      |iDisplayLength|100|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

  @Negative @ErrorHandling
  Scenario: Get secondary display types index with invalid endpoint
    And I send the GET request to "secondarydisplaytypes_index_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "404"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate secondary display types index business logic
    And I send the GET request to "secondarydisplaytypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iDisplayStart|0|
      |iDisplayLength|50|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Positive @DataIntegrity
  Scenario: Validate secondary display types index data integrity
    And I send the GET request to "secondarydisplaytypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iDisplayStart|0|
      |iDisplayLength|50|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Positive @Regression
  Scenario: Regression test for secondary display types index endpoint
    And I send the GET request to "secondarydisplaytypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iDisplayStart|0|
      |iDisplayLength|50|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Positive @Functional
  Scenario: Validate secondary display types index response completeness
    And I send the GET request to "secondarydisplaytypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iDisplayStart|0|
      |iDisplayLength|50|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
    And validating the response contains the following values
      |Value|
      |sEcho|
      |iTotalRecords|
      |iTotalDisplayRecords|
      |aaData|

  @Positive @ArrayValidation
  Scenario: Validate secondary display types index array structure and content
    And I send the GET request to "secondarydisplaytypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iDisplayStart|0|
      |iDisplayLength|50|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData|array|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|

  @Positive @ContentValidation
  Scenario: Validate secondary display types index content structure
    And I send the GET request to "secondarydisplaytypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iDisplayStart|0|
      |iDisplayLength|50|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And validating the response contains the following values
      |Value|
      |sEcho|
      |iTotalRecords|
      |iTotalDisplayRecords|
      |aaData|

  @Positive @LoadTesting
  Scenario: Load testing for secondary display types index endpoint
    And I send the GET request to "secondarydisplaytypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iDisplayStart|0|
      |iDisplayLength|50|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

  @Negative @Timeout
  Scenario: Test secondary display types index endpoint timeout handling
    And I send the GET request to "secondarydisplaytypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iDisplayStart|0|
      |iDisplayLength|50|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

  @Positive @EndToEnd
  Scenario: End-to-end secondary display types index data retrieval workflow
    And I send the GET request to "secondarydisplaytypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|4|
      |sColumns|,,,|
      |iDisplayStart|0|
      |iDisplayLength|50|
      |mDataProp_0|0|
      |bSearchable_0|true|
      |bSortable_0|true|
      |mDataProp_1|1|
      |bSearchable_1|true|
      |bSortable_1|true|
      |iSortCol_0|0|
      |sSortDir_0|asc|
      |iSortingCols|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
    And I store the response as "secondarydisplaytypes_response" name using full path
    And validating the response contains the following values
      |Value|
      |sEcho|
      |iTotalRecords|
      |iTotalDisplayRecords|
      |aaData|

