@BizomWebAPI @ShelfsManagement @Shelfs @WarehouseOperations @OS
Feature: Shelfs Mapped SKU API Testing
  As a system user
  I want to test the shelfs mapped SKU endpoint
  So that I can ensure proper functionality and data retrieval for mapped SKUs on shelves

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
#  Scenario: Get shelfs mapped SKU without access token
#    When I send the GET request to "shelfs_mappedsku" endpoint
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get shelfs mapped SKU with invalid access token
    And I send the GET request to "shelfs_mappedsku" endpoint with dynamic access token and query parameters
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
  Scenario: Get shelfs mapped SKU with expired access token
    And I send the GET request to "shelfs_mappedsku" endpoint with dynamic access token and query parameters
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
  Scenario: Get shelfs mapped SKU with malformed access token
    And I send the GET request to "shelfs_mappedsku" endpoint with dynamic access token and query parameters
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
  Scenario: Get shelfs mapped SKU with valid access token
    And I send the GET request to "shelfs_mappedsku" endpoint with dynamic access token and query parameters
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
    And I store the response as "shelfs_mappedsku_response" name using full path

  @Positive @DataValidation
  Scenario: Validate shelfs mapped SKU response structure
    And I send the GET request to "shelfs_mappedsku" endpoint with dynamic access token and query parameters
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
  Scenario: Validate shelfs mapped SKU DataTables pagination parameters with 5 columns
    And I send the GET request to "shelfs_mappedsku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|5|
      |sColumns|,,,,|
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
      |mDataProp_2|2|
      |sSearch_2||
      |bRegex_2|false|
      |bSearchable_2|true|
      |bSortable_2|true|
      |mDataProp_3|3|
      |sSearch_3||
      |bRegex_3|false|
      |bSearchable_3|true|
      |bSortable_3|true|
      |mDataProp_4|4|
      |sSearch_4||
      |bRegex_4|false|
      |bSearchable_4|true|
      |bSortable_4|true|
      |sSearch||
      |bRegex|false|
      |iSortingCols|0|
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
  Scenario: Validate shelfs mapped SKU pagination with different display start
    And I send the GET request to "shelfs_mappedsku" endpoint with dynamic access token and query parameters
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
  Scenario: Validate shelfs mapped SKU pagination with different display length
    And I send the GET request to "shelfs_mappedsku" endpoint with dynamic access token and query parameters
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
  Scenario: Validate shelfs mapped SKU sorting parameters
    And I send the GET request to "shelfs_mappedsku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iDisplayStart|0|
      |iDisplayLength|50|
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

  @Positive @Performance
  Scenario: Performance test for shelfs mapped SKU endpoint
    And I send the GET request to "shelfs_mappedsku" endpoint with dynamic access token and query parameters
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
  Scenario: Concurrent access test for shelfs mapped SKU endpoint
    And I send the GET request to "shelfs_mappedsku" endpoint with dynamic access token and query parameters
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
#  Scenario: Get shelfs mapped SKU with invalid query parameters
#    And I send the GET request to "shelfs_mappedsku" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |invalid_param|invalid_value|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|

  @Negative @Validation
  Scenario: Get shelfs mapped SKU with special characters in query parameters
    And I send the GET request to "shelfs_mappedsku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|

#  @Negative @Security
#  Scenario: Get shelfs mapped SKU with SQL injection attempt
#    And I send the GET request to "shelfs_mappedsku" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |sSearch|'; DROP TABLE shelfs; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|

  @Negative @Boundary
  Scenario: Get shelfs mapped SKU with maximum query parameters
    And I send the GET request to "shelfs_mappedsku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|5|
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
  Scenario: Get shelfs mapped SKU with invalid endpoint
    And I send the GET request to "shelfs_mappedsku_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "404"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate shelfs mapped SKU business logic
    And I send the GET request to "shelfs_mappedsku" endpoint with dynamic access token and query parameters
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
  Scenario: Validate shelfs mapped SKU data integrity
    And I send the GET request to "shelfs_mappedsku" endpoint with dynamic access token and query parameters
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
  Scenario: Regression test for shelfs mapped SKU endpoint
    And I send the GET request to "shelfs_mappedsku" endpoint with dynamic access token and query parameters
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
  Scenario: Validate shelfs mapped SKU response completeness
    And I send the GET request to "shelfs_mappedsku" endpoint with dynamic access token and query parameters
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
  Scenario: Validate shelfs mapped SKU array structure and content
    And I send the GET request to "shelfs_mappedsku" endpoint with dynamic access token and query parameters
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
  Scenario: Validate shelfs mapped SKU content structure
    And I send the GET request to "shelfs_mappedsku" endpoint with dynamic access token and query parameters
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
  Scenario: Load testing for shelfs mapped SKU endpoint
    And I send the GET request to "shelfs_mappedsku" endpoint with dynamic access token and query parameters
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
  Scenario: Test shelfs mapped SKU endpoint timeout handling
    And I send the GET request to "shelfs_mappedsku" endpoint with dynamic access token and query parameters
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
  Scenario: End-to-end shelfs mapped SKU data retrieval workflow
    And I send the GET request to "shelfs_mappedsku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|5|
      |sColumns|,,,,|
      |iDisplayStart|0|
      |iDisplayLength|50|
      |mDataProp_0|0|
      |bSearchable_0|true|
      |bSortable_0|true|
      |mDataProp_1|1|
      |bSearchable_1|true|
      |bSortable_1|true|
      |mDataProp_2|2|
      |bSearchable_2|true|
      |bSortable_2|true|
      |mDataProp_3|3|
      |bSearchable_3|true|
      |bSortable_3|true|
      |mDataProp_4|4|
      |bSearchable_4|true|
      |bSortable_4|true|
      |sSearch||
      |bRegex|false|
      |iSortingCols|0|
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
    And I store the response as "shelfs_mappedsku_response" name using full path
    And validating the response contains the following values
      |Value|
      |sEcho|
      |iTotalRecords|
      |iTotalDisplayRecords|
      |aaData|

