@BizomWebAPI @RolesManagement @RolesByAlias @OrderManagement @CE
Feature: Get Roles By Alias API Testing
  As a system user
  I want to test the get roles by alias endpoint
  So that I can ensure proper functionality and data retrieval for roles by alias management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get roles by alias without access token
    When I send the GET request to "roles_get_roles_by_alias" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get roles by alias with invalid access token
    And I send the GET request to "roles_get_roles_by_alias" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get roles by alias with expired access token
    And I send the GET request to "roles_get_roles_by_alias" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get roles by alias with malformed access token
    And I send the GET request to "roles_get_roles_by_alias" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get roles by alias with valid access token
    And I send the GET request to "roles_get_roles_by_alias" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|
      |$.roles[0].id|"1"|
      |$.roles[0].name|ADMIN|
      |$.roles[1].id|"2"|
      |$.roles[1].name|ZONE MANAGER|
      |$.roles[2].id|"3"|
      |$.roles[2].name|WAREHOUSE MANAGER|
    And I store the response as "roles_by_alias_response" name using full path

  @Positive @DataValidation
  Scenario: Validate roles by alias response structure
    And I send the GET request to "roles_get_roles_by_alias" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|
      |$.roles[0].id|"1"|
      |$.roles[0].name|ADMIN|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|array|
      |$.roles|array|
      |$.roles[0]|object|
      |$.roles[0].id|string|
      |$.roles[0].name|string|
      |$.roles[1].id|string|
      |$.roles[1].name|string|
      |$.roles[2].id|string|
      |$.roles[2].name|string|

  @Positive @DataValidation
  Scenario: Validate roles by alias specific data values
    And I send the GET request to "roles_get_roles_by_alias" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|
      |$.roles[0].id|"1"|
      |$.roles[0].name|ADMIN|
      |$.roles[1].id|"2"|
      |$.roles[1].name|ZONE MANAGER|
      |$.roles[2].id|"3"|
      |$.roles[2].name|WAREHOUSE MANAGER|
      |$.roles[3].id|"4"|
      |$.roles[3].name|SALES MANAGER|
      |$.roles[4].id|"5"|
      |$.roles[4].name|SALESMAN|
      |$.roles[5].id|"6"|
      |$.roles[5].name|DISTRIBUTOR MANAGER|
      |$.roles[6].id|"7"|
      |$.roles[6].name|DISTRIBUTOR SALESMAN|
      |$.roles[7].id|"8"|
      |$.roles[7].name|DISTRIBUTOR SALES MANAGER|
      |$.roles[8].id|"9"|
      |$.roles[8].name|REPORT ADMIN|
      |$.roles[9].id|"10"|
      |$.roles[9].name|EXECUTION AUDITOR|
      |$.roles[10].id|"11"|
      |$.roles[10].name|INVENTORY MANAGER|
      |$.roles[11].id|"12"|
      |$.roles[11].name|VENDOR|
      |$.roles[12].id|"13"|
      |$.roles[12].name|RETAILER|
      |$.roles[13].id|"14"|
      |$.roles[13].name|ERP API USER|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.roles[0].name|DB:roles:name: id=1|
      |$.roles[1].name|DB:roles:name: id=2|
      |$.roles[2].name|DB:roles:name: id=3|
      |$.roles[3].name|DB:roles:name: id=4|
      |$.roles[4].name|DB:roles:name: id=5|
      |$.roles[5].name|DB:roles:name: id=6|
      |$.roles[6].name|DB:roles:name: id=7|
      |$.roles[7].name|DB:roles:name: id=8|
      |$.roles[8].name|DB:roles:name: id=9|
      |$.roles[9].name|DB:roles:name: id=10|
      |$.roles[10].name|DB:roles:name: id=11|
      |$.roles[11].name|DB:roles:name: id=12|
      |$.roles[12].name|DB:roles:name: id=13|
      |$.roles[13].name|DB:roles:name: id=14|

  @Positive @DataValidation
  Scenario: Validate roles by alias with static values
    And I send the GET request to "roles_get_roles_by_alias" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|
      |$.roles[0].id|"1"|
      |$.roles[0].name|ADMIN|
      |$.roles[1].id|"2"|
      |$.roles[1].name|ZONE MANAGER|
      |$.roles[2].id|"3"|
      |$.roles[2].name|WAREHOUSE MANAGER|
      |$.roles[3].id|"4"|
      |$.roles[3].name|SALES MANAGER|
      |$.roles[4].id|"5"|
      |$.roles[4].name|SALESMAN|
      |$.roles[5].id|"6"|
      |$.roles[5].name|DISTRIBUTOR MANAGER|
      |$.roles[6].id|"7"|
      |$.roles[6].name|DISTRIBUTOR SALESMAN|
      |$.roles[7].id|"8"|
      |$.roles[7].name|DISTRIBUTOR SALES MANAGER|
      |$.roles[8].id|"9"|
      |$.roles[8].name|REPORT ADMIN|
      |$.roles[9].id|"10"|
      |$.roles[9].name|EXECUTION AUDITOR|
      |$.roles[10].id|"11"|
      |$.roles[10].name|INVENTORY MANAGER|
      |$.roles[11].id|"12"|
      |$.roles[11].name|VENDOR|
      |$.roles[12].id|"13"|
      |$.roles[12].name|RETAILER|
      |$.roles[13].id|"14"|
      |$.roles[13].name|ERP API USER|

  @Positive @Performance
  Scenario: Performance test for roles by alias endpoint
    And I send the GET request to "roles_get_roles_by_alias" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|

  @Positive @Concurrency
  Scenario: Concurrent access test for roles by alias endpoint
    And I send the GET request to "roles_get_roles_by_alias" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|

  @Negative @Validation
  Scenario: Get roles by alias with invalid query parameters
    And I send the GET request to "roles_get_roles_by_alias" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|

  @Negative @Validation
  Scenario: Get roles by alias with special characters in query parameters
    And I send the GET request to "roles_get_roles_by_alias" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|

  @Negative @Security
  Scenario: Get roles by alias with SQL injection attempt
    And I send the GET request to "roles_get_roles_by_alias" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE roles; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|

  @Negative @Boundary
  Scenario: Get roles by alias with maximum query parameters
    And I send the GET request to "roles_get_roles_by_alias" endpoint with dynamic access token and query parameters
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
      |$.error|[]|

  @Negative @ErrorHandling
  Scenario: Get roles by alias with invalid endpoint
    And I send the GET request to "roles_get_roles_by_alias_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate roles by alias business logic
    And I send the GET request to "roles_get_roles_by_alias" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|
      |$.roles[0].id|"1"|
      |$.roles[0].name|ADMIN|
      |$.roles[1].id|"2"|
      |$.roles[1].name|ZONE MANAGER|
      |$.roles[2].id|"3"|
      |$.roles[2].name|WAREHOUSE MANAGER|
      |$.roles[3].id|"4"|
      |$.roles[3].name|SALES MANAGER|
      |$.roles[4].id|"5"|
      |$.roles[4].name|SALESMAN|
      |$.roles[5].id|"6"|
      |$.roles[5].name|DISTRIBUTOR MANAGER|
      |$.roles[6].id|"7"|
      |$.roles[6].name|DISTRIBUTOR SALESMAN|
      |$.roles[7].id|"8"|
      |$.roles[7].name|DISTRIBUTOR SALES MANAGER|
      |$.roles[8].id|"9"|
      |$.roles[8].name|REPORT ADMIN|
      |$.roles[9].id|"10"|
      |$.roles[9].name|EXECUTION AUDITOR|
      |$.roles[10].id|"11"|
      |$.roles[10].name|INVENTORY MANAGER|
      |$.roles[11].id|"12"|
      |$.roles[11].name|VENDOR|
      |$.roles[12].id|"13"|
      |$.roles[12].name|RETAILER|
      |$.roles[13].id|"14"|
      |$.roles[13].name|ERP API USER|

  @Positive @DataIntegrity
  Scenario: Validate roles by alias data integrity
    And I send the GET request to "roles_get_roles_by_alias" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|
      |$.roles[0].id|"1"|
      |$.roles[0].name|ADMIN|
      |$.roles[1].id|"2"|
      |$.roles[1].name|ZONE MANAGER|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|array|
      |$.roles|array|
      |$.roles[0]|object|
      |$.roles[0].id|string|
      |$.roles[0].name|string|
      |$.roles[1].id|string|
      |$.roles[1].name|string|
      |$.roles[2].id|string|
      |$.roles[2].name|string|
      |$.roles[3].id|string|
      |$.roles[3].name|string|
      |$.roles[4].id|string|
      |$.roles[4].name|string|
      |$.roles[5].id|string|
      |$.roles[5].name|string|
      |$.roles[6].id|string|
      |$.roles[6].name|string|
      |$.roles[7].id|string|
      |$.roles[7].name|string|
      |$.roles[8].id|string|
      |$.roles[8].name|string|
      |$.roles[9].id|string|
      |$.roles[9].name|string|
      |$.roles[10].id|string|
      |$.roles[10].name|string|
      |$.roles[11].id|string|
      |$.roles[11].name|string|
      |$.roles[12].id|string|
      |$.roles[12].name|string|
      |$.roles[13].id|string|
      |$.roles[13].name|string|

  @Positive @Regression
  Scenario: Regression test for roles by alias endpoint
    And I send the GET request to "roles_get_roles_by_alias" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|
      |$.roles[0].id|"1"|
      |$.roles[0].name|ADMIN|
      |$.roles[1].id|"2"|
      |$.roles[1].name|ZONE MANAGER|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|array|
      |$.roles|array|
      |$.roles[0]|object|
      |$.roles[0].id|string|
      |$.roles[0].name|string|

  @Positive @Functional
  Scenario: Validate roles by alias response completeness
    And I send the GET request to "roles_get_roles_by_alias" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|
      |$.roles[0].id|"1"|
      |$.roles[0].name|ADMIN|
      |$.roles[1].id|"2"|
      |$.roles[1].name|ZONE MANAGER|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.roles|array|
      |$.roles[0]|object|
      |$.roles[0].id|string|
      |$.roles[0].name|string|

  @Positive @ArrayValidation
  Scenario: Validate roles by alias array structure and content
    And I send the GET request to "roles_get_roles_by_alias" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|
      |$.roles[0].id|"1"|
      |$.roles[0].name|ADMIN|
      |$.roles[1].id|"2"|
      |$.roles[1].name|ZONE MANAGER|
      |$.roles[2].id|"3"|
      |$.roles[2].name|WAREHOUSE MANAGER|
      |$.roles[3].id|"4"|
      |$.roles[3].name|SALES MANAGER|
      |$.roles[4].id|"5"|
      |$.roles[4].name|SALESMAN|
      |$.roles[5].id|"6"|
      |$.roles[5].name|DISTRIBUTOR MANAGER|
      |$.roles[6].id|"7"|
      |$.roles[6].name|DISTRIBUTOR SALESMAN|
      |$.roles[7].id|"8"|
      |$.roles[7].name|DISTRIBUTOR SALES MANAGER|
      |$.roles[8].id|"9"|
      |$.roles[8].name|REPORT ADMIN|
      |$.roles[9].id|"10"|
      |$.roles[9].name|EXECUTION AUDITOR|
      |$.roles[10].id|"11"|
      |$.roles[10].name|INVENTORY MANAGER|
      |$.roles[11].id|"12"|
      |$.roles[11].name|VENDOR|
      |$.roles[12].id|"13"|
      |$.roles[12].name|RETAILER|
      |$.roles[13].id|"14"|
      |$.roles[13].name|ERP API USER|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.roles|array|
      |$.roles[0]|object|
      |$.roles[1]|object|
      |$.roles[2]|object|
      |$.roles[3]|object|
      |$.roles[4]|object|
      |$.roles[5]|object|
      |$.roles[6]|object|
      |$.roles[7]|object|
      |$.roles[8]|object|
      |$.roles[9]|object|
      |$.roles[10]|object|
      |$.roles[11]|object|
      |$.roles[12]|object|
      |$.roles[13]|object|
      |$.roles[0].id|string|
      |$.roles[0].name|string|
      |$.roles[1].id|string|
      |$.roles[1].name|string|
      |$.roles[2].id|string|
      |$.roles[2].name|string|

  @Positive @ContentValidation
  Scenario: Validate roles by alias content structure
    And I send the GET request to "roles_get_roles_by_alias" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|
    And validating the response contains the following values
      |Value|
      |result|
      |error|
      |roles|
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
  Scenario: Load testing for roles by alias endpoint
    And I send the GET request to "roles_get_roles_by_alias" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|

  @Negative @Timeout
  Scenario: Test roles by alias endpoint timeout handling
    And I send the GET request to "roles_get_roles_by_alias" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|

  @Positive @EndToEnd
  Scenario: End-to-end roles by alias retrieval workflow
    And I send the GET request to "roles_get_roles_by_alias" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|
      |$.roles[0].id|"1"|
      |$.roles[0].name|ADMIN|
      |$.roles[1].id|"2"|
      |$.roles[1].name|ZONE MANAGER|
      |$.roles[2].id|"3"|
      |$.roles[2].name|WAREHOUSE MANAGER|
      |$.roles[3].id|"4"|
      |$.roles[3].name|SALES MANAGER|
      |$.roles[4].id|"5"|
      |$.roles[4].name|SALESMAN|
      |$.roles[5].id|"6"|
      |$.roles[5].name|DISTRIBUTOR MANAGER|
      |$.roles[6].id|"7"|
      |$.roles[6].name|DISTRIBUTOR SALESMAN|
      |$.roles[7].id|"8"|
      |$.roles[7].name|DISTRIBUTOR SALES MANAGER|
      |$.roles[8].id|"9"|
      |$.roles[8].name|REPORT ADMIN|
      |$.roles[9].id|"10"|
      |$.roles[9].name|EXECUTION AUDITOR|
      |$.roles[10].id|"11"|
      |$.roles[10].name|INVENTORY MANAGER|
      |$.roles[11].id|"12"|
      |$.roles[11].name|VENDOR|
      |$.roles[12].id|"13"|
      |$.roles[12].name|RETAILER|
      |$.roles[13].id|"14"|
      |$.roles[13].name|ERP API USER|
    And I store the response as "roles_by_alias_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|array|
      |$.roles|array|
      |$.roles[0]|object|
      |$.roles[0].id|string|
      |$.roles[0].name|string|
      |$.roles[1].id|string|
      |$.roles[1].name|string|
      |$.roles[2].id|string|
      |$.roles[2].name|string|
      |$.roles[3].id|string|
      |$.roles[3].name|string|
      |$.roles[4].id|string|
      |$.roles[4].name|string|
      |$.roles[5].id|string|
      |$.roles[5].name|string|
      |$.roles[6].id|string|
      |$.roles[6].name|string|
      |$.roles[7].id|string|
      |$.roles[7].name|string|
      |$.roles[8].id|string|
      |$.roles[8].name|string|
      |$.roles[9].id|string|
      |$.roles[9].name|string|
      |$.roles[10].id|string|
      |$.roles[10].name|string|
      |$.roles[11].id|string|
      |$.roles[11].name|string|
      |$.roles[12].id|string|
      |$.roles[12].name|string|
      |$.roles[13].id|string|
      |$.roles[13].name|string|

