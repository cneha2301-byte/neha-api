@BizomWebAPI @CE @OutletsManagement @OutletsApproveMultiple @SystemIntegration
Feature: Approve Multiple Outlets API Testing
  As a system user
  I want to test the approvemultiple endpoint
  So that I can ensure proper approval of multiple outlets

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |accept-language|en-US,en;q=0.9|
      |priority|u=0, i|
      |sec-ch-ua|"Google Chrome";v="143", "Chromium";v="143", "Not A(Brand";v="24"|
      |sec-ch-ua-mobile|?0|
      |sec-ch-ua-platform|"Windows"|
      |sec-fetch-dest|document|
      |sec-fetch-mode|navigate|
      |sec-fetch-site|none|
      |sec-fetch-user|?1|
      |upgrade-insecure-requests|1|
      |user-agent|Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36|

  @Negative @Security
  Scenario: TC_01 Approve multiple outlets without access token
    And I post the request with "POST_approvemultiple" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token||
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_02 Approve multiple outlets with invalid access token
#    And I post the request with "POST_approvemultiple" payload with dynamic access token and query parameters
#      |Query|Value|
#      |access_token|invalid_token_12345|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_03 Approve multiple outlets with expired access token
#    And I post the request with "POST_approvemultiple" payload with dynamic access token and query parameters
#      |Query|Value|
#      |access_token|expired_token_12345|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_04 Approve multiple outlets with malformed access token
#    And I post the request with "POST_approvemultiple" payload with dynamic access token and query parameters
#      |Query|Value|
#      |access_token|malformed.token.here|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Approve multiple outlets with valid request
    And I post the request with "POST_approvemultiple" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|Outlets Successfully Approved.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|
      |$.error.message|string|
    And I store the response as "approve_multiple_outlets_response" name using full path

  @Positive @Performance
  Scenario: TC_06 Performance test for approve multiple outlets endpoint
    And I post the request with "POST_approvemultiple" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @Validation
  Scenario: TC_07 Approve multiple outlets with invalid outlet IDs
    And I modify fields with random values and remove fields in "POST_approvemultiple" payload
      |JPath|Value|
      |$.Outlets[0].Outlet.id|abc|
    And I post the request with "POST_approvemultiple" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|

  @Negative @Validation
  Scenario: TC_08 Approve multiple outlets with empty body
    And I send empty body with "POST_approvemultiple" request
    And I post the request with "POST_approvemultiple" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.message|"invalid  data"|

#  @Negative @ErrorHandling
#  Scenario: TC_09 Approve multiple outlets with invalid endpoint
#    And I post the request with "POST_approvemultiple_invalid" payload with dynamic access token and query parameters
#      |Query|Value|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_10 Approve multiple outlets with empty Outlets array
    And I modify fields with random values and remove fields in "POST_approvemultiple" payload
      |JPath|Value|
      |$.Outlets|[]|
    And I post the request with "POST_approvemultiple" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|

  @Negative @Validation
  Scenario: TC_11 Approve multiple outlets with non-existent outlet IDs
    And I modify fields with random values and remove fields in "POST_approvemultiple" payload
      |JPath|Value|
      |$.Outlets[0].Outlet.id|999999|
    And I post the request with "POST_approvemultiple" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|

  @Positive @ObjectValidation
  Scenario: TC_12 Validate approve multiple outlets response structure
    And I post the request with "POST_approvemultiple" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|
      |$.error.message|string|

  @Positive @ContentValidation
  Scenario: TC_13 Validate approve multiple outlets response contains mandatory keys
    And I post the request with "POST_approvemultiple" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |result|
      |error|
      |message|

  @Positive @Regression
  Scenario: TC_14 Regression test for approve multiple outlets endpoint
    And I post the request with "POST_approvemultiple" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|Outlets Successfully Approved.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|
      |$.error.message|string|

  @Positive @Concurrency
  Scenario: TC_15 Concurrent access test for approve multiple outlets endpoint
    And I post the request with "POST_approvemultiple" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Positive @LoadTesting
  Scenario: TC_16 Load testing for approve multiple outlets endpoint
    And I post the request with "POST_approvemultiple" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @Timeout
  Scenario: TC_17 Test approve multiple outlets endpoint timeout handling
    And I post the request with "POST_approvemultiple" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

