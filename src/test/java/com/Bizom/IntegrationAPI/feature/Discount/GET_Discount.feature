@Discounts @Sanity @All @allGet @Execution
Feature: This feature file is of the testcases of GET end point of list discounts

#-------------------------------------------------------------------------------------------------

  @test1
  Scenario: TC_01 get discount positive
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

    And I send the GET request to "list_discount" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|2020-03-01|
      |todate|2022-12-30|

    And the fields in response should match with expected values
      |JPath        |Value|
      |$.Discounts[0].Discount.id|"1"|
      |$.Result|"true"|

    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

    And verify response time is less than "12000" milliseconds

    Then I should see the response code as "200"
    And I store the response as "discountList" name using xml full path

#-------------------------------------------------------------------------------------------------

  @test2
  Scenario: TC_02 query parameters is missing
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "list_discount" endpoint

    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.error          |"invalid_request"|

    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

    And verify response time is less than "2000" milliseconds

    Then I should see the response code as "401"
    And I store the response as "discountList" name using full path

#-------------------------------------------------------------------------------------------------

  @test3
  Scenario: TC_03 path is wrong
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

    And I send the GET request to "list_discount_neg" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|2020-03-01|
      |todate|2022-12-30|
    Then I should see the response code as "404"
    And I store the response as "discountList" name using full path

#-------------------------------------------------------------------------------------------------

  @test4
  Scenario: TC_04 access token is missing
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "list_discount" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |fromdate|2020-03-01|
      |todate|2022-12-30|

    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.error          |"invalid_request"|

    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Server      |Bizom                   |
      |Transfer-Encoding|chunked                 |
      |Connection       |keep-alive              |
      |X-XSS-Protection |1; mode=block           |

    Then I should see the response code as "401"
    And I store the response as "discountList" name using full path
