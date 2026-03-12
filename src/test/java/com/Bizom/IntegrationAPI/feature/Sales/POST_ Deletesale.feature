@sale
Feature: This feature file is of the testcases of Post delete sale

  @SalesPositive @deleteSale
  Scenario: TC_01 Delete Sales -  positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_Deletesale" XML payload
      |XPath       |Value       |
      | /Sale/invoiceid/text() | 388296919000117576645833071 |
    And I post the request with "POST_Deletesale" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN|
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader     | xmlValue    |
      | /Response/Reason  |  388296919000117576645833071 - Invoice Cancelled - 657|
    And verify response time is less than "2500" milliseconds