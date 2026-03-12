@BizomWebAPI @SettingsManagement @Settings @WarehouseOperations
Feature: Settings All Settings API Testing
  As a system user
  I want to test the settings allsettings endpoint
  So that I can ensure proper functionality and data retrieval for settings management

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
#  Scenario: Get all settings without access token
#    When I send the GET request to "settings_all_settings" endpoint with path parameters
#      |Path|Value|
#      |param1|1|
#      |param2|1|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get all settings with invalid access token
    And I send the GET request to "settings_all_settings" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|param1|1|
      |||param2|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get all settings with expired access token
    And I send the GET request to "settings_all_settings" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|param1|1|
      |||param2|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get all settings with malformed access token
    And I send the GET request to "settings_all_settings" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|param1|1|
      |||param2|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get all settings with valid access token
    And I send the GET request to "settings_all_settings" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|param1|1|
      |||param2|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
      |$.data[0]|object|
      |$.data[0].Setting|object|
      |$.data[0].Setting.id|string|
      |$.data[0].Setting.name|string|
      |$.data[0].Setting.setting_type|string|
      |$.data[0].Setting.value|string|
      |$.data[0].Setting.description|string|
    And I store the response as "all_settings_response" name using full path

  @Positive @DataValidation
  Scenario: Validate all settings response structure
    And I send the GET request to "settings_all_settings" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|param1|1|
      |||param2|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
      |$.data[0]|object|
      |$.data[0].Setting|object|
      |$.data[0].Setting.id|string|
      |$.data[0].Setting.name|string|
      |$.data[0].Setting.setting_type|string|
      |$.data[0].Setting.value|string|
      |$.data[0].Setting.description|string|
      |$.data[0].Setting.isjson|string|
      |$.data[0].Setting.company_id|string|
      |$.data[0].Setting.for_device|string|
      |$.data[0].Setting.is_active|string|
      |$.data[0].Setting.created|string|
      |$.data[0].Setting.modified|string|
      |$.data[0].Setting.isuserworkflow|boolean|
      |$.data[0].Setting.type|string|
      |$.data[0].Setting.submodule_mapping_id|string|

  @Positive @DataValidation
  Scenario: Validate all settings specific data values
    And I send the GET request to "settings_all_settings" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|param1|1|
      |||param2|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.data[0].Setting.name|DB:settings:name: id=2|
      |$.data[0].Setting.setting_type|DB:settings:setting_type: id=2|
      |$.data[1].Setting.name|DB:settings:name: id=5|
      |$.data[1].Setting.setting_type|DB:settings:setting_type: id=5|
      |$.data[2].Setting.name|DB:settings:name: id=6|
      |$.data[2].Setting.setting_type|DB:settings:setting_type: id=6|

#  @Positive @DataValidation
#  Scenario: Validate all settings with static values
#    And I send the GET request to "settings_all_settings" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|param1|1|
#      |||param2|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.data[0].Setting.id|"2"|
#      |$.data[0].Setting.name|stocktaking|
#      |$.data[0].Setting.setting_type|users|
#      |$.data[0].Setting.value|0|
#      |$.data[0].Setting.isjson|0|
#      |$.data[0].Setting.company_id|470212|
#      |$.data[0].Setting.for_device|1|
#      |$.data[0].Setting.is_active|1|
#      |$.data[0].Setting.isuserworkflow|false|
#      |$.data[0].Setting.type|Generic|
#      |$.data[1].Setting.id|"5"|
#      |$.data[1].Setting.name|claims|
#      |$.data[1].Setting.setting_type|users|
#      |$.data[1].Setting.value|0|
#      |$.data[2].Setting.id|"6"|
#      |$.data[2].Setting.name|isoutletcustomized|
#      |$.data[2].Setting.setting_type|company|
#      |$.data[2].Setting.value|1|

  @Positive @Performance
  Scenario: Performance test for all settings endpoint
    And I send the GET request to "settings_all_settings" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|param1|1|
      |||param2|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

  @Positive @Concurrency
  Scenario: Concurrent access test for all settings endpoint
    And I send the GET request to "settings_all_settings" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|param1|1|
      |||param2|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
      |$.data[0].Setting|object|
      |$.data[0].Setting.id|string|
      |$.data[0].Setting.name|string|

  @Negative @Validation
  Scenario: Get all settings with invalid path parameters
    And I send the GET request to "settings_all_settings" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|param1|999|
      |||param2|999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

#  @Negative @Validation
#  Scenario: Get all settings with special characters in path parameters
#    And I send the GET request to "settings_all_settings" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|param1|<script>alert('XSS')</script>|
#      |||param2|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get all settings with SQL injection attempt in path parameters
#    And I send the GET request to "settings_all_settings" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|param1|'; DROP TABLE settings; --|
#      |||param2|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: Get all settings with maximum path parameters
    And I send the GET request to "settings_all_settings" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|param1|999999|
      |||param2|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

#  @Negative @ErrorHandling
#  Scenario: Get all settings with invalid endpoint
#    And I send the GET request to "settings_all_settings_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|param1|1|
#      |||param2|1|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

  @Positive @BusinessLogic
  Scenario: Validate all settings business logic
    And I send the GET request to "settings_all_settings" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|param1|1|
      |||param2|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
      |$.data[0].Setting|object|
      |$.data[0].Setting.id|string|
      |$.data[0].Setting.name|string|
      |$.data[0].Setting.setting_type|string|
      |$.data[0].Setting.value|string|

  @Positive @DataIntegrity
  Scenario: Validate all settings data integrity
    And I send the GET request to "settings_all_settings" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|param1|1|
      |||param2|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
      |$.data[0].Setting|object|
      |$.data[0].Setting.id|string|
      |$.data[0].Setting.name|string|
      |$.data[0].Setting.setting_type|string|
      |$.data[0].Setting.value|string|
      |$.data[0].Setting.description|string|
      |$.data[0].Setting.isjson|string|
      |$.data[0].Setting.company_id|string|
      |$.data[0].Setting.for_device|string|
      |$.data[0].Setting.is_active|string|
      |$.data[0].Setting.isuserworkflow|boolean|
      |$.data[0].Setting.type|string|
      |$.data[0].Setting.submodule_mapping_id|string|
    And validating the response contains the following values
      |Value|
      |stocktaking|
      |claims|
      |isoutletcustomized|
      |users|
      |company|
      |Generic|

  @Positive @Regression
  Scenario: Regression test for all settings endpoint
    And I send the GET request to "settings_all_settings" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|param1|1|
      |||param2|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
      |$.data[0].Setting|object|
      |$.data[0].Setting.id|string|
      |$.data[0].Setting.name|string|

#  @Positive @Functional
#  Scenario: Validate all settings response completeness
#    And I send the GET request to "settings_all_settings" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|param1|1|
#      |||param2|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.data|array|
#      |$.data[0].Setting|object|
#      |$.data[0].Setting.id|string|
#      |$.data[0].Setting.name|string|
#      |$.data[0].Setting.setting_type|string|
#      |$.data[0].Setting.value|string|
#      |$.data[0].Setting.description|string|
#      |$.data[0].Setting.isjson|string|
#      |$.data[0].Setting.company_id|string|
#      |$.data[0].Setting.for_device|string|
#      |$.data[0].Setting.is_active|string|
#      |$.data[0].Setting.isuserworkflow|boolean|
#      |$.data[0].Setting.type|string|
#      |$.data[0].Setting.submodule_mapping_id|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.data[0].Setting.id|"2"|
#      |$.data[0].Setting.name|stocktaking|
#      |$.data[0].Setting.setting_type|users|
#      |$.data[0].Setting.value|0|
#      |$.data[1].Setting.id|"5"|
#      |$.data[1].Setting.name|claims|
#      |$.data[1].Setting.setting_type|users|
#      |$.data[1].Setting.value|0|
#      |$.data[2].Setting.id|"6"|
#      |$.data[2].Setting.name|isoutletcustomized|
#      |$.data[2].Setting.setting_type|company|
#      |$.data[2].Setting.value|1|

  @Positive @ArrayValidation
  Scenario: Validate all settings array structure and content
    And I send the GET request to "settings_all_settings" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|param1|1|
      |||param2|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
      |$.data[0]|object|
      |$.data[0].Setting|object|
      |$.data[1]|object|
      |$.data[1].Setting|object|
      |$.data[2]|object|
      |$.data[2].Setting|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data[0].Setting.id|"2"|
      |$.data[0].Setting.name|stocktaking|
      |$.data[0].Setting.setting_type|users|
      |$.data[1].Setting.id|"5"|
      |$.data[1].Setting.name|claims|
      |$.data[1].Setting.setting_type|users|
      |$.data[2].Setting.id|"6"|
      |$.data[2].Setting.name|isoutletcustomized|
      |$.data[2].Setting.setting_type|company|

  @Positive @ContentValidation
  Scenario: Validate all settings content structure
    And I send the GET request to "settings_all_settings" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|param1|1|
      |||param2|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |data|
      |Setting|
      |id|
      |name|
      |setting_type|
      |value|
      |description|
      |isjson|
      |company_id|
      |for_device|
      |is_active|
      |isuserworkflow|
      |type|
      |submodule_mapping_id|
      |stocktaking|
      |claims|
      |isoutletcustomized|
      |users|
      |company|
      |Generic|

  @Positive @LoadTesting
  Scenario: Load testing for all settings endpoint
    And I send the GET request to "settings_all_settings" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|param1|1|
      |||param2|1|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

  @Negative @Timeout
  Scenario: Test all settings endpoint timeout handling
    And I send the GET request to "settings_all_settings" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|param1|1|
      |||param2|1|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

#  @Positive @EndToEnd
#  Scenario: End-to-end all settings data retrieval workflow
#    And I send the GET request to "settings_all_settings" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|param1|1|
#      |||param2|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And I store the response as "all_settings_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.data|array|
#      |$.data[0].Setting|object|
#      |$.data[0].Setting.id|string|
#      |$.data[0].Setting.name|string|
#      |$.data[0].Setting.setting_type|string|
#      |$.data[0].Setting.value|string|
#      |$.data[0].Setting.description|string|
#      |$.data[0].Setting.isjson|string|
#      |$.data[0].Setting.company_id|string|
#      |$.data[0].Setting.for_device|string|
#      |$.data[0].Setting.is_active|string|
#      |$.data[0].Setting.isuserworkflow|boolean|
#      |$.data[0].Setting.type|string|
#      |$.data[0].Setting.submodule_mapping_id|string|
#    And validating the response contains the following values
#      |Value|
#      |data|
#      |Setting|
#      |id|
#      |name|
#      |setting_type|
#      |value|
#      |description|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.data[0].Setting.id|"2"|
#      |$.data[0].Setting.name|stocktaking|
#      |$.data[0].Setting.setting_type|users|
#      |$.data[0].Setting.value|0|
#      |$.data[0].Setting.isjson|0|
#      |$.data[0].Setting.company_id|470212|
#      |$.data[0].Setting.for_device|1|
#      |$.data[0].Setting.is_active|1|
#      |$.data[0].Setting.isuserworkflow|false|
#      |$.data[0].Setting.type|Generic|
#      |$.data[1].Setting.id|"5"|
#      |$.data[1].Setting.name|claims|
#      |$.data[1].Setting.setting_type|users|
#      |$.data[1].Setting.value|0|
#      |$.data[2].Setting.id|"6"|
#      |$.data[2].Setting.name|isoutletcustomized|
#      |$.data[2].Setting.setting_type|company|
#      |$.data[2].Setting.value|1|

