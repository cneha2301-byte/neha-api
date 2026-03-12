@CanceSaleReturn @all @sanity @Execution @allPost

Feature: This feature file is of the testcases of POST API end points of cancel collection.
  @CancelSalesReturnNegative
  Scenario: TC_01 - Cancel salereturn Data - Invalid transactionid
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I post the request with "POST_CancelSaleReturn" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN                 |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |false           |
      |$.result_array[0].Reason    |"Invalid transactionid , salereturn_no and skucode mapping or already cancelled"|
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "2500" milliseconds

  Scenario: TC_02 - Cancel salereturn Data - Invalid skucode mapping or already cancelled
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with values and fields with random values in "POST_CancelSaleReturn" payload
      |JPath            |Value          |
      |$.skucode[0] | random|
    And I post the request with "POST_CancelSaleReturn" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN                 |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |false           |
      |$.result_array[0].Reason    |"Invalid transactionid , salereturn_no and skucode mapping or already cancelled"|
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "2500" milliseconds

  Scenario: TC_03 - Cancel salereturn Data - No skucode passed in payload
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with values and fields with random values in "POST_CancelSaleReturn" payload
      |JPath            |Value          |
      |$.Salereturn[0].skucode | |
    And I post the request with "POST_CancelSaleReturn" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN                 |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |false           |
      |$.result_array[0].Reason    |"Provide Skucode when transactionid given"|
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "2500" milliseconds

  Scenario: TC_04 - Cancel salereturn Data - invalid sale return no passed in payload
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with values and fields with random values in "POST_CancelSaleReturn" payload
      |JPath            |Value          |
      |$.Salereturn[0].transactionid| |
      |$.Salereturn[0].salereturn_no| random|
    And I post the request with "POST_CancelSaleReturn" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN                 |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |false           |
      |$.result_array[0].Reason    |"Invalid Salereturn Id"|
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "2500" milliseconds

  Scenario: TC_05 - Cancel salereturn Data - No sale return no passed in payload when transaction id id passed
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with values and fields with random values in "POST_CancelSaleReturn" payload
      |JPath            |Value          |
      |$.Salereturn[0].salereturn_no | |
    And I post the request with "POST_CancelSaleReturn" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN                 |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |false           |
      |$.result_array[0].Reason    |"Provide salereturn_no when transactionid is given"|
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "2500" milliseconds

    # DB-only validation
  Scenario: TC_06 cancel SaleReturn - DB validation
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I post the request with "POST_CancelSaleReturn" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN                 |
    Then I should see the response code as "200"
    Then I validate DB record in table "salemansalesreturns" with where "salereturn_no='378'"
      | column | value |
      | is_active | false     |

