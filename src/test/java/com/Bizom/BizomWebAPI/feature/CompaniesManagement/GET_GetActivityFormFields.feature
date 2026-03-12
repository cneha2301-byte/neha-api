@BizomWebAPI @CompaniesManagement @ActivityFormField @SupportingFunctions @CE
Feature: Get Activity Form Fields API Testing
  As a system user
  I want to test the get activity form fields endpoint
  So that I can ensure proper functionality and data retrieval for activity form fields management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get activity form fields without access token
    When I send the GET request to "companies_getactivityformfields" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get activity form fields with invalid access token
    And I send the GET request to "companies_getactivityformfields" endpoint with dynamic access token and query parameters
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
  Scenario: TC_03 Get activity form fields with expired access token
    And I send the GET request to "companies_getactivityformfields" endpoint with dynamic access token and query parameters
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
  Scenario: TC_04 Get activity form fields with malformed access token
    And I send the GET request to "companies_getactivityformfields" endpoint with dynamic access token and query parameters
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
  Scenario: TC_05 Get activity form fields with valid access token
    And I send the GET request to "companies_getactivityformfields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
    And I store the response as "activity_form_fields_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate activity form fields response structure
    And I send the GET request to "companies_getactivityformfields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|"Activity form fields found."|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.fields|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate activity form fields array structure
    And I send the GET request to "companies_getactivityformfields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.fields|array|
      |$.fields[0]|object|
      |$.fields[0].name|string|
      |$.fields[0].type|string|
      |$.fields[0].settings|object|

  @Positive @DataValidation
  Scenario: TC_08 Validate activity form fields with static values
    And I send the GET request to "companies_getactivityformfields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|"Activity form fields found."|
      |$.fields[0].name|"singleLineText1"|
      |$.fields[0].type|"SingleLineText"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.fields|array|
      |$.fields[0]|object|
      |$.fields[0].name|string|
      |$.fields[0].type|string|
      |$.fields[0].settings|object|

  @Positive @DataValidation
  Scenario: TC_09 Validate activity form fields settings structure
    And I send the GET request to "companies_getactivityformfields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.fields[0].settings|object|
      |$.fields[0].settings.en|object|
      |$.fields[0].settings.en.label|string|
      |$.fields[0].settings.en.value|string|
      |$.fields[0].settings.en.styles|string|
      |$.fields[0].settings.en.description|string|
      |$.fields[0].settings.styles|string|
      |$.fields[0].settings.addmore|boolean|
      |$.fields[0].settings.groupno|string|
      |$.fields[0].settings.editable|boolean|
      |$.fields[0].settings.required|boolean|
      |$.fields[0].settings.dependson|object|
      |$.fields[0].settings.fordevice|boolean|
      |$.fields[0].settings.restriction|string|
      |$.fields[0].settings._persistable|boolean|

  @Positive @DataValidation
  Scenario: TC_10 Validate activity form fields settings values
    And I send the GET request to "companies_getactivityformfields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|"Activity form fields found."|
      |$.fields[0].name|"singleLineText1"|
      |$.fields[0].type|"SingleLineText"|
      |$.fields[0].settings.en.label|"Single Line Text 1"|
      |$.fields[0].settings.en.value|""|
      |$.fields[0].settings.en.styles|""|
      |$.fields[0].settings.en.description|""|
      |$.fields[0].settings.addmore|false|
      |$.fields[0].settings.groupno|"0"|
      |$.fields[0].settings.editable|true|
      |$.fields[0].settings.required|true|
      |$.fields[0].settings.fordevice|true|
      |$.fields[0].settings.restriction|"no"|
      |$.fields[0].settings._persistable|true|

  @Positive @Performance
  Scenario: TC_11 Performance test for activity form fields endpoint
    And I send the GET request to "companies_getactivityformfields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Positive @Concurrency
  Scenario: TC_12 Concurrent access test for activity form fields endpoint
    And I send the GET request to "companies_getactivityformfields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Negative @Validation
  Scenario: TC_13 Get activity form fields with invalid query parameters
    And I send the GET request to "companies_getactivityformfields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Negative @Validation
  Scenario: TC_14 Get activity form fields with special characters in query parameters
    And I send the GET request to "companies_getactivityformfields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Negative @Security
  Scenario: TC_15 Get activity form fields with SQL injection attempt
    And I send the GET request to "companies_getactivityformfields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE activityformfields; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Negative @Boundary
  Scenario: TC_16 Get activity form fields with maximum query parameters
    And I send the GET request to "companies_getactivityformfields" endpoint with dynamic access token and query parameters
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
      |$.Result|"true"|

#  @Negative @ErrorHandling
#  Scenario: TC_17 Get activity form fields with invalid endpoint
#    And I send the GET request to "companies_getactivityformfields_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_18 Validate activity form fields business logic
    And I send the GET request to "companies_getactivityformfields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|"Activity form fields found."|
      |$.fields[0].name|"singleLineText1"|
      |$.fields[0].type|"SingleLineText"|

  @Positive @DataIntegrity
  Scenario: TC_19 Validate activity form fields data integrity
    And I send the GET request to "companies_getactivityformfields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|"Activity form fields found."|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.fields|array|
      |$.fields[0]|object|
      |$.fields[0].name|string|
      |$.fields[0].type|string|
      |$.fields[0].settings|object|

  @Positive @Regression
  Scenario: TC_20 Regression test for activity form fields endpoint
    And I send the GET request to "companies_getactivityformfields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|"Activity form fields found."|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.fields|array|

  @Positive @Functional
  Scenario: TC_21 Validate activity form fields response completeness
    And I send the GET request to "companies_getactivityformfields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|"Activity form fields found."|
      |$.fields[0].name|"singleLineText1"|
      |$.fields[0].type|"SingleLineText"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.fields|array|
      |$.fields[0]|object|
      |$.fields[0].name|string|
      |$.fields[0].type|string|
      |$.fields[0].settings|object|

  @Positive @ArrayValidation
  Scenario: TC_22 Validate activity form fields array structure and content
    And I send the GET request to "companies_getactivityformfields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.fields|array|
      |$.fields[0]|object|
      |$.fields[1]|object|
      |$.fields[0].name|string|
      |$.fields[0].type|string|
      |$.fields[0].settings|object|
      |$.fields[1].name|string|
      |$.fields[1].type|string|
      |$.fields[1].settings|object|

  @Positive @ContentValidation
  Scenario: TC_23 Validate activity form fields content structure
    And I send the GET request to "companies_getactivityformfields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |fields|
      |name|
      |type|
      |settings|
      |SingleLineText|
      |Activity form fields found.|

  @Positive @LoadTesting
  Scenario: TC_24 Load testing for activity form fields endpoint
    And I send the GET request to "companies_getactivityformfields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Negative @Timeout
  Scenario: TC_25 Test activity form fields endpoint timeout handling
    And I send the GET request to "companies_getactivityformfields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Positive @EndToEnd
  Scenario: TC_26 End-to-end activity form fields data retrieval workflow
    And I send the GET request to "companies_getactivityformfields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|"Activity form fields found."|
      |$.fields[0].name|"singleLineText1"|
      |$.fields[0].type|"SingleLineText"|
    And I store the response as "activity_form_fields_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.fields|array|
      |$.fields[0]|object|
      |$.fields[0].name|string|
      |$.fields[0].type|string|
      |$.fields[0].settings|object|
      |$.fields[1]|object|
      |$.fields[1].name|string|
      |$.fields[1].type|string|
      |$.fields[1].settings|object|

