@BizomWebAPI @CE @AllUsersApi @UserManagement
Feature: All Users API Testing
  As a system user
  I want to test the all users API endpoint
  So that I can ensure proper functionality and data retrieval for all users management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get all users API without access token
    When I send the GET request to "all_users_api" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get all users API with invalid access token
    And I send the GET request to "all_users_api" endpoint with dynamic access token and query parameters
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
  Scenario: Get all users API with expired access token
    And I send the GET request to "all_users_api" endpoint with dynamic access token and query parameters
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
  Scenario: Get all users API with malformed access token
    And I send the GET request to "all_users_api" endpoint with dynamic access token and query parameters
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
  Scenario: Get all users API with valid access token
    And I send the GET request to "all_users_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data[0].User.id|"1"|
      |$.Data[0].User.name|SLV Traders|
      |$.Data[1].User.id|"2"|
      |$.Data[1].User.name|SLV Traders|
      |$.Data[2].User.id|"3"|
      |$.Data[2].User.name|Covid MGR|
      |$.Model[0]|User|
    And I store the response as "all_users_api_response" name using full path

  @Positive @DataValidation
  Scenario: Validate all users API response structure
    And I send the GET request to "all_users_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data[0].User.id|"1"|
      |$.Data[0].User.name|SLV Traders|
      |$.Data[1].User.id|"2"|
      |$.Data[1].User.name|SLV Traders|
      |$.Data[2].User.id|"3"|
      |$.Data[2].User.name|Covid MGR|
     |$.Data[3].User.id|"4"|
      |$.Data[3].User.name|SLV Traders|
      |$.Data[4].User.id|"5"|
      |$.Data[4].User.name|Sadha|
      |$.Data[5].User.id|"6"|
      |$.Data[5].User.name|Mobisy|
      |$.Data[6].User.id|"7"|
      |$.Data[6].User.name|Sadha Nanda|
      |$.Data[7].User.id|"8"|
      |$.Data[7].User.name|SLV Traders|
      |$.Data[8].User.id|"9"|
      |$.Data[8].User.name|test1|
      |$.Data[9].User.id|"10"|
      |$.Data[9].User.name|sadha|
        |$.Data[10].User.id|"11"|
      |$.Data[10].User.name|southsalesmgr|
      |$.Data[11].User.id|"12"|
      |$.Data[11].User.name|retailer|
      |$.Data[12].User.id|"13"|
      |$.Data[12].User.name|testuser_tourplan|
      |$.Data[13].User.id|"14"|
      |$.Data[13].User.name|sadha|
      |$.Data[14].User.id|"15"|
   
      |$.Data[15].User.id|"16"|
      |$.Data[15].User.name|lion12|
      |$.Model[0]|User|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|
      |$.Data[0]|object|
      |$.Data[0].User|object|
      |$.Data[0].User.id|string|
      |$.Data[0].User.name|string|
      |$.Model|array|
      |$.Model[0]|string|

  @Positive @DataValidation
  Scenario: Validate all users API response completeness
    And I send the GET request to "all_users_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data[0].User.id|"1"|
      |$.Data[0].User.name|SLV Traders|
      |$.Data[1].User.id|"2"|
      |$.Data[1].User.name|SLV Traders|
      |$.Data[2].User.id|"3"|
      |$.Data[2].User.name|Covid MGR|
     |$.Data[3].User.id|"4"|
      |$.Data[3].User.name|SLV Traders|
      |$.Data[4].User.id|"5"|
      |$.Data[4].User.name|Sadha|
      |$.Data[5].User.id|"6"|
      |$.Data[5].User.name|Mobisy|
      |$.Data[6].User.id|"7"|
      |$.Data[6].User.name|Sadha Nanda|
      |$.Data[7].User.id|"8"|
      |$.Data[7].User.name|SLV Traders|
      |$.Data[8].User.id|"9"|
      |$.Data[8].User.name|test1|
      |$.Data[9].User.id|"10"|
      |$.Data[9].User.name|sadha|
        |$.Data[10].User.id|"11"|
      |$.Data[10].User.name|southsalesmgr|
      |$.Data[11].User.id|"12"|
      |$.Data[11].User.name|retailer|
      |$.Data[12].User.id|"13"|
      |$.Data[12].User.name|testuser_tourplan|
      |$.Data[13].User.id|"14"|
      |$.Data[13].User.name|sadha|
      |$.Data[14].User.id|"15"|
   
      |$.Data[15].User.id|"16"|
      |$.Data[15].User.name|lion12|
      |$.Model[0]|User|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|
      |$.Data[0]|object|
      |$.Data[0].User|object|
      |$.Data[0].User.id|string|
      |$.Data[0].User.name|string|
      |$.Model|array|
      |$.Model[0]|string|

  @Positive @Performance
  Scenario: Performance test for all users API endpoint
    And I send the GET request to "all_users_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data[0].User.id|"1"|
      |$.Data[0].User.name|SLV Traders|
      |$.Data[1].User.id|"2"|
      |$.Data[1].User.name|SLV Traders|
      |$.Data[2].User.id|"3"|
      |$.Data[2].User.name|Covid MGR|
      |$.Model[0]|User|

  @Positive @Concurrency
  Scenario: Concurrent access test for all users API endpoint
    And I send the GET request to "all_users_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data[0].User.id|"1"|
      |$.Data[0].User.name|SLV Traders|
      |$.Data[1].User.id|"2"|
      |$.Data[1].User.name|SLV Traders|
      |$.Data[2].User.id|"3"|
      |$.Data[2].User.name|Covid MGR|
      |$.Model[0]|User|

  @Negative @Validation
  Scenario: Get all users API with invalid query parameters
    And I send the GET request to "all_users_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data[0].User.id|"1"|
      |$.Data[0].User.name|SLV Traders|
      |$.Data[1].User.id|"2"|
      |$.Data[1].User.name|SLV Traders|
      |$.Data[2].User.id|"3"|
      |$.Data[2].User.name|Covid MGR|
      |$.Model[0]|User|

  @Negative @Validation
  Scenario: Get all users API with special characters in query parameters
    And I send the GET request to "all_users_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data[0].User.id|"1"|
      |$.Data[0].User.name|SLV Traders|
      |$.Data[1].User.id|"2"|
      |$.Data[1].User.name|SLV Traders|
      |$.Data[2].User.id|"3"|
      |$.Data[2].User.name|Covid MGR|
      |$.Model[0]|User|

  @Negative @Security
  Scenario: Get all users API with SQL injection attempt
    And I send the GET request to "all_users_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE users; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data[0].User.id|"1"|
      |$.Data[0].User.name|SLV Traders|
      |$.Data[1].User.id|"2"|
      |$.Data[1].User.name|SLV Traders|
      |$.Data[2].User.id|"3"|
      |$.Data[2].User.name|Covid MGR|
      |$.Model[0]|User|

  @Negative @Boundary
  Scenario: Get all users API with maximum query parameters
    And I send the GET request to "all_users_api" endpoint with dynamic access token and query parameters
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
      |$.Data[0].User.id|"1"|
      |$.Data[0].User.name|SLV Traders|
      |$.Data[1].User.id|"2"|
      |$.Data[1].User.name|SLV Traders|
      |$.Data[2].User.id|"3"|
      |$.Data[2].User.name|Covid MGR|
      |$.Model[0]|User|

