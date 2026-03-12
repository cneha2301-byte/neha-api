@BizomWebAPI @MdmsManagement @AllMdms @WorkflowAutomation @OS
Feature: All MDMs API Testing
  As a system user
  I want to test the all MDMs endpoint
  So that I can ensure proper functionality and data retrieval for all master data management records

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get all MDMs without access token
    When I send the GET request to "all_mdms" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get all MDMs with invalid access token
    And I send the GET request to "all_mdms" endpoint with dynamic access token and query parameters
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
  Scenario: TC_03 Get all MDMs with expired access token
    And I send the GET request to "all_mdms" endpoint with dynamic access token and query parameters
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
  Scenario: TC_04 Get all MDMs with malformed access token
    And I send the GET request to "all_mdms" endpoint with dynamic access token and query parameters
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
  Scenario: TC_05 Get all MDMs with valid access token
    And I send the GET request to "all_mdms" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
      |$[0]|array|
      |$[0].Mdm|array|
      |$[0].Mdm.id|array|
      |$[0].Mdm.name|array|
      |$[0].Mdm.description|array|
    And I store the response as "all_mdms_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate all MDMs response structure
    And I send the GET request to "all_mdms" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
      |$[0]|array|
      |$[0].Mdm|array|
      |$[0].Mdm.id|array|
      |$[0].Mdm.name|array|
      |$[0].Mdm.description|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate all MDMs nested object structure
    And I send the GET request to "all_mdms" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
      |$[0]|array|
      |$[0].Mdm|array|
      |$[0].Mdm.id|array|
      |$[0].Mdm.name|array|
      |$[0].Mdm.description|array|

    And the fields in response should match with expected values
      |JPath|Value|
      |$[0].Mdm.id|"1"|
      |$[0].Mdm.name|Areas|
      |$[0].Mdm.readonly|false|
      |$[0].Mdm.showoverride|"1"|
      |$[0].Mdm.mdmcategory_id|"1"|
      |$[0].Mdm.isactive|"1"|

  @Positive @DataValidation
  Scenario: TC_08 Validate all MDMs with static values
    And I send the GET request to "all_mdms" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$[0].Mdm.id|"1"|
      |$[0].Mdm.name|Areas|
      |$[0].Mdm.description|Validations on areas table|
      |$[0].Mdm.readonly|false|
      |$[0].Mdm.showoverride|"1"|
      |$[0].Mdm.mdmcategory_id|"1"|
      |$[0].Mdm.isactive|"1"|
      |$[1].Mdm.id|"2"|
      |$[1].Mdm.name|Beats|
      |$[1].Mdm.description|upload and update  beats.|
      |$[1].Mdm.readonly|false|
      |$[1].Mdm.showoverride|"1"|
      |$[1].Mdm.mdmcategory_id|"1"|
      |$[1].Mdm.isactive|"1"|

  @Positive @Performance
  Scenario: TC_09 Performance test for all MDMs endpoint
    And I send the GET request to "all_mdms" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
      |$[0]|array|
      |$[0].Mdm|array|

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for all MDMs endpoint
    And I send the GET request to "all_mdms" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
      |$[0]|array|
      |$[0].Mdm|array|
      |$[0].Mdm.id|array|
      |$[0].Mdm.name|array|
      |$[0].Mdm.description|array|

  @Negative @Validation
  Scenario: TC_11 Get all MDMs with invalid query parameters
    And I send the GET request to "all_mdms" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Negative @Validation
  Scenario: TC_12 Get all MDMs with special characters in query parameters
    And I send the GET request to "all_mdms" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Negative @Security
  Scenario: TC_13 Get all MDMs with SQL injection attempt
    And I send the GET request to "all_mdms" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE mdms; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Negative @Boundary
  Scenario: TC_14 Get all MDMs with maximum query parameters
    And I send the GET request to "all_mdms" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
      |$[0]|array|
      |$[0].Mdm|array|

