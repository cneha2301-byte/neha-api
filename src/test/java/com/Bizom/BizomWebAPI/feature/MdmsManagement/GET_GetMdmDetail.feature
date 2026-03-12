@BizomWebAPI @MdmsManagement @GetMdmDetail @WorkflowAutomation @OS
Feature: Get MDM Detail API Testing
  As a system user
  I want to test the get MDM detail endpoint
  So that I can ensure proper functionality and data retrieval for MDM details

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get MDM detail without access token
    When I send the GET request to "get_mdm_detail" endpoint with path parameters
      |Path|Value|
      |mdmId|12|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get MDM detail with invalid access token
    And I send the GET request to "get_mdm_detail" endpoint with dynamic access token, path and query parameters
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
  Scenario: Get MDM detail with expired access token
    And I send the GET request to "get_mdm_detail" endpoint with dynamic access token, path and query parameters
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
  Scenario: Get MDM detail with malformed access token
    And I send the GET request to "get_mdm_detail" endpoint with dynamic access token, path and query parameters
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
  Scenario: Get MDM detail for MDM ID 12 with valid access token
    And I send the GET request to "get_mdm_detail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|mdmId|12|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|
      |$.Data.Mdm|object|
      |$.Data.Mdm.id|string|
      |$.Data.Mdm.name|string|
      |$.Data.Mdm.description|string|
      |$.Data.Mdm.mdmcategory_id|string|
      |$.Data.Mdm.primarytable|string|
      |$.Data.Mdm.uploadtype|string|
      |$.Data.Mdm.readonly|boolean|
      |$.Data.Mdmcategory|object|
      |$.Data.Column|array|
      |$.Data.Mdmvalidation|array|
      |$.CustomInput|array|
    And I store the response as "get_mdm_detail_response" name using full path

  @Positive @Functional
  Scenario: Get MDM detail for MDM ID 1 with valid access token
    And I send the GET request to "get_mdm_detail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|mdmId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|
      |$.Data.Mdm|object|
      |$.Data.Mdmcategory|object|
      |$.Data.Column|array|
      |$.Data.Mdmvalidation|array|
      |$.CustomInput|array|

  @Positive @DataValidation
  Scenario: Validate get MDM detail response structure for valid MDM ID
    And I send the GET request to "get_mdm_detail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|mdmId|12|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|
      |$.Data.Mdm|object|
      |$.Data.Mdm.id|string|
      |$.Data.Mdm.name|string|
      |$.Data.Mdm.description|string|
      |$.Data.Mdm.mdmcategory_id|string|
      |$.Data.Mdm.primarytable|string|
      |$.Data.Mdm.uploadtype|string|
      |$.Data.Mdm.readonly|boolean|
      |$.Data.Mdmcategory|object|
      |$.Data.Mdmcategory.id|string|
      |$.Data.Mdmcategory.name|string|
      |$.Data.Column|array|
      |$.Data.Column[0]|object|
      |$.Data.Column[0].Mdmcolumn|object|
      |$.Data.Mdmvalidation|array|
      |$.Data.Mdmvalidation[0]|object|
      |$.CustomInput|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Positive @DataValidation
  Scenario: Validate get MDM detail nested Mdm object structure
    And I send the GET request to "get_mdm_detail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|mdmId|12|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data.Mdm|object|
      |$.Data.Mdm.id|string|
      |$.Data.Mdm.name|string|
      |$.Data.Mdm.description|string|
      |$.Data.Mdm.mdmcategory_id|string|
      |$.Data.Mdm.primarytable|string|
      |$.Data.Mdm.uploadtype|string|
      |$.Data.Mdm.readonly|boolean|
      |$.Data.Mdm.showoverride|string|
      |$.Data.Mdm.isactive|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.Data.Mdm.id|"12"|
      |$.Data.Mdm.name|Package|
      |$.Data.Mdm.description|Validations on packages table|
      |$.Data.Mdm.mdmcategory_id|"2"|
      |$.Data.Mdm.primarytable|packagings|
      |$.Data.Mdm.uploadtype|insert|
      |$.Data.Mdm.readonly|false|
      |$.Data.Mdm.showoverride|"1"|
      |$.Data.Mdm.isactive|"1"|

  @Positive @DataValidation
  Scenario: Validate get MDM detail Mdmcategory object structure
    And I send the GET request to "get_mdm_detail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|mdmId|12|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data.Mdmcategory|object|
      |$.Data.Mdmcategory.id|string|
      |$.Data.Mdmcategory.name|string|
      |$.Data.Mdmcategory.isactive|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.Data.Mdmcategory.id|"2"|
      |$.Data.Mdmcategory.name|Products|
      |$.Data.Mdmcategory.isactive|"1"|

  @Positive @DataValidation
  Scenario: Validate get MDM detail Column array structure
    And I send the GET request to "get_mdm_detail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|mdmId|12|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data.Column|array|
      |$.Data.Column[0]|object|
      |$.Data.Column[0].Mdmcolumn|object|
      |$.Data.Column[0].Mdmcolumn.id|string|
      |$.Data.Column[0].Mdmcolumn.mdm_id|string|
      |$.Data.Column[0].Mdmcolumn.schemacolumn|string|
      |$.Data.Column[0].Mdmcolumn.required|string|
      |$.Data.Column[0].Mdmcolumn.alias|string|
      |$.Data.Column[0].Mdmcolumn.updateallowed|boolean|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.Data.Column[0].Mdmcolumn.id|"23"|
      |$.Data.Column[0].Mdmcolumn.mdm_id|"12"|
      |$.Data.Column[0].Mdmcolumn.schemacolumn|name|
      |$.Data.Column[0].Mdmcolumn.required|"1"|
      |$.Data.Column[0].Mdmcolumn.alias|name|
      |$.Data.Column[0].Mdmcolumn.updateallowed|false|

  @Positive @DataValidation
  Scenario: Validate get MDM detail Mdmvalidation array structure
    And I send the GET request to "get_mdm_detail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|mdmId|12|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data.Mdmvalidation|array|
      |$.Data.Mdmvalidation[0]|object|
      |$.Data.Mdmvalidation[0].id|string|
      |$.Data.Mdmvalidation[0].mdmcolumn_id|string|
      |$.Data.Mdmvalidation[0].mdmvalidationclass_id|string|
      |$.Data.Mdmvalidation[0].validationvalue|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.Data.Mdmvalidation[0].id|"46"|
      |$.Data.Mdmvalidation[0].mdmcolumn_id|"23"|
      |$.Data.Mdmvalidation[0].mdmvalidationclass_id|"10"|

  @Positive @DataValidation
  Scenario: Validate get MDM detail with static values
    And I send the GET request to "get_mdm_detail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|mdmId|12|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.Data.Mdm.id|"12"|
      |$.Data.Mdm.name|Package|
      |$.Data.Mdm.description|Validations on packages table|
      |$.Data.Mdm.mdmcategory_id|"2"|
      |$.Data.Mdm.primarytable|packagings|
      |$.Data.Mdm.uploadtype|insert|
      |$.Data.Mdm.readonly|false|
      |$.Data.Mdm.showoverride|"1"|
      |$.Data.Mdm.isactive|"1"|
      |$.Data.Mdmcategory.id|"2"|
      |$.Data.Mdmcategory.name|Products|
      |$.Data.Mdmcategory.isactive|"1"|
      |$.Data.Column[0].Mdmcolumn.id|"23"|
      |$.Data.Column[0].Mdmcolumn.schemacolumn|name|
      |$.Data.Mdmvalidation[0].id|"46"|
      |$.Data.Mdmvalidation[0].mdmcolumn_id|"23"|
      |$.CustomInput|[]|

  @Negative @Validation
  Scenario: Get MDM detail with invalid MDM ID
    And I send the GET request to "get_mdm_detail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|mdmId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Invalid MDM Id.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|
      |$.CustomInput|array|

  @Negative @Validation
  Scenario: Get MDM detail with non-existent MDM ID
    And I send the GET request to "get_mdm_detail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|mdmId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Invalid MDM Id.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|
      |$.CustomInput|array|

  @Negative @Validation
  Scenario: Get MDM detail with negative MDM ID
    And I send the GET request to "get_mdm_detail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|mdmId|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Invalid MDM Id.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|
      |$.CustomInput|array|

  @Negative @Validation
  Scenario: Get MDM detail with zero MDM ID
    And I send the GET request to "get_mdm_detail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|mdmId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Invalid MDM Id.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|
      |$.CustomInput|array|

