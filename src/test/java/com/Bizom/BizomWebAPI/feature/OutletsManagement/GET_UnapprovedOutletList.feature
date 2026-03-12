@BizomWebAPI @CE @OutletsManagement @UnapprovedOutletList @SalesOperations
Feature: Unapproved Outlet List API Testing
  As a system user
  I want to test the unapproved outlet list endpoint
  So that I can ensure proper functionality and data retrieval for outlets management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get unapproved outlet list without access token
    When I send the GET request to "outlets_unapproved_outlet_list" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get unapproved outlet list with invalid access token
    And I send the GET request to "outlets_unapproved_outlet_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get unapproved outlet list with expired access token
    And I send the GET request to "outlets_unapproved_outlet_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get unapproved outlet list with malformed access token
    And I send the GET request to "outlets_unapproved_outlet_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get unapproved outlet list with valid access token
    And I send the GET request to "outlets_unapproved_outlet_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
    And I store the response as "unapproved_outlet_list_response" name using full path

  @Positive @DataValidation
  Scenario: Validate unapproved outlet list response structure
    And I send the GET request to "outlets_unapproved_outlet_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Positive @DataValidation
  Scenario: Validate unapproved outlet list aaData array structure
    And I send the GET request to "outlets_unapproved_outlet_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData|array|
      |$.aaData[0]|object|

  @Positive @DataValidation
  Scenario: Validate unapproved outlet list data object field types
    And I send the GET request to "outlets_unapproved_outlet_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData[0].createdByUserId|string|
      |$.aaData[0].createdByUserName|string|
      |$.aaData[0].outletAddress|string|
      |$.aaData[0].outletAreaName|string|
      |$.aaData[0].outletCode|string|
      |$.aaData[0].outletFordate|string|
      |$.aaData[0].outletId|string|
      |$.aaData[0].outletName|string|
      |$.aaData[0].outletRemark|string|
      |$.aaData[0].outletWarehouseName|string|
      |$.aaData[0].outletZoneName|string|
      |$.aaData[0].orderId|number|
      |$.aaData[0].entityId|string|
      |$.aaData[0].is_approve|string|
      |$.aaData[0].reworkId|number|
      |$.aaData[0].sequence|string|

  @Positive @DataValidation
  Scenario: Validate unapproved outlet list all data object fields exist
    And I send the GET request to "outlets_unapproved_outlet_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData[0]|object|
      |$.aaData[0].createdByUserId|string|
      |$.aaData[0].createdByUserName|string|
      |$.aaData[0].outletAddress|string|
      |$.aaData[0].outletAreaName|string|
      |$.aaData[0].outletCode|string|
      |$.aaData[0].outletFordate|string|
      |$.aaData[0].outletId|string|
      |$.aaData[0].outletName|string|
      |$.aaData[0].outletRemark|string|
      |$.aaData[0].outletWarehouseName|string|
      |$.aaData[0].outletZoneName|string|
      |$.aaData[0].orderId|number|
      |$.aaData[0].entityId|string|
      |$.aaData[0].is_approve|string|
      |$.aaData[0].reworkId|number|
      |$.aaData[0].sequence|string|

  @Positive @Performance
  Scenario: Performance test for unapproved outlet list endpoint
    And I send the GET request to "outlets_unapproved_outlet_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Positive @Concurrency
  Scenario: Concurrent access test for unapproved outlet list endpoint
    And I send the GET request to "outlets_unapproved_outlet_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Negative @Validation
  Scenario: Get unapproved outlet list with invalid query parameters
    And I send the GET request to "outlets_unapproved_outlet_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Negative @Validation
  Scenario: Get unapproved outlet list with special characters in query parameters
    And I send the GET request to "outlets_unapproved_outlet_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sSearch|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Negative @Security
  Scenario: Get unapproved outlet list with SQL injection attempt
    And I send the GET request to "outlets_unapproved_outlet_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sSearch|'; DROP TABLE outlets; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

#  @Negative @ErrorHandling
#  Scenario: Get unapproved outlet list with invalid endpoint
#    And I send the GET request to "outlets_unapproved_outlet_list_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate unapproved outlet list business logic
    And I send the GET request to "outlets_unapproved_outlet_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
      |$.aaData[0]|object|
      |$.aaData[0].createdByUserId|string|
      |$.aaData[0].createdByUserName|string|
      |$.aaData[0].outletId|string|
      |$.aaData[0].outletName|string|
      |$.aaData[0].is_approve|string|

  @Positive @DataIntegrity
  Scenario: Validate unapproved outlet list data integrity
    And I send the GET request to "outlets_unapproved_outlet_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
      |$.aaData[0]|object|
      |$.aaData[0].createdByUserId|string|
      |$.aaData[0].createdByUserName|string|
      |$.aaData[0].outletAddress|string|
      |$.aaData[0].outletAreaName|string|
      |$.aaData[0].outletCode|string|
      |$.aaData[0].outletFordate|string|
      |$.aaData[0].outletId|string|
      |$.aaData[0].outletName|string|
      |$.aaData[0].outletRemark|string|
      |$.aaData[0].outletWarehouseName|string|
      |$.aaData[0].outletZoneName|string|
      |$.aaData[0].orderId|number|
      |$.aaData[0].entityId|string|
      |$.aaData[0].is_approve|string|
      |$.aaData[0].reworkId|number|
      |$.aaData[0].sequence|string|

  @Positive @Regression
  Scenario: Regression test for unapproved outlet list endpoint
    And I send the GET request to "outlets_unapproved_outlet_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Positive @Functional
  Scenario: Validate unapproved outlet list response completeness
    And I send the GET request to "outlets_unapproved_outlet_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData|array|
      |$.aaData[0]|object|
      |$.aaData[0].createdByUserId|string|
      |$.aaData[0].createdByUserName|string|
      |$.aaData[0].outletAddress|string|
      |$.aaData[0].outletAreaName|string|
      |$.aaData[0].outletCode|string|
      |$.aaData[0].outletFordate|string|
      |$.aaData[0].outletId|string|
      |$.aaData[0].outletName|string|
      |$.aaData[0].outletRemark|string|
      |$.aaData[0].outletWarehouseName|string|
      |$.aaData[0].outletZoneName|string|
      |$.aaData[0].orderId|number|
      |$.aaData[0].entityId|string|
      |$.aaData[0].is_approve|string|
      |$.aaData[0].reworkId|number|
      |$.aaData[0].sequence|string|

  @Positive @ArrayValidation
  Scenario: Validate unapproved outlet list array structure and content types
    And I send the GET request to "outlets_unapproved_outlet_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData|array|
      |$.aaData[0]|object|
      |$.aaData[1]|object|
      |$.aaData[0].createdByUserId|string|
      |$.aaData[0].createdByUserName|string|
      |$.aaData[0].outletId|string|
      |$.aaData[0].outletName|string|
      |$.aaData[0].orderId|number|
      |$.aaData[0].reworkId|number|

  @Positive @ContentValidation
  Scenario: Validate unapproved outlet list content structure
    And I send the GET request to "outlets_unapproved_outlet_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |recordsTotal|
      |recordsFiltered|
      |data|

  @Positive @LoadTesting
  Scenario: Load testing for unapproved outlet list endpoint
    And I send the GET request to "outlets_unapproved_outlet_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Negative @Timeout
  Scenario: Test unapproved outlet list endpoint timeout handling
    And I send the GET request to "outlets_unapproved_outlet_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Positive @EndToEnd
  Scenario: End-to-end unapproved outlet list data retrieval workflow
    And I send the GET request to "outlets_unapproved_outlet_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "unapproved_outlet_list_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
      |$.aaData[0]|object|
      |$.aaData[0].createdByUserId|string|
      |$.aaData[0].createdByUserName|string|
      |$.aaData[0].outletAddress|string|
      |$.aaData[0].outletAreaName|string|
      |$.aaData[0].outletCode|string|
      |$.aaData[0].outletFordate|string|
      |$.aaData[0].outletId|string|
      |$.aaData[0].outletName|string|
      |$.aaData[0].outletRemark|string|
      |$.aaData[0].outletWarehouseName|string|
      |$.aaData[0].outletZoneName|string|
      |$.aaData[0].orderId|number|
      |$.aaData[0].entityId|string|
      |$.aaData[0].is_approve|string|
      |$.aaData[0].reworkId|number|
      |$.aaData[0].sequence|string|

  @Positive @DataTablesValidation
  Scenario: Validate unapproved outlet list DataTables structure
    And I send the GET request to "outlets_unapproved_outlet_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Positive @FieldTypeValidation
  Scenario: Validate unapproved outlet list all field data types
    And I send the GET request to "outlets_unapproved_outlet_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
      |$.aaData[0]|object|
      |$.aaData[0].createdByUserId|string|
      |$.aaData[0].createdByUserName|string|
      |$.aaData[0].outletAddress|string|
      |$.aaData[0].outletAreaName|string|
      |$.aaData[0].outletCode|string|
      |$.aaData[0].outletFordate|string|
      |$.aaData[0].outletId|string|
      |$.aaData[0].outletName|string|
      |$.aaData[0].outletRemark|string|
      |$.aaData[0].outletWarehouseName|string|
      |$.aaData[0].outletZoneName|string|
      |$.aaData[0].orderId|number|
      |$.aaData[0].entityId|string|
      |$.aaData[0].is_approve|string|
      |$.aaData[0].reworkId|number|
      |$.aaData[0].sequence|string|

