@BizomWebAPI @OS @OrdersManagement @Orders @RolewiseUsers @WorkflowAutomation
Feature: Orders - Get Rolewise Users
  This feature validates the /orders/getRolewiseUsers endpoint which returns role details.

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get rolewise users without access token
    When I send the GET request to "orders_get_rolewise_users" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get rolewise users with invalid access token
    And I send the GET request to "orders_get_rolewise_users" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get rolewise users with expired access token
    And I send the GET request to "orders_get_rolewise_users" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get rolewise users with malformed access token
    And I send the GET request to "orders_get_rolewise_users" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Positive @Smoke
#  Scenario: TC_05 Get rolewise users with valid access token
#    And I send the GET request to "orders_get_rolewise_users" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|array|
#      |$[0]|array|
#      |$[0].id|string|
#      |$[0].name|string|
#    And verify response time is less than "2500" milliseconds

  @Positive @DataValidation
  Scenario: TC_06 Validate first role values
    And I send the GET request to "orders_get_rolewise_users" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$[0].id|"1"|
      |$[0].name|ADMIN|
      |$[1].id|"2"|
      |$[1].name|ZONE MANAGER|
    And verify response time is less than "2500" milliseconds

#  @Positive @ArrayValidation
#  Scenario: TC_07 Validate rolewise users array structure
#    And I send the GET request to "orders_get_rolewise_users" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|array|
#      |$[5]|array|
#      |$[5].id|array|
#      |$[5].name|array|
#    And verify response time is less than "2500" milliseconds

  @Positive @ContentValidation
  Scenario: TC_08 Validate rolewise users content contains expected names
    And I send the GET request to "orders_get_rolewise_users" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response contains the following values
      |Value|
      |ADMIN|
      |ZONE MANAGER|
      |WAREHOUSE MANAGER|
      |SALES MANAGER|
      |ERP API USER|
    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: TC_09 Performance test for rolewise users endpoint
    And I send the GET request to "orders_get_rolewise_users" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for rolewise users endpoint
    And I send the GET request to "orders_get_rolewise_users" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_11 Get rolewise users with invalid query parameters
    And I send the GET request to "orders_get_rolewise_users" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_12 Get rolewise users with special characters in query parameters
    And I send the GET request to "orders_get_rolewise_users" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_13 Get rolewise users with SQL injection attempt
    And I send the GET request to "orders_get_rolewise_users" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE users; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: TC_14 Get rolewise users with maximum query parameters
    And I send the GET request to "orders_get_rolewise_users" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Negative @ErrorHandling
#  Scenario: TC_15 Get rolewise users with invalid endpoint
#    And I send the GET request to "orders_get_rolewise_users_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And validating the response contains the following values
#      |Value|
#      |Users|
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_16 Validate rolewise users business logic
    And I send the GET request to "orders_get_rolewise_users" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$[2].id|array|
      |$[2].name|array|
    And verify response time is less than "2500" milliseconds

  @Positive @DataIntegrity
  Scenario: TC_17 Validate rolewise users data integrity
    And I send the GET request to "orders_get_rolewise_users" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$[10].id|array|
      |$[10].name|array|
    And verify response time is less than "2500" milliseconds

  @Positive @Regression
  Scenario: TC_18 Regression test for rolewise users endpoint
    And I send the GET request to "orders_get_rolewise_users" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Functional
  Scenario: TC_19 Validate rolewise users response completeness
    And I send the GET request to "orders_get_rolewise_users" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
      |$[13]|object|
      |$[13].id|array|
      |$[13].name|array|
    And verify response time is less than "2500" milliseconds

  @Positive @LoadTesting
  Scenario: TC_20 Load testing for rolewise users endpoint
    And I send the GET request to "orders_get_rolewise_users" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Negative @Timeout
  Scenario: TC_21 Test rolewise users endpoint timeout handling
    And I send the GET request to "orders_get_rolewise_users" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds

  @Positive @EndToEnd
  Scenario: TC_22 End-to-end rolewise users retrieval workflow
    And I send the GET request to "orders_get_rolewise_users" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$[3].id|array|
      |$[3].name|array|
    And I store the response as "rolewise_users_response" name using full path
    And verify response time is less than "2500" milliseconds


