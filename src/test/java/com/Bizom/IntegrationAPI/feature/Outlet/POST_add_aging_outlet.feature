@Addagingapi @Sanity @All @Execution @allPost
Feature: Testcases for POST endpoint of Add Aging Outlet API

  @AddAgingOutletAPI_Post @Test1 @Addagingapi
  Scenario: TC_01 - Add Aging API for Outlet - Negative Case [Blank access token]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName      | HeaderValue |
      | Accept          | /           |
      | Accept-Encoding | gzip,deflate,br |
      | Connection      | keep-alive  |
      | Content-Type    | application/xml |
    And I modify fields with random values and remove fields in "postoutletaddageingapi" XML payload
      | XPath | Value |
    And I post the request with "postoutletaddageingapi" payload with dynamic access token and query parameters
      | Query        | Value |
      | access_token |       |
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      | JPath               | Value |
      | $.error             | invalid_request |
      | $.error_description |  The request is missing a required parameter, includes an unsupported parameter or parameter value, repeats the same parameter, uses more than one method for including an access token, or is otherwise malformed. |
    And verify response time is less than "2500" milliseconds

  @postoutletaddageingapi @Addagingapi
  Scenario: TC_02 - Add Aging API for Outlet - Negative Case [Incorrect date format]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName      | HeaderValue |
      | Accept          | /           |
      | Accept-Encoding | gzip,deflate,br |
      | Connection      | keep-alive  |
      | Content-Type    | application/xml |
    And I modify fields with random values and remove fields in "postoutletaddageingapi" XML payload
      | XPath                | Value |
      | /datas/data/ageingdate | test |
    And I post the request with "postoutletaddageingapi" payload with dynamic access token and query parameters
      | Query        | Value |
      | access_token | Access_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader | xmlValue |
      | Outlets.result | 0 |
      | Outlets.reason | Date should be in YYYY-MM-DD format. |
    And verify response headers
      | HeaderName   | HeaderValue |
      | Content-Type | text/html; charset=UTF-8 |
    And verify response time is less than "2500" milliseconds

  @postoutletaddageingapi @Addagingapi
  Scenario: TC_03 - Add Aging API for Outlet - Negative Case [Outlet ID as string]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName      | HeaderValue |
      | Accept          | /           |
      | Accept-Encoding | gzip,deflate,br |
      | Connection      | keep-alive  |
      | Content-Type    | application/xml |
    And I modify fields with random values and remove fields in "postoutletaddageingapi" XML payload
      | XPath            | Value |
      | /datas/data/outlet_id | test |
    And I post the request with "postoutletaddageingapi" payload with dynamic access token and query parameters
      | Query        | Value |
      | access_token | Access_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader | xmlValue |
      | Outlets.result | 0 |
      | Outlets.reason | Ageing Data could not be saved, Please try again. |
    And verify response headers
      | HeaderName   | HeaderValue |
      | Content-Type | text/html; charset=UTF-8 |
    And verify response time is less than "2500" milliseconds

  @postoutletaddageingapi @Addagingapi
  Scenario: TC_04 - Add Aging API for Outlet - Negative Case [Outlet ID empty]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName      | HeaderValue |
      | Accept          | /           |
      | Accept-Encoding | gzip,deflate,br |
      | Connection      | keep-alive  |
      | Content-Type    | application/xml |
    And I modify fields with random values and remove fields in "postoutletaddageingapi" XML payload
      | XPath            | Value |
      | /datas/data/outlet_id | |
    And I post the request with "postoutletaddageingapi" payload with dynamic access token and query parameters
      | Query        | Value |
      | access_token | Access_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader | xmlValue |
      | Outlets.result | 0 |
      | Outlets.reason | Missing mandatory field outlet_id / outlet_erp_id. |
    And verify response headers
      | HeaderName   | HeaderValue |
      | Content-Type | text/html; charset=UTF-8 |
    And verify response time is less than "2500" milliseconds

  @postoutletaddageingapi @Addagingapi
  Scenario: TC_05 - Add Aging API for Outlet - Negative Case [col_151_to_180 as string]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName      | HeaderValue |
      | Accept          | /           |
      | Accept-Encoding | gzip,deflate,br |
      | Connection      | keep-alive  |
      | Content-Type    | application/xml |
    And I modify fields with random values and remove fields in "postoutletaddageingapi" XML payload
      | XPath               | Value |
      | /datas/data/col_151_to_180 | teststring |
    And I post the request with "postoutletaddageingapi" payload with dynamic access token and query parameters
      | Query        | Value |
      | access_token | Access_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader | xmlValue |
      | Outlets.result | 0 |
      | Outlets.reason | Values must be numeric and non-empty. |
    And verify response headers
      | HeaderName   | HeaderValue |
      | Content-Type | text/html; charset=UTF-8 |
    And verify response time is less than "2500" milliseconds

  @postoutletaddageingapi @Addagingapi
  Scenario: TC_06 - Add Aging API for Outlet - Negative Case [col_151_to_180 empty value]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName      | HeaderValue |
      | Accept          | /           |
      | Accept-Encoding | gzip,deflate,br |
      | Connection      | keep-alive  |
      | Content-Type    | application/xml |
    And I modify fields with random values and remove fields in "postoutletaddageingapi" XML payload
      | XPath               | Value |
      | /datas/data/col_151_to_180 | |
    And I post the request with "postoutletaddageingapi" payload with dynamic access token and query parameters
      | Query        | Value |
      | access_token | Access_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader | xmlValue |
      | Outlets.result | 0 |
      | Outlets.reason | Values must be numeric and non-empty. |
    And verify response headers
      | HeaderName   | HeaderValue |
      | Content-Type | text/html; charset=UTF-8 |
    And verify response time is less than "2500" milliseconds

  @postoutletaddageingapi @Addagingapi
  Scenario: TC_07 - Add Aging API for Outlet - Negative Case [Empty date]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName      | HeaderValue |
      | Accept          | /           |
      | Accept-Encoding | gzip,deflate,br |
      | Connection      | keep-alive  |
      | Content-Type    | application/xml |
    And I modify fields with random values and remove fields in "postoutletaddageingapi" XML payload
      | XPath                | Value |
      | /datas/data/ageingdate | |
    And I post the request with "postoutletaddageingapi" payload with dynamic access token and query parameters
      | Query        | Value |
      | access_token | Access_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader | xmlValue |
      | Outlets.result | 0 |
      | Outlets.reason | Date should be in YYYY-MM-DD format. |
    And verify response headers
      | HeaderName   | HeaderValue |
      | Content-Type | text/html; charset=UTF-8 |
    And verify response time is less than "2500" milliseconds

  @postoutletaddageingapi @Addagingapi
  Scenario: TC_08 - Add Aging API for Outlet - Negative Case [Empty total field (mandatory)]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName      | HeaderValue |
      | Accept          | /           |
      | Accept-Encoding | gzip,deflate,br |
      | Connection      | keep-alive  |
      | Content-Type    | application/xml |
    And I modify fields with random values and remove fields in "postoutletaddageingapi" XML payload
      | XPath        | Value |
      | /datas/data/total | |
    And I post the request with "postoutletaddageingapi" payload with dynamic access token and query parameters
      | Query        | Value |
      | access_token | Access_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader | xmlValue |
      | Outlets.result | 0 |
      | Outlets.reason | Values must be numeric and non-empty. |
    And verify response headers
      | HeaderName   | HeaderValue |
      | Content-Type | text/html; charset=UTF-8 |
    And verify response time is less than "2500" milliseconds
