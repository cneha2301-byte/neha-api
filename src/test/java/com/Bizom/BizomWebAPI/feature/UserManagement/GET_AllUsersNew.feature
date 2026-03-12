@BizomWebAPI @CE @AllUsersNew @UserManagement
Feature: All Users New API Testing
  As a system user
  I want to test the all users new endpoint
  So that I can ensure proper functionality and data retrieval for all users new management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get all users new without access token
    When I send the GET request to "all_users_new" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get all users new with invalid access token
    And I send the GET request to "all_users_new" endpoint with dynamic access token and query parameters
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
  Scenario: Get all users new with expired access token
    And I send the GET request to "all_users_new" endpoint with dynamic access token and query parameters
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
  Scenario: Get all users new with malformed access token
    And I send the GET request to "all_users_new" endpoint with dynamic access token and query parameters
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
  Scenario: Get all users new with valid access token
    And I send the GET request to "all_users_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.users[0].id|"15"|
      |$.users[0].username|RobertDROPTABLEStuden|
    
      |$.users[1].id|"24"|
      |$.users[1].username|jkks78k|
      |$.users[1].name|"789"|
      |$.users[2].id|"3"|
      |$.users[2].username|covidmgr|
      |$.users[2].name|Covid MGR|
    And I store the response as "all_users_new_response" name using full path

#  @Positive @DataValidation
#  Scenario: Validate all users new response structure
#    And I send the GET request to "all_users_new" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.users[0].id|"15"|
#      |$.users[0].username|RobertDROPTABLEStuden|
#
#      |$.users[1].id|"24"|
#      |$.users[1].username|jkks78k|
#      |$.users[1].name|"789"|
#      |$.users[2].id|"3"|
#      |$.users[2].username|covidmgr|
#      |$.users[2].name|Covid MGR|
#      |$.users[3].id|"18"|
#      |$.users[3].username|hjvsh|
#      |$.users[3].name|hjjkk|
#      |$.users[4].id|"22"|
#      |$.users[4].username|mobisy158|
#      |$.users[4].name|hjk|
#      |$.users[5].id|"23"|
#      |$.users[5].username|jkksk|
#      |$.users[5].name|kji|
#      |$.users[6].id|"25"|
#      |$.users[6].username|yuii|
#      |$.users[6].name|kji|
#      |$.users[7].id|"26"|
#      |$.users[7].username|yuiitu|
#      |$.users[7].name|kjijj|
#      |$.users[8].id|"27"|
#      |$.users[8].username|dtrfy|
#      |$.users[8].name|kjijj|
#      |$.users[9].id|"16"|
#      |$.users[9].username|lion|
#      |$.users[9].name|lion12|
#      |$.users[10].id|"6"|
#      |$.users[10].username|nrthwmgr|
#      |$.users[10].name|Mobisy|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.users|array|
#      |$.users[0]|object|
#      |$.users[0].id|string|
#      |$.users[0].username|string|
#      |$.users[0].name|string|

