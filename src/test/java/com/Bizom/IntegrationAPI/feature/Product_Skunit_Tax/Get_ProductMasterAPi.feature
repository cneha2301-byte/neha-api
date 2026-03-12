@ProductsMasterApi @Sanity @All @allGet
Feature: This feature file is of the testcases of GET end point of Product Master Api

  @ProductsMasterApiPositive
  Scenario: TC_01 products -  positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "Product_Master_API" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue                           |
      |access_token  |ACCESS_TOKEN  |
      |fromdate      |2020-03-03                           |
      |todate        |2025-03-03      |
      |datetype      |modified                                          |
      |responsetype  |xml                                          |
      |startseq      |0                                         |
      |endseq      |4                                          |
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
    And I store the response as "ProductsMasterApi" name using xml full path

  @ProductsMasterApiNopParam
  Scenario: TC_02 products -  no param
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "Product_Master_API" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response headers
      | HeaderName    | HeaderValue        |
      | Content-Type  | text/html; charset=UTF-8   |
      | Server        | Bizom            |
      | Connection    | keep-alive       |
    And verify response time is less than "1200" milliseconds
    And I store the response as "ProductsMasterApi" name using full path

  @ProductsNoAuth
  Scenario: TC_03 products -  no auth case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "Product_Master_API" endpoint with query parameters
      |QueryParamName|QueryParamValue                           |
      |fromdate      |2020-03-03                           |
      |todate        |2025-03-03      |
      |datetype      |modified                                          |
      |responsetype  |xml                                          |
      |startseq      |0                                         |
      |endseq      |4                                          |
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
    And I store the response as "ProductsMasterApi" name using full path

  @ProductsMasterApiWithoutSeq
  Scenario: TC_04 products -  get API with out start seq and end seq
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "Product_Master_API" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue |
      |access_token  |ACCESS_TOKEN  |
      |fromdate      |2020-03-03 |
      |todate        |2025-03-03 |
      |datetype      |modified |
      |responsetype  |xml |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader         | xmlValue       |
      | Response.Result  |false|
      | Response.Reason  |Warehouse input can not be more than 5|

    And verify response headers
      | HeaderName    | HeaderValue        |
      | Content-Type  | text/html; charset=UTF-8   |
      | Server        | Bizom            |
      | Connection    | keep-alive       |
    And verify response time is less than "1200" milliseconds
    And I store the response as "ProductsMasterApi" name using xml full path

  @ProductsMasterApiWithEndSeqMoreThan5
  Scenario: TC_05 products -  get API with end seq is more than 5
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "Product_Master_API" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue |
      |access_token  |ACCESS_TOKEN  |
      |fromdate      |2020-03-03 |
      |todate        |2025-03-03 |
      |datetype      |modified |
      |responsetype  |xml |
      |startseq      |1 |
      |endseq      |7 |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader         | xmlValue       |
      | Response.Result  |false|
      | Response.Reason  |Warehouse input can not be more than 5|
    And verify response headers
      | HeaderName    | HeaderValue        |
      | Content-Type  | text/html; charset=UTF-8   |
      | Server        | Bizom            |
      | Connection    | keep-alive       |
    And verify response time is less than "1200" milliseconds
    And I store the response as "ProductsMasterApi" name using xml full path

  @ProductsMasterApiWithInvalidAccessToken
  Scenario: TC_06 products -  get API with Invalid access_token
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "Product_Master_API" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue |
      |access_token  |c36f4f64d843e46e006a53ec4d8  |
      |fromdate      |2020-03-03 |
      |todate        |2025-03-03 |
      |datetype      |modified |
      |responsetype  |xml |
      |startseq      |1 |
      |endseq      |4 |
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
    And I store the response as "ProductsMasterApi" name using xml full path

  @ProductsMasterApiwithInvalidURI
  Scenario: TC_07 products -  With wrong Resource URI
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "Invalid_Product_Master_API" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue |
      |access_token  |ACCESS_TOKEN  |
      |fromdate      |2020-03-03|
      |todate        |2025-03-03|
      |datetype      |modified|
      |responsetype  |xml|
      |startseq      |0 |
      |endseq      |4 |
    Then I should see the response code as "404"
    And verify response headers
      | HeaderName    | HeaderValue        |
      | Content-Type  | text/html; charset=UTF-8   |
      | Server        | Bizom            |
      | Connection    | keep-alive       |
    And verify response time is less than "1200" milliseconds