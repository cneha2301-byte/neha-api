@Addmultipleoutlets @Sanity @All @Execution @allPost
Feature: This feature file is of the testcases of GET end point of Add multiple outlet Api

  @AddmultipleoutletsPositive
  Scenario: TC_01 add multiple outlet -  positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type      | application/json           |
    And I modify fields with random values and remove fields in "postAddmulipleoutlet" payload
      |JPath                      |Value            |
      | $.Outlets[0].Outlet.erp_id | outlet1test     |
      | $.Outlets[1].Outlet.erp_id | outlet0026gdgd  |
    And I post the request with "postAddmulipleoutlet" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Data[0].Result  | "true"  |
      | $.Data[0].Reason     | "Outlet added successfully"|
      | $.Data[1].Reason     | "Outlet added successfully"|
    And I verify the data got updated as needed from DB
      |expectedColumn |expectedValue |
      |DB:outlets:erp_id:id = (SELECT MAX(id) FROM outlets) |outlet0026gdgd |
    And verify response time is less than "2500" milliseconds


  Scenario: TC_02 add multiple outlet - Negative case [Without accesstoken field]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue      |
      | Accept            | /                |
      | Accept-Encoding   | gzip,deflate, br |
      | Connection        | keep-alive       |
      | Content-Type      | application/json |
    And I modify fields with random values and remove fields in "postAddmulipleoutlet" payload
      | JPath                       | Value           |
      | $.Outlets[0].Outlet.erp_id  | outlet1test    |
      | $.Outlets[1].Outlet.erp_id  | outlet0026gdgd |
    And I post the request with "postAddmulipleoutlet" payload with dynamic access token and query parameters
      | Query | Value |
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      | JPath   | Value             |
      | $.error | "invalid_request" |
    And verify response time is less than "2500" milliseconds

  Scenario: TC_03 add multiple outlet - Negative case [Without accesstoken value]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue      |
      | Accept            | /                |
      | Accept-Encoding   | gzip,deflate, br |
      | Connection        | keep-alive       |
      | Content-Type      | application/json |
    And I modify fields with random values and remove fields in "postAddmulipleoutlet" payload
      | JPath                       | Value           |
      | $.Outlets[0].Outlet.erp_id  | outlet1test    |
      | $.Outlets[1].Outlet.erp_id  | outlet0026gdgd |
    And I post the request with "postAddmulipleoutlet" payload with dynamic access token and query parameters
      | Query        | Value |
      | access_token |       |
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      | JPath   | Value             |
      | $.error | "invalid_request" |
    And verify response time is less than "2500" milliseconds

  Scenario: TC_04 add multiple outlet - Negative case [With invalid accesstoken value]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue      |
      | Accept            | /                |
      | Accept-Encoding   | gzip,deflate, br |
      | Connection        | keep-alive       |
      | Content-Type      | application/json |
    And I modify fields with random values and remove fields in "postAddmulipleoutlet" payload
      | JPath                       | Value           |
      | $.Outlets[0].Outlet.erp_id  | outlet1test    |
      | $.Outlets[1].Outlet.erp_id  | outlet0026gdgd |
    And I post the request with "postAddmulipleoutlet" payload with dynamic access token and query parameters
      | Query        | Value             |
      | access_token | invalidtextvalue |
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      | JPath   | Value            |
      | $.error | "invalid_grant"  |
    And verify response time is less than "2500" milliseconds

  Scenario: TC_05 add multiple outlet - Negative case [With null value]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue      |
      | Accept            | /                |
      | Accept-Encoding   | gzip,deflate, br |
      | Connection        | keep-alive       |
      | Content-Type      | application/json |
    And I modify fields with random values and remove fields in "postAddmulipleoutlet" payload
      | JPath                       | Value           |
      | $.Outlets[0].Outlet.erp_id  | outlet1test    |
      | $.Outlets[1].Outlet.erp_id  | outlet0026gdgd |
    And I post the request with "postAddmulipleoutlet" payload with dynamic access token and query parameters
      | Query        | Value |
      | access_token | null  |
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      | JPath   | Value           |
      | $.error | "invalid_grant" |
    And verify response time is less than "2500" milliseconds


  Scenario: TC_07 add multiple outlet - Negative case [With " " outlet name]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue      |
      | Accept            | /                |
      | Accept-Encoding   | gzip,deflate, br |
      | Connection        | keep-alive       |
      | Content-Type      | application/json |
    And I modify fields with random values and remove fields in "postAddmulipleoutlet" payload
      | JPath                    | Value |
      | $.Outlets[0].Outlet.name | ""    |
    And I post the request with "postAddmulipleoutlet" payload with dynamic access token and query parameters
      | Query        | Value         |
      | access_token | ACCESS_TOKEN |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath            | Value |
      | $.Data[0].Result | "true" |
    And verify response time is less than "2500" milliseconds

  Scenario: TC_08 add multiple outlet - Negative case [With wrong city id]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue      |
      | Accept            | /                |
      | Accept-Encoding   | gzip,deflate, br |
      | Connection        | keep-alive       |
      | Content-Type      | application/json |
    And I modify fields with random values and remove fields in "postAddmulipleoutlet" payload
      | JPath                         | Value |
      | $.Outlets[0].Outlet.city_id   | 167   |
      | $.Outlets[1].Outlet.city_id   | 178   |
    And I post the request with "postAddmulipleoutlet" payload with dynamic access token and query parameters
      | Query        | Value         |
      | access_token | ACCESS_TOKEN |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath            | Value                                      |
      | $.Data[0].Result | "false"                                   |
      | $.Data[0].Reason | "City is not belong to the given state."  |
    And verify response time is less than "2500" milliseconds

  Scenario: TC_09 add multiple outlet - Negative case [With not exist state id]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue      |
      | Accept            | /                |
      | Accept-Encoding   | gzip,deflate, br |
      | Connection        | keep-alive       |
      | Content-Type      | application/json |
    And I modify fields with random values and remove fields in "postAddmulipleoutlet" payload
      | JPath                          | Value |
      | $.Outlets[0].Outlet.state_id   | 1345  |
      | $.Outlets[1].Outlet.state_id   | 1564  |
    And I post the request with "postAddmulipleoutlet" payload with dynamic access token and query parameters
      | Query        | Value         |
      | access_token | ACCESS_TOKEN |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath            | Value                          |
      | $.Data[0].Result | "false"                       |
      | $.Data[0].Reason | "Invalid state id or erp id"  |
    And verify response time is less than "2500" milliseconds

  Scenario: TC_10 add multiple outlet - Negative case [Invalid GSTNO value]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue      |
      | Accept            | /                |
      | Accept-Encoding   | gzip,deflate, br |
      | Connection        | keep-alive       |
      | Content-Type      | application/json |
    And I modify fields with random values and remove fields in "postAddmulipleoutlet" payload
      | JPath                          | Value                     |
      | $.Outlets[0].Outlet.gstinno   | 29ABCDE1234F1Z5dddd       |
      | $.Outlets[1].Outlet.gstinno   | 29ABCDE1234F1Z5dddd       |
    And I post the request with "postAddmulipleoutlet" payload with dynamic access token and query parameters
      | Query        | Value         |
      | access_token | ACCESS_TOKEN |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath            | Value                                                                  |
      | $.Data[0].Result | "false"                                                               |
      | $.Data[0].Reason | "Please pass valid gstinno, 29ABCDE1234F1Z5dddd it is invalid gstinno" |
    And verify response time is less than "2500" milliseconds

  Scenario: TC_11 add multiple outlet - Negative case [Invalid GSTNO value=text]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue      |
      | Accept            | /                |
      | Accept-Encoding   | gzip,deflate, br |
      | Connection        | keep-alive       |
      | Content-Type      | application/json |
    And I modify fields with random values and remove fields in "postAddmulipleoutlet" payload
      | JPath                          | Value |
      | $.Outlets[0].Outlet.gstinno   | text  |
      | $.Outlets[1].Outlet.gstinno   | text  |
    And I post the request with "postAddmulipleoutlet" payload with dynamic access token and query parameters
      | Query        | Value         |
      | access_token | ACCESS_TOKEN |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath            | Value                                                     |
      | $.Data[0].Result | "false"                                                  |
      | $.Data[0].Reason | "Please pass valid gstinno, text it is invalid gstinno" |
    And verify response time is less than "2500" milliseconds

  Scenario: TC_12 add multiple outlet - Negative case [Invalid Area erpid]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue      |
      | Accept            | /                |
      | Accept-Encoding   | gzip,deflate, br |
      | Connection        | keep-alive       |
      | Content-Type      | application/json |
    And I modify fields with random values and remove fields in "postAddmulipleoutlet" payload
      | JPath                              | Value             |
      | $.Outlets[0].Outlet.area_erpid     | text invalidarea |
      | $.Outlets[1].Outlet.area_erpid     | text invaliderp  |
    And I post the request with "postAddmulipleoutlet" payload with dynamic access token and query parameters
      | Query        | Value         |
      | access_token | ACCESS_TOKEN |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath            | Value                                             |
      | $.Data[0].Result | "false"                                          |
      | $.Data[0].Reason | "Invalid or Inactive Area id / Area Erp id."     |
    And verify response time is less than "2500" milliseconds