#  @Positive @DataValidation
#  Scenario: Validate all users new response completeness
#    And I send the GET request to "all_users_new" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.users[0].id|"15"|
#      |$.users[0].username|RobertDROPTABLEStuden|
#
#      |$.users[1].id|"24"|
#      |$.users[1].username|jkks78k|
#      |$.users[1].name|"789"|
#      |$.users[2].id|"3"|
#      |$.users[2].username|covidmgr|
#      |$.users[2].name|Covid MGR|
#      |$.users[3].id|"18"|
#      |$.users[3].username|hjvsh|
#      |$.users[3].name|hjjkk|
#      |$.users[4].id|"22"|
#      |$.users[4].username|mobisy158|
#      |$.users[4].name|hjk|
#      |$.users[5].id|"23"|
#      |$.users[5].username|jkksk|
#      |$.users[5].name|kji|
#      |$.users[6].id|"25"|
#      |$.users[6].username|yuii|
#      |$.users[6].name|kji|
#      |$.users[7].id|"26"|
#      |$.users[7].username|yuiitu|
#      |$.users[7].name|kjijj|
#      |$.users[8].id|"27"|
#      |$.users[8].username|dtrfy|
#      |$.users[8].name|kjijj|
#      |$.users[9].id|"16"|
#      |$.users[9].username|lion|
#      |$.users[9].name|lion12|
#      |$.users[10].id|"6"|
#      |$.users[10].username|nrthwmgr|
#      |$.users[10].name|Mobisy|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.users|array|
#      |$.users[0]|object|
#      |$.users[0].id|string|
#      |$.users[0].username|string|
#      |$.users[0].name|string|

  @Positive @Performance
  Scenario: Performance test for all users new endpoint
    And I send the GET request to "all_users_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.users[0].id|"15"|
      |$.users[0].username|RobertDROPTABLEStuden|
    
      |$.users[1].id|"24"|
      |$.users[1].username|jkks78k|
      |$.users[1].name|"789"|
      |$.users[2].id|"3"|
      |$.users[2].username|covidmgr|
      |$.users[2].name|Covid MGR|

  @Positive @Concurrency
  Scenario: Concurrent access test for all users new endpoint
    And I send the GET request to "all_users_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.users[0].id|"15"|
      |$.users[0].username|RobertDROPTABLEStuden|
    
      |$.users[1].id|"24"|
      |$.users[1].username|jkks78k|
      |$.users[1].name|"789"|
      |$.users[2].id|"3"|
      |$.users[2].username|covidmgr|
      |$.users[2].name|Covid MGR|

  @Negative @Validation
  Scenario: Get all users new with invalid query parameters
    And I send the GET request to "all_users_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.users[0].id|"15"|
      |$.users[0].username|RobertDROPTABLEStuden|
    
      |$.users[1].id|"24"|
      |$.users[1].username|jkks78k|
      |$.users[1].name|"789"|
      |$.users[2].id|"3"|
      |$.users[2].username|covidmgr|
      |$.users[2].name|Covid MGR|

  @Negative @Validation
  Scenario: Get all users new with special characters in query parameters
    And I send the GET request to "all_users_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.users[0].id|"15"|
      |$.users[0].username|RobertDROPTABLEStuden|
    
      |$.users[1].id|"24"|
      |$.users[1].username|jkks78k|
      |$.users[1].name|"789"|
      |$.users[2].id|"3"|
      |$.users[2].username|covidmgr|
      |$.users[2].name|Covid MGR|

  @Negative @Security
  Scenario: Get all users new with SQL injection attempt
    And I send the GET request to "all_users_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE users; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.users[0].id|"15"|
      |$.users[0].username|RobertDROPTABLEStuden|
    
      |$.users[1].id|"24"|
      |$.users[1].username|jkks78k|
      |$.users[1].name|"789"|
      |$.users[2].id|"3"|
      |$.users[2].username|covidmgr|
      |$.users[2].name|Covid MGR|

  @Negative @Boundary
  Scenario: Get all users new with maximum query parameters
    And I send the GET request to "all_users_new" endpoint with dynamic access token and query parameters
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
      |$.result|true|
      |$.users[0].id|"15"|
      |$.users[0].username|RobertDROPTABLEStuden|
    
      |$.users[1].id|"24"|
      |$.users[1].username|jkks78k|
      |$.users[1].name|"789"|
      |$.users[2].id|"3"|
      |$.users[2].username|covidmgr|
      |$.users[2].name|Covid MGR|

#  @Negative @ErrorHandling
#  Scenario: Get all users new with invalid endpoint
#    And I send the GET request to "all_users_new_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

  @Positive @BusinessLogic
  Scenario: Validate all users new business logic
    And I send the GET request to "all_users_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.users[0].id|"15"|
      |$.users[0].username|RobertDROPTABLEStuden|
    
      |$.users[1].id|"24"|
      |$.users[1].username|jkks78k|
      |$.users[1].name|"789"|
      |$.users[2].id|"3"|
      |$.users[2].username|covidmgr|
      |$.users[2].name|Covid MGR|
    And I verify API response at path with DB and static values
      |JPath|Value|
    
      |$.users[0].username|DB:users:username: id=15|
      |$.users[0].name|DB:users:name: id=15|
     
      |$.users[1].username|DB:users:username: id=24|
 

  @Positive @DataIntegrity
  Scenario: Validate all users new data integrity
    And I send the GET request to "all_users_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.users[0].id|"15"|
      |$.users[0].username|RobertDROPTABLEStuden|
    
      |$.users[1].id|"24"|
      |$.users[1].username|jkks78k|
      |$.users[1].name|"789"|
      |$.users[2].id|"3"|
      |$.users[2].username|covidmgr|
      |$.users[2].name|Covid MGR|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.users|array|
      |$.users[0]|object|
      |$.users[0].id|string|
      |$.users[0].username|string|
      |$.users[0].name|string|

  @Positive @Regression
  Scenario: Regression test for all users new endpoint
    And I send the GET request to "all_users_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.users[0].id|"15"|
      |$.users[0].username|RobertDROPTABLEStuden|
    
      |$.users[1].id|"24"|
      |$.users[1].username|jkks78k|
      |$.users[1].name|"789"|
      |$.users[2].id|"3"|
      |$.users[2].username|covidmgr|
      |$.users[2].name|Covid MGR|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.users|array|
      |$.users[0]|object|
      |$.users[0].id|string|
      |$.users[0].username|string|
      |$.users[0].name|string|

