@approvereturn @Sanity @All @Execution
Feature: This feature file is of the testcases of POST end point of Approve SaleReturn Api
  @ApproveSalesReturnNegative
  Scenario: TC_01 Approve SaleReturn -  negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "POST_ApproveSaleReturn" XML payload
      | XPath         | Value       |
      |/salesreturns/salesreturn/skunit_erpid|random|
    And I post the request with "POST_ApproveSaleReturn" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader         |xmlValue       |
      | /Salesreturns/errors   |The entered key: skunit_erpid does not exist in the system on row: 1.0|
    And verify response time is less than "2500" milliseconds

  Scenario: TC_02 Approve SaleReturn -  sale return no given already approved, and no pending for approval
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "POST_ApproveSaleReturn" XML payload
      | XPath         | Value       |
      |/salesreturns/salesreturn/skunit_erpid|6|
      |/salesreturns/salesreturn/salereturn_no|113|
    And I post the request with "POST_ApproveSaleReturn" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader         |xmlValue       |
      | /Salesreturns/errors   |0Could not find any resource for the Salereturn No: 113 on row: 1.|
    And verify response time is less than "2500" milliseconds

  Scenario: TC_03 Approve SaleReturn -  from and to outlet id invalid
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "POST_ApproveSaleReturn" XML payload
      | XPath         | Value       |
      |/salesreturns/salesreturn/fromoutlet_erpid|random|
    And I post the request with "POST_ApproveSaleReturn" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader         |xmlValue       |
      | /Salesreturns/errors   |The entered key: fromoutlet_erpid does not exist in the system on row: 1. The entered key: tooutlet_erpid does not exist in the system on row: 1.0|
    And verify response time is less than "2500" milliseconds

  @DBvalidationsalereturn
  Scenario: TC_04 Approve SaleReturn -  DB validation
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "POST_ApproveSaleReturn" XML payload
      | XPath         | Value       |
      |/salesreturns/salesreturn/fromoutlet_erpid|random|
    And I post the request with "POST_ApproveSaleReturn" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    Then I validate DB record in table "salemansalesreturns" with where "salereturn_no='155'"
      | column | value |
      | salesreturnstate_id | 2     |
