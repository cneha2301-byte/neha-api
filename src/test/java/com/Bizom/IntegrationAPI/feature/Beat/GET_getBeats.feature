@Beats @Sanity @All @allGet @Execution
Feature: This feature file is of the testcases of GET end point of beats

  @BeatsPositive
  Scenario: TC_01 Beats -  positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getBeats" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue                           |
      |access_token  |ACCESS_TOKEN  |
      |responsetype  |json                                      |
      |fromdate      |2025-07-01                                |
      |todate        |2025-07-13                                |
      |startseq      |0                                         |
      |endseq        |4                                         |
      |beatdata      |1                                         |
      |array         |1                                         |

    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | Response.Result  | "true"   |
    And verify response headers
      | HeaderName    | HeaderValue                |
      | Content-Type  | text/html; charset=UTF-8   |
      | Server        | Bizom                      |
      | Connection    | keep-alive                 |
    And verify response time is less than "1200" milliseconds
    And I store the response as "Beats" name using full path


  @BeatsNoParam
  Scenario: TC_02 Beats  - removal of parameters
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getBeats" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | Response.Result  | "false"   |
    And verify response headers
      | HeaderName    | HeaderValue                |
      | Content-Type  | text/html; charset=UTF-8   |
      | Server        | Bizom                      |
      | Connection    | keep-alive                 |
    And verify response time is less than "1200" milliseconds
    And I store the response as "Beats" name using full path


  @BeatsNoAuth
  Scenario: TC_03 Beats -  no auth case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getBeats" endpoint with query parameters
      |QueryParamName|QueryParamValue               |
      |startseq      |0                             |
      |endseq        |10                            |
      |datetyp       |modified                      |
      |fromdate      |2019-03-03                    |
      |todate        |2022-03-03                    |
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      | JPath              | Value                            |
      | error              | invalid_request                  |
      | error_description  | The access token was not found.  |
    And verify response headers
      | HeaderName    | HeaderValue                |
      | Content-Type  | text/html; charset=UTF-8   |
      | Server        | Bizom                      |
      | Connection    | keep-alive                 |
    And verify response time is less than "1200" milliseconds
    And I store the response as "Beats" name using full path