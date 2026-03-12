@BizomWebAPI @CE @AllReporteeUsers @UserManagement
Feature: All Reportee Users API Testing
  As a system user
  I want to test the all reportee users endpoint
  So that I can ensure proper functionality and data retrieval for reportee users management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get all reportee users without access token
    When I send the GET request to "all_reportee_users" endpoint with path parameters
     |Path|Value|
      |userId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get all reportee users with invalid access token
    And I send the GET request to "all_reportee_users" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|1|access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get all reportee users with expired access token
    And I send the GET request to "all_reportee_users" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|1|access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get all reportee users with malformed access token
    And I send the GET request to "all_reportee_users" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|1|access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get all reportee users with valid access token and userId=1
    And I send the GET request to "all_reportee_users" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|1|access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$[0].id|"8"|
      |$[0].name|SLV Traders|
      |$[0].username|testacl|
      |$[0].designation_id|"0"|
      |$[0].designation|""|
      |$[0].employeeid|null|
      |$[1].id|"13"|
      |$[1].name|testuser_tourplan|
      |$[1].username|touruser|
      |$[1].designation_id|"0"|
      |$[1].designation|""|
      |$[1].employeeid|null|
    And I store the response as "all_reportee_users_response_userId_1" name using full path

  @Positive @DataValidation
  Scenario: Validate all reportee users response structure for userId=1
    And I send the GET request to "all_reportee_users" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|1|access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$[0].id|"8"|
      |$[0].name|SLV Traders|
      |$[0].username|testacl|
      |$[0].designation_id|"0"|
      |$[0].designation|""|
      |$[0].employeeid|null|
      |$[1].id|"13"|
      |$[1].name|testuser_tourplan|
      |$[1].username|touruser|
      |$[1].designation_id|"0"|
      |$[1].designation|""|
      |$[1].employeeid|null|
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
       |$[0]|array|
      |$[0].id|array|
       |$[0].name|array|
      |$[0].username|array|
      |$[0].designation_id|array|
      |$[0].designation|array|
      |$[0].employeeid|array|

  @Positive @DataValidation
  Scenario: Get all reportee users with userId=3
    And I send the GET request to "all_reportee_users" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|3|access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$[0].id|"2"|
      |$[0].name|SLV Traders|
      |$[0].username|covidse|
      |$[0].designation_id|"0"|
      |$[0].designation|""|
      |$[0].employeeid|"1211"|
      |$[1].id|"16"|
      |$[1].name|lion12|
      |$[1].username|lion|
      |$[1].designation_id|"1"|
      |$[1].designation|CEO|
      |$[1].employeeid|"lion1"|
    And I store the response as "all_reportee_users_response_userId_3" name using full path

  @Positive @DataValidation
  Scenario: Get all reportee users with userId=8 (empty response)
    And I send the GET request to "all_reportee_users" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|8|access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$|[]|
    And I store the response as "all_reportee_users_response_userId_8" name using full path

  @Positive @DataValidation
  Scenario: Get all reportee users with invalid userId (empty response)
    And I send the GET request to "all_reportee_users" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|999|access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$|[]|
    And I store the response as "all_reportee_users_response_invalid_userId" name using full path

  @Positive @Performance
  Scenario: Performance test for all reportee users endpoint with userId=1
    And I send the GET request to "all_reportee_users" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|1|access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$[0].id|"8"|
      |$[0].name|SLV Traders|
      |$[0].username|testacl|

  @Positive @Concurrency
  Scenario: Concurrent access test for all reportee users endpoint
    And I send the GET request to "all_reportee_users" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|1|access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$[0].id|"8"|
      |$[0].name|SLV Traders|
      |$[0].username|testacl|

  @Negative @Validation
  Scenario: Get all reportee users with invalid query parameters
    And I send the GET request to "all_reportee_users" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|1|access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$[0].id|"8"|
      |$[0].name|SLV Traders|
      |$[0].username|testacl|

  @Negative @Validation
  Scenario: Get all reportee users with special characters in query parameters
    And I send the GET request to "all_reportee_users" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|1|access_token|ACCESS_TOKEN|

    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$[0].id|"8"|
      |$[0].name|SLV Traders|
      |$[0].username|testacl|

  @Negative @Security
  Scenario: Get all reportee users with SQL injection attempt
    And I send the GET request to "all_reportee_users" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|1|access_token|ACCESS_TOKEN|

    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$[0].id|"8"|
      |$[0].name|SLV Traders|
      |$[0].username|testacl|

  @Negative @Boundary
  Scenario: Get all reportee users with maximum query parameters
    And I send the GET request to "all_reportee_users" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|1|access_token|ACCESS_TOKEN|

    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$[0].id|"8"|
      |$[0].name|SLV Traders|
      |$[0].username|testacl|
    
  @Positive @BusinessLogic
  Scenario: Validate all reportee users business logic for userId=1
    And I send the GET request to "all_reportee_users" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|1|access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$[0].id|"8"|
      |$[0].name|SLV Traders|
      |$[0].username|testacl|
      |$[0].designation_id|"0"|
      |$[0].designation|""|
      |$[0].employeeid|null|
    And I verify API response at path with DB and static values
      |JPath|Value|
     
      |$[0].name|DB:users:name: id=8|
      |$[0].username|DB:users:username: id=8|

  @Positive @DataIntegrity
  Scenario: Validate all reportee users data integrity for userId=1
    And I send the GET request to "all_reportee_users" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|1|access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$[0].id|"8"|
      |$[0].name|SLV Traders|
      |$[0].username|testacl|
      |$[0].designation_id|"0"|
      |$[0].designation|""|
      |$[0].employeeid|null|
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
       |$[0]|array|
      |$[0].id|array|
       |$[0].name|array|
      |$[0].username|array|
      |$[0].designation_id|array|
      |$[0].designation|array|
      |$[0].employeeid|array|

  @Positive @Regression
  Scenario: Regression test for all reportee users endpoint
    And I send the GET request to "all_reportee_users" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|1|access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$[0].id|"8"|
      |$[0].name|SLV Traders|
      |$[0].username|testacl|
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
       |$[0]|array|
      |$[0].id|array|
       |$[0].name|array|
      |$[0].username|array|

  @Positive @Functional
  Scenario: Validate all reportee users response completeness for userId=1
    And I send the GET request to "all_reportee_users" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|1|access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$[0].id|"8"|
      |$[0].name|SLV Traders|
      |$[0].username|testacl|
      |$[0].designation_id|"0"|
      |$[0].designation|""|
      |$[0].employeeid|null|
      |$[1].id|"13"|
      |$[1].name|testuser_tourplan|
      |$[1].username|touruser|
      |$[1].designation_id|"0"|
      |$[1].designation|""|
      |$[1].employeeid|null|
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
       |$[0]|array|
      |$[1]|object|

  @Positive @ArrayValidation
  Scenario: Validate all reportee users array structure and content for userId=1
    And I send the GET request to "all_reportee_users" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|1|access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$[0].id|"8"|
      |$[0].name|SLV Traders|
      |$[0].username|testacl|
      |$[0].designation_id|"0"|
      |$[0].designation|""|
      |$[0].employeeid|null|
      |$[1].id|"13"|
      |$[1].name|testuser_tourplan|
      |$[1].username|touruser|
      |$[1].designation_id|"0"|
      |$[1].designation|""|
      |$[1].employeeid|null|
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
       |$[0]|array|
      |$[1]|object|

  @Positive @ContentValidation
  Scenario: Validate all reportee users content structure for userId=1
    And I send the GET request to "all_reportee_users" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|1|access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$[0].id|"8"|
      |$[0].name|SLV Traders|
      |$[0].username|testacl|
    And validating the response contains the following values
      |Value|
      |id|
      |name|
      |username|
      |designation_id|
      |designation|
      |employeeid|
      |SLV Traders|
      |testacl|
      |testuser_tourplan|
      |touruser|

  @Positive @LoadTesting
  Scenario: Load testing for all reportee users endpoint
    And I send the GET request to "all_reportee_users" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|1|access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$[0].id|"8"|
      |$[0].name|SLV Traders|
      |$[0].username|testacl|

  @Negative @Timeout
  Scenario: Test all reportee users endpoint timeout handling
    And I send the GET request to "all_reportee_users" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|1|access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$[0].id|"8"|
      |$[0].name|SLV Traders|
      |$[0].username|testacl|

  @Positive @EndToEnd
  Scenario: End-to-end all reportee users data retrieval workflow for userId=1
    And I send the GET request to "all_reportee_users" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|1|access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$[0].id|"8"|
      |$[0].name|SLV Traders|
      |$[0].username|testacl|
      |$[0].designation_id|"0"|
      |$[0].designation|""|
      |$[0].employeeid|null|
      |$[1].id|"13"|
      |$[1].name|testuser_tourplan|
      |$[1].username|touruser|
      |$[1].designation_id|"0"|
      |$[1].designation|""|
      |$[1].employeeid|null|
    And I store the response as "all_reportee_users_response_userId_1" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
       |$[0]|array|
      |$[1]|object|

  @Positive @ReporteeUsersValidation
  Scenario: Validate all reportee users data accuracy for userId=1
    And I send the GET request to "all_reportee_users" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|1|access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$[0].id|"8"|
      |$[0].name|SLV Traders|
      |$[0].username|testacl|
      |$[0].designation_id|"0"|
      |$[0].designation|""|
      |$[0].employeeid|null|
      |$[1].id|"13"|
      |$[1].name|testuser_tourplan|
      |$[1].username|touruser|
      |$[1].designation_id|"0"|
      |$[1].designation|""|
      |$[1].employeeid|null|
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
       |$[0]|array|
      |$[0].id|array|
       |$[0].name|array|
      |$[0].username|array|
      |$[0].designation_id|array|
      |$[0].designation|array|
      |$[0].employeeid|array|

  @Positive @UserIdValidation
  Scenario: Validate all reportee users with different userId values
    And I send the GET request to "all_reportee_users" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|3|access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$[0].id|"2"|
      |$[0].name|SLV Traders|
      |$[0].username|covidse|
      |$[0].designation_id|"0"|
      |$[0].designation|""|
      |$[0].employeeid|"1211"|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$[0].name|DB:users:name: id=2|
      |$[0].username|DB:users:username: id=2|

  @Positive @EmptyResponseValidation
  Scenario: Validate all reportee users empty response for userId=8
    And I send the GET request to "all_reportee_users" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|8|access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Positive @InvalidUserIdValidation
  Scenario: Validate all reportee users with invalid userId
    And I send the GET request to "all_reportee_users" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|999|access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Positive @UserManagementValidation
  Scenario: Validate all reportee users user management interface
    And I send the GET request to "all_reportee_users" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|1|access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$[0].id|"8"|
      |$[0].name|SLV Traders|
      |$[0].username|testacl|
      |$[0].designation_id|"0"|
      |$[0].designation|""|
      |$[0].employeeid|null|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$[0].name|DB:users:name: id=8|
      |$[0].username|DB:users:username: id=8|
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
       |$[0]|array|
      |$[0].id|array|
       |$[0].name|array|
      |$[0].username|array|
      |$[0].designation_id|array|
      |$[0].designation|array|
      |$[0].employeeid|array|
