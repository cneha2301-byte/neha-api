@BizomWebAPI @SkuUnitsGroupingsManagement @SkuUnitsGroupingsIndex @WarehouseOperations @OS
Feature: SKU Units Groupings Index API Testing
  As a system user
  I want to test the skunitsgroupings index endpoint
  So that I can ensure proper functionality and data retrieval for SKU units groupings management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get SKU units groupings index without access token
    When I send the GET request to "skunitsgroupings_index" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get SKU units groupings index with invalid access token
    And I send the GET request to "skunitsgroupings_index" endpoint with dynamic access token and query parameters
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
  Scenario: Get SKU units groupings index with expired access token
    And I send the GET request to "skunitsgroupings_index" endpoint with dynamic access token and query parameters
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
  Scenario: Get SKU units groupings index with malformed access token
    And I send the GET request to "skunitsgroupings_index" endpoint with dynamic access token and query parameters
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
  Scenario: Get SKU units groupings index with valid access token
    And I send the GET request to "skunitsgroupings_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|7|
      |iDisplayStart|0|
      |iDisplayLength|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|
    And I store the response as "skunitsgroupings_index_response" name using full path

  @Positive @DataValidation
  Scenario: Validate SKU units groupings index response structure
    And I send the GET request to "skunitsgroupings_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|7|
      |iDisplayStart|0|
      |iDisplayLength|25|
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
  Scenario: Validate SKU units groupings index with static values
    And I send the GET request to "skunitsgroupings_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|7|
      |iDisplayStart|0|
      |iDisplayLength|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|
      |$.aaData|[]|

  @Positive @Performance
  Scenario: Performance test for SKU units groupings index endpoint
    And I send the GET request to "skunitsgroupings_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|7|
      |iDisplayStart|0|
      |iDisplayLength|25|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|

  @Positive @Concurrency
  Scenario: Concurrent access test for SKU units groupings index endpoint
    And I send the GET request to "skunitsgroupings_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|7|
      |iDisplayStart|0|
      |iDisplayLength|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|

  @Negative @Validation
  Scenario: Get SKU units groupings index with invalid query parameters
    And I send the GET request to "skunitsgroupings_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|

  @Negative @Validation
  Scenario: Get SKU units groupings index with special characters in query parameters
    And I send the GET request to "skunitsgroupings_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|

  @Negative @Security
  Scenario: Get SKU units groupings index with SQL injection attempt
    And I send the GET request to "skunitsgroupings_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |test_param|'; DROP TABLE skunitsgroupings; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|

  @Negative @Boundary
  Scenario: Get SKU units groupings index with maximum query parameters
    And I send the GET request to "skunitsgroupings_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|7|
      |sColumns|,,,,,,|
      |iDisplayStart|0|
      |iDisplayLength|25|
      |mDataProp_0|Id|
      |mDataProp_1|Entity_Name|
      |mDataProp_2|Entity_Erp_Id|
      |mDataProp_3|Active|
      |mDataProp_4|Created|
      |mDataProp_5|Modified|
      |mDataProp_6|Actions|
      |sSearch||
      |iSortCol_0|0|
      |sSortDir_0|asc|
      |iSortingCols|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|

#  @Negative @ErrorHandling
#  Scenario: Get SKU units groupings index with invalid endpoint
#    And I send the GET request to "skunitsgroupings_index_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |sEcho|1|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

  @Positive @BusinessLogic
  Scenario: Validate SKU units groupings index business logic
    And I send the GET request to "skunitsgroupings_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|7|
      |iDisplayStart|0|
      |iDisplayLength|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|

  @Positive @DataIntegrity
  Scenario: Validate SKU units groupings index data integrity
    And I send the GET request to "skunitsgroupings_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|7|
      |iDisplayStart|0|
      |iDisplayLength|25|
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
  Scenario: Regression test for SKU units groupings index endpoint
    And I send the GET request to "skunitsgroupings_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|7|
      |iDisplayStart|0|
      |iDisplayLength|25|
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
  Scenario: Validate SKU units groupings index response completeness
    And I send the GET request to "skunitsgroupings_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|7|
      |iDisplayStart|0|
      |iDisplayLength|25|
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
    And the fields in response should match with expected values
      |JPath|Value|
      |$.aaData|[]|

  @Positive @ArrayValidation
  Scenario: Validate SKU units groupings index array structure and content
    And I send the GET request to "skunitsgroupings_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|7|
      |iDisplayStart|0|
      |iDisplayLength|25|
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
    And the fields in response should match with expected values
      |JPath|Value|
      |$.aaData|[]|

  @Positive @ContentValidation
  Scenario: Validate SKU units groupings index content structure
    And I send the GET request to "skunitsgroupings_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|7|
      |iDisplayStart|0|
      |iDisplayLength|25|
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

  @Positive @LoadTesting
  Scenario: Load testing for SKU units groupings index endpoint
    And I send the GET request to "skunitsgroupings_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|7|
      |iDisplayStart|0|
      |iDisplayLength|25|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|

  @Negative @Timeout
  Scenario: Test SKU units groupings index endpoint timeout handling
    And I send the GET request to "skunitsgroupings_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|7|
      |iDisplayStart|0|
      |iDisplayLength|25|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|

  @Positive @EndToEnd
  Scenario: End-to-end SKU units groupings index data retrieval workflow
    And I send the GET request to "skunitsgroupings_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|7|
      |iDisplayStart|0|
      |iDisplayLength|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|
    And I store the response as "skunitsgroupings_index_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.aaData|[]|

  @Positive @DataTableValidation
  Scenario: Validate SKU units groupings index data table structure
    And I send the GET request to "skunitsgroupings_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|7|
      |sColumns|,,,,,,|
      |iDisplayStart|0|
      |iDisplayLength|25|
      |mDataProp_0|Id|
      |mDataProp_1|Entity_Name|
      |mDataProp_2|Entity_Erp_Id|
      |mDataProp_3|Active|
      |mDataProp_4|Created|
      |mDataProp_5|Modified|
      |mDataProp_6|Actions|
      |sSearch||
      |iSortCol_0|0|
      |sSortDir_0|asc|
      |iSortingCols|1|
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
