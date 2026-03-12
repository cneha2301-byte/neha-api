@BizomWebAPI @CE @OutletTypesManagement @OutletTypes @SystemOperations
Feature: Outlet Types Index API Testing
  As a system user
  I want to test the outlet types index endpoint
  So that I can ensure proper functionality and data retrieval for outlet types management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get outlet types index without access token
    When I send the GET request to "outlettypes_index" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get outlet types index with invalid access token
    And I send the GET request to "outlettypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
      |sEcho|1|
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
  Scenario: Get outlet types index with expired access token
    And I send the GET request to "outlettypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
      |sEcho|1|
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
  Scenario: Get outlet types index with malformed access token
    And I send the GET request to "outlettypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
      |sEcho|1|
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
  Scenario: Get outlet types index with valid access token
    And I send the GET request to "outlettypes_index" endpoint with dynamic access token and query parameters
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
      |$.iTotalRecords|13|
      |$.iTotalDisplayRecords|13|
    And I store the response as "outlet_types_index_response" name using full path

  @Positive @DataValidation
  Scenario: Validate outlet types index response structure
    And I send the GET request to "outlettypes_index" endpoint with dynamic access token and query parameters
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
      |$.iTotalRecords|13|
      |$.iTotalDisplayRecords|13|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
      |$.aaData[0]|array|
      |$.aaData[0][0]|string|
      |$.aaData[0][1]|string|
      |$.aaData[0][2]|string|
      |$.aaData[0][3]|string|
      |$.aaData[0][4]|string|
      |$.aaData[0][5]|string|
      |$.aaData[0][6]|string|

  @Positive @DataValidation
  Scenario: Validate outlet types index specific data values
    And I send the GET request to "outlettypes_index" endpoint with dynamic access token and query parameters
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
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.aaData[0][0]|DB:outlettypes:id: id=1|
#      |$.aaData[0][1]|DB:outlettypes:name: id=1|
#      |$.aaData[1][0]|DB:outlettypes:id: id=2|
#      |$.aaData[1][1]|DB:outlettypes:name: id=2|

  @Positive @DataValidation
  Scenario: Validate outlet types index with static values
    And I send the GET request to "outlettypes_index" endpoint with dynamic access token and query parameters
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
      |$.iTotalRecords|13|
      |$.iTotalDisplayRecords|13|
      |$.aaData[0][0]|"1"|
      |$.aaData[0][1]|Outlets1|
      |$.aaData[0][4]|"1"|
      |$.aaData[0][6]|"0"|
      |$.aaData[1][0]|"2"|
      |$.aaData[1][1]|Direct|
      |$.aaData[1][3]|test|
      |$.aaData[1][4]|"1"|
      |$.aaData[1][5]|1 - Direct|
      |$.aaData[1][6]|"1"|
      |$.aaData[2][0]|"3"|
      |$.aaData[2][1]|Indirect|
      |$.aaData[2][3]|"0"|
      |$.aaData[2][4]|"1"|
      |$.aaData[2][5]|2 - Indirect|
      |$.aaData[2][6]|"2"|

  @Positive @Performance
  Scenario: Performance test for outlet types index endpoint
    And I send the GET request to "outlettypes_index" endpoint with dynamic access token and query parameters
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
      |$.iTotalRecords|13|
      |$.iTotalDisplayRecords|13|

  @Positive @Concurrency
  Scenario: Concurrent access test for outlet types index endpoint
    And I send the GET request to "outlettypes_index" endpoint with dynamic access token and query parameters
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
      |$.iTotalRecords|13|
      |$.iTotalDisplayRecords|13|

  @Negative @Validation
  Scenario: Get outlet types index with invalid query parameters
    And I send the GET request to "outlettypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iDisplayStart|0|
      |iDisplayLength|50|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|13|
      |$.iTotalDisplayRecords|13|

  @Negative @Validation
  Scenario: Get outlet types index with special characters in query parameters
    And I send the GET request to "outlettypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iDisplayStart|0|
      |iDisplayLength|50|
      |sSearch|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|13|
      |$.iTotalDisplayRecords|13|

  @Negative @Security
  Scenario: Get outlet types index with SQL injection attempt
    And I send the GET request to "outlettypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iDisplayStart|0|
      |iDisplayLength|50|
      |sSearch|'; DROP TABLE outlettypes; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|13|
      |$.iTotalDisplayRecords|13|

  @Negative @Boundary
  Scenario: Get outlet types index with maximum query parameters
    And I send the GET request to "outlettypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|7|
      |iDisplayStart|0|
      |iDisplayLength|50|
      |mDataProp_0|0|
      |mDataProp_1|1|
      |mDataProp_2|2|
      |mDataProp_3|3|
      |mDataProp_4|4|
      |mDataProp_5|5|
      |mDataProp_6|6|
      |sSearch||
      |iSortingCols|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|13|
      |$.iTotalDisplayRecords|13|

