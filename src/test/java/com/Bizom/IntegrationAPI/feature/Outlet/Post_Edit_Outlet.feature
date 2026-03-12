@EditOutlet @Sanity @All @Execution @allPost
Feature: This feature file contains the test cases of POST endpoint of Edit Outlet API

  @EditOutlet
  Scenario: TC_01 edit outlet - positive case
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName      | HeaderValue       |
      | Content-Type    | application/json  |
      | Accept          | */*               |
      | Accept-Encoding | gzip,deflate,br   |
      | Connection      | keep-alive        |
    And I modify fields with random values and remove fields in "postEditoutlet" XML payload
      | XPath                  | Value             |
      | /Outlets/Outlet/erp_id | API_19032023_001 |
      | /Outlets/Outlet/name   | test_db002       |
    And I post the request with "postEditoutlet" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | Access_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader  | xmlValue                   |
      | Outlets.Result | true                       |
      | Outlets.Reason | Outlet updated successfully |
    And I verify the data got updated as needed from DB
      | expectedColumn               | expectedValue |
      | DB:outlets:name:id = 5361    | test_db002    |
    And verify response time is less than "2500" milliseconds

  @EditOutlet @test2
  Scenario: TC_02 edit outlet - Negative case [without access token]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName      | HeaderValue       |
      | Content-Type    | application/json  |
      | Accept          | */*               |
      | Accept-Encoding | gzip,deflate,br   |
      | Connection      | keep-alive        |
    And I modify fields with random values and remove fields in "postEditoutlet" XML payload
      | XPath                  | Value             |
      | /Outlets/Outlet/erp_id | API_19032023_001 |
    And I post the request with "postEditoutlet" payload with dynamic access token and query parameters
      | Query        | Value |
      | access_token |       |
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      | JPath   | Value           |
      | $.error | invalid_request |
    And verify response time is less than "2500" milliseconds

  @EditOutlet
  Scenario: TC_03 edit outlet - Negative case [without ERP id]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName      | HeaderValue       |
      | Content-Type    | application/json  |
      | Accept          | */*               |
      | Accept-Encoding | gzip,deflate,br   |
      | Connection      | keep-alive        |
    And I modify fields with random values and remove fields in "postEditoutlet" XML payload
      | XPath                  | Value |
      | /Outlets/Outlet/erp_id |       |
    And I post the request with "postEditoutlet" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | Access_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader  | xmlValue                       |
      | Outlets.Result | 0                              |
      | Outlets.reason | Please fill all the parameters |
    And verify response time is less than "2500" milliseconds

  @EditOutlet
  Scenario: TC_04 edit outlet - Negative case [empty outlet name]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName      | HeaderValue       |
      | Content-Type    | application/json  |
      | Accept          | */*               |
      | Accept-Encoding | gzip,deflate,br   |
      | Connection      | keep-alive        |
    And I modify fields with random values and remove fields in "postEditoutlet" XML payload
      | XPath                  | Value             |
      | /Outlets/Outlet/erp_id | API_19032023_001 |
      | /Outlets/Outlet/name   |                  |
    And I post the request with "postEditoutlet" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | Access_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader  | xmlValue                                 |
      | Outlets.Result | false                                    |
      | Outlets.Reason | Failed to add outlet, please try again   |
    And verify response time is less than "2500" milliseconds

  @EditOutlet
  Scenario: TC_05 edit outlet - Negative case [wrong email format]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName      | HeaderValue       |
      | Content-Type    | application/json  |
      | Accept          | */*               |
      | Accept-Encoding | gzip,deflate,br   |
      | Connection      | keep-alive        |
    And I modify fields with random values and remove fields in "postEditoutlet" XML payload
      | XPath                  | Value             |
      | /Outlets/Outlet/erp_id | API_19032023_001 |
      | /Outlets/Outlet/email  | email            |
    And I post the request with "postEditoutlet" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | Access_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader  | xmlValue |
      | Outlets.Result | true     |
    And verify response time is less than "2500" milliseconds

  @EditOutlet
  Scenario: TC_06 edit outlet - Negative case [wrong gstin format]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName      | HeaderValue       |
      | Content-Type    | application/json  |
      | Accept          | */*               |
      | Accept-Encoding | gzip,deflate,br   |
      | Connection      | keep-alive        |
    And I modify fields with random values and remove fields in "postEditoutlet" XML payload
      | XPath                  | Value             |
      | /Outlets/Outlet/erp_id | API_19032023_001 |
      | /Outlets/Outlet/gstinno | testwronggstno  |
    And I post the request with "postEditoutlet" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | Access_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader  | xmlValue                                                         |
      | Outlets.Result | false                                                            |
      | Outlets.Reason | Please pass valid gstinno, testwronggstno it is invalid gstinno  |
    And verify response time is less than "2500" milliseconds

  @EditOutlet
  Scenario: TC_07 edit outlet - Negative case [non-numeric city id]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName      | HeaderValue       |
      | Content-Type    | application/json  |
      | Accept          | */*               |
      | Accept-Encoding | gzip,deflate,br   |
      | Connection      | keep-alive        |
    And I modify fields with random values and remove fields in "postEditoutlet" XML payload
      | XPath                  | Value             |
      | /Outlets/Outlet/erp_id | API_19032023_001 |
      | /Outlets/Outlet/city_id| nonnumericcity   |
    And I post the request with "postEditoutlet" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | Access_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader  | xmlValue                          |
      | Outlets.Result | false                             |
      | Outlets.Reason | Invalid city id or erp id or name |
    And verify response time is less than "2500" milliseconds

  @EditOutlet
  Scenario: TC_08 edit outlet - Negative case [non-numeric beat id]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName      | HeaderValue       |
      | Content-Type    | application/json  |
      | Accept          | */*               |
      | Accept-Encoding | gzip,deflate,br   |
      | Connection      | keep-alive        |
    And I modify fields with random values and remove fields in "postEditoutlet" XML payload
      | XPath                  | Value              |
      | /Outlets/Outlet/erp_id | API_19032023_001  |
      | /Outlets/Outlet/beat_id| nonnumericbeatid  |
    And I post the request with "postEditoutlet" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | Access_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader  | xmlValue                                                                    |
      | Outlets.Result | false                                                                       |
      | Outlets.Reason | There are some invalid and in active beats are present.nonnumericbeatid     |
    And verify response time is less than "2500" milliseconds

  @EditOutlet
  Scenario: TC_09 edit outlet - Negative case [owner mobile non-numeric]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName      | HeaderValue       |
      | Content-Type    | application/json  |
      | Accept          | */*               |
      | Accept-Encoding | gzip,deflate,br   |
      | Connection      | keep-alive        |
    And I modify fields with random values and remove fields in "postEditoutlet" XML payload
      | XPath                    | Value             |
      | /Outlets/Outlet/erp_id   | API_19032023_001 |
      | /Outlets/Outlet/ownermobile | nonnumericbeatid |
    And I post the request with "postEditoutlet" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | Access_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader  | xmlValue |
      | Outlets.Result | true     |
    And verify response time is less than "2500" milliseconds

  @EditOutlet
  Scenario: TC_10 edit outlet - Negative case [pin non-numeric]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName      | HeaderValue       |
      | Content-Type    | application/json  |
      | Accept          | */*               |
      | Accept-Encoding | gzip,deflate,br   |
      | Connection      | keep-alive        |
    And I modify fields with random values and remove fields in "postEditoutlet" XML payload
      | XPath                  | Value             |
      | /Outlets/Outlet/erp_id | API_19032023_001 |
      | /Outlets/Outlet/pin    | nonnumericpin    |
    And I post the request with "postEditoutlet" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | Access_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader  | xmlValue |
      | Outlets.Result | true     |
    And verify response time is less than "2500" milliseconds

  @EditOutlet
  Scenario: TC_11 edit outlet - Negative case [invalid access token]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName      | HeaderValue       |
      | Content-Type    | application/json  |
      | Accept          | */*               |
      | Accept-Encoding | gzip,deflate,br   |
      | Connection      | keep-alive        |
    And I modify fields with random values and remove fields in "postEditoutlet" XML payload
      | XPath                  | Value             |
      | /Outlets/Outlet/erp_id | API_19032023_001 |
      | /Outlets/Outlet/pin    | nonnumericpin    |
    And I post the request with "postEditoutlet" payload with dynamic access token and query parameters
      | Query        | Value               |
      | access_token | incorrect accesstoken |
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      | JPath   | Value         |
      | $.error | invalid_grant |
    And verify response time is less than "2500" milliseconds

  @EditOutlet
  Scenario: TC_12 edit outlet - Negative case [empty Area ERP ID]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName      | HeaderValue       |
      | Content-Type    | application/json  |
      | Accept          | */*               |
      | Accept-Encoding | gzip,deflate,br   |
      | Connection      | keep-alive        |
    And I modify fields with random values and remove fields in "postEditoutlet" XML payload
      | XPath                      | Value             |
      | /Outlets/Outlet/erp_id     | API_19032023_001 |
      | /Outlets/Outlet/area_erpid |                  |
    And I post the request with "postEditoutlet" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | Access_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader  | xmlValue            |
      | Outlets.Result | 0                   |
      | Outlets.reason | Please define area. |
    And verify response time is less than "2500" milliseconds
