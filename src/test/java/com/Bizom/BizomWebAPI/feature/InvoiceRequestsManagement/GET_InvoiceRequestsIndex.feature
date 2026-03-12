@BizomWebAPI @OS  @InvoiceRequestsManagement @InvoiceRequestsIndex @UserAccessManagement
Feature: Invoice Requests Index API Testing
  As a system user
  I want to test the invoice requests index endpoint
  So that I can ensure proper functionality and data retrieval for invoice requests management with DataTables format

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|application/json, text/javascript, */*; q=0.01|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

#  @Negative @Security
#  Scenario: Get invoice requests index without access token
#    When I send the GET request to "invoicerequests_index" endpoint
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get invoice requests index with invalid access token
    And I send the GET request to "invoicerequests_index" endpoint with dynamic access token and query parameters
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
  Scenario: Get invoice requests index with expired access token
    And I send the GET request to "invoicerequests_index" endpoint with dynamic access token and query parameters
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
  Scenario: Get invoice requests index with malformed access token
    And I send the GET request to "invoicerequests_index" endpoint with dynamic access token and query parameters
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
#  Scenario: Get invoice requests index with valid access token
#    And I send the GET request to "invoicerequests_index" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |sEcho|1|
#      |iDisplayStart|0|
#      |iDisplayLength|10|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.sEcho|number|
#      |$.iTotalRecords|number|
#      |$.iTotalDisplayRecords|number|
#      |$.aaData|array|
#    And I store the response as "invoice_requests_index_response" name using full path

#  @Positive @DataValidation
#  Scenario: Validate invoice requests index response structure
#    And I send the GET request to "invoicerequests_index" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |sEcho|1|
#      |iDisplayStart|0|
#      |iDisplayLength|10|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.sEcho|number|
#      |$.iTotalRecords|number|
#      |$.iTotalDisplayRecords|number|
#      |$.aaData|array|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|

#  @Positive @DataValidation
#  Scenario: Validate invoice requests index DataTables pagination parameters with 7 columns
#    And I send the GET request to "invoicerequests_index" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |sEcho|1|
#      |iColumns|7|
#      |sColumns|,,,,,,|
#      |iDisplayStart|0|
#      |iDisplayLength|10|
#      |mDataProp_0|0|
#      |sSearch_0||
#      |bRegex_0|false|
#      |bSearchable_0|true|
#      |bSortable_0|true|
#      |mDataProp_1|1|
#      |sSearch_1||
#      |bRegex_1|false|
#      |bSearchable_1|true|
#      |bSortable_1|true|
#      |mDataProp_2|2|
#      |sSearch_2||
#      |bRegex_2|false|
#      |bSearchable_2|true|
#      |bSortable_2|true|
#      |mDataProp_3|3|
#      |sSearch_3||
#      |bRegex_3|false|
#      |bSearchable_3|true|
#      |bSortable_3|true|
#      |mDataProp_4|4|
#      |sSearch_4||
#      |bRegex_4|false|
#      |bSearchable_4|true|
#      |bSortable_4|true|
#      |mDataProp_5|5|
#      |sSearch_5||
#      |bRegex_5|false|
#      |bSearchable_5|true|
#      |bSortable_5|true|
#      |mDataProp_6|6|
#      |sSearch_6||
#      |bRegex_6|false|
#      |bSearchable_6|true|
#      |bSortable_6|true|
#      |sSearch||
#      |bRegex|false|
#      |iSortingCols|1|
#      |iSortCol_0|0|
#      |sSortDir_0|asc|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.sEcho|number|
#      |$.iTotalRecords|number|
#      |$.iTotalDisplayRecords|number|
#      |$.aaData|array|
#
#  @Positive @DataValidation
#  Scenario: Validate invoice requests index pagination with different display start
#    And I send the GET request to "invoicerequests_index" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |sEcho|1|
#      |iDisplayStart|10|
#      |iDisplayLength|10|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.sEcho|number|
#      |$.iTotalRecords|number|
#      |$.iTotalDisplayRecords|number|
#      |$.aaData|array|

#  @Positive @DataValidation
#  Scenario: Validate invoice requests index pagination with different display length
#    And I send the GET request to "invoicerequests_index" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |sEcho|1|
#      |iDisplayStart|0|
#      |iDisplayLength|25|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.sEcho|number|
#      |$.iTotalRecords|number|
#      |$.iTotalDisplayRecords|number|
#      |$.aaData|array|

#  @Positive @DataValidation
#  Scenario: Validate invoice requests index aaData array structure
#    And I send the GET request to "invoicerequests_index" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |sEcho|1|
#      |iDisplayStart|0|
#      |iDisplayLength|10|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.aaData|array|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|0|
#      |$.iTotalDisplayRecords|0|
#      |$.aaData|[]|

#  @Positive @DataValidation
#  Scenario: Validate invoice requests index with static values
#    And I send the GET request to "invoicerequests_index" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |sEcho|1|
#      |iDisplayStart|0|
#      |iDisplayLength|10|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|0|
#      |$.iTotalDisplayRecords|0|
#      |$.aaData|[]|

#  @Positive @Performance
#  Scenario: Performance test for invoice requests index endpoint
#    And I send the GET request to "invoicerequests_index" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |sEcho|1|
#      |iDisplayStart|0|
#      |iDisplayLength|10|
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|

#  @Positive @Concurrency
#  Scenario: Concurrent access test for invoice requests index endpoint
#    And I send the GET request to "invoicerequests_index" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |sEcho|1|
#      |iDisplayStart|0|
#      |iDisplayLength|10|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.sEcho|number|
#      |$.iTotalRecords|number|
#      |$.iTotalDisplayRecords|number|
#      |$.aaData|array|

#  @Negative @Validation
#  Scenario: Get invoice requests index with invalid query parameters
#    And I send the GET request to "invoicerequests_index" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |invalid_param|invalid_value|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.aaData|array|

#  @Negative @Validation
#  Scenario: Get invoice requests index with special characters in query parameters
#    And I send the GET request to "invoicerequests_index" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.aaData|array|
#
#  @Negative @Security
#  Scenario: Get invoice requests index with SQL injection attempt
#    And I send the GET request to "invoicerequests_index" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|'; DROP TABLE invoicerequests; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.aaData|array|
#
#  @Negative @Boundary
#  Scenario: Get invoice requests index with maximum query parameters
#    And I send the GET request to "invoicerequests_index" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |sEcho|1|
#      |iColumns|7|
#      |iDisplayStart|0|
#      |iDisplayLength|100|
#      |param1|value1|
#      |param2|value2|
#      |param3|value3|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#
#  @Negative @ErrorHandling
#  Scenario: Get invoice requests index with invalid endpoint
#    And I send the GET request to "invoicerequests_index_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|
#
#  @Positive @BusinessLogic
#  Scenario: Validate invoice requests index business logic
#    And I send the GET request to "invoicerequests_index" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |sEcho|1|
#      |iDisplayStart|0|
#      |iDisplayLength|10|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.sEcho|number|
#      |$.iTotalRecords|number|
#      |$.iTotalDisplayRecords|number|
#      |$.aaData|array|
#
#  @Positive @DataIntegrity
#  Scenario: Validate invoice requests index data integrity
#    And I send the GET request to "invoicerequests_index" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |sEcho|1|
#      |iDisplayStart|0|
#      |iDisplayLength|10|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.sEcho|number|
#      |$.iTotalRecords|number|
#      |$.iTotalDisplayRecords|number|
#      |$.aaData|array|
#    And validating the response contains the following values
#      |Value|
#      |sEcho|
#      |iTotalRecords|
#      |iTotalDisplayRecords|
#      |aaData|
#
#  @Positive @Regression
#  Scenario: Regression test for invoice requests index endpoint
#    And I send the GET request to "invoicerequests_index" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |sEcho|1|
#      |iDisplayStart|0|
#      |iDisplayLength|10|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.sEcho|number|
#      |$.iTotalRecords|number|
#      |$.iTotalDisplayRecords|number|
#      |$.aaData|array|
#
#  @Positive @Functional
#  Scenario: Validate invoice requests index response completeness
#    And I send the GET request to "invoicerequests_index" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |sEcho|1|
#      |iDisplayStart|0|
#      |iDisplayLength|10|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.sEcho|number|
#      |$.iTotalRecords|number|
#      |$.iTotalDisplayRecords|number|
#      |$.aaData|array|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|0|
#      |$.iTotalDisplayRecords|0|
#      |$.aaData|[]|
#
#  @Positive @ArrayValidation
#  Scenario: Validate invoice requests index array structure and content
#    And I send the GET request to "invoicerequests_index" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |sEcho|1|
#      |iDisplayStart|0|
#      |iDisplayLength|10|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.sEcho|number|
#      |$.iTotalRecords|number|
#      |$.iTotalDisplayRecords|number|
#      |$.aaData|array|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|0|
#      |$.iTotalDisplayRecords|0|
#      |$.aaData|[]|
#
#  @Positive @ContentValidation
#  Scenario: Validate invoice requests index content structure
#    And I send the GET request to "invoicerequests_index" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |sEcho|1|
#      |iDisplayStart|0|
#      |iDisplayLength|10|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#    And validating the response contains the following values
#      |Value|
#      |sEcho|
#      |iTotalRecords|
#      |iTotalDisplayRecords|
#      |aaData|
#
#  @Positive @LoadTesting
#  Scenario: Load testing for invoice requests index endpoint
#    And I send the GET request to "invoicerequests_index" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |sEcho|1|
#      |iDisplayStart|0|
#      |iDisplayLength|10|
#    Then I should see the response code as "200"
#    And verify response time is less than "3000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#
#  @Negative @Timeout
#  Scenario: Test invoice requests index endpoint timeout handling
#    And I send the GET request to "invoicerequests_index" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |sEcho|1|
#      |iDisplayStart|0|
#      |iDisplayLength|10|
#    Then I should see the response code as "200"
#    And verify response time is less than "5000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#
#  @Positive @EndToEnd
#  Scenario: End-to-end invoice requests index data retrieval workflow
#    And I send the GET request to "invoicerequests_index" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |sEcho|1|
#      |iColumns|7|
#      |sColumns|,,,,,,|
#      |iDisplayStart|0|
#      |iDisplayLength|10|
#      |mDataProp_0|0|
#      |bSearchable_0|true|
#      |bSortable_0|true|
#      |mDataProp_1|1|
#      |bSearchable_1|true|
#      |bSortable_1|true|
#      |mDataProp_2|2|
#      |bSearchable_2|true|
#      |bSortable_2|true|
#      |mDataProp_3|3|
#      |bSearchable_3|true|
#      |bSortable_3|true|
#      |mDataProp_4|4|
#      |bSearchable_4|true|
#      |bSortable_4|true|
#      |mDataProp_5|5|
#      |bSearchable_5|true|
#      |bSortable_5|true|
#      |mDataProp_6|6|
#      |bSearchable_6|true|
#      |bSortable_6|true|
#      |sSearch||
#      |bRegex|false|
#      |iSortingCols|1|
#      |iSortCol_0|0|
#      |sSortDir_0|asc|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|0|
#      |$.iTotalDisplayRecords|0|
#      |$.aaData|[]|
#    And I store the response as "invoice_requests_index_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.sEcho|number|
#      |$.iTotalRecords|number|
#      |$.iTotalDisplayRecords|number|
#      |$.aaData|array|
#    And validating the response contains the following values
#      |Value|
#      |sEcho|
#      |iTotalRecords|
#      |iTotalDisplayRecords|
#      |aaData|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|0|
#      |$.iTotalDisplayRecords|0|
#      |$.aaData|[]|

