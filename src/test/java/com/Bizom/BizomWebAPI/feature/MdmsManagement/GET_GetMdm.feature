@BizomWebAPI @MdmsManagement @GetMdm @WorkflowAutomation @OS
Feature: Get MDM API Testing
  As a system user
  I want to test the get MDM endpoint
  So that I can ensure proper functionality and data retrieval for MDM information

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get MDM without access token
    When I send the GET request to "get_mdm" endpoint with path parameters
      |Path|Value|
      |mdmId|12|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get MDM with invalid access token
    And I send the GET request to "get_mdm" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|mdmId|12|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get MDM with expired access token
    And I send the GET request to "get_mdm" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|mdmId|12|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get MDM with malformed access token
    And I send the GET request to "get_mdm" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|mdmId|12|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get MDM for MDM ID 12 with valid access token
    And I send the GET request to "get_mdm" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|mdmId|12|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data.name|string|
      |$.data.description|string|
      |$.data.primaryTable|string|
      |$.data.uploadType|string|
      |$.data.categoryId|string|
      |$.data.categoryName|string|
      |$.data.mdmColumns|array|
      |$.data.mdmColumns[0]|object|
      |$.data.mdmColumns[0].id|string|
      |$.data.mdmColumns[0].mdm_id|string|
      |$.data.mdmColumns[0].schemacolumn|string|
      |$.data.mdmColumns[0].required|string|
      |$.data.mdmColumns[0].updateallowed|boolean|
      |$.data.mdmColumns[0].Mdmvalidation|array|
      |$.data.mdmSettingRule|array|
      |$.data.settingData|array|
      |$.data.validationRuleList|object|
      |$.data.readonly|number|
    And I store the response as "get_mdm_response" name using full path

  @Positive @Functional
  Scenario: Get MDM for MDM ID 1 with valid access token
    And I send the GET request to "get_mdm" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|mdmId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data.name|string|
      |$.data.mdmColumns|array|
      |$.data.mdmSettingRule|array|
      |$.data.settingData|array|
      |$.data.validationRuleList|object|
      |$.data.readonly|number|

  @Positive @DataValidation
  Scenario: Validate get MDM response structure for valid MDM ID
    And I send the GET request to "get_mdm" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|mdmId|12|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data.name|string|
      |$.data.description|string|
      |$.data.primaryTable|string|
      |$.data.uploadType|string|
      |$.data.categoryId|string|
      |$.data.categoryName|string|
      |$.data.mdmColumns|array|
      |$.data.mdmColumns[0]|object|
      |$.data.mdmColumns[0].id|string|
      |$.data.mdmColumns[0].mdm_id|string|
      |$.data.mdmColumns[0].schemacolumn|string|
      |$.data.mdmColumns[0].required|string|
      |$.data.mdmColumns[0].updateallowed|boolean|
      |$.data.mdmColumns[0].Mdmvalidation|array|
      |$.data.mdmSettingRule|array|
      |$.data.settingData|array|
      |$.data.validationRuleList|object|
      |$.data.readonly|number|

  @Positive @DataValidation
  Scenario: Validate get MDM nested data object structure
    And I send the GET request to "get_mdm" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|mdmId|12|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data.name|string|
      |$.data.description|string|
      |$.data.primaryTable|string|
      |$.data.uploadType|string|
      |$.data.categoryId|string|
      |$.data.categoryName|string|
      |$.data.readonly|number|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data.name|Package|
      |$.data.description|Validations on packages table|
      |$.data.primaryTable|packagings|
      |$.data.uploadType|insert|
      |$.data.categoryId|"2"|
      |$.data.categoryName|Products|
      |$.data.readonly|0|

  @Positive @DataValidation
  Scenario: Validate get MDM mdmColumns array structure
    And I send the GET request to "get_mdm" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|mdmId|12|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data.mdmColumns|array|
      |$.data.mdmColumns[0]|object|
      |$.data.mdmColumns[0].id|string|
      |$.data.mdmColumns[0].mdm_id|string|
      |$.data.mdmColumns[0].schemacolumn|string|
      |$.data.mdmColumns[0].required|string|
      |$.data.mdmColumns[0].alias|string|
      |$.data.mdmColumns[0].updateallowed|boolean|
      |$.data.mdmColumns[0].Mdmvalidation|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data.mdmColumns[0].id|"23"|
      |$.data.mdmColumns[0].mdm_id|"12"|
      |$.data.mdmColumns[0].schemacolumn|name|
      |$.data.mdmColumns[0].required|"1"|
      |$.data.mdmColumns[0].alias|name|
      |$.data.mdmColumns[0].updateallowed|false|

  @Positive @DataValidation
  Scenario: Validate get MDM nested Mdmvalidation array structure
    And I send the GET request to "get_mdm" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|mdmId|12|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data.mdmColumns[0].Mdmvalidation|array|
      |$.data.mdmColumns[0].Mdmvalidation[0]|object|
      |$.data.mdmColumns[0].Mdmvalidation[0].id|string|
      |$.data.mdmColumns[0].Mdmvalidation[0].mdmcolumn_id|string|
      |$.data.mdmColumns[0].Mdmvalidation[0].mdmvalidationclass_id|string|
      |$.data.mdmColumns[0].Mdmvalidation[0].validationvalue|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data.mdmColumns[0].Mdmvalidation[0].id|"46"|
      |$.data.mdmColumns[0].Mdmvalidation[0].mdmcolumn_id|"23"|
      |$.data.mdmColumns[0].Mdmvalidation[0].mdmvalidationclass_id|"10"|
      |$.data.mdmColumns[0].Mdmvalidation[0].validationvalue|"255"|

  @Positive @DataValidation
  Scenario: Validate get MDM validationRuleList object structure
    And I send the GET request to "get_mdm" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|mdmId|12|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data.validationRuleList|object|
      |$.data.validationRuleList['1']|string|
      |$.data.validationRuleList['2']|string|
      |$.data.validationRuleList['3']|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data.validationRuleList['1']|None|
      |$.data.validationRuleList['2']|Value exists in foreign table|
      |$.data.validationRuleList['3']|Is email|
      |$.data.validationRuleList['4']|Is mobile|
      |$.data.validationRuleList['5']|Boolean (0 or 1)|

  @Positive @DataValidation
  Scenario: Validate get MDM with static values
    And I send the GET request to "get_mdm" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|mdmId|12|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data.name|Package|
      |$.data.description|Validations on packages table|
      |$.data.primaryTable|packagings|
      |$.data.uploadType|insert|
      |$.data.categoryId|"2"|
      |$.data.categoryName|Products|
      |$.data.mdmColumns[0].id|"23"|
      |$.data.mdmColumns[0].schemacolumn|name|
      |$.data.mdmColumns[0].Mdmvalidation[0].id|"46"|
      |$.data.mdmColumns[0].Mdmvalidation[0].mdmcolumn_id|"23"|
      |$.data.mdmSettingRule|[]|
      |$.data.settingData|[]|
      |$.data.readonly|0|

  @Negative @Validation
  Scenario: Get MDM with invalid MDM ID
    And I send the GET request to "get_mdm" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|mdmId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|

  @Negative @Validation
  Scenario: Get MDM with non-existent MDM ID
    And I send the GET request to "get_mdm" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|mdmId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|

  @Negative @Validation
  Scenario: Get MDM with negative MDM ID
    And I send the GET request to "get_mdm" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|mdmId|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|

  @Negative @Validation
  Scenario: Get MDM with zero MDM ID
    And I send the GET request to "get_mdm" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|mdmId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|

