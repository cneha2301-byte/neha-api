@SalesReturnGET @Sanity @All @allGet @Execution
Feature: This feature file is of the testcases of GET end point of list counter sales

  #-------------------------------------------------------------------------------------------------
  @test1
  Scenario: TC_01 get sale return positive
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

    And I send the GET request to "list_sales_return" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |responsetype|json        |
      |fromdate    |2020-05-28  |
      |todate      |2025-06-28  |
      |startseq    |0           |
      |endseq      |5           |
      |fromtime    |06%3A04%3A00|
      |totime      |21%3A07%3A00|
      |is_primary  |1           |
      |groupbytransactions|1    |
    #Need to check. the response is giving cake error
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true          |

    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

    And verify response time is less than "2000" milliseconds

    Then I should see the response code as "200"
    And I store the response as "salesReturnList" name using xml full path

#-------------------------------------------------------------------------------------------------

  @test2
  Scenario: TC_02 query parameters is missing
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

    And I send the GET request to "list_sales_return" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|

    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    #getting cake error need to confirm it's a bug or issue
    And the fields in response should match with expected values
      |JPath        |Value|
      |result|false       |
      |reason|No data found|

    And verify response time is less than "2500" milliseconds

    Then I should see the response code as "200"
    And I store the response as "salesReturnList" name using full path

#-------------------------------------------------------------------------------------------------

  @test3
  Scenario: TC_03 access token is missing
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

    And I send the GET request to "list_sales_return" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |responsetype|json             |
      |fromdate    |2011-05-28       |
      |todate      |2011-06-28       |
      |startseq    |0                |
      |endseq      |0                |
      |fromtime    |06%3A04%3A00     |
      |totime      |21%3A07%3A00     |
      |is_primary  |1                |
      |groupbytransactions|1         |

    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.error          |"invalid_request"|

    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

    And verify response time is less than "2000" milliseconds

    Then I should see the response code as "401"
    And I store the response as "salesReturnList" name using full path




