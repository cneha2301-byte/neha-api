@Pjp @Sanity @All @allGet
Feature: This feature file is of the testcases of GET end point of Product Master Api
  @PjpPositive
Scenario: TC_01 Pjp -  positive case
Given I set up base URI for transactions
When I set up request specification
|HeaderName|HeaderValue|
|Accept|*/*|
|Accept-Encoding|gzip,deflate, br|
|Connection|keep-alive|
    And I send the GET request to "getPjp" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue                           |
      |access_token  |ACCESS_TOKEN  |
|responsetype  |xml                                          |
|fromdate      |2022-01-01                          |
|todate        |2023-02-15      |
|startseq      |0                                         |
|endseq      |1                                          |

Then I should see the response code as "200"
And Validating fields in XML response should match with expected values
| xmlPathHeader         | xmlValue       |
| Response.Result  |true|

And verify response headers
| HeaderName    | HeaderValue        |
| Content-Type  | text/html; charset=UTF-8   |
| Server        | Bizom            |
| Connection    | keep-alive       |
And verify response time is less than "1200" milliseconds
And I store the response as "Pjp" name using full path

  @PjpNopParam
  Scenario: TC_02 pjp -  no param
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getPjp" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response headers
      | HeaderName    | HeaderValue        |
      | Content-Type  | text/html; charset=UTF-8   |
      | Server        | Bizom            |
      | Connection    | keep-alive       |
    And verify response time is less than "1300" milliseconds
    And I store the response as "Pjp" name using full path

  @PjpNoAuth
  Scenario: TC_02 Pjp -  No Auth
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getPjp" endpoint with query parameters
      |QueryParamName|QueryParamValue                           |
      |responsetype  |xml                                          |
      |fromdate      |2022-01-01                          |
      |todate        |2023-02-15      |
      |startseq      |0                                         |
      |endseq      |1                                          |

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
    And verify response time is less than "3000" milliseconds
    And I store the response as "Pjp" name using xml full path