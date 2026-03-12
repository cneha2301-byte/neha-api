@BizomWebAPI @FormDefinitionsManagement @GetFormFields @DataProcessing @CE
Feature: Get Form Fields API Testing
  As a system user
  I want to test the get form fields endpoint
  So that I can ensure proper functionality and data retrieval for form fields management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get form fields without access token
    When I send the GET request to "formdefinitions_getformfields" endpoint with path parameters
      |Path|Value|
      |formname|claimfilter|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get form fields with invalid access token
    And I send the GET request to "formdefinitions_getformfields" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|formname|claimfilter|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get form fields with expired access token
    And I send the GET request to "formdefinitions_getformfields" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|formname|claimfilter|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get form fields with malformed access token
    And I send the GET request to "formdefinitions_getformfields" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|formname|claimfilter|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get form fields for claimfilter with valid access token
    And I send the GET request to "formdefinitions_getformfields" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|formname|claimfilter|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And I store the response as "form_fields_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate form fields response structure
    And I send the GET request to "formdefinitions_getformfields" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|formname|claimfilter|
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
  Scenario: TC_07 Validate form fields Data array structure
    And I send the GET request to "formdefinitions_getformfields" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|formname|claimfilter|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|
      |$.Data[0]|object|
      |$.Data[0].Formdefinition|object|

  @Positive @DataValidation
  Scenario: TC_08 Validate Formdefinition nested object structure
    And I send the GET request to "formdefinitions_getformfields" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|formname|claimfilter|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data[0].Formdefinition|object|
      |$.Data[0].Formdefinition.id|string|
      |$.Data[0].Formdefinition.formname|string|
      |$.Data[0].Formdefinition.columnname|string|
      |$.Data[0].Formdefinition.columnalias|string|
      |$.Data[0].Formdefinition.hidden|boolean|
      |$.Data[0].Formdefinition.rolesacl|string|
      |$.Data[0].Formdefinition.defaultvalue|string|
      |$.Data[0].Formdefinition.editable|string|
      |$.Data[0].Formdefinition.required|string|
      |$.Data[0].Formdefinition.request_type|string|

  @Positive @DataValidation
  Scenario: TC_09 Validate form fields complete structure
    And I send the GET request to "formdefinitions_getformfields" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|formname|claimfilter|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|
      |$.Data[0]|object|
      |$.Data[0].Formdefinition|object|
      |$.Data[0].Formdefinition.id|string|
      |$.Data[0].Formdefinition.formname|string|
      |$.Data[0].Formdefinition.columnname|string|
      |$.Data[0].Formdefinition.columnalias|string|
      |$.Data[0].Formdefinition.hidden|boolean|
      |$.Data[0].Formdefinition.rolesacl|string|
      |$.Data[0].Formdefinition.defaultvalue|string|
      |$.Data[0].Formdefinition.editable|string|
      |$.Data[0].Formdefinition.required|string|
      |$.Data[0].Formdefinition.request_type|string|

  @Positive @Functional
  Scenario: TC_10 Get form fields for different form names
    And I send the GET request to "formdefinitions_getformfields" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|formname|claimfilter|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Positive @Performance
  Scenario: TC_11 Performance test for form fields endpoint
    And I send the GET request to "formdefinitions_getformfields" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|formname|claimfilter|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Positive @Concurrency
  Scenario: TC_12 Concurrent access test for form fields endpoint
    And I send the GET request to "formdefinitions_getformfields" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|formname|claimfilter|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Negative @Validation
  Scenario: TC_13 Get form fields with invalid form name
    And I send the GET request to "formdefinitions_getformfields" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|formname|invalidformname|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No such form field exists."|

#  @Negative @Validation
#  Scenario: TC_14 Get form fields with special characters in form name
#    And I send the GET request to "formdefinitions_getformfields" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|formname|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds
#
#  @Negative @Security
#  Scenario: TC_15 Get form fields with SQL injection attempt in form name
#    And I send the GET request to "formdefinitions_getformfields" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|formname|'; DROP TABLE formdefinitions; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the HTML response should contain page title "Users"
#
#  @Negative @Boundary
#  Scenario: TC_16 Get form fields with empty form name
#    And I send the GET request to "formdefinitions_getformfields" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|formname||
#    Then I should see the response code as "500"
#    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_17 Get form fields with invalid endpoint
    And I send the GET request to "formdefinitions_getformfields_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_18 Validate form fields business logic
    And I send the GET request to "formdefinitions_getformfields" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|formname|claimfilter|
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
      |$.Data[0].Formdefinition|object|
      |$.Data[0].Formdefinition.formname|string|

  @Positive @DataIntegrity
  Scenario: TC_19 Validate form fields data integrity
    And I send the GET request to "formdefinitions_getformfields" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|formname|claimfilter|
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
      |$.Data[0].Formdefinition|object|
      |$.Data[0].Formdefinition.id|string|
      |$.Data[0].Formdefinition.formname|string|
      |$.Data[0].Formdefinition.columnname|string|
      |$.Data[0].Formdefinition.columnalias|string|
      |$.Data[0].Formdefinition.hidden|boolean|
      |$.Data[0].Formdefinition.rolesacl|string|
      |$.Data[0].Formdefinition.defaultvalue|string|
      |$.Data[0].Formdefinition.editable|string|
      |$.Data[0].Formdefinition.required|string|
      |$.Data[0].Formdefinition.request_type|string|

  @Positive @Regression
  Scenario: TC_20 Regression test for form fields endpoint
    And I send the GET request to "formdefinitions_getformfields" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|formname|claimfilter|
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
      |$.Data[0].Formdefinition|object|
      |$.Data[0].Formdefinition.formname|string|

  @Positive @Functional
  Scenario: TC_21 Validate form fields response completeness
    And I send the GET request to "formdefinitions_getformfields" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|formname|claimfilter|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|
      |$.Data[0]|object|
      |$.Data[0].Formdefinition|object|
      |$.Data[0].Formdefinition.id|string|
      |$.Data[0].Formdefinition.formname|string|
      |$.Data[0].Formdefinition.columnname|string|
      |$.Data[0].Formdefinition.columnalias|string|
      |$.Data[0].Formdefinition.hidden|boolean|
      |$.Data[0].Formdefinition.rolesacl|string|
      |$.Data[0].Formdefinition.defaultvalue|string|
      |$.Data[0].Formdefinition.editable|string|
      |$.Data[0].Formdefinition.required|string|
      |$.Data[0].Formdefinition.request_type|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Positive @ArrayValidation
  Scenario: TC_22 Validate form fields array structure and content
    And I send the GET request to "formdefinitions_getformfields" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|formname|claimfilter|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|
      |$.Data[0]|object|
      |$.Data[1]|object|
      |$.Data[2]|object|
      |$.Data[3]|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Positive @NestedObjectValidation
  Scenario: TC_23 Validate form fields nested object structure
    And I send the GET request to "formdefinitions_getformfields" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|formname|claimfilter|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data[0]|object|
      |$.Data[0].Formdefinition|object|
      |$.Data[0].Formdefinition.id|string|
      |$.Data[0].Formdefinition.formname|string|
      |$.Data[0].Formdefinition.columnname|string|
      |$.Data[0].Formdefinition.columnalias|string|
      |$.Data[0].Formdefinition.hidden|boolean|
      |$.Data[0].Formdefinition.rolesacl|string|
      |$.Data[0].Formdefinition.defaultvalue|string|
      |$.Data[0].Formdefinition.editable|string|
      |$.Data[0].Formdefinition.required|string|
      |$.Data[0].Formdefinition.request_type|string|

  @Positive @ContentValidation
  Scenario: TC_24 Validate form fields content structure
    And I send the GET request to "formdefinitions_getformfields" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|formname|claimfilter|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Data|
      |Formdefinition|
      |id|
      |formname|
      |columnname|
      |columnalias|
      |hidden|
      |rolesacl|
      |defaultvalue|
      |editable|
      |required|
      |request_type|

  @Positive @LoadTesting
  Scenario: TC_25 Load testing for form fields endpoint
    And I send the GET request to "formdefinitions_getformfields" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|formname|claimfilter|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Timeout
  Scenario: TC_26 Test form fields endpoint timeout handling
    And I send the GET request to "formdefinitions_getformfields" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|formname|claimfilter|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @EndToEnd
  Scenario: TC_27 End-to-end form fields data retrieval workflow
    And I send the GET request to "formdefinitions_getformfields" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|formname|claimfilter|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And I store the response as "form_fields_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|
      |$.Data[0]|object|
      |$.Data[0].Formdefinition|object|
      |$.Data[0].Formdefinition.id|string|
      |$.Data[0].Formdefinition.formname|string|
      |$.Data[0].Formdefinition.columnname|string|
      |$.Data[0].Formdefinition.columnalias|string|
      |$.Data[0].Formdefinition.hidden|boolean|
      |$.Data[0].Formdefinition.rolesacl|string|
      |$.Data[0].Formdefinition.defaultvalue|string|
      |$.Data[0].Formdefinition.editable|string|
      |$.Data[0].Formdefinition.required|string|
      |$.Data[0].Formdefinition.request_type|string|

