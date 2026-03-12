@BizomWebAPI @RolesManagement @GETRoles @OrderManagement @CE
Feature: Get Roles List API Testing
  As a system user
  I want to test the get roles list endpoint
  So that I can ensure proper functionality and data retrieval for roles list management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get roles list without access token
    When I send the GET request to "roles_get_list" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get roles list with invalid access token
    And I send the GET request to "roles_get_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get roles list with expired access token
    And I send the GET request to "roles_get_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get roles list with malformed access token
    And I send the GET request to "roles_get_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get roles list with valid access token
    And I send the GET request to "roles_get_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.1|ADMIN|
      |$.2|ZONE MANAGER|
      |$.3|WAREHOUSE MANAGER|
      |$.4|SALES MANAGER|
      |$.5|SALESMAN|
      |$.6|DISTRIBUTOR MANAGER|
     |$.7|DISTRIBUTOR SALESMAN|
     |$.8|DISTRIBUTOR SALES MANAGER|
     |$.9|REPORT ADMIN|
     |$.10|EXECUTION AUDITOR|
     |$.11|INVENTORY MANAGER|
     |$.12|VENDOR|
     |$.13|RETAILER|
     |$.14|ERP API USER|
    And I store the response as "roles_list_response" name using full path

  @Positive @DataValidation
  Scenario: Validate roles list response structure
    And I send the GET request to "roles_get_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.1|ADMIN|
      |$.2|ZONE MANAGER|
      |$.3|WAREHOUSE MANAGER|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.1|string|
      |$.2|string|
      |$.3|string|
      |$.4|string|
      |$.5|string|
      |$.6|string|
      |$.7|string|
      |$.8|string|
      |$.9|string|
      |$.10|string|
      |$.11|string|
      |$.12|string|
      |$.13|string|
      |$.14|string|

  @Positive @DataValidation
  Scenario: Validate roles list specific data values
    And I send the GET request to "roles_get_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.1|ADMIN|
      |$.2|ZONE MANAGER|
      |$.3|WAREHOUSE MANAGER|
      |$.4|SALES MANAGER|
      |$.5|SALESMAN|
      |$.6|DISTRIBUTOR MANAGER|
      |$.7|DISTRIBUTOR SALESMAN|
      |$.8|DISTRIBUTOR SALES MANAGER|
      |$.9|REPORT ADMIN|
      |$.10|EXECUTION AUDITOR|
      |$.11|INVENTORY MANAGER|
      |$.12|VENDOR|
      |$.13|RETAILER|
      |$.14|ERP API USER|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.1|DB:roles:name: id=1|
      |$.2|DB:roles:name: id=2|
      |$.3|DB:roles:name: id=3|
      |$.4|DB:roles:name: id=4|
      |$.5|DB:roles:name: id=5|
      |$.6|DB:roles:name: id=6|
      |$.7|DB:roles:name: id=7|
      |$.8|DB:roles:name: id=8|
      |$.9|DB:roles:name: id=9|
      |$.10|DB:roles:name: id=10|
      |$.11|DB:roles:name: id=11|
      |$.12|DB:roles:name: id=12|
      |$.13|DB:roles:name: id=13|
      |$.14|DB:roles:name: id=14|

  @Positive @DataValidation
  Scenario: Validate roles list with static values
    And I send the GET request to "roles_get_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
        |$.1|ADMIN|
      |$.2|ZONE MANAGER|
      |$.3|WAREHOUSE MANAGER|
      |$.4|SALES MANAGER|
      |$.5|SALESMAN|
      |$.6|DISTRIBUTOR MANAGER|
      |$.7|DISTRIBUTOR SALESMAN|
      |$.8|DISTRIBUTOR SALES MANAGER|
      |$.9|REPORT ADMIN|
      |$.10|EXECUTION AUDITOR|
      |$.11|INVENTORY MANAGER|
      |$.12|VENDOR|
      |$.13|RETAILER|
      |$.14|ERP API USER|

  @Positive @Performance
  Scenario: Performance test for roles list endpoint
    And I send the GET request to "roles_get_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.1|ADMIN|
      |$.2|ZONE MANAGER|

  @Positive @Concurrency
  Scenario: Concurrent access test for roles list endpoint
    And I send the GET request to "roles_get_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.1|ADMIN|
      |$.2|ZONE MANAGER|

  @Negative @Validation
  Scenario: Get roles list with invalid query parameters
    And I send the GET request to "roles_get_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.1|ADMIN|
      |$.2|ZONE MANAGER|

  @Negative @Validation
  Scenario: Get roles list with special characters in query parameters
    And I send the GET request to "roles_get_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.1|ADMIN|
      |$.2|ZONE MANAGER|

  @Negative @Security
  Scenario: Get roles list with SQL injection attempt
    And I send the GET request to "roles_get_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE roles; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.1|ADMIN|
      |$.2|ZONE MANAGER|

  @Negative @Boundary
  Scenario: Get roles list with maximum query parameters
    And I send the GET request to "roles_get_list" endpoint with dynamic access token and query parameters
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
      |$.1|ADMIN|
      |$.2|ZONE MANAGER|

  @Negative @ErrorHandling
  Scenario: Get roles list with invalid endpoint
    And I send the GET request to "roles_get_list_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate roles list business logic
    And I send the GET request to "roles_get_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.1|ADMIN|
      |$.2|ZONE MANAGER|
      |$.3|WAREHOUSE MANAGER|
      |$.4|SALES MANAGER|
      |$.5|SALESMAN|
      |$.6|DISTRIBUTOR MANAGER|
      |$.7|DISTRIBUTOR SALESMAN|
      |$.8|DISTRIBUTOR SALES MANAGER|
      |$.9|REPORT ADMIN|
      |$.10|EXECUTION AUDITOR|
      |$.11|INVENTORY MANAGER|
      |$.12|VENDOR|
      |$.13|RETAILER|
      |$.14|ERP API USER|

  @Positive @DataIntegrity
  Scenario: Validate roles list data integrity
    And I send the GET request to "roles_get_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.1|ADMIN| 
      |$.2|ZONE MANAGER|
      |$.3|WAREHOUSE MANAGER|
      |$.4|SALES MANAGER|
      |$.5|SALESMAN|
      |$.6|DISTRIBUTOR MANAGER|
      |$.7|DISTRIBUTOR SALESMAN|
      |$.8|DISTRIBUTOR SALES MANAGER|
      |$.9|REPORT ADMIN|
      |$.10|EXECUTION AUDITOR|
      |$.11|INVENTORY MANAGER|
      |$.12|VENDOR|
      |$.13|RETAILER|
      |$.14|ERP API USER|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.1|string|  
      |$.2|string|
      |$.3|string|
      |$.4|string|
      |$.5|string|
      |$.6|string|
      |$.7|string|  
      |$.8|string|
      |$.9|string|
      |$.10|string|
      |$.11|string|
      |$.12|string|
      |$.13|string|
      |$.14|string|

  @Positive @Regression
  Scenario: Regression test for roles list endpoint
    And I send the GET request to "roles_get_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.1|ADMIN|
      |$.2|ZONE MANAGER|
      |$.3|WAREHOUSE MANAGER|
      |$.4|SALES MANAGER|
      |$.5|SALESMAN|
      |$.6|DISTRIBUTOR MANAGER|
      |$.7|DISTRIBUTOR SALESMAN|
      |$.8|DISTRIBUTOR SALES MANAGER|
      |$.9|REPORT ADMIN|
      |$.10|EXECUTION AUDITOR|
      |$.11|INVENTORY MANAGER|
      |$.12|VENDOR|
      |$.13|RETAILER|
      |$.14|ERP API USER|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.1|string|
      |$.2|string|
      |$.3|string|
      |$.4|string|
      |$.5|string|
      |$.6|string|
      |$.7|string|
      |$.8|string|
      |$.9|string|
      |$.10|string|
      |$.11|string|
      |$.12|string|
      |$.13|string|
      |$.14|string|

  @Positive @Functional
  Scenario: Validate roles list response completeness
    And I send the GET request to "roles_get_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.1|ADMIN| 
      |$.2|ZONE MANAGER|
      |$.3|WAREHOUSE MANAGER|
      |$.4|SALES MANAGER|
      |$.5|SALESMAN|
      |$.6|DISTRIBUTOR MANAGER|
      |$.7|DISTRIBUTOR SALESMAN|
      |$.8|DISTRIBUTOR SALES MANAGER|
      |$.9|REPORT ADMIN|
      |$.10|EXECUTION AUDITOR|
      |$.11|INVENTORY MANAGER|
      |$.12|VENDOR|
      |$.13|RETAILER|
      |$.14|ERP API USER|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.1|string|
      |$.2|string|
      |$.3|string|
      |$.4|string|
      |$.5|string|
      |$.6|string|
      |$.7|string|
      |$.8|string|
      |$.9|string|
      |$.10|string|
      |$.11|string|
      |$.12|string|
      |$.13|string|
      |$.14|string|

  @Positive @ObjectValidation
  Scenario: Validate roles list object structure and content
    And I send the GET request to "roles_get_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.1|ADMIN|
      |$.2|ZONE MANAGER|
      |$.3|WAREHOUSE MANAGER|
      |$.4|SALES MANAGER|
      |$.5|SALESMAN|
      |$.6|DISTRIBUTOR MANAGER|
      |$.7|DISTRIBUTOR SALESMAN|
      |$.8|DISTRIBUTOR SALES MANAGER|
      |$.9|REPORT ADMIN|
      |$.10|EXECUTION AUDITOR|
      |$.11|INVENTORY MANAGER|
      |$.12|VENDOR|
      |$.13|RETAILER|
      |$.14|ERP API USER|

  @Positive @ContentValidation
  Scenario: Validate roles list content structure
    And I send the GET request to "roles_get_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.1|ADMIN|
      |$.2|ZONE MANAGER|
    And validating the response contains the following values
      |Value|
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
  Scenario: Load testing for roles list endpoint
    And I send the GET request to "roles_get_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.1|ADMIN|
      |$.2|ZONE MANAGER|

  @Negative @Timeout
  Scenario: Test roles list endpoint timeout handling
    And I send the GET request to "roles_get_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.1|ADMIN|
      |$.2|ZONE MANAGER|

  @Positive @EndToEnd
  Scenario: End-to-end roles list retrieval workflow
    And I send the GET request to "roles_get_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.1|ADMIN|
      |$.2|ZONE MANAGER|
      |$.3|WAREHOUSE MANAGER|
      |$.4|SALES MANAGER|
      |$.5|SALESMAN|
      |$.6|DISTRIBUTOR MANAGER|
      |$.7|DISTRIBUTOR SALESMAN|
      |$.8|DISTRIBUTOR SALES MANAGER|
      |$.9|REPORT ADMIN|
      |$.10|EXECUTION AUDITOR|
      |$.11|INVENTORY MANAGER|
      |$.12|VENDOR|
      |$.13|RETAILER|
      |$.14|ERP API USER|
    And I store the response as "roles_list_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.1|string|
      |$.2|string|
      |$.3|string|
      |$.4|string|
      |$.5|string|
      |$.6|string|
      |$.7|string|
      |$.8|string|
      |$.9|string|
      |$.10|string|
      |$.11|string|
      |$.12|string|
      |$.13|string|
      |$.14|string|

