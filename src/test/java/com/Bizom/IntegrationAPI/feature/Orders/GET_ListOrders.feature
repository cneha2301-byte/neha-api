@test @allGet
Feature: This feature file is of the testcases of GET end point of list orders

Scenario: TC_01 list orders - positive case
    Given I set up base URI for transactions
    When I set up request specification
        |HeaderName|HeaderValue|
        |Accept|*/*|
        |Accept-Encoding|gzip,deflate, br|
        |Connection|keep-alive|
    And I send the GET request to "list_orders_positive" endpoint with query parameters
        |QueryParamName|QueryParamValue|
        |access_token|c13ebc44eb09bb613db5e4a20b61fdc28e3633ef|
        |responsetype|json|
        |fromdate|2024-06-15|
        |todate||
        |datetype|created|
        |startseq|0|
        |endseq|100|
        |getPrimaryOrders|0|
    Then I should see the response code as "200"
    And I store the response as "ordersList" name using full path


Scenario: TC_01b list orders - Negative demo case
        Given I set up base URI for transactions
        When I set up request specification
            |HeaderName|HeaderValue|
            |Accept|*/*|
            |Accept-Encoding|gzip,deflate, br|
            |Connection|keep-alive|
        And I send the GET request to "list_orders_positive" endpoint with query parameters
            |QueryParamName|QueryParamValue|
            |access_token|c13ebc44eb09bb613db5e4a20b61fdc28e3633ef|
            |responsetype|json|
            |fromdate|2024-06-15|
            |todate||
            |datetype|created|
            |startseq|0|
            |endseq|100|
            |getPrimaryOrders|0|
        Then I should see the response code as "400"
        And I store the response as "ordersList" name using full path