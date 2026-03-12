@Editdistributor @Sanity @All @Execution @allPost
Feature: Testcases for POST EDIT Distributor endpoint

  Scenario: TC_01 Edit distributor warehouse - positive
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName      | HeaderValue       |
      | Content-Type    | application/xml   |
      | Accept          | */*               |
      | Accept-Encoding | gzip,deflate,br   |
      | Connection      | keep-alive        |
    And I modify fields with random values and remove fields in "Post_editdistributor" XML payload
      | XPath                   | Value  |
      | /Warehouse/erp_id        | s123745|
    And I post the request with "Post_editdistributor" xml payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | Access_TOKEN |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath    | Value                            |
      | $.Result | "true"                           |
      | $.Reason | "The DISTRIBUTOR has been saved" |
    And I verify the data got updated as needed from DB
      | expectedColumn                                                                 | expectedValue           |
      | DB:warehouses:name:id = (SELECT id FROM warehouses WHERE erp_id = 's12345') | JAI BABA KIRANA STORE  |
    And verify response time is less than "2500" milliseconds

  @NegativeScenario

  Scenario: TC_02 Edit distributor warehouse - negative case without access token key
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName       | HeaderValue        |
      | Content-Type     | application/xml    |
      | Accept           | */*                |
      | Accept-Encoding  | gzip,deflate,br    |
      | Connection       | keep-alive         |
    And I modify fields with random values and remove fields in "Post_editdistributor" XML payload
      | XPath          | Value |
      | /Warehouse/erp_id | test |
    And I post the request with "Post_editdistributor" xml payload with dynamic access token and query parameters
      | Query        | Value         |
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      | JPath                  | Value                                      |
      | $.error                | invalid_request                            |
      | $.error_description    | The access token was not found.            |
    And verify response time is less than "2500" milliseconds

  Scenario: TC_03 Edit distributor warehouse - negative case with missing access token
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName       | HeaderValue        |
      | Content-Type     | application/xml    |
      | Accept           | */*                |
      | Accept-Encoding  | gzip,deflate,br    |
      | Connection       | keep-alive         |
    And I modify fields with random values and remove fields in "Post_editdistributor" XML payload
      | XPath          | Value |
      | /Warehouse/erp_id | test |
    And I post the request with "Post_editdistributor" xml payload with dynamic access token and query parameters
      | Query        | Value |
      | access_token |       |
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      | JPath   | Value           |
      | $.error | invalid_request |
    And verify response time is less than "2500" milliseconds

  Scenario: TC_04 Edit distributor warehouse - negative case with invalid access token
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName       | HeaderValue        |
      | Content-Type     | application/xml    |
      | Accept           | */*                |
      | Accept-Encoding  | gzip,deflate,br    |
      | Connection       | keep-alive         |
    And I modify fields with random values and remove fields in "Post_editdistributor" XML payload
      | XPath          | Value |
      | /Warehouse/erp_id | test |
    And I post the request with "Post_editdistributor" xml payload with dynamic access token and query parameters
      | Query        | Value            |
      | access_token | invalidaccesstone |
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      | JPath   | Value           |
      | $.error | invalid_grant   |
    And verify response time is less than "2500" milliseconds



  Scenario: TC_06 Edit distributor warehouse - negative case with Invalid City
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName       | HeaderValue       |
      | Content-Type     | application/xml   |
      | Accept           | */*               |
      | Accept-Encoding  | gzip,deflate,br   |
      | Connection       | keep-alive        |
    And I modify fields with random values and remove fields in "Post_editdistributor" XML payload
      | XPath            | Value |
      | /Warehouse/city | cccccccccccccc |
    And I post the request with "Post_editdistributor" xml payload with dynamic access token and query parameters
      | Query         | Value         |
      | access_token  | Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath    | Value                            |
      | $.Result | "false"                          |
      | $.Reason[0] | Invalid city name provided or city is inactive |
    And verify response time is less than "2500" milliseconds

  Scenario: TC_07 Edit distributor warehouse - negative case with Empty City [With Empty city user can add distributor successfully]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName       | HeaderValue       |
      | Content-Type     | application/xml   |
      | Accept           | */*               |
      | Accept-Encoding  | gzip,deflate,br   |
      | Connection       | keep-alive        |
    And I modify fields with random values and remove fields in "Post_editdistributor" XML payload
      | XPath            | Value |
      | /Warehouse/city |       |
    And I post the request with "Post_editdistributor" xml payload with dynamic access token and query parameters
      | Query         | Value         |
      | access_token  | Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath    | Value                            |
      | $.Result | "true"                           |
      | $.Reason | "The DISTRIBUTOR has been saved" |
    And verify response time is less than "2500" milliseconds

  Scenario: TC_08 Edit distributor warehouse - negative case with Empty District [With Empty district user can add distributor successfully]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName       | HeaderValue       |
      | Content-Type     | application/xml   |
      | Accept           | */*               |
      | Accept-Encoding  | gzip,deflate,br   |
      | Connection       | keep-alive        |
    And I modify fields with random values and remove fields in "Post_editdistributor" XML payload
      | XPath            | Value |
      | /Warehouse/district |       |
    And I post the request with "Post_editdistributor" xml payload with dynamic access token and query parameters
      | Query         | Value         |
      | access_token  | Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath    | Value                            |
      | $.Result | "true"                           |
      | $.Reason | "The DISTRIBUTOR has been saved" |
    And verify response time is less than "2500" milliseconds

  @NegativeScenario
  Scenario: TC_09 Edit distributor warehouse - negative case with missing name
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName       | HeaderValue       |
      | Content-Type     | application/xml   |
      | Accept           | */*               |
      | Accept-Encoding  | gzip,deflate,br   |
      | Connection       | keep-alive        |
    And I modify fields with random values and remove fields in "Post_editdistributor" XML payload
      | XPath             | Value          |
      | /Warehouse/erp_id | randomAlphaNum |
      | /Warehouse/name   |                |
    And I post the request with "Post_editdistributor" xml payload with dynamic access token and query parameters
      | Query         | Value         |
      | access_token  | Access_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader | xmlValue             |
      | $.Result      | 0                    |
      | $.Reason      | warehouse not added  |
    And verify response time is less than "2500" milliseconds

  @NegativeScenario
  Scenario: TC_10 Edit distributor warehouse - negative case with missing address
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName       | HeaderValue       |
      | Content-Type     | application/xml   |
      | Accept           | */*               |
      | Accept-Encoding  | gzip,deflate,br   |
      | Connection       | keep-alive        |
    And I modify fields with random values and remove fields in "Post_editdistributor" XML payload
      | XPath             | Value          |
      | /Warehouse/erp_id | randomAlphaNum |
      | /Warehouse/address|                |
    And I post the request with "Post_editdistributor" xml payload with dynamic access token and query parameters
      | Query         | Value         |
      | access_token  | Access_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader | xmlValue                                        |
      | $.Result      | 0                                               |
      | $.Reason      | warehouse not added                             |
      | $.reason      | Please fill all the . Parameters are address   |
    And verify response time is less than "2500" milliseconds

  Scenario: TC_11 Edit distributor warehouse - negative case with missing active
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName       | HeaderValue       |
      | Content-Type     | application/xml   |
      | Accept           | */*               |
      | Accept-Encoding  | gzip,deflate,br   |
      | Connection       | keep-alive        |
    And I modify fields with random values and remove fields in "Post_editdistributor" XML payload
      | XPath             | Value          |
      | /Warehouse/erp_id | randomAlphaNum |
      | /Warehouse/active |                |
    And I post the request with "Post_editdistributor" xml payload with dynamic access token and query parameters
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
  Scenario: TC_12 Edit distributor warehouse - negative case with missing zone_erpid
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName       | HeaderValue       |
      | Content-Type     | application/xml   |
      | Accept           | */*               |
      | Accept-Encoding  | gzip,deflate,br   |
      | Connection       | keep-alive        |
    And I modify fields with random values and remove fields in "Post_editdistributor" XML payload
      | XPath             | Value          |
      | /Warehouse/erp_id | randomAlphaNum |
      | /Warehouse/zone_erpid |            |
    And I post the request with "Post_editdistributor" xml payload with dynamic access token and query parameters
      | Query         | Value         |
      | access_token  | Access_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader | xmlValue                                          |
      | $.Result      | 0                                                 |
      | $.Reason      | warehouse not added                               |
      | $.reason      | Please fill all the . Parameters are zone_id/zone_erpid |
    And verify response time is less than "2500" milliseconds

  Scenario: TC_13 Edit distributor warehouse - negative case with invalid zone_erpid
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName       | HeaderValue       |
      | Content-Type     | application/xml   |
      | Accept           | */*               |
      | Accept-Encoding  | gzip,deflate,br   |
      | Connection       | keep-alive        |
    And I modify fields with random values and remove fields in "Post_editdistributor" XML payload
      | XPath             | Value          |
      | /Warehouse/erp_id | randomAlphaNum |
      | /Warehouse/zone_erpid | testhdsdxwdu |
    And I post the request with "Post_editdistributor" xml payload with dynamic access token and query parameters
      | Query         | Value         |
      | access_token  | Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath    | Value               |
      | $.Result | "false"             |
      | $.Reason | "Invalid zone_erpid"|
    And verify response time is less than "2500" milliseconds

  Scenario: TC_14 Edit distributor warehouse - negative case with invalid subzone zone_erpid
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName       | HeaderValue       |
      | Content-Type     | application/xml   |
      | Accept           | */*               |
      | Accept-Encoding  | gzip,deflate,br   |
      | Connection       | keep-alive        |
    And I modify fields with random values and remove fields in "Post_editdistributor" XML payload
      | XPath                 | Value          |
      | /Warehouse/erp_id     | randomAlphaNum |
      | /Warehouse/subzone_erpid | testhdsdxwdu |
    And I post the request with "Post_editdistributor" xml payload with dynamic access token and query parameters
      | Query         | Value         |
      | access_token  | Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath    | Value                 |
      | $.Result | "false"               |
      | $.Reason | "Invalid subzone data"|
    And verify response time is less than "2500" milliseconds

  Scenario: TC_15 Edit distributor warehouse - negative case with invalid active
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName       | HeaderValue        |
      | Content-Type     | application/xml    |
      | Accept           | */*                |
      | Accept-Encoding  | gzip,deflate,br    |
      | Connection       | keep-alive         |
    And I modify fields with random values and remove fields in "Post_editdistributor" XML payload
      | XPath           | Value          |
      | /Warehouse/erp_id | randomAlphaNum |
      | /Warehouse/active | 23            |
    And I post the request with "Post_editdistributor" xml payload with dynamic access token and query parameters
      | Query        | Value         |
      | access_token | Access_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader | xmlValue                                   |
      | $.Result      | 0                                          |
      | $.Reason      | warehouse not added                         |
      | $.reason      | Active must contain either 0 or 1          |
    And verify response time is less than "2500" milliseconds

  Scenario: TC_16 Edit distributor warehouse - negative case with long erpid
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName       | HeaderValue        |
      | Content-Type     | application/xml    |
      | Accept           | */*                |
      | Accept-Encoding  | gzip,deflate,br    |
      | Connection       | keep-alive         |
    And I modify fields with random values and remove fields in "Post_editdistributor" XML payload
      | XPath              | Value                                                                                                 |
      | /Warehouse/erp_id  | AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA...|
      | /Warehouse/name    | Longwarehouse                                                                                        |
      | /Warehouse/phoneno |                                                                                                      |
      | /Warehouse/email   |                                                                                                      |
      | /Warehouse/city    |                                                                                                      |
      | /Warehouse/district_id |                                                                                                |
    And I post the request with "Post_editdistributor" xml payload with dynamic access token and query parameters
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

  Scenario: TC_17 Edit distributor warehouse - negative case with invalid format state erpid
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName       | HeaderValue        |
      | Content-Type     | application/xml    |
      | Accept           | */*                |
      | Accept-Encoding  | gzip,deflate,br    |
      | Connection       | keep-alive         |
    And I modify fields with random values and remove fields in "Post_editdistributor" XML payload
      | XPath               | Value         |
      | /Warehouse/erp_id   | randomAlphaNum |
      | /Warehouse/state_erpid | invalidstate |
    And I post the request with "Post_editdistributor" xml payload with dynamic access token and query parameters
      | Query        | Value         |
      | access_token | Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath        | Value                        |
      | $.Reason[0]  | "State erp id/name not found"|
    And verify response time is less than "2500" milliseconds

  Scenario: TC_18 Edit distributor warehouse - negative case with Long char state erpid
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName       | HeaderValue        |
      | Content-Type     | application/xml    |
      | Accept           | */*                |
      | Accept-Encoding  | gzip,deflate,br    |
      | Connection       | keep-alive         |
    And I modify fields with random values and remove fields in "Post_editdistributor" XML payload
      | XPath               | Value         |
      | /Warehouse/erp_id   | randomAlphaNum |
      | /Warehouse/state_erpid | invalidstatettttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt |
    And I post the request with "Post_editdistributor" xml payload with dynamic access token and query parameters
      | Query        | Value         |
      | access_token | Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath        | Value                        |
      | $.Reason[0]  | "State erp id/name not found"|
    And verify response time is less than "2500" milliseconds

  Scenario: TC_19 Edit distributor warehouse - negative case with Not exist state erpid
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName       | HeaderValue        |
      | Content-Type     | application/xml    |
      | Accept           | */*                |
      | Accept-Encoding  | gzip,deflate,br    |
      | Connection       | keep-alive         |
    And I modify fields with random values and remove fields in "Post_editdistributor" XML payload
      | XPath               | Value         |
      | /Warehouse/erp_id   | randomAlphaNum |
      | /Warehouse/state_erpid | 123ghjkwndjkhfu |
    And I post the request with "Post_editdistributor" xml payload with dynamic access token and query parameters
      | Query        | Value         |
      | access_token | Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath        | Value                        |
      | $.Reason[0]  | "State erp id/name not found"|
    And verify response time is less than "2500" milliseconds

  Scenario: TC_20 Edit distributor warehouse - negative case with invalid warehousetype erpid
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName       | HeaderValue        |
      | Content-Type     | application/xml    |
      | Accept           | */*                |
      | Accept-Encoding  | gzip,deflate,br    |
      | Connection       | keep-alive         |
    And I modify fields with random values and remove fields in "Post_editdistributor" XML payload
      | XPath                        | Value                     |
      | /Warehouse/erp_id            | randomAlphaNum            |
      | /Warehouse/warehousetype_erpid | invalidwarehoustypejdnc |
    And I post the request with "Post_editdistributor" xml payload with dynamic access token and query parameters
      | Query        | Value         |
      | access_token | Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath       | Value                                      |
      | $.Result    | false                                      |
      | $.Reason    | "Warehousetype erp_id does not exists"    |
    And verify response time is less than "2500" milliseconds

  Scenario: TC_21 Edit distributor warehouse - negative case with Long char warehousetype erpid
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName       | HeaderValue        |
      | Content-Type     | application/xml    |
      | Accept           | */*                |
      | Accept-Encoding  | gzip,deflate,br    |
      | Connection       | keep-alive         |
    And I modify fields with random values and remove fields in "Post_editdistributor" XML payload
      | XPath                        | Value                     |
      | /Warehouse/erp_id            | randomAlphaNum            |
      | /Warehouse/warehousetype_erpid | invalidwarehdddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddoustypejdnc |
    And I post the request with "Post_editdistributor" xml payload with dynamic access token and query parameters
      | Query        | Value         |
      | access_token | Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath       | Value                                      |
      | $.Result    | false                                      |
      | $.Reason    | "Warehousetype erp_id does not exists"    |
    And verify response time is less than "2500" milliseconds

  Scenario: TC_22 Edit distributor warehouse - negative case with name = [" "] (integration API accepts)
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName       | HeaderValue        |
      | Content-Type     | application/xml    |
      | Accept           | */*                |
      | Accept-Encoding  | gzip,deflate,br    |
      | Connection       | keep-alive         |
    And I modify fields with random values and remove fields in "Post_editdistributor" XML payload
      | XPath            | Value   |
      | /Warehouse/erp_id | s12345 |
      | /Warehouse/name   | " "     |
    And I post the request with "Post_editdistributor" xml payload with dynamic access token and query parameters
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

  Scenario: TC_23 Add distributor warehouse - edge case with null values in numeric fields
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName       | HeaderValue        |
      | Content-Type     | application/xml    |
      | Accept           | */*                |
      | Accept-Encoding  | gzip,deflate,br    |
      | Connection       | keep-alive         |
    And I modify fields with random values and remove fields in "Post_editdistributor" XML payload
      | XPath            | Value          |
      | /Warehouse/erp_id | randomAlphaNum |
      | /Warehouse/active | null           |
    And I post the request with "Post_editdistributor" xml payload with dynamic access token and query parameters
      | Query        | Value         |
      | access_token | Access_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader | xmlValue                  |
      | $.Result      | 0                         |
      | $.Reason      | warehouse not added       |
      | $.reason      | Active must contain either 0 or 1 |
    And verify response time is less than "2500" milliseconds


