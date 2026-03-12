@BizomWebAPI @SettingsManagement @GetCurrentSetting @WarehouseOperations
Feature: Settings Get Current Setting API Testing
  As a system user
  I want to test the settings getCurrentSetting endpoint
  So that I can ensure proper functionality and data retrieval for current settings

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get current setting without access token
    When I send the GET request to "settings_get_current_setting" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get current setting with invalid access token
#    And I send the GET request to "settings_get_current_setting" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|invalid_token_12345|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get current setting with expired access token
#    And I send the GET request to "settings_get_current_setting" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|expired_token_12345|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get current setting with malformed access token
#    And I send the GET request to "settings_get_current_setting" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|malformed.token.here|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

#  @Positive @Smoke
#  Scenario: Get current setting with valid access token
#    And I send the GET request to "settings_get_current_setting" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|array|
#      |$[0]|object|
#      |$[0].id|string|
#      |$[0].name|string|
#      |$[0].value|string|
#      |$[0].for_device|string|
#      |$[0].description|string|
#      |$[0].override_id|string|
#      |$[0].modified|string|
#      |$[0].moduleid|string|
#      |$[0].submoduleid|string|
#      |$[0].setting_type|string|
#      |$[0].submoduleName|string|
#    And I store the response as "current_setting_response" name using full path

#  @Positive @DataValidation
#  Scenario: Validate current setting response structure
#    And I send the GET request to "settings_get_current_setting" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|array|
#      |$[0]|object|
#      |$[0].id|string|
#      |$[0].name|string|
#      |$[0].value|string|
#      |$[0].for_device|string|
#      |$[0].description|string|
#      |$[0].override_id|string|
#      |$[0].modified|string|
#      |$[0].moduleid|string|
#      |$[0].submoduleid|string|
#      |$[0].setting_type|string|
#      |$[0].submoduleName|string|
#      |$[1]|object|
#      |$[1].id|string|
#      |$[1].name|string|
#      |$[1].value|string|
#      |$[1].setting_type|string|
#      |$[2]|object|
#      |$[2].id|string|
#      |$[2].name|string|
#      |$[2].value|string|
#      |$[2].setting_type|string|

#  @Positive @DataValidation
#  Scenario: Validate current setting specific data values
#    And I send the GET request to "settings_get_current_setting" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$[0].name|DB:settings:name: id=2|
#      |$[0].value|DB:settings:value: id=2|
#      |$[0].setting_type|DB:settings:setting_type: id=2|
#      |$[1].name|DB:settings:name: id=5|
#      |$[1].value|DB:settings:value: id=5|
#      |$[1].setting_type|DB:settings:setting_type: id=5|
#      |$[2].name|DB:settings:name: id=9|
#      |$[2].value|DB:settings:value: id=9|
#      |$[2].setting_type|DB:settings:setting_type: id=9|

#  @Positive @DataValidation
#  Scenario: Validate current setting with static values
#    And I send the GET request to "settings_get_current_setting" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$[0].id|"2"|
#      |$[0].name|stocktaking|
#      |$[0].value|0|
#      |$[0].for_device|1|
#      |$[0].override_id|0|
#      |$[0].moduleid|41|
#      |$[0].submoduleid|54|
#      |$[0].setting_type|users|
#      |$[0].submoduleName|Stock at Outlet|
#      |$[1].id|"5"|
#      |$[1].name|claims|
#      |$[1].value|0|
#      |$[1].for_device|1|
#      |$[1].override_id|0|
#      |$[1].moduleid|5|
#      |$[1].submoduleid|10|
#      |$[1].setting_type|users|
#      |$[1].submoduleName|Claims|
#      |$[2].id|"9"|
#      |$[2].name|autoloadoutapprove|
#      |$[2].value|0|
#      |$[2].for_device|1|
#      |$[2].override_id|0|
#      |$[2].moduleid|48|
#      |$[2].submoduleid|29|
#      |$[2].setting_type|users|
#      |$[2].submoduleName|Loadout|

  @Positive @Performance
  Scenario: Performance test for current setting endpoint
    And I send the GET request to "settings_get_current_setting" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

