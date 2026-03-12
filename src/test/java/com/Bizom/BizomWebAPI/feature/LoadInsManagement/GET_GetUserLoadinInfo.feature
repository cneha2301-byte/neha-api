@BizomWebAPI @OS @LoadInsManagement @GetUserLoadinInfo @UserAccessManagement
Feature: Get User Load In Info API Testing
  As a system user
  I want to test the get user load in info endpoint
  So that I can ensure proper functionality and data retrieval for user load in information

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get user load in info without access token
    When I send the GET request to "get_user_loadin_info" endpoint with path parameters
      |Path|Value|
      |userId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get user load in info with invalid access token
    And I send the GET request to "get_user_loadin_info" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|userId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get user load in info with expired access token
    And I send the GET request to "get_user_loadin_info" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|userId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get user load in info with malformed access token
    And I send the GET request to "get_user_loadin_info" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|userId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

#  @Positive @Smoke
#  Scenario: Get user load in info for user ID 1 with valid access token
#    And I send the GET request to "get_user_loadin_info" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.datewisedata|object|
#      |$.user|object|
#      |$.user.balance|number|
#      |$.user.balanceoncashout|number|
#      |$.user.presaleuser|number|
#      |$.Skunit_category_seq|object|
#      |$.Skunit_orders|object|
#      |$.Skunit|object|
#      |$.Batches|object|
#    And I store the response as "get_user_loadin_info_response" name using full path

#  @Positive @Functional
#  Scenario: Get user load in info for user ID 2 with valid access token
#    And I send the GET request to "get_user_loadin_info" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.datewisedata|object|
#      |$.user|object|
#      |$.user.balance|number|
#      |$.user.balanceoncashout|number|
#      |$.user.presaleuser|number|
#      |$.Skunit_category_seq|object|
#      |$.Skunit_orders|object|
#      |$.Skunit|object|
#      |$.Batches|object|

#  @Positive @DataValidation
#  Scenario: Validate get user load in info response structure for valid user ID
#    And I send the GET request to "get_user_loadin_info" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.datewisedata|object|
#      |$.user|object|
#      |$.user.balance|number|
#      |$.user.balanceoncashout|number|
#      |$.user.presaleuser|number|
#      |$.Skunit_category_seq|object|
#      |$.Skunit_orders|object|
#      |$.Skunit|object|
#      |$.Batches|object|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|

#  @Positive @DataValidation
#  Scenario: Validate get user load in info nested user object structure
#    And I send the GET request to "get_user_loadin_info" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.user|object|
#      |$.user.balance|number|
#      |$.user.balanceoncashout|number|
#      |$.user.presaleuser|number|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.user.balance|296873|
#      |$.user.balanceoncashout|0|
#      |$.user.presaleuser|0|

#  @Positive @DataValidation
#  Scenario: Validate get user load in info with static values for valid user ID
#    And I send the GET request to "get_user_loadin_info" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.user.balance|296873|
#      |$.user.balanceoncashout|0|
#      |$.user.presaleuser|0|
#      |$.datewisedata|{}|
#      |$.Skunit_category_seq|{}|
#      |$.Skunit_orders|{}|
#      |$.Skunit|{}|
#      |$.Batches|{}|

#  @Negative @Validation
#  Scenario: Get user load in info with invalid user ID
#    And I send the GET request to "get_user_loadin_info" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|abc|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|Invalid Request|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.datewisedata|array|
#      |$.user|array|
#      |$.Skunit_category_seq|array|
#      |$.Skunit_orders|array|
#      |$.Skunit|array|

#  @Negative @Validation
#  Scenario: Get user load in info with non-existent user ID
#    And I send the GET request to "get_user_loadin_info" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|999999|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|Invalid Request|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.datewisedata|array|
#      |$.user|array|
#      |$.Skunit_category_seq|array|
#      |$.Skunit_orders|array|
#      |$.Skunit|array|

#  @Negative @Validation
#  Scenario: Get user load in info with negative user ID
#    And I send the GET request to "get_user_loadin_info" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|-1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|Invalid Request|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.datewisedata|array|
#      |$.user|array|
#
#  @Negative @Validation
#  Scenario: Get user load in info with zero user ID
#    And I send the GET request to "get_user_loadin_info" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|0|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|Invalid Request|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.datewisedata|array|
#      |$.user|array|
#
#  @Negative @Validation
#  Scenario: Get user load in info with special characters in user ID
#    And I send the GET request to "get_user_loadin_info" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|Invalid Request|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.datewisedata|array|
#      |$.user|array|
#
#  @Negative @Security
#  Scenario: Get user load in info with SQL injection attempt in user ID
#    And I send the GET request to "get_user_loadin_info" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|'; DROP TABLE users; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|Invalid Request|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.datewisedata|array|
#      |$.user|array|

#  @Negative @ErrorHandling
#  Scenario: Get user load in info with invalid endpoint
#    And I send the GET request to "get_user_loadin_info_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|1|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: Performance test for get user load in info endpoint
    And I send the GET request to "get_user_loadin_info" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

#  @Positive @Concurrency
#  Scenario: Concurrent access test for get user load in info endpoint
#    And I send the GET request to "get_user_loadin_info" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.user|object|
#      |$.user.balance|number|
#      |$.user.balanceoncashout|number|
#      |$.user.presaleuser|number|

#  @Positive @BusinessLogic
#  Scenario: Validate get user load in info business logic
#    And I send the GET request to "get_user_loadin_info" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.user|object|
#      |$.user.balance|number|
#      |$.user.balanceoncashout|number|
#      |$.user.presaleuser|number|

#  @Positive @DataIntegrity
#  Scenario: Validate get user load in info data integrity
#    And I send the GET request to "get_user_loadin_info" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.datewisedata|object|
#      |$.user|object|
#      |$.user.balance|number|
#      |$.user.balanceoncashout|number|
#      |$.user.presaleuser|number|
#      |$.Skunit_category_seq|object|
#      |$.Skunit_orders|object|
#      |$.Skunit|object|
#      |$.Batches|object|
#    And validating the response contains the following values
#      |Value|
#      |Result|
#      |Reason|
#      |datewisedata|
#      |user|
#      |balance|
#      |balanceoncashout|
#      |presaleuser|
#      |Skunit_category_seq|
#      |Skunit_orders|
#      |Skunit|
#      |Batches|

#  @Positive @Regression
#  Scenario: Regression test for get user load in info endpoint
#    And I send the GET request to "get_user_loadin_info" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.user|object|
#      |$.user.balance|number|
#      |$.user.balanceoncashout|number|
#      |$.user.presaleuser|number|

#  @Positive @Functional
#  Scenario: Validate get user load in info response completeness for valid user ID
#    And I send the GET request to "get_user_loadin_info" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.datewisedata|object|
#      |$.user|object|
#      |$.user.balance|number|
#      |$.user.balanceoncashout|number|
#      |$.user.presaleuser|number|
#      |$.Skunit_category_seq|object|
#      |$.Skunit_orders|object|
#      |$.Skunit|object|
#      |$.Batches|object|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.user.balance|296873|
#      |$.user.balanceoncashout|0|
#      |$.user.presaleuser|0|
#      |$.datewisedata|{}|
#      |$.Skunit_category_seq|{}|
#      |$.Skunit_orders|{}|
#      |$.Skunit|{}|
#      |$.Batches|{}|

#  @Positive @Functional
#  Scenario: Validate get user load in info response completeness for invalid user ID
#    And I send the GET request to "get_user_loadin_info" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|999999|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.datewisedata|array|
#      |$.user|array|
#      |$.Skunit_category_seq|array|
#      |$.Skunit_orders|array|
#      |$.Skunit|array|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|Invalid Request|
#      |$.datewisedata|[]|
#      |$.user|[]|
#      |$.Skunit_category_seq|[]|
#      |$.Skunit_orders|[]|
#      |$.Skunit|[]|

  @Positive @LoadTesting
  Scenario: Load testing for get user load in info endpoint
    And I send the GET request to "get_user_loadin_info" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Negative @Timeout
  Scenario: Test get user load in info endpoint timeout handling
    And I send the GET request to "get_user_loadin_info" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

#  @Positive @EndToEnd
#  Scenario: End-to-end get user load in info data retrieval workflow
#    And I send the GET request to "get_user_loadin_info" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.user.balance|296873|
#      |$.user.balanceoncashout|0|
#      |$.user.presaleuser|0|
#      |$.datewisedata|{}|
#      |$.Skunit_category_seq|{}|
#      |$.Skunit_orders|{}|
#      |$.Skunit|{}|
#      |$.Batches|{}|
#    And I store the response as "get_user_loadin_info_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.datewisedata|object|
#      |$.user|object|
#      |$.user.balance|number|
#      |$.user.balanceoncashout|number|
#      |$.user.presaleuser|number|
#      |$.Skunit_category_seq|object|
#      |$.Skunit_orders|object|
#      |$.Skunit|object|
#      |$.Batches|object|
#    And validating the response contains the following values
#      |Value|
#      |Result|
#      |Reason|
#      |datewisedata|
#      |user|
#      |balance|
#      |balanceoncashout|
#      |presaleuser|
#      |Skunit_category_seq|
#      |Skunit_orders|
#      |Skunit|
#      |Batches|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.user.balance|296873|
#      |$.user.balanceoncashout|0|
#      |$.user.presaleuser|0|

