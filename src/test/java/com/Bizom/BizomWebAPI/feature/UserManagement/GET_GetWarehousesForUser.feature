@BizomWebAPI @CE @WarehousesForUser @ReportingOperations
Feature: Get Warehouses for User API Testing
  As a system user
  I want to test the getWarehousesForUser endpoint
  So that I can ensure proper functionality and data retrieval for warehouses associated with the current user

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get warehouses for user without access token
    When I send the GET request to "get_warehouses_for_user" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get warehouses for user with invalid access token
    And I send the GET request to "get_warehouses_for_user" endpoint with dynamic access token and query parameters
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
  Scenario: Get warehouses for user with expired access token
    And I send the GET request to "get_warehouses_for_user" endpoint with dynamic access token and query parameters
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
  Scenario: Get warehouses for user with malformed access token
    And I send the GET request to "get_warehouses_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

#  @Positive @Smoke
#  Scenario: Get warehouses for user with valid access token
#    And I send the GET request to "get_warehouses_for_user" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.data|object|
#    And I store the response as "warehouses_for_user_response" name using full path

  @Positive @DataValidation
  Scenario: Validate warehouses for user response structure
    And I send the GET request to "get_warehouses_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.data|object|

  @Positive @DataValidation
  Scenario: Validate warehouses for user data object structure
    And I send the GET request to "get_warehouses_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.data|object|
      |$.data."1"|string|
      |$.data."5"|string|
      |$.data."6"|string|

#  @Positive @DataValidation
#  Scenario: Validate warehouses for user with static values
#    And I send the GET request to "get_warehouses_for_user" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.data."1"|"SLV Traders"|
#      |$.data."5"|"North Warehouse"|
#      |$.data."6"|"MDM"|
#      |$.data."13"|"w1"|
#      |$.data."14"|"W3"|
#      |$.data."15"|"W2"|

#  @Positive @Performance
#  Scenario: Performance test for warehouses for user endpoint
#    And I send the GET request to "get_warehouses_for_user" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.data|object|

#  @Positive @Concurrency
#  Scenario: Concurrent access test for warehouses for user endpoint
#    And I send the GET request to "get_warehouses_for_user" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.data|object|

#  @Negative @Validation
#  Scenario: Get warehouses for user with invalid query parameters
#    And I send the GET request to "get_warehouses_for_user" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |invalid_param|invalid_value|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.data|object|

#  @Negative @Validation
#  Scenario: Get warehouses for user with special characters in query parameters
#    And I send the GET request to "get_warehouses_for_user" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.data|object|

#  @Negative @Security
#  Scenario: Get warehouses for user with SQL injection attempt
#    And I send the GET request to "get_warehouses_for_user" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|'; DROP TABLE users; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.data|object|

#  @Negative @Boundary
#  Scenario: Get warehouses for user with maximum query parameters
#    And I send the GET request to "get_warehouses_for_user" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |param1|value1|
#      |param2|value2|
#      |param3|value3|
#      |param4|value4|
#      |param5|value5|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.data|object|

#  @Negative @ErrorHandling
#  Scenario: Get warehouses for user with invalid endpoint
#    And I send the GET request to "get_warehouses_for_user_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

#  @Positive @BusinessLogic
#  Scenario: Validate warehouses for user business logic
#    And I send the GET request to "get_warehouses_for_user" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.data|object|
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.data."1"|DB:warehouses:name: id=1|
#      |$.data."5"|DB:warehouses:name: id=5|
#      |$.data."6"|DB:warehouses:name: id=6|

#  @Positive @DataIntegrity
#  Scenario: Validate warehouses for user data integrity
#    And I send the GET request to "get_warehouses_for_user" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.data|object|
#      |$.data."1"|string|
#      |$.data."5"|string|
#      |$.data."6"|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.data."1"|"SLV Traders"|
#      |$.data."5"|"North Warehouse"|
#      |$.data."6"|"MDM"|

#  @Positive @Regression
#  Scenario: Regression test for warehouses for user endpoint
#    And I send the GET request to "get_warehouses_for_user" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.data|object|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.data|object|

#  @Positive @Functional
#  Scenario: Validate warehouses for user response completeness
#    And I send the GET request to "get_warehouses_for_user" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.data|object|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.data."1"|"SLV Traders"|
#      |$.data."5"|"North Warehouse"|
#      |$.data."6"|"MDM"|
#      |$.data."13"|"w1"|
#      |$.data."14"|"W3"|
#      |$.data."15"|"W2"|

