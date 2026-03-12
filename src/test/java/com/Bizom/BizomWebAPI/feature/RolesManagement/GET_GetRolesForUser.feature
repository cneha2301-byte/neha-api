@BizomWebAPI @RolesManagement @RolesForUsers @OrderManagement @CE
Feature: Get Roles For User API Testing
  As a system user
  I want to test the get roles for user endpoint
  So that I can ensure proper functionality and data retrieval for user roles management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get roles for user without access token
    When I send the GET request to "roles_get_roles_for_user" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get roles for user with invalid access token
    And I send the GET request to "roles_get_roles_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get roles for user with expired access token
    And I send the GET request to "roles_get_roles_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get roles for user with malformed access token
    And I send the GET request to "roles_get_roles_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get roles for user with valid access token
    And I send the GET request to "roles_get_roles_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And I store the response as "roles_for_user_response" name using full path

  @Positive @DataValidation
  Scenario: Validate roles for user response structure
    And I send the GET request to "roles_get_roles_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Roles|object|

  @Positive @DataValidation
  Scenario: Validate roles for user specific data values
    And I send the GET request to "roles_get_roles_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Roles.2|DB:roles:name: id=2|
      |$.Roles.3|DB:roles:name: id=3|
      |$.Roles.4|DB:roles:name: id=4|

  @Positive @DataValidation
  Scenario: Validate roles for user with static values
    And I send the GET request to "roles_get_roles_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Roles.2|ZONE MANAGER|
      |$.Roles.3|WAREHOUSE MANAGER|
      |$.Roles.4|SALES MANAGER|
      |$.Roles.5|SALESMAN|
      |$.Roles.6|DISTRIBUTOR MANAGER|
      |$.Roles.7|DISTRIBUTOR SALESMAN|
      |$.Roles.8|DISTRIBUTOR SALES MANAGER|

  @Positive @Performance
  Scenario: Performance test for roles for user endpoint
    And I send the GET request to "roles_get_roles_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @Concurrency
  Scenario: Concurrent access test for roles for user endpoint
    And I send the GET request to "roles_get_roles_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true| 

  @Negative @Validation
  Scenario: Get roles for user with invalid query parameters
    And I send the GET request to "roles_get_roles_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: Get roles for user with special characters in query parameters
    And I send the GET request to "roles_get_roles_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Security
  Scenario: Get roles for user with SQL injection attempt
    And I send the GET request to "roles_get_roles_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE roles; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Boundary
  Scenario: Get roles for user with maximum query parameters
    And I send the GET request to "roles_get_roles_for_user" endpoint with dynamic access token and query parameters
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
      |$.Result|true|

  @Negative @ErrorHandling
  Scenario: Get roles for user with invalid endpoint
    And I send the GET request to "roles_get_roles_for_user_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate roles for user business logic
    And I send the GET request to "roles_get_roles_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @DataIntegrity
  Scenario: Validate roles for user data integrity
    And I send the GET request to "roles_get_roles_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Roles|object|
      |$.Roles.2|string|
      |$.Roles.3|string|
      |$.Roles.4|string|
      |$.Roles.5|string|
      |$.Roles.6|string|
      |$.Roles.7|string|
      |$.Roles.8|string|

  @Positive @Regression
  Scenario: Regression test for roles for user endpoint
    And I send the GET request to "roles_get_roles_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Roles|object|

  @Positive @Functional
  Scenario: Validate roles for user response completeness
    And I send the GET request to "roles_get_roles_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Roles|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Roles.2|ZONE MANAGER|
      |$.Roles.3|WAREHOUSE MANAGER|
      |$.Roles.4|SALES MANAGER|
      |$.Roles.5|SALESMAN|
      |$.Roles.6|DISTRIBUTOR MANAGER|
      |$.Roles.7|DISTRIBUTOR SALESMAN|
      |$.Roles.8|DISTRIBUTOR SALES MANAGER|

  @Positive @ObjectValidation
  Scenario: Validate roles for user object structure and content
    And I send the GET request to "roles_get_roles_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Roles|object|
      |$.Roles.2|string|
      |$.Roles.3|string|
      |$.Roles.4|string|
      |$.Roles.5|string|
      |$.Roles.6|string|
      |$.Roles.7|string|
      |$.Roles.8|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Roles.2|ZONE MANAGER|
      |$.Roles.3|WAREHOUSE MANAGER|
      |$.Roles.4|SALES MANAGER|
      |$.Roles.5|SALESMAN|
      |$.Roles.6|DISTRIBUTOR MANAGER|
      |$.Roles.7|DISTRIBUTOR SALESMAN|
      |$.Roles.8|DISTRIBUTOR SALES MANAGER|

  @Positive @ContentValidation
  Scenario: Validate roles for user content structure
    And I send the GET request to "roles_get_roles_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Roles|
      |ZONE MANAGER|
      |WAREHOUSE MANAGER|
      |SALES MANAGER|
      |SALESMAN|
      |DISTRIBUTOR MANAGER|
      |DISTRIBUTOR SALESMAN|
      |DISTRIBUTOR SALES MANAGER|

  @Positive @LoadTesting
  Scenario: Load testing for roles for user endpoint
    And I send the GET request to "roles_get_roles_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Timeout
  Scenario: Test roles for user endpoint timeout handling
    And I send the GET request to "roles_get_roles_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @EndToEnd
  Scenario: End-to-end roles for user retrieval workflow
    And I send the GET request to "roles_get_roles_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And I store the response as "roles_for_user_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Roles|object|
      |$.Roles.2|string|
      |$.Roles.3|string|
      |$.Roles.4|string|
      |$.Roles.5|string|
      |$.Roles.6|string|
      |$.Roles.7|string|
      |$.Roles.8|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Roles.2|ZONE MANAGER|
      |$.Roles.3|WAREHOUSE MANAGER|
      |$.Roles.4|SALES MANAGER|
      |$.Roles.5|SALESMAN|
      |$.Roles.6|DISTRIBUTOR MANAGER|
      |$.Roles.7|DISTRIBUTOR SALESMAN|
      |$.Roles.8|DISTRIBUTOR SALES MANAGER|

