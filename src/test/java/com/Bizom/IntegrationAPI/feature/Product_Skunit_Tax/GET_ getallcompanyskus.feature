@Products @Sanity @All @allGet
Feature: This feature file is of the testcases of GET end point of list all company sku

  @ProductsPositive
  Scenario: TC_01 products -  positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getallcompanyskus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue                           |
      |access_token  |ACCESS_TOKEN  |
      |startseq      |0                             |
      |endseq        |10                  |
      |datetype       |modified                                          |
      |fromdate      |2019-03-03                                          |
      |todate        |2022-03-03                                          |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath         | Value        |
      | $.Result  | "true"   |
    And verify response headers
      | HeaderName    | HeaderValue        |
      | Content-Type  | text/html; charset=UTF-8   |
      | Server        | Bizom            |
      | Connection    | keep-alive       |
    And verify response time is less than "1200" milliseconds
    And I store the response as "skuList" name using full path


  @ProductsNoParam
  Scenario: TC_02 Products  - removal of parameters
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getallcompanyskus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath         | Value        |
      | $.Result  |"true"|
    And verify response headers
      | HeaderName    | HeaderValue        |
      | Content-Type  | text/html; charset=UTF-8   |
      | Server        | Bizom            |
      | Connection    | keep-alive       |
    And verify response time is less than "1200" milliseconds
    And I store the response as "skuList" name using full path


  @ProductsNoAuth
  Scenario: TC_03 products -  no auth case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getallcompanyskus" endpoint with query parameters
      |QueryParamName|QueryParamValue                           |
      |startseq      |0                             |
      |endseq        |10                  |
      |datetyp       |modified                                          |
      |fromdate      |2019-03-03                                          |
      |todate        |2022-03-03                                          |
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
    And I store the response as "skuList" name using full path

  @ProductsStartSeqwith20+
  Scenario: TC_04 products -  get the API with start seq with 20+ number
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getallcompanyskus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
      |startseq      |20            |
      |endseq        |100       |
      |datetype       |modified  |
      |fromdate      |2019-03-03 |
      |todate        |2025-03-03 |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath         | Value        |
      | Result  | "false" |
      |Reason   | "No Data Found"|
    And verify response headers
      | HeaderName    | HeaderValue        |
      | Content-Type  | text/html; charset=UTF-8   |
      | Server        | Bizom            |
      | Connection    | keep-alive       |
    And verify response time is less than "1200" milliseconds
    And I store the response as "skuList" name using full path

  @ProductsWithInvalidAccessToken
  Scenario: TC_05 products -  get API with Invalid access_token
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getallcompanyskus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |randomString  |
      |startseq      |0 |
      |endseq        |10|
      |datetyp       |modified|
      |fromdate      |2019-03-03|
      |todate        |2025-03-03|
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      | JPath         | Value       |
      |$.error          |invalid_grant|
      |$.error_description|The access token provided is invalid.|
    And verify response headers
      | HeaderName    | HeaderValue        |
      | Content-Type  | text/html; charset=UTF-8   |
      | Server        | Bizom            |
      | Connection    | keep-alive       |
    And verify response time is less than "1200" milliseconds
    And I store the response as "getallcompanyskus" name using xml full path

  @ProductsWithWrongURI
  Scenario: TC_06 products -  With wrong Resource URI
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "Invalid_getallcompanyskus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
      |startseq      |0 |
      |endseq        |10|
      |datetyp       |modified|
      |fromdate      |2019-03-03|
      |todate        |2025-03-03|
    Then I should see the response code as "404"
    And verify response headers
      | HeaderName    | HeaderValue        |
      | Content-Type  | text/html; charset=UTF-8   |
      | Server        | Bizom            |
      | Connection    | keep-alive       |
    And verify response time is less than "1200" milliseconds

  @ProductsWithToDateAndFromDateMakeAsFutureDate
  Scenario: TC_07 products -  get the API with todate and fromdate make as future date from todays date
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getallcompanyskus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
      |startseq      |20            |
      |endseq        |100       |
      |datetype       |modified  |
      |fromdate      |2030-03-03 |
      |todate        |2035-03-03 |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath         | Value        |
      | Result  | "false" |
      |Reason   | "No Data Found"|
    And verify response headers
      | HeaderName    | HeaderValue        |
      | Content-Type  | text/html; charset=UTF-8   |
      | Server        | Bizom            |
      | Connection    | keep-alive       |
    And verify response time is less than "1200" milliseconds