@BizomWebAPI @PjpManagement @GetUsersBeats @OrderManagement
Feature: Get Users Beats API Testing
  As a system user
  I want to test the get users beats endpoint
  So that I can ensure proper functionality and data retrieval for user beats information

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get users beats without access token
    When I send the GET request to "pjps_get_users_beats" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get users beats with invalid access token
#    And I send the GET request to "pjps_get_users_beats" endpoint with dynamic access token and query parameters
#      |Query         |Value         |
#      |access_token  |invalid_token_12345|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get users beats with expired access token
#    And I send the GET request to "pjps_get_users_beats" endpoint with dynamic access token and query parameters
#      |Query         |Value         |
#      |access_token  |expired_token_12345|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get users beats with malformed access token
#    And I send the GET request to "pjps_get_users_beats" endpoint with dynamic access token and query parameters
#      |Query         |Value         |
#      |access_token  |malformed.token.here|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2000" milliseconds

#  @Positive @Smoke
#  Scenario: Get users beats with valid access token
#    And I send the GET request to "pjps_get_users_beats" endpoint with dynamic access token and query parameters
#      |Query         |Value         |
#      |access_token  |ACCESS_TOKEN  |
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.error.message|"no data found"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.error|object|
#      |$.error.message|string|

#  @Positive @Functional
#  Scenario: Get users beats and validate response structure
#    And I send the GET request to "pjps_get_users_beats" endpoint with dynamic access token and query parameters
#      |Query         |Value         |
#      |access_token  |ACCESS_TOKEN  |
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.error.message|"no data found"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.error|object|
#      |$.error.message|string|

#  @Positive @DataValidation
#  Scenario: Validate users beats response structure
#    And I send the GET request to "pjps_get_users_beats" endpoint with dynamic access token and query parameters
#      |Query         |Value         |
#      |access_token  |ACCESS_TOKEN  |
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.error.message|"no data found"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.error|object|
#      |$.error.message|string|

#  @Negative @ErrorHandling
#  Scenario: Get users beats with invalid endpoint
#    And I send the GET request to "pjps_get_users_beats_invalid" endpoint with dynamic access token and query parameters
#      |Query         |Value         |
#      |access_token  |ACCESS_TOKEN  |
#    Then I should see the response code as "404"
#    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance test for get users beats endpoint
    And I send the GET request to "pjps_get_users_beats" endpoint with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

#  @Positive @Regression
#  Scenario: Regression test for get users beats endpoint
#    And I send the GET request to "pjps_get_users_beats" endpoint with dynamic access token and query parameters
#      |Query         |Value         |
#      |access_token  |ACCESS_TOKEN  |
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.error.message|"no data found"|

#  @Positive @EndToEnd
#  Scenario: End-to-end get users beats data retrieval workflow
#    And I send the GET request to "pjps_get_users_beats" endpoint with dynamic access token and query parameters
#      |Query         |Value         |
#      |access_token  |ACCESS_TOKEN  |
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.error.message|"no data found"|
#    And I store the response as "get_users_beats_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.error|object|
#      |$.error.message|string|

#  @Positive @DataValidation
#  Scenario: Validate users beats error object structure
#    And I send the GET request to "pjps_get_users_beats" endpoint with dynamic access token and query parameters
#      |Query         |Value         |
#      |access_token  |ACCESS_TOKEN  |
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.error.message|"no data found"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.error|object|
#      |$.error.message|string|

  @Positive @Functional
  Scenario: Get users beats without query parameters
    When I send the GET request to "pjps_get_users_beats" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Positive @LoadTesting
  Scenario: Load testing for get users beats endpoint
    And I send the GET request to "pjps_get_users_beats" endpoint with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

