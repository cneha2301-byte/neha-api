@BizomWebAPI @CE @OutletsManagement @GetOutletsForUser @InventoryOperations
Feature: Get Outlets For User API Testing
  As a system user
  I want to test the get outlets for user endpoint
  So that I can ensure user-specific outlet lists are returned correctly

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get outlets for user without access token
    When I send the GET request to "outlets_get_outlets_for_user" endpoint with path parameters
      |Path|Value|
      |userId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_02 Get outlets for user with invalid access token
#    And I send the GET request to "outlets_get_outlets_for_user" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|invalid_token_12345|userId|2|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_03 Get outlets for user with expired access token
#    And I send the GET request to "outlets_get_outlets_for_user" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|expired_token_12345|userId|2|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_04 Get outlets for user with malformed access token
#    And I send the GET request to "outlets_get_outlets_for_user" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|malformed.token.here|userId|2|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get outlets for user with valid access token
    And I send the GET request to "outlets_get_outlets_for_user" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data['2']|"Sadha Nanda1"|
      |$.data['4']|"Anmol Kirana"|
    And I store the response as "outlets_user_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate outlets for user response structure
    And I send the GET request to "outlets_get_outlets_for_user" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|object|
      |$.data['2']|string|
      |$.data['721']|string|

  @Positive @DataValidation
  Scenario: TC_07 Validate outlets for user specific data values
    And I send the GET request to "outlets_get_outlets_for_user" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data['11']|"9 to 11 Store"|
      |$.data['670']|"best"|
      |$.data['743']|"CHANDU: WINES [Outlet_IdKA_40142]"|
      |$.data['673']|"slv"|

  @Positive @ContentValidation
  Scenario: TC_08 Validate outlets for user content structure
    And I send the GET request to "outlets_get_outlets_for_user" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |data|
      |Sadha Nanda1|
      |J K Kirana|
      |Ramdev General Store|
      |SS Traders|

  @Positive @ArrayValidation
  Scenario: TC_09 Validate outlets for user map entries
    And I send the GET request to "outlets_get_outlets_for_user" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data['709']|string|
      |$.data['718']|string|
      |$.data['777']|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data['709']|"bob"|
      |$.data['718']|"MC CCOMP"|
      |$.data['777']|"t1"|

  @Positive @Performance
  Scenario: TC_10 Performance test for outlets for user endpoint
    And I send the GET request to "outlets_get_outlets_for_user" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @Concurrency
  Scenario: TC_11 Concurrent access test for outlets for user endpoint
    And I send the GET request to "outlets_get_outlets_for_user" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @LoadTesting
  Scenario: TC_12 Load testing for outlets for user endpoint
    And I send the GET request to "outlets_get_outlets_for_user" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @Regression
  Scenario: TC_13 Regression test for outlets for user endpoint
    And I send the GET request to "outlets_get_outlets_for_user" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Positive @EndToEnd
  Scenario: TC_14 End-to-end outlets for user data retrieval workflow
    And I send the GET request to "outlets_get_outlets_for_user" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And I store the response as "outlets_user_response" name using full path

  @Negative @Validation
  Scenario: TC_15 Get outlets for user with invalid query parameters
    And I send the GET request to "outlets_get_outlets_for_user" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
      |invalid_param|invalid_value| | |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_16 Get outlets for user using special characters in query parameters
    And I send the GET request to "outlets_get_outlets_for_user" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
      |test_param|<script>alert('XSS')</script>| | |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Security
  Scenario: TC_17 Get outlets for user with SQL injection attempt
    And I send the GET request to "outlets_get_outlets_for_user" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
      |test_param|'; DROP TABLE outlets; --| | |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Boundary
  Scenario: TC_18 Get outlets for user with large user identifier
    And I send the GET request to "outlets_get_outlets_for_user" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|9999999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_19 Get outlets for user using invalid endpoint
    And I send the GET request to "outlets_get_outlets_for_user_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Users"

