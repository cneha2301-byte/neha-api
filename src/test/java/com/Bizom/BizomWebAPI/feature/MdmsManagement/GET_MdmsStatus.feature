@BizomWebAPI @MdmsManagement @MdmsStatus @WorkflowAutomation @OS
Feature: MDMs Status API Testing
  As a system user
  I want to test the MDMs status endpoint
  So that I can ensure proper functionality and data retrieval for MDM status with DataTables format

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|application/json, text/javascript, */*; q=0.01|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get MDMs status without access token
    When I send the GET request to "mdms_status" endpoint
    Then I should see the response code as "403"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get MDMs status with invalid access token
    And I send the GET request to "mdms_status" endpoint with dynamic access token and query parameters
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
  Scenario: Get MDMs status with expired access token
    And I send the GET request to "mdms_status" endpoint with dynamic access token and query parameters
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
  Scenario: Get MDMs status with malformed access token
    And I send the GET request to "mdms_status" endpoint with dynamic access token and query parameters
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
  Scenario: Get MDMs status with valid access token
    And I send the GET request to "mdms_status" endpoint with dynamic access token and query parameters
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
    And I store the response as "mdms_status_response" name using full path

  @Positive @DataValidation
  Scenario: Validate MDMs status response structure
    And I send the GET request to "mdms_status" endpoint with dynamic access token and query parameters
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
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

  @Positive @DataValidation
  Scenario: Validate MDMs status DataTables pagination parameters with 13 columns
    And I send the GET request to "mdms_status" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|13|
      |sColumns|,,,,,,,,,,,,|
      |iDisplayStart|0|
      |iDisplayLength|50|
      |mDataProp_0|id|
      |sSearch_0|""|
      |bRegex_0|false|
      |bSearchable_0|false|
      |bSortable_0|false|
      |mDataProp_1|mdm_id|
      |sSearch_1|""|
      |bRegex_1|false|
      |bSearchable_1|false|
      |bSortable_1|false|
      |mDataProp_2|name|
      |sSearch_2|""|
      |bRegex_2|false|
      |bSearchable_2|false|
      |bSortable_2|false|
      |mDataProp_3|fileurl|
      |sSearch_3|""|
      |bRegex_3|false|
      |bSearchable_3|false|
      |bSortable_3|false|
      |mDataProp_4|created|
      |sSearch_4|""|
      |bRegex_4|false|
      |bSearchable_4|false|
      |bSortable_4|true|
      |mDataProp_5|processstarttime|
      |sSearch_5|""|
      |bRegex_5|false|
      |bSearchable_5|false|
      |bSortable_5|true|
      |mDataProp_6|processendtime|
      |sSearch_6|""|
      |bRegex_6|false|
      |bSearchable_6|false|
      |bSortable_6|true|
      |mDataProp_7|scheduledatetime|
      |sSearch_7|""|
      |bRegex_7|false|
      |bSearchable_7|false|
      |bSortable_7|true|
      |mDataProp_8|emailids|
      |sSearch_8|""|
      |bRegex_8|false|
      |bSearchable_8|true|
      |bSortable_8|false|
      |mDataProp_9|progresspercent|
      |sSearch_9|""|
      |bRegex_9|false|
      |bSearchable_9|false|
      |bSortable_9|false|
      |mDataProp_10|pid|
      |sSearch_10|""|
      |bRegex_10|false|
      |bSearchable_10|false|
      |bSortable_10|false|
      |mDataProp_11|errorfileurl|
      |sSearch_11|""|
      |bRegex_11|false|
      |bSearchable_11|false|
      |bSortable_11|false|
      |mDataProp_12|Result|
      |sSearch_12|""|
      |bRegex_12|false|
      |bSearchable_12|false|
      |bSortable_12|false|
      |sSearch|""|
      |bRegex|false|
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

  @Positive @DataValidation
  Scenario: Validate MDMs status pagination with different start value
    And I send the GET request to "mdms_status" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iDisplayStart|10|
      |iDisplayLength|50|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

  @Positive @DataValidation
  Scenario: Validate MDMs status pagination with different length value
    And I send the GET request to "mdms_status" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iDisplayStart|0|
      |iDisplayLength|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

  @Positive @DataValidation
  Scenario: Validate MDMs status data array structure
    And I send the GET request to "mdms_status" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iDisplayStart|0|
      |iDisplayLength|50|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|
      |$.aaData|[]|

  @Positive @DataValidation
  Scenario: Validate MDMs status with static values
    And I send the GET request to "mdms_status" endpoint with dynamic access token and query parameters
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
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|
      |$.aaData|[]|

  @Positive @Performance
  Scenario: Performance test for MDMs status endpoint
    And I send the GET request to "mdms_status" endpoint with dynamic access token and query parameters
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
  Scenario: Concurrent access test for MDMs status endpoint
    And I send the GET request to "mdms_status" endpoint with dynamic access token and query parameters
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
#  Scenario: Get MDMs status with invalid query parameters
#    And I send the GET request to "mdms_status" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |invalid_param|invalid_value|
#    Then I should see the response code as "403"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Validation
#  Scenario: Get MDMs status with special characters in query parameters
#    And I send the GET request to "mdms_status" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|<script>alert('XSS')</script>|
#    Then I should see the response code as "403"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get MDMs status with SQL injection attempt
#    And I send the GET request to "mdms_status" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|'; DROP TABLE mdms; --|
#    Then I should see the response code as "403"
#    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: Get MDMs status with maximum query parameters
    And I send the GET request to "mdms_status" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iDisplayStart|0|
      |iDisplayLength|100|
      |param1|value1|
      |param2|value2|
      |param3|value3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

#  @Negative @ErrorHandling
#  Scenario: Get MDMs status with invalid endpoint
#    And I send the GET request to "mdms_status_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "403"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate MDMs status business logic
    And I send the GET request to "mdms_status" endpoint with dynamic access token and query parameters
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
  Scenario: Validate MDMs status data integrity
    And I send the GET request to "mdms_status" endpoint with dynamic access token and query parameters
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
    And validating the response contains the following values
      |Value|
      |sEcho|
      |iTotalRecords|
      |iTotalDisplayRecords|
      |aaData|

  @Positive @Regression
  Scenario: Regression test for MDMs status endpoint
    And I send the GET request to "mdms_status" endpoint with dynamic access token and query parameters
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
  Scenario: Validate MDMs status response completeness
    And I send the GET request to "mdms_status" endpoint with dynamic access token and query parameters
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
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|
      |$.aaData|[]|

  @Positive @ArrayValidation
  Scenario: Validate MDMs status array structure and content
    And I send the GET request to "mdms_status" endpoint with dynamic access token and query parameters
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
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|
      |$.aaData|[]|

  @Positive @ContentValidation
  Scenario: Validate MDMs status content structure
    And I send the GET request to "mdms_status" endpoint with dynamic access token and query parameters
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
  Scenario: Load testing for MDMs status endpoint
    And I send the GET request to "mdms_status" endpoint with dynamic access token and query parameters
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
  Scenario: Test MDMs status endpoint timeout handling
    And I send the GET request to "mdms_status" endpoint with dynamic access token and query parameters
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
  Scenario: End-to-end MDMs status data retrieval workflow
    And I send the GET request to "mdms_status" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|13|
      |sColumns|,,,,,,,,,,,,|
      |iDisplayStart|0|
      |iDisplayLength|50|
      |mDataProp_0|id|
      |sSearch_0|""|
      |bRegex_0|false|
      |bSearchable_0|false|
      |bSortable_0|false|
      |mDataProp_1|mdm_id|
      |sSearch_1|""|
      |bRegex_1|false|
      |bSearchable_1|false|
      |bSortable_1|false|
      |mDataProp_2|name|
      |sSearch_2|""|
      |bRegex_2|false|
      |bSearchable_2|false|
      |bSortable_2|false|
      |mDataProp_3|fileurl|
      |sSearch_3|""|
      |bRegex_3|false|
      |bSearchable_3|false|
      |bSortable_3|false|
      |mDataProp_4|created|
      |sSearch_4|""|
      |bRegex_4|false|
      |bSearchable_4|false|
      |bSortable_4|true|
      |mDataProp_5|processstarttime|
      |sSearch_5|""|
      |bRegex_5|false|
      |bSearchable_5|false|
      |bSortable_5|true|
      |mDataProp_6|processendtime|
      |sSearch_6|""|
      |bRegex_6|false|
      |bSearchable_6|false|
      |bSortable_6|true|
      |mDataProp_7|scheduledatetime|
      |sSearch_7|""|
      |bRegex_7|false|
      |bSearchable_7|false|
      |bSortable_7|true|
      |mDataProp_8|emailids|
      |sSearch_8|""|
      |bRegex_8|false|
      |bSearchable_8|true|
      |bSortable_8|false|
      |mDataProp_9|progresspercent|
      |sSearch_9|""|
      |bRegex_9|false|
      |bSearchable_9|false|
      |bSortable_9|false|
      |mDataProp_10|pid|
      |sSearch_10|""|
      |bRegex_10|false|
      |bSearchable_10|false|
      |bSortable_10|false|
      |mDataProp_11|errorfileurl|
      |sSearch_11|""|
      |bRegex_11|false|
      |bSearchable_11|false|
      |bSortable_11|false|
      |mDataProp_12|Result|
      |sSearch_12|""|
      |bRegex_12|false|
      |bSearchable_12|false|
      |bSortable_12|false|
      |sSearch|""|
      |bRegex|false|
      |iSortCol_0|0|
      |sSortDir_0|desc|
      |iSortingCols|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|
      |$.aaData|[]|
    And I store the response as "mdms_status_response" name using full path
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
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|
      |$.aaData|[]|

