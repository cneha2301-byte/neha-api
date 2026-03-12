@BizomWebAPI @MenusManagement @GetMenuForSellingPoint @SystemIntegration @CE
Feature: Get Menu For Selling Point API Testing
  As a system user
  I want to test the get menu for selling point endpoint
  So that I can ensure proper functionality and data retrieval for menus based on selling point

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get menu for selling point without access token
    When I send the GET request to "GET_GetMenuForSellingPoint" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get menu for selling point with invalid access token
#    And I send the GET request to "GET_GetMenuForSellingPoint" endpoint with dynamic access token and query parameters
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
#  Scenario: Get menu for selling point with expired access token
#    And I send the GET request to "GET_GetMenuForSellingPoint" endpoint with dynamic access token and query parameters
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
#  Scenario: Get menu for selling point with malformed access token
#    And I send the GET request to "GET_GetMenuForSellingPoint" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|malformed.token.here|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get menu for selling point with valid access token
    And I send the GET request to "GET_GetMenuForSellingPoint" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.message|"no menu found"|
      |$.menus|[]|
    And I store the response as "getmenuforsellingpoint_response" name using full path

  @Positive @DataValidation
  Scenario: Validate get menu for selling point response structure
    And I send the GET request to "GET_GetMenuForSellingPoint" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.message|"no menu found"|
      |$.menus|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|
      |$.error.message|string|
      |$.menus|array|

  @Positive @DataValidation
  Scenario: Validate get menu for selling point specific data values
    And I send the GET request to "GET_GetMenuForSellingPoint" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.message|"no menu found"|
      |$.menus|[]|

  @Positive @DataValidation
  Scenario: Validate get menu for selling point with static values
    And I send the GET request to "GET_GetMenuForSellingPoint" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.message|"no menu found"|
      |$.menus|[]|

  @Positive @Performance
  Scenario: Performance test for get menu for selling point endpoint
    And I send the GET request to "GET_GetMenuForSellingPoint" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.message|"no menu found"|
      |$.menus|[]|

  @Positive @Concurrency
  Scenario: Concurrent access test for get menu for selling point endpoint
    And I send the GET request to "GET_GetMenuForSellingPoint" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.message|"no menu found"|
      |$.menus|[]|

  @Negative @Validation
  Scenario: Get menu for selling point with invalid query parameters
    And I send the GET request to "GET_GetMenuForSellingPoint" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.message|"no menu found"|
      |$.menus|[]|

  @Negative @Validation
  Scenario: Get menu for selling point with special characters in query parameters
    And I send the GET request to "GET_GetMenuForSellingPoint" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.message|"no menu found"|
      |$.menus|[]|

  @Negative @Security
  Scenario: Get menu for selling point with SQL injection attempt
    And I send the GET request to "GET_GetMenuForSellingPoint" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE menus; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.message|"no menu found"|
      |$.menus|[]|

  @Negative @Boundary
  Scenario: Get menu for selling point with maximum query parameters
    And I send the GET request to "GET_GetMenuForSellingPoint" endpoint with dynamic access token and query parameters
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
      |$.result|false|
      |$.error.message|"no menu found"|
      |$.menus|[]|

#  @Negative @ErrorHandling
#  Scenario: Get menu for selling point with invalid endpoint
#    And I send the GET request to "GET_GetMenuForSellingPoint_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate get menu for selling point business logic
    And I send the GET request to "GET_GetMenuForSellingPoint" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.message|"no menu found"|
      |$.menus|[]|

  @Positive @DataIntegrity
  Scenario: Validate get menu for selling point data integrity
    And I send the GET request to "GET_GetMenuForSellingPoint" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.message|"no menu found"|
      |$.menus|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|
      |$.error.message|string|
      |$.menus|array|

  @Positive @Regression
  Scenario: Regression test for get menu for selling point endpoint
    And I send the GET request to "GET_GetMenuForSellingPoint" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.message|"no menu found"|
      |$.menus|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|
      |$.error.message|string|
      |$.menus|array|

  @Positive @Functional
  Scenario: Validate get menu for selling point response completeness
    And I send the GET request to "GET_GetMenuForSellingPoint" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.message|"no menu found"|
      |$.menus|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.menus|array|
      |$.error|object|
      |$.error.message|string|

  @Positive @ArrayValidation
  Scenario: Validate get menu for selling point array structure and content
    And I send the GET request to "GET_GetMenuForSellingPoint" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.message|"no menu found"|
      |$.menus|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.menus|array|
      |$.error|object|
      |$.error.message|string|

  @Positive @ContentValidation
  Scenario: Validate get menu for selling point content structure
    And I send the GET request to "GET_GetMenuForSellingPoint" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.message|"no menu found"|
      |$.menus|[]|
    And validating the response contains the following values
      |Value|
      |result|
      |error|
      |menus|
      |message|

  @Positive @LoadTesting
  Scenario: Load testing for get menu for selling point endpoint
    And I send the GET request to "GET_GetMenuForSellingPoint" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.message|"no menu found"|
      |$.menus|[]|

  @Negative @Timeout
  Scenario: Test get menu for selling point endpoint timeout handling
    And I send the GET request to "GET_GetMenuForSellingPoint" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.message|"no menu found"|
      |$.menus|[]|

  @Positive @EndToEnd
  Scenario: End-to-end get menu for selling point data retrieval workflow
    And I send the GET request to "GET_GetMenuForSellingPoint" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.message|"no menu found"|
      |$.menus|[]|
    And I store the response as "getmenuforsellingpoint_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|
      |$.error.message|string|
      |$.menus|array|

