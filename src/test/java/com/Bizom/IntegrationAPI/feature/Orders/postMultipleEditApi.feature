@MultipleEditOrders @Sanity @All @Execution @allPost
Feature: This feature file contains testcases for POST endpoint orders/multipleEditApi

  # @MultipleEditOrders_Positive
  # Scenario: TC_01 multipleEditApi - positive case
  #   Given I set up base URI for transactions
  #   When I set up request specification
  #     |HeaderName|HeaderValue|
  #     |Content-Type|application/json|
  #     |Accept|*/*|
  #     |Accept-Encoding|gzip,deflate, br|
  #     |Connection|keep-alive|
  #   And I post the request with "postMultipleEditApi" payload with dynamic access token and query parameters
  #     |QueryParamName|QueryParamValue|
  #     |access_token |ACCESS_TOKEN |
  #   Then I should see the response code as "200"
  #   And verify response time is less than "1500" milliseconds

  @MultipleEditOrders_InvalidToken
  Scenario: TC_02 multipleEditApi - invalid token
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I post the request with "postMultipleEditApi" payload with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token |invalidToken |
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      | JPath               | Value                      |
      | $.error             | invalid_grant           |
      | $.error_description | The access token provided is invalid. |
    And verify response time is less than "1500" milliseconds

  @MultipleEditOrders_MissingBody
  Scenario: TC_03 multipleEditApi - missing body
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I post the request with "postMultipleEditApi" payload with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value        |
      | $.Result   | false  |
    And verify response time is less than "1200" milliseconds