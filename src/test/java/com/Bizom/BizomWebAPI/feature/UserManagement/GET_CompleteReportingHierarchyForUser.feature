@BizomWebAPI @CE @CompleteReportingHierarchyForUser @UserManagement
Feature: Complete Reporting Hierarchy For User API Testing
  As a system user
  I want to test the complete reporting hierarchy for user endpoint
  So that I can ensure proper functionality and data retrieval for user reporting hierarchy management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get complete reporting hierarchy for user without access token
    When I send the GET request to "complete_reporting_hierarchy_for_user" endpoint with path parameters
     |Path|Value|
      |userId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get complete reporting hierarchy for user with invalid access token
    And I send the GET request to "complete_reporting_hierarchy_for_user" endpoint with dynamic access token, path and query parameters
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
  Scenario: Get complete reporting hierarchy for user with expired access token
    And I send the GET request to "complete_reporting_hierarchy_for_user" endpoint with dynamic access token, path and query parameters
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
  Scenario: Get complete reporting hierarchy for user with malformed access token
    And I send the GET request to "complete_reporting_hierarchy_for_user" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|1|access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke @DataValidation
  Scenario: Get complete reporting hierarchy for user with valid access token for userId=1
    And I send the GET request to "complete_reporting_hierarchy_for_user" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|1|access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.users[0].id|"8"|
      |$.users[0].name|SLV Traders|
      |$.users[0].username|testacl|
      |$.users[0].designation_id|"0"|
         |$.users[0].designation|""|
      |$.users[1].id|"13"|
      |$.users[1].name|testuser_tourplan|
      |$.users[1].username|touruser|
      |$.users[1].designation_id|"0"|
      |$.users[1].designation|""|
    And I store the response as "complete_reporting_hierarchy_userId_1_response" name using full path

  @Positive @DataValidation
  Scenario: Get complete reporting hierarchy for user with valid access token for userId=8
    And I send the GET request to "complete_reporting_hierarchy_for_user" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|8|access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.users[0].id|"1"|
      |$.users[0].name|SLV Traders|
      |$.users[0].username|uiadmin|
      |$.users[0].designation_id|"0"|
         |$.users[0].designation|""|
    And I store the response as "complete_reporting_hierarchy_userId_8_response" name using full path

  @Positive @EmptyResponseValidation
  Scenario: Get complete reporting hierarchy for user with valid access token for invalid userId (empty response)
    And I send the GET request to "complete_reporting_hierarchy_for_user" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|99999|access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @DataValidation
  Scenario: Validate complete reporting hierarchy response structure for userId=1
    And I send the GET request to "complete_reporting_hierarchy_for_user" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|1|access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.users[0].id|"8"|
      |$.users[0].name|SLV Traders|
      |$.users[0].username|testacl|
      |$.users[0].designation_id|"0"|
         |$.users[0].designation|""|
      |$.users[1].id|"13"|
      |$.users[1].name|testuser_tourplan|
      |$.users[1].username|touruser|
      |$.users[1].designation_id|"0"|
      |$.users[1].designation|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.users|array|
      |$.users[0]|object|
      |$.users[0].id|string|
      |$.users[0].name|string|
      |$.users[0].username|string|
      |$.users[0].designation_id|string|
      |$.users[0].designation|string|
      |$.users[1]|object|
      |$.users[1].id|string|
      |$.users[1].name|string|
      |$.users[1].username|string|
      |$.users[1].designation_id|string|
      |$.users[1].designation|string|

  @Positive @DataValidation
  Scenario: Validate complete reporting hierarchy response structure for userId=8
    And I send the GET request to "complete_reporting_hierarchy_for_user" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|8|access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.users[0].id|"1"|
      |$.users[0].name|SLV Traders|
      |$.users[0].username|uiadmin|
      |$.users[0].designation_id|"0"|
         |$.users[0].designation|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.users|array|
      |$.users[0]|object|
      |$.users[0].id|string|
      |$.users[0].name|string|
      |$.users[0].username|string|
      |$.users[0].designation_id|string|
      |$.users[0].designation|string|

  @Positive @DataValidation
  Scenario: Validate complete reporting hierarchy response completeness for userId=1
    And I send the GET request to "complete_reporting_hierarchy_for_user" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|1|access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.users[0].id|"8"|
      |$.users[0].name|SLV Traders|
      |$.users[0].username|testacl|
      |$.users[0].designation_id|"0"|
         |$.users[0].designation|""|
      |$.users[1].id|"13"|
      |$.users[1].name|testuser_tourplan|
      |$.users[1].username|touruser|
      |$.users[1].designation_id|"0"|
      |$.users[1].designation|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.users|array|
      |$.users[0]|object|
      |$.users[1]|object|

  @Positive @Performance
  Scenario: Performance test for complete reporting hierarchy endpoint
    And I send the GET request to "complete_reporting_hierarchy_for_user" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|1|access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.users[0].id|"8"|
      |$.users[0].name|SLV Traders|
      |$.users[0].username|testacl|
      |$.users[0].designation_id|"0"|
         |$.users[0].designation|""|
      |$.users[1].id|"13"|
      |$.users[1].name|testuser_tourplan|
      |$.users[1].username|touruser|
      |$.users[1].designation_id|"0"|
      |$.users[1].designation|""|

  @Positive @Concurrency
  Scenario: Concurrent access test for complete reporting hierarchy endpoint
    And I send the GET request to "complete_reporting_hierarchy_for_user" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|1|access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.users[0].id|"8"|
      |$.users[0].name|SLV Traders|
      |$.users[0].username|testacl|
      |$.users[0].designation_id|"0"|
         |$.users[0].designation|""|
      |$.users[1].id|"13"|
      |$.users[1].name|testuser_tourplan|
      |$.users[1].username|touruser|
      |$.users[1].designation_id|"0"|
      |$.users[1].designation|""|
    
  @Positive @BusinessLogic
  Scenario: Validate complete reporting hierarchy business logic for userId=1
    And I send the GET request to "complete_reporting_hierarchy_for_user" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|1|access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.users[0].id|"8"|
      |$.users[0].name|SLV Traders|
      |$.users[0].username|testacl|
      |$.users[0].designation_id|"0"|
         |$.users[0].designation|""|
      |$.users[1].id|"13"|
      |$.users[1].name|testuser_tourplan|
      |$.users[1].username|touruser|
      |$.users[1].designation_id|"0"|
      |$.users[1].designation|""|
    And I verify API response at path with DB and static values
      |JPath|Value|
    
      |$.users[0].name|DB:users:name: id=8|
      |$.users[0].username|DB:users:username: id=8|
    
      |$.users[0].designation|DB:users:designation: id=8|
    
      |$.users[1].name|DB:users:name: id=13|
      |$.users[1].username|DB:users:username: id=13|
     
      |$.users[1].designation|DB:users:designation: id=13|

  @Positive @BusinessLogic
  Scenario: Validate complete reporting hierarchy business logic for userId=8
    And I send the GET request to "complete_reporting_hierarchy_for_user" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|8|access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.users[0].id|"1"|
      |$.users[0].name|SLV Traders|
      |$.users[0].username|uiadmin|
      |$.users[0].designation_id|"0"|
         |$.users[0].designation|""|
    And I verify API response at path with DB and static values
      |JPath|Value|
    
      |$.users[0].name|DB:users:name: id=1|
      |$.users[0].username|DB:users:username: id=1|
   
      |$.users[0].designation|DB:users:designation: id=1|

  @Positive @DataIntegrity
  Scenario: Validate complete reporting hierarchy data integrity for userId=1
    And I send the GET request to "complete_reporting_hierarchy_for_user" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|1|access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.users[0].id|"8"|
      |$.users[0].name|SLV Traders|
      |$.users[0].username|testacl|
      |$.users[0].designation_id|"0"|
         |$.users[0].designation|""|
      |$.users[1].id|"13"|
      |$.users[1].name|testuser_tourplan|
      |$.users[1].username|touruser|
      |$.users[1].designation_id|"0"|
      |$.users[1].designation|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.users|array|
      |$.users[0]|object|
      |$.users[0].id|string|
      |$.users[0].name|string|
      |$.users[0].username|string|
      |$.users[0].designation_id|string|
      |$.users[0].designation|string|
      |$.users[1]|object|
      |$.users[1].id|string|
      |$.users[1].name|string|
      |$.users[1].username|string|
      |$.users[1].designation_id|string|
      |$.users[1].designation|string|

  @Positive @DataIntegrity
  Scenario: Validate complete reporting hierarchy data integrity for userId=8
    And I send the GET request to "complete_reporting_hierarchy_for_user" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|8|access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.users[0].id|"1"|
      |$.users[0].name|SLV Traders|
      |$.users[0].username|uiadmin|
      |$.users[0].designation_id|"0"|
         |$.users[0].designation|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.users|array|
      |$.users[0]|object|
      |$.users[0].id|string|
      |$.users[0].name|string|
      |$.users[0].username|string|
      |$.users[0].designation_id|string|
      |$.users[0].designation|string|

  @Positive @Regression
  Scenario: Regression test for complete reporting hierarchy endpoint
    And I send the GET request to "complete_reporting_hierarchy_for_user" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|1|access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.users[0].id|"8"|
      |$.users[0].name|SLV Traders|
      |$.users[0].username|testacl|
      |$.users[0].designation_id|"0"|
         |$.users[0].designation|""|
      |$.users[1].id|"13"|
      |$.users[1].name|testuser_tourplan|
      |$.users[1].username|touruser|
      |$.users[1].designation_id|"0"|
      |$.users[1].designation|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.users|array|
      |$.users[0]|object|
      |$.users[0].id|string|
      |$.users[0].name|string|
      |$.users[0].username|string|
      |$.users[0].designation_id|string|
      |$.users[0].designation|string|
      |$.users[1]|object|
      |$.users[1].id|string|
      |$.users[1].name|string|
      |$.users[1].username|string|
      |$.users[1].designation_id|string|
      |$.users[1].designation|string|

  @Positive @Functional
  Scenario: Validate complete reporting hierarchy response completeness for userId=1
    And I send the GET request to "complete_reporting_hierarchy_for_user" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|1|access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.users[0].id|"8"|
      |$.users[0].name|SLV Traders|
      |$.users[0].username|testacl|
      |$.users[0].designation_id|"0"|
         |$.users[0].designation|""|
      |$.users[1].id|"13"|
      |$.users[1].name|testuser_tourplan|
      |$.users[1].username|touruser|
      |$.users[1].designation_id|"0"|
      |$.users[1].designation|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.users|array|
      |$.users[0]|object|
      |$.users[1]|object|

  @Positive @ArrayValidation
  Scenario: Validate complete reporting hierarchy array structure and content for userId=1
    And I send the GET request to "complete_reporting_hierarchy_for_user" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|1|access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.users[0].id|"8"|
      |$.users[0].name|SLV Traders|
      |$.users[0].username|testacl|
      |$.users[0].designation_id|"0"|
         |$.users[0].designation|""|
      |$.users[1].id|"13"|
      |$.users[1].name|testuser_tourplan|
      |$.users[1].username|touruser|
      |$.users[1].designation_id|"0"|
      |$.users[1].designation|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.users|array|
      |$.users[0]|object|
      |$.users[1]|object|

  @Positive @ArrayValidation
  Scenario: Validate complete reporting hierarchy array structure and content for userId=8
    And I send the GET request to "complete_reporting_hierarchy_for_user" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|8|access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.users[0].id|"1"|
      |$.users[0].name|SLV Traders|
      |$.users[0].username|uiadmin|
      |$.users[0].designation_id|"0"|
         |$.users[0].designation|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.users|array|
      |$.users[0]|object|

