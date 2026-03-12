@InventoryTransaction @sanity @all @allGet @Execution

Feature: This feature file is of the testcases of GET end point of inventory transaction at warehouse.

  @test1
  Scenario: TC_01 - GET Inventory Transactions - Positive Case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I send the GET request to "inventory_transaction" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |date          |2024-02-12     |
      |access_token  |ACCESS_TOKEN|
      |responsetype  |json           |
      |startseq      |0              |
      |endseq        |100            |
      |fromdate      |2024-04-02     |
      |todate        |2025-01-01     |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath                  |Value           |
      |$.Response.result      |false           |
      |$.Response.reason      |"No data found."|
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "1200" milliseconds

  @test2
  Scenario: TC_02 - GET Inventory Transactions - Negative Case - removal of parameters
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I send the GET request to "inventory_transaction" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token   |ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath                  |Value           |
      |$.Response.result      |false           |
      |$.Response.reason      |"No data found."|
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "1200" milliseconds

  @test3
  Scenario: TC_03 - GET Inventory Transactions - Negative Case - removal of access token
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I send the GET request to "inventory_transaction" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |pageno        |1              |
      |warehouse_erpid|trp123        |
      |is_active      |1             |
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      |JPath               |Value           |
      |$.error             |"invalid_request"|
      |$.error_description |"The access token was not found."        |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "1200" milliseconds