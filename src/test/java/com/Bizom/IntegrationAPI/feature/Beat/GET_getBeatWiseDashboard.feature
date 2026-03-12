@BeatWiseDashboard @Sanity @All @allGet
Feature: This feature file is of the testcases of GET end point of BeatWiseDashboard

  @BeatWiseDashboardPositive
  Scenario: TC_01 BeatWiseDashboard -  positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName     |HeaderValue     |
      |Accept         |*/*             |
      |Accept-Encoding|gzip,deflate, br|
      |Connection     |keep-alive      |
    And I send the GET request to "getbeatwiseDashboard" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue                           |
      |access_token  |ACCESS_TOKEN  |
      |fordate       |2021-07-19                                |
      |pageno        |1                                         |
      |limit         |100                                         |

    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | Result  | true   |
    And verify response headers
      | HeaderName    | HeaderValue                |
      | Content-Type  | text/html; charset=UTF-8   |
      | Server        | Bizom                      |
      | Connection    | keep-alive                 |
    And verify response time is less than "1500" milliseconds
    And I store the response as "beatwiseDashboard" name using full path

  @BeatWiseDashboardNoParam
  Scenario: TC_01 BeatWiseDashboard -  No param case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName     |HeaderValue     |
      |Accept         |*/*             |
      |Accept-Encoding|gzip,deflate, br|
      |Connection     |keep-alive      |
   And I send the GET request to "getbeatwiseDashboard" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue                           |
      |access_token  |ACCESS_TOKEN  |

    Then I should see the response code as "200"
    And verify response headers
      | HeaderName    | HeaderValue                |
      | Content-Type  | text/html; charset=UTF-8   |
      | Server        | Bizom                      |
      | Connection    | keep-alive                 |
    And verify response time is less than "1500" milliseconds
    And I store the response as "beatwiseDashboard" name using full path

  @BeatWiseDashboardNoAuth

  Scenario: TC_03 beatwiseDashboard -  No auth
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName     |HeaderValue     |
      |Accept         |*/*             |
      |Accept-Encoding|gzip,deflate, br|
      |Connection     |keep-alive      |
    And I send the GET request to "getbeatwiseDashboard" endpoint with query parameters
      |QueryParamName|QueryParamValue    |
      |fordate       |2021-07-19         |
      |pageno        |1                  |
      |limit         |100                |
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      | JPath                | Value                             |
      | error              | invalid_request                   |
      | error_description  | The access token was not found.   |
    And verify response headers
      | HeaderName    | HeaderValue                |
      | Content-Type  | text/html; charset=UTF-8   |
      | Server        | Bizom                      |
      | Connection    | keep-alive                 |
    And verify response time is less than "1200" milliseconds
    And I store the response as "beatwiseDashboard" name using full path