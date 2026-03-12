@OtherLoadouts @Sanity @All @allGet
Feature: This feature file is of the testcases of GET end point of Other

  @OtherLoadoutsPositive
  Scenario: TC_01 OtherLoadouts -  positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getOtherLoadouts" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue                           |
      |access_token  |ACCESS_TOKEN  |
      |fromdate      |2021-01-17                                          |
      |todate        |2025-01-17                                          |
      |limit        |100                                          |
      |startseq      |0                             |
      |endseq        |9                  |
      |datetype       |created                                          |
      |loadoutstate_id        |3                  |
      |fromtime      |10%3A29%3A31                                          |
      |totime        |12%3A29%3A34                                          |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath         | Value        |
      | $.Result  | true   |
    And verify response headers
      | HeaderName    | HeaderValue        |
      | Content-Type  | text/html; charset=UTF-8   |
      | Server        | Bizom            |
      | Connection    | keep-alive       |
    And verify response time is less than "1200" milliseconds
    And I store the response as "OtherLoadouts" name using full path

  @OtherLoadoutsNoParam
  Scenario: TC_02 Other  - removal of parameters
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getOtherLoadouts" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      | JPath         | Value        |                                 //check
#      | $.Result  |"true"|
    And verify response headers
      | HeaderName    | HeaderValue        |
      | Content-Type  | text/html; charset=UTF-8   |
      | Server        | Bizom            |
      | Connection    | keep-alive       |
    And verify response time is less than "1200" milliseconds
    And I store the response as "OtherLoadouts" name using full path

  @LoadoutsNoAuth
  Scenario: TC_03 OtherLoadouts -  no auth case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getOtherLoadouts" endpoint with query parameters
      |QueryParamName|QueryParamValue                           |
      |fromdate      |2021-01-17                                          |
      |todate        |2025-01-17                                          |
      |limit        |100                                          |
      |startseq      |0                             |
      |endseq        |9                  |
      |datetype       |created                                          |
      |loadoutstate_id        |3                  |
      |fromtime      |10%3A29%3A31                                          |
      |totime        |12%3A29%3A34                                          |
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      | JPath         | Value        |
      | $.error  | invalid_request   |
      | $.error_description  | The access token was not found.   |
    And verify response headers
      | HeaderName    | HeaderValue        |
      | Content-Type  | text/html; charset=UTF-8   |
      | Server        | Bizom            |
      | Connection    | keep-alive       |
    And verify response time is less than "1200" milliseconds
    And I store the response as "OtherLoadouts" name using full path