@Addoutlet @Sanity @All @Execution @allPost
Feature: This feature file is of the testcases of POST end point of Add Outlet API

  @AddOutlet
  Scenario: TC_01 add outlet - positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName      |HeaderValue        |
      |Content-Type    |application/json   |
      |Accept          |*/*                |
      |Accept-Encoding |gzip,deflate, br   |
      |Connection      |keep-alive         |
    And I modify fields with random values and remove fields in "postAddoutlet" XML payload
      |XPath                    |Value          |
      |/Outlets/Outlet/erp_id   |randomAlphaNum |
      |/Outlets/Outlet/name   |Outlet001 |

    And I post the request with "postAddoutlet" payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |Access_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader    |xmlValue                     |
      |Outlets.Result   |true                         |
      |Outlets.Reason   |Outlet added successfully    |
      |Outlets.Reason   |Outlet added successfully    |

    And I verify the data got updated as needed from DB
      |expectedColumn |expectedValue |
      |DB:outlets:name:id = (SELECT MAX(id) FROM outlets) |Outlet001 |


    And verify response time is less than "2500" milliseconds

  @AddOutlet @test2
  Scenario: TC_02 add outlet - Negative case [without access token]
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName      |HeaderValue        |
      |Content-Type    |application/json   |
      |Accept          |*/*                |
      |Accept-Encoding |gzip,deflate, br   |
      |Connection      |keep-alive         |
    And I modify fields with random values and remove fields in "postAddoutlet" XML payload
      |XPath                    |Value          |
      |/Outlets/Outlet/erp_id   |randomAlphaNum |
    And I post the request with "postAddoutlet" payload with dynamic access token and query parameters
      |Query        |Value |
      |access_token |      |
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      |JPath      |Value            |
      |$.error    |invalid_request  |
    And verify response time is less than "2500" milliseconds


  @AddOutlet
  Scenario: TC_03 add outlet - Negative case [without ERP id]
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName      |HeaderValue        |
      |Content-Type    |application/json   |
      |Accept          |*/*                |
      |Accept-Encoding |gzip,deflate, br   |
      |Connection      |keep-alive         |
    And I modify fields with random values and remove fields in "postAddoutlet" XML payload
      |XPath                    |Value |
      |/Outlets/Outlet/erp_id   |      |
    And I post the request with "postAddoutlet" payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |Access_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader    |xmlValue                       |
      |Outlets.Result   |0                              |
      |Outlets.reason   |Please fill all the parameters |
    And verify response time is less than "2500" milliseconds


  @AddOutlet
  Scenario: TC_04 add outlet - Negative case [empty outlet name]
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName      |HeaderValue        |
      |Content-Type    |application/json   |
      |Accept          |*/*                |
      |Accept-Encoding |gzip,deflate, br   |
      |Connection      |keep-alive         |
    And I modify fields with random values and remove fields in "postAddoutlet" XML payload
      |XPath                      |Value          |
      |/Outlets/Outlet/erp_id     |randomAlphaNum |
      |/Outlets/Outlet/name       |               |
    And I post the request with "postAddoutlet" payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |Access_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader    |xmlValue                           |
      |Outlets.Result   |0                                  |
      |Outlets.reason   |Please fill all the parameters.     |
    And verify response time is less than "2500" milliseconds


  @AddOutlet
  Scenario: TC_05 add outlet - Negative case [wrong email format]
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName      |HeaderValue        |
      |Content-Type    |application/json   |
      |Accept          |*/*                |
      |Accept-Encoding |gzip,deflate, br   |
      |Connection      |keep-alive         |
    And I modify fields with random values and remove fields in "postAddoutlet" XML payload
      |XPath                    |Value |
      |/Outlets/Outlet/erp_id   |randomAlphaNum |
      |/Outlets/Outlet/email    |email          |
    And I post the request with "postAddoutlet" payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |Access_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader    |xmlValue                |
      |Outlets.Result   |false                   |
      |Outlets.Reason   |Invalid email address.  |
    And verify response time is less than "2500" milliseconds


  @AddOutlet
  Scenario: TC_06 add outlet - Negative case [wrong gstin format]
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName      |HeaderValue        |
      |Content-Type    |application/json   |
      |Accept          |*/*                |
      |Accept-Encoding |gzip,deflate, br   |
      |Connection      |keep-alive         |
    And I modify fields with random values and remove fields in "postAddoutlet" XML payload
      |XPath                       |Value          |
      |/Outlets/Outlet/erp_id      |randomAlphaNum |
      |/Outlets/Outlet/gstinno     |testwronggstno |
    And I post the request with "postAddoutlet" payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |Access_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader    |xmlValue                                                         |
      |Outlets.Result   |false                                                            |
      |Outlets.Reason   |Please pass valid gstinno, testwronggstno it is invalid gstinno  |
    And verify response time is less than "2500" milliseconds


  @AddOutlet
  Scenario: TC_07 add outlet - Negative case [non-numeric city id]
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName      |HeaderValue        |
      |Content-Type    |application/json   |
      |Accept          |*/*                |
      |Accept-Encoding |gzip,deflate, br   |
      |Connection      |keep-alive         |
    And I modify fields with random values and remove fields in "postAddoutlet" XML payload
      |XPath                      |Value             |
      |/Outlets/Outlet/erp_id     |randomAlphaNum    |
      |/Outlets/Outlet/city_id    |nonnumericcity    |
    And I post the request with "postAddoutlet" payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |Access_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader    |xmlValue                                  |
      |Outlets.Result   |false                                     |
      |Outlets.Reason   |Invalid city id or erp id or name         |
    And verify response time is less than "2500" milliseconds


  @AddOutlet
  Scenario: TC_08 add outlet - Negative case [non-numeric beat id]
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName      |HeaderValue        |
      |Content-Type    |application/json   |
      |Accept          |*/*                |
      |Accept-Encoding |gzip,deflate, br   |
      |Connection      |keep-alive         |
    And I modify fields with random values and remove fields in "postAddoutlet" XML payload
      |XPath                     |Value            |
      |/Outlets/Outlet/erp_id    |randomAlphaNum   |
      |/Outlets/Outlet/beat_id   |nonnumericbeatid |
    And I post the request with "postAddoutlet" payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |Access_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader    |xmlValue                                                            |
      |Outlets.Result   |false                                                               |
      |Outlets.Reason   |There are some invalid and in active beats are present.nonnumericbeatid|
    And verify response time is less than "2500" milliseconds


  @AddOutlet
  Scenario: TC_09 add outlet - Negative case [owner mobile non-numeric]
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName      |HeaderValue        |
      |Content-Type    |application/json   |
      |Accept          |*/*                |
      |Accept-Encoding |gzip,deflate, br   |
      |Connection      |keep-alive         |
    And I modify fields with random values and remove fields in "postAddoutlet" XML payload
      |XPath                         |Value             |
      |/Outlets/Outlet/erp_id        |randomAlphaNum    |
      |/Outlets/Outlet/ownermobile   |nonnumericbeatid  |
    And I post the request with "postAddoutlet" payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |Access_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader    |xmlValue               |
      |Outlets.Result   |false                  |
      |Outlets.Reason   |Invalid ownermobile.   |
    And verify response time is less than "2500" milliseconds


  @AddOutlet
  Scenario: TC_10 add outlet - Negative case [pin non-numeric]
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName      |HeaderValue        |
      |Content-Type    |application/json   |
      |Accept          |*/*                |
      |Accept-Encoding |gzip,deflate, br   |
      |Connection      |keep-alive         |
    And I modify fields with random values and remove fields in "postAddoutlet" XML payload
      |XPath                   |Value           |
      |/Outlets/Outlet/erp_id  |randomAlphaNum  |
      |/Outlets/Outlet/pin     |nonnumericpin   |
    And I post the request with "postAddoutlet" payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |Access_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader    |xmlValue           |
      |Outlets.Result   |false              |
      |Outlets.Reason   |Invalid pin no.    |
    And verify response time is less than "2500" milliseconds


  @AddOutlet
  Scenario: TC_11 add outlet - Negative case [invalid access token]
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName      |HeaderValue        |
      |Content-Type    |application/json   |
      |Accept          |*/*                |
      |Accept-Encoding |gzip,deflate, br   |
      |Connection      |keep-alive         |
    And I modify fields with random values and remove fields in "postAddoutlet" XML payload
      |XPath                   |Value           |
      |/Outlets/Outlet/erp_id  |randomAlphaNum  |
      |/Outlets/Outlet/pin     |nonnumericpin   |
    And I post the request with "postAddoutlet" payload with dynamic access token and query parameters
      |Query        |Value                |
      |access_token |incorrect accesstoken|
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      |JPath      |Value          |
      |$.error    |invalid_grant  |
    And verify response time is less than "2500" milliseconds


  @AddOutletDBValidation @DataIntegrity
  Scenario: TC_12 Verify outlet data persisted in DB
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName      |HeaderValue        |
      |Accept          |*/*                |
      |Accept-Encoding |gzip,deflate, br   |
      |Connection      |keep-alive         |
      |Content-Type    |application/xml    |
    And I modify fields with random values and remove fields in "postAddoutlet" XML payload
      |XPath                    |Value      |
      |/Outlets/Outlet/name     |Outlet_DB  |
    And I post the request with "postAddoutlet" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader    |xmlValue                  |
      |Outlets.Result   |true                      |
      |Outlets.Reason   |Outlet added successfully |
    And I verify the data got updated as needed from DB
      |expectedColumn |expectedValue |
      |DB:outlets:name:id = (SELECT MAX(id) FROM outlets) |Outlet_DB |
    And verify response time is less than "2500" milliseconds



  @AddOutletDBValidation @DataIntegrity
  Scenario: TC_12 Verify City id  mapping
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName      |HeaderValue        |
      |Accept          |*/*                |
      |Accept-Encoding |gzip,deflate, br   |
      |Connection      |keep-alive         |
      |Content-Type    |application/xml    |
    And I modify fields with random values and remove fields in "postAddoutlet" XML payload
      |XPath                    |Value      |
      |/Outlets/Outlet/city_id     |667  |
    And I post the request with "postAddoutlet" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader    |xmlValue                  |
      |Outlets.Result   |true                      |
      |Outlets.Reason   |Outlet added successfully |
    And I verify the data got updated as needed from DB
      |expectedColumn |expectedValue |
      |DB:outlets:name:id = (SELECT MAX(id) FROM outlets) |Outlet_DB |
    And verify response time is less than "2500" milliseconds


  Scenario: TC_13 Verify District  id  mapping
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName      |HeaderValue        |
      |Accept          |*/*                |
      |Accept-Encoding |gzip,deflate, br   |
      |Connection      |keep-alive         |
      |Content-Type    |application/xml    |
    And I modify fields with random values and remove fields in "postAddoutlet" XML payload
      |XPath                    |Value      |
      |/Outlets/Outlet/district_id     |376  |
    And I post the request with "postAddoutlet" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader    |xmlValue                  |
      |Outlets.Result   |true                      |
      |Outlets.Reason   |Outlet added successfully |
    And I verify the data got updated as needed from DB
      |expectedColumn |expectedValue |
      |DB:outlets:name:id = (SELECT MAX(id) FROM outlets) |Outlet_DB |
    And verify response time is less than "2500" milliseconds

  Scenario: TC_14 Verify state  id  mapping
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName      |HeaderValue        |
      |Accept          |*/*                |
      |Accept-Encoding |gzip,deflate, br   |
      |Connection      |keep-alive         |
      |Content-Type    |application/xml    |
    And I modify fields with random values and remove fields in "postAddoutlet" XML payload
      |XPath                    |Value      |
      |/Outlets/Outlet/state_id     |21  |
    And I post the request with "postAddoutlet" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader    |xmlValue                  |
      |Outlets.Result   |true                      |
      |Outlets.Reason   |Outlet added successfully |
    And I verify the data got updated as needed from DB
      |expectedColumn |expectedValue |
      |DB:outlets:name:id = (SELECT MAX(id) FROM outlets) |Outlet_DB |
    And verify response time is less than "2500" milliseconds

  Scenario: TC_15 Verify  empty state  id  mapping
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName      |HeaderValue        |
      |Accept          |*/*                |
      |Accept-Encoding |gzip,deflate, br   |
      |Connection      |keep-alive         |
      |Content-Type    |application/xml    |
    And I modify fields with random values and remove fields in "postAddoutlet" XML payload
      |XPath                    |Value      |
      |/Outlets/Outlet/state_id     |  |
    And I post the request with "postAddoutlet" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader    |xmlValue                  |
      |Outlets.Result   |true                      |
      |Outlets.Reason   |Outlet added successfully |
    And I verify the data got updated as needed from DB
      |expectedColumn |expectedValue |
      |DB:outlets:name:id = (SELECT MAX(id) FROM outlets) |Outlet_DB |
    And verify response time is less than "2500" milliseconds


  Scenario: TC_16 Verify  empty distrcits   id  mapping
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName      |HeaderValue        |
      |Accept          |*/*                |
      |Accept-Encoding |gzip,deflate, br   |
      |Connection      |keep-alive         |
      |Content-Type    |application/xml    |
    And I modify fields with random values and remove fields in "postAddoutlet" XML payload
      |XPath                    |Value      |
      |/Outlets/Outlet/district_id     |  |
    And I post the request with "postAddoutlet" xml payload with dynamic access token and query parameters
      |Query        |Value        |
      |access_token |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      |xmlPathHeader    |xmlValue                  |
      |Outlets.Result   |true                      |
      |Outlets.Reason   |Outlet added successfully |
    And I verify the data got updated as needed from DB
      |expectedColumn |expectedValue |
      |DB:outlets:name:id = (SELECT MAX(id) FROM outlets) |Outlet_DB |
    And verify response time is less than "2500" milliseconds





