@BizomWebAPI @OS @OrdersManagement @Orders @EditFromIndex @SystemIntegration
Feature: Edit From Index API Testing
  As a system user
  I want to test the edit from index endpoint
  So that I can ensure proper functionality and HTML page rendering for order editing

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get edit from index without access token
    When I send the GET request to "orders_edit_from_index" endpoint with path parameters
      |Path|Value|
      |orderId|12|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get edit from index with invalid access token
#    And I send the GET request to "orders_edit_from_index" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|invalid_token_12345|orderId|12|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get edit from index with expired access token
#    And I send the GET request to "orders_edit_from_index" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|expired_token_12345|orderId|12|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get edit from index with malformed access token
#    And I send the GET request to "orders_edit_from_index" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|malformed.token.here|orderId|12|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: Get edit from index for order ID 12 with valid access token
    And I send the GET request to "orders_edit_from_index" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|12|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And I store the response as "editFromIndex_response" name using full path

  @Positive @Functional
  Scenario: Get edit from index for order ID 1 with valid access token
    And I send the GET request to "orders_edit_from_index" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And I store the response as "editFromIndex_response" name using full path

  @Positive @Functional
  Scenario: Get edit from index for order ID 5 with valid access token
    And I send the GET request to "orders_edit_from_index" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|5|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And I store the response as "editFromIndex_response" name using full path

  @Positive @DataValidation
  Scenario: Validate edit from index HTML response structure
    And I send the GET request to "orders_edit_from_index" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|12|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And validating the response contains the following values
      |Value|
      |html|
      |head|
      |title|
      |body|

  @Positive @HTMLValidation
  Scenario: Validate edit from index HTML page structure elements
    And I send the GET request to "orders_edit_from_index" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|12|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain element "html"
    And the HTML response should contain element "head"
    And the HTML response should contain element "body"
    And the HTML response should contain element "div"

  @Negative @Validation
  Scenario: Get edit from index with invalid order ID
    And I send the GET request to "orders_edit_from_index" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Negative @Validation
  Scenario: Get edit from index with non-existent order ID
    And I send the GET request to "orders_edit_from_index" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Negative @Validation
  Scenario: Get edit from index with negative order ID
    And I send the GET request to "orders_edit_from_index" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Negative @Validation
  Scenario: Get edit from index with zero order ID
    And I send the GET request to "orders_edit_from_index" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Negative @ErrorHandling
  Scenario: Get edit from index with invalid endpoint
    And I send the GET request to "orders_edit_from_index_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|12|
    Then I should see the response code as "404"
    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance test for edit from index endpoint
    And I send the GET request to "orders_edit_from_index" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|12|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Regression
  Scenario: Regression test for edit from index endpoint
    And I send the GET request to "orders_edit_from_index" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|12|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And validating the response contains the following values
      |Value|
      |html|
      |head|
      |title|
      |body|
    And I store the response as "editFromIndex_response" name using full path

  @Positive @HTMLValidation
  Scenario: Validate edit from index HTML content type
    And I send the GET request to "orders_edit_from_index" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|12|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain element "html"
    And the HTML response should contain element "head"
    And the HTML response should contain element "body"

  @Positive @HTMLValidation
  Scenario: Validate edit from index response completeness
    And I send the GET request to "orders_edit_from_index" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|orderId|12|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain element "html"
    And the HTML response should contain element "head"
    And the HTML response should contain element "body"
    And the HTML response should contain element "div"
    And validating the response contains the following values
      |Value|
      |html|
      |head|
      |title|
      |body|
    And I store the response as "editFromIndex_response" name using full path

