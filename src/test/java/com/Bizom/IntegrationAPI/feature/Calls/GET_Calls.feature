@Calls @Sanity @All @allGet @Execution
Feature: This feature file is of the testcases of GET end point of list calls

#-------------------------------------------------------------------------------------------------
  @test1
  Scenario: TC_01 get calls positive
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

    And I send the GET request to "list_calls" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |fromdate|2025-06-01|
      |todate|2025-09-16|
      |startseq|0|
      |endseq|5|
      |responsetype|xml|
      |access_token|ACCESS_TOKEN|

    And Validating fields in XML response should match with expected values
      |xmlPathHeader|xmlValue|
      |Response.Result|true|

    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

    And verify response time is less than "2000" milliseconds

    Then I should see the response code as "200"
    And I store the response as "callsList" name using xml full path

#-------------------------------------------------------------------------------------------------

  @test2
  Scenario: TC_02 query parameters is missing
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "list_calls" endpoint

    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.error          |"invalid_request"|

    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

    And verify response time is less than "2000" milliseconds

    Then I should see the response code as "401"
    And I store the response as "callsList" name using full path

#-------------------------------------------------------------------------------------------------

  @test3
  Scenario: TC_03 path is wrong
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

    And I send the GET request to "list_calls_neg" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |fromdate|2015-06-01|
      |todate|2025-06-16|
      |startseq|0|
      |endseq|2|
      |responsetype|xml|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "404"
    And I store the response as "callsList" name using full path

#-------------------------------------------------------------------------------------------------

  @test4
  Scenario: TC_04 access token is missing
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

    And I send the GET request to "list_calls" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |fromdate|2015-06-01|
      |todate|2025-06-16|
      |startseq|0|
      |endseq|2|
      |responsetype|xml|

    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.error          |"invalid_request"|

    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

    And verify response time is less than "2000" milliseconds


    Then I should see the response code as "401"
    And I store the response as "callsList" name using full path