#  @Positive @Concurrency
#  Scenario: Concurrent access test for current setting endpoint
#    And I send the GET request to "settings_get_current_setting" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|array|
#      |$[0]|object|
#      |$[0].id|string|
#      |$[0].name|string|
#      |$[0].value|string|
#      |$[0].setting_type|string|

  @Negative @Validation
  Scenario: Get current setting with invalid query parameters
    And I send the GET request to "settings_get_current_setting" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Negative @Validation
  Scenario: Get current setting with special characters in query parameters
    And I send the GET request to "settings_get_current_setting" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Negative @Security
  Scenario: Get current setting with SQL injection attempt
    And I send the GET request to "settings_get_current_setting" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE settings; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Negative @Boundary
  Scenario: Get current setting with maximum query parameters
    And I send the GET request to "settings_get_current_setting" endpoint with dynamic access token and query parameters
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

#  @Negative @ErrorHandling
#  Scenario: Get current setting with invalid endpoint
#    And I send the GET request to "settings_get_current_setting_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

#  @Positive @BusinessLogic
#  Scenario: Validate current setting business logic
#    And I send the GET request to "settings_get_current_setting" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|array|
#      |$[0]|object|
#      |$[0].id|string|
#      |$[0].name|string|
#      |$[0].value|string|
#      |$[0].setting_type|string|
#      |$[0].for_device|string|
#      |$[0].description|string|
#      |$[0].moduleid|string|
#      |$[0].submoduleid|string|
#      |$[0].submoduleName|string|

#  @Positive @DataIntegrity
#  Scenario: Validate current setting data integrity
#    And I send the GET request to "settings_get_current_setting" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|array|
#      |$[0]|object|
#      |$[0].id|string|
#      |$[0].name|string|
#      |$[0].value|string|
#      |$[0].for_device|string|
#      |$[0].description|string|
#      |$[0].override_id|string|
#      |$[0].modified|string|
#      |$[0].moduleid|string|
#      |$[0].submoduleid|string|
#      |$[0].setting_type|string|
#      |$[0].submoduleName|string|
#    And validating the response contains the following values
#      |Value|
#      |stocktaking|
#      |claims|
#      |autoloadoutapprove|
#      |users|
#      |Stock at Outlet|
#      |Claims|
#      |Loadout|
#      |id|
#      |name|
#      |value|
#      |setting_type|
#      |description|
#      |moduleid|
#      |submoduleid|

#  @Positive @Regression
#  Scenario: Regression test for current setting endpoint
#    And I send the GET request to "settings_get_current_setting" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|array|
#      |$[0]|object|
#      |$[0].id|string|
#      |$[0].name|string|
#      |$[0].value|string|
#      |$[0].setting_type|string|

#  @Positive @Functional
#  Scenario: Validate current setting response completeness
#    And I send the GET request to "settings_get_current_setting" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|array|
#      |$[0]|object|
#      |$[0].id|string|
#      |$[0].name|string|
#      |$[0].value|string|
#      |$[0].for_device|string|
#      |$[0].description|string|
#      |$[0].override_id|string|
#      |$[0].modified|string|
#      |$[0].moduleid|string|
#      |$[0].submoduleid|string|
#      |$[0].setting_type|string|
#      |$[0].submoduleName|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$[0].id|"2"|
#      |$[0].name|stocktaking|
#      |$[0].value|0|
#      |$[0].for_device|1|
#      |$[0].override_id|0|
#      |$[0].moduleid|41|
#      |$[0].submoduleid|54|
#      |$[0].setting_type|users|
#      |$[0].submoduleName|Stock at Outlet|
#      |$[1].id|"5"|
#      |$[1].name|claims|
#      |$[1].value|0|
#      |$[1].for_device|1|
#      |$[1].override_id|0|
#      |$[1].moduleid|5|
#      |$[1].submoduleid|10|
#      |$[1].setting_type|users|
#      |$[1].submoduleName|Claims|
#      |$[2].id|"9"|
#      |$[2].name|autoloadoutapprove|
#      |$[2].value|0|
#      |$[2].for_device|1|
#      |$[2].override_id|0|
#      |$[2].moduleid|48|
#      |$[2].submoduleid|29|
#      |$[2].setting_type|users|
#      |$[2].submoduleName|Loadout|

