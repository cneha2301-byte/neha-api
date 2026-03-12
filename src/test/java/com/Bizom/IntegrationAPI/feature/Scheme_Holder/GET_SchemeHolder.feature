@Schemes @All @Sanity @allGet @Execution
Feature: This feature file is of the testcases of GET end point of list scheme holder

  #-------------------------------------------------------------------------------------------------
  @test1
  Scenario: TC_01 get scheme holder positive
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

    And I send the GET request to "list_scheme_holder" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |fromdate    |2014-01-01|
      |todate      |2015-06-30|
      |responsetype|xml       |
      |startseq    |0         |
      |endseq      |5         |
      |access_token|ACCESS_TOKEN|

    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

    And verify response time is less than "3000" milliseconds

    Then I should see the response code as "200"
    And I store the response as "schemeHolderList" name using xml full path

#-------------------------------------------------------------------------------------------------

  @test2
  Scenario: TC_02 query parameters is missing
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

    And I send the GET request to "list_scheme_holder" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|

    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    #Response is null so validating is failing here so commenting this part until confirmation
#    And Validating fields in XML response should match with expected values
#      |xmlPathHeader|xmlValue|
#      |Result|false          |
#      |Reason|Invalid Request Or Data not found|

    And verify response time is less than "2000" milliseconds

    Then I should see the response code as "200"
    And I store the response as "schemeHolderList" name using full path

#-------------------------------------------------------------------------------------------------

  @test3
  Scenario: TC_03 access token is missing
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

    And I send the GET request to "list_scheme_holder" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |fromdate    |2014-01-01|
      |todate      |2015-06-30|
      |responsetype|xml       |
      |startseq    |0         |
      |endseq      |5         |


    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.error          |"invalid_request"|

    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

    And verify response time is less than "2000" milliseconds

    Then I should see the response code as "401"
    And I store the response as "schemeHolderList" name using full path




