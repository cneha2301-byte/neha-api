@SalesChangePayment @All @Sanity @Execution @allPost
Feature: This feature file is of the testcases of GET end point of change payment state

  @SalesPositive
  Scenario: TC_01 Sales -  positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I post the request with "POST_changePaymentState" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      |Result    | true     |
      |Reason   |"Sales Status change successfully"|
    And verify response time is less than "2500" milliseconds
    And I store the response as "UploadSales" name using full path

  @SalesPositive
  Scenario: TC_02 Sales -  positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify the field values in "POST_changePaymentState" payload
      |JPath          |Value            |
      |$.Payment.id           |2155             |
      |$.Payment.salestate_id |1                |

    And I post the request with "POST_changePaymentState" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      |$.Result    | true     |
      |$.Reason   |"Sales Status change successfully","data":{"salestate_id":"1","salestate_name":"dispatched"|
    And verify response time is less than "2500" milliseconds
    And I store the response as "UploadSales" name using full path

  @SalesPositive
  Scenario: TC_03 Sales -  positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify the field values in "POST_changePaymentState" payload
      |JPath          |Value            |
      |$.Payment.id           |2155             |
      |$.Payment.salestate_id |2                |

    And I post the request with "POST_changePaymentState" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      |$.Result    | true     |
      |$.Reason   |"Sales Status change successfully","data":{"salestate_id":"3","salestate_name":"Delivered"|
    And verify response time is less than "2500" milliseconds
    And I store the response as "UploadSales" name using full path


  @SalesNegative
  Scenario: TC_04 Sales - negative case - invoiceid empty
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify the field values in "POST_changePaymentState" payload
      |JPath          |Value            |
      |Payment.invoiceid|                 |
      |$.Payment.id   |                |
    And I post the request with "POST_changePaymentState" payload with dynamic access token and query parameters
      |Query         |Value       |
      |access_token  |ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |result         |false          |
      |reason         |Please send payment state|
    And verify response time is less than "2500" milliseconds
    And I store the response as "UploadSales" name using full path

  @SalesNegative
  Scenario: TC_05 Sales - negative case - wrong invoiceid
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify the field values in "POST_changePaymentState" payload
      |JPath          |Value            |
      |$.Payment.invoiceid    |261001   |
      |$.Payment.id   |                |
    And I post the request with "POST_changePaymentState" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |Result         |false          |
      |Reason         |"Invoice id is not valid"|
    And verify response time is less than "2500" milliseconds
    And I store the response as "UploadSales" name using full path

  @SalesNegative
  Scenario: TC_06 Sales - negative case - salestate_name empty
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify the field values in "POST_changePaymentState" payload
      |JPath          |Value            |
      |$.Payment.salestate_name|                 |
      |$.Payment.salestate_id   |                |
    And I post the request with "POST_changePaymentState" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |result         |false          |
      |reason         |"Please send payment state"|
    And verify response time is less than "2500" milliseconds
    And I store the response as "UploadSales" name using full path

  @SalesNegative
  Scenario: TC_07 Sales - negative case - wrong salestate_name
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify the field values in "POST_changePaymentState" payload
      |JPath          |Value            |
      |$.Payment.salestate_name|regular         |
      |$.Payment.salestate_id   |                |
    And I post the request with "POST_changePaymentState" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |Result         |"false"          |
      |Reason         |"Sales Status is not valid."|
    And verify response time is less than "2500" milliseconds
    And I store the response as "UploadSales" name using full path

