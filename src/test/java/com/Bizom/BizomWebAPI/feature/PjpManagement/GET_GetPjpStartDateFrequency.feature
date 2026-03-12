@BizomWebAPI @PjpManagement @GetPjpStartDateFrequency @SalesOperations
Feature: Get PJP Start Date Frequency API Testing
  As a system user
  I want to test the get PJP start date frequency endpoint
  So that I can ensure proper functionality and data retrieval for PJP start date and frequency information

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get PJP start date frequency without access token
    When I send the GET request to "pjps_get_pjp_start_date_frequency" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get PJP start date frequency with invalid access token
#    And I send the GET request to "pjps_get_pjp_start_date_frequency" endpoint with dynamic access token and query parameters
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
#  Scenario: Get PJP start date frequency with expired access token
#    And I send the GET request to "pjps_get_pjp_start_date_frequency" endpoint with dynamic access token and query parameters
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
#  Scenario: Get PJP start date frequency with malformed access token
#    And I send the GET request to "pjps_get_pjp_start_date_frequency" endpoint with dynamic access token and query parameters
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
#  Scenario: Get PJP start date frequency with valid access token
#    And I send the GET request to "pjps_get_pjp_start_date_frequency" endpoint with dynamic access token and query parameters
#      |Query         |Value         |
#      |access_token  |ACCESS_TOKEN  |
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|"No data found for this user."|
#      |$.Data|{}|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Data|object|

#  @Positive @Functional
#  Scenario: Get PJP start date frequency and validate response structure
#    And I send the GET request to "pjps_get_pjp_start_date_frequency" endpoint with dynamic access token and query parameters
#      |Query         |Value         |
#      |access_token  |ACCESS_TOKEN  |
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|"No data found for this user."|
#      |$.Data|{}|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Data|object|

#  @Positive @DataValidation
#  Scenario: Validate PJP start date frequency response structure
#    And I send the GET request to "pjps_get_pjp_start_date_frequency" endpoint with dynamic access token and query parameters
#      |Query         |Value         |
#      |access_token  |ACCESS_TOKEN  |
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|"No data found for this user."|
#      |$.Data|{}|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Data|object|

#  @Positive @DataValidation
#  Scenario: Validate PJP start date frequency Data object structure
#    And I send the GET request to "pjps_get_pjp_start_date_frequency" endpoint with dynamic access token and query parameters
#      |Query         |Value         |
#      |access_token  |ACCESS_TOKEN  |
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Data|{}|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Data|object|

#  @Negative @ErrorHandling
#  Scenario: Get PJP start date frequency with invalid endpoint
#    And I send the GET request to "pjps_get_pjp_start_date_frequency_invalid" endpoint with dynamic access token and query parameters
#      |Query         |Value         |
#      |access_token  |ACCESS_TOKEN  |
#    Then I should see the response code as "404"
#    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance test for get PJP start date frequency endpoint
    And I send the GET request to "pjps_get_pjp_start_date_frequency" endpoint with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

#  @Positive @Regression
#  Scenario: Regression test for get PJP start date frequency endpoint
#    And I send the GET request to "pjps_get_pjp_start_date_frequency" endpoint with dynamic access token and query parameters
#      |Query         |Value         |
#      |access_token  |ACCESS_TOKEN  |
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|"No data found for this user."|
#      |$.Data|{}|

#  @Positive @EndToEnd
#  Scenario: End-to-end get PJP start date frequency data retrieval workflow
#    And I send the GET request to "pjps_get_pjp_start_date_frequency" endpoint with dynamic access token and query parameters
#      |Query         |Value         |
#      |access_token  |ACCESS_TOKEN  |
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|"No data found for this user."|
#      |$.Data|{}|
#    And I store the response as "get_pjp_start_date_frequency_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Data|object|

#  @Positive @DataValidation
#  Scenario: Validate PJP start date frequency complete response structure
#    And I send the GET request to "pjps_get_pjp_start_date_frequency" endpoint with dynamic access token and query parameters
#      |Query         |Value         |
#      |access_token  |ACCESS_TOKEN  |
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|"No data found for this user."|
#      |$.Data|{}|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Data|object|

  @Positive @Functional
  Scenario: Get PJP start date frequency without query parameters
    When I send the GET request to "pjps_get_pjp_start_date_frequency" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Positive @LoadTesting
  Scenario: Load testing for get PJP start date frequency endpoint
    And I send the GET request to "pjps_get_pjp_start_date_frequency" endpoint with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

