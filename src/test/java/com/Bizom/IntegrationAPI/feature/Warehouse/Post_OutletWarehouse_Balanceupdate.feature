@Updateoutletwarehousebalance @Sanity @All @Execution @allPost
Feature: Testcases for POST update balance Outlet/warehouse endpoint

  Scenario: TC_01 Outlet/Warehouse Balance Update  - Positive
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName       | HeaderValue        |
      | Content-Type     | application/xml    |
      | Accept           | */*                |
      | Accept-Encoding  | gzip,deflate,br    |
      | Connection       | keep-alive         |
    And I modify fields with random values and remove fields in "Post_Outletwarehouse_Balanceupdate" XML payload
      | XPath                        | Value     |
      | /Warehouse/from_warehouse_erpid | trp124  |
    And I post the request with "Post_Outletwarehouse_Balanceupdate" xml payload with dynamic access token and query parameters
      | Query        | Value         |
      | access_token | Access_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader | xmlValue                          |
      | $.result       | 1                                 |
      | $.reason       | Balance updated successfully.     |
    And verify response time is less than "2500" milliseconds

  Scenario: TC_02 Outlet/Warehouse Balance Update  - Negative [Without AccessToken Value]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName       | HeaderValue        |
      | Content-Type     | application/xml    |
      | Accept           | */*                |
      | Accept-Encoding  | gzip,deflate,br    |
      | Connection       | keep-alive         |
    And I modify fields with random values and remove fields in "Post_Outletwarehouse_Balanceupdate" XML payload
      | XPath                        | Value     |
      | /Warehouse/from_warehouse_erpid | trp124  |
    And I post the request with "Post_Outletwarehouse_Balanceupdate" xml payload with dynamic access token and query parameters
      | Query        | Value         |
      | access_token |   |
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      | JPath                   | Value                                               |
      | $.error                 | invalid_request                                      |
      | $.error_description     | "The request is missing a required parameter, includes an unsupported parameter or parameter value, repeats the same parameter, uses more than one method for including an access token, or is otherwise malformed." |
    And verify response time is less than "2500" milliseconds

  Scenario: TC_03 Outlet/Warehouse Balance Update  - Negative [Without AccessToken Key]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName       | HeaderValue        |
      | Content-Type     | application/xml    |
      | Accept           | */*                |
      | Accept-Encoding  | gzip,deflate,br    |
      | Connection       | keep-alive         |
    And I modify fields with random values and remove fields in "Post_Outletwarehouse_Balanceupdate" XML payload
      | XPath                        | Value     |
      | /Warehouse/from_warehouse_erpid | trp124  |
    And I post the request with "Post_Outletwarehouse_Balanceupdate" xml payload with dynamic access token and query parameters
      | Query        | Value         |
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      | JPath                     | Value                                       |
      | $.error                   | invalid_request                             |
      | $.error_description       | The access token was not found.             |
    And verify response time is less than "2500" milliseconds

  Scenario: TC_04 Outlet/Warehouse Balance Update  - Negative [With Invalid AccessToken Value]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName       | HeaderValue        |
      | Content-Type     | application/xml    |
      | Accept           | */*                |
      | Accept-Encoding  | gzip,deflate,br    |
      | Connection       | keep-alive         |
    And I modify fields with random values and remove fields in "Post_Outletwarehouse_Balanceupdate" XML payload
      | XPath                        | Value     |
      | /Warehouse/from_warehouse_erpid | trp124  |
    And I post the request with "Post_Outletwarehouse_Balanceupdate" xml payload with dynamic access token and query parameters
      | Query        | Value         |
      | access_token | invalidAccess_TOKEN |
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      | JPath                   | Value                            |
      | $.error                 | invalid_grant                    |
      | $.error_description     | "The access token provided is invalid." |
    And verify response time is less than "2500" milliseconds

  Scenario: TC_05 Outlet/Warehouse Balance Update  - Negative [Invalid -from_warehouse_erpid]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName       | HeaderValue        |
      | Content-Type     | application/xml    |
      | Accept           | */*                |
      | Accept-Encoding  | gzip,deflate,br    |
      | Connection       | keep-alive         |
    And I modify fields with random values and remove fields in "Post_Outletwarehouse_Balanceupdate" XML payload
      | XPath                        | Value     |
      | /Warehouse/from_warehouse_erpid | 000000jdscndsbf |
    And I post the request with "Post_Outletwarehouse_Balanceupdate" xml payload with dynamic access token and query parameters
      | Query        | Value         |
      | access_token | Access_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader | xmlValue                          |
      | $.result       | 0                                 |
      | $.reason       | Invalid From Warehouse ID/ERP ID. |
    And verify response time is less than "2500" milliseconds

  Scenario: TC_06 Outlet/Warehouse Balance Update  - Negative [With Empty -from_warehouse_erpid]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName       | HeaderValue        |
      | Content-Type     | application/xml    |
      | Accept           | */*                |
      | Accept-Encoding  | gzip,deflate,br    |
      | Connection       | keep-alive         |
    And I modify fields with random values and remove fields in "Post_Outletwarehouse_Balanceupdate" XML payload
      | XPath                        | Value     |
      | /Warehouse/from_warehouse_erpid |  |
    And I post the request with "Post_Outletwarehouse_Balanceupdate" xml payload with dynamic access token and query parameters
      | Query        | Value         |
      | access_token | Access_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader | xmlValue                          |
      | $.result       | 0                                 |
      | $.reason       | Please fill all the parameters. The parameters are from_warehouse_erpid/from_warehouse_id |
    And verify response time is less than "2500" milliseconds

  Scenario: TC_07 Outlet/Warehouse Balance Update  - Negative [With Invalid -to_warehouse_erpid]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName       | HeaderValue        |
      | Content-Type     | application/xml    |
      | Accept           | */*                |
      | Accept-Encoding  | gzip,deflate,br    |
      | Connection       | keep-alive         |
    And I modify fields with random values and remove fields in "Post_Outletwarehouse_Balanceupdate" XML payload
      | XPath                        | Value     |
      | /Warehouse/to_warehouse_erpid | askhndsadguyagw |
    And I post the request with "Post_Outletwarehouse_Balanceupdate" xml payload with dynamic access token and query parameters
      | Query        | Value         |
      | access_token | Access_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader | xmlValue                          |
      | $.result       | 0                                 |
      | $.reason       | Invalid To Warehouse ID/ERP ID.   |
    And verify response time is less than "2500" milliseconds

  Scenario: TC_08 Outlet/Warehouse Balance Update  - Negative [With Empty -to_warehouse_erpid]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName       | HeaderValue        |
      | Content-Type     | application/xml    |
      | Accept           | */*                |
      | Accept-Encoding  | gzip,deflate,br    |
      | Connection       | keep-alive         |
    And I modify fields with random values and remove fields in "Post_Outletwarehouse_Balanceupdate" XML payload
      | XPath                        | Value     |
      | /Warehouse/to_warehouse_erpid |  |
    And I post the request with "Post_Outletwarehouse_Balanceupdate" xml payload with dynamic access token and query parameters
      | Query        | Value         |
      | access_token | Access_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader | xmlValue                          |
      | $.result       | 0                                 |
    And verify response time is less than "2500" milliseconds

  Scenario: TC_09 Outlet/Warehouse Balance Update  - Negative [With Long digit as Balance]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName       | HeaderValue        |
      | Content-Type     | application/xml    |
      | Accept           | */*                |
      | Accept-Encoding  | gzip,deflate,br    |
      | Connection       | keep-alive         |
    And I modify fields with random values and remove fields in "Post_Outletwarehouse_Balanceupdate" XML payload
      | XPath                        | Value     |
      | /Warehouse/balance            | 1111111111111111111111111111111111111111111233333333 |
    And I post the request with "Post_Outletwarehouse_Balanceupdate" xml payload with dynamic access token and query parameters
      | Query        | Value         |
      | access_token | Access_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader | xmlValue                          |
      | $.result       | 1                                 |
      | $.reason       | Balance updated successfully.     |
    And verify response time is less than "2500" milliseconds

  Scenario: TC_10 Outlet/Warehouse Balance Update  - Negative [With Non numeric Balance]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName       | HeaderValue        |
      | Content-Type     | application/xml    |
      | Accept           | */*                |
      | Accept-Encoding  | gzip,deflate,br    |
      | Connection       | keep-alive         |
    And I modify fields with random values and remove fields in "Post_Outletwarehouse_Balanceupdate" XML payload
      | XPath                        | Value     |
      | /Warehouse/balance            | Testbalance |
    And I post the request with "Post_Outletwarehouse_Balanceupdate" xml payload with dynamic access token and query parameters
      | Query        | Value         |
      | access_token | Access_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader | xmlValue                          |
      | $.result       | 0                                 |
      | $.reason       | balance value should be numeric    |
    And verify response time is less than "2500" milliseconds

  Scenario: TC_11 Outlet/Warehouse Balance Update  - Positive [DB Validation]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName       | HeaderValue        |
      | Content-Type     | application/xml    |
      | Accept           | */*                |
      | Accept-Encoding  | gzip,deflate,br    |
      | Connection       | keep-alive         |
    And I modify fields with random values and remove fields in "Post_Outletwarehouse_Balanceupdate" XML payload
      | XPath                        | Value     |
      | /Warehouse/from_warehouse_erpid | trp124  |
    And I post the request with "Post_Outletwarehouse_Balanceupdate" xml payload with dynamic access token and query parameters
      | Query        | Value         |
      | access_token | Access_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader | xmlValue                          |
      | $.result       | 1                                 |
      | $.reason       | Balance updated successfully.     |
    And I verify the data got updated as needed from DB
      | expectedColumn                                    | expectedValue |
      | DB:outletbalances:foroutlet_id:foroutlet_id = 15 AND outlet_id = 16 | 15            |
    And verify response time is less than "2500" milliseconds

  Scenario: TC_12 Outlet/Warehouse Balance Update  - Positive [With Both Valid Parameters]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName       | HeaderValue        |
      | Content-Type     | application/xml    |
      | Accept           | */*                |
      | Accept-Encoding  | gzip,deflate,br    |
      | Connection       | keep-alive         |
    And I modify fields with random values and remove fields in "Post_Outletwarehouse_Balanceupdate" XML payload
      | XPath                        | Value     |
      | /Warehouse/from_warehouse_erpid | trp124  |
      | /Warehouse/to_warehouse_erpid | trp125 |

    And I post the request with "Post_Outletwarehouse_Balanceupdate" xml payload with dynamic access token and query parameters
      | Query        | Value         |
      | access_token | Access_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader | xmlValue                          |
      | $.result       | 1                               |
    And verify response time is less than "2500" milliseconds


  Scenario: TC_13 Outlet/Warehouse Balance Update  - Positive [With Both Invalid   Parameters]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName       | HeaderValue        |
      | Content-Type     | application/xml    |
      | Accept           | */*                |
      | Accept-Encoding  | gzip,deflate,br    |
      | Connection       | keep-alive         |
    And I modify fields with random values and remove fields in "Post_Outletwarehouse_Balanceupdate" XML payload
      | XPath                        | Value     |
      | /Warehouse/from_warehouse_erpid | uhyu  |
      | /Warehouse/to_warehouse_erpid | uyfyt |

    And I post the request with "Post_Outletwarehouse_Balanceupdate" xml payload with dynamic access token and query parameters
      | Query        | Value         |
      | access_token | Access_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader | xmlValue                          |
      | $.result       | 0                              |
    And verify response time is less than "2500" milliseconds

  Scenario: TC_14 Outlet/Warehouse Balance Update  - Positive [With Both Empty   Parameters]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName       | HeaderValue        |
      | Content-Type     | application/xml    |
      | Accept           | */*                |
      | Accept-Encoding  | gzip,deflate,br    |
      | Connection       | keep-alive         |
    And I modify fields with random values and remove fields in "Post_Outletwarehouse_Balanceupdate" XML payload
      | XPath                        | Value     |
      | /Warehouse/from_warehouse_erpid |   |
      | /Warehouse/to_warehouse_erpid |  |

    And I post the request with "Post_Outletwarehouse_Balanceupdate" xml payload with dynamic access token and query parameters
      | Query        | Value         |
      | access_token | Access_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader | xmlValue                          |
      | $.result       | 0                              |
    And verify response time is less than "2500" milliseconds

