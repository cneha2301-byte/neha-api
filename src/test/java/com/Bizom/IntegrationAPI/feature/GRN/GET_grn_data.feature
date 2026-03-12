@GRNData @sanity @all @allGet @Execution

Feature: This feature file is of the testcases of GET end point of GRN data api.

  @test1
  Scenario: TC_01 - GET GRN Data - Positive Case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "grn_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN                            |
      |fromdate      |2020-03-07                              |
      |todate        |2020-03-07                              |
      |responsetype  |json                                    |
      |startseq      |0                                       |
      |endseq        |1                                       |
    Then I should see the response code as "200"
    And I store the response as "grn_data" name using full path
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.result         |false          |
      |$.reason         |"No data found."|
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "1200" milliseconds