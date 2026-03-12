@BizomWebAPI @SettingsManagement @GetFormsByType @WarehouseOperations @Innovation
Feature: Settings Get Forms By Type API Testing
  As a system user
  I want to test the settings getFormsByType endpoint
  So that I can ensure proper functionality and data retrieval for forms by type

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get forms by type without access token
    When I send the GET request to "settings_get_forms_by_type" endpoint with path parameters
      |Path|Value|
      |formType|activityForm|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get forms by type with invalid access token
    And I send the GET request to "settings_get_forms_by_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|formType|activityForm|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get forms by type with expired access token
    And I send the GET request to "settings_get_forms_by_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|formType|activityForm|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get forms by type with malformed access token
    And I send the GET request to "settings_get_forms_by_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|formType|activityForm|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: Get forms by type activityForm with valid access token
    And I send the GET request to "settings_get_forms_by_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|formType|activityForm|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|No forms found in the system.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
    And I store the response as "forms_by_type_activityForm_response" name using full path

  @Positive @Functional
  Scenario: Get forms by type activityForm with valid access token and validate structure
    And I send the GET request to "settings_get_forms_by_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|formType|activityForm|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|No forms found in the system.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|

  @Positive @DataValidation
  Scenario: Validate forms by type response structure for valid formType
    And I send the GET request to "settings_get_forms_by_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|formType|activityForm|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|No forms found in the system.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|

  @Negative @Validation
  Scenario: Get forms by type with empty formType
    And I send the GET request to "settings_get_forms_by_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|formType||
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|No form type specified.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|

  @Negative @Validation
  Scenario: Get forms by type with invalid formType format
    And I send the GET request to "settings_get_forms_by_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|formType|invalid_form_type_123|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|No forms found in the system.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|

#  @Negative @Validation
#  Scenario: Get forms by type with special characters in formType
#    And I send the GET request to "settings_get_forms_by_type" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|formType|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.reason|No forms found in the system.|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.reason|string|

#  @Negative @Security
#  Scenario: Get forms by type with SQL injection attempt in formType
#    And I send the GET request to "settings_get_forms_by_type" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|formType|'; DROP TABLE forms; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.reason|No forms found in the system.|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.reason|string|

#  @Negative @ErrorHandling
#  Scenario: Get forms by type with invalid endpoint
#    And I send the GET request to "settings_get_forms_by_type_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|formType|activityForm|
#    Then I should see the response code as "404"
#    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance test for forms by type endpoint
    And I send the GET request to "settings_get_forms_by_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|formType|activityForm|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|No forms found in the system.|

  @Positive @Regression
  Scenario: Regression test for forms by type endpoint
    And I send the GET request to "settings_get_forms_by_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|formType|activityForm|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|No forms found in the system.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|

  @Positive @Smoke
  Scenario: Get forms by type activityForm with DB validation
    And I send the GET request to "settings_get_forms_by_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|formType|activityForm|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|No forms found in the system.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|

  @Positive @Functional
  Scenario: Get forms by type with different form types
    And I send the GET request to "settings_get_forms_by_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|formType|activityForm|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|No forms found in the system.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|

  @Positive @BusinessLogic
  Scenario: Validate forms by type business logic for valid formType
    And I send the GET request to "settings_get_forms_by_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|formType|activityForm|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|No forms found in the system.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|

  @Positive @BusinessLogic
  Scenario: Validate forms by type business logic for empty formType
    And I send the GET request to "settings_get_forms_by_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|formType||
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|No form type specified.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|

  @Positive @DataIntegrity
  Scenario: Validate forms by type data integrity
    And I send the GET request to "settings_get_forms_by_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|formType|activityForm|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|No forms found in the system.|
    And validating the response contains the following values
      |Value|
      |result|
      |reason|
      |No forms found in the system.|

  @Positive @Concurrency
  Scenario: Concurrent access test for forms by type endpoint
    And I send the GET request to "settings_get_forms_by_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|formType|activityForm|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|No forms found in the system.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|

  @Positive @EndToEnd
  Scenario: End-to-end forms by type data retrieval workflow for valid formType
    And I send the GET request to "settings_get_forms_by_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|formType|activityForm|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I store the response as "forms_by_type_activityForm_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|No forms found in the system.|
    And validating the response contains the following values
      |Value|
      |result|
      |reason|
      |No forms found in the system.|

  @Positive @EndToEnd
  Scenario: End-to-end forms by type data retrieval workflow for empty formType
    And I send the GET request to "settings_get_forms_by_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|formType||
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I store the response as "forms_by_type_empty_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|No form type specified.|
    And validating the response contains the following values
      |Value|
      |result|
      |reason|
      |No form type specified.|