#  @Positive @ObjectValidation
#  Scenario: Validate warehouses for user object structure and content
#    And I send the GET request to "get_warehouses_for_user" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.data|object|
#      |$.data."1"|string|
#      |$.data."5"|string|
#      |$.data."6"|string|
#      |$.data."13"|string|
#      |$.data."14"|string|
#      |$.data."15"|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.data."1"|"SLV Traders"|
#      |$.data."5"|"North Warehouse"|
#      |$.data."6"|"MDM"|

#  @Positive @ContentValidation
#  Scenario: Validate warehouses for user content structure
#    And I send the GET request to "get_warehouses_for_user" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.data|object|
#    And validating the response contains the following values
#      |Value|
#      |Result|
#      |data|
#      |SLV Traders|
#      |North Warehouse|
#      |MDM|
#      |w1|
#      |W3|
#      |W2|

#  @Positive @LoadTesting
#  Scenario: Load testing for warehouses for user endpoint
#    And I send the GET request to "get_warehouses_for_user" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "3000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.data|object|

#  @Negative @Timeout
#  Scenario: Test warehouses for user endpoint timeout handling
#    And I send the GET request to "get_warehouses_for_user" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "5000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.data|object|

#  @Positive @EndToEnd
#  Scenario: End-to-end warehouses for user data retrieval workflow
#    And I send the GET request to "get_warehouses_for_user" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.data|object|
#    And I store the response as "warehouses_for_user_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.data|object|
#      |$.data."1"|string|
#      |$.data."5"|string|
#      |$.data."6"|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.data."1"|"SLV Traders"|
#      |$.data."5"|"North Warehouse"|
#      |$.data."6"|"MDM"|
#      |$.data."13"|"w1"|
#      |$.data."14"|"W3"|
#      |$.data."15"|"W2"|

#  @Positive @HeaderValidation
#  Scenario: Validate warehouses for user response headers
#    And I send the GET request to "get_warehouses_for_user" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Content-Type|text/html; charset=UTF-8|
#      |Server|Bizom|
#      |Connection|keep-alive|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.data|object|

#  @Positive @SessionValidation
#  Scenario: Validate warehouses for user with session handling
#    And I send the GET request to "get_warehouses_for_user" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.data|object|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.data|object|

#  @Positive @WarehouseDataValidation
#  Scenario: Validate warehouses for user warehouse data mapping
#    And I send the GET request to "get_warehouses_for_user" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.data."1"|"SLV Traders"|
#      |$.data."5"|"North Warehouse"|
#      |$.data."6"|"MDM"|
#      |$.data."13"|"w1"|
#      |$.data."14"|"W3"|
#      |$.data."15"|"W2"|
#      |$.data."16"|"w5"|
#      |$.data."17"|"w6"|
#      |$.data."18"|"w7"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.data."1"|string|
#      |$.data."5"|string|
#      |$.data."6"|string|
#      |$.data."13"|string|
#      |$.data."14"|string|
#      |$.data."15"|string|

#  @Positive @UserSpecificValidation
#  Scenario: Validate warehouses for user user-specific data
#    And I send the GET request to "get_warehouses_for_user" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.data|object|
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.data."1"|DB:warehouses:name: id=1 AND user_id=CURRENT_USER|
#      |$.data."5"|DB:warehouses:name: id=5 AND user_id=CURRENT_USER|
#      |$.data."6"|DB:warehouses:name: id=6 AND user_id=CURRENT_USER|

#  @Positive @WarehouseMappingValidation
#  Scenario: Validate warehouses for user warehouse mapping structure
#    And I send the GET request to "get_warehouses_for_user" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.data."1"|"SLV Traders"|
#      |$.data."5"|"North Warehouse"|
#      |$.data."6"|"MDM"|
#      |$.data."13"|"w1"|
#      |$.data."14"|"W3"|
#      |$.data."15"|"W2"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.data|object|
#      |$.data."1"|string|
#      |$.data."5"|string|
#      |$.data."6"|string|
#    And validating the response contains the following values
#      |Value|
#      |Result|
#      |data|
#      |SLV Traders|
#      |North Warehouse|
#      |MDM|
#      |w1|
#      |W3|
#      |W2|
#      |1|
#      |5|
#      |6|
