@BizomWebAPI @TaskApprovalsManagement @TaskApprovals @OutletManagement @Innovation
Feature: Task Approvals Index API Testing
  As a system user
  I want to test the taskapprovals/index endpoint
  So that I can ensure proper functionality and data retrieval for task approvals management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get task approvals index without access token
    When I send the GET request to "taskapprovals_index" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get task approvals index with invalid access token
    And I send the GET request to "taskapprovals_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
      |sEcho|1|
      |iColumns|7|
      |iDisplayStart|0|
      |iDisplayLength|50|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get task approvals index with expired access token
    And I send the GET request to "taskapprovals_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
      |sEcho|1|
      |iColumns|7|
      |iDisplayStart|0|
      |iDisplayLength|50|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get task approvals index with malformed access token
    And I send the GET request to "taskapprovals_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
      |sEcho|1|
      |iColumns|7|
      |iDisplayStart|0|
      |iDisplayLength|50|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get task approvals index with valid access token and DataTables parameters
    And I send the GET request to "taskapprovals_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|7|
      |iDisplayStart|0|
      |iDisplayLength|50|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|
    And I store the response as "task_approvals_index_response" name using full path

  @Positive @DataValidation
  Scenario: Validate task approvals index response structure
    And I send the GET request to "taskapprovals_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|7|
      |iDisplayStart|0|
      |iDisplayLength|50|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Positive @DataValidation
  Scenario: Validate task approvals index with empty aaData array
    And I send the GET request to "taskapprovals_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|7|
      |iDisplayStart|0|
      |iDisplayLength|50|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData|array|

  @Positive @DataValidation
  Scenario: Validate task approvals index with different sEcho values
    And I send the GET request to "taskapprovals_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|2|
      |iColumns|7|
      |iDisplayStart|0|
      |iDisplayLength|50|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|2|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|

  @Positive @DataValidation
  Scenario: Validate task approvals index with different iDisplayStart values
    And I send the GET request to "taskapprovals_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|7|
      |iDisplayStart|10|
      |iDisplayLength|50|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|

  @Positive @DataValidation
  Scenario: Validate task approvals index with different iDisplayLength values
    And I send the GET request to "taskapprovals_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|7|
      |iDisplayStart|0|
      |iDisplayLength|100|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|

  @Positive @Performance
  Scenario: Performance test for task approvals index endpoint
    And I send the GET request to "taskapprovals_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|7|
      |iDisplayStart|0|
      |iDisplayLength|50|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|

  @Positive @Concurrency
  Scenario: Concurrent access test for task approvals index endpoint
    And I send the GET request to "taskapprovals_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|7|
      |iDisplayStart|0|
      |iDisplayLength|50|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|

  @Negative @Validation
  Scenario: Get task approvals index without sEcho parameter
    And I send the GET request to "taskapprovals_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |iColumns|7|
      |iDisplayStart|0|
      |iDisplayLength|50|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get task approvals index with invalid sEcho value
    And I send the GET request to "taskapprovals_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|abc|
      |iColumns|7|
      |iDisplayStart|0|
      |iDisplayLength|50|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get task approvals index with negative iDisplayStart value
    And I send the GET request to "taskapprovals_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|7|
      |iDisplayStart|-1|
      |iDisplayLength|50|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get task approvals index with zero iDisplayLength value
    And I send the GET request to "taskapprovals_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|7|
      |iDisplayStart|0|
      |iDisplayLength|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get task approvals index with very large iDisplayLength value
    And I send the GET request to "taskapprovals_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|7|
      |iDisplayStart|0|
      |iDisplayLength|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get task approvals index with special characters in query parameters
    And I send the GET request to "taskapprovals_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|7|
      |iDisplayStart|0|
      |iDisplayLength|50|
      |sSearch|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get task approvals index with SQL injection attempt in query parameters
    And I send the GET request to "taskapprovals_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|7|
      |iDisplayStart|0|
      |iDisplayLength|50|
      |sSearch|'; DROP TABLE taskapprovals; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: Get task approvals index with maximum query parameters
    And I send the GET request to "taskapprovals_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|7|
      |sColumns|,,,,,,|
      |iDisplayStart|0|
      |iDisplayLength|50|
      |mDataProp_0|0|
      |sSearch_0||
      |bRegex_0|false|
      |bSearchable_0|true|
      |bSortable_0|true|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|

  @Negative @ErrorHandling
  Scenario: Get task approvals index with invalid endpoint
    And I send the GET request to "taskapprovals_index_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|7|
      |iDisplayStart|0|
      |iDisplayLength|50|
    Then I should see the response code as "404"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate task approvals index business logic
    And I send the GET request to "taskapprovals_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|7|
      |iDisplayStart|0|
      |iDisplayLength|50|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|

  @Positive @DataIntegrity
  Scenario: Validate task approvals index data integrity
    And I send the GET request to "taskapprovals_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|7|
      |iDisplayStart|0|
      |iDisplayLength|50|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Positive @Regression
  Scenario: Regression test for task approvals index endpoint
    And I send the GET request to "taskapprovals_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|7|
      |iDisplayStart|0|
      |iDisplayLength|50|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Positive @Functional
  Scenario: Validate task approvals index response completeness
    And I send the GET request to "taskapprovals_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|7|
      |iDisplayStart|0|
      |iDisplayLength|50|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Positive @ArrayValidation
  Scenario: Validate task approvals index aaData array structure
    And I send the GET request to "taskapprovals_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|7|
      |iDisplayStart|0|
      |iDisplayLength|50|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData|array|

  @Positive @ContentValidation
  Scenario: Validate task approvals index content structure
    And I send the GET request to "taskapprovals_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|7|
      |iDisplayStart|0|
      |iDisplayLength|50|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|
    And validating the response contains the following values
      |Value|
      |sEcho|
      |iTotalRecords|
      |iTotalDisplayRecords|
      |aaData|

  @Positive @FieldSpecificValidation
  Scenario: Validate task approvals index sEcho field
    And I send the GET request to "taskapprovals_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|7|
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

  @Positive @FieldSpecificValidation
  Scenario: Validate task approvals index iTotalRecords field
    And I send the GET request to "taskapprovals_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|7|
      |iDisplayStart|0|
      |iDisplayLength|50|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.iTotalRecords|0|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.iTotalRecords|number|

  @Positive @FieldSpecificValidation
  Scenario: Validate task approvals index iTotalDisplayRecords field
    And I send the GET request to "taskapprovals_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|7|
      |iDisplayStart|0|
      |iDisplayLength|50|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.iTotalDisplayRecords|0|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.iTotalDisplayRecords|number|

  @Positive @DataTablesValidation
  Scenario: Validate task approvals index DataTables response format
    And I send the GET request to "taskapprovals_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|7|
      |iDisplayStart|0|
      |iDisplayLength|50|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Positive @LoadTesting
  Scenario: Load testing for task approvals index endpoint
    And I send the GET request to "taskapprovals_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|7|
      |iDisplayStart|0|
      |iDisplayLength|50|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|

  @Negative @Timeout
  Scenario: Test task approvals index endpoint timeout handling
    And I send the GET request to "taskapprovals_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|7|
      |iDisplayStart|0|
      |iDisplayLength|50|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|

  @Positive @EndToEnd
  Scenario: End-to-end task approvals index data retrieval workflow
    And I send the GET request to "taskapprovals_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|7|
      |iDisplayStart|0|
      |iDisplayLength|50|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|
    And I store the response as "task_approvals_index_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|