#  @Positive @Functional
#  Scenario: Validate all users new response completeness
#    And I send the GET request to "all_users_new" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.users[0].id|"15"|
#      |$.users[0].username|RobertDROPTABLEStuden|
#
#      |$.users[1].id|"24"|
#      |$.users[1].username|jkks78k|
#      |$.users[1].name|"789"|
#      |$.users[2].id|"3"|
#      |$.users[2].username|covidmgr|
#      |$.users[2].name|Covid MGR|
#      |$.users[3].id|"18"|
#      |$.users[3].username|hjvsh|
#      |$.users[3].name|hjjkk|
#      |$.users[4].id|"22"|
#      |$.users[4].username|mobisy158|
#      |$.users[4].name|hjk|
#      |$.users[5].id|"23"|
#      |$.users[5].username|jkksk|
#      |$.users[5].name|kji|
#      |$.users[6].id|"25"|
#      |$.users[6].username|yuii|
#      |$.users[6].name|kji|
#      |$.users[7].id|"26"|
#      |$.users[7].username|yuiitu|
#      |$.users[7].name|kjijj|
#      |$.users[8].id|"27"|
#      |$.users[8].username|dtrfy|
#      |$.users[8].name|kjijj|
#      |$.users[9].id|"16"|
#      |$.users[9].username|lion|
#      |$.users[9].name|lion12|
#      |$.users[10].id|"6"|
#      |$.users[10].username|nrthwmgr|
#      |$.users[10].name|Mobisy|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.users|array|
#      |$.users[0]|object|
#      |$.users[1]|object|
#      |$.users[2]|object|
#      |$.users[3]|object|
#      |$.users[4]|object|
#      |$.users[5]|object|
#      |$.users[6]|object|
#      |$.users[7]|object|
#      |$.users[8]|object|
#      |$.users[9]|object|
#      |$.users[10]|object|

#  @Positive @ArrayValidation
#  Scenario: Validate all users new array structure and content
#    And I send the GET request to "all_users_new" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.users[0].id|"15"|
#      |$.users[0].username|RobertDROPTABLEStuden|
#
#      |$.users[1].id|"24"|
#      |$.users[1].username|jkks78k|
#      |$.users[1].name|"789"|
#      |$.users[2].id|"3"|
#      |$.users[2].username|covidmgr|
#      |$.users[2].name|Covid MGR|
#      |$.users[3].id|"18"|
#      |$.users[3].username|hjvsh|
#      |$.users[3].name|hjjkk|
#      |$.users[4].id|"22"|
#      |$.users[4].username|mobisy158|
#      |$.users[4].name|hjk|
#      |$.users[5].id|"23"|
#      |$.users[5].username|jkksk|
#      |$.users[5].name|kji|
#      |$.users[6].id|"25"|
#      |$.users[6].username|yuii|
#      |$.users[6].name|kji|
#      |$.users[7].id|"26"|
#      |$.users[7].username|yuiitu|
#      |$.users[7].name|kjijj|
#      |$.users[8].id|"27"|
#      |$.users[8].username|dtrfy|
#      |$.users[8].name|kjijj|
#      |$.users[9].id|"16"|
#      |$.users[9].username|lion|
#      |$.users[9].name|lion12|
#      |$.users[10].id|"6"|
#      |$.users[10].username|nrthwmgr|
#      |$.users[10].name|Mobisy|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.users|array|
#      |$.users[0]|object|
#      |$.users[1]|object|
#      |$.users[2]|object|
#      |$.users[3]|object|
#      |$.users[4]|object|
#      |$.users[5]|object|
#      |$.users[6]|object|
#      |$.users[7]|object|
#      |$.users[8]|object|
#      |$.users[9]|object|
#      |$.users[10]|object|

  @Positive @ContentValidation
  Scenario: Validate all users new content structure
    And I send the GET request to "all_users_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.users[0].id|"15"|
      |$.users[0].username|RobertDROPTABLEStuden|
    
      |$.users[1].id|"24"|
      |$.users[1].username|jkks78k|
      |$.users[1].name|"789"|
      |$.users[2].id|"3"|
      |$.users[2].username|covidmgr|
      |$.users[2].name|Covid MGR|
    And validating the response contains the following values
      |Value|
      |result|
      |users|
      |id|
      |username|
      |name|
      |RobertDROPTABLEStuden|
      |jkks78k|
      |covidmgr|
      |Covid MGR|
      |Mobisy|
      |lion12|
      |testuser_tourplan|
      |SLV Traders|

  @Positive @LoadTesting
  Scenario: Load testing for all users new endpoint
    And I send the GET request to "all_users_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.users[0].id|"15"|
      |$.users[0].username|RobertDROPTABLEStuden|
    
      |$.users[1].id|"24"|
      |$.users[1].username|jkks78k|
      |$.users[1].name|"789"|
      |$.users[2].id|"3"|
      |$.users[2].username|covidmgr|
      |$.users[2].name|Covid MGR|

  @Negative @Timeout
  Scenario: Test all users new endpoint timeout handling
    And I send the GET request to "all_users_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.users[0].id|"15"|
      |$.users[0].username|RobertDROPTABLEStuden|
    
      |$.users[1].id|"24"|
      |$.users[1].username|jkks78k|
      |$.users[1].name|"789"|
      |$.users[2].id|"3"|
      |$.users[2].username|covidmgr|
      |$.users[2].name|Covid MGR|