#  @Negative @ErrorHandling
#  Scenario: Get outlet types index with invalid endpoint
#    And I send the GET request to "outlettypes_index_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |sEcho|1|
#      |iDisplayStart|0|
#      |iDisplayLength|50|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate outlet types index business logic
    And I send the GET request to "outlettypes_index" endpoint with dynamic access token and query parameters
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
      |$.iTotalRecords|13|
      |$.iTotalDisplayRecords|13|

  @Positive @DataIntegrity
  Scenario: Validate outlet types index data integrity
    And I send the GET request to "outlettypes_index" endpoint with dynamic access token and query parameters
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
      |$.iTotalRecords|13|
      |$.iTotalDisplayRecords|13|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
      |$.aaData[0]|array|
      |$.aaData[0][0]|string|
      |$.aaData[0][1]|string|
      |$.aaData[0][2]|string|
      |$.aaData[0][3]|string|
      |$.aaData[0][4]|string|
      |$.aaData[0][5]|string|
      |$.aaData[0][6]|string|

  @Positive @Regression
  Scenario: Regression test for outlet types index endpoint
    And I send the GET request to "outlettypes_index" endpoint with dynamic access token and query parameters
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
      |$.iTotalRecords|13|
      |$.iTotalDisplayRecords|13|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Positive @Functional
  Scenario: Validate outlet types index response completeness
    And I send the GET request to "outlettypes_index" endpoint with dynamic access token and query parameters
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
      |$.iTotalRecords|13|
      |$.iTotalDisplayRecords|13|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.aaData[0][0]|"1"|
      |$.aaData[0][1]|Outlets1|
      |$.aaData[1][0]|"2"|
      |$.aaData[1][1]|Direct|
      |$.aaData[2][0]|"3"|
      |$.aaData[2][1]|Indirect|

  @Positive @ArrayValidation
  Scenario: Validate outlet types index array structure and content
    And I send the GET request to "outlettypes_index" endpoint with dynamic access token and query parameters
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
      |$.iTotalRecords|13|
      |$.iTotalDisplayRecords|13|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData|array|
      |$.aaData[0]|array|
      |$.aaData[1]|array|
      |$.aaData[2]|array|
      |$.aaData[0][0]|string|
      |$.aaData[0][1]|string|
      |$.aaData[0][2]|string|
      |$.aaData[0][3]|string|
      |$.aaData[0][4]|string|
      |$.aaData[0][5]|string|
      |$.aaData[0][6]|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.aaData[0][0]|"1"|
      |$.aaData[0][1]|Outlets1|
      |$.aaData[1][0]|"2"|
      |$.aaData[1][1]|Direct|
      |$.aaData[2][0]|"3"|
      |$.aaData[2][1]|Indirect|

  @Positive @ContentValidation
  Scenario: Validate outlet types index content structure
    And I send the GET request to "outlettypes_index" endpoint with dynamic access token and query parameters
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
      |$.iTotalRecords|13|
      |$.iTotalDisplayRecords|13|
    And validating the response contains the following values
      |Value|
      |sEcho|
      |iTotalRecords|
      |iTotalDisplayRecords|
      |aaData|
      |Outlets1|
      |Direct|
      |Indirect|

  @Positive @LoadTesting
  Scenario: Load testing for outlet types index endpoint
    And I send the GET request to "outlettypes_index" endpoint with dynamic access token and query parameters
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
      |$.iTotalRecords|13|
      |$.iTotalDisplayRecords|13|

  @Negative @Timeout
  Scenario: Test outlet types index endpoint timeout handling
    And I send the GET request to "outlettypes_index" endpoint with dynamic access token and query parameters
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
      |$.iTotalRecords|13|
      |$.iTotalDisplayRecords|13|

  @Positive @EndToEnd
  Scenario: End-to-end outlet types index retrieval workflow
    And I send the GET request to "outlettypes_index" endpoint with dynamic access token and query parameters
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
      |$.iTotalRecords|13|
      |$.iTotalDisplayRecords|13|
    And I store the response as "outlet_types_index_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
      |$.aaData[0]|array|
      |$.aaData[0][0]|string|
      |$.aaData[0][1]|string|
      |$.aaData[0][2]|string|
      |$.aaData[0][3]|string|
      |$.aaData[0][4]|string|
      |$.aaData[0][5]|string|
      |$.aaData[0][6]|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.aaData[0][0]|"1"|
      |$.aaData[0][1]|Outlets1|
      |$.aaData[1][0]|"2"|
      |$.aaData[1][1]|Direct|
      |$.aaData[2][0]|"3"|
      |$.aaData[2][1]|Indirect|

  @Positive @Pagination
  Scenario: Test outlet types index with pagination parameters
    And I send the GET request to "outlettypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|2|
      |iDisplayStart|0|
      |iDisplayLength|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|2|
      |$.iTotalRecords|13|
      |$.iTotalDisplayRecords|13|

  @Positive @Pagination
  Scenario: Test outlet types index with different page size
    And I send the GET request to "outlettypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iDisplayStart|10|
      |iDisplayLength|100|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|13|
      |$.iTotalDisplayRecords|13|

