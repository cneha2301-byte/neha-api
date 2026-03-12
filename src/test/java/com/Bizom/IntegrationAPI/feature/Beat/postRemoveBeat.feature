@RemoveBeat @Sanity @All  @Execution @allPost
Feature: This feature file is of the testcases of post end point of postCreateUsers
  @RemoveBeatPositive
  Scenario: TC_01 RemoveBeat -  positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/xml           |
    And I post the request with "postRemoveBeat" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader         | xmlValue       |
      | Response.Result        |1|
    And verify response time is less than "1500" milliseconds