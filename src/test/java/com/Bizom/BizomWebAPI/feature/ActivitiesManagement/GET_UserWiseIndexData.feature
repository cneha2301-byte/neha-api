@BizomWebAPI @CE @ActivitiesManagement @UserWiseIndexData @SystemIntegration
Feature: User Wise Index Data API Testing
  As a system user
  I want to test the userwiseindexdata endpoint
  So that I can ensure proper functionality and data retrieval for user activities

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get user wise index data without access token
    When I send the GET request to "activities_userwiseindexdata" endpoint with path parameters
      |Path|Value|
      |startDate|02-01-2025|
      |endDate|26-11-2025|
      |userId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get user wise index data with invalid access token
#    And I send the GET request to "activities_userwiseindexdata" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|invalid_token_12345|startDate|02-01-2025|
#      |locatrac|1|endDate|26-11-2025|
#      |||userId|1|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get user wise index data with expired access token
#    And I send the GET request to "activities_userwiseindexdata" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|expired_token_12345|startDate|02-01-2025|
#      |locatrac|1|endDate|26-11-2025|
#      |||userId|1|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get user wise index data with malformed access token
#    And I send the GET request to "activities_userwiseindexdata" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|malformed.token.here|startDate|02-01-2025|
#      |locatrac|1|endDate|26-11-2025|
#      |||userId|1|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

#  @Positive @Smoke
#  Scenario: Get user wise index data with valid access token and path parameters
#    And I send the GET request to "activities_userwiseindexdata" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|startDate|02-01-2025|
#      |locatrac|1|endDate|26-11-2025|
#      |||userId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Content-Type|text/html; charset=UTF-8|
#    And the HTML response should contain element "html"
#    And the HTML response should contain element "table"
#    And validating the response contains the following values
#      |Value|
#      |Activity from|
#      |ActivityId|
#      |Date|
#      |ActivityType|
#      |Oulet|
#      |Comment|
#      |Location|
#    And I store the response as "userWiseIndexData_response" name using full path

#  @Positive @Functional
#  Scenario: Get user wise index data for different user ID
#    And I send the GET request to "activities_userwiseindexdata" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|startDate|02-01-2025|
#      |locatrac|1|endDate|26-11-2025|
#      |||userId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Content-Type|text/html; charset=UTF-8|
#    And the HTML response should contain element "html"
#    And the HTML response should contain element "table"
#    And validating the response contains the following values
#      |Value|
#      |Activity from|
#      |ActivityId|

#  @Positive @Functional
#  Scenario: Get user wise index data with different date range
#    And I send the GET request to "activities_userwiseindexdata" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|startDate|01-01-2025|
#      |locatrac|1|endDate|31-12-2025|
#      |||userId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Content-Type|text/html; charset=UTF-8|
#    And the HTML response should contain element "html"
#    And the HTML response should contain element "table"

  @Negative @Validation
  Scenario: Get user wise index data with invalid start date format
    And I send the GET request to "activities_userwiseindexdata" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|startDate|invalid-date|
      |locatrac|1|endDate|26-11-2025|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get user wise index data with invalid end date format
    And I send the GET request to "activities_userwiseindexdata" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|startDate|02-01-2025|
      |locatrac|1|endDate|invalid-date|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get user wise index data with invalid user ID
    And I send the GET request to "activities_userwiseindexdata" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|startDate|02-01-2025|
      |locatrac|1|endDate|26-11-2025|
      |||userId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get user wise index data with non-existent user ID
    And I send the GET request to "activities_userwiseindexdata" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|startDate|02-01-2025|
      |locatrac|1|endDate|26-11-2025|
      |||userId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Negative @Validation
#  Scenario: Get user wise index data with missing user ID - should return 500 error
#    And I send the GET request to "activities_userwiseindexdata" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|startDate|02-01-2025|
#      |locatrac|1|endDate|26-11-2025|
#    Then I should see the response code as "500"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Validation
#  Scenario: Get user wise index data with missing start date
#    And I send the GET request to "activities_userwiseindexdata" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|endDate|26-11-2025|
#      |locatrac|1|userId|1|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Validation
#  Scenario: Get user wise index data with missing end date
#    And I send the GET request to "activities_userwiseindexdata" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|startDate|02-01-2025|
#      |locatrac|1|userId|1|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get user wise index data with start date after end date
    And I send the GET request to "activities_userwiseindexdata" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|startDate|26-11-2025|
      |locatrac|1|endDate|02-01-2025|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get user wise index data with negative user ID
    And I send the GET request to "activities_userwiseindexdata" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|startDate|02-01-2025|
      |locatrac|1|endDate|26-11-2025|
      |||userId|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: Get user wise index data with invalid endpoint
    And I send the GET request to "activities_userwiseindexdata_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|startDate|02-01-2025|
      |locatrac|1|endDate|26-11-2025|
      |||userId|1|
    Then I should see the response code as "404"
    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: Performance test for user wise index data endpoint
    And I send the GET request to "activities_userwiseindexdata" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|startDate|02-01-2025|
      |locatrac|1|endDate|26-11-2025|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

#  @Positive @Regression
#  Scenario: Regression test for user wise index data endpoint
#    And I send the GET request to "activities_userwiseindexdata" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|startDate|02-01-2025|
#      |locatrac|1|endDate|26-11-2025|
#      |||userId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Content-Type|text/html; charset=UTF-8|
#    And the HTML response should contain element "html"
#    And the HTML response should contain element "table"

#  @Positive @HTMLValidation
#  Scenario: Validate user wise index data HTML content structure
#    And I send the GET request to "activities_userwiseindexdata" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|startDate|02-01-2025|
#      |locatrac|1|endDate|26-11-2025|
#      |||userId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Content-Type|text/html; charset=UTF-8|
#    And the HTML response should contain element "html"
#    And the HTML response should contain element "head"
#    And the HTML response should contain element "body"
#    And the HTML response should contain element "table"
#    And the HTML response should contain element "thead"
#    And the HTML response should contain element "tbody"
#    And validating the response contains the following values
#      |Value|
#      |Activity from|
#      |ActivityId|
#      |Date|
#      |ActivityType|
#      |Oulet|
#      |Comment|
#      |Location|
#      |Picture(s)|
#      |useractivities|

  @Positive @HTMLValidation
  Scenario: Validate user wise index data HTML table structure
    And I send the GET request to "activities_userwiseindexdata" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|startDate|02-01-2025|
      |locatrac|1|endDate|26-11-2025|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain element "table"
    And the HTML response should contain element "thead"
    And the HTML response should contain element "tr"
    And the HTML response should contain element "th"
    And validating the response contains the following values
      |Value|
      |id="useractivities"|
      |ActivityId|
      |Date|
      |ActivityType|

#  @Positive @DataValidation
#  Scenario: Validate user wise index data with locatrac parameter set to 0
#    And I send the GET request to "activities_userwiseindexdata" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|startDate|02-01-2025|
#      |locatrac|0|endDate|26-11-2025|
#      |||userId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Content-Type|text/html; charset=UTF-8|
#    And the HTML response should contain element "html"
#    And the HTML response should contain element "table"

#  @Positive @DataValidation
#  Scenario: Validate user wise index data with different date formats
#    And I send the GET request to "activities_userwiseindexdata" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|startDate|01-01-2024|
#      |locatrac|1|endDate|31-12-2024|
#      |||userId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Content-Type|text/html; charset=UTF-8|
#    And the HTML response should contain element "html"
#    And the HTML response should contain element "table"

#  @Positive @Functional
#  Scenario: Validate user wise index data response completeness
#    And I send the GET request to "activities_userwiseindexdata" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|startDate|02-01-2025|
#      |locatrac|1|endDate|26-11-2025|
#      |||userId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Content-Type|text/html; charset=UTF-8|
#    And the HTML response should contain element "html"
#    And the HTML response should contain element "table"
#    And validating the response contains the following values
#      |Value|
#      |Activity from|
#      |ActivityId|
#      |Date|
#      |ActivityType|
#      |Oulet|
#      |Comment|
#      |Location|
#      |Picture(s)|
#    And I store the response as "userWiseIndexData_response" name using full path



