@BizomWebAPI @SettingsManagement @ConfigurationMapping @WarehouseOperations
Feature: Settings Configuration Mapping API Testing
  As a system user
  I want to test the settings configurationMapping endpoint
  So that I can ensure proper functionality and data retrieval for configuration mapping management

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
#  Scenario: Get configuration mapping without access token
#    When I send the GET request to "settings_configuration_mapping" endpoint with path parameters
#      |Path|Value|
#      |param1|1|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get configuration mapping with invalid access token
    And I send the GET request to "settings_configuration_mapping" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|param1|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get configuration mapping with expired access token
    And I send the GET request to "settings_configuration_mapping" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|param1|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get configuration mapping with malformed access token
    And I send the GET request to "settings_configuration_mapping" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|param1|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get configuration mapping with valid access token
    And I send the GET request to "settings_configuration_mapping" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|param1|1|
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
      |$.aaData[0].Id|string|
      |$.aaData[0].cm_id|string|
      |$.aaData[0].name|string|
      |$.aaData[0].fromentity|string|
      |$.aaData[0].fromentity_value|string|
      |$.aaData[0].toentity|string|
      |$.aaData[0].toentity_value|string|
      |$.aaData[0].status|string|
    And I store the response as "configuration_mapping_response" name using full path

  @Positive @DataValidation
  Scenario: Validate configuration mapping response structure
    And I send the GET request to "settings_configuration_mapping" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|param1|1|
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
      |$.aaData[0].Id|string|
      |$.aaData[0].cm_id|string|
      |$.aaData[0].fromentity|string|
      |$.aaData[0].fromentity_value|string|
      |$.aaData[0].jsonData|string|
      |$.aaData[0].name|string|
      |$.aaData[0].status|string|
      |$.aaData[0].toentity|string|
      |$.aaData[0].toentity_value|string|

  @Positive @DataValidation
  Scenario: Validate configuration mapping DataTables pagination parameters with 7 columns
    And I send the GET request to "settings_configuration_mapping" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|param1|1|
      |sEcho|1|||
      |iColumns|7|||
      |sColumns|cm_id,name,fromentity,fromentity_value,toentity,toentity_name,status|||
      |iDisplayStart|0|||
      |iDisplayLength|10|||
      |mDataProp_0|0|||
      |sSearch_0|||   |
      |bRegex_0|false|||
      |bSearchable_0|true|||
      |bSortable_0|true|||
      |mDataProp_1|1|||
      |sSearch_1|||   |
      |bRegex_1|false|||
      |bSearchable_1|true|||
      |bSortable_1|true|||
      |mDataProp_2|2|||
      |sSearch_2|||   |
      |bRegex_2|false|||
      |bSearchable_2|true|||
      |bSortable_2|true|||
      |mDataProp_3|3|||
      |sSearch_3|||   |
      |bRegex_3|false|||
      |bSearchable_3|false|||
      |bSortable_3|false|||
      |mDataProp_4|4|||
      |sSearch_4|||   |
      |bRegex_4|false|||
      |bSearchable_4|true|||
      |bSortable_4|true|||
      |mDataProp_5|5|||
      |sSearch_5|||   |
      |bRegex_5|false|||
      |bSearchable_5|false|||
      |bSortable_5|false|||
      |mDataProp_6|6|||
      |sSearch_6|||   |
      |bRegex_6|false|||
      |bSearchable_6|false|||
      |bSortable_6|true|||
      |sSearch|||        |
      |bRegex|false|||
      |iSortCol_0|0|||
      |sSortDir_0|asc|||
      |iSortingCols|1|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|5|
      |$.iTotalDisplayRecords|5|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

#  @Positive @DataValidation
#  Scenario: Validate configuration mapping specific data values
#    And I send the GET request to "settings_configuration_mapping" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|param1|1|
#      |sEcho|1|||
#      |iDisplayStart|0|||
#      |iDisplayLength|10|||
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.aaData[0].name|DB:configurationmappings:name: id=1|
#      |$.aaData[0].fromentity|DB:configurationmappings:fromentity: id=1|
#      |$.aaData[1].name|DB:configurationmappings:name: id=2|
#      |$.aaData[1].fromentity|DB:configurationmappings:fromentity: id=2|

#  @Positive @DataValidation
#  Scenario: Validate configuration mapping with static values
#    And I send the GET request to "settings_configuration_mapping" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|param1|1|
#      |sEcho|1|||
#      |iDisplayStart|0|||
#      |iDisplayLength|10|||
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|5|
#      |$.iTotalDisplayRecords|5|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.aaData[0].Id|"1"|
#      |$.aaData[0].cm_id|"1"|
#      |$.aaData[0].name|invoicediscountageing|
#      |$.aaData[0].fromentity|warehouses|
#      |$.aaData[0].fromentity_value|2|
#      |$.aaData[0].toentity|outlets|
#      |$.aaData[0].toentity_value|0|
#      |$.aaData[0].status|1|
#      |$.aaData[1].Id|"2"|
#      |$.aaData[1].cm_id|"2"|
#      |$.aaData[1].name|applypassondiscount|
#      |$.aaData[1].fromentity|warehouses|
#      |$.aaData[1].fromentity_value|2|
#      |$.aaData[1].toentity|outlets|
#      |$.aaData[1].toentity_value|0|
#      |$.aaData[1].status|1|

  @Positive @Performance
  Scenario: Performance test for configuration mapping endpoint
    And I send the GET request to "settings_configuration_mapping" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|param1|1|
      |sEcho|1|||
      |iDisplayStart|0|||
      |iDisplayLength|10|||
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

  @Positive @Concurrency
  Scenario: Concurrent access test for configuration mapping endpoint
    And I send the GET request to "settings_configuration_mapping" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|param1|1|
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

  @Negative @Validation
  Scenario: Get configuration mapping with invalid path parameter
    And I send the GET request to "settings_configuration_mapping" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|param1|999|
      |sEcho|1|||
      |iDisplayStart|0|||
      |iDisplayLength|10|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData|array|

  @Negative @Validation
  Scenario: Get configuration mapping with invalid query parameters
    And I send the GET request to "settings_configuration_mapping" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|param1|1|
      |invalid_param|invalid_value|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

#  @Negative @Validation
#  Scenario: Get configuration mapping with special characters in path parameter
#    And I send the GET request to "settings_configuration_mapping" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|param1|<script>alert('XSS')</script>|
#      |sEcho|1|||
#      |iDisplayStart|0|||
#      |iDisplayLength|10|||
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get configuration mapping with SQL injection attempt in path parameter
#    And I send the GET request to "settings_configuration_mapping" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|param1|'; DROP TABLE configurationmappings; --|
#      |sEcho|1|||
#      |iDisplayStart|0|||
#      |iDisplayLength|10|||
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: Get configuration mapping with maximum query parameters
    And I send the GET request to "settings_configuration_mapping" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|param1|1|
      |sEcho|1|||
      |iColumns|7|||
      |iDisplayStart|0|||
      |iDisplayLength|100|||
      |param1|value1|||
      |param2|value2|||
      |param3|value3|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

#  @Negative @ErrorHandling
#  Scenario: Get configuration mapping with invalid endpoint
#    And I send the GET request to "settings_configuration_mapping_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|param1|1|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

  @Positive @BusinessLogic
  Scenario: Validate configuration mapping business logic
    And I send the GET request to "settings_configuration_mapping" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|param1|1|
      |sEcho|1|||
      |iDisplayStart|0|||
      |iDisplayLength|10|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|5|
      |$.iTotalDisplayRecords|5|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
      |$.aaData[0]|object|
      |$.aaData[0].Id|string|
      |$.aaData[0].cm_id|string|
      |$.aaData[0].name|string|
      |$.aaData[0].fromentity|string|
      |$.aaData[0].toentity|string|
      |$.aaData[0].status|string|

  @Positive @DataIntegrity
  Scenario: Validate configuration mapping data integrity
    And I send the GET request to "settings_configuration_mapping" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|param1|1|
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
      |$.aaData[0].Id|string|
      |$.aaData[0].cm_id|string|
      |$.aaData[0].fromentity|string|
      |$.aaData[0].fromentity_value|string|
      |$.aaData[0].jsonData|string|
      |$.aaData[0].name|string|
      |$.aaData[0].status|string|
      |$.aaData[0].toentity|string|
      |$.aaData[0].toentity_value|string|
    And validating the response contains the following values
      |Value|
      |invoicediscountageing|
      |applypassondiscount|
      |warehouses|
      |outlets|
      |1|
      |2|

  @Positive @Regression
  Scenario: Regression test for configuration mapping endpoint
    And I send the GET request to "settings_configuration_mapping" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|param1|1|
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
#  Scenario: Validate configuration mapping response completeness
#    And I send the GET request to "settings_configuration_mapping" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|param1|1|
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
#      |$.aaData[0].Id|string|
#      |$.aaData[0].cm_id|string|
#      |$.aaData[0].fromentity|string|
#      |$.aaData[0].fromentity_value|string|
#      |$.aaData[0].jsonData|string|
#      |$.aaData[0].name|string|
#      |$.aaData[0].status|string|
#      |$.aaData[0].toentity|string|
#      |$.aaData[0].toentity_value|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.aaData[0].Id|"1"|
#      |$.aaData[0].cm_id|"1"|
#      |$.aaData[0].name|invoicediscountageing|
#      |$.aaData[0].fromentity|warehouses|
#      |$.aaData[0].fromentity_value|2|
#      |$.aaData[0].toentity|outlets|
#      |$.aaData[0].toentity_value|0|
#      |$.aaData[0].status|1|
#      |$.aaData[1].Id|"2"|
#      |$.aaData[1].cm_id|"2"|
#      |$.aaData[1].name|applypassondiscount|
#      |$.aaData[1].fromentity|warehouses|
#      |$.aaData[1].fromentity_value|2|
#      |$.aaData[1].toentity|outlets|
#      |$.aaData[1].toentity_value|0|
#      |$.aaData[1].status|1|