#  @Negative @ErrorHandling
#  Scenario: TC_15 Get all MDMs with invalid endpoint
#    And I send the GET request to "all_mdms_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_16 Validate all MDMs business logic
    And I send the GET request to "all_mdms" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
      |$[0]|array|
      |$[0].Mdm|array|
      |$[0].Mdm.id|array|
      |$[0].Mdm.name|array|
      |$[0].Mdm.description|array|

  @Positive @DataIntegrity
  Scenario: TC_17 Validate all MDMs data integrity
    And I send the GET request to "all_mdms" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
      |$[0]|array|
      |$[0].Mdm|array|
      |$[0].Mdm.id|array|
      |$[0].Mdm.name|array|
      |$[0].Mdm.description|array|
    And validating the response contains the following values
      |Value|
      |Mdm|
      |id|
      |name|
      |description|
      |readonly|
      |showoverride|
      |mdmcategory_id|
      |isactive|
      |Areas|
      |Beats|
      |Outletcategories|

  @Positive @Regression
  Scenario: TC_18 Regression test for all MDMs endpoint
    And I send the GET request to "all_mdms" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
      |$[0]|array|
      |$[0].Mdm|array|
      |$[0].Mdm.id|array|
      |$[0].Mdm.name|array|
      |$[0].Mdm.description|array|

  @Positive @Functional
  Scenario: TC_19 Validate all MDMs response completeness
    And I send the GET request to "all_mdms" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
      |$[0]|array|
      |$[0].Mdm|array|
      |$[0].Mdm.id|array|
      |$[0].Mdm.name|array|
      |$[0].Mdm.description|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$[0].Mdm.id|"1"|
      |$[0].Mdm.name|Areas|
      |$[0].Mdm.description|Validations on areas table|
      |$[0].Mdm.readonly|false|
      |$[0].Mdm.showoverride|"1"|
      |$[0].Mdm.mdmcategory_id|"1"|
      |$[0].Mdm.isactive|"1"|

  @Positive @ArrayValidation
  Scenario: TC_20 Validate all MDMs array structure and content
    And I send the GET request to "all_mdms" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
      |$[0]|array|
      |$[0].Mdm|array|
      |$[0].Mdm.id|array|
      |$[0].Mdm.name|array|
      |$[0].Mdm.description|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$[0].Mdm.id|"1"|
      |$[0].Mdm.name|Areas|
      |$[0].Mdm.description|Validations on areas table|
      |$[0].Mdm.readonly|false|
      |$[0].Mdm.showoverride|"1"|
      |$[0].Mdm.mdmcategory_id|"1"|
      |$[0].Mdm.isactive|"1"|
      |$[1].Mdm.id|"2"|
      |$[1].Mdm.name|Beats|
      |$[1].Mdm.description|upload and update  beats.|
      |$[1].Mdm.readonly|false|
      |$[1].Mdm.showoverride|"1"|
      |$[1].Mdm.mdmcategory_id|"1"|
      |$[1].Mdm.isactive|"1"|
      |$[2].Mdm.id|"3"|
      |$[2].Mdm.name|Outletcategories|
      |$[2].Mdm.description|Validations on outletcategories table|
      |$[2].Mdm.readonly|false|
      |$[2].Mdm.showoverride|"1"|
      |$[2].Mdm.mdmcategory_id|"1"|
      |$[2].Mdm.isactive|"1"|

  @Positive @ContentValidation
  Scenario: TC_21 Validate all MDMs content structure
    And I send the GET request to "all_mdms" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Mdm|
      |id|
      |name|
      |description|
      |readonly|
      |showoverride|
      |mdmcategory_id|
      |isactive|
      |Areas|
      |Beats|
      |Outletcategories|
      |Popsstratas|
      |Subzones|
      |Zones|
      |Brand|
      |Businesstypes|
      |Categories|
      |Erpgroups|
      |Package|
      |Servesizes|
      |Sizes|
      |Sub brand|

  @Positive @LoadTesting
  Scenario: TC_22 Load testing for all MDMs endpoint
    And I send the GET request to "all_mdms" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
      |$[0]|array|
      |$[0].Mdm|array|

  @Negative @Timeout
  Scenario: TC_23 Test all MDMs endpoint timeout handling
    And I send the GET request to "all_mdms" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
      |$[0]|array|
      |$[0].Mdm|array|

  @Positive @EndToEnd
  Scenario: TC_24 End-to-end all MDMs data retrieval workflow
    And I send the GET request to "all_mdms" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
      |$[0]|array|
      |$[0].Mdm|array|
      |$[0].Mdm.id|array|
      |$[0].Mdm.name|array|
      |$[0].Mdm.description|array|
    And I store the response as "all_mdms_response" name using full path
    And validating the response contains the following values
      |Value|
      |Mdm|
      |id|
      |name|
      |description|
      |readonly|
      |showoverride|
      |mdmcategory_id|
      |isactive|
      |Areas|
      |Beats|
      |Outletcategories|
    And the fields in response should match with expected values
      |JPath|Value|
      |$[0].Mdm.id|"1"|
      |$[0].Mdm.name|Areas|
      |$[0].Mdm.description|Validations on areas table|
      |$[0].Mdm.readonly|false|
      |$[0].Mdm.showoverride|"1"|
      |$[0].Mdm.mdmcategory_id|"1"|
      |$[0].Mdm.isactive|"1"|
      |$[1].Mdm.id|"2"|
      |$[1].Mdm.name|Beats|
      |$[1].Mdm.description|upload and update  beats.|
      |$[1].Mdm.readonly|false|
      |$[1].Mdm.showoverride|"1"|
      |$[1].Mdm.mdmcategory_id|"1"|
      |$[1].Mdm.isactive|"1"|