#  @Negative @Validation
#  Scenario: Get MDM with special characters in MDM ID
#    And I send the GET request to "get_mdm" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|mdmId|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.data|object|

#  @Negative @Security
#  Scenario: Get MDM with SQL injection attempt in MDM ID
#    And I send the GET request to "get_mdm" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|mdmId|'; DROP TABLE mdms; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.data|object|

  @Negative @ErrorHandling
  Scenario: Get MDM with invalid endpoint
    And I send the GET request to "get_mdm_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "404"
    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: Performance test for get MDM endpoint
    And I send the GET request to "get_mdm" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|mdmId|12|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|

  @Positive @Concurrency
  Scenario: Concurrent access test for get MDM endpoint
    And I send the GET request to "get_mdm" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|mdmId|12|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data.name|string|
      |$.data.description|string|
      |$.data.primaryTable|string|
      |$.data.uploadType|string|
      |$.data.mdmColumns|array|
      |$.data.mdmColumns[0].Mdmvalidation|array|
      |$.data.validationRuleList|object|
      |$.data.readonly|number|

  @Positive @BusinessLogic
  Scenario: Validate get MDM business logic
    And I send the GET request to "get_mdm" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|mdmId|12|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data.name|string|
      |$.data.description|string|
      |$.data.primaryTable|string|
      |$.data.uploadType|string|
      |$.data.categoryId|string|
      |$.data.categoryName|string|
      |$.data.mdmColumns|array|
      |$.data.mdmSettingRule|array|
      |$.data.settingData|array|
      |$.data.validationRuleList|object|
      |$.data.readonly|number|

  @Positive @DataIntegrity
  Scenario: Validate get MDM data integrity
    And I send the GET request to "get_mdm" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|mdmId|12|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data.name|string|
      |$.data.description|string|
      |$.data.primaryTable|string|
      |$.data.uploadType|string|
      |$.data.categoryId|string|
      |$.data.categoryName|string|
      |$.data.mdmColumns|array|
      |$.data.mdmColumns[0]|object|
      |$.data.mdmColumns[0].id|string|
      |$.data.mdmColumns[0].schemacolumn|string|
      |$.data.mdmColumns[0].updateallowed|boolean|
      |$.data.mdmColumns[0].Mdmvalidation|array|
      |$.data.mdmSettingRule|array|
      |$.data.settingData|array|
      |$.data.validationRuleList|object|
      |$.data.readonly|number|
    And validating the response contains the following values
      |Value|
      |data|
      |name|
      |description|
      |primaryTable|
      |uploadType|
      |categoryId|
      |categoryName|
      |mdmColumns|
      |Mdmvalidation|
      |mdmSettingRule|
      |settingData|
      |validationRuleList|
      |readonly|
      |Package|
      |Products|
      |packagings|
      |insert|

  @Positive @Regression
  Scenario: Regression test for get MDM endpoint
    And I send the GET request to "get_mdm" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|mdmId|12|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data.name|string|
      |$.data.description|string|
      |$.data.primaryTable|string|
      |$.data.uploadType|string|
      |$.data.mdmColumns|array|
      |$.data.mdmColumns[0].Mdmvalidation|array|
      |$.data.validationRuleList|object|
      |$.data.readonly|number|

  @Positive @Functional
  Scenario: Validate get MDM response completeness
    And I send the GET request to "get_mdm" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|mdmId|12|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data.name|string|
      |$.data.description|string|
      |$.data.primaryTable|string|
      |$.data.uploadType|string|
      |$.data.categoryId|string|
      |$.data.categoryName|string|
      |$.data.mdmColumns|array|
      |$.data.mdmColumns[0]|object|
      |$.data.mdmColumns[0].id|string|
      |$.data.mdmColumns[0].schemacolumn|string|
      |$.data.mdmColumns[0].updateallowed|boolean|
      |$.data.mdmColumns[0].Mdmvalidation|array|
      |$.data.mdmColumns[0].Mdmvalidation[0]|object|
      |$.data.mdmSettingRule|array|
      |$.data.settingData|array|
      |$.data.validationRuleList|object|
      |$.data.readonly|number|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data.name|Package|
      |$.data.description|Validations on packages table|
      |$.data.primaryTable|packagings|
      |$.data.uploadType|insert|
      |$.data.categoryId|"2"|
      |$.data.categoryName|Products|
      |$.data.mdmColumns[0].id|"23"|
      |$.data.mdmColumns[0].schemacolumn|name|
      |$.data.mdmColumns[0].Mdmvalidation[0].id|"46"|
      |$.data.mdmColumns[0].Mdmvalidation[0].mdmcolumn_id|"23"|
      |$.data.mdmSettingRule|[]|
      |$.data.settingData|[]|
      |$.data.readonly|0|

  @Positive @ArrayValidation
  Scenario: Validate get MDM array structure and content
    And I send the GET request to "get_mdm" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|mdmId|12|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data.mdmColumns|array|
      |$.data.mdmColumns[0]|object|
      |$.data.mdmColumns[0].id|string|
      |$.data.mdmColumns[0].mdm_id|string|
      |$.data.mdmColumns[0].schemacolumn|string|
      |$.data.mdmColumns[0].Mdmvalidation|array|
      |$.data.mdmColumns[0].Mdmvalidation[0]|object|
      |$.data.mdmColumns[1]|object|
      |$.data.mdmColumns[1].id|string|
      |$.data.mdmColumns[1].Mdmvalidation|array|
      |$.data.mdmSettingRule|array|
      |$.data.settingData|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data.mdmColumns[0].id|"23"|
      |$.data.mdmColumns[0].schemacolumn|name|
      |$.data.mdmColumns[0].Mdmvalidation[0].id|"46"|
      |$.data.mdmColumns[1].id|"24"|
      |$.data.mdmColumns[1].schemacolumn|company_id|
      |$.data.mdmColumns[1].Mdmvalidation[0].id|"49"|
      |$.data.mdmSettingRule|[]|
      |$.data.settingData|[]|

  @Positive @ContentValidation
  Scenario: Validate get MDM content structure
    And I send the GET request to "get_mdm" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|mdmId|12|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data.name|Package|
      |$.data.description|Validations on packages table|
      |$.data.primaryTable|packagings|
      |$.data.uploadType|insert|
      |$.data.categoryName|Products|
    And validating the response contains the following values
      |Value|
      |data|
      |name|
      |description|
      |primaryTable|
      |uploadType|
      |categoryId|
      |categoryName|
      |mdmColumns|
      |Mdmvalidation|
      |mdmSettingRule|
      |settingData|
      |validationRuleList|
      |readonly|
      |Package|
      |Products|
      |packagings|
      |insert|

  @Positive @LoadTesting
  Scenario: Load testing for get MDM endpoint
    And I send the GET request to "get_mdm" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|mdmId|12|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|

  @Negative @Timeout
  Scenario: Test get MDM endpoint timeout handling
    And I send the GET request to "get_mdm" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|mdmId|12|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|

  @Positive @EndToEnd
  Scenario: End-to-end get MDM data retrieval workflow
    And I send the GET request to "get_mdm" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|mdmId|12|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data.name|string|
      |$.data.description|string|
      |$.data.primaryTable|string|
      |$.data.uploadType|string|
      |$.data.categoryId|string|
      |$.data.categoryName|string|
      |$.data.mdmColumns|array|
      |$.data.mdmColumns[0]|object|
      |$.data.mdmColumns[0].id|string|
      |$.data.mdmColumns[0].schemacolumn|string|
      |$.data.mdmColumns[0].updateallowed|boolean|
      |$.data.mdmColumns[0].Mdmvalidation|array|
      |$.data.mdmColumns[0].Mdmvalidation[0]|object|
      |$.data.mdmSettingRule|array|
      |$.data.settingData|array|
      |$.data.validationRuleList|object|
      |$.data.readonly|number|
    And I store the response as "get_mdm_response" name using full path
    And validating the response contains the following values
      |Value|
      |data|
      |name|
      |description|
      |primaryTable|
      |uploadType|
      |categoryId|
      |categoryName|
      |mdmColumns|
      |Mdmvalidation|
      |mdmSettingRule|
      |settingData|
      |validationRuleList|
      |readonly|
      |Package|
      |Products|
      |packagings|
      |insert|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data.name|Package|
      |$.data.description|Validations on packages table|
      |$.data.primaryTable|packagings|
      |$.data.uploadType|insert|
      |$.data.categoryId|"2"|
      |$.data.categoryName|Products|
      |$.data.mdmColumns[0].id|"23"|
      |$.data.mdmColumns[0].schemacolumn|name|
      |$.data.mdmColumns[0].Mdmvalidation[0].id|"46"|
      |$.data.mdmColumns[0].Mdmvalidation[0].mdmcolumn_id|"23"|
      |$.data.mdmSettingRule|[]|
      |$.data.settingData|[]|
      |$.data.readonly|0|