#  @Positive @ArrayValidation
#  Scenario: Validate configuration mapping array structure and content
#    And I send the GET request to "settings_configuration_mapping" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|param1|1|
#      |sEcho|1|||
#      |iDisplayStart|0|||
#      |iDisplayLength|10|||
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|5|
#      |$.iTotalDisplayRecords|5|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.aaData|array|
#      |$.aaData[0]|object|
#      |$.aaData[0].Id|string|
#      |$.aaData[0].cm_id|string|
#      |$.aaData[0].name|string|
#      |$.aaData[0].fromentity|string|
#      |$.aaData[0].fromentity_value|string|
#      |$.aaData[0].toentity|string|
#      |$.aaData[0].toentity_value|string|
#      |$.aaData[0].status|string|
#      |$.aaData[1]|object|
#      |$.aaData[1].Id|string|
#      |$.aaData[1].cm_id|string|
#      |$.aaData[1].name|string|
#      |$.aaData[1].fromentity|string|
#      |$.aaData[1].fromentity_value|string|
#      |$.aaData[1].toentity|string|
#      |$.aaData[1].toentity_value|string|
#      |$.aaData[1].status|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.aaData[0].Id|"1"|
#      |$.aaData[0].cm_id|"1"|
#      |$.aaData[0].name|invoicediscountageing|
#      |$.aaData[0].fromentity|warehouses|
#      |$.aaData[0].fromentity_value|2|
#      |$.aaData[0].toentity|outlets|
#      |$.aaData[0].toentity_value|0|
#      |$.aaData[0].status|1|
#      |$.aaData[1].Id|"2"|
#      |$.aaData[1].cm_id|"2"|
#      |$.aaData[1].name|applypassondiscount|
#      |$.aaData[1].fromentity|warehouses|
#      |$.aaData[1].fromentity_value|2|
#      |$.aaData[1].toentity|outlets|
#      |$.aaData[1].toentity_value|0|
#      |$.aaData[1].status|1|
#      |$.aaData[2].Id|"2"|
#      |$.aaData[2].cm_id|"3"|
#      |$.aaData[2].name|applypassondiscount|
#      |$.aaData[2].fromentity|warehouses|
#      |$.aaData[2].fromentity_value|3|
#      |$.aaData[2].toentity|outlets|
#      |$.aaData[2].toentity_value|0|
#      |$.aaData[2].status|1|

  @Positive @ContentValidation
  Scenario: Validate configuration mapping content structure
    And I send the GET request to "settings_configuration_mapping" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|param1|1|
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
      |Id|
      |cm_id|
      |name|
      |fromentity|
      |fromentity_value|
      |toentity|
      |toentity_value|
      |status|
      |jsonData|
      |invoicediscountageing|
      |applypassondiscount|
      |warehouses|
      |outlets|

  @Positive @LoadTesting
  Scenario: Load testing for configuration mapping endpoint
    And I send the GET request to "settings_configuration_mapping" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|param1|1|
      |sEcho|1|||
      |iDisplayStart|0|||
      |iDisplayLength|10|||
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

  @Negative @Timeout
  Scenario: Test configuration mapping endpoint timeout handling
    And I send the GET request to "settings_configuration_mapping" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|param1|1|
      |sEcho|1|||
      |iDisplayStart|0|||
      |iDisplayLength|10|||
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

