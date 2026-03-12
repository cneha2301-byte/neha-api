@BizomWebAPI @SettingsManagement @GetRoleName @WarehouseOperations @CE
Feature: Settings Get Role Name API Testing
  As a system user
  I want to test the settings getRoleName endpoint
  So that I can ensure proper functionality and data retrieval for role names

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get role name without access token
    When I send the GET request to "settings_get_role_name" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get role name with invalid access token
#    And I send the GET request to "settings_get_role_name" endpoint with dynamic access token and query parameters
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
#  Scenario: Get role name with expired access token
#    And I send the GET request to "settings_get_role_name" endpoint with dynamic access token and query parameters
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
#  Scenario: Get role name with malformed access token
#    And I send the GET request to "settings_get_role_name" endpoint with dynamic access token and query parameters
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
#  Scenario: Get role name with valid access token
#    And I send the GET request to "settings_get_role_name" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|array|
#      |$[0]|object|
#      |$[0].id|string|
#      |$[0].name|string|
#      |$[1]|object|
#      |$[1].id|string|
#      |$[1].name|string|
#    And I store the response as "role_name_response" name using full path

#  @Positive @DataValidation
#  Scenario: Validate role name response structure
#    And I send the GET request to "settings_get_role_name" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|array|
#      |$[0]|object|
#      |$[0].id|string|
#      |$[0].name|string|
#      |$[1]|object|
#      |$[1].id|string|
#      |$[1].name|string|
#      |$[2]|object|
#      |$[2].id|string|
#      |$[2].name|string|
#      |$[3]|object|
#      |$[3].id|string|
#      |$[3].name|string|
#      |$[4]|object|
#      |$[4].id|string|
#      |$[4].name|string|
#      |$[5]|object|
#      |$[5].id|string|
#      |$[5].name|string|
#      |$[6]|object|
#      |$[6].id|string|
#      |$[6].name|string|
#      |$[7]|object|
#      |$[7].id|string|
#      |$[7].name|string|
#      |$[8]|object|
#      |$[8].id|string|
#      |$[8].name|string|
#      |$[9]|object|
#      |$[9].id|string|
#      |$[9].name|string|
#      |$[10]|object|
#      |$[10].id|string|
#      |$[10].name|string|
#      |$[11]|object|
#      |$[11].id|string|
#      |$[11].name|string|
#      |$[12]|object|
#      |$[12].id|string|
#      |$[12].name|string|
#      |$[13]|object|
#      |$[13].id|string|
#      |$[13].name|string|

  @Positive @DataValidation
  Scenario: Validate role name specific data values
    And I send the GET request to "settings_get_role_name" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$[0].name|DB:roles:name: id=1|
      |$[1].name|DB:roles:name: id=2|
      |$[2].name|DB:roles:name: id=3|
      |$[3].name|DB:roles:name: id=4|
      |$[4].name|DB:roles:name: id=5|
      |$[5].name|DB:roles:name: id=6|
      |$[6].name|DB:roles:name: id=7|
      |$[7].name|DB:roles:name: id=8|
      |$[8].name|DB:roles:name: id=9|
      |$[9].name|DB:roles:name: id=10|
      |$[10].name|DB:roles:name: id=11|
      |$[11].name|DB:roles:name: id=12|
      |$[12].name|DB:roles:name: id=13|
      |$[13].name|DB:roles:name: id=14|

  @Positive @DataValidation
  Scenario: Validate role name with static values
    And I send the GET request to "settings_get_role_name" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$[0].id|"1"|
      |$[0].name|ADMIN|
      |$[1].id|"2"|
      |$[1].name|ZONE MANAGER|
      |$[2].id|"3"|
      |$[2].name|WAREHOUSE MANAGER|
      |$[3].id|"4"|
      |$[3].name|SALES MANAGER|
      |$[4].id|"5"|
      |$[4].name|SALESMAN|
      |$[5].id|"6"|
      |$[5].name|DISTRIBUTOR MANAGER|
      |$[6].id|"7"|
      |$[6].name|DISTRIBUTOR SALESMAN|
      |$[7].id|"8"|
      |$[7].name|DISTRIBUTOR SALES MANAGER|
      |$[8].id|"9"|
      |$[8].name|REPORT ADMIN|
      |$[9].id|"10"|
      |$[9].name|EXECUTION AUDITOR|
      |$[10].id|"11"|
      |$[10].name|INVENTORY MANAGER|
      |$[11].id|"12"|
      |$[11].name|VENDOR|
      |$[12].id|"13"|
      |$[12].name|RETAILER|
      |$[13].id|"14"|
      |$[13].name|ERP API USER|

  @Positive @Performance
  Scenario: Performance test for role name endpoint
    And I send the GET request to "settings_get_role_name" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

