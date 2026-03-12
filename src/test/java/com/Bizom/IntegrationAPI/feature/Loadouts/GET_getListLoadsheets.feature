@ListLoadsheets @Sanity @All @allGet
Feature: This feature file is of the testcases of GET end point of list loadsheets

  @ListLoadsheetsPositive
  Scenario: TC_01 List loadsheets -  positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getListLoadsheets" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue                           |Path          |Value         |
      |access_token  |ACCESS_TOKEN                               |type           |xml     |
      |fromdate      |2023-01-01                                |               |        |
      |todate        |2025-06-30                                |            |       |

    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader    | xmlValue        |
      | Response.Result  | 1   |
    And verify response headers
      | HeaderName    | HeaderValue        |
      | Content-Type  | text/html; charset=UTF-8   |
      | Server        | Bizom            |
      | Connection    | keep-alive       |
    And verify response time is less than "1900" milliseconds
    And I store the response as "listloadsheets" name using xml full path

  @ListLoadsheetsNoParam
  Scenario: TC_02 List loadsheets -  no param
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getListLoadsheets_NoParams" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response headers
      | HeaderName    | HeaderValue        |
      | Content-Type  | text/html; charset=UTF-8   |
      | Server        | Bizom            |
      | Connection    | keep-alive       |
    And verify response time is less than "1900" milliseconds
    And I store the response as "listloadsheets" name using full path

  @ListLoadsheetsNoAuth
  Scenario: TC_03 list load sheets -  no auth case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getListLoadsheets" endpoint with query and path parameters
      |QueryParamName|QueryParamValue                           |Path           |Value   |
      |fromdate      |2023-01-01                                |type               |xml        |
      |todate        |2025-06-30                                |             |      |
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
    And verify response time is less than "1900" milliseconds
    And I store the response as "listloadsheets" name using full path