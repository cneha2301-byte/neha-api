@BizomWebAPI @FormDefinitionsManagement @GetFormDefinitions @DataProcessing @CE
Feature: Get Form Definitions API Testing
  As a system user
  I want to test the get form definitions endpoint
  So that I can ensure proper functionality and data retrieval for form definitions management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get form definitions without access token
    When I send the GET request to "formdefinitions_get" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get form definitions with invalid access token
    And I send the GET request to "formdefinitions_get" endpoint with dynamic access token and query parameters
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
  Scenario: TC_03 Get form definitions with expired access token
    And I send the GET request to "formdefinitions_get" endpoint with dynamic access token and query parameters
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
  Scenario: TC_04 Get form definitions with malformed access token
    And I send the GET request to "formdefinitions_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get form definitions with valid access token
    And I send the GET request to "formdefinitions_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And I store the response as "form_definitions_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate form definitions response structure
    And I send the GET request to "formdefinitions_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
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
      |$.Data|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate form definitions Data array structure
    And I send the GET request to "formdefinitions_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|
      |$.Data[0]|object|
      |$.Data[0].name|string|
      |$.Data[0].fields|array|

  @Positive @DataValidation
  Scenario: TC_08 Validate form definitions fields array structure
    And I send the GET request to "formdefinitions_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data[0].fields|array|
      |$.Data[0].fields[0]|object|
      |$.Data[0].fields[0].id|string|
      |$.Data[0].fields[0].formname|string|
      |$.Data[0].fields[0].columnname|string|
      |$.Data[0].fields[0].columnalias|string|
      |$.Data[0].fields[0].rolesacl|string|
      |$.Data[0].fields[0].defaultvalue|string|

  @Positive @DataValidation
  Scenario: TC_09 Validate form definitions field object structure
    And I send the GET request to "formdefinitions_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data[0].fields[0].id|string|
      |$.Data[0].fields[0].formname|string|
      |$.Data[0].fields[0].columnname|string|
      |$.Data[0].fields[0].columnalias|string|
      |$.Data[0].fields[0].hidden|boolean|
      |$.Data[0].fields[0].rolesacl|string|
      |$.Data[0].fields[0].defaultvalue|string|

  @Positive @Performance
  Scenario: TC_10 Performance test for form definitions endpoint
    And I send the GET request to "formdefinitions_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Positive @Concurrency
  Scenario: TC_11 Concurrent access test for form definitions endpoint
    And I send the GET request to "formdefinitions_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Negative @Validation
  Scenario: TC_12 Get form definitions with invalid query parameters
    And I send the GET request to "formdefinitions_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Negative @Validation
  Scenario: TC_13 Get form definitions with special characters in query parameters
    And I send the GET request to "formdefinitions_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Negative @Security
  Scenario: TC_14 Get form definitions with SQL injection attempt
    And I send the GET request to "formdefinitions_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE formdefinitions; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Negative @Boundary
  Scenario: TC_15 Get form definitions with maximum query parameters
    And I send the GET request to "formdefinitions_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Negative @ErrorHandling
  Scenario: TC_16 Get form definitions with invalid endpoint
    And I send the GET request to "formdefinitions_get_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_17 Validate form definitions business logic
    And I send the GET request to "formdefinitions_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|
      |$.Data[0]|object|
      |$.Data[0].name|string|
      |$.Data[0].fields|array|

  @Positive @DataIntegrity
  Scenario: TC_18 Validate form definitions data integrity
    And I send the GET request to "formdefinitions_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
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
      |$.Data|array|
      |$.Data[0]|object|
      |$.Data[0].name|string|
      |$.Data[0].fields|array|
      |$.Data[0].fields[0]|object|
      |$.Data[0].fields[0].id|string|
      |$.Data[0].fields[0].formname|string|
      |$.Data[0].fields[0].columnname|string|
      |$.Data[0].fields[0].columnalias|string|
      |$.Data[0].fields[0].rolesacl|string|
      |$.Data[0].fields[0].defaultvalue|string|

  @Positive @Regression
  Scenario: TC_19 Regression test for form definitions endpoint
    And I send the GET request to "formdefinitions_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
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
      |$.Data|array|
      |$.Data[0]|object|
      |$.Data[0].name|string|
      |$.Data[0].fields|array|

  @Positive @Functional
  Scenario: TC_20 Validate form definitions response completeness
    And I send the GET request to "formdefinitions_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|
      |$.Data[0]|object|
      |$.Data[0].name|string|
      |$.Data[0].fields|array|
      |$.Data[0].fields[0]|object|
      |$.Data[0].fields[0].id|string|
      |$.Data[0].fields[0].formname|string|
      |$.Data[0].fields[0].columnname|string|
      |$.Data[0].fields[0].columnalias|string|
      |$.Data[0].fields[0].rolesacl|string|
      |$.Data[0].fields[0].defaultvalue|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Positive @ArrayValidation
  Scenario: TC_21 Validate form definitions array structure and content
    And I send the GET request to "formdefinitions_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|
      |$.Data[0]|object|
      |$.Data[1]|object|
      |$.Data[0].fields|array|
      |$.Data[0].fields[0]|object|
      |$.Data[0].fields[1]|object|

  @Positive @ContentValidation
  Scenario: TC_22 Validate form definitions content structure
    And I send the GET request to "formdefinitions_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Data|
      |name|
      |fields|
      |id|
      |formname|
      |columnname|
      |columnalias|
      |hidden|
      |rolesacl|
      |defaultvalue|

  @Positive @LoadTesting
  Scenario: TC_23 Load testing for form definitions endpoint
    And I send the GET request to "formdefinitions_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Timeout
  Scenario: TC_24 Test form definitions endpoint timeout handling
    And I send the GET request to "formdefinitions_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @EndToEnd
  Scenario: TC_25 End-to-end form definitions data retrieval workflow
    And I send the GET request to "formdefinitions_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And I store the response as "form_definitions_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|
      |$.Data[0]|object|
      |$.Data[0].name|string|
      |$.Data[0].fields|array|
      |$.Data[0].fields[0]|object|
      |$.Data[0].fields[0].id|string|
      |$.Data[0].fields[0].formname|string|
      |$.Data[0].fields[0].columnname|string|
      |$.Data[0].fields[0].columnalias|string|
      |$.Data[0].fields[0].hidden|boolean|
      |$.Data[0].fields[0].rolesacl|string|
      |$.Data[0].fields[0].defaultvalue|string|