#  @Positive @EndToEnd
#  Scenario: End-to-end all users new data retrieval workflow
#    And I send the GET request to "all_users_new" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.users[0].id|"15"|
#      |$.users[0].username|RobertDROPTABLEStuden|
#
#      |$.users[1].id|"24"|
#      |$.users[1].username|jkks78k|
#      |$.users[1].name|"789"|
#      |$.users[2].id|"3"|
#      |$.users[2].username|covidmgr|
#      |$.users[2].name|Covid MGR|
#      |$.users[3].id|"18"|
#      |$.users[3].username|hjvsh|
#      |$.users[3].name|hjjkk|
#      |$.users[4].id|"22"|
#      |$.users[4].username|mobisy158|
#      |$.users[4].name|hjk|
#      |$.users[5].id|"23"|
#      |$.users[5].username|jkksk|
#      |$.users[5].name|kji|
#      |$.users[6].id|"25"|
#      |$.users[6].username|yuii|
#      |$.users[6].name|kji|
#      |$.users[7].id|"26"|
#      |$.users[7].username|yuiitu|
#      |$.users[7].name|kjijj|
#      |$.users[8].id|"27"|
#      |$.users[8].username|dtrfy|
#      |$.users[8].name|kjijj|
#      |$.users[9].id|"16"|
#      |$.users[9].username|lion|
#      |$.users[9].name|lion12|
#      |$.users[10].id|"6"|
#      |$.users[10].username|nrthwmgr|
#      |$.users[10].name|Mobisy|
#    And I store the response as "all_users_new_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.users|array|
#      |$.users[0]|object|
#      |$.users[1]|object|
#      |$.users[2]|object|
#      |$.users[3]|object|
#      |$.users[4]|object|
#      |$.users[5]|object|
#      |$.users[6]|object|
#      |$.users[7]|object|
#      |$.users[8]|object|
#      |$.users[9]|object|
#      |$.users[10]|object|

#  @Positive @AllUsersNewValidation
#  Scenario: Validate all users new data accuracy
#    And I send the GET request to "all_users_new" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.users[0].id|"15"|
#      |$.users[0].username|RobertDROPTABLEStuden|
#
#      |$.users[1].id|"24"|
#      |$.users[1].username|jkks78k|
#      |$.users[1].name|"789"|
#      |$.users[2].id|"3"|
#      |$.users[2].username|covidmgr|
#      |$.users[2].name|Covid MGR|
#      |$.users[3].id|"18"|
#      |$.users[3].username|hjvsh|
#      |$.users[3].name|hjjkk|
#      |$.users[4].id|"22"|
#      |$.users[4].username|mobisy158|
#      |$.users[4].name|hjk|
#      |$.users[5].id|"23"|
#      |$.users[5].username|jkksk|
#      |$.users[5].name|kji|
#      |$.users[6].id|"25"|
#      |$.users[6].username|yuii|
#      |$.users[6].name|kji|
#      |$.users[7].id|"26"|
#      |$.users[7].username|yuiitu|
#      |$.users[7].name|kjijj|
#      |$.users[8].id|"27"|
#      |$.users[8].username|dtrfy|
#      |$.users[8].name|kjijj|
#      |$.users[9].id|"16"|
#      |$.users[9].username|lion|
#      |$.users[9].name|lion12|
#      |$.users[10].id|"6"|
#      |$.users[10].username|nrthwmgr|
#      |$.users[10].name|Mobisy|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.users|array|
#      |$.users[0]|object|
#      |$.users[0].id|string|
#      |$.users[0].username|string|
#      |$.users[0].name|string|

  @Positive @UserManagementValidation
  Scenario: Validate all users new user management interface
    And I send the GET request to "all_users_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.users[0].id|"15"|
      |$.users[0].username|RobertDROPTABLEStuden|
    
      |$.users[1].id|"24"|
      |$.users[1].username|jkks78k|
      |$.users[1].name|"789"|
      |$.users[2].id|"3"|
      |$.users[2].username|covidmgr|
      |$.users[2].name|Covid MGR|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.users[0].username|DB:users:username: id=15|
      |$.users[0].name|DB:users:name: id=15|
      |$.users[1].username|DB:users:username: id=24|
 
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.users|array|
      |$.users[0]|object|
      |$.users[0].id|string|
      |$.users[0].username|string|
      |$.users[0].name|string|

