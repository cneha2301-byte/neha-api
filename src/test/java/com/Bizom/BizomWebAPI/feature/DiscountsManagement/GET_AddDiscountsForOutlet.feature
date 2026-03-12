@BizomWebAPI @PI @DiscountsManagement @DiscountsAddForOutlet @IntegrationServices
Feature: Add Discounts for Outlet API Testing
  As a system user
  I want to test the add discounts for outlet endpoint
  So that I can ensure proper functionality and HTML page rendering for adding discounts to specific outlets

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get add discounts for outlet without access token
    When I send the GET request to "discounts_addforoutlet" endpoint with path parameters
      |Path|Value|
      |outletId|8|
    Then I should see the response code as "200"
    And the HTML response should contain element "title" with content "Users"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Login to your account|
      |Always verify the URL before entering the Credentials!|

#  @Negative @Security
#  Scenario: TC_02 Get add discounts for outlet with invalid access token
#    And I send the GET request to "discounts_addforoutlet" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|invalid_token_12345|outletId|DB:outlets:id name="J K Kirana"|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      | JPath     | Value    |
#      | $.result | false   |
#      | $.error.code  | 401 |
#      | $.error.message  | Invalid Access Token or Credentials |
#
#  @Negative @Security
#  Scenario: TC_03 Get add discounts for outlet with expired access token
#    And I send the GET request to "discounts_addforoutlet" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|expired_token_12345|outletId|8|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      | JPath     | Value    |
#      | $.result | false   |
#      | $.error.code  | 401 |
#      | $.error.message  | Invalid Access Token or Credentials |
#
#  @Negative @Security
#  Scenario: TC_04 Get add discounts for outlet with malformed access token
#    And I send the GET request to "discounts_addforoutlet" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|malformed.token.here|outletId|8|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      | JPath     | Value    |
#      | $.result | false   |
#      | $.error.code  | 401 |
#      | $.error.message  | Invalid Access Token or Credentials |

  @Positive @Smoke
  Scenario: TC_05 Get add discounts for outlet with valid outlet ID and access token
    And I send the GET request to "discounts_addforoutlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|8|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain element "form"
    And the HTML response should contain element "table"
    And the HTML response should contain element "div"
    And the HTML response should contain element "u" with content "J K Kirana"
    And I store the response as "add_discounts_for_outlet_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Get add discounts for outlet with valid outlet ID - validate HTML structure
    And I send the GET request to "discounts_addforoutlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|8|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain element "div"
    And the HTML response should contain element "table"
    And the HTML response should contain element "form"

  @Positive @HTMLValidation
  Scenario: TC_07 Validate add discounts for outlet HTML contains discount form elements
    And I send the GET request to "discounts_addforoutlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|8|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And validating the response contains the following values
      |Value|
      |discounts|
      |warehouseId|
      |DiscountAddforoutletForm|
      |outletid|

  @Positive @HTMLValidation
  Scenario: TC_08 Validate add discounts for outlet HTML contains product table structure
    And I send the GET request to "discounts_addforoutlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|8|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Product Id|
      |Product|
      |Product Code|
      |Mrp|
      |UnitPrice|
      |Discount(%) on Mrp|
      |Discount(%) on Price|
      |Discounted Price(Rs)|

