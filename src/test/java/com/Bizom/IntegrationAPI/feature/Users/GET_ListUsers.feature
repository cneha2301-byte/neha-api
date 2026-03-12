@Users @Sanity @All @allGet
Feature: This feature file is of the testcases of GET end point of list Users

  @UsersPositive
  Scenario: TC_01 User orders - status code positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      And I send the GET request to "getListUsers" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue                           |Path          |Value         |
      |access_token  |ACCESS_TOKEN                              |startDate     |2014-01-25    |
      |              |                                          |endDate       |2029-12-31    |
      |              |                                          |h1            |0             |
      |              |                                          |h2            |1             |
      |              |                                          |h3            |470212        |
      |              |                                          |h4            |responsetype  |
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
    And I store the response as "userList" name using full path

  @UsersNoParam
  Scenario: TC_02 User orders - removal of parameters
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "list_users_positive_withoutPath" endpoint
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
    And I store the response as "userList" name using full path

  @UsersNoAuth
  Scenario: TC_04 User orders - removal of authorisation
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getListUsers" endpoint with path parameters
      |Path          |Value         |
      |startDate     |2014-01-25    |
      |endDate       |2029-12-31    |
      |h1            |0             |
      |h2            |1             |
      |h3            |470212        |
      |h4            |responsetype  |
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
    And I store the response as "userList" name using full path


