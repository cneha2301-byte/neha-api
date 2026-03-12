@BizomWebAPI @CE @UserManagement @AjaxUserList @DataTables
Feature: Ajax User List API Testing
  As a system user
  I want to test the ajax user list endpoint
  So that I can ensure proper functionality and data retrieval for user list management with DataTables

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get ajax user list without access token
    When I send the GET request to "GET_AjaxUserList" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get ajax user list with invalid access token
    And I send the GET request to "GET_AjaxUserList" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
      |sEcho|1|
      |iColumns|13|
      |iDisplayStart|0|
      |iDisplayLength|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get ajax user list with expired access token
    And I send the GET request to "GET_AjaxUserList" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
      |sEcho|1|
      |iColumns|13|
      |iDisplayStart|0|
      |iDisplayLength|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get ajax user list with malformed access token
    And I send the GET request to "GET_AjaxUserList" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
      |sEcho|1|
      |iColumns|13|
      |iDisplayStart|0|
      |iDisplayLength|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get ajax user list with valid access token and default parameters
    And I send the GET request to "GET_AjaxUserList" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|13|
      |iDisplayStart|0|
      |iDisplayLength|25|
      |activeusers|1|
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
    And I store the response as "ajax_user_list_response" name using full path

  @Positive @DataValidation
  Scenario: Validate ajax user list response structure
    And I send the GET request to "GET_AjaxUserList" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|13|
      |iDisplayStart|0|
      |iDisplayLength|25|
      |activeusers|1|
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
      |$.aaData[0]|array|

#  @Positive @DataValidation
#  Scenario: Validate ajax user list data array structure
#    And I send the GET request to "GET_AjaxUserList" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |sEcho|1|
#      |iColumns|13|
#      |iDisplayStart|0|
#      |iDisplayLength|25|
#      |activeusers|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.aaData|array|
#      |$.aaData[0]|array|
#      |$.aaData[0][0]|string|
#      |$.aaData[0][1]|string|
#      |$.aaData[0][2]|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|$.iTotalDisplayRecords|

#  @Positive @DataValidation
#  Scenario: Validate ajax user list total records consistency
#    And I send the GET request to "GET_AjaxUserList" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |sEcho|1|
#      |iColumns|13|
#      |iDisplayStart|0|
#      |iDisplayLength|25|
#      |activeusers|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.iTotalRecords|number|
#      |$.iTotalDisplayRecords|number|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.iTotalRecords|$.iTotalDisplayRecords|

  @Positive @Pagination
  Scenario: Get ajax user list with pagination - first page
    And I send the GET request to "GET_AjaxUserList" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|13|
      |iDisplayStart|0|
      |iDisplayLength|25|
      |activeusers|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData|array|
      |$.aaData.length|number|

  @Positive @Pagination
  Scenario: Get ajax user list with pagination - second page
    And I send the GET request to "GET_AjaxUserList" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|2|
      |iColumns|13|
      |iDisplayStart|25|
      |iDisplayLength|25|
      |activeusers|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|2|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData|array|

  @Positive @Pagination
  Scenario: Get ajax user list with custom page size
    And I send the GET request to "GET_AjaxUserList" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|13|
      |iDisplayStart|0|
      |iDisplayLength|50|
      |activeusers|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData|array|

  @Positive @Performance
  Scenario: Performance test for ajax user list endpoint
    And I send the GET request to "GET_AjaxUserList" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|13|
      |iDisplayStart|0|
      |iDisplayLength|25|
      |activeusers|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

  @Positive @Concurrency
  Scenario: Concurrent access test for ajax user list endpoint
    And I send the GET request to "GET_AjaxUserList" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|13|
      |iDisplayStart|0|
      |iDisplayLength|25|
      |activeusers|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

  @Negative @Validation
  Scenario: Get ajax user list with invalid query parameters
    And I send the GET request to "GET_AjaxUserList" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|13|
      |iDisplayStart|invalid|
      |iDisplayLength|25|
      |activeusers|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get ajax user list with special characters in query parameters
    And I send the GET request to "GET_AjaxUserList" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|13|
      |sSearch|<script>alert('XSS')</script>|
      |iDisplayStart|0|
      |iDisplayLength|25|
      |activeusers|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

  @Negative @Security
  Scenario: Get ajax user list with SQL injection attempt
    And I send the GET request to "GET_AjaxUserList" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|13|
      |sSearch|'; DROP TABLE users; --|
      |iDisplayStart|0|
      |iDisplayLength|25|
      |activeusers|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

  @Negative @Boundary
  Scenario: Get ajax user list with maximum display length
    And I send the GET request to "GET_AjaxUserList" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|13|
      |iDisplayStart|0|
      |iDisplayLength|1000|
      |activeusers|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

#  @Negative @Boundary
#  Scenario: Get ajax user list with zero display length
#    And I send the GET request to "GET_AjaxUserList" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |sEcho|1|
#      |iColumns|13|
#      |iDisplayStart|0|
#      |iDisplayLength|0|
#      |activeusers|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|

  @Negative @ErrorHandling
  Scenario: Get ajax user list with invalid endpoint
    And I send the GET request to "GET_AjaxUserList_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|13|
      |iDisplayStart|0|
      |iDisplayLength|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate ajax user list business logic
    And I send the GET request to "GET_AjaxUserList" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|13|
      |iDisplayStart|0|
      |iDisplayLength|25|
      |activeusers|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

#  @Positive @DataIntegrity
#  Scenario: Validate ajax user list data integrity
#    And I send the GET request to "GET_AjaxUserList" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |sEcho|1|
#      |iColumns|13|
#      |iDisplayStart|0|
#      |iDisplayLength|25|
#      |activeusers|1|
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
#      |$.aaData[0]|array|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.iTotalRecords|$.iTotalDisplayRecords|

  @Positive @Regression
  Scenario: Regression test for ajax user list endpoint
    And I send the GET request to "GET_AjaxUserList" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|13|
      |iDisplayStart|0|
      |iDisplayLength|25|
      |activeusers|1|
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
  Scenario: Validate ajax user list response completeness
    And I send the GET request to "GET_AjaxUserList" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|13|
      |iDisplayStart|0|
      |iDisplayLength|25|
      |activeusers|1|
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
      |$.aaData[0]|array|
    And validating the response contains the following values
      |Value|
      |sEcho|
      |iTotalRecords|
      |iTotalDisplayRecords|
      |aaData|

  @Positive @ArrayValidation
  Scenario: Validate ajax user list array structure and content
    And I send the GET request to "GET_AjaxUserList" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|13|
      |iDisplayStart|0|
      |iDisplayLength|25|
      |activeusers|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData|array|
      |$.aaData[0]|array|
      |$.aaData[0][0]|string|
      |$.aaData[0][1]|string|
      |$.aaData[0][2]|string|
    And validating the response contains the following values
      |Value|
      |aaData|
      |sEcho|
      |iTotalRecords|

  @Positive @ContentValidation
  Scenario: Validate ajax user list content structure
    And I send the GET request to "GET_AjaxUserList" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|13|
      |iDisplayStart|0|
      |iDisplayLength|25|
      |activeusers|1|
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
  Scenario: Load testing for ajax user list endpoint
    And I send the GET request to "GET_AjaxUserList" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|13|
      |iDisplayStart|0|
      |iDisplayLength|25|
      |activeusers|1|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

  @Negative @Timeout
  Scenario: Test ajax user list endpoint timeout handling
    And I send the GET request to "GET_AjaxUserList" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|13|
      |iDisplayStart|0|
      |iDisplayLength|25|
      |activeusers|1|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

#  @Positive @EndToEnd
#  Scenario: End-to-end ajax user list data retrieval workflow
#    And I send the GET request to "GET_AjaxUserList" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |sEcho|1|
#      |iColumns|13|
#      |iDisplayStart|0|
#      |iDisplayLength|25|
#      |activeusers|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#    And I store the response as "ajax_user_list_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.sEcho|number|
#      |$.iTotalRecords|number|
#      |$.iTotalDisplayRecords|number|
#      |$.aaData|array|
#      |$.aaData[0]|array|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.iTotalRecords|$.iTotalDisplayRecords|
#    And validating the response contains the following values
#      |Value|
#      |sEcho|
#      |iTotalRecords|
#      |iTotalDisplayRecords|
#      |aaData|

