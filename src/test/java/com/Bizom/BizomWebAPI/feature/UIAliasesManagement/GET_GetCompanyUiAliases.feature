@BizomWebAPI @UIAliasesManagement @GetCompanyUiAliases @UserManagement
Feature: Get Company UI Aliases API Testing
  As a system user
  I want to test the get company UI aliases endpoint
  So that I can ensure proper functionality for retrieving company UI aliases configuration

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get company UI aliases without access token
    When I send the GET request to "uialiases_get_company_ui_aliases" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_02 Get company UI aliases with invalid access token
#    And I send the GET request to "uialiases_get_company_ui_aliases" endpoint with dynamic access token and query parameters
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
#  Scenario: TC_03 Get company UI aliases with expired access token
#    And I send the GET request to "uialiases_get_company_ui_aliases" endpoint with dynamic access token and query parameters
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
#  Scenario: TC_04 Get company UI aliases with malformed access token
#    And I send the GET request to "uialiases_get_company_ui_aliases" endpoint with dynamic access token and query parameters
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
#  Scenario: TC_05 Get company UI aliases with valid access token
#    And I send the GET request to "uialiases_get_company_ui_aliases" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason|""|
#      |$.UiAlias|""|
#    And I store the response as "get_company_ui_aliases_response" name using full path

#  @Positive @DataValidation
#  Scenario: TC_06 Validate company UI aliases response structure
#    And I send the GET request to "uialiases_get_company_ui_aliases" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason|""|
#      |$.UiAlias|""|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|string|
#      |$.Reason|string|
#      |$.UiAlias|string|

#  @Positive @DataValidation
#  Scenario: TC_07 Validate company UI aliases Result field
#    And I send the GET request to "uialiases_get_company_ui_aliases" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|string|

  @Positive @DataValidation
  Scenario: TC_08 Validate company UI aliases Reason field
    And I send the GET request to "uialiases_get_company_ui_aliases" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Reason|string|

  @Positive @DataValidation
  Scenario: TC_09 Validate company UI aliases UiAlias field
    And I send the GET request to "uialiases_get_company_ui_aliases" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.UiAlias|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.UiAlias|string|

#  @Positive @DataValidation
#  Scenario: TC_10 Validate company UI aliases complete structure
#    And I send the GET request to "uialiases_get_company_ui_aliases" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason|""|
#      |$.UiAlias|""|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|string|
#      |$.Reason|string|
#      |$.UiAlias|string|

#  @Positive @Performance
#  Scenario: TC_11 Performance test for company UI aliases endpoint
#    And I send the GET request to "uialiases_get_company_ui_aliases" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason|""|
#      |$.UiAlias|""|

#  @Positive @Concurrency
#  Scenario: TC_12 Concurrent access test for company UI aliases endpoint
#    And I send the GET request to "uialiases_get_company_ui_aliases" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason|""|
#      |$.UiAlias|""|

#  @Negative @Validation
#  Scenario: TC_13 Get company UI aliases with invalid query parameters
#    And I send the GET request to "uialiases_get_company_ui_aliases" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |invalid_param|invalid_value|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason|""|
#      |$.UiAlias|""|

#  @Negative @Validation
#  Scenario: TC_14 Get company UI aliases with special characters in query parameters
#    And I send the GET request to "uialiases_get_company_ui_aliases" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason|""|
#      |$.UiAlias|""|

#  @Negative @Security
#  Scenario: TC_15 Get company UI aliases with SQL injection attempt
#    And I send the GET request to "uialiases_get_company_ui_aliases" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|'; DROP TABLE uialiases; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason|""|
#      |$.UiAlias|""|

#  @Negative @Boundary
#  Scenario: TC_16 Get company UI aliases with maximum query parameters
#    And I send the GET request to "uialiases_get_company_ui_aliases" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |param1|value1|
#      |param2|value2|
#      |param3|value3|
#      |param4|value4|
#      |param5|value5|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason|""|
#      |$.UiAlias|""|

  @Negative @ErrorHandling
  Scenario: TC_17 Get company UI aliases with invalid endpoint
    And I send the GET request to "uialiases_get_company_ui_aliases_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Positive @BusinessLogic
#  Scenario: TC_18 Validate company UI aliases business logic
#    And I send the GET request to "uialiases_get_company_ui_aliases" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason|""|
#      |$.UiAlias|""|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|string|
#      |$.Reason|string|
#      |$.UiAlias|string|

#  @Positive @DataIntegrity
#  Scenario: TC_19 Validate company UI aliases data integrity
#    And I send the GET request to "uialiases_get_company_ui_aliases" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|string|
#      |$.Reason|string|
#      |$.UiAlias|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason|""|
#      |$.UiAlias|""|

#  @Positive @Regression
#  Scenario: TC_20 Regression test for company UI aliases endpoint
#    And I send the GET request to "uialiases_get_company_ui_aliases" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason|""|
#      |$.UiAlias|""|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|string|
#      |$.Reason|string|
#      |$.UiAlias|string|

#  @Positive @Functional
#  Scenario: TC_21 Validate company UI aliases response completeness
#    And I send the GET request to "uialiases_get_company_ui_aliases" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason|""|
#      |$.UiAlias|""|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|string|
#      |$.Reason|string|
#      |$.UiAlias|string|
#    And validating the response contains the following values
#      |Value|
#      |Result|
#      |Reason|
#      |UiAlias|
#    And I store the response as "get_company_ui_aliases_response" name using full path

