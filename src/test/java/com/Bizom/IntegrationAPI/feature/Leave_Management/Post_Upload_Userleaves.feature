@uploaduserleaves @Sanity @All @Execution @allPost
Feature: Testcases for POST upload user leaves endpoint

  Scenario: TC_01 Upload User leaves - positive
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName      | HeaderValue           |
      | Accept          | */*                   |
      | Connection      | keep-alive            |
      | Accept-Encoding | gzip, deflate, br     |
      | Content-Type    | application/json      |
    And I post the request with "Post_Upload_userleaves" payload with dynamic access token and query parameters
      | Query        | Value                                    |
      | access_token | ACCESS_TOKEN |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath    | Value                           |
      | $.Result | true                            |
      | $.Reason | "Leave(s) processed successfully." |
    And I verify the data got updated as needed from DB
      | expectedColumn                                                                 | expectedValue |
      | DB:userleaves:user_id:id = (SELECT MAX(id) FROM userleaves WHERE status = 'approved') | 1 |
    And verify response time is less than "2500" milliseconds


  Scenario: TC_02 Upload User leaves - negative [Empty access token]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName      | HeaderValue       |
      | Accept          | */*               |
      | Connection      | keep-alive        |
      | Accept-Encoding | gzip, deflate, br |
      | Content-Type    | application/json  |
    And I post the request with "Post_Upload_userleaves" payload with dynamic access token and query parameters
      | Query        | Value |
      | access_token |       |
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      | JPath   | Value             |
      | $.error | "invalid_request" |
    And verify response time is less than "2500" milliseconds


  Scenario: TC_03 Upload User leaves - negative [Invalid access token]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName      | HeaderValue       |
      | Accept          | */*               |
      | Connection      | keep-alive        |
      | Accept-Encoding | gzip, deflate, br |
      | Content-Type    | application/json  |
    And I post the request with "Post_Upload_userleaves" payload with dynamic access token and query parameters
      | Query        | Value                              |
      | access_token | invalidaccesstoken-wq732yugdbj     |
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      | JPath   | Value            |
      | $.error | "invalid_grant"  |
    And verify response time is less than "2500" milliseconds

  Scenario: TC_04 Upload User leaves - negative [without access token field]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName      | HeaderValue       |
      | Accept          | */*               |
      | Connection      | keep-alive        |
      | Accept-Encoding | gzip, deflate, br |
      | Content-Type    | application/json  |
    And I post the request with "Post_Upload_userleaves" payload with dynamic access token and query parameters
      | Query        | Value |
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      | JPath   | Value             |
      | $.error | "invalid_request" |
    And verify response time is less than "2500" milliseconds

  Scenario: TC_05 Upload User leaves - negative [null access token]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName      | HeaderValue       |
      | Accept          | */*               |
      | Connection      | keep-alive        |
      | Accept-Encoding | gzip, deflate, br |
      | Content-Type    | application/json  |
    And I post the request with "Post_Upload_userleaves" payload with dynamic access token and query parameters
      | Query        | Value                              |
      | access_token | null    |
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      | JPath   | Value            |
      | $.error | "invalid_grant"  |
    And verify response time is less than "2500" milliseconds


  Scenario: TC_06 Upload User leaves - negative [Non-existent leave type]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName      | HeaderValue       |
      | Accept          | */*               |
      | Connection      | keep-alive        |
      | Accept-Encoding | gzip, deflate, br |
      | Content-Type    | application/json  |
    When I modify the fields in "Post_Upload_userleaves" payload
      | JPath                        | Value |
      | $.Userleave[0].leavetype_id | 56    |
    And I post the request with "Post_Upload_userleaves" payload with dynamic access token and query parameters
      | Query        | Value                                    |
      | access_token | ACCESS_TOKEN |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath    | Value                                                                 |
      | $.Result | false                                                                 |
      | $.Reason | "Data 0: The leave type ID 56 is inactive or does not exist in the system." |
    And verify response time is less than "2500" milliseconds


  Scenario: TC_07 Upload User leaves - negative [Incorrect status]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName      | HeaderValue       |
      | Accept          | */*               |
      | Connection      | keep-alive        |
      | Accept-Encoding | gzip, deflate, br |
      | Content-Type    | application/json  |
    When I modify the fields in "Post_Upload_userleaves" payload
      | JPath                  | Value       |
      | $.Userleave[0].status | approved001 |
    And I post the request with "Post_Upload_userleaves" payload with dynamic access token and query parameters
      | Query        | Value                                    |
      | access_token | ACCESS_TOKEN |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath    | Value                                         |
      | $.Result | false                                         |
      | $.Reason | "Data 0: The status can only be 'approved'."  |
    And verify response time is less than "2500" milliseconds


  Scenario: TC_08 Upload User leaves - negative [From date later than To date]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName      | HeaderValue       |
      | Accept          | */*               |
      | Connection      | keep-alive        |
      | Accept-Encoding | gzip, deflate, br |
      | Content-Type    | application/json  |
    When I modify the fields in "Post_Upload_userleaves" payload
      | JPath                    | Value       |
      | $.Userleave[0].from_date | 2025-11-14 |
      | $.Userleave[0].to_date   | 2024-11-14 |
    And I post the request with "Post_Upload_userleaves" payload with dynamic access token and query parameters
      | Query        | Value                                    |
      | access_token | ACCESS_TOKEN |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath    | Value                                                                                                                |
      | $.Result | false                                                                                                                |
      | $.Reason | "Data 0: From date cannot be later than to date." |
    And verify response time is less than "2500" milliseconds


  Scenario: TC_09 Upload User leaves - negative [Days exceed]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName      | HeaderValue       |
      | Accept          | */*               |
      | Connection      | keep-alive        |
      | Accept-Encoding | gzip, deflate, br |
      | Content-Type    | application/json  |
    When I modify the fields in "Post_Upload_userleaves" payload
      | JPath                    | Value       |
      | $.Userleave[0].from_date | 2024-11-14 |
      | $.Userleave[0].to_date   | 2024-11-14 |
      | $.Userleave[0].days      | 10         |
    And I post the request with "Post_Upload_userleaves" payload with dynamic access token and query parameters
      | Query        | Value                                    |
      | access_token | ACCESS_TOKEN |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath    | Value                                                                                               |
      | $.Result | false                                                                                               |
      | $.Reason | "Data 0: Number of days requested should not be greater than the date range difference."             |
    And verify response time is less than "2500" milliseconds


  Scenario: TC_10 Upload User leaves - negative [Not exist user_id]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName      | HeaderValue       |
      | Accept          | */*               |
      | Connection      | keep-alive        |
      | Accept-Encoding | gzip, deflate, br |
      | Content-Type    | application/json  |
    When I modify the fields in "Post_Upload_userleaves" payload
      | JPath                 | Value |
      | $.Userleave[0].user_id | 456  |
    And I post the request with "Post_Upload_userleaves" payload with dynamic access token and query parameters
      | Query        | Value                                    |
      | access_token | ACCESS_TOKEN |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath    | Value                                                  |
      | $.Result | false                                                  |
      | $.Reason | "Data 0: The leave type ID 3 is not applicable for the user role." |
    And verify response time is less than "2500" milliseconds


  Scenario: TC_11 Upload User leaves - negative [Empty From_date]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName      | HeaderValue       |
      | Accept          | */*               |
      | Connection      | keep-alive        |
      | Accept-Encoding | gzip, deflate, br |
      | Content-Type    | application/json  |
    When I modify the fields in "Post_Upload_userleaves" payload
      | JPath                    | Value |
      | $.Userleave[0].from_date |       |
    And I post the request with "Post_Upload_userleaves" payload with dynamic access token and query parameters
      | Query        | Value                                    |
      | access_token | ACCESS_TOKEN |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath    | Value                                                                 |
      | $.Result | false                                                                 |
      | $.Reason | "Data 0: from_date is a mandatory field and cannot be empty." |
    And verify response time is less than "2500" milliseconds


  Scenario: TC_12 Upload User leaves - negative [Empty To_Date]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName      | HeaderValue       |
      | Accept          | */*               |
      | Connection      | keep-alive        |
      | Accept-Encoding | gzip, deflate, br |
      | Content-Type    | application/json  |
    When I modify the fields in "Post_Upload_userleaves" payload
      | JPath                    | Value |
      | $.Userleave[0].to_date  |       |
    And I post the request with "Post_Upload_userleaves" payload with dynamic access token and query parameters
      | Query        | Value                                    |
      | access_token | ACCESS_TOKEN |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath    | Value                                                                 |
      | $.Result | false                                                                 |
      | $.Reason | "Data 0: to_date is a mandatory field and cannot be empty." |
    And verify response time is less than "2500" milliseconds


  Scenario: TC_13 Upload User leaves - negative [From_Date = Non-Date Input in 'from_date' Field]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName      | HeaderValue       |
      | Accept          | */*               |
      | Connection      | keep-alive        |
      | Accept-Encoding | gzip, deflate, br |
      | Content-Type    | application/json  |
    When I modify the fields in "Post_Upload_userleaves" payload
      | JPath                    | Value       |
      | $.Userleave[0].from_date | Testnondate |
    And I post the request with "Post_Upload_userleaves" payload with dynamic access token and query parameters
      | Query        | Value                                    |
      | access_token | ACCESS_TOKEN |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath    | Value                                                                 |
      | $.Result | false                                                                 |
      | $.Reason | "Data 0: Invalid or empty 'from_date' or 'to_date' (should be in 'Y-m-d' format)." |
    And verify response time is less than "2500" milliseconds


  Scenario: TC_14 Upload User leaves - negative [To_Date = Non-Date Input in 'to_date' Field]
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName      | HeaderValue       |
      | Accept          | */*               |
      | Connection      | keep-alive        |
      | Accept-Encoding | gzip, deflate, br |
      | Content-Type    | application/json  |
    When I modify the fields in "Post_Upload_userleaves" payload
      | JPath                   | Value       |
      | $.Userleave[0].to_date | Testnondate |
    And I post the request with "Post_Upload_userleaves" payload with dynamic access token and query parameters
      | Query        | Value                                    |
      | access_token | ACCESS_TOKEN |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath    | Value                                                                 |
      | $.Result | false                                                                 |
      | $.Reason | "Data 0: Invalid or empty 'from_date' or 'to_date' (should be in 'Y-m-d' format)." |
    And verify response time is less than "2500" milliseconds
