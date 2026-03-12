@Outlet/WarehouseBalance @Sanity @All @allGet @Execution
Feature: This feature file is of the testcases of GET end point of list warehouses

#-------------------------------------------------------------------------------------------------

  @test1
  Scenario: TC_01 get all warehouse positive
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

    And I send the GET request to "list_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |zone        |1|
      |responsetype|xml|
      |page        |0  |
      |limit       |1  |
      |datetype    |created|
      |fromdate|2022-01-17|
      |todate|2023-01-17|


    And Validating fields in XML response should match with expected values
      |xmlPathHeader|xmlValue|
      |Response.Result|1|

    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

    And verify response time is less than "5000" milliseconds

    Then I should see the response code as "200"
    And I store the response as "warehouseList" name using xml full path

#-------------------------------------------------------------------------------------------------

  @test2
  Scenario: TC_02 query parameters is missing
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "list_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|

    And the fields in response should match with expected values
      |JPath        |Value|
      |$.Result       |true    |

    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

    And verify response time is less than "2500" milliseconds

    Then I should see the response code as "200"
    And I store the response as "warehouseList" name using full path

#-------------------------------------------------------------------------------------------------

  @test3
  Scenario: TC_03 path is wrong
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

    And I send the GET request to "list_warehouse_neg" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |zone        |1|
      |responsetype|xml|
      |page        |0  |
      |limit       |1  |
      |datetype    |created|
      |fromdate|2022-01-17|
      |todate|2023-01-17%0A|
    Then I should see the response code as "404"
    And I store the response as "warehouseList" name using full path

#-------------------------------------------------------------------------------------------------

  @test4
  Scenario: TC_04 access token is missing
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "list_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |zone        |1|
      |responsetype|xml|
      |page        |0  |
      |limit       |1  |
      |datetype    |created|
      |fromdate|2022-01-17|
      |todate|2023-01-17%0A|

    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.error          |"invalid_request"|

    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Server      |Bizom                   |
      |Transfer-Encoding|chunked            |
      |Connection       |keep-alive         |
      |X-XSS-Protection |1; mode=block      |

    Then I should see the response code as "401"
    And I store the response as "warehouseList" name using full path




