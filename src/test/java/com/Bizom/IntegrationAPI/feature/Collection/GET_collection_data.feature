@CollectionData @sanity @all @allGet @Execution

Feature: This feature file is of the testcases of GET end point of collection data.


  @test1
  Scenario: TC_01 - GET Collection Data - Positive Case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "collection_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token  |ACCESS_TOKEN   |fromdate|2024-01-01|
      |              |               |todate  |2025-04-25|
      |              |               |startseq|0         |
      |              |               |endseq  |10        |
    Then I should see the response code as "200"
    And I store the response as "collectionData" name using full path
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |"true"           |
      |$.Collections[0].id|"2055"        |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "2000" milliseconds


  @test2
  Scenario: TC_02 - GET Collection Data - Negative Case - removal of parameters
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "collection_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token  |ACCESS_TOKEN   |fromdate| |
      |              |               |todate  ||
      |              |               |startseq|       |
      |              |               |endseq  |       |
    Then I should see the response code as "200"
    And I store the response as "collectionData" name using full path
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result  |false          |
      |$.Reason  |"Invalid request"        |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "1200" milliseconds


  @test3
  Scenario: TC_03 - GET Collection Data - Negative Case - removal of access token
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "collection_data" endpoint with path parameters
      |Path|Value|
      |fromdate|2024-01-01|
      |todate  |2025-04-25|
      |startseq|0         |
      |endseq  |10        |
    Then I should see the response code as "401"
    And I store the response as "collectionData" name using full path
    And the fields in response should match with expected values
      |JPath           |Value           |
      |$.error  |"invalid_request"|
      |$.error_description |"The access token was not found."        |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "1200" milliseconds