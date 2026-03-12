@SchemesGET @Sanity @All @allGet @Execution
Feature: This feature file is of the testcases of GET end point of list scheme master

  #-------------------------------------------------------------------------------------------------
  @test1
  Scenario: TC_01 get scheme master positive
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

    And I send the GET request to "list_scheme_master" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |fromdate    |2011-05-28       |
      |todate      |2011-06-28       |
      |responsetype|xml             |
      |startseq    |0                |
      |endseq      |10               |
      |access_token|ACCESS_TOKEN|

    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

    #And Validating fields in XML response should match with expected values
     # |xmlPathHeader|xmlValue|
     # |response.reason|Invalid schemeId|

    And verify response time is less than "2000" milliseconds

    Then I should see the response code as "200"
    And I store the response as "schemeMasterList" name using xml full path

#-------------------------------------------------------------------------------------------------

  @test2
  Scenario: TC_02 query parameters is missing
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

    And I send the GET request to "list_scheme_master" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|

    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|false          |
      |$.Response.Reason|"Invalid schemeId"|

    And verify response time is less than "2000" milliseconds

    Then I should see the response code as "200"
    And I store the response as "schemeMasterList" name using full path

#-------------------------------------------------------------------------------------------------

  @test3
  Scenario: TC_03 access token is missing
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

    And I send the GET request to "list_scheme_master" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |fromdate    |2011-05-28       |
      |todate      |2011-06-28       |
      |responsetype|xml             |
      |startseq    |0                |
      |endseq      |10               |

    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.error          |"invalid_request"|

    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

    And verify response time is less than "2000" milliseconds

    Then I should see the response code as "401"
    And I store the response as "schemeMasterList" name using full path




