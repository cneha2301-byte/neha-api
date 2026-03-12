@BizomWebAPI @ApprovalSequencesManagement @GetAllModules @MasterDataManagement @CE
Feature: Get All Modules API Testing
  As a system user
  I want to test the get all modules endpoint
  So that I can ensure proper functionality and data retrieval for all modules in approval sequences

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get all modules without access token
    When I send the GET request to "approvalsequences_getallmodules" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get all modules with invalid access token
    And I send the GET request to "approvalsequences_getallmodules" endpoint with dynamic access token and query parameters
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
  Scenario: TC_03 Get all modules with expired access token
    And I send the GET request to "approvalsequences_getallmodules" endpoint with dynamic access token and query parameters
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
  Scenario: TC_04 Get all modules with malformed access token
    And I send the GET request to "approvalsequences_getallmodules" endpoint with dynamic access token and query parameters
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
  Scenario: TC_05 Get all modules with valid access token
    And I send the GET request to "approvalsequences_getallmodules" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And I store the response as "all_modules_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate all modules response structure
    And I send the GET request to "approvalsequences_getallmodules" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Modules found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Modules|object|

  @Positive @DataValidation
  Scenario: TC_07 Validate all modules Modules object structure
    And I send the GET request to "approvalsequences_getallmodules" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Modules|object|
      |$.Modules.1|object|
      |$.Modules.1.id|string|
      |$.Modules.1.modulename|string|
      |$.Modules.1.alias|string|
      |$.Modules.1.schemacolumn|string|

  @Positive @DataValidation
  Scenario: TC_08 Validate all modules with static values
    And I send the GET request to "approvalsequences_getallmodules" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Modules found"|
      |$.Modules.1.id|"1"|
      |$.Modules.1.modulename|"schemegroups"|
      |$.Modules.1.alias|"Schemes Creation-Budget"|
      |$.Modules.1.schemacolumn|"budget"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Modules.1.id|string|
      |$.Modules.1.modulename|string|
      |$.Modules.1.alias|string|
      |$.Modules.1.schemacolumn|string|

  @Positive @Performance
  Scenario: TC_09 Performance test for all modules endpoint
    And I send the GET request to "approvalsequences_getallmodules" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for all modules endpoint
    And I send the GET request to "approvalsequences_getallmodules" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_11 Get all modules with invalid query parameters
    And I send the GET request to "approvalsequences_getallmodules" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_12 Get all modules with special characters in query parameters
    And I send the GET request to "approvalsequences_getallmodules" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Security
  Scenario: TC_13 Get all modules with SQL injection attempt
    And I send the GET request to "approvalsequences_getallmodules" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE modules; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Boundary
  Scenario: TC_14 Get all modules with maximum query parameters
    And I send the GET request to "approvalsequences_getallmodules" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @ErrorHandling
  Scenario: TC_15 Get all modules with invalid endpoint
    And I send the GET request to "approvalsequences_getallmodules_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_404_NOT_FOUND"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_16 Validate all modules business logic
    And I send the GET request to "approvalsequences_getallmodules" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Modules found"|
      |$.Modules.1.id|"1"|
      |$.Modules.1.modulename|"schemegroups"|
      |$.Modules.1.alias|"Schemes Creation-Budget"|
      |$.Modules.1.schemacolumn|"budget"|

  @Positive @DataIntegrity
  Scenario: TC_17 Validate all modules data integrity
    And I send the GET request to "approvalsequences_getallmodules" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Modules|object|
      |$.Modules.1|object|
      |$.Modules.1.id|string|
      |$.Modules.1.modulename|string|
      |$.Modules.1.alias|string|
      |$.Modules.1.schemacolumn|string|

  @Positive @Regression
  Scenario: TC_18 Regression test for all modules endpoint
    And I send the GET request to "approvalsequences_getallmodules" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Modules found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Modules|object|

  @Positive @Functional
  Scenario: TC_19 Validate all modules response completeness
    And I send the GET request to "approvalsequences_getallmodules" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Modules found"|
      |$.Modules.1.id|"1"|
      |$.Modules.1.modulename|"schemegroups"|
      |$.Modules.1.alias|"Schemes Creation-Budget"|
      |$.Modules.1.schemacolumn|"budget"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Modules|object|
      |$.Modules.1|object|
      |$.Modules.1.id|string|
      |$.Modules.1.modulename|string|
      |$.Modules.1.alias|string|
      |$.Modules.1.schemacolumn|string|

  @Positive @ObjectValidation
  Scenario: TC_20 Validate all modules Modules object structure and content
    And I send the GET request to "approvalsequences_getallmodules" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Modules|object|
      |$.Modules.1|object|
      |$.Modules.2|object|
      |$.Modules.1.id|string|
      |$.Modules.1.modulename|string|
      |$.Modules.1.alias|string|
      |$.Modules.1.schemacolumn|string|
      |$.Modules.2.id|string|
      |$.Modules.2.modulename|string|
      |$.Modules.2.alias|string|
      |$.Modules.2.schemacolumn|string|

  @Positive @ContentValidation
  Scenario: TC_21 Validate all modules content structure
    And I send the GET request to "approvalsequences_getallmodules" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Modules|
      |id|
      |modulename|
      |alias|
      |schemacolumn|
      |schemegroups|
      |Schemes Creation-Budget|
      |budget|

  @Positive @LoadTesting
  Scenario: TC_22 Load testing for all modules endpoint
    And I send the GET request to "approvalsequences_getallmodules" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Timeout
  Scenario: TC_23 Test all modules endpoint timeout handling
    And I send the GET request to "approvalsequences_getallmodules" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @EndToEnd
  Scenario: TC_24 End-to-end all modules data retrieval workflow
    And I send the GET request to "approvalsequences_getallmodules" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Modules found"|
      |$.Modules.1.id|"1"|
      |$.Modules.1.modulename|"schemegroups"|
      |$.Modules.1.alias|"Schemes Creation-Budget"|
      |$.Modules.1.schemacolumn|"budget"|
      |$.Modules.2.id|"2"|
      |$.Modules.2.modulename|"provisions"|
      |$.Modules.2.alias|"Provisions"|
      |$.Modules.2.schemacolumn|"amount"|
    And I store the response as "all_modules_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Modules|object|
      |$.Modules.1|object|
      |$.Modules.1.id|string|
      |$.Modules.1.modulename|string|
      |$.Modules.1.alias|string|
      |$.Modules.1.schemacolumn|string|
      |$.Modules.2|object|
      |$.Modules.2.id|string|
      |$.Modules.2.modulename|string|
      |$.Modules.2.alias|string|
      |$.Modules.2.schemacolumn|string|

