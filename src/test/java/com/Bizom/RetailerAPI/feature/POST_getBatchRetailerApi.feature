@Retailer @Sanity @All @getBatchRetailerApi
Feature: This feature file is of the testcases of POST end point of Add SaleReturn Api

  @getBatchRetailerApiPositive
  Scenario: TC_01 POST_getBatchRetailerApi -  positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type      | application/json           |
    And I post the request with "POST_getBatchRetailerApi" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result     | true    |
      | $.Data[0].id | "2" |
      |$.Data[0].name| "24AA"|
      |$.Data[0].manufacture_date| "2019-09-01"|
      |$.Data[0].expiry_date| "2019-06-20"|
      |$.Data[0].skunit_id| "3"|
    And verify response time is less than "1500" milliseconds

  Scenario: TC_02 POST_getBatchRetailerApi -  verify the response structure
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type      | application/json           |
    And I post the request with "POST_getBatchRetailerApi" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And verifies the field is present in the response
      | JPath        |
      | $.Result     |
      | $.Data       |
      | $.Data[0].id |
      |$.Data[0].name|
      |$.Data[0].manufacture_date|
      |$.Data[0].expiry_date|
      |$.Data[0].skunit_id|
    And verify response time is less than "1500" milliseconds

  Scenario: TC_03 POST_getBatchRetailerApi -  resposne structure- data type
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type      | application/json           |
    And I post the request with "POST_getBatchRetailerApi" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And validating the response field data types
      | JPath        | ExpectedType |
      | $.Result     | Boolean    |
      | $.Data       | array     |
      | $.Data[0].id | string|
      |$.Data[0].name| string|
      |$.Data[0].manufacture_date| string|
      |$.Data[0].expiry_date| string|
      |$.Data[0].skunit_id| string|
    And verify response time is less than "1500" milliseconds

  Scenario: TC_04 POST_getBatchRetailerApi -  warehouse id passed as null
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type      | application/json           |
    And I modify fields with random values and remove fields in "POST_getBatchRetailerApi" payload
      |JPath                 |Value  |
      |warehouses | null |
    And I post the request with "POST_getBatchRetailerApi" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result     | false    |
      | $.Reason | "Invalid Request Data" |
    And verify response time is less than "1500" milliseconds

  Scenario: TC_05 POST_getBatchRetailerApi -  warehouse id passed empty string
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type      | application/json           |
    And I modify fields with random values and remove fields in "POST_getBatchRetailerApi" payload
      |JPath                    |Value  |
      |warehouses | "" |
    And I post the request with "POST_getBatchRetailerApi" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result     | false    |
      | $.Reason | "Invalid Request Data" |
    And verify response time is less than "1500" milliseconds

  Scenario: TC_06 POST_getBatchRetailerApi -  warehouse id passed is invalid
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type      | application/json           |
    And I modify fields with random values and remove fields in "POST_getBatchRetailerApi" payload
      |JPath                    |Value  |
      |warehouses | Invalid |
    And I post the request with "POST_getBatchRetailerApi" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result     | false    |
      | $.Reason | "Invalid Request Data" |
    And verify response time is less than "1500" milliseconds

  Scenario: TC_07 POST_getBatchRetailerApi - Random  warehouse id passed
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type      | application/json           |
    And I modify fields with random values and remove fields in "POST_getBatchRetailerApi" payload
      |JPath                    |Value  |
      |warehouses| Random |
    And I post the request with "POST_getBatchRetailerApi" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result     | false    |
      | $.Reason | "Invalid Request Data" |
    And verify response time is less than "1500" milliseconds

  Scenario: TC_08 POST_getBatchRetailerApi -   skunit id is passed null
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type      | application/json           |
    And I modify fields with random values and remove fields in "POST_getBatchRetailerApi" payload
      |JPath                    |Value  |
      | skunits| null |
    And I post the request with "POST_getBatchRetailerApi" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result     | false    |
      | $.Reason | "Invalid Request Data" |
    And verify response time is less than "1500" milliseconds

  Scenario: TC_09 POST_getBatchRetailerApi -   skunit id is passed empty
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type      | application/json           |
    And I modify fields with random values and remove fields in "POST_getBatchRetailerApi" payload
      |JPath                    |Value  |
      | skunits| "" |
    And I post the request with "POST_getBatchRetailerApi" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result     | false    |
      | $.Reason | "Invalid Request Data" |
    And verify response time is less than "1500" milliseconds


  Scenario: TC_10 POST_getBatchRetailerApi -  Random number skunit id is passed
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type      | application/json           |
    And I modify fields with random values and remove fields in "POST_getBatchRetailerApi" payload
      |JPath                    |Value  |
      | skunits| "" |
    And I post the request with "POST_getBatchRetailerApi" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result     | false    |
      | $.Reason | "Invalid Request Data" |
    And verify response time is less than "1500" milliseconds

  Scenario: TC_11 POST_getBatchRetailerApi -  Passing multiple warehouse id
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type      | application/json           |
    And I modify fields with random values and remove fields in "POST_getBatchRetailerApi" payload
      |JPath                    |Value  |
      |skunits  |1|
      |warehouses| 1,2 |
    And I post the request with "POST_getBatchRetailerApi" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result     | true    |
      |$.Data[0].skunit_id| "1"|
      |$.Data[1].skunit_id| "3"|
      |$.Data[2].skunit_id| "1"|

  Scenario: TC_12 POST_getBatchRetailerApi -  Passing multiple skunits id
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type      | application/json           |
    And I modify fields with random values and remove fields in "POST_getBatchRetailerApi" payload
      |JPath                    |Value  |
      |skunits  |1,3|
      |warehouses| 1 |
    And I post the request with "POST_getBatchRetailerApi" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result     | true    |
      |$.Data[0].skunit_id| "1"|
      |$.Data[1].skunit_id| "3"|

  Scenario: TC_13 POST_getBatchRetailerApi -  invalid access token is passed
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type      | application/json           |
    And I post the request with "POST_getBatchRetailerApi" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  | invalid |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.result     | false    |
      | $.error.code | 401 |
      | $.error.message | "Invalid Access Token or Credentials" |

  Scenario Outline: TC_14 POST_getBatchRetailerApi -  different valid skunits
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName      | HeaderValue      |
      | Accept          | /                |
      | Accept-Encoding | gzip,deflate, br |
      | Connection      | keep-alive       |
      | Content-Type    | application/json |
    And I modify fields with random values and remove fields in "POST_getBatchRetailerApi" payload
      | JPath     | Value       |
      | skunits | <skunits> |
      |warehouses| 1 |
    And I post the request with "POST_getBatchRetailerApi" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | Access_TOKEN |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath    | Value |
      | $.Result | true  |
    And verify response time is less than "1500" milliseconds
    And I store the response as "POST_getOutletbalance" name using full path
    Examples:
      | skunits |
      | 1         |
      | 3         |
      | 5         |

  @DataValidation
  Scenario: TC_15 POST_getBatchRetailerApi -  dbvalidation
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type      | application/json           |
    And I post the request with "POST_getBatchRetailerApi" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result     | true    |
      | $.Data[0].id | "2" |
      |$.Data[0].name| "24AA"|
      |$.Data[0].manufacture_date| "2019-09-01"|
      |$.Data[0].expiry_date| "2019-06-20"|
      |$.Data[0].skunit_id| "3"|
    And I verify API response at path with DB and static values
      |JPath|Value|
      | $.Data[0].name| DB:batches:name: id=2|
