@BizomWebAPI @MDMsManagement @GetSingulariseTableName @WorkflowAutomation @OS
Feature: Get Singularise Table Name API Testing
  As a system user
  I want to test the get singularise table name endpoint
  So that I can ensure proper functionality and data retrieval for singular table names from entity types

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get singularise table name without access token
    When I send the GET request to "mdms_getsingularise_table_name" endpoint with path parameters
      |Path|Value|
      |entityType|outlets|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get singularise table name with invalid access token
    And I send the GET request to "mdms_getsingularise_table_name" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|entityType|outlets|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get singularise table name with expired access token
    And I send the GET request to "mdms_getsingularise_table_name" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|entityType|outlets|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get singularise table name with malformed access token
    And I send the GET request to "mdms_getsingularise_table_name" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|entityType|outlets|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: Get singularise table name for outlets entity type with valid access token
    And I send the GET request to "mdms_getsingularise_table_name" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType|outlets|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|""|
      |$.strippedTableName|outlet|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.strippedTableName|string|

  @Positive @Functional
  Scenario: Get singularise table name for warehouses entity type with valid access token
    And I send the GET request to "mdms_getsingularise_table_name" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType|warehouses|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|""|
      |$.strippedTableName|warehouse|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.strippedTableName|string|

  @Positive @Functional
  Scenario: Get singularise table name for users entity type with valid access token
    And I send the GET request to "mdms_getsingularise_table_name" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType|users|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.strippedTableName|string|

  @Positive @Functional
  Scenario: Get singularise table name for vehicles entity type with valid access token
    And I send the GET request to "mdms_getsingularise_table_name" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType|vehicles|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.strippedTableName|string|

  @Negative @Validation
  Scenario: Get singularise table name with invalid entity type
    And I send the GET request to "mdms_getsingularise_table_name" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType|invalid_entity_type|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Negative @Validation
  Scenario: Get singularise table name with empty entity type
    And I send the GET request to "mdms_getsingularise_table_name" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType||
    Then I should see the response code as "500"
    And verify response time is less than "2000" milliseconds

#  @Negative @Validation
#  Scenario: Get singularise table name with special characters in entity type
#    And I send the GET request to "mdms_getsingularise_table_name" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|entityType|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get singularise table name with SQL injection attempt
#    And I send the GET request to "mdms_getsingularise_table_name" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|entityType|'; DROP TABLE mdms; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds

  @Negative @ErrorHandling
  Scenario: Get singularise table name with invalid endpoint
    And I send the GET request to "mdms_getsingularise_table_name_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType|outlets|
    Then I should see the response code as "404"
    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance test for get singularise table name endpoint
    And I send the GET request to "mdms_getsingularise_table_name" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType|outlets|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Regression
  Scenario: Regression test for get singularise table name endpoint
    And I send the GET request to "mdms_getsingularise_table_name" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType|outlets|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|""|
      |$.strippedTableName|outlet|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.strippedTableName|string|

  @Positive @Smoke
  Scenario: Get singularise table name for outlets entity type - DB validation
    And I send the GET request to "mdms_getsingularise_table_name" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType|outlets|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|""|
      |$.strippedTableName|outlet|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.strippedTableName|string|

  @Positive @Functional
  Scenario: Get singularise table name for warehouses entity type - DB validation
    And I send the GET request to "mdms_getsingularise_table_name" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType|warehouses|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|""|
      |$.strippedTableName|warehouse|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.strippedTableName|string|