#  @Positive @Concurrency
#  Scenario: Concurrent access test for role name endpoint
#    And I send the GET request to "settings_get_role_name" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|array|
#      |$[0]|object|
#      |$[0].id|string|
#      |$[0].name|string|
#      |$[1]|object|
#      |$[1].id|string|
#      |$[1].name|string|

  @Negative @Validation
  Scenario: Get role name with invalid query parameters
    And I send the GET request to "settings_get_role_name" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Negative @Validation
  Scenario: Get role name with special characters in query parameters
    And I send the GET request to "settings_get_role_name" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Negative @Security
  Scenario: Get role name with SQL injection attempt
    And I send the GET request to "settings_get_role_name" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE roles; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Negative @Boundary
  Scenario: Get role name with maximum query parameters
    And I send the GET request to "settings_get_role_name" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

#  @Negative @ErrorHandling
#  Scenario: Get role name with invalid endpoint
#    And I send the GET request to "settings_get_role_name_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

#  @Positive @BusinessLogic
#  Scenario: Validate role name business logic
#    And I send the GET request to "settings_get_role_name" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|array|
#      |$[0]|object|
#      |$[0].id|string|
#      |$[0].name|string|
#      |$[1]|object|
#      |$[1].id|string|
#      |$[1].name|string|
#      |$[2]|object|
#      |$[2].id|string|
#      |$[2].name|string|

#  @Positive @DataIntegrity
#  Scenario: Validate role name data integrity
#    And I send the GET request to "settings_get_role_name" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|array|
#      |$[0]|object|
#      |$[0].id|string|
#      |$[0].name|string|
#      |$[1]|object|
#      |$[1].id|string|
#      |$[1].name|string|
#      |$[2]|object|
#      |$[2].id|string|
#      |$[2].name|string|
#    And validating the response contains the following values
#      |Value|
#      |id|
#      |name|
#      |ADMIN|
#      |ZONE MANAGER|
#      |WAREHOUSE MANAGER|
#      |SALES MANAGER|
#      |SALESMAN|
#      |DISTRIBUTOR MANAGER|
#      |DISTRIBUTOR SALESMAN|
#      |DISTRIBUTOR SALES MANAGER|
#      |REPORT ADMIN|
#      |EXECUTION AUDITOR|
#      |INVENTORY MANAGER|
#      |VENDOR|
#      |RETAILER|
#      |ERP API USER|

#  @Positive @Regression
#  Scenario: Regression test for role name endpoint
#    And I send the GET request to "settings_get_role_name" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|array|
#      |$[0]|object|
#      |$[0].id|string|
#      |$[0].name|string|

#  @Positive @Functional
#  Scenario: Validate role name response completeness
#    And I send the GET request to "settings_get_role_name" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|array|
#      |$[0]|object|
#      |$[0].id|string|
#      |$[0].name|string|
#      |$[1]|object|
#      |$[1].id|string|
#      |$[1].name|string|
#      |$[2]|object|
#      |$[2].id|string|
#      |$[2].name|string|
#      |$[3]|object|
#      |$[3].id|string|
#      |$[3].name|string|
#      |$[4]|object|
#      |$[4].id|string|
#      |$[4].name|string|
#      |$[5]|object|
#      |$[5].id|string|
#      |$[5].name|string|
#      |$[6]|object|
#      |$[6].id|string|
#      |$[6].name|string|
#      |$[7]|object|
#      |$[7].id|string|
#      |$[7].name|string|
#      |$[8]|object|
#      |$[8].id|string|
#      |$[8].name|string|
#      |$[9]|object|
#      |$[9].id|string|
#      |$[9].name|string|
#      |$[10]|object|
#      |$[10].id|string|
#      |$[10].name|string|
#      |$[11]|object|
#      |$[11].id|string|
#      |$[11].name|string|
#      |$[12]|object|
#      |$[12].id|string|
#      |$[12].name|string|
#      |$[13]|object|
#      |$[13].id|string|
#      |$[13].name|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$[0].id|"1"|
#      |$[0].name|ADMIN|
#      |$[1].id|"2"|
#      |$[1].name|ZONE MANAGER|
#      |$[2].id|"3"|
#      |$[2].name|WAREHOUSE MANAGER|
#      |$[3].id|"4"|
#      |$[3].name|SALES MANAGER|
#      |$[4].id|"5"|
#      |$[4].name|SALESMAN|
#      |$[5].id|"6"|
#      |$[5].name|DISTRIBUTOR MANAGER|
#      |$[6].id|"7"|
#      |$[6].name|DISTRIBUTOR SALESMAN|
#      |$[7].id|"8"|
#      |$[7].name|DISTRIBUTOR SALES MANAGER|
#      |$[8].id|"9"|
#      |$[8].name|REPORT ADMIN|
#      |$[9].id|"10"|
#      |$[9].name|EXECUTION AUDITOR|
#      |$[10].id|"11"|
#      |$[10].name|INVENTORY MANAGER|
#      |$[11].id|"12"|
#      |$[11].name|VENDOR|
#      |$[12].id|"13"|
#      |$[12].name|RETAILER|
#      |$[13].id|"14"|
#      |$[13].name|ERP API USER|

#  @Positive @ArrayValidation
#  Scenario: Validate role name array structure and content
#    And I send the GET request to "settings_get_role_name" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|array|
#      |$[0]|object|
#      |$[0].id|string|
#      |$[0].name|string|
#      |$[1]|object|
#      |$[1].id|string|
#      |$[1].name|string|
#      |$[2]|object|
#      |$[2].id|string|
#      |$[2].name|string|
#      |$[3]|object|
#      |$[3].id|string|
#      |$[3].name|string|
#      |$[4]|object|
#      |$[4].id|string|
#      |$[4].name|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$[0].id|"1"|
#      |$[0].name|ADMIN|
#      |$[1].id|"2"|
#      |$[1].name|ZONE MANAGER|
#      |$[2].id|"3"|
#      |$[2].name|WAREHOUSE MANAGER|
#      |$[3].id|"4"|
#      |$[3].name|SALES MANAGER|
#      |$[4].id|"5"|
#      |$[4].name|SALESMAN|
#      |$[5].id|"6"|
#      |$[5].name|DISTRIBUTOR MANAGER|
#      |$[6].id|"7"|
#      |$[6].name|DISTRIBUTOR SALESMAN|
#      |$[7].id|"8"|
#      |$[7].name|DISTRIBUTOR SALES MANAGER|
#      |$[8].id|"9"|
#      |$[8].name|REPORT ADMIN|
#      |$[9].id|"10"|
#      |$[9].name|EXECUTION AUDITOR|
#      |$[10].id|"11"|
#      |$[10].name|INVENTORY MANAGER|
#      |$[11].id|"12"|
#      |$[11].name|VENDOR|
#      |$[12].id|"13"|
#      |$[12].name|RETAILER|
#      |$[13].id|"14"|
#      |$[13].name|ERP API USER|

  @Positive @ContentValidation
  Scenario: Validate role name content structure
    And I send the GET request to "settings_get_role_name" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |id|
      |name|
      |ADMIN|
      |ZONE MANAGER|
      |WAREHOUSE MANAGER|
      |SALES MANAGER|
      |SALESMAN|
      |DISTRIBUTOR MANAGER|
      |DISTRIBUTOR SALESMAN|
      |DISTRIBUTOR SALES MANAGER|
      |REPORT ADMIN|
      |EXECUTION AUDITOR|
      |INVENTORY MANAGER|
      |VENDOR|
      |RETAILER|
      |ERP API USER|

  @Positive @LoadTesting
  Scenario: Load testing for role name endpoint
    And I send the GET request to "settings_get_role_name" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Negative @Timeout
  Scenario: Test role name endpoint timeout handling
    And I send the GET request to "settings_get_role_name" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

#  @Positive @EndToEnd
#  Scenario: End-to-end role name data retrieval workflow
#    And I send the GET request to "settings_get_role_name" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And I store the response as "role_name_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|array|
#      |$[0]|object|
#      |$[0].id|string|
#      |$[0].name|string|
#      |$[1]|object|
#      |$[1].id|string|
#      |$[1].name|string|
#      |$[2]|object|
#      |$[2].id|string|
#      |$[2].name|string|
#      |$[3]|object|
#      |$[3].id|string|
#      |$[3].name|string|
#      |$[4]|object|
#      |$[4].id|string|
#      |$[4].name|string|
#      |$[5]|object|
#      |$[5].id|string|
#      |$[5].name|string|
#      |$[6]|object|
#      |$[6].id|string|
#      |$[6].name|string|
#      |$[7]|object|
#      |$[7].id|string|
#      |$[7].name|string|
#      |$[8]|object|
#      |$[8].id|string|
#      |$[8].name|string|
#      |$[9]|object|
#      |$[9].id|string|
#      |$[9].name|string|
#      |$[10]|object|
#      |$[10].id|string|
#      |$[10].name|string|
#      |$[11]|object|
#      |$[11].id|string|
#      |$[11].name|string|
#      |$[12]|object|
#      |$[12].id|string|
#      |$[12].name|string|
#      |$[13]|object|
#      |$[13].id|string|
#      |$[13].name|string|
#    And validating the response contains the following values
#      |Value|
#      |id|
#      |name|
#      |ADMIN|
#      |ZONE MANAGER|
#      |WAREHOUSE MANAGER|
#      |SALES MANAGER|
#      |SALESMAN|
#      |DISTRIBUTOR MANAGER|
#      |DISTRIBUTOR SALESMAN|
#      |DISTRIBUTOR SALES MANAGER|
#      |REPORT ADMIN|
#      |EXECUTION AUDITOR|
#      |INVENTORY MANAGER|
#      |VENDOR|
#      |RETAILER|
#      |ERP API USER|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$[0].id|"1"|
#      |$[0].name|ADMIN|
#      |$[1].id|"2"|
#      |$[1].name|ZONE MANAGER|
#      |$[2].id|"3"|
#      |$[2].name|WAREHOUSE MANAGER|
#      |$[3].id|"4"|
#      |$[3].name|SALES MANAGER|
#      |$[4].id|"5"|
#      |$[4].name|SALESMAN|
#      |$[5].id|"6"|
#      |$[5].name|DISTRIBUTOR MANAGER|
#      |$[6].id|"7"|
#      |$[6].name|DISTRIBUTOR SALESMAN|
#      |$[7].id|"8"|
#      |$[7].name|DISTRIBUTOR SALES MANAGER|
#      |$[8].id|"9"|
#      |$[8].name|REPORT ADMIN|
#      |$[9].id|"10"|
#      |$[9].name|EXECUTION AUDITOR|
#      |$[10].id|"11"|
#      |$[10].name|INVENTORY MANAGER|
#      |$[11].id|"12"|
#      |$[11].name|VENDOR|
#      |$[12].id|"13"|
#      |$[12].name|RETAILER|
#      |$[13].id|"14"|
#      |$[13].name|ERP API USER|

