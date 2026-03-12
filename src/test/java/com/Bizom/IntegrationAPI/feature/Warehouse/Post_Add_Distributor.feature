 @createdistributor @Sanity @All @Execution @allPost
Feature: Testcases for POST Add Distributor endpoint

  Scenario: TC_01 add distributor warehouse - positive [isupdatedepo = 1]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName      | HeaderValue       |
      | Content-Type    | application/xml   |
      | Accept          | */*               |
      | Accept-Encoding | gzip,deflate,br   |
      | Connection      | keep-alive        |
    And I modify fields with random values and remove fields in "Post_adddistributor" XML payload
      | XPath                   | Value |
      | /Warehouse/isupdatedepo | 1     |
    And I post the request with "Post_adddistributor" xml payload with dynamic access token and query parameters
      | Query        | Value         |
      | access_token | Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath    | Value                            |
      | $.Result | "true"                           |
      | $.Reason | "The DISTRIBUTOR has been saved" |
    And I verify the data got updated as needed from DB
      | expectedColumn                                                                 | expectedValue           |
      | DB:warehouses:name:id = (SELECT id FROM warehouses WHERE erp_id = 's12345') | JAI BABA KIRANA STORE  |
    And verify response time is less than "2500" milliseconds

  @nehattg01
  Scenario: TC_02 add distributor warehouse - positive [isupdatedepo = 0]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName      | HeaderValue       |
      | Content-Type    | application/xml   |
      | Accept          | */*               |
      | Accept-Encoding | gzip,deflate,br   |
      | Connection      | keep-alive        |
    And I modify fields with random values and remove fields in "Post_adddistributor" XML payload
      | XPath                     | Value |
      | //Warehouse/isupdatedepo  | 0     |
    And I post the request with "Post_adddistributor" xml payload with dynamic access token and query parameters
      | Query        | Value         |
      | access_token | Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath    | Value                            |
      | $.Result | "true"                           |
      | $.Reason | "The DISTRIBUTOR has been saved" |
    And I verify the data got updated as needed from DB
      | expectedColumn                                                                 | expectedValue           |
      | DB:warehouses:name:id = (SELECT id FROM warehouses WHERE erp_id = 's12345') | JAI BABA KIRANA STORE  |
    And verify response time is less than "2500" milliseconds

  Scenario: TC_03 add distributor warehouse - positive [isupdatedepo empty]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName      | HeaderValue       |
      | Content-Type    | application/xml   |
      | Accept          | */*               |
      | Accept-Encoding | gzip,deflate,br   |
      | Connection      | keep-alive        |
    And I modify fields with random values and remove fields in "Post_adddistributor" XML payload
      | XPath                     | Value |
      | //Warehouse/isupdatedepo  |       |
    And I post the request with "Post_adddistributor" xml payload with dynamic access token and query parameters
      | Query        | Value         |
      | access_token | Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath    | Value                            |
      | $.Result | "true"                           |
      | $.Reason | "The DISTRIBUTOR has been saved" |
    And I verify the data got updated as needed from DB
      | expectedColumn                                                                 | expectedValue           |
      | DB:warehouses:name:id = (SELECT id FROM warehouses WHERE erp_id = 's12345') | JAI BABA KIRANA STORE  |
    And verify response time is less than "2500" milliseconds

  Scenario: TC_04 Add distributor warehouse - positive case with optional fields empty
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName       | HeaderValue       |
      | Content-Type     | application/xml   |
      | Accept           | */*               |
      | Accept-Encoding  | gzip,deflate,br   |
      | Connection       | keep-alive        |
    And I modify fields with random values and remove fields in "Post_adddistributor" XML payload
      | XPath                   | Value          |
      | /Warehouse/erp_id       | randomAlphaNum |
      | /Warehouse/name         | NewWarehouse   |
      | /Warehouse/phoneno      |                |
      | /Warehouse/email        |                |
      | /Warehouse/city         |                |
      | /Warehouse/district_id  |                |
    And I post the request with "Post_adddistributor" xml payload with dynamic access token and query parameters
      | Query         | Value         |
      | access_token  | Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath    | Value                           |
      | $.Result | "true"                          |
      | $.Reason | "WAREHOUSE added successfully"  |
    And I verify the data got updated as needed from DB
      | expectedColumn                           | expectedValue   |
      | DB:warehouses:name:id = (SELECT MAX(id) FROM warehouses) | NewWarehouse |
    And verify response time is less than "2500" milliseconds

  @NegativeScenario
  Scenario: TC_05 Add distributor warehouse - negative case with missing erp_id
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName       | HeaderValue       |
      | Content-Type     | application/xml   |
      | Accept           | */*               |
      | Accept-Encoding  | gzip,deflate,br   |
      | Connection       | keep-alive        |
    And I modify fields with random values and remove fields in "Post_adddistributor" XML payload
      | XPath            | Value |
      | /Warehouse/erp_id |       |
    And I post the request with "Post_adddistributor" xml payload with dynamic access token and query parameters
      | Query         | Value         |
      | access_token  | Access_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader | xmlValue             |
      | $.Result      | 0                    |
      | $.Reason      | warehouse not added  |
    And verify response time is less than "2500" milliseconds

  @NegativeScenario
  Scenario: TC_06 Add distributor warehouse - negative case with missing name
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName       | HeaderValue       |
      | Content-Type     | application/xml   |
      | Accept           | */*               |
      | Accept-Encoding  | gzip,deflate,br   |
      | Connection       | keep-alive        |
    And I modify fields with random values and remove fields in "Post_adddistributor" XML payload
      | XPath             | Value          |
      | /Warehouse/erp_id | randomAlphaNum |
      | /Warehouse/name   |                |
    And I post the request with "Post_adddistributor" xml payload with dynamic access token and query parameters
      | Query         | Value         |
      | access_token  | Access_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader | xmlValue             |
      | $.Result      | 0                    |
      | $.Reason      | warehouse not added  |
    And verify response time is less than "2500" milliseconds

  @NegativeScenario
  Scenario: TC_07 Add distributor warehouse - negative case with missing address
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName       | HeaderValue       |
      | Content-Type     | application/xml   |
      | Accept           | */*               |
      | Accept-Encoding  | gzip,deflate,br   |
      | Connection       | keep-alive        |
    And I modify fields with random values and remove fields in "Post_adddistributor" XML payload
      | XPath             | Value          |
      | /Warehouse/erp_id | randomAlphaNum |
      | /Warehouse/address|                |
    And I post the request with "Post_adddistributor" xml payload with dynamic access token and query parameters
      | Query         | Value         |
      | access_token  | Access_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader | xmlValue                                        |
      | $.Result      | 0                                               |
      | $.Reason      | warehouse not added                             |
      | $.reason      | Please fill all the . Parameters are address   |
    And verify response time is less than "2500" milliseconds

  @NegativeScenario
  Scenario: TC_08 Add distributor warehouse - negative case with missing active
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName       | HeaderValue       |
      | Content-Type     | application/xml   |
      | Accept           | */*               |
      | Accept-Encoding  | gzip,deflate,br   |
      | Connection       | keep-alive        |
    And I modify fields with random values and remove fields in "Post_adddistributor" XML payload
      | XPath             | Value          |
      | /Warehouse/erp_id | randomAlphaNum |
      | /Warehouse/active |                |
    And I post the request with "Post_adddistributor" xml payload with dynamic access token and query parameters
      | Query         | Value         |
      | access_token  | Access_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader | xmlValue                                   |
      | $.Result      | 0                                          |
      | $.Reason      | warehouse not added                        |
      | $.reason      | Active must contain either 0 or 1         |
    And verify response time is less than "2500" milliseconds

  @NegativeScenario
  Scenario: TC_09 Add distributor warehouse - negative case with missing zone_erpid
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName       | HeaderValue       |
      | Content-Type     | application/xml   |
      | Accept           | */*               |
      | Accept-Encoding  | gzip,deflate,br   |
      | Connection       | keep-alive        |
    And I modify fields with random values and remove fields in "Post_adddistributor" XML payload
      | XPath             | Value          |
      | /Warehouse/erp_id | randomAlphaNum |
      | /Warehouse/zone_erpid |            |
    And I post the request with "Post_adddistributor" xml payload with dynamic access token and query parameters
      | Query         | Value         |
      | access_token  | Access_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader | xmlValue                                          |
      | $.Result      | 0                                                 |
      | $.Reason      | warehouse not added                               |
      | $.reason      | Please fill all the . Parameters are zone_id/zone_erpid |
    And verify response time is less than "2500" milliseconds

  Scenario: TC_10 Add distributor warehouse - negative case with invalid zone_erpid
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName       | HeaderValue       |
      | Content-Type     | application/xml   |
      | Accept           | */*               |
      | Accept-Encoding  | gzip,deflate,br   |
      | Connection       | keep-alive        |
    And I modify fields with random values and remove fields in "Post_adddistributor" XML payload
      | XPath             | Value          |
      | /Warehouse/erp_id | randomAlphaNum |
      | /Warehouse/zone_erpid | testhdsdxwdu |
    And I post the request with "Post_adddistributor" xml payload with dynamic access token and query parameters
      | Query         | Value         |
      | access_token  | Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath    | Value               |
      | $.Result | "false"             |
      | $.Reason | "Invalid zone_erpid"|
    And verify response time is less than "2500" milliseconds


  Scenario: TC_11 Add distributor warehouse - negative case with invalid subzone zone_erpid
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName       | HeaderValue       |
      | Content-Type     | application/xml   |
      | Accept           | */*               |
      | Accept-Encoding  | gzip,deflate,br   |
      | Connection       | keep-alive        |
    And I modify fields with random values and remove fields in "Post_adddistributor" XML payload
      | XPath                 | Value          |
      | /Warehouse/erp_id     | randomAlphaNum |
      | /Warehouse/subzone_erpid | testhdsdxwdu |
    And I post the request with "Post_adddistributor" xml payload with dynamic access token and query parameters
      | Query         | Value         |
      | access_token  | Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath    | Value                 |
      | $.Result | "false"               |
      | $.Reason | "Invalid subzone data"|
    And verify response time is less than "2500" milliseconds


  Scenario: TC_12 Add distributor warehouse - negative case with invalid active
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName       | HeaderValue        |
      | Content-Type     | application/xml    |
      | Accept           | */*                |
      | Accept-Encoding  | gzip,deflate,br    |
      | Connection       | keep-alive         |
    And I modify fields with random values and remove fields in "Post_adddistributor" XML payload
      | XPath           | Value          |
      | /Warehouse/erp_id | randomAlphaNum |
      | /Warehouse/active | 23            |
    And I post the request with "Post_adddistributor" xml payload with dynamic access token and query parameters
      | Query        | Value         |
      | access_token | Access_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader | xmlValue                                   |
      | $.Result      | 0                                          |
      | $.Reason      | warehouse not added                         |
      | $.reason      | Active must contain either 0 or 1          |
    And verify response time is less than "2500" milliseconds


  Scenario: TC_13 Add distributor warehouse - negative case with missing access token
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName       | HeaderValue        |
      | Content-Type     | application/xml    |
      | Accept           | */*                |
      | Accept-Encoding  | gzip,deflate,br    |
      | Connection       | keep-alive         |
    And I modify fields with random values and remove fields in "Post_adddistributor" XML payload
      | XPath          | Value |
      | /Warehouse/erp_id | test |
    And I post the request with "Post_adddistributor" xml payload with dynamic access token and query parameters
      | Query        | Value |
      | access_token |       |
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      | JPath   | Value           |
      | $.error | invalid_request |
    And verify response time is less than "2500" milliseconds


  Scenario: TC_14 Add distributor warehouse - negative case with invalid access token
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName       | HeaderValue        |
      | Content-Type     | application/xml    |
      | Accept           | */*                |
      | Accept-Encoding  | gzip,deflate,br    |
      | Connection       | keep-alive         |
    And I modify fields with random values and remove fields in "Post_adddistributor" XML payload
      | XPath          | Value |
      | /Warehouse/erp_id | test |
    And I post the request with "Post_adddistributor" xml payload with dynamic access token and query parameters
      | Query        | Value            |
      | access_token | invalidaccesstone |
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      | JPath   | Value           |
      | $.error | invalid_grant   |
    And verify response time is less than "2500" milliseconds


  Scenario: TC_15 Add distributor warehouse - negative case with long erpid
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName       | HeaderValue        |
      | Content-Type     | application/xml    |
      | Accept           | */*                |
      | Accept-Encoding  | gzip,deflate,br    |
      | Connection       | keep-alive         |
    And I modify fields with random values and remove fields in "Post_adddistributor" XML payload
      | XPath              | Value                                                                                                 |
      | /Warehouse/erp_id  | AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA...|
      | /Warehouse/name    | Longwarehouse                                                                                        |
      | /Warehouse/phoneno |                                                                                                      |
      | /Warehouse/email   |                                                                                                      |
      | /Warehouse/city    |                                                                                                      |
      | /Warehouse/district_id |                                                                                                |
    And I post the request with "Post_adddistributor" xml payload with dynamic access token and query parameters
      | Query        | Value         |
      | access_token | Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath       | Value                            |
      | $.Result    | "true"                           |
      | $.Reason    | "WAREHOUSE added successfully"   |
    And I verify the data got updated as needed from DB
      | expectedColumn                                                 | expectedValue    |
      | DB:warehouses:name:id = (SELECT MAX(id) FROM warehouses)       | Longwarehouse    |
    And verify response time is less than "2500" milliseconds


  Scenario: TC_16 Add distributor warehouse - negative case with invalid state erpid
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName       | HeaderValue        |
      | Content-Type     | application/xml    |
      | Accept           | */*                |
      | Accept-Encoding  | gzip,deflate,br    |
      | Connection       | keep-alive         |
    And I modify fields with random values and remove fields in "Post_adddistributor" XML payload
      | XPath               | Value         |
      | /Warehouse/erp_id   | randomAlphaNum |
      | /Warehouse/state_erpid | invalidstate |
    And I post the request with "Post_adddistributor" xml payload with dynamic access token and query parameters
      | Query        | Value         |
      | access_token | Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath        | Value                        |
      | $.Reason[0]  | "State erp id/name not found"|
    And verify response time is less than "2500" milliseconds


  Scenario: TC_17 Add distributor warehouse - negative case with invalid warehousetype erpid
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName       | HeaderValue        |
      | Content-Type     | application/xml    |
      | Accept           | */*                |
      | Accept-Encoding  | gzip,deflate,br    |
      | Connection       | keep-alive         |
    And I modify fields with random values and remove fields in "Post_adddistributor" XML payload
      | XPath                        | Value                     |
      | /Warehouse/erp_id            | randomAlphaNum            |
      | /Warehouse/warehousetype_erpid | invalidwarehoustypejdnc |
    And I post the request with "Post_adddistributor" xml payload with dynamic access token and query parameters
      | Query        | Value         |
      | access_token | Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath       | Value                                      |
      | $.Result    | false                                      |
      | $.Reason    | "Warehousetype erp_id does not exists"    |
    And verify response time is less than "2500" milliseconds


  Scenario: TC_18 Add distributor warehouse - negative case without access token key
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName       | HeaderValue        |
      | Content-Type     | application/xml    |
      | Accept           | */*                |
      | Accept-Encoding  | gzip,deflate,br    |
      | Connection       | keep-alive         |
    And I modify fields with random values and remove fields in "Post_adddistributor" XML payload
      | XPath          | Value |
      | /Warehouse/erp_id | test |
    And I post the request with "Post_adddistributor" xml payload with dynamic access token and query parameters
      | Query        | Value         |
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      | JPath                  | Value                                      |
      | $.error                | invalid_request                            |
      | $.error_description    | The access token was not found.            |
    And verify response time is less than "2500" milliseconds


  Scenario: TC_19 Add distributor warehouse - negative case with name = [" "] (integration API accepts)
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName       | HeaderValue        |
      | Content-Type     | application/xml    |
      | Accept           | */*                |
      | Accept-Encoding  | gzip,deflate,br    |
      | Connection       | keep-alive         |
    And I modify fields with random values and remove fields in "Post_adddistributor" XML payload
      | XPath            | Value   |
      | /Warehouse/erp_id | s12345 |
      | /Warehouse/name   | " "     |
    And I post the request with "Post_adddistributor" xml payload with dynamic access token and query parameters
      | Query        | Value         |
      | access_token | Access_TOKEN  |
    And the fields in response should match with expected values
      | JPath       | Value                        |
      | $.Result    | "true"                       |
      | $.Reason    | "The DISTRIBUTOR has been saved" |
    And I verify the data got updated as needed from DB
      | expectedColumn                                                | expectedValue |
      | DB:warehouses:name:id = (SELECT id FROM warehouses WHERE erp_id = 's12345') | " "           |
    And verify response time is less than "2500" milliseconds


  Scenario: TC_20 Add distributor warehouse - edge case with null values in numeric fields
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName       | HeaderValue        |
      | Content-Type     | application/xml    |
      | Accept           | */*                |
      | Accept-Encoding  | gzip,deflate,br    |
      | Connection       | keep-alive         |
    And I modify fields with random values and remove fields in "Post_adddistributor" XML payload
      | XPath            | Value          |
      | /Warehouse/erp_id | randomAlphaNum |
      | /Warehouse/active | null           |
    And I post the request with "Post_adddistributor" xml payload with dynamic access token and query parameters
      | Query        | Value         |
      | access_token | Access_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader | xmlValue                  |
      | $.Result      | 0                         |
      | $.Reason      | warehouse not added       |
      | $.reason      | Active must contain either 0 or 1 |
    And verify response time is less than "2500" milliseconds

