@ListAreas @sanity @all @allGet @Execution

Feature: This feature file is of the testcases of GET end point of list areas.


  @test1
  Scenario: TC_01 List Areas - Positive Case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "list_positive_areas" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |zone|1|
      |responsetype|xml|
      |startseq|0|
      |endseq|100|
      |fromdate|2014-01-01|
      |todate|2020-11-26|
      |null|null|
      |datetype|modified|
    Then I should see the response code as "200"
    And I store the response as "areasList" name using xml full path
    And Validating fields in XML response should match with expected values
      |xmlPathHeader|xmlValue|
      |Response.areas.Zone[0].ZoneName|SOUTH|
      |Response.Result                |1    |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "2500" milliseconds


#  @test2
#  Scenario: TC_02 list areas - negative case - no header
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept    |           |
#      |Connection|           |
#    And I send the GET request to "list_positive_areas" endpoint with query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|a715093da6752e76c45ce1e92afbb3fcc2ce82bb|
#      |zone|1|
#      |responsetype|xml|
#      |startseq|0|
#      |endseq|100|
#      |fromdate|2014-01-01|
#      |todate|2020-11-26|
#      |null|null|
#      |datetype|modified|
#    Then I should see the response code as "400"
#    And I store the response as "areasList" name using full path

  # For this test case, even if we send request for xml response, the error always is in json format, so we need to validate using json path.

  @test3
  Scenario: TC_03 List Areas - Negative Case - removal of parameters
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "list_positive_areas" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN   |
    Then I should see the response code as "200"
    And I store the response as "areasList" name using full path
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |true          |
      |$.areas[0].Zone.ZoneId         |"1"       |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "1200" milliseconds


    # For this test case, even if we send request for xml response, the error always is in json format, so we need to validate using json path.

  @test4
  Scenario: TC_04 List Areas - Negative Case - removal of access token
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "list_positive_areas" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |zone|1|
      |responsetype|json|
      |startseq|"0"|
      |endseq|100|
      |fromdate|2014-01-01|
      |todate|2020-11-26|
      |null|null|
      |datetype|modified|
    Then I should see the response code as "401"
    And I store the response as "areasList" name using full path
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.error          |"invalid_request"|
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "1200" milliseconds