#  @Positive @ArrayValidation
#  Scenario: Validate current setting array structure and content
#    And I send the GET request to "settings_get_current_setting" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|array|
#      |$[0]|object|
#      |$[0].id|string|
#      |$[0].name|string|
#      |$[0].value|string|
#      |$[0].setting_type|string|
#      |$[1]|object|
#      |$[1].id|string|
#      |$[1].name|string|
#      |$[1].value|string|
#      |$[1].setting_type|string|
#      |$[2]|object|
#      |$[2].id|string|
#      |$[2].name|string|
#      |$[2].value|string|
#      |$[2].setting_type|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$[0].id|"2"|
#      |$[0].name|stocktaking|
#      |$[0].value|0|
#      |$[0].setting_type|users|
#      |$[1].id|"5"|
#      |$[1].name|claims|
#      |$[1].value|0|
#      |$[1].setting_type|users|
#      |$[2].id|"9"|
#      |$[2].name|autoloadoutapprove|
#      |$[2].value|0|
#      |$[2].setting_type|users|

  @Positive @ContentValidation
  Scenario: Validate current setting content structure
    And I send the GET request to "settings_get_current_setting" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |id|
      |name|
      |value|
      |for_device|
      |description|
      |override_id|
      |modified|
      |moduleid|
      |submoduleid|
      |setting_type|
      |submoduleName|
      |stocktaking|
      |claims|
      |autoloadoutapprove|
      |users|
      |Stock at Outlet|
      |Claims|
      |Loadout|

  @Positive @LoadTesting
  Scenario: Load testing for current setting endpoint
    And I send the GET request to "settings_get_current_setting" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Negative @Timeout
  Scenario: Test current setting endpoint timeout handling
    And I send the GET request to "settings_get_current_setting" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

#  @Positive @EndToEnd
#  Scenario: End-to-end current setting data retrieval workflow
#    And I send the GET request to "settings_get_current_setting" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And I store the response as "current_setting_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|array|
#      |$[0]|object|
#      |$[0].id|string|
#      |$[0].name|string|
#      |$[0].value|string|
#      |$[0].for_device|string|
#      |$[0].description|string|
#      |$[0].override_id|string|
#      |$[0].modified|string|
#      |$[0].moduleid|string|
#      |$[0].submoduleid|string|
#      |$[0].setting_type|string|
#      |$[0].submoduleName|string|
#    And validating the response contains the following values
#      |Value|
#      |id|
#      |name|
#      |value|
#      |setting_type|
#      |description|
#      |moduleid|
#      |submoduleid|
#      |submoduleName|
#      |stocktaking|
#      |claims|
#      |autoloadoutapprove|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$[0].id|"2"|
#      |$[0].name|stocktaking|
#      |$[0].value|0|
#      |$[0].for_device|1|
#      |$[0].override_id|0|
#      |$[0].moduleid|41|
#      |$[0].submoduleid|54|
#      |$[0].setting_type|users|
#      |$[0].submoduleName|Stock at Outlet|
#      |$[1].id|"5"|
#      |$[1].name|claims|
#      |$[1].value|0|
#      |$[1].for_device|1|
#      |$[1].override_id|0|
#      |$[1].moduleid|5|
#      |$[1].submoduleid|10|
#      |$[1].setting_type|users|
#      |$[1].submoduleName|Claims|
#      |$[2].id|"9"|
#      |$[2].name|autoloadoutapprove|
#      |$[2].value|0|
#      |$[2].for_device|1|
#      |$[2].override_id|0|
#      |$[2].moduleid|48|
#      |$[2].submoduleid|29|
#      |$[2].setting_type|users|
#      |$[2].submoduleName|Loadout|

