@BizomWebAPI @CE @ActivitiesManagement @GetNextUnauditedActivity @MasterDataManagement
Feature: Activities Get Next Unaudited Activity API Testing
  As a system user
  I want to access the activities get next unaudited activity endpoint
  So that I can retrieve the next unaudited activity information from the system

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|


  @Positive @Smoke
  Scenario: TC_01 Get next unaudited activity information successfully
    And I send the GET request to "activities_getnextunauditedactivity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And verify response headers
      | HeaderName | HeaderValue |
      | X-Frame-Options | SAMEORIGIN |

  @Positive @Functional
  Scenario: TC_02 Verify next unaudited activity data structure and content
    And I send the GET request to "activities_getnextunauditedactivity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And contentType as "application/json; charset=UTF-8"

  @Positive @DataValidation
  Scenario: TC_03 Validate next unaudited activity response contains expected Activitypicture structure
    And I send the GET request to "activities_getnextunauditedactivity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      | JPath                                     | Value                                  |
      | $[0].Activitypicture.activity_id          | 0                                     |

  @Positive @DataValidation
  Scenario: TC_04 Validate next unaudited activity response data types and structure
    And I send the GET request to "activities_getnextunauditedactivity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And contentType as "application/json; charset=UTF-8"

  @Positive @DataValidation
  Scenario: TC_05 Validate next unaudited activity response with specific sample data
    And I send the GET request to "activities_getnextunauditedactivity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And contentType as "application/json; charset=UTF-8"

  @Positive @DataValidation
  Scenario: TC_06 Validate next unaudited activity response handles empty data scenario
    And I send the GET request to "activities_getnextunauditedactivity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And contentType as "application/json; charset=UTF-8"

  @Positive @Performance
  Scenario: TC_07 Verify next unaudited activity data retrieval performance under normal load
    And I send the GET request to "activities_getnextunauditedactivity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And contentType as "application/json; charset=UTF-8"

  @Positive @Smoke
  Scenario: TC_08 Get next unaudited activity information successfully
    And I send the GET request to "activities_getnextunauditedactivity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And verify response headers
      | HeaderName | HeaderValue |
      | X-Frame-Options | SAMEORIGIN |

  @Positive @Integration
  Scenario: TC_09 Verify next unaudited activity data endpoint integration with session management
    And I send the GET request to "activities_getnextunauditedactivity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And contentType as "application/json; charset=UTF-8"

  @Negative @Validation
  Scenario: TC_10 Access next unaudited activity data with invalid endpoint
    And I send the GET request to "activities_getnextunauditedactivity_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title ""
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_11 Access next unaudited activity data without authentication
    And I send the GET request to "activities_getnextunauditedactivity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token||
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_12 Access next unaudited activity data with invalid session token
    And I send the GET request to "activities_getnextunauditedactivity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_13 Access next unaudited activity data with expired session
    And I send the GET request to "activities_getnextunauditedactivity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Performance
  Scenario: TC_14 Verify next unaudited activity data endpoint performance under high load
    And I send the GET request to "activities_getnextunauditedactivity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
