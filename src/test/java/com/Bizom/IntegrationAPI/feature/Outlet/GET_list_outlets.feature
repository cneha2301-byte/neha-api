@ListOutlets @sanity @all @allGet @Execution

Feature: This feature file is for the testcases of Counter Sales API.

  @test1
  Scenario: TC_01 - List Outlets for Warehouse - Positive Case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "list_outlets" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token  |ACCESS_TOKEN                            |fromdate|2020-01-25|
      |responseType  |json                                    |todate  |2020-07-02|
      |              |                                        |startseq|0         |
      |              |                                        |endseq  |100       |
      |              |                                        |warehouse_id|0     |
      |              |                                        |responsetype|json  |
    Then I should see the response code as "200"
    And I store the response as "outletsList" name using full path
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |true           |
      |$.Outlets[0].id  |"11"           |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "1200" milliseconds

    @test2
    Scenario: TC_02 - List Outlets for Warehouse - Negative Case - removal of parameters
      Given I set up base URI for transactions
      When I set up request specification
        |HeaderName|HeaderValue|
        |Accept|*/*|
        |Accept-Encoding|gzip,deflate, br|
        |Connection|keep-alive|
      And I send the GET request to "list_outlets" endpoint with dynamic access token, path and query parameters
        |QueryParamName|QueryParamValue|Path|Value|
        |access_token  |ACCESS_TOKEN                            |fromdate|          |
        |              |                                        |todate  |          |
        |              |                                        |startseq|          |
        |              |                                        |endseq  |          |
        |              |                                        |warehouse_id|      |
        |              |                                        |responsetype|      |
      Then I should see the response code as "200"
      And I store the response as "outletsList" name using full path
      And the fields in response should match with expected values
        |JPath              |Value          |
        |$.result           |false          |
        |$.reason           |"No Data Found"             |
      And verify response headers
        |HeaderName|HeaderValue|
        |Content-Type|text/html; charset=UTF-8|
      And verify response time is less than "1200" milliseconds

  @test3
  Scenario: TC_03 - List Outlets for Warehouse - Negative Case - removal of accesstoken
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "list_outlets" endpoint with query and path parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |responseType  |json           |fromdate|2020-01-25|
      |              |               |todate  |2020-07-02|
      |              |               |startseq|0         |
      |              |               |endseq  |100       |
      |              |               |warehouse_id|0     |
      |              |               |responsetype|json  |
    Then I should see the response code as "401"
    And I store the response as "outletsList" name using full path
    And the fields in response should match with expected values
      |JPath               |Value           |
      |$.error             |"invalid_request"|
      |$.error_description |"The access token was not found."        |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "1200" milliseconds

    # todo: Work on the part of removal of headers

