@Credit_Debit @Sanity @All @allGet
Feature: This feature file is of the testcases of GET end point of list all company sku

  @Credit_DebitPositive
  Scenario: TC_01 Credit_Debit  -  positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName     |HeaderValue     |
      |Accept         |*/*             |
      |Accept-Encoding|gzip,deflate, br|
      |Connection     |keep-alive      |
    And I send the GET request to "getCreditOrDebitNote" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue                           |
      |fromdate      |2017-04-04                                |
      |todate        |2025-12-20                                |
      |type          |debit                                     |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath         | Value    |
      | $.Result      | true   |
    And verify response headers
      | HeaderName    | HeaderValue                |
      | Content-Type  | text/html; charset=UTF-8   |
      | Server        | Bizom                      |
      | Connection    | keep-alive                 |
    And verify response time is less than "1500" milliseconds
    And I store the response as "Credit_Debit " name using full path


  @Credit_DebitNoParam
  Scenario: TC_02 Credit_Debit   - removal of parameters
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName     |HeaderValue     |
      |Accept         |*/*             |
      |Accept-Encoding|gzip,deflate, br|
      |Connection     |keep-alive      |
    And I send the GET request to "getCreditOrDebitNote" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response headers
      | HeaderName    | HeaderValue                |
      | Content-Type  | text/html; charset=UTF-8   |
      | Server        | Bizom                      |
      | Connection    | keep-alive                 |
    And verify response time is less than "1200" milliseconds
    And I store the response as "Credit_Debit" name using full path


  @Credit_DebitNoAuth
  Scenario: TC_03 Credit_Debit  -  no auth case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName     |HeaderValue     |
      |Accept         |*/*             |
      |Accept-Encoding|gzip,deflate, br|
      |Connection     |keep-alive      |
    And I send the GET request to "getCreditOrDebitNote" endpoint with query parameters
      |QueryParamName|QueryParamValue |
      |startseq      |0               |
      |endseq        |10              |
      |datetyp       |modified        |
      |fromdate      |2019-03-03      |
      |todate        |2022-03-03      |
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      | JPath                | Value                             |
      | $.error              | invalid_request                   |
      | $.error_description  | The access token was not found.   |
    And verify response headers
      | HeaderName    | HeaderValue               |
      | Content-Type  | text/html; charset=UTF-8  |
      | Server        | Bizom                     |
      | Connection    | keep-alive                |
    And verify response time is less than "1200" milliseconds
    And I store the response as "Credit_Debit" name using full path