@BizomWebAPI @CE @UsersForDistributorByRoles @ReportingOperations
Feature: Users for Distributor by Roles API Testing
  As a system user
  I want to test the getUsersForDistributorByRoles endpoint
  So that I can ensure proper functionality and data retrieval for users with specific distributor roles

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get users for distributor by roles without access token
    When I send the GET request to "get_users_for_distributor_by_roles" endpoint with path parameters
      |Path|Value|
      |warehouseId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get users for distributor by roles with invalid access token
    And I send the GET request to "get_users_for_distributor_by_roles" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|warehouseId|2|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get users for distributor by roles with expired access token
    And I send the GET request to "get_users_for_distributor_by_roles" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|warehouseId|2|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get users for distributor by roles with malformed access token
    And I send the GET request to "get_users_for_distributor_by_roles" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|warehouseId|2|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

#  @Positive @Smoke
#  Scenario: Get users for distributor by roles warehouse ID 2 with valid access token
#    And I send the GET request to "get_users_for_distributor_by_roles" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|"Users found."|
#      |$.data|{"5":"Sadha"}|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.reason|string|
#      |$.data|object|
#      |$.data['5']|string|

  @Positive @Functional
  Scenario: Get users for distributor by roles warehouse ID 2 with valid access token - detailed validation
    And I send the GET request to "get_users_for_distributor_by_roles" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|"Users found."|
      |$.data['5']|"Sadha"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|object|
      |$.data['5']|string|

  @Positive @Functional
  Scenario: Get users for distributor by roles warehouse ID 1 with valid access token - multiple users
    And I send the GET request to "get_users_for_distributor_by_roles" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|"Users found."|
      |$.data['3']|"Covid MGR"|
      |$.data['11']|"southsalesmgr"|
      |$.data['33']|"mobisy"|
      |$.data['40']|"mobisy"|
      |$.data['36']|"mobisy"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|object|
      |$.data['3']|string|
      |$.data['11']|string|
      |$.data['33']|string|
      |$.data['40']|string|
      |$.data['36']|string|

  @Negative @Validation
  Scenario: Get users for distributor by roles warehouse ID 10551 with valid access token - no users found
    And I send the GET request to "get_users_for_distributor_by_roles" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|10551|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|"No users found for this distributor."|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|

  @Negative @Validation
  Scenario: Get users for distributor by roles warehouse ID 99999 with valid access token - no users found
    And I send the GET request to "get_users_for_distributor_by_roles" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|99999|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|"No users found for this distributor."|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|

  @Negative @Validation
  Scenario: Get users for distributor by roles with invalid warehouse ID
    And I send the GET request to "get_users_for_distributor_by_roles" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|"Users found."|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|

  @Negative @Validation
  Scenario: Get users for distributor by roles with empty warehouse ID
    And I send the GET request to "get_users_for_distributor_by_roles" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId||
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|"Warehouse ID is compulsory."|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|

#  @Negative @Validation
#  Scenario: Get users for distributor by roles with special characters in warehouse ID
#    And I send the GET request to "get_users_for_distributor_by_roles" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
  

#  @Negative @Security
#  Scenario: Get users for distributor by roles with SQL injection attempt
#    And I send the GET request to "get_users_for_distributor_by_roles" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|'; DROP TABLE users; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
   

  @Negative @ErrorHandling
  Scenario: Get users for distributor by roles with invalid endpoint
    And I send the GET request to "get_users_for_distributor_by_roles_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "404"
    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance test for users for distributor by roles endpoint
    And I send the GET request to "get_users_for_distributor_by_roles" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Regression
  Scenario: Regression test for users for distributor by roles endpoint
    And I send the GET request to "get_users_for_distributor_by_roles" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: Get users for distributor by roles warehouse ID 2 with valid access token - DB validation
    And I send the GET request to "get_users_for_distributor_by_roles" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.result|true|
      |$.reason|"Users found."|
      |$.data['5']|DB:users:name: id=5|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|object|
      |$.data['5']|string|

  @Positive @Functional
  Scenario: Get users for distributor by roles warehouse ID 1 with valid access token - DB validation
    And I send the GET request to "get_users_for_distributor_by_roles" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.result|true|
      |$.reason|"Users found."|
      |$.data['3']|DB:users:name:id=3|
      |$.data['11']|DB:users:name: id=11|
      |$.data['33']|DB:users:name: id=33|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|object|
      |$.data['3']|string|
      |$.data['11']|string|
      |$.data['33']|string|

  @Positive @DataValidation
  Scenario: Validate users for distributor by roles response structure
    And I send the GET request to "get_users_for_distributor_by_roles" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|object|
      |$.data['5']|string|

  @Positive @ContentValidation
  Scenario: Validate users for distributor by roles content structure
    And I send the GET request to "get_users_for_distributor_by_roles" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|"Users found."|
    And validating the response contains the following values
      |Value|
      |result|
      |reason|
      |data|
      |Users found.|
      |Sadha|
      |5|

#  @Positive @LoadTesting
#  Scenario: Load testing for users for distributor by roles endpoint
#    And I send the GET request to "get_users_for_distributor_by_roles" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "3000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|"Users found."|
#      |$.data|{"5":"Sadha"}|

#  @Negative @Timeout
#  Scenario: Test users for distributor by roles endpoint timeout handling
#    And I send the GET request to "get_users_for_distributor_by_roles" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "5000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|"Users found."|
#      |$.data|{"5":"Sadha"}|

  @Positive @EndToEnd
  Scenario: End-to-end users for distributor by roles data retrieval workflow
    And I send the GET request to "get_users_for_distributor_by_roles" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I store the response as "users_for_distributor_by_roles_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|object|
      |$.data['5']|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|"Users found."|
      |$.data['5']|"Sadha"|

#  @Positive @HeaderValidation
#  Scenario: Validate users for distributor by roles response headers
#    And I send the GET request to "get_users_for_distributor_by_roles" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Content-Type|application/json; charset=UTF-8|
#      |Server|Bizom|
#      |Connection|keep-alive|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|"Users found."|
#      |$.data|{"5":"Sadha"}|

  @Positive @SessionValidation
  Scenario: Validate users for distributor by roles with session handling
    And I send the GET request to "get_users_for_distributor_by_roles" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|object|
      |$.data['5']|string|

#  @Positive @DistributorRoleValidation
#  Scenario: Validate users for distributor by roles distributor-specific data
#    And I send the GET request to "get_users_for_distributor_by_roles" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|"Users found."|
#      |$.data|{"5":"Sadha"}|
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.data['5']|DB:users:name: id=5|

  @Positive @ObjectValidation
  Scenario: Validate users for distributor by roles object structure and content
    And I send the GET request to "get_users_for_distributor_by_roles" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|object|
      |$.data['5']|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|"Users found."|
      |$.data['5']|"Sadha"|