#  @Positive @EndToEnd
#  Scenario: End-to-end configuration mapping data retrieval workflow
#    And I send the GET request to "settings_configuration_mapping" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|param1|1|
#      |sEcho|1|||
#      |iColumns|7|||
#      |sColumns|cm_id,name,fromentity,fromentity_value,toentity,toentity_name,status|||
#      |iDisplayStart|0|||
#      |iDisplayLength|10|||
#      |mDataProp_0|0|||
#      |bSearchable_0|true|||
#      |bSortable_0|true|||
#      |mDataProp_1|1|||
#      |bSearchable_1|true|||
#      |bSortable_1|true|||
#      |mDataProp_2|2|||
#      |bSearchable_2|true|||
#      |bSortable_2|true|||
#      |mDataProp_3|3|||
#      |bSearchable_3|false|||
#      |bSortable_3|false|||
#      |mDataProp_4|4|||
#      |bSearchable_4|true|||
#      |bSortable_4|true|||
#      |mDataProp_5|5|||
#      |bSearchable_5|false|||
#      |bSortable_5|false|||
#      |mDataProp_6|6|||
#      |bSearchable_6|false|||
#      |bSortable_6|true|||
#      |sSearch|||        |
#      |bRegex|false|||
#      |iSortCol_0|0|||
#      |sSortDir_0|asc|||
#      |iSortingCols|1|||
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|5|
#      |$.iTotalDisplayRecords|5|
#    And I store the response as "configuration_mapping_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.sEcho|number|
#      |$.iTotalRecords|number|
#      |$.iTotalDisplayRecords|number|
#      |$.aaData|array|
#      |$.aaData[0]|object|
#      |$.aaData[0].Id|string|
#      |$.aaData[0].cm_id|string|
#      |$.aaData[0].fromentity|string|
#      |$.aaData[0].fromentity_value|string|
#      |$.aaData[0].jsonData|string|
#      |$.aaData[0].name|string|
#      |$.aaData[0].status|string|
#      |$.aaData[0].toentity|string|
#      |$.aaData[0].toentity_value|string|
#    And validating the response contains the following values
#      |Value|
#      |sEcho|
#      |iTotalRecords|
#      |iTotalDisplayRecords|
#      |aaData|
#      |Id|
#      |cm_id|
#      |name|
#      |fromentity|
#      |fromentity_value|
#      |toentity|
#      |toentity_value|
#      |status|
#      |jsonData|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.aaData[0].Id|"1"|
#      |$.aaData[0].cm_id|"1"|
#      |$.aaData[0].name|invoicediscountageing|
#      |$.aaData[0].fromentity|warehouses|
#      |$.aaData[0].fromentity_value|2|
#      |$.aaData[0].toentity|outlets|
#      |$.aaData[0].toentity_value|0|
#      |$.aaData[0].status|1|
#      |$.aaData[1].Id|"2"|
#      |$.aaData[1].cm_id|"2"|
#      |$.aaData[1].name|applypassondiscount|
#      |$.aaData[1].fromentity|warehouses|
#      |$.aaData[1].fromentity_value|2|
#      |$.aaData[1].toentity|outlets|
#      |$.aaData[1].toentity_value|0|
#      |$.aaData[1].status|1|
#      |$.aaData[2].Id|"2"|
#      |$.aaData[2].cm_id|"3"|
#      |$.aaData[2].name|applypassondiscount|
#      |$.aaData[2].fromentity|warehouses|
#      |$.aaData[2].fromentity_value|3|
#      |$.aaData[2].toentity|outlets|
#      |$.aaData[2].toentity_value|0|
#      |$.aaData[2].status|1|
#      |$.aaData[3].Id|"2"|
#      |$.aaData[3].cm_id|"4"|
#      |$.aaData[3].name|applypassondiscount|
#      |$.aaData[3].fromentity|warehouses|
#      |$.aaData[3].fromentity_value|4|
#      |$.aaData[3].toentity|outlets|
#      |$.aaData[3].toentity_value|0|
#      |$.aaData[3].status|1|
#      |$.aaData[4].Id|"2"|
#      |$.aaData[4].cm_id|"5"|
#      |$.aaData[4].name|applypassondiscount|
#      |$.aaData[4].fromentity|warehouses|
#      |$.aaData[4].fromentity_value|5|
#      |$.aaData[4].toentity|outlets|
#      |$.aaData[4].toentity_value|0|
#      |$.aaData[4].status|1|

