@BizomWebAPI @CE @ActivitiesManagement @ActivityFormFields @GetActivityFormFields @MasterDataManagement
Feature: Get Activity Form Fields API Testing
  As a system user
  I want to test the get activity form fields endpoint
  So that I can ensure proper functionality and data retrieval for activity form fields by field ID

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
    When I send the GET request to "getactivityformfields" endpoint with path parameters
      |Path|Value|
      |fieldId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_02 Get activity form fields with invalid access token
    And I send the GET request to "getactivityformfields" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|fieldId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_03 Get activity form fields with expired access token
    And I send the GET request to "getactivityformfields" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|fieldId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_04 Get activity form fields with malformed access token
    And I send the GET request to "getactivityformfields" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|fieldId|1|
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get activity form fields for field ID 1 with valid access token
    And I send the GET request to "getactivityformfields" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fieldId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
    And I store the response as "activity_form_fields_response" name using full path

  @Positive @Functional
  Scenario: TC_06 Get activity form fields for field ID 2 with valid access token
    And I send the GET request to "getactivityformfields" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fieldId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response.Result|string|
      |$.Response.Reason|string|
      |$.Response.Data|object|
      |$.Response.Data.ActivityFormFields|object|


  @Negative @ErrorHandling
  Scenario: TC_07 Get activity form fields with invalid endpoint
    And I send the GET request to "getactivityformfields_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fieldId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds
  

  @Positive @Smoke @DatabaseValidation
  Scenario: TC_08 Get activity form fields for field ID 1 with database validation
    And I send the GET request to "getactivityformfields" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fieldId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Response.Result|"true"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response.Result|string|
      |$.Response.Reason|string|
      |$.Response.Data|object|
      |$.Response.Data.ActivityFormFields|object|

  @Positive @Functional @DatabaseValidation
  Scenario: TC_09 Get activity form fields for field ID 2 with database validation
    And I send the GET request to "getactivityformfields" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fieldId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Response.Result|"true"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response.Result|string|
      |$.Response.Reason|string|
      |$.Response.Data|object|
      |$.Response.Data.ActivityFormFields|object|

  @Positive @DataValidation
  Scenario: TC_10 Validate activity form fields response structure for field ID 1
    And I send the GET request to "getactivityformfields" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fieldId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Data.ActivityFormFields['1']|Image Test|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response.Result|string|
      |$.Response.Reason|string|
      |$.Response.Data|object|
      |$.Response.Data.ActivityFormFields|object|

  @Negative @Security
  Scenario: TC_11 Get activity form fields with SQL injection attempt in field ID
    And I send the GET request to "getactivityformfields" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fieldId|1' OR '1'='1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|

  @Positive @EndToEnd
  Scenario: TC_12 End-to-end activity form fields workflow
    And I send the GET request to "getactivityformfields" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fieldId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Data.ActivityFormFields['1']|Image Test|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response.Result|string|
      |$.Response.Data.ActivityFormFields|object|
    And I store the response as "activity_form_fields_e2e_response" name using full path