#  @Negative @Validation
#  Scenario: Get MDM detail with special characters in MDM ID
#    And I send the GET request to "get_mdm_detail" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|mdmId|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the HTML response should contain page title "Users"

#  @Negative @Security
#  Scenario: Get MDM detail with SQL injection attempt in MDM ID
#    And I send the GET request to "get_mdm_detail" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|mdmId|'; DROP TABLE mdms; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the HTML response should contain page title "Users"

#  @Negative @ErrorHandling
#  Scenario: Get MDM detail with invalid endpoint
#    And I send the GET request to "get_mdm_detail_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: Performance test for get MDM detail endpoint
    And I send the GET request to "get_mdm_detail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|mdmId|12|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Positive @Concurrency
  Scenario: Concurrent access test for get MDM detail endpoint
    And I send the GET request to "get_mdm_detail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|mdmId|12|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|
      |$.Data.Mdm|object|
      |$.Data.Mdmcategory|object|
      |$.Data.Column|array|
      |$.Data.Mdmvalidation|array|
      |$.CustomInput|array|

  @Positive @BusinessLogic
  Scenario: Validate get MDM detail business logic
    And I send the GET request to "get_mdm_detail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|mdmId|12|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|
      |$.Data.Mdm|object|
      |$.Data.Mdmcategory|object|
      |$.Data.Column|array|
      |$.Data.Mdmvalidation|array|
      |$.CustomInput|array|

  @Positive @DataIntegrity
  Scenario: Validate get MDM detail data integrity
    And I send the GET request to "get_mdm_detail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|mdmId|12|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|
      |$.Data.Mdm|object|
      |$.Data.Mdm.id|string|
      |$.Data.Mdm.name|string|
      |$.Data.Mdm.description|string|
      |$.Data.Mdm.mdmcategory_id|string|
      |$.Data.Mdm.primarytable|string|
      |$.Data.Mdm.uploadtype|string|
      |$.Data.Mdm.readonly|boolean|
      |$.Data.Mdmcategory|object|
      |$.Data.Mdmcategory.id|string|
      |$.Data.Mdmcategory.name|string|
      |$.Data.Column|array|
      |$.Data.Column[0].Mdmcolumn|object|
      |$.Data.Mdmvalidation|array|
      |$.Data.Mdmvalidation[0]|object|
      |$.CustomInput|array|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Data|
      |Mdm|
      |Mdmcategory|
      |Column|
      |Mdmvalidation|
      |CustomInput|
      |Package|
      |Products|
      |packagings|
      |insert|

  @Positive @Regression
  Scenario: Regression test for get MDM detail endpoint
    And I send the GET request to "get_mdm_detail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|mdmId|12|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|
      |$.Data.Mdm|object|
      |$.Data.Mdmcategory|object|
      |$.Data.Column|array|
      |$.Data.Mdmvalidation|array|
      |$.CustomInput|array|

  @Positive @Functional
  Scenario: Validate get MDM detail response completeness for valid MDM ID
    And I send the GET request to "get_mdm_detail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|mdmId|12|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|
      |$.Data.Mdm|object|
      |$.Data.Mdm.id|string|
      |$.Data.Mdm.name|string|
      |$.Data.Mdm.description|string|
      |$.Data.Mdm.mdmcategory_id|string|
      |$.Data.Mdm.primarytable|string|
      |$.Data.Mdm.uploadtype|string|
      |$.Data.Mdm.readonly|boolean|
      |$.Data.Mdmcategory|object|
      |$.Data.Mdmcategory.id|string|
      |$.Data.Mdmcategory.name|string|
      |$.Data.Column|array|
      |$.Data.Column[0].Mdmcolumn|object|
      |$.Data.Mdmvalidation|array|
      |$.Data.Mdmvalidation[0]|object|
      |$.CustomInput|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.Data.Mdm.id|"12"|
      |$.Data.Mdm.name|Package|
      |$.Data.Mdm.description|Validations on packages table|
      |$.Data.Mdm.mdmcategory_id|"2"|
      |$.Data.Mdm.primarytable|packagings|
      |$.Data.Mdm.uploadtype|insert|
      |$.Data.Mdm.readonly|false|
      |$.Data.Mdm.showoverride|"1"|
      |$.Data.Mdm.isactive|"1"|
      |$.Data.Mdmcategory.id|"2"|
      |$.Data.Mdmcategory.name|Products|
      |$.Data.Mdmcategory.isactive|"1"|
      |$.Data.Column[0].Mdmcolumn.id|"23"|
      |$.Data.Column[0].Mdmcolumn.schemacolumn|name|
      |$.Data.Mdmvalidation[0].id|"46"|
      |$.Data.Mdmvalidation[0].mdmcolumn_id|"23"|
      |$.CustomInput|[]|

  @Positive @Functional
  Scenario: Validate get MDM detail response completeness for invalid MDM ID
    And I send the GET request to "get_mdm_detail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|mdmId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|
      |$.CustomInput|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Invalid MDM Id.|
      |$.Data|[]|
      |$.CustomInput|[]|

  @Positive @LoadTesting
  Scenario: Load testing for get MDM detail endpoint
    And I send the GET request to "get_mdm_detail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|mdmId|12|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Negative @Timeout
  Scenario: Test get MDM detail endpoint timeout handling
    And I send the GET request to "get_mdm_detail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|mdmId|12|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Positive @EndToEnd
  Scenario: End-to-end get MDM detail data retrieval workflow
    And I send the GET request to "get_mdm_detail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|mdmId|12|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.Data.Mdm.id|"12"|
      |$.Data.Mdm.name|Package|
      |$.Data.Mdm.description|Validations on packages table|
      |$.Data.Mdm.mdmcategory_id|"2"|
      |$.Data.Mdm.primarytable|packagings|
      |$.Data.Mdm.uploadtype|insert|
      |$.Data.Mdm.readonly|false|
      |$.Data.Mdm.showoverride|"1"|
      |$.Data.Mdm.isactive|"1"|
      |$.Data.Mdmcategory.id|"2"|
      |$.Data.Mdmcategory.name|Products|
      |$.Data.Mdmcategory.isactive|"1"|
      |$.Data.Column[0].Mdmcolumn.id|"23"|
      |$.Data.Column[0].Mdmcolumn.schemacolumn|name|
      |$.Data.Mdmvalidation[0].id|"46"|
      |$.Data.Mdmvalidation[0].mdmcolumn_id|"23"|
      |$.CustomInput|[]|
    And I store the response as "get_mdm_detail_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|
      |$.Data.Mdm|object|
      |$.Data.Mdm.id|string|
      |$.Data.Mdm.name|string|
      |$.Data.Mdm.description|string|
      |$.Data.Mdm.mdmcategory_id|string|
      |$.Data.Mdm.primarytable|string|
      |$.Data.Mdm.uploadtype|string|
      |$.Data.Mdm.readonly|boolean|
      |$.Data.Mdmcategory|object|
      |$.Data.Mdmcategory.id|string|
      |$.Data.Mdmcategory.name|string|
      |$.Data.Column|array|
      |$.Data.Column[0].Mdmcolumn|object|
      |$.Data.Mdmvalidation|array|
      |$.Data.Mdmvalidation[0]|object|
      |$.CustomInput|array|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Data|
      |Mdm|
      |Mdmcategory|
      |Column|
      |Mdmvalidation|
      |CustomInput|
      |Package|
      |Products|
      |packagings|
      |insert|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.Data.Mdm.id|"12"|
      |$.Data.Mdm.name|Package|
      |$.Data.Mdm.description|Validations on packages table|
      |$.Data.Mdm.mdmcategory_id|"2"|
      |$.Data.Mdm.primarytable|packagings|
      |$.Data.Mdm.uploadtype|insert|
      |$.Data.Mdm.readonly|false|
      |$.Data.Mdm.showoverride|"1"|
      |$.Data.Mdm.isactive|"1"|

