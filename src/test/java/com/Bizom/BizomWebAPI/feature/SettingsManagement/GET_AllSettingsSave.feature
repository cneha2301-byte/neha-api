@BizomWebAPI @SettingsManagement @AllSettingsSave @WarehouseOperations
Feature: All Settings Save API Testing
  As a system user
  I want to test the all settings save endpoint
  So that I can ensure proper functionality and redirection behavior for settings management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get all settings save without access token
    When I send the GET request to "settings_all_settings_save" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get all settings save with invalid access token
    And I send the GET request to "settings_all_settings_save" endpoint with dynamic access token and query parameters
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
  Scenario: Get all settings save with expired access token
    And I send the GET request to "settings_all_settings_save" endpoint with dynamic access token and query parameters
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
  Scenario: Get all settings save with malformed access token
    And I send the GET request to "settings_all_settings_save" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

#  @Positive @Smoke @Redirection
#  Scenario: Get all settings save with valid access token and verify redirection
#    And I send the GET request to "settings_all_settings_save" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Location|/settings/allsettings|
#    When I send the GET request to "settings_all_settings_redirect" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Content-Type|text/html; charset=UTF-8|
#
#  @Positive @Redirection
#  Scenario: Validate all settings save redirection behavior
#    And I send the GET request to "settings_all_settings_save" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Location|/settings/allsettings|

#  @Positive @DataValidation
#  Scenario: Validate all settings save redirect response structure
#    And I send the GET request to "settings_all_settings_save" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Location|/settings/allsettings|
#
#  @Positive @Performance
#  Scenario: Performance test for all settings save endpoint
#    And I send the GET request to "settings_all_settings_save" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "302"
#    And verify response time is less than "1500" milliseconds
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Location|/settings/allsettings|
#
#  @Positive @Concurrency
#  Scenario: Concurrent access test for all settings save endpoint
#    And I send the GET request to "settings_all_settings_save" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Location|/settings/allsettings|
#
#  @Negative @Validation
#  Scenario: Get all settings save with invalid query parameters
#    And I send the GET request to "settings_all_settings_save" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |invalid_param|invalid_value|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Location|/settings/allsettings|
#
#  @Negative @ErrorHandling
#  Scenario: Get all settings save with invalid endpoint
#    And I send the GET request to "settings_all_settings_save_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds
#
#  @Positive @BusinessLogic
#  Scenario: Validate all settings save business logic
#    And I send the GET request to "settings_all_settings_save" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Location|/settings/allsettings|
#
#  @Positive @Regression
#  Scenario: Regression test for all settings save endpoint
#    And I send the GET request to "settings_all_settings_save" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Location|/settings/allsettings|
#
#  @Positive @Functional
#  Scenario: Validate all settings save redirect flow
#    And I send the GET request to "settings_all_settings_save" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Location|/settings/allsettings|
#    When I send the GET request to "settings_all_settings_redirect" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Content-Type|text/html; charset=UTF-8|
#
#  @Positive @RedirectHeaderValidation
#  Scenario: Validate all settings save Location header
#    And I send the GET request to "settings_all_settings_save" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Location|/settings/allsettings|
#
#  @Positive @RedirectFlowValidation
#  Scenario: Validate complete redirect flow from all settings save to all settings
#    And I send the GET request to "settings_all_settings_save" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Location|/settings/allsettings|
#    When I send the GET request to "settings_all_settings_redirect" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Content-Type|text/html; charset=UTF-8|
#
#  @Positive @HTMLResponseValidation
#  Scenario: Validate all settings HTML response after redirect
#    And I send the GET request to "settings_all_settings_save" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds
#    When I send the GET request to "settings_all_settings_redirect" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Content-Type|text/html; charset=UTF-8|
#
#  @Positive @LoadTesting
#  Scenario: Load testing for all settings save endpoint
#    And I send the GET request to "settings_all_settings_save" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "302"
#    And verify response time is less than "3000" milliseconds
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Location|/settings/allsettings|
#
#  @Negative @Timeout
#  Scenario: Test all settings save endpoint timeout handling
#    And I send the GET request to "settings_all_settings_save" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "302"
#    And verify response time is less than "5000" milliseconds
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Location|/settings/allsettings|
#
#  @Positive @EndToEnd
#  Scenario: End-to-end all settings save redirect workflow
#    And I send the GET request to "settings_all_settings_save" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Location|/settings/allsettings|
#    When I send the GET request to "settings_all_settings_redirect" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Content-Type|text/html; charset=UTF-8|
#    And I store the response as "all_settings_response" name using full path