#  @Negative @Validation
#  Scenario: TC_09 Get add discounts for outlet with invalid outlet ID - negative number
#    And I send the GET request to "discounts_addforoutlet" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|outletId|-1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#
#  @Negative @Security
#  Scenario: TC_10 Get add discounts for outlet with SQL injection attempt in outlet ID
#    And I send the GET request to "discounts_addforoutlet" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|outletId|8'; DROP TABLE outlets; --|
#    Then I should see the response code as "200"
#    And the HTML response should contain element "title" with content "Users"
#    And verify response time is less than "2500" milliseconds
#    And validating the response contains the following values
#      |Value|
#      |Login to your account|
#      |Always verify the URL before entering the Credentials!|
#
#  @Negative @Security
#  Scenario: TC_11 Get add discounts for outlet with XSS attempt in outlet ID
#    And I send the GET request to "discounts_addforoutlet" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|outletId|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And the HTML response should contain element "title" with content "Users"
#    And verify response time is less than "2500" milliseconds
#    And validating the response contains the following values
#      |Value|
#      |Login to your account|
#      |Always verify the URL before entering the Credentials!|

  @Positive @Boundary
  Scenario: TC_12 Get add discounts for outlet with invalid outlet ID
    And I send the GET request to "discounts_addforoutlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And the HTML response should contain element "title" with content "Users"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Login to your account|
      |Always verify the URL before entering the Credentials!|

  @Positive @DataValidation
  Scenario: TC_13 Validate add discounts for outlet HTML contains outlet name
    And I send the GET request to "discounts_addforoutlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|8|
    Then I should see the response code as "200"
    And the HTML response should contain element "u" with content "J K Kirana"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Add Discounts for|
      |Select warehouse|
      |Search Skunit|

  @Positive @HTMLValidation
  Scenario: TC_14 Validate add discounts for outlet HTML contains discount calculation fields
    And I send the GET request to "discounts_addforoutlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|8|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |mrpdiscoun|
      |discoun|
      |calculatediscount|
      |discountunitcase|
      |Update|

  @Positive @Performance
  Scenario: TC_15 Performance test for add discounts for outlet endpoint
    And I send the GET request to "discounts_addforoutlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|8|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @Concurrency
  Scenario: TC_16 Concurrent access test for add discounts for outlet endpoint
    And I send the GET request to "discounts_addforoutlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|8|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain element "form"

  @Negative @ErrorHandling
  Scenario: TC_17 Get add discounts for outlet with invalid endpoint path
    And I send the GET request to "discounts_addforoutlet_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|8|
    Then I should see the response code as "200"
    And the HTML response should contain element "title" with content "Users"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Login to your account|
      |Always verify the URL before entering the Credentials!|

  @Negative @Validation
  Scenario: TC_18 Get add discounts for outlet with empty outlet ID
    And I send the GET request to "discounts_addforoutlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId||
    Then I should see the response code as "200"
    And the HTML response should contain element "title" with content "Users"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Login to your account|
      |Always verify the URL before entering the Credentials!|

  @Positive @BusinessLogic
  Scenario: TC_19 Validate add discounts for outlet response contains warehouse selector
    And I send the GET request to "discounts_addforoutlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|8|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |warehouseId|
      |getnewdata|
      |Select warehouse|
      |SLV DISTRIBUTOR|

  @Positive @DataIntegrity
  Scenario: TC_20 Validate add discounts for outlet HTML structure completeness
    And I send the GET request to "discounts_addforoutlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|8|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain element "div"
    And the HTML response should contain element "table"
    And the HTML response should contain element "form"
    And the HTML response should contain element "button"

  @Positive @Regression
  Scenario: TC_21 Regression test for add discounts for outlet endpoint
    And I send the GET request to "discounts_addforoutlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|8|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain element "form"

  @Positive @Functional
  Scenario: TC_22 Validate add discounts for outlet response completeness
    And I send the GET request to "discounts_addforoutlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|8|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain element "div"
    And the HTML response should contain element "table"
    And the HTML response should contain element "form"
    And validating the response contains the following values
      |Value|
      |J K Kirana|
      |SLV DISTRIBUTOR|
      |discounts|
      |Add Discounts for|
    And I store the response as "add_discounts_for_outlet_response" name using full path

  @Positive @HTMLValidation
  Scenario: TC_23 Validate add discounts for outlet HTML content type
    And I send the GET request to "discounts_addforoutlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|8|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @HTMLValidation
  Scenario: TC_24 Validate add discounts for outlet HTML contains script elements
    And I send the GET request to "discounts_addforoutlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|8|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |script|
      |javascript|
      |calcAndUpdateBasedOnDiscountPercentOnMrp|
      |calcAndUpdateBasedOnDiscountPercentOnPrice|

  @Positive @DataValidation
  Scenario: TC_25 Validate add discounts for outlet HTML contains hidden input fields
    And I send the GET request to "discounts_addforoutlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|8|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |skunitid|
      |skumrp|
      |skuprice|
      |skuunitcase|
      |outletid|

  @Positive @BusinessLogic
  Scenario: TC_26 Validate add discounts for outlet HTML contains update button
    And I send the GET request to "discounts_addforoutlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|8|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Update|
      |Update All|
      |savediscount|
      |discountsubmit|

  @Positive @HTMLValidation
  Scenario: TC_27 Validate add discounts for outlet HTML contains form action
    And I send the GET request to "discounts_addforoutlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|8|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |DiscountAddforoutletForm|
      |discounts/addforoutlet|
      |method|
      |post|

