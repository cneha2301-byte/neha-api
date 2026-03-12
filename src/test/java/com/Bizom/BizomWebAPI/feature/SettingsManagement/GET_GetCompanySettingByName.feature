@BizomWebAPI @SettingsManagement @GetCompanySettingByName @WarehouseOperations @CE
Feature: Settings Get Company Setting By Name API Testing
  As a system user
  I want to test the settings getCompanySettingByName endpoint
  So that I can ensure proper functionality and data retrieval for company settings by name

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get company setting by name without access token
    When I send the GET request to "settings_get_company_setting_by_name" endpoint with path parameters
      |Path|Value|
      |settingName|enableBatch|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get company setting by name with invalid access token
    And I send the GET request to "settings_get_company_setting_by_name" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|settingName|enableBatch|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get company setting by name with expired access token
    And I send the GET request to "settings_get_company_setting_by_name" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|settingName|enableBatch|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get company setting by name with malformed access token
    And I send the GET request to "settings_get_company_setting_by_name" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|settingName|enableBatch|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

#  @Positive @Smoke
#  Scenario: Get company setting by name enableBatch with valid access token
#    And I send the GET request to "settings_get_company_setting_by_name" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|settingName|enableBatch|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason||
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|string|
#      |$.Reason|string|
#      |$.Setting|object|
#      |$.Setting.enablebatch|boolean|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Setting.enablebatch|false|
#    And I store the response as "company_setting_enableBatch_response" name using full path

#  @Positive @Functional
#  Scenario: Get company setting by name enableBatch with valid access token and validate structure
#    And I send the GET request to "settings_get_company_setting_by_name" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|settingName|enableBatch|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason||
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|string|
#      |$.Reason|string|
#      |$.Setting|object|
#      |$.Setting.enablebatch|boolean|

#  @Positive @DataValidation
#  Scenario: Validate company setting by name response structure for existing setting
#    And I send the GET request to "settings_get_company_setting_by_name" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|settingName|enableBatch|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason||
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|string|
#      |$.Reason|string|
#      |$.Setting|object|
#      |$.Setting.enablebatch|boolean|

#  @Positive @DataValidation
#  Scenario: Validate company setting by name with non-existent setting name
#    And I send the GET request to "settings_get_company_setting_by_name" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|settingName|nonExistentSetting|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason||
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|string|
#      |$.Reason|string|
#      |$.Setting|array|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Setting|[]|

#  @Positive @DataValidation
#  Scenario: Validate company setting by name specific data values
#    And I send the GET request to "settings_get_company_setting_by_name" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|settingName|enableBatch|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason||
#      |$.Setting.enablebatch|DB:settings:value: name=enableBatch|
#
#  @Negative @Validation
#  Scenario: Get company setting by name with invalid setting name format
#    And I send the GET request to "settings_get_company_setting_by_name" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|settingName|invalid_setting_name_123|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason||
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Setting|array|
#
#  @Negative @Validation
#  Scenario: Get company setting by name with special characters in setting name
#    And I send the GET request to "settings_get_company_setting_by_name" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|settingName|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason||
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Setting|array|
#
#  @Negative @Security
#  Scenario: Get company setting by name with SQL injection attempt in setting name
#    And I send the GET request to "settings_get_company_setting_by_name" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|settingName|'; DROP TABLE settings; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason||
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Setting|array|
#
#  @Negative @Validation
#  Scenario: Get company setting by name with empty setting name
#    And I send the GET request to "settings_get_company_setting_by_name" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|settingName||
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason||
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Setting|array|
#
#  @Negative @ErrorHandling
#  Scenario: Get company setting by name with invalid endpoint
#    And I send the GET request to "settings_get_company_setting_by_name_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|settingName|enableBatch|
#    Then I should see the response code as "404"
#    And verify response time is less than "2000" milliseconds
#
#  @Positive @Performance
#  Scenario: Performance test for company setting by name endpoint
#    And I send the GET request to "settings_get_company_setting_by_name" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|settingName|enableBatch|
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason||
#
#  @Positive @Regression
#  Scenario: Regression test for company setting by name endpoint
#    And I send the GET request to "settings_get_company_setting_by_name" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|settingName|enableBatch|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason||
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|string|
#      |$.Reason|string|
#      |$.Setting|object|
#
#  @Positive @Smoke
#  Scenario: Get company setting by name enableBatch with DB validation
#    And I send the GET request to "settings_get_company_setting_by_name" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|settingName|enableBatch|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason||
#      |$.Setting.enablebatch|DB:settings:value: name=enableBatch|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|string|
#      |$.Reason|string|
#      |$.Setting|object|
#      |$.Setting.enablebatch|boolean|
#
#  @Positive @Functional
#  Scenario: Get company setting by name with different setting names
#    And I send the GET request to "settings_get_company_setting_by_name" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|settingName|enableBatch|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason||
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|string|
#      |$.Reason|string|
#      |$.Setting|object|
#      |$.Setting.enablebatch|boolean|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Setting.enablebatch|false|
#
#  @Positive @BusinessLogic
#  Scenario: Validate company setting by name business logic for existing setting
#    And I send the GET request to "settings_get_company_setting_by_name" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|settingName|enableBatch|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason||
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|string|
#      |$.Reason|string|
#      |$.Setting|object|
#      |$.Setting.enablebatch|boolean|
#
#  @Positive @BusinessLogic
#  Scenario: Validate company setting by name business logic for non-existent setting
#    And I send the GET request to "settings_get_company_setting_by_name" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|settingName|nonExistentSetting|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason||
#      |$.Setting|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|string|
#      |$.Reason|string|
#      |$.Setting|array|
#
#  @Positive @DataIntegrity
#  Scenario: Validate company setting by name data integrity
#    And I send the GET request to "settings_get_company_setting_by_name" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|settingName|enableBatch|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|string|
#      |$.Reason|string|
#      |$.Setting|object|
#      |$.Setting.enablebatch|boolean|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason||
#      |$.Setting.enablebatch|false|
#    And validating the response contains the following values
#      |Value|
#      |Result|
#      |Reason|
#      |Setting|
#      |enablebatch|
#
#  @Positive @Concurrency
#  Scenario: Concurrent access test for company setting by name endpoint
#    And I send the GET request to "settings_get_company_setting_by_name" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|settingName|enableBatch|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason||
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|string|
#      |$.Reason|string|
#      |$.Setting|object|
#      |$.Setting.enablebatch|boolean|
#
#  @Positive @EndToEnd
#  Scenario: End-to-end company setting by name data retrieval workflow for existing setting
#    And I send the GET request to "settings_get_company_setting_by_name" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|settingName|enableBatch|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And I store the response as "company_setting_enableBatch_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|string|
#      |$.Reason|string|
#      |$.Setting|object|
#      |$.Setting.enablebatch|boolean|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason||
#      |$.Setting.enablebatch|false|
#    And validating the response contains the following values
#      |Value|
#      |Result|
#      |Reason|
#      |Setting|
#      |enablebatch|
#
#  @Positive @EndToEnd
#  Scenario: End-to-end company setting by name data retrieval workflow for non-existent setting
#    And I send the GET request to "settings_get_company_setting_by_name" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|settingName|nonExistentSetting|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And I store the response as "company_setting_nonExistent_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|string|
#      |$.Reason|string|
#      |$.Setting|array|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason||
#      |$.Setting|[]|
#    And validating the response contains the following values
#      |Value|
#      |Result|
#      |Reason|
#      |Setting|

