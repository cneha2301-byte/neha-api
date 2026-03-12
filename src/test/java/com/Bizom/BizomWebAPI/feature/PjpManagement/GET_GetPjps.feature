@BizomWebAPI @PjpManagement @GetPjps @OrderManagement
Feature: Get PJPs API Testing
  As a system user
  I want to test the get PJPs endpoint
  So that I can ensure proper functionality and data retrieval for PJP information

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get PJPs without access token
    When I send the GET request to "pjps_get_pjps" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |responsetype|json|
      |fromdate|2024-01-21|
      |todate|2024-01-26|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get PJPs with invalid access token
    And I send the GET request to "pjps_get_pjps" endpoint with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |invalid_token_12345|
      |responsetype|json|
      |fromdate|2024-01-21|
      |todate|2024-01-26|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get PJPs with expired access token
    And I send the GET request to "pjps_get_pjps" endpoint with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |expired_token_12345|
      |responsetype|json|
      |fromdate|2024-01-21|
      |todate|2024-01-26|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get PJPs with malformed access token
    And I send the GET request to "pjps_get_pjps" endpoint with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |malformed.token.here|
      |fromdate|2024-01-21|
      |todate|2024-01-26|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

#  @Positive @Smoke
#  Scenario: Get PJPs with valid access token and query parameters
#    And I send the GET request to "pjps_get_pjps" endpoint with dynamic access token and query parameters
#      |Query         |Value         |
#      |access_token  |ACCESS_TOKEN  |
#      |fromdate|2024-01-21|
#      |todate|2024-01-26|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Response.Result|false|
#      |$.Response.Reason|"No data found."|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Response|object|
#      |$.Response.Result|boolean|
#      |$.Response.Reason|string|
#
#  @Positive @Functional
#  Scenario: Get PJPs with different date range
#    And I send the GET request to "pjps_get_pjps" endpoint with dynamic access token and query parameters
#      |Query         |Value         |
#      |access_token  |ACCESS_TOKEN  |
#      |responsetype|json|
#      |fromdate|2024-02-01|
#      |todate|2024-02-28|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Response.Result|false|
#      |$.Response.Reason|"No data found."|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Response|object|
#      |$.Response.Result|boolean|
#      |$.Response.Reason|string|

  @Positive @Functional
  Scenario: Get PJPs with XML response type
    And I send the GET request to "pjps_get_pjps" endpoint with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |ACCESS_TOKEN  |
      |responsetype|xml|
      |fromdate|2024-01-21|
      |todate|2024-01-26|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: Get PJPs with missing responsetype parameter
    And I send the GET request to "pjps_get_pjps" endpoint with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |ACCESS_TOKEN  |
      |fromdate|2024-01-21|
      |todate|2024-01-26|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: Get PJPs with missing fromdate parameter
    And I send the GET request to "pjps_get_pjps" endpoint with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |ACCESS_TOKEN  |
      |responsetype|json|
      |todate|2024-01-26|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: Get PJPs with missing todate parameter
    And I send the GET request to "pjps_get_pjps" endpoint with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |ACCESS_TOKEN  |
      |responsetype|json|
      |fromdate|2024-01-21|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: Get PJPs with invalid date format for fromdate
    And I send the GET request to "pjps_get_pjps" endpoint with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |ACCESS_TOKEN  |
      |responsetype|json|
      |fromdate|invalid-date|
      |todate|2024-01-26|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: Get PJPs with invalid date format for todate
    And I send the GET request to "pjps_get_pjps" endpoint with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |ACCESS_TOKEN  |
      |responsetype|json|
      |fromdate|2024-01-21|
      |todate|invalid-date|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: Get PJPs with fromdate greater than todate
    And I send the GET request to "pjps_get_pjps" endpoint with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |ACCESS_TOKEN  |
      |responsetype|json|
      |fromdate|2024-01-26|
      |todate|2024-01-21|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: Get PJPs with invalid responsetype
    And I send the GET request to "pjps_get_pjps" endpoint with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |ACCESS_TOKEN  |
      |responsetype|invalid|
      |fromdate|2024-01-21|
      |todate|2024-01-26|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

#  @Negative @ErrorHandling
#  Scenario: Get PJPs with invalid endpoint
#    And I send the GET request to "pjps_get_pjps_invalid" endpoint with dynamic access token and query parameters
#      |Query         |Value         |
#      |access_token  |ACCESS_TOKEN  |
#      |responsetype|json|
#      |fromdate|2024-01-21|
#      |todate|2024-01-26|
#    Then I should see the response code as "404"
#    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance test for get PJPs endpoint
    And I send the GET request to "pjps_get_pjps" endpoint with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |ACCESS_TOKEN  |
      |responsetype|json|
      |fromdate|2024-01-21|
      |todate|2024-01-26|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

#  @Positive @Regression
#  Scenario: Regression test for get PJPs endpoint
#    And I send the GET request to "pjps_get_pjps" endpoint with dynamic access token and query parameters
#      |Query         |Value         |
#      |access_token  |ACCESS_TOKEN  |
#      |responsetype|json|
#      |fromdate|2024-01-21|
#      |todate|2024-01-26|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Response.Result|false|
#      |$.Response.Reason|"No data found."|

#  @Positive @DataValidation
#  Scenario: Validate get PJPs response structure
#    And I send the GET request to "pjps_get_pjps" endpoint with dynamic access token and query parameters
#      |Query         |Value         |
#      |access_token  |ACCESS_TOKEN  |
#      |responsetype|json|
#      |fromdate|2024-01-21|
#      |todate|2024-01-26|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Response.Result|false|
#      |$.Response.Reason|"No data found."|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Response|object|
#      |$.Response.Result|boolean|
#      |$.Response.Reason|string|

#  @Positive @DataValidation
#  Scenario: Validate get PJPs Response object structure
#    And I send the GET request to "pjps_get_pjps" endpoint with dynamic access token and query parameters
#      |Query         |Value         |
#      |access_token  |ACCESS_TOKEN  |
#      |responsetype|json|
#      |fromdate|2024-01-21|
#      |todate|2024-01-26|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Response.Result|false|
#      |$.Response.Reason|"No data found."|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Response|object|
#      |$.Response.Result|boolean|
#      |$.Response.Reason|string|

#  @Positive @EndToEnd
#  Scenario: End-to-end get PJPs data retrieval workflow
#    And I send the GET request to "pjps_get_pjps" endpoint with dynamic access token and query parameters
#      |Query         |Value         |
#      |access_token  |ACCESS_TOKEN  |
#      |responsetype|json|
#      |fromdate|2024-01-21|
#      |todate|2024-01-26|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Response.Result|false|
#      |$.Response.Reason|"No data found."|
#    And I store the response as "get_pjps_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Response|object|
#      |$.Response.Result|boolean|
#      |$.Response.Reason|string|

  @Positive @LoadTesting
  Scenario: Load testing for get PJPs endpoint
    And I send the GET request to "pjps_get_pjps" endpoint with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |ACCESS_TOKEN  |
      |responsetype|json|
      |fromdate|2024-01-21|
      |todate|2024-01-26|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

