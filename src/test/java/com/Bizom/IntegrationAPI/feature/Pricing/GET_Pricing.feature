@EntityPricingApproval @All @Sanity @allGet @Execution
Feature: This feature file is of the testcases of GET end point of list entity pricing approvals

#-------------------------------------------------------------------------------------------------
  @test1
  Scenario: TC_01 get pricing positive
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "list_pricing" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|

    And the fields in response should match with expected values
      |JPath            |Value          |
      |Result           | true          |
      |Reason           |"Data Found"   |

    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

    And verify response time is less than "5000" milliseconds

    Then I should see the response code as "200"
    And I store the response as "pricingList" name using xml full path

#-------------------------------------------------------------------------------------------------

  @test2
  Scenario: TC_03 path is wrong
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

    And I send the GET request to "list_pricing_neg" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "404"
    And I store the response as "pricingList" name using full path

#-------------------------------------------------------------------------------------------------

  @test3
  Scenario: TC_04 access token is missing
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

    And I send the GET request to "list_pricing" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|

    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.error          |"invalid_request"|

    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

    And verify response time is less than "2000" milliseconds

    Then I should see the response code as "401"
    And I store the response as "pricingList" name using full path
