@SalesGET @Sanity @All @allGet @Execution
Feature: This feature file is of the testcases of GET end point of list secondary sales

  #-------------------------------------------------------------------------------------------------
  @test1
  Scenario: TC_01 get secondary sales positive
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "list_secondary_sales" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startseq    |0           |
      |endseq      |1000        |
      |fromdate    |2022-07-19  |
      |todate      |2022-07-19  |
      |responsetype|json        |
      |datetype    |created     |
      |fromtime    |10%3A08%3A46|
      |totime      |16%3A08%3A46|
      |ordertype   |primary     |
      |invoiceStatus|all        |
      #all responce is coming as no data found so later will add validation part
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

    And verify response time is less than "5000" milliseconds

    Then I should see the response code as "200"
    And I store the response as "secondarySalesList" name using xml full path

#-------------------------------------------------------------------------------------------------

  @test2
  Scenario: TC_02 query parameters is missing
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

    And I send the GET request to "list_secondary_sales" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|

    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

    And verify response time is less than "2000" milliseconds

    Then I should see the response code as "200"
    And I store the response as "secondarySalesList" name using full path

#-------------------------------------------------------------------------------------------------

  @test3
  Scenario: TC_04 access token is missing
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

    And I send the GET request to "list_secondary_sales" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |startseq    |0                |
      |endseq      |1000             |
      |fromdate    |2022-07-19       |
      |todate      |2022-07-19       |
      |responsetype|json             |
      |datetype    |created          |
      |fromtime    |10%3A08%3A46     |
      |totime      |16%3A08%3A46     |
      |ordertype   |primary          |
      |invoiceStatus|all             |

    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.error          |"invalid_request"|

    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

    And verify response time is less than "2000" milliseconds

    Then I should see the response code as "401"
    And I store the response as "secondarySalesList" name using full path




