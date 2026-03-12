@Skunits @All @allGet @Execution
Feature: GET all skus - /skunits/getallskus

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName     |HeaderValue        |
      |Accept         |*/*                |
      |Accept-Encoding|gzip,deflate, br  |
      |Connection     |keep-alive         |

  @Positive_Basic
  Scenario: Fetch all skus within date range (XML response)
    And I send the GET request to "GET_all_skus" endpoint with dynamic access token and query parameters
      | QueryParamName | QueryParamValue |
      | fromdate       | 2022-03-03      |
      | todate         | 2025-11-03      |
      | responsetype   | xml             |
      | startseq       | 0               |
      | endseq         | 29              |
      | access_token   | ACCESS_TOKEN   |
    Then I should see the response code as "200"

    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|true|
      |$.Data.skunits.name|DB:skunits:name: id=1|

    And verify response time is less than "2500" milliseconds


  @Positive_Pagination
  Scenario: Fetch skus with pagination window
    And I send the GET request to "GET_all_skus" endpoint with dynamic access token and query parameters
      | QueryParamName | QueryParamValue |
      | fromdate       | 2024-01-01      |
      | todate         | 2024-12-31      |
      | datetype       | modified        |
      | responsetype   | xml             |
      | startseq       | 0               |
      | endseq         | 50              |
      | access_token   | ACCESS_TOKEN    |
    Then I should see the response code as "200"

  @Positive_WithCookie
  Scenario: Fetch skus with session cookie
    And I set cookies
      |cookieName|cookieValue                |
      |PHPSESSID |jf7itdhdem9nn6pdqqjdqa9nbr|
    And I send the GET request to "GET_all_skus" endpoint with dynamic access token and query parameters
      | QueryParamName | QueryParamValue |
      | fromdate       | 2022-03-03      |
      | todate         | 2025-11-03      |
      | datetype       | modified        |
      | responsetype   | xml             |
      | startseq       | 0               |
      | endseq         | 100             |
      | access_token   | ACCESS_TOKEN    |
    Then I should see the response code as "200"

  @Negative_InvalidToken
  Scenario: Unauthorized when token is invalid
    And I send the GET request to "GET_all_skus" endpoint with query parameters
      | QueryParamName | QueryParamValue |
      | fromdate       | 2022-03-03      |
      | todate         | 2025-11-03      |
      | datetype       | modified        |
      | responsetype   | xml             |
      | startseq       | 0               |
      | endseq         | 50              |
      | access_token   | invalid_token   |
    Then I should see the response code as "401"

  @Negative_MissingToken
  Scenario: Unauthorized when token is missing
    And I send the GET request to "GET_all_skus" endpoint with query parameters
      | QueryParamName | QueryParamValue |
      | fromdate       | 2022-03-03      |
      | todate         | 2025-11-03      |
      | datetype       | modified        |
      | responsetype   | xml             |
      | startseq       | 0               |
      | endseq         | 50              |
    Then I should see the response code as "401"

  @Negative_InvalidDateFormat
  Scenario: Bad request when date format is invalid
    And I send the GET request to "GET_all_skus" endpoint with dynamic access token and query parameters
      | QueryParamName | QueryParamValue |
      | fromdate       | 03-03-2022      |
      | todate         | 2025/11/03      |
      | datetype       | modified        |
      | responsetype   | xml             |
      | startseq       | 0               |
      | endseq         | 50              |
      | access_token   | ACCESS_TOKEN    |
    Then I should see the response code as "400"
    And I validate that the operation failed with appropriate error message

  @Negative_InvalidSequenceRange
  Scenario: Bad request when startseq greater than endseq
    And I send the GET request to "GET_all_skus" endpoint with dynamic access token and query parameters
      | QueryParamName | QueryParamValue |
      | fromdate       | 2022-03-03      |
      | todate         | 2025-11-03      |
      | datetype       | modified        |
      | responsetype   | xml             |
      | startseq       | 100             |
      | endseq         | 50              |
      | access_token   | ACCESS_TOKEN    |
    Then I should see the response code as "400"
    And I validate that the operation failed with appropriate error message

  @SubBrand_Details
  Scenario: Fetch sub brand details from skus feed (XML response)
    And I send the GET request to "GET_all_skus" endpoint with dynamic access token and query parameters
      | QueryParamName | QueryParamValue |
      | fromdate       | 2022-03-03      |
      | todate         | 2025-11-03      |
      | datetype       | modified        |
      | responsetype   | xml             |
      | startseq       | 0               |
      | endseq         | 50              |
      | access_token   | ACCESS_TOKEN    |
    Then I should see the response code as "200"
    And validating the response contains the following values
      | Value            |
      | <subbrand>       |
      | <subbrand_erpid> |


  @Structure_CoreFields
  Scenario: Validate response structure and core fields (XML)
    And I send the GET request to "GET_all_skus" endpoint with dynamic access token and query parameters
      | QueryParamName | QueryParamValue |
      | fromdate       | 2022-03-03      |
      | todate         | 2025-11-03      |
      | datetype       | modified        |
      | responsetype   | xml             |
      | startseq       | 0               |
      | endseq         | 50              |
      | access_token   | ACCESS_TOKEN    |
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I store the response as "getallskus_response" name using xml full path
    And validating the response contains the following values
      | Value       |
      | <result>    |
      | <Result>    |
      | <reason>    |
      | <Reason>    |
      | <Products>  |
      | <Skunit>    |
      | <Size>      |
      | <Brand>     |
      | <Packaging> |
      | <Variant>   |
      | <Unit>      |
      | <Servesize> |
      | <Subbrand>  |

  @Validate_Skunit_Fields
  Scenario: Validate sample Skunit fields presence (XML)
    And I send the GET request to "GET_all_skus" endpoint with dynamic access token and query parameters
      | QueryParamName | QueryParamValue |
      | fromdate       | 2022-03-03      |
      | todate         | 2025-11-03      |
      | datetype       | modified        |
      | responsetype   | xml             |
      | startseq       | 0               |
      | endseq         | 50              |
      | access_token   | ACCESS_TOKEN    |
    Then I should see the response code as "200"
    And validating the response contains the string in XML response body
      |XPath                         | Value |
      | products.product.skunit.id       | DB:skunits:id=1|
      | products.product.skunit.name     | DB:skunits:name:id=1|
      | products.product.skunit.mrp      | DB:skunits:mrp:id=1  |
      | products.product.skunit.price    | DB:skunits:price:id=1  |
      | products.product.skunit.gst      | DB:skunits:gst:id=1  |
      | products.product.brand.id        | DB:skunits:brnad:id=1  |
      | products.product.subbrand.id     | DB:skunits:subbrand_id:id=1 |
