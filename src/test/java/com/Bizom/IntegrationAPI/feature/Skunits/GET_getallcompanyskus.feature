Feature: This feature file is of the testcases of GET end point of list skunits master

  #-------------------------------------------------------------------------------------------------
  @masterskunits
  Scenario: TC_01 get skunits master positive
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

    And I send the GET request to "list_skunits_master" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |fromdate    |2022-05-28       |
      |todate      |2025-09-10     |
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
    And I store the response as "listskunitsmaster" name using xml full path