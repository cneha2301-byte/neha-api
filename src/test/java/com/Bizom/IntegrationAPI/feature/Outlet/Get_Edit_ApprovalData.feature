@getEditApprovalDataApi @sanity @all @allGet @Execution
Feature: Testcases for Counter Outlets API


  Scenario: TC_01 - getEditApprovalDataApi details - Positive Case [with all parameters]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName      | HeaderValue         |
      | Accept          | */*                 |
      | Accept-Encoding | gzip,deflate,br    |
      | Connection      | keep-alive          |
    And I send the GET request to "getEditApprovalDataApi" endpoint with dynamic access token, path and query parameters
      | QueryParamName | QueryParamValue |
      | access_token   | Access_TOKEN    |
      | from_date      | 2025-07-17      |
      | to_date        | 2025-11-04      |
      | outlet_id      | 5460            |
      | responsetype   | json            |
    Then I should see the response code as "200"
    And I store the response as "modified" name using full path
    And the fields in response should match with expected values
      | JPath    | Value                    |
      | $.Result | true                     |
      | $.Reason | Data found successfully. |
    And verify response headers
      | HeaderName   | HeaderValue              |
      | Content-Type | text/html; charset=UTF-8 |
    And I verify the data got updated as needed from DB
      | expectedColumn                             | expectedValue |
      | DB:editapprovals:id:id=17 AND entity_id=5460 | 17          |
    And verify response time is less than "2500" milliseconds




  Scenario: TC_02 - getEditApprovalDataApi - Negative Case [Without any query parameter values]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName      | HeaderValue       |
      | Accept          | application/json  |
      | Accept-Encoding | gzip,deflate,br  |
      | Connection      | keep-alive        |
    And I send the GET request to "getEditApprovalDataApi" endpoint with dynamic access token, path and query parameters
      | QueryParamName | QueryParamValue |
      | access_token   | Access_TOKEN    |
      | from_date      |                 |
      | to_date        |                 |
      | outlet_id      |                 |
      | pagesize       |                 |
      | responsetype   |                 |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath    | Value                    |
      | $.Result | true                     |
      | $.Reason | Data found successfully. |
    And verify response headers
      | HeaderName   | HeaderValue              |
      | Content-Type | text/html; charset=UTF-8 |
    And verify response time is less than "2500" milliseconds




  Scenario: TC_03 - getEditApprovalDataApi - Negative Case [Without access token value]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName      | HeaderValue       |
      | Accept          | application/json  |
      | Accept-Encoding | gzip,deflate,br  |
      | Connection      | keep-alive        |
    And I send the GET request to "getEditApprovalDataApi" endpoint with dynamic access token, path and query parameters
      | QueryParamName | QueryParamValue |
      | access_token   |                 |
      | from_date      | 2025-07-17      |
      | to_date        | 2025-11-04      |
      | outlet_id      | 5460            |
      | pagesize       | 100             |
      | responsetype   | json            |
    Then I should see the response code as "401"
    And I store the response as "" name using full path
    And the fields in response should match with expected values
      | JPath   | Value             |
      | $.error | "invalid_request" |
    And verify response headers
      | HeaderName   | HeaderValue              |
      | Content-Type | text/html; charset=UTF-8 |
    And verify response time is less than "2500" milliseconds




  Scenario: TC_04 - getEditApprovalDataApi - Negative Case [Without access token key]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName      | HeaderValue       |
      | Accept          | application/json  |
      | Accept-Encoding | gzip,deflate,br  |
      | Connection      | keep-alive        |
    And I send the GET request to "getEditApprovalDataApi" endpoint with dynamic access token, path and query parameters
      | QueryParamName | QueryParamValue |
      |                | Access_TOKEN    |
      | from_date      | 2025-07-17      |
      | to_date        | 2025-11-04      |
      | outlet_id      | 5460            |
      | pagesize       | 100             |
      | responsetype   | json            |
    Then I should see the response code as "401"
    And I store the response as "" name using full path
    And the fields in response should match with expected values
      | JPath               | Value                             |
      | $.error             | "invalid_request"                 |
      | $.error_description | "The access token was not found." |
    And verify response headers
      | HeaderName   | HeaderValue              |
      | Content-Type | text/html; charset=UTF-8 |
    And verify response time is less than "2500" milliseconds




  Scenario: TC_05 - getEditApprovalDataApi - Negative Case [With wrong outlet id]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName      | HeaderValue       |
      | Accept          | application/json  |
      | Accept-Encoding | gzip,deflate,br  |
      | Connection      | keep-alive        |
    And I send the GET request to "getEditApprovalDataApi" endpoint with dynamic access token, path and query parameters
      | QueryParamName | QueryParamValue |
      | access_token   | Access_TOKEN    |
      | from_date      | 2025-07-17      |
      | to_date        | 2025-11-04      |
      | outlet_id      | test            |
      | pagesize       | 100             |
      | responsetype   | json            |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath    | Value                                                |
      | $.Result | false                                                |
      | $.Reason | Invalid outlet_id. Must contain only numeric values. |
    And verify response headers
      | HeaderName   | HeaderValue              |
      | Content-Type | text/html; charset=UTF-8 |
    And verify response time is less than "2500" milliseconds




  Scenario: TC_06 - getEditApprovalDataApi - Negative Case [With wrong Status - expected : PENDING,REJECTED,APPROVED]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName      | HeaderValue       |
      | Accept          | application/json  |
      | Accept-Encoding | gzip,deflate,br  |
      | Connection      | keep-alive        |
    And I send the GET request to "getEditApprovalDataApi" endpoint with dynamic access token, path and query parameters
      | QueryParamName | QueryParamValue |
      | access_token   | Access_TOKEN    |
      | from_date      | 2025-07-17      |
      | to_date        | 2025-11-04      |
      | outlet_id      | 5460            |
      | status         | pending001      |
      | responsetype   | json            |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath    | Value                                                        |
      | $.Result | false                                                        |
      | $.Reason | Invalid status. Valid values are: APPROVED, PENDING, REJECTED |
    And verify response headers
      | HeaderName   | HeaderValue              |
      | Content-Type | text/html; charset=UTF-8 |
    And verify response time is less than "2500" milliseconds




  Scenario: TC_07 - getEditApprovalDataApi - Negative Case [With wrong date_type - Here expected : created/modified]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName      | HeaderValue       |
      | Accept          | application/json  |
      | Accept-Encoding | gzip,deflate,br  |
      | Connection      | keep-alive        |
    And I send the GET request to "getEditApprovalDataApi" endpoint with dynamic access token, path and query parameters
      | QueryParamName | QueryParamValue |
      | access_token   | Access_TOKEN    |
      | date_type      | created001      |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath    | Value |
      | $.Result | false |
    And verify response headers
      | HeaderName   | HeaderValue              |
      | Content-Type | text/html; charset=UTF-8 |
    And verify response time is less than "2500" milliseconds




  Scenario: TC_08 - getEditApprovalDataApi - Negative Case [With wrong pageno[-1]/it will accept]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName      | HeaderValue       |
      | Accept          | application/json  |
      | Accept-Encoding | gzip,deflate,br  |
      | Connection      | keep-alive        |
    And I send the GET request to "getEditApprovalDataApi" endpoint with dynamic access token, path and query parameters
      | QueryParamName | QueryParamValue |
      | access_token   | Access_TOKEN    |
      | pageno         | -1              |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath    | Value                    |
      | $.Result | true                     |
      | $.Reason | Data found successfully. |
    And verify response headers
      | HeaderName   | HeaderValue              |
      | Content-Type | text/html; charset=UTF-8 |
    And verify response time is less than "2500" milliseconds




  Scenario: TC_09 - getEditApprovalDataApi - Negative Case [With irrelevant outlet id but with correct format]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName      | HeaderValue       |
      | Accept          | application/json  |
      | Accept-Encoding | gzip,deflate,br  |
      | Connection      | keep-alive        |
    And I send the GET request to "getEditApprovalDataApi" endpoint with dynamic access token and query parameters
      | QueryParamName | QueryParamValue |
      | access_token   | Access_TOKEN    |
      | outlet_id      | 45688888888     |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath    | Value        |
      | $.Result | false        |
      | $.Reason | No data found. |
    And verify response headers
      | HeaderName   | HeaderValue              |
      | Content-Type | text/html; charset=UTF-8 |
    And verify response time is less than "2500" milliseconds




  Scenario: TC_10 - getEditApprovalDataApi - Negative Case [With relevant outlet id but with irrelevant date]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName      | HeaderValue       |
      | Accept          | application/json  |
      | Accept-Encoding | gzip,deflate,br  |
      | Connection      | keep-alive        |
    And I send the GET request to "getEditApprovalDataApi" endpoint with dynamic access token and query parameters
      | QueryParamName | QueryParamValue |
      | access_token   | Access_TOKEN    |
      | outlet_id      | 5460            |
      | from_date      | 2001-07-19      |
      | to_date        | 2001-09-10      |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath    | Value        |
      | $.Result | false        |
      | $.Reason | No data found. |
    And verify response headers
      | HeaderName   | HeaderValue              |
      | Content-Type | text/html; charset=UTF-8 |
    And verify response time is less than "2500" milliseconds

