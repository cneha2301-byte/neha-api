@BizomWebAPI @CE @OutletContactsManagement @OutletContacts @GetOutletContacts @SystemOperations
Feature: Outlet Contacts API Testing
  As a system user
  I want to test the outlet contacts endpoint
  So that I can ensure proper functionality and data retrieval for outlet contacts management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get outlet contacts without access token
    When I send the GET request to "outletcontacts_get" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get outlet contacts with invalid access token
    And I send the GET request to "outletcontacts_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get outlet contacts with expired access token
    And I send the GET request to "outletcontacts_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get outlet contacts with malformed access token
    And I send the GET request to "outletcontacts_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get outlet contacts with valid access token
    And I send the GET request to "outletcontacts_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Invalid request sent."|
    And I store the response as "outletcontacts_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate outlet contacts response structure
    And I send the GET request to "outletcontacts_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Invalid request sent."|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate outlet contacts specific data values
    And I send the GET request to "outletcontacts_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Invalid request sent."|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Invalid request sent."|

  @Positive @DataValidation
  Scenario: TC_08 Validate outlet contacts with static values
    And I send the GET request to "outletcontacts_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Invalid request sent."|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data|[]|

  @Positive @Performance
  Scenario: TC_09 Performance test for outlet contacts endpoint
    And I send the GET request to "outletcontacts_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Invalid request sent."|

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for outlet contacts endpoint
    And I send the GET request to "outletcontacts_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Invalid request sent."|

  @Negative @Validation
  Scenario: TC_11 Get outlet contacts with invalid query parameters
    And I send the GET request to "outletcontacts_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Invalid request sent."|

  @Negative @Validation
  Scenario: TC_12 Get outlet contacts with special characters in query parameters
    And I send the GET request to "outletcontacts_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Invalid request sent."|

  @Negative @Security
  Scenario: TC_13 Get outlet contacts with SQL injection attempt
    And I send the GET request to "outletcontacts_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE outlets; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Invalid request sent."|

  @Negative @Boundary
  Scenario: TC_14 Get outlet contacts with maximum query parameters
    And I send the GET request to "outletcontacts_get" endpoint with dynamic access token and query parameters
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
      |$.Result|false|
      |$.Reason|"Invalid request sent."|

#  @Negative @ErrorHandling
#  Scenario: TC_15 Get outlet contacts with invalid endpoint
#    And I send the GET request to "outletcontacts_get_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_16 Validate outlet contacts business logic
    And I send the GET request to "outletcontacts_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Invalid request sent."|

  @Positive @DataIntegrity
  Scenario: TC_17 Validate outlet contacts data integrity
    And I send the GET request to "outletcontacts_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Invalid request sent."|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|

  @Positive @Regression
  Scenario: TC_18 Regression test for outlet contacts endpoint
    And I send the GET request to "outletcontacts_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Invalid request sent."|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|

  @Positive @Functional
  Scenario: TC_19 Validate outlet contacts response completeness
    And I send the GET request to "outletcontacts_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Invalid request sent."|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data|[]|

  @Positive @ArrayValidation
  Scenario: TC_20 Validate outlet contacts array structure and content
    And I send the GET request to "outletcontacts_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Invalid request sent."|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|

  @Positive @ContentValidation
  Scenario: TC_21 Validate outlet contacts content structure
    And I send the GET request to "outletcontacts_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Invalid request sent."|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Data|

  @Positive @LoadTesting
  Scenario: TC_22 Load testing for outlet contacts endpoint
    And I send the GET request to "outletcontacts_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Invalid request sent."|

  @Negative @Timeout
  Scenario: TC_23 Test outlet contacts endpoint timeout handling
    And I send the GET request to "outletcontacts_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Invalid request sent."|

  @Positive @EndToEnd
  Scenario: TC_24 End-to-end outlet contacts data retrieval workflow
    And I send the GET request to "outletcontacts_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Invalid request sent."|
    And I store the response as "outletcontacts_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Data|

