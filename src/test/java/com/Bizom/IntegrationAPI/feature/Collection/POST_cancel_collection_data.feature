@CancelCollectionData @all @sanity @Execution @allPost

Feature: This feature file is of the testcases of POST API end points of cancel collection.

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values in "add_collection_background" payload
      |JPath             |
      |$[0].transactionid|
    And I post the request with "add_collection_background" payload with dynamic access token and query parameters
      |Query       |Value       |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |true           |
      |$.Data[0].reason    |"Collection done successfully."|
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "2000" milliseconds
    And I store the "$.[0].transactionid" from the previous request body of "add_collection_background" request in new request body of "cancel_collection_data" in "$.transactionIds[0]" jpath the chain as an input

  @test1
  Scenario: TC_01 - Cancel Collection Data - Positive Case
    And I post the request with "cancel_collection_data" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN                 |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |true           |
      |$.Reason    |"All selected collections cancelled successfully."|
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "2500" milliseconds

  @test2
  Scenario: TC_02 - Cancel Collection Data - Negative Case - Same Transaction ID
    And I post the request with "cancel_collection_data" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN                 |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |true           |
      |$.Reason    |"All selected collections cancelled successfully."|
    And I post the request with "cancel_collection_data" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN                 |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |false          |
      |$.Reason         |"Some of the selected collections were not cancelled. Please try again."|
      |$.reasonArray[0].Reason | "Order is already cancelled"                                       |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "2500" milliseconds

  @test3
  Scenario: TC_03 - Cancel Collection Data - Negative Case - Empty Transaction ID
    And I modify fields with values and fields with random values in "cancel_collection_data" payload
      |JPath            |Value          |
      |$.transactionIds[0] |            |
    And I post the request with "cancel_collection_data" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN                 |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |false          |
      |$.Reason         |"Some of the selected collections were not cancelled. Please try again."|
      |$.reasonArray[0].Reason | "Invalid data"                                                     |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "1200" milliseconds