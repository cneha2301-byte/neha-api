@UserTarget @sanity @all @allGet @Execution

Feature: This feature file is of the testcases of GET end point of user target api.

  @test1
  Scenario: TC_01 - GET User Target - Positive Case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "user_target" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN|
      |fromdate      |2020-03-07                              |
      |todate        |2025-01-10                              |
      |responseType  |xml                                     |
    Then I should see the response code as "200"
    And I store the response as "user_target" name using xml full path
    And Validating fields in XML response should match with expected values
      |xmlPathHeader            |xmlValue          |
      |Response.Result  |0           |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "1200" milliseconds


  @test2
  Scenario: TC_02 - GET User Target - Negative Case - removal of parameters
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "user_target" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN|
    Then I should see the response code as "200"
    And I store the response as "user_target" name using full path
    And the fields in response should match with expected values
      |JPath     |Value          |
      |$.result  |false          |
      |$.reason  |"No data found"|
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "1200" milliseconds


  @test3
  Scenario: TC_03 - GET User Target - Negative Case - removal of access token
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "user_target" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |fromdate      |2020-03-07                              |
      |todate        |2025-01-10                              |
      |responseType  |xml                                     |
    Then I should see the response code as "401"
    And I store the response as "user_target" name using full path
    And the fields in response should match with expected values
      |JPath               |Value           |
      |$.error             |"invalid_request"|
      |$.error_description |"The access token was not found."        |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "1200" milliseconds
