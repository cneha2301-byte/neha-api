@BizomWebAPI @OS @InvoiceTemplateMappingsManagement @InvoiceTemplateMappingsIndex @UserAccessManagement
Feature: Invoice Template Mappings Index API Testing
  As a system user
  I want to test the invoice template mappings index endpoint
  So that I can ensure proper functionality and data retrieval for invoice template mappings management with DataTables format

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|application/json, text/javascript, */*; q=0.01|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

#  @Negative @Security
#  Scenario: Get invoice template mappings index without access token
#    When I send the GET request to "invoicetemplatemappings_index" endpoint with path parameters
#      |Path|Value|
#      |id|1|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get invoice template mappings index with invalid access token
    And I send the GET request to "invoicetemplatemappings_index" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|id|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get invoice template mappings index with expired access token
    And I send the GET request to "invoicetemplatemappings_index" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|id|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get invoice template mappings index with malformed access token
    And I send the GET request to "invoicetemplatemappings_index" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|id|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get invoice template mappings index for ID 1 with valid access token
    And I send the GET request to "invoicetemplatemappings_index" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |sEcho|1|||
      |iDisplayStart|0|||
      |iDisplayLength|10|||
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
      |$.aaData[0]|object|
    And I store the response as "invoice_template_mappings_index_response" name using full path

#  @Positive @Functional
#  Scenario: Get invoice template mappings index for ID 2 with valid access token
#    And I send the GET request to "invoicetemplatemappings_index" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|id|2|
#      |sEcho|1|||
#      |iDisplayStart|0|||
#      |iDisplayLength|10|||
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
#      |$.aaData[0]|object|

  @Positive @DataValidation
  Scenario: Validate invoice template mappings index response structure
    And I send the GET request to "invoicetemplatemappings_index" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |sEcho|1|||
      |iDisplayStart|0|||
      |iDisplayLength|10|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
      |$.aaData[0]|object|
      |$.aaData[0].Warehouse_erp_id|string|
      |$.aaData[0].Warehouseid|string|
      |$.aaData[0].Warehousename|string|
      |$.aaData[0].created|string|
      |$.aaData[0].id|string|
      |$.aaData[0].modified|string|
      |$.aaData[0].moduletype|string|
      |$.aaData[0].printertype|string|
      |$.aaData[0].templatename|string|
      |$.aaData[0].type|string|
      |$.aaData[0].action|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

  @Positive @DataValidation
  Scenario: Validate invoice template mappings index DataTables pagination parameters with 9 columns
    And I send the GET request to "invoicetemplatemappings_index" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |sEcho|1|||
      |iColumns|9|||
      |sColumns|,,,,,,,,|||
      |iDisplayStart|0|||
      |iDisplayLength|10|||
      |mDataProp_0|id|||
      |sSearch_0|||    |
      |bRegex_0|false|||
      |bSearchable_0|true|||
      |bSortable_0|true|||
      |mDataProp_1|templatename|||
      |sSearch_1|||              |
      |bRegex_1|false|||
      |bSearchable_1|true|||
      |bSortable_1|true|||
      |mDataProp_2|type|||
      |sSearch_2|||      |
      |bRegex_2|false|||
      |bSearchable_2|true|||
      |bSortable_2|true|||
      |mDataProp_3|Warehousename|||
      |sSearch_3|||               |
      |bRegex_3|false|||
      |bSearchable_3|true|||
      |bSortable_3|true|||
      |mDataProp_4|printertype|||
      |sSearch_4|||             |
      |bRegex_4|false|||
      |bSearchable_4|false|||
      |bSortable_4|true|||
      |mDataProp_5|moduletype|||
      |sSearch_5||            ||
      |bRegex_5|false|||
      |bSearchable_5|false|||
      |bSortable_5|true|||
      |mDataProp_6|created|||
      |sSearch_6|||         |
      |bRegex_6|false|||
      |bSearchable_6|false|||
      |bSortable_6|false|||
      |mDataProp_7|modified|||
      |sSearch_7|||          |
      |bRegex_7|false|||
      |bSearchable_7|false|||
      |bSortable_7|false|||
      |mDataProp_8|action|||
      |sSearch_8|||        |
      |bRegex_8|false|||
      |bSearchable_8|false|||
      |bSortable_8|false|||
      |sSearch|||         |
      |bRegex|false|||
      |iSortingCols|1|||
      |iSortCol_0|0|||
      |sSortDir_0|desc|||
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
  Scenario: Validate invoice template mappings index pagination with different display start
    And I send the GET request to "invoicetemplatemappings_index" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |sEcho|1|||
      |iDisplayStart|10|||
      |iDisplayLength|10|||
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
  Scenario: Validate invoice template mappings index pagination with different display length
    And I send the GET request to "invoicetemplatemappings_index" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |sEcho|1|||
      |iDisplayStart|0|||
      |iDisplayLength|25|||
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
  Scenario: Validate invoice template mappings index aaData array structure
    And I send the GET request to "invoicetemplatemappings_index" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |sEcho|1|||
      |iDisplayStart|0|||
      |iDisplayLength|10|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData|array|
      |$.aaData[0]|object|
      |$.aaData[0].Warehouse_erp_id|string|
      |$.aaData[0].Warehouseid|string|
      |$.aaData[0].Warehousename|string|
      |$.aaData[0].created|string|
      |$.aaData[0].id|string|
      |$.aaData[0].modified|string|
      |$.aaData[0].moduletype|string|
      |$.aaData[0].printertype|string|
      |$.aaData[0].templatename|string|
      |$.aaData[0].type|string|
      |$.aaData[0].action|string|
      |$.aaData[1]|object|
      |$.aaData[1].id|string|
      |$.aaData[1].templatename|string|
      |$.aaData[1].type|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|2|
      |$.iTotalDisplayRecords|2|

#  @Positive @DataValidation
#  Scenario: Validate invoice template mappings index with static values
#    And I send the GET request to "invoicetemplatemappings_index" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|id|1|
#      |sEcho|1|||
#      |iDisplayStart|0|||
#      |iDisplayLength|10|||
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|2|
#      |$.iTotalDisplayRecords|2|
#      |$.aaData[0].id|"49"|
#      |$.aaData[0].templatename|parakhsalereceipt|
#      |$.aaData[0].type|html|
#      |$.aaData[0].Warehousename|Company|
#      |$.aaData[0].moduletype|invoice|
#      |$.aaData[0].printertype|dotmatrix|
#      |$.aaData[1].id|"48"|
#      |$.aaData[1].templatename|jbplloadsheet|
#      |$.aaData[1].type|pdf|
#      |$.aaData[1].Warehousename|SLV Traders|
#      |$.aaData[1].moduletype|loadoutsheet|
#      |$.aaData[1].printertype|regular|

#  @Negative @Validation
#  Scenario: Get invoice template mappings index with invalid ID
#    And I send the GET request to "invoicetemplatemappings_index" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|id|abc|
#      |sEcho|1|||
#      |iDisplayStart|0|||
#      |iDisplayLength|10|||
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.aaData|array|

#  @Negative @Validation
#  Scenario: Get invoice template mappings index with non-existent ID
#    And I send the GET request to "invoicetemplatemappings_index" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|id|999999|
#      |sEcho|1|||
#      |iDisplayStart|0|||
#      |iDisplayLength|10|||
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.aaData|array|

#  @Negative @Validation
#  Scenario: Get invoice template mappings index with negative ID
#    And I send the GET request to "invoicetemplatemappings_index" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|id|-1|
#      |sEcho|1|||
#      |iDisplayStart|0|||
#      |iDisplayLength|10|||
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.aaData|array|

#  @Negative @Validation
#  Scenario: Get invoice template mappings index with zero ID
#    And I send the GET request to "invoicetemplatemappings_index" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|id|0|
#      |sEcho|1|||
#      |iDisplayStart|0|||
#      |iDisplayLength|10|||
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.aaData|array|

#  @Negative @Validation
#  Scenario: Get invoice template mappings index with special characters in ID
#    And I send the GET request to "invoicetemplatemappings_index" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|id|<script>alert('XSS')</script>|
#      |sEcho|1|||
#      |iDisplayStart|0|||
#      |iDisplayLength|10|||
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.aaData|array|
#
#  @Negative @Security
#  Scenario: Get invoice template mappings index with SQL injection attempt in ID
#    And I send the GET request to "invoicetemplatemappings_index" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|id|'; DROP TABLE invoicetemplatemappings; --|
#      |sEcho|1|||
#      |iDisplayStart|0|||
#      |iDisplayLength|10|||
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.aaData|array|

#  @Negative @ErrorHandling
#  Scenario: Get invoice template mappings index with invalid endpoint
#    And I send the GET request to "invoicetemplatemappings_index_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|id|1|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds
#
#  @Positive @Performance
#  Scenario: Performance test for invoice template mappings index endpoint
#    And I send the GET request to "invoicetemplatemappings_index" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|id|1|
#      |sEcho|1|||
#      |iDisplayStart|0|||
#      |iDisplayLength|10|||
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|

  @Positive @Concurrency
  Scenario: Concurrent access test for invoice template mappings index endpoint
    And I send the GET request to "invoicetemplatemappings_index" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |sEcho|1|||
      |iDisplayStart|0|||
      |iDisplayLength|10|||
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
      |$.aaData[0]|object|

  @Positive @BusinessLogic
  Scenario: Validate invoice template mappings index business logic
    And I send the GET request to "invoicetemplatemappings_index" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |sEcho|1|||
      |iDisplayStart|0|||
      |iDisplayLength|10|||
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
      |$.aaData[0]|object|

  @Positive @DataIntegrity
  Scenario: Validate invoice template mappings index data integrity
    And I send the GET request to "invoicetemplatemappings_index" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |sEcho|1|||
      |iDisplayStart|0|||
      |iDisplayLength|10|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
      |$.aaData[0]|object|
      |$.aaData[0].Warehouse_erp_id|string|
      |$.aaData[0].Warehouseid|string|
      |$.aaData[0].Warehousename|string|
      |$.aaData[0].created|string|
      |$.aaData[0].id|string|
      |$.aaData[0].modified|string|
      |$.aaData[0].moduletype|string|
      |$.aaData[0].printertype|string|
      |$.aaData[0].templatename|string|
      |$.aaData[0].type|string|
      |$.aaData[0].action|string|
    And validating the response contains the following values
      |Value|
      |sEcho|
      |iTotalRecords|
      |iTotalDisplayRecords|
      |aaData|
      |Warehouse_erp_id|
      |Warehouseid|
      |Warehousename|
      |created|
      |id|
      |modified|
      |moduletype|
      |printertype|
      |templatename|
      |type|
      |action|

  @Positive @Regression
  Scenario: Regression test for invoice template mappings index endpoint
    And I send the GET request to "invoicetemplatemappings_index" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |sEcho|1|||
      |iDisplayStart|0|||
      |iDisplayLength|10|||
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
      |$.aaData[0]|object|

#  @Positive @Functional
#  Scenario: Validate invoice template mappings index response completeness
#    And I send the GET request to "invoicetemplatemappings_index" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|id|1|
#      |sEcho|1|||
#      |iDisplayStart|0|||
#      |iDisplayLength|10|||
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.sEcho|number|
#      |$.iTotalRecords|number|
#      |$.iTotalDisplayRecords|number|
#      |$.aaData|array|
#      |$.aaData[0]|object|
#      |$.aaData[0].Warehouse_erp_id|string|
#      |$.aaData[0].Warehouseid|string|
#      |$.aaData[0].Warehousename|string|
#      |$.aaData[0].created|string|
#      |$.aaData[0].id|string|
#      |$.aaData[0].modified|string|
#      |$.aaData[0].moduletype|string|
#      |$.aaData[0].printertype|string|
#      |$.aaData[0].templatename|string|
#      |$.aaData[0].type|string|
#      |$.aaData[0].action|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|2|
#      |$.iTotalDisplayRecords|2|
#      |$.aaData[0].id|"49"|
#      |$.aaData[0].templatename|parakhsalereceipt|
#      |$.aaData[0].type|html|
#      |$.aaData[0].Warehousename|Company|

#  @Positive @ArrayValidation
#  Scenario: Validate invoice template mappings index array structure and content
#    And I send the GET request to "invoicetemplatemappings_index" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|id|1|
#      |sEcho|1|||
#      |iDisplayStart|0|||
#      |iDisplayLength|10|||
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.sEcho|number|
#      |$.iTotalRecords|number|
#      |$.iTotalDisplayRecords|number|
#      |$.aaData|array|
#      |$.aaData[0]|object|
#      |$.aaData[0].Warehouse_erp_id|string|
#      |$.aaData[0].Warehouseid|string|
#      |$.aaData[0].Warehousename|string|
#      |$.aaData[0].created|string|
#      |$.aaData[0].id|string|
#      |$.aaData[0].modified|string|
#      |$.aaData[0].moduletype|string|
#      |$.aaData[0].printertype|string|
#      |$.aaData[0].templatename|string|
#      |$.aaData[0].type|string|
#      |$.aaData[0].action|string|
#      |$.aaData[1]|object|
#      |$.aaData[1].id|string|
#      |$.aaData[1].templatename|string|
#      |$.aaData[1].type|string|
#      |$.aaData[1].Warehousename|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|2|
#      |$.iTotalDisplayRecords|2|
#      |$.aaData[0].id|"49"|
#      |$.aaData[0].templatename|parakhsalereceipt|
#      |$.aaData[0].type|html|
#      |$.aaData[0].Warehousename|Company|
#      |$.aaData[0].moduletype|invoice|
#      |$.aaData[0].printertype|dotmatrix|
#      |$.aaData[1].id|"48"|
#      |$.aaData[1].templatename|jbplloadsheet|
#      |$.aaData[1].type|pdf|
#      |$.aaData[1].Warehousename|SLV Traders|
#      |$.aaData[1].moduletype|loadoutsheet|
#      |$.aaData[1].printertype|regular|

  @Positive @ContentValidation
  Scenario: Validate invoice template mappings index content structure
    And I send the GET request to "invoicetemplatemappings_index" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |sEcho|1|||
      |iDisplayStart|0|||
      |iDisplayLength|10|||
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
      |Warehouse_erp_id|
      |Warehouseid|
      |Warehousename|
      |created|
      |id|
      |modified|
      |moduletype|
      |printertype|
      |templatename|
      |type|
      |action|

  @Positive @LoadTesting
  Scenario: Load testing for invoice template mappings index endpoint
    And I send the GET request to "invoicetemplatemappings_index" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |sEcho|1|||
      |iDisplayStart|0|||
      |iDisplayLength|10|||
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

  @Negative @Timeout
  Scenario: Test invoice template mappings index endpoint timeout handling
    And I send the GET request to "invoicetemplatemappings_index" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |sEcho|1|||
      |iDisplayStart|0|||
      |iDisplayLength|10|||
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

  @Positive @EndToEnd
  Scenario: End-to-end invoice template mappings index data retrieval workflow
    And I send the GET request to "invoicetemplatemappings_index" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |sEcho|1|||
      |iColumns|9|||
      |sColumns|,,,,,,,,|||
      |iDisplayStart|0|||
      |iDisplayLength|10|||
      |mDataProp_0|id|||
      |bSearchable_0|true|||
      |bSortable_0|true|||
      |mDataProp_1|templatename|||
      |bSearchable_1|true|||
      |bSortable_1|true|||
      |mDataProp_2|type|||
      |bSearchable_2|true|||
      |bSortable_2|true|||
      |mDataProp_3|Warehousename|||
      |bSearchable_3|true|||
      |bSortable_3|true|||
      |mDataProp_4|printertype|||
      |bSearchable_4|false|||
      |bSortable_4|true|||
      |mDataProp_5|moduletype|||
      |bSearchable_5|false|||
      |bSortable_5|true|||
      |mDataProp_6|created|||
      |bSearchable_6|false|||
      |bSortable_6|false|||
      |mDataProp_7|modified|||
      |bSearchable_7|false|||
      |bSortable_7|false|||
      |mDataProp_8|action|||
      |bSearchable_8|false|||
      |bSortable_8|false|||
      |sSearch|||         |
      |bRegex|false|||
      |iSortingCols|1|||
      |iSortCol_0|0|||
      |sSortDir_0|desc|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|2|
      |$.iTotalDisplayRecords|2|
    And I store the response as "invoice_template_mappings_index_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
      |$.aaData[0]|object|
      |$.aaData[0].Warehouse_erp_id|string|
      |$.aaData[0].Warehouseid|string|
      |$.aaData[0].Warehousename|string|
      |$.aaData[0].created|string|
      |$.aaData[0].id|string|
      |$.aaData[0].modified|string|
      |$.aaData[0].moduletype|string|
      |$.aaData[0].printertype|string|
      |$.aaData[0].templatename|string|
      |$.aaData[0].type|string|
      |$.aaData[0].action|string|
    And validating the response contains the following values
      |Value|
      |sEcho|
      |iTotalRecords|
      |iTotalDisplayRecords|
      |aaData|
      |Warehouse_erp_id|
      |Warehouseid|
      |Warehousename|
      |created|
      |id|
      |modified|
      |moduletype|
      |printertype|
      |templatename|
      |type|
      |action|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|2|
      |$.iTotalDisplayRecords|2|
      |$.aaData[0].id|"49"|
      |$.aaData[0].templatename|parakhsalereceipt|
      |$.aaData[0].type|html|
      |$.aaData[0].Warehousename|Company|
      |$.aaData[0].moduletype|invoice|
      |$.aaData[0].printertype|dotmatrix|
      |$.aaData[1].id|"48"|
      |$.aaData[1].templatename|jbplloadsheet|
      |$.aaData[1].type|pdf|
      |$.aaData[1].Warehousename|SLV Traders|
      |$.aaData[1].moduletype|loadoutsheet|
      |$.aaData[1].printertype|regular|

