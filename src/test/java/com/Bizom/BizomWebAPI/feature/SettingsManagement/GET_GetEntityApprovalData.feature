@BizomWebAPI @SettingsManagement @GetEntityApprovalData @SystemOperations @CE
Feature: GetEntityApprovalData API Testing
  As a system user
  I want to test the entityApprovalData endpoint
  So that I can ensure proper functionality and data retrieval for entity approval data by type and approval type

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get entity approval data without access token
    When I send the GET request to "get_entity_approval_data" endpoint with path parameters
      |Path|Value|
      |entityType|outlet|
      |approvalType|role|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get entity approval data with invalid access token
    And I send the GET request to "get_entity_approval_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|entityType|outlet|
      |||approvalType|role|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get entity approval data with expired access token
    And I send the GET request to "get_entity_approval_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|entityType|outlet|
      |||approvalType|role|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get entity approval data with malformed access token
    And I send the GET request to "get_entity_approval_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|entityType|outlet|
      |||approvalType|role|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_05 Get entity approval data with empty access token
    And I send the GET request to "get_entity_approval_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token||entityType|outlet|
      |||approvalType|role|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_06 Get entity approval data with valid parameters
    And I send the GET request to "get_entity_approval_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType|outlet|
      |||approvalType|role|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.reason|""|
    And I store the response as "getentityapprovaldata_response" name using full path

  @Positive @DataValidation
  Scenario: TC_07 Validate get entity approval data response structure
    And I send the GET request to "get_entity_approval_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType|outlet|
      |||approvalType|role|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.reason|string|
      |$.data|object|
      |$.data.role|object|
      |$.data.configurationData|object|

  @Positive @DataValidation
  Scenario: TC_08 Validate role object structure
    And I send the GET request to "get_entity_approval_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType|outlet|
      |||approvalType|role|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data.role["1"]|"ADMIN"|
      |$.data.role["2"]|"ZONE MANAGER"|
      |$.data.role["3"]|"WAREHOUSE MANAGER"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data.role|object|
      |$.data.role["1"]|string|

  @Positive @DataValidation
  Scenario: TC_09 Validate configurationData object structure
    And I send the GET request to "get_entity_approval_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType|outlet|
      |||approvalType|role|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data.configurationData|object|
      |$.data.configurationData.address|object|
      |$.data.configurationData.pin|object|
      |$.data.configurationData.name|object|
      |$.data.configurationData.address.column|string|
      |$.data.configurationData.address.approvalIds|array|
      |$.data.configurationData.address.requiredField|string|
      |$.data.configurationData.address.approverIds|array|

  @Positive @DataValidation
  Scenario: TC_10 Validate configurationData nested fields
    And I send the GET request to "get_entity_approval_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType|outlet|
      |||approvalType|role|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data.configurationData.address.column|"address"|
      |$.data.configurationData.address.requiredField|"0"|
      |$.data.configurationData.pin.column|"pin"|
      |$.data.configurationData.name.column|"name"|

  @Positive @DataValidation
  Scenario: TC_11 Validate get entity approval data response contains required fields
    And I send the GET request to "get_entity_approval_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType|outlet|
      |||approvalType|role|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Result|
      |reason|
      |data|
      |role|
      |configurationData|
      |address|
      |pin|
      |name|
      |column|
      |approvalIds|
      |approverIds|

  @Negative @Validation
  Scenario: TC_12 Get entity approval data with invalid entityType
    And I send the GET request to "get_entity_approval_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType|invalid_entity|
      |||approvalType|role|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_13 Get entity approval data with invalid approvalType
    And I send the GET request to "get_entity_approval_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType|outlet|
      |||approvalType|invalid_type|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_14 Get entity approval data with blank entityType
    And I send the GET request to "get_entity_approval_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType||
      |||approvalType|role|
    Then I should see the response code as "500"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_15 Get entity approval data with blank approvalType
    And I send the GET request to "get_entity_approval_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType|outlet|
      |||approvalType||
    Then I should see the response code as "500"
    And verify response time is less than "2500" milliseconds

#  @Negative @ErrorHandling
#  Scenario: TC_16 Get entity approval data with invalid endpoint
#    And I send the GET request to "get_entity_approval_data_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|entityType|outlet|
#      |||approvalType|role|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: TC_17 Performance test for get entity approval data endpoint
    And I send the GET request to "get_entity_approval_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType|outlet|
      |||approvalType|role|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @BusinessLogic
  Scenario: TC_18 Get entity approval data with different entityType
    And I send the GET request to "get_entity_approval_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType|warehouse|
      |||approvalType|role|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @BusinessLogic
  Scenario: TC_19 Get entity approval data with different approvalType
    And I send the GET request to "get_entity_approval_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType|outlet|
      |||approvalType|status|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Positive @Regression
  Scenario: TC_20 Regression test for get entity approval data endpoint
    And I send the GET request to "get_entity_approval_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType|outlet|
      |||approvalType|role|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.reason|string|
      |$.data|object|
      |$.data.role|object|
      |$.data.configurationData|object|
      |$.data.configurationData.address|object|
    And I store the response as "getentityapprovaldata_response" name using full path