#  @Negative @ErrorHandling
#  Scenario: Get all users API with invalid endpoint
#    And I send the GET request to "all_users_api_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

  @Positive @BusinessLogic
  Scenario: Validate all users API business logic
    And I send the GET request to "all_users_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data[0].User.id|"1"|
      |$.Data[0].User.name|SLV Traders|
      |$.Data[1].User.id|"2"|
      |$.Data[1].User.name|SLV Traders|
      |$.Data[2].User.id|"3"|
      |$.Data[2].User.name|Covid MGR|
      |$.Model[0]|User|
    And I verify API response at path with DB and static values
      |JPath|Value|
     
      |$.Data[0].User.name|DB:users:name: id=1|
    
      |$.Data[1].User.name|DB:users:name: id=2|

  @Positive @DataIntegrity
  Scenario: Validate all users API data integrity
    And I send the GET request to "all_users_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data[0].User.id|"1"|
      |$.Data[0].User.name|SLV Traders|
      |$.Data[1].User.id|"2"|
      |$.Data[1].User.name|SLV Traders|
      |$.Data[2].User.id|"3"|
      |$.Data[2].User.name|Covid MGR|
      |$.Model[0]|User|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|
      |$.Data[0]|object|
      |$.Data[0].User|object|
      |$.Data[0].User.id|string|
      |$.Data[0].User.name|string|
      |$.Model|array|
      |$.Model[0]|string|

  @Positive @Regression
  Scenario: Regression test for all users API endpoint
    And I send the GET request to "all_users_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data[0].User.id|"1"|
      |$.Data[0].User.name|SLV Traders|
      |$.Data[1].User.id|"2"|
      |$.Data[1].User.name|SLV Traders|
      |$.Data[2].User.id|"3"|
      |$.Data[2].User.name|Covid MGR|
      |$.Model[0]|User|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|
      |$.Data[0]|object|
      |$.Data[0].User|object|
      |$.Data[0].User.id|string|
      |$.Data[0].User.name|string|
      |$.Model|array|
      |$.Model[0]|string|

  @Positive @Functional
  Scenario: Validate all users API response completeness
    And I send the GET request to "all_users_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data[0].User.id|"1"|
      |$.Data[0].User.name|SLV Traders|
      |$.Data[1].User.id|"2"|
      |$.Data[1].User.name|SLV Traders|
      |$.Data[2].User.id|"3"|
      |$.Data[2].User.name|Covid MGR|
     |$.Data[3].User.id|"4"|
      |$.Data[3].User.name|SLV Traders|
      |$.Data[4].User.id|"5"|
      |$.Data[4].User.name|Sadha|
      |$.Data[5].User.id|"6"|
      |$.Data[5].User.name|Mobisy|
      |$.Data[6].User.id|"7"|
      |$.Data[6].User.name|Sadha Nanda|
      |$.Data[7].User.id|"8"|
      |$.Data[7].User.name|SLV Traders|
      |$.Data[8].User.id|"9"|
      |$.Data[8].User.name|test1|
      |$.Data[9].User.id|"10"|
      |$.Data[9].User.name|sadha|
        |$.Data[10].User.id|"11"|
      |$.Data[10].User.name|southsalesmgr|
      |$.Data[11].User.id|"12"|
      |$.Data[11].User.name|retailer|
      |$.Data[12].User.id|"13"|
      |$.Data[12].User.name|testuser_tourplan|
      |$.Data[13].User.id|"14"|
      |$.Data[13].User.name|sadha|
      |$.Data[14].User.id|"15"|
   
      |$.Data[15].User.id|"16"|
      |$.Data[15].User.name|lion12|
      |$.Model[0]|User|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|
      |$.Data[0]|object|
      |$.Data[1]|object|
      |$.Data[2]|object|
      |$.Data[3]|object|
      |$.Data[4]|object|
      |$.Data[5]|object|
      |$.Data[6]|object|
      |$.Data[7]|object|
      |$.Data[8]|object|
      |$.Data[9]|object|
      |$.Data[10]|object|
      |$.Data[11]|object|
      |$.Data[12]|object|
      |$.Data[13]|object|
      |$.Data[14]|object|
      |$.Data[15]|object|
      |$.Model|array|

  @Positive @ArrayValidation
  Scenario: Validate all users API array structure and content
    And I send the GET request to "all_users_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data[0].User.id|"1"|
      |$.Data[0].User.name|SLV Traders|
      |$.Data[1].User.id|"2"|
      |$.Data[1].User.name|SLV Traders|
      |$.Data[2].User.id|"3"|
      |$.Data[2].User.name|Covid MGR|
     |$.Data[3].User.id|"4"|
      |$.Data[3].User.name|SLV Traders|
      |$.Data[4].User.id|"5"|
      |$.Data[4].User.name|Sadha|
      |$.Data[5].User.id|"6"|
      |$.Data[5].User.name|Mobisy|
      |$.Data[6].User.id|"7"|
      |$.Data[6].User.name|Sadha Nanda|
      |$.Data[7].User.id|"8"|
      |$.Data[7].User.name|SLV Traders|
      |$.Data[8].User.id|"9"|
      |$.Data[8].User.name|test1|
      |$.Data[9].User.id|"10"|
      |$.Data[9].User.name|sadha|
        |$.Data[10].User.id|"11"|
      |$.Data[10].User.name|southsalesmgr|
      |$.Data[11].User.id|"12"|
      |$.Data[11].User.name|retailer|
      |$.Data[12].User.id|"13"|
      |$.Data[12].User.name|testuser_tourplan|
      |$.Data[13].User.id|"14"|
      |$.Data[13].User.name|sadha|
      |$.Data[14].User.id|"15"|
   
      |$.Data[15].User.id|"16"|
      |$.Data[15].User.name|lion12|
      |$.Model[0]|User|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|
      |$.Data[0]|object|
      |$.Data[1]|object|
      |$.Data[2]|object|
      |$.Data[3]|object|
      |$.Data[4]|object|
      |$.Data[5]|object|
      |$.Data[6]|object|
      |$.Data[7]|object|
      |$.Data[8]|object|
      |$.Data[9]|object|
      |$.Data[10]|object|
      |$.Data[11]|object|
      |$.Data[12]|object|
      |$.Data[13]|object|
      |$.Data[14]|object|
      |$.Data[15]|object|
      |$.Model|array|

  @Positive @ContentValidation
  Scenario: Validate all users API content structure
    And I send the GET request to "all_users_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data[0].User.id|"1"|
      |$.Data[0].User.name|SLV Traders|
      |$.Data[1].User.id|"2"|
      |$.Data[1].User.name|SLV Traders|
      |$.Data[2].User.id|"3"|
      |$.Data[2].User.name|Covid MGR|
    And validating the response contains the following values
      |Value|
      |Data|
      |User|
      |id|
      |name|
      |Model|
      |SLV Traders|
      |Covid MGR|
      |Sadha|
      |Mobisy|
      |test1|
      |sadha|
      |southsalesmgr|
      |retailer|
      |testuser_tourplan|
      |lion12|

  @Positive @LoadTesting
  Scenario: Load testing for all users API endpoint
    And I send the GET request to "all_users_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data[0].User.id|"1"|
      |$.Data[0].User.name|SLV Traders|
      |$.Data[1].User.id|"2"|
      |$.Data[1].User.name|SLV Traders|
      |$.Data[2].User.id|"3"|
      |$.Data[2].User.name|Covid MGR|
      |$.Model[0]|User|

  @Negative @Timeout
  Scenario: Test all users API endpoint timeout handling
    And I send the GET request to "all_users_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data[0].User.id|"1"|
      |$.Data[0].User.name|SLV Traders|
      |$.Data[1].User.id|"2"|
      |$.Data[1].User.name|SLV Traders|
      |$.Data[2].User.id|"3"|
      |$.Data[2].User.name|Covid MGR|
      |$.Model[0]|User|

  @Positive @EndToEnd
  Scenario: End-to-end all users API data retrieval workflow
    And I send the GET request to "all_users_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data[0].User.id|"1"|
      |$.Data[0].User.name|SLV Traders|
      |$.Data[1].User.id|"2"|
      |$.Data[1].User.name|SLV Traders|
      |$.Data[2].User.id|"3"|
      |$.Data[2].User.name|Covid MGR|
     |$.Data[3].User.id|"4"|
      |$.Data[3].User.name|SLV Traders|
      |$.Data[4].User.id|"5"|
      |$.Data[4].User.name|Sadha|
      |$.Data[5].User.id|"6"|
      |$.Data[5].User.name|Mobisy|
      |$.Data[6].User.id|"7"|
      |$.Data[6].User.name|Sadha Nanda|
      |$.Data[7].User.id|"8"|
      |$.Data[7].User.name|SLV Traders|
      |$.Data[8].User.id|"9"|
      |$.Data[8].User.name|test1|
      |$.Data[9].User.id|"10"|
      |$.Data[9].User.name|sadha|
        |$.Data[10].User.id|"11"|
      |$.Data[10].User.name|southsalesmgr|
      |$.Data[11].User.id|"12"|
      |$.Data[11].User.name|retailer|
      |$.Data[12].User.id|"13"|
      |$.Data[12].User.name|testuser_tourplan|
      |$.Data[13].User.id|"14"|
      |$.Data[13].User.name|sadha|
      |$.Data[14].User.id|"15"|
   
      |$.Data[15].User.id|"16"|
      |$.Data[15].User.name|lion12|
      |$.Model[0]|User|
    And I store the response as "all_users_api_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|
      |$.Data[0]|object|
      |$.Data[1]|object|
      |$.Data[2]|object|
      |$.Data[3]|object|
      |$.Data[4]|object|
      |$.Data[5]|object|
      |$.Data[6]|object|
      |$.Data[7]|object|
      |$.Data[8]|object|
      |$.Data[9]|object|
      |$.Data[10]|object|
      |$.Data[11]|object|
      |$.Data[12]|object|
      |$.Data[13]|object|
      |$.Data[14]|object|
      |$.Data[15]|object|
      |$.Model|array|

  @Positive @AllUsersValidation
  Scenario: Validate all users API data accuracy
    And I send the GET request to "all_users_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data[0].User.id|"1"|
      |$.Data[0].User.name|SLV Traders|
      |$.Data[1].User.id|"2"|
      |$.Data[1].User.name|SLV Traders|
      |$.Data[2].User.id|"3"|
      |$.Data[2].User.name|Covid MGR|
     |$.Data[3].User.id|"4"|
      |$.Data[3].User.name|SLV Traders|
      |$.Data[4].User.id|"5"|
      |$.Data[4].User.name|Sadha|
      |$.Data[5].User.id|"6"|
      |$.Data[5].User.name|Mobisy|
      |$.Data[6].User.id|"7"|
      |$.Data[6].User.name|Sadha Nanda|
      |$.Data[7].User.id|"8"|
      |$.Data[7].User.name|SLV Traders|
      |$.Data[8].User.id|"9"|
      |$.Data[8].User.name|test1|
      |$.Data[9].User.id|"10"|
      |$.Data[9].User.name|sadha|
        |$.Data[10].User.id|"11"|
      |$.Data[10].User.name|southsalesmgr|
      |$.Data[11].User.id|"12"|
      |$.Data[11].User.name|retailer|
      |$.Data[12].User.id|"13"|
      |$.Data[12].User.name|testuser_tourplan|
      |$.Data[13].User.id|"14"|
      |$.Data[13].User.name|sadha|
      |$.Data[14].User.id|"15"|
   
      |$.Data[15].User.id|"16"|
      |$.Data[15].User.name|lion12|
      |$.Model[0]|User|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|
      |$.Data[0]|object|
      |$.Data[0].User|object|
      |$.Data[0].User.id|string|
      |$.Data[0].User.name|string|
      |$.Model|array|
      |$.Model[0]|string|

  @Positive @UserManagementValidation
  Scenario: Validate all users API user management interface
    And I send the GET request to "all_users_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data[0].User.id|"1"|
      |$.Data[0].User.name|SLV Traders|
      |$.Data[1].User.id|"2"|
      |$.Data[1].User.name|SLV Traders|
      |$.Data[2].User.id|"3"|
      |$.Data[2].User.name|Covid MGR|
     |$.Data[3].User.id|"4"|
      |$.Data[3].User.name|SLV Traders|
      |$.Data[4].User.id|"5"|
      |$.Data[4].User.name|Sadha|
      |$.Data[5].User.id|"6"|
      |$.Data[5].User.name|Mobisy|
      |$.Data[6].User.id|"7"|
      |$.Data[6].User.name|Sadha Nanda|
      |$.Data[7].User.id|"8"|
      |$.Data[7].User.name|SLV Traders|
      |$.Data[8].User.id|"9"|
      |$.Data[8].User.name|test1|
      |$.Data[9].User.id|"10"|
      |$.Data[9].User.name|sadha|
        |$.Data[10].User.id|"11"|
      |$.Data[10].User.name|southsalesmgr|
      |$.Data[11].User.id|"12"|
      |$.Data[11].User.name|retailer|
      |$.Data[12].User.id|"13"|
      |$.Data[12].User.name|testuser_tourplan|
      |$.Data[13].User.id|"14"|
      |$.Data[13].User.name|sadha|
      |$.Data[14].User.id|"15"|
   
      |$.Data[15].User.id|"16"|
      |$.Data[15].User.name|lion12|
      |$.Model[0]|User|
    And I verify API response at path with DB and static values
      |JPath|Value|
      
      |$.Data[0].User.name|DB:users:name: id=1|
   
      |$.Data[1].User.name|DB:users:name: id=2|
    
      |$.Data[2].User.name|DB:users:name: id=3|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|
      |$.Data[0]|object|
      |$.Data[0].User|object|
      |$.Data[0].User.id|string|
      |$.Data[0].User.name|string|
      |$.Model|array|
      |$.Model[0]|string|

