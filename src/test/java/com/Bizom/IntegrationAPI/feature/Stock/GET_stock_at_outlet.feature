@StockAtOutlet @sanity @all @allGet

Feature: This feature file is of the testcases of GET end point of stock at outlet api.

  // This test gives an error 404 not found as the stock outlet controller is not found in the php.

  @test1
  Scenario: TC_01 - GET Stock at Outlet - Positive Case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "stock_at_outlet" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |31ad4c23ecde2ff5e3eb8e4f13091a8b6adba97f|
      |fromdate      |2020-03-07                              |
      |todate        |2025-01-10                              |
      |responseType  |xml                                     |
      |startseq      |0                                       |
      |endseq        |99                                      |
    Then I should see the response code as "200"
    And I store the response as "stock_at_outlet" name using xml full path
    And Validating fields in XML response should match with expected values
      |xmlPathHeader            |xmlValue          |
      |Response.Result  |true           |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "1200" milliseconds
