@SalesGET @Sanity @All @allGet @Execution
Feature: TC5133 This feature file is of the testcases of GET end point of list Counter sales

  @GetCounterSalesPositive
  Scenario: TC_01 get Counter sales positive
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "get_CounterSales" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |date      |2025-03-20  |
      |responsetype|xml  |

    And Validating fields in XML response should match with expected values
      |xmlPathHeader|xmlValue|
      |Response.Result|true|

    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

    And verify response time is less than "5000" milliseconds
    Then I should see the response code as "200"
    And I store the response as "CounterSales" name using xml full path

  @GetCounterSalesNegative
  Scenario: TC_02 get Counter sales - query parameters is missing
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "get_CounterSales" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |date      |2025-03-20  |

    And the fields in response should match with expected values
      |JPath        |Value|
      |$.Response.Result       |"true"       |
      |$.Response.Reason       |""|

    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

    And verify response time is less than "2000" milliseconds
    Then I should see the response code as "200"
    And I store the response as "CounterSales" name using xml full path

  @GetCounterSalesWithoutAccessToken
  Scenario: TC_03 get Counter sales - With out Access Token
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "get_CounterSales" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |date      |2025-03-20  |
      |responsetype|xml  |

    And the fields in response should match with expected values
      |JPath        |Value|
      |$.error        |invalid_request|

    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

    And verify response time is less than "5000" milliseconds
    Then I should see the response code as "401"
    And I store the response as "CounterSales" name using xml full path