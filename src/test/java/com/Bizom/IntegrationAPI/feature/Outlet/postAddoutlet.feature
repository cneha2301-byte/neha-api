@AddOrders @Sanity @All @Execution @allPost
Feature: This feature file is of the testcases of POST  end point of Add Outlet Api
  @AddOutlet
  Scenario: TC_01 add outlet -  positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I modify fields with random values and remove fields in "postAddoutlet" XML payload
      |XPath                      |Value            |
      |/Outlets/Outlet/erp_id| randomAlphaNum |
    And I post the request with "postAddoutlet" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader|xmlValue|
      |Outlets.Result   |true |
      |Outlets.Reason  | Outlet added successfully |
    And verify response time is less than "2500" milliseconds

