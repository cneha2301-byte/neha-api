@OutletBalance @All @Sanity @allGet @Execution
Feature: This feature file is of the testcases of GET end point of list all outlet balance

#-------------------------------------------------------------------------------------------------
  @test1
  Scenario: TC_01 get outlet balance positive
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

    And I send the GET request to "list_outlet_balance" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN|
      |startseq      |0    |
      |endseq        |99   |
      |warehouse_erpid|trp133|
      |balanceof      |onlydistributor|

    And the fields in response should match with expected values
      |JPath              |Value          |
      |$.Result           |true          |

    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

    And verify response time is less than "3000" milliseconds

    Then I should see the response code as "200"
    And I store the response as "outletBalanceList" name using xml full path

#-------------------------------------------------------------------------------------------------

  @test2
  Scenario: TC_02 query parameters is missing
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

    And I send the GET request to "list_outlet_balance" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN|

    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

    And verify response time is less than "2000" milliseconds

    Then I should see the response code as "200"
    And I store the response as "outletBalanceList" name using full path

#-------------------------------------------------------------------------------------------------

  @test3
  Scenario: TC_03 access token is missing
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

    And I send the GET request to "list_outlet_balance" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |startseq      |0    |
      |endseq        |99   |
      |warehouse_erpid|111112|
      |balanceof      |onlydistributorw|


    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.error          |"invalid_request"|

    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

    And verify response time is less than "2000" milliseconds


    Then I should see the response code as "401"
    And I store the response as "outletBalanceList" name using full path