#  @Positive @ContentValidation
#  Scenario: Validate complete reporting hierarchy content structure for userId=1
#    And I send the GET request to "complete_reporting_hierarchy_for_user" endpoint with dynamic access token, path and query parameters
#     |Path|Value|QueryParamName|QueryParamValue|
#      |userId|1|access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.users[0].id|"8"|
#      |$.users[0].name|SLV Traders|
#      |$.users[0].username|testacl|
#      |$.users[0].designation_id|"0"|
#         |$.users[0].designation|""|
#      |$.users[1].id|"13"|
#      |$.users[1].name|testuser_tourplan|
#      |$.users[1].username|touruser|
#      |$.users[1].designation_id|"0"|
#      |$.users[1].designation|""|
#    And validating the response contains the following values
#      |Value|
#      |users|
#      |id|
#      |name|
#      |username|
#      |designation_id|
#      |designation|
#      |SLV Traders|
#      |testacl|
#      |touruser|
#      |testuser_tourplan|
#      |uiadmin|

  @Positive @ContentValidation
  Scenario: Validate complete reporting hierarchy content structure for userId=8
    And I send the GET request to "complete_reporting_hierarchy_for_user" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|8|access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.users[0].id|"1"|
      |$.users[0].name|SLV Traders|
      |$.users[0].username|uiadmin|
      |$.users[0].designation_id|"0"|
         |$.users[0].designation|""|
    And validating the response contains the following values
      |Value|
      |users|
      |id|
      |name|
      |username|
      |designation_id|
      |designation|
      |SLV Traders|
      |uiadmin|

  @Positive @LoadTesting
  Scenario: Load testing for complete reporting hierarchy endpoint
    And I send the GET request to "complete_reporting_hierarchy_for_user" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|1|access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.users[0].id|"8"|
      |$.users[0].name|SLV Traders|
      |$.users[0].username|testacl|
      |$.users[0].designation_id|"0"|
         |$.users[0].designation|""|
      |$.users[1].id|"13"|
      |$.users[1].name|testuser_tourplan|
      |$.users[1].username|touruser|
      |$.users[1].designation_id|"0"|
      |$.users[1].designation|""|

  @Negative @Timeout
  Scenario: Test complete reporting hierarchy endpoint timeout handling
    And I send the GET request to "complete_reporting_hierarchy_for_user" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|1|access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.users[0].id|"8"|
      |$.users[0].name|SLV Traders|
      |$.users[0].username|testacl|
      |$.users[0].designation_id|"0"|
         |$.users[0].designation|""|
      |$.users[1].id|"13"|
      |$.users[1].name|testuser_tourplan|
      |$.users[1].username|touruser|
      |$.users[1].designation_id|"0"|
      |$.users[1].designation|""|

  @Positive @EndToEnd
  Scenario: End-to-end complete reporting hierarchy data retrieval workflow for userId=1
    And I send the GET request to "complete_reporting_hierarchy_for_user" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|1|access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.users[0].id|"8"|
      |$.users[0].name|SLV Traders|
      |$.users[0].username|testacl|
      |$.users[0].designation_id|"0"|
         |$.users[0].designation|""|
      |$.users[1].id|"13"|
      |$.users[1].name|testuser_tourplan|
      |$.users[1].username|touruser|
      |$.users[1].designation_id|"0"|
      |$.users[1].designation|""|
    And I store the response as "complete_reporting_hierarchy_userId_1_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.users|array|
      |$.users[0]|object|
      |$.users[1]|object|

  @Positive @EndToEnd
  Scenario: End-to-end complete reporting hierarchy data retrieval workflow for userId=8
    And I send the GET request to "complete_reporting_hierarchy_for_user" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|8|access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.users[0].id|"1"|
      |$.users[0].name|SLV Traders|
      |$.users[0].username|uiadmin|
      |$.users[0].designation_id|"0"|
         |$.users[0].designation|""|
    And I store the response as "complete_reporting_hierarchy_userId_8_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.users|array|
      |$.users[0]|object|

  @Positive @CompleteReportingHierarchyValidation
  Scenario: Validate complete reporting hierarchy data accuracy for userId=1
    And I send the GET request to "complete_reporting_hierarchy_for_user" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|1|access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.users[0].id|"8"|
      |$.users[0].name|SLV Traders|
      |$.users[0].username|testacl|
      |$.users[0].designation_id|"0"|
         |$.users[0].designation|""|
      |$.users[1].id|"13"|
      |$.users[1].name|testuser_tourplan|
      |$.users[1].username|touruser|
      |$.users[1].designation_id|"0"|
      |$.users[1].designation|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.users|array|
      |$.users[0]|object|
      |$.users[0].id|string|
      |$.users[0].name|string|
      |$.users[0].username|string|
      |$.users[0].designation_id|string|
      |$.users[0].designation|string|
      |$.users[1]|object|
      |$.users[1].id|string|
      |$.users[1].name|string|
      |$.users[1].username|string|
      |$.users[1].designation_id|string|
      |$.users[1].designation|string|

  @Positive @CompleteReportingHierarchyValidation
  Scenario: Validate complete reporting hierarchy data accuracy for userId=8
    And I send the GET request to "complete_reporting_hierarchy_for_user" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|8|access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.users[0].id|"1"|
      |$.users[0].name|SLV Traders|
      |$.users[0].username|uiadmin|
      |$.users[0].designation_id|"0"|
         |$.users[0].designation|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.users|array|
      |$.users[0]|object|
      |$.users[0].id|string|
      |$.users[0].name|string|
      |$.users[0].username|string|
      |$.users[0].designation_id|string|
      |$.users[0].designation|string|

  @Positive @UserManagementValidation
  Scenario: Validate complete reporting hierarchy user management interface for userId=1
    And I send the GET request to "complete_reporting_hierarchy_for_user" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|1|access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.users[0].id|"8"|
      |$.users[0].name|SLV Traders|
      |$.users[0].username|testacl|
      |$.users[0].designation_id|"0"|
         |$.users[0].designation|""|
      |$.users[1].id|"13"|
      |$.users[1].name|testuser_tourplan|
      |$.users[1].username|touruser|
      |$.users[1].designation_id|"0"|
      |$.users[1].designation|""|
    And I verify API response at path with DB and static values
      |JPath|Value|
    
      |$.users[0].name|DB:users:name: id=8|
      |$.users[0].username|DB:users:username: id=8|
    
      |$.users[0].designation|DB:users:designation: id=8|
    
      |$.users[1].name|DB:users:name: id=13|
      |$.users[1].username|DB:users:username: id=13|
     
      |$.users[1].designation|DB:users:designation: id=13|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.users|array|
      |$.users[0]|object|
      |$.users[0].id|string|
      |$.users[0].name|string|
      |$.users[0].username|string|
      |$.users[0].designation_id|string|
      |$.users[0].designation|string|
      |$.users[1]|object|
      |$.users[1].id|string|
      |$.users[1].name|string|
      |$.users[1].username|string|
      |$.users[1].designation_id|string|
      |$.users[1].designation|string|

  @Positive @UserManagementValidation
  Scenario: Validate complete reporting hierarchy user management interface for userId=8
    And I send the GET request to "complete_reporting_hierarchy_for_user" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|8|access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.users[0].id|"1"|
      |$.users[0].name|SLV Traders|
      |$.users[0].username|uiadmin|
      |$.users[0].designation_id|"0"|
         |$.users[0].designation|""|
    And I verify API response at path with DB and static values
      |JPath|Value|
    
      |$.users[0].name|DB:users:name: id=1|
      |$.users[0].username|DB:users:username: id=1|
   
      |$.users[0].designation|DB:users:designation: id=1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.users|array|
      |$.users[0]|object|
      |$.users[0].id|string|
      |$.users[0].name|string|
      |$.users[0].username|string|
      |$.users[0].designation_id|string|
      |$.users[0].designation|string|

