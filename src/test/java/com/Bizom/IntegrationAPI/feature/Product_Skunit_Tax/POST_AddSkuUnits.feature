@AddSku @Sanity @All @Execution @allPost
Feature: TC5062 This feature file is of the testcases of GET end point of Product Master Api
  @AddSkuPositive
  Scenario: TC_01 Product  positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "postAddSku" XML payload
      | XPath         | Value       |
      |  /Skunit/name             |   randomAlphaNum          |
      |  /Skunit/skucode         |   randomAlphaNum          |
    And I post the request with "postAddSku" xml payload with dynamic access token and query parameters
      |Query         |Value |
      |access_token  |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader         | xmlValue       |
      | Response.Result  |true|
      | Response.Reason  |Skunit added successfully|
    And verify response time is less than "1500" milliseconds

  @AddSkuBlankName
  Scenario: TC_03 Product -  blank name case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "postAddSku" XML payload
      | XPath         | Value       |
      | /Skunit/name  |  |
    And I post the request with "postAddSku" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader         | xmlValue       |
      | Response.Result  |false|
      | Response.Reason  |Please fill all the parameters. Mandatory fields are (name, mrp, price, unitspercase, skucode)|
    And verify response time is less than "1500" milliseconds

  @AddSkuBlankMrp
  Scenario: TC_04 Product -  blank mrp case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "postAddSku" XML payload
      | XPath         | Value       |
      |  /Skunit/name             |   randomAlphaNum          |
      |  /Skunit/skucode         |   randomAlphaNum          |
      | /Skunit/mrp  |  |
    And I post the request with "postAddSku" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader         | xmlValue       |
      | Response.Result  |false|
      | Response.Reason  |Please fill all the parameters. Mandatory fields are (name, mrp, price, unitspercase, skucode)|
    And verify response time is less than "1500" milliseconds

  @AddSkuBlankPrice
  Scenario: TC_05 Product -  blank price case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "postAddSku" XML payload
      | XPath         | Value       |
      |  /Skunit/name             |   randomAlphaNum          |
      |  /Skunit/skucode         |   randomAlphaNum          |
      | /Skunit/price  |  |
    And I post the request with "postAddSku" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader         | xmlValue       |
      | Response.Result  |false|
      | Response.Reason  |Please fill all the parameters. Mandatory fields are (name, mrp, price, unitspercase, skucode)|
    And verify response time is less than "1500" milliseconds

  @AddSkuBlankUnitspercase
  Scenario: TC_06 Product -  blank unitspercase case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "postAddSku" XML payload
      | XPath         | Value       |
      |  /Skunit/name             |   randomAlphaNum          |
      |  /Skunit/skucode         |   randomAlphaNum          |
      | /Skunit/unitspercase  |  |
    And I post the request with "postAddSku" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader         | xmlValue       |
      | Response.Result  |false|
      | Response.Reason  |Please fill all the parameters. Mandatory fields are (name, mrp, price, unitspercase, skucode)|
    And verify response time is less than "1500" milliseconds

  @AddSkuBlankSkucode
  Scenario: TC_07 Product -  blank skucode case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "postAddSku" XML payload
      | XPath         | Value       |
      |  /Skunit/name             |   randomAlphaNum          |
      | /Skunit/skucode  |  |
    And I post the request with "postAddSku" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader         | xmlValue       |
      | Response.Result  |false|
      | Response.Reason  |Please fill all the parameters. Mandatory fields are (name, mrp, price, unitspercase, skucode)|
    And verify response time is less than "1500" milliseconds

    #hjj
  @AddSkuNoName
  Scenario: TC_08 Product - no name case
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue               |
      | Accept            | */*                       |
      | Accept-Encoding   | gzip,deflate, br          |
      | Connection        | keep-alive                |
      | Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "postAddSku" XML payload
      | XPath        | Value |
      | /Skunit/name | null  |
    And I post the request with "postAddSku" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader     | xmlValue |
      | Response.Result   | false    |
      | Response.Reason   | Please fill all the parameters. Mandatory fields are (name, mrp, price, unitspercase, skucode) |
    And verify response time is less than "1500" milliseconds

  @AddSkuNoMrp
  Scenario: TC_09 Product - no mrp case
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue               |
      | Accept            | */*                       |
      | Accept-Encoding   | gzip,deflate, br          |
      | Connection        | keep-alive                |
      | Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "postAddSku" XML payload
      | XPath       | Value |
      | /Skunit/mrp | null  |
    And I post the request with "postAddSku" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader     | xmlValue |
      | Response.Result   | false    |
      | Response.Reason   | Please fill all the parameters. Mandatory fields are (name, mrp, price, unitspercase, skucode) |
    And verify response time is less than "1500" milliseconds

  @AddSkuNoPrice
  Scenario: TC_10 Product - no price case
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue               |
      | Accept            | */*                       |
      | Accept-Encoding   | gzip,deflate, br          |
      | Connection        | keep-alive                |
      | Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "postAddSku" XML payload
      | XPath         | Value |
      | /Skunit/price | null  |
    And I post the request with "postAddSku" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader     | xmlValue |
      | Response.Result   | false    |
      | Response.Reason   | Please fill all the parameters. Mandatory fields are (name, mrp, price, unitspercase, skucode) |
    And verify response time is less than "1500" milliseconds

  @AddSkuNoUnitspercase
  Scenario: TC_11 Product - no unitspercase case
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue               |
      | Accept            | */*                       |
      | Accept-Encoding   | gzip,deflate, br          |
      | Connection        | keep-alive                |
      | Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "postAddSku" XML payload
      | XPath               | Value |
      | /Skunit/unitspercase | null |
    And I post the request with "postAddSku" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader     | xmlValue |
      | Response.Result   | false    |
      | Response.Reason   | Please fill all the parameters. Mandatory fields are (name, mrp, price, unitspercase, skucode) |
    And verify response time is less than "1500" milliseconds

  @AddSkuNoSkucode
  Scenario: TC_12 Product - no skucode case
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue               |
      | Accept            | */*                       |
      | Accept-Encoding   | gzip,deflate, br          |
      | Connection        | keep-alive                |
      | Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "postAddSku" XML payload
      | XPath           | Value |
      | /Skunit/skucode | null  |
    And I post the request with "postAddSku" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader     | xmlValue |
      | Response.Result   | false    |
      | Response.Reason   | Please fill all the parameters. Mandatory fields are (name, mrp, price, unitspercase, skucode) |
    And verify response time is less than "1500" milliseconds

  @AddSkuWrongResourceURI
  Scenario: TC_13 Post API with wrong Resource URI
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/xml           |
    And I post the request with "invalid_AddSku" xml payload with dynamic access token and query parameters
      |Query         |Value     |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "404"
    And verify response time is less than "1000" milliseconds

  @AddSkuWithOutToken
  Scenario: TC_14 Post API without Access token(access_toke=null)
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/xml           |
    And I post the request with "postAddSku" xml payload with dynamic access token and query parameters
      |Query         |Value |
      |access_token  |  |
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      | JPath     | Value |
      | error   |  invalid_request   |
    And verify response time is less than "1500" milliseconds

  @AddSkuWithWrongToken
  Scenario: TC_15 Post API with Wrong Access_Token
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/xml |
    And I post the request with "postAddSku" xml payload with dynamic access token and query parameters
      |Query         |Value |
      |access_token  | xyz |
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      | JPath     | Value |
      | error   |  invalid_grant   |
    And verify response time is less than "500" milliseconds

  @AddSkuWithExpiryTimeline @ExpiryTimeline
  Scenario: TC_16 Product - Add SKU with valid expiry_timeline decimal value
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue               |
      | Accept            | */*                       |
      | Accept-Encoding   | gzip,deflate, br          |
      | Connection        | keep-alive                |
      | Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "postAddSku" XML payload
      | XPath                    | Value            |
      | /Skunit/name             | randomAlphaNum   |
      | /Skunit/skucode          | randomAlphaNum   |
      | /Skunit/expiry_timeline  | 2.2              |
    And I post the request with "postAddSku" xml payload with dynamic access token and query parameters
      | Query         | Value         |
      | access_token  | ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader    | xmlValue                  |
      | Response.Result  | true                      |
    And verify response time is less than "1500" milliseconds

  @AddSkuWithExpiryTimelineInteger @ExpiryTimeline
  Scenario: TC_17 Product - Add SKU with valid expiry_timeline integer value
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue               |
      | Accept            | */*                       |
      | Accept-Encoding   | gzip,deflate, br          |
      | Connection        | keep-alive                |
      | Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "postAddSku" XML payload
      | XPath                    | Value            |
      | /Skunit/name             | randomAlphaNum   |
      | /Skunit/skucode          | randomAlphaNum   |
      | /Skunit/expiry_timeline  | 5                |
    And I post the request with "postAddSku" xml payload with dynamic access token and query parameters
      | Query         | Value         |
      | access_token  | ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader    | xmlValue                  |
      | Response.Result  | true                      |
    And verify response time is less than "1500" milliseconds

  @AddSkuWithExpiryTimelineZero @ExpiryTimeline
  Scenario: TC_18 Product - Add SKU with expiry_timeline value as zero
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue               |
      | Accept            | */*                       |
      | Accept-Encoding   | gzip,deflate, br          |
      | Connection        | keep-alive                |
      | Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "postAddSku" XML payload
      | XPath                    | Value            |
      | /Skunit/name             | randomAlphaNum   |
      | /Skunit/skucode          | randomAlphaNum   |
      | /Skunit/expiry_timeline  | 0                |
    And I post the request with "postAddSku" xml payload with dynamic access token and query parameters
      | Query         | Value         |
      | access_token  | ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader    | xmlValue                  |
      | Response.Result  | true                      |
    And verify response time is less than "1500" milliseconds

  @AddSkuWithExpiryTimelineBlank @ExpiryTimeline
  Scenario: TC_19 Product - Add SKU with blank expiry_timeline value
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue               |
      | Accept            | */*                       |
      | Accept-Encoding   | gzip,deflate, br          |
      | Connection        | keep-alive                |
      | Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "postAddSku" XML payload
      | XPath                    | Value            |
      | /Skunit/name             | randomAlphaNum   |
      | /Skunit/skucode          | randomAlphaNum   |
      | /Skunit/expiry_timeline  |                  |
    And I post the request with "postAddSku" xml payload with dynamic access token and query parameters
      | Query         | Value         |
      | access_token  | ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader    | xmlValue                  |
      | Response.Result  | true                      |
    And verify response time is less than "1500" milliseconds

  @AddSkuWithoutExpiryTimeline @ExpiryTimeline
  Scenario: TC_20 Product - Add SKU without expiry_timeline field (removed from payload)
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue               |
      | Accept            | */*                       |
      | Accept-Encoding   | gzip,deflate, br          |
      | Connection        | keep-alive                |
      | Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "postAddSku" XML payload
      | XPath                    | Value            |
      | /Skunit/name             | randomAlphaNum   |
      | /Skunit/skucode          | randomAlphaNum   |
      | /Skunit/expiry_timeline  | null             |
    And I post the request with "postAddSku" xml payload with dynamic access token and query parameters
      | Query         | Value         |
      | access_token  | ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader    | xmlValue                  |
      | Response.Result  | true                      |
    And verify response time is less than "1500" milliseconds

  @AddSkuWithExpiryTimelineNegative @ExpiryTimeline @Negative
  Scenario: TC_21 Product - Add SKU with negative expiry_timeline value
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue               |
      | Accept            | */*                       |
      | Accept-Encoding   | gzip,deflate, br          |
      | Connection        | keep-alive                |
      | Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "postAddSku" XML payload
      | XPath                    | Value            |
      | /Skunit/name             | randomAlphaNum   |
      | /Skunit/skucode          | randomAlphaNum   |
      | /Skunit/expiry_timeline  | -2.5             |
    And I post the request with "postAddSku" xml payload with dynamic access token and query parameters
      | Query         | Value         |
      | access_token  | ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader    | xmlValue                  |
      | Response.Result  | true                     |
    And verify response time is less than "1500" milliseconds

  @AddSkuWithExpiryTimelineAlphabetic @ExpiryTimeline @Negative
  Scenario: TC_22 Product - Add SKU with alphabetic expiry_timeline value
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue               |
      | Accept            | */*                       |
      | Accept-Encoding   | gzip,deflate, br          |
      | Connection        | keep-alive                |
      | Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "postAddSku" XML payload
      | XPath                    | Value            |
      | /Skunit/name             | randomAlphaNum   |
      | /Skunit/skucode          | randomAlphaNum   |
      | /Skunit/expiry_timeline  | abc              |
    And I post the request with "postAddSku" xml payload with dynamic access token and query parameters
      | Query         | Value         |
      | access_token  | ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader    | xmlValue                  |
      | Response.Result  | true                     |
    And verify response time is less than "1500" milliseconds

  @AddSkuWithExpiryTimelineSpecialChar @ExpiryTimeline @Negative
  Scenario: TC_23 Product - Add SKU with special character in expiry_timeline value
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue               |
      | Accept            | */*                       |
      | Accept-Encoding   | gzip,deflate, br          |
      | Connection        | keep-alive                |
      | Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "postAddSku" XML payload
      | XPath                    | Value            |
      | /Skunit/name             | randomAlphaNum   |
      | /Skunit/skucode          | randomAlphaNum   |
      | /Skunit/expiry_timeline  | @#$%             |
    And I post the request with "postAddSku" xml payload with dynamic access token and query parameters
      | Query         | Value         |
      | access_token  | ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader    | xmlValue                  |
      | Response.Result  | true                     |
    And verify response time is less than "1500" milliseconds

  @AddSkuWithExpiryTimelineLargeValue @ExpiryTimeline
  Scenario: TC_24 Product - Add SKU with large expiry_timeline value
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue               |
      | Accept            | */*                       |
      | Accept-Encoding   | gzip,deflate, br          |
      | Connection        | keep-alive                |
      | Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "postAddSku" XML payload
      | XPath                    | Value            |
      | /Skunit/name             | randomAlphaNum   |
      | /Skunit/skucode          | randomAlphaNum   |
      | /Skunit/expiry_timeline  | 999.99           |
    And I post the request with "postAddSku" xml payload with dynamic access token and query parameters
      | Query         | Value         |
      | access_token  | ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader    | xmlValue                  |
      | Response.Result  | true                      |
    And verify response time is less than "1500" milliseconds

  @AddSkuWithExpiryTimelineSmallDecimal @ExpiryTimeline
  Scenario: TC_25 Product - Add SKU with very small decimal expiry_timeline value
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue               |
      | Accept            | */*                       |
      | Accept-Encoding   | gzip,deflate, br          |
      | Connection        | keep-alive                |
      | Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "postAddSku" XML payload
      | XPath                    | Value            |
      | /Skunit/name             | randomAlphaNum   |
      | /Skunit/skucode          | randomAlphaNum   |
      | /Skunit/expiry_timeline  | 0.01             |
    And I post the request with "postAddSku" xml payload with dynamic access token and query parameters
      | Query         | Value         |
      | access_token  | ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader    | xmlValue                  |
      | Response.Result  | true                      |
    And verify response time is less than "1500" milliseconds

  @AddSkuWithExpiryTimelineMultipleDecimals @ExpiryTimeline
  Scenario: TC_26 Product - Add SKU with multiple decimal places in expiry_timeline value
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue               |
      | Accept            | */*                       |
      | Accept-Encoding   | gzip,deflate, br          |
      | Connection        | keep-alive                |
      | Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "postAddSku" XML payload
      | XPath                    | Value            |
      | /Skunit/name             | randomAlphaNum   |
      | /Skunit/skucode          | randomAlphaNum   |
      | /Skunit/expiry_timeline  | 2.12345          |
    And I post the request with "postAddSku" xml payload with dynamic access token and query parameters
      | Query         | Value         |
      | access_token  | ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader    | xmlValue                  |
      | Response.Result  | true                      |
    And verify response time is less than "1500" milliseconds

  @UpdateSkuWithExpiryTimeline @ExpiryTimeline
  Scenario: TC_27 Product - Update existing SKU with new expiry_timeline value
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue               |
      | Accept            | */*                       |
      | Accept-Encoding   | gzip,deflate, br          |
      | Connection        | keep-alive                |
      | Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "postAddSku" XML payload
      | XPath                    | Value            |
      | /Skunit/name             | randomAlphaNum   |
      | /Skunit/skucode          | randomAlphaNum   |
      | /Skunit/expiry_timeline  | 3.5              |
    And I post the request with "postAddSku" xml payload with dynamic access token and query parameters
      | Query         | Value         |
      | access_token  | ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader    | xmlValue                      |
      | Response.Result  | true                          |
    And verify response time is less than "1500" milliseconds

  @AddSkuWithExpiryTimelineAndBatchEnabled @ExpiryTimeline
  Scenario: TC_28 Product - Add SKU with expiry_timeline when batch is enabled
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue               |
      | Accept            | */*                       |
      | Accept-Encoding   | gzip,deflate, br          |
      | Connection        | keep-alive                |
      | Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "postAddSku" XML payload
      | XPath                    | Value            |
      | /Skunit/name             | randomAlphaNum   |
      | /Skunit/skucode          | randomAlphaNum   |
      | /Skunit/batchenable      | 1                |
      | /Skunit/expiry_timeline  | 2.2              |
    And I post the request with "postAddSku" xml payload with dynamic access token and query parameters
      | Query         | Value         |
      | access_token  | ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader    | xmlValue                  |
      | Response.Result  | true                      |
    And verify response time is less than "1500" milliseconds

  @AddSkuWithExpiryTimelineAndBatchDisabled @ExpiryTimeline
  Scenario: TC_29 Product - Add SKU with expiry_timeline when batch is disabled
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue               |
      | Accept            | */*                       |
      | Accept-Encoding   | gzip,deflate, br          |
      | Connection        | keep-alive                |
      | Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "postAddSku" XML payload
      | XPath                    | Value            |
      | /Skunit/name             | randomAlphaNum   |
      | /Skunit/skucode          | randomAlphaNum   |
      | /Skunit/batchenable      | 0                |
      | /Skunit/expiry_timeline  | 2.2              |
    And I post the request with "postAddSku" xml payload with dynamic access token and query parameters
      | Query         | Value         |
      | access_token  | ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader    | xmlValue                  |
      | Response.Result  | true                      |
    And verify response time is less than "1500" milliseconds

  @AddSkuWithExpiryTimelineWhitespace @ExpiryTimeline @Negative
  Scenario: TC_30 Product - Add SKU with whitespace in expiry_timeline value
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue               |
      | Accept            | */*                       |
      | Accept-Encoding   | gzip,deflate, br          |
      | Connection        | keep-alive                |
      | Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "postAddSku" XML payload
      | XPath                    | Value            |
      | /Skunit/name             | randomAlphaNum   |
      | /Skunit/skucode          | randomAlphaNum   |
      | /Skunit/expiry_timeline  |    2.5           |
    And I post the request with "postAddSku" xml payload with dynamic access token and query parameters
      | Query         | Value         |
      | access_token  | ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader    | xmlValue                  |
      | Response.Result  | true                      |
    And verify response time is less than "1500" milliseconds


