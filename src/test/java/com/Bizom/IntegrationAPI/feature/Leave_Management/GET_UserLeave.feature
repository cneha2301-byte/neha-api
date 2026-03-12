@LeaveManagement @All @Sanity @allGet @Execution
Feature: This feature file is of the testcases of GET end point of list user leaves

#-------------------------------------------------------------------------------------------------
  @test1
  Scenario: TC_01 get user leaves positive
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

    And I send the GET request to "list_user_leaves" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |              |               |fromdate|2022-01-01|
      |              |               |todate|2022-04-19|
      |              |               |startseq|0|
      |              |               |endseq|1000|
      |              |               |responsetype|json|
      |access_token  |ACCESS_TOKEN   |            ||
      |status        |approved       |            ||
      |action        |debit          |            ||
      |user_id       |19             |            ||
      |dataType      |created        |            ||

    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

    And verify response time is less than "3000" milliseconds

    Then I should see the response code as "200"
    And I store the response as "userLeavesList" name using xml full path

#-------------------------------------------------------------------------------------------------

  @test2
  Scenario: TC_02 query parameters is missing
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

    And I send the GET request to "list_user_leaves_no_params" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN|


    #And Validating fields in XML response should match with expected values
     # |xmlPathHeader|xmlValue|
     # |error        |invalid_request|
     # |error_description|The access token was not found|

    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

    And verify response time is less than "2000" milliseconds

    Then I should see the response code as "200"
    And I store the response as "userLeavesList" name using full path

#-------------------------------------------------------------------------------------------------

  @test3
  Scenario: TC_03 access token is missing
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

    And I send the GET request to "list_user_leaves" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |              |               |fromdate|2022-01-01|
      |              |               |todate|2022-04-19|
      |              |               |startseq|0|
      |              |               |endseq|1000|
      |              |               |responsetype|json|
      |status        |approved                                |||
      |action        |debit                                   |||
      |user_id       |19                                      |||
      |dataType      |created                                 |||

    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.error          |"invalid_request"|

    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

    And verify response time is less than "2000" milliseconds


    Then I should see the response code as "401"
    And I store the response as "userLeavesList" name using full path



