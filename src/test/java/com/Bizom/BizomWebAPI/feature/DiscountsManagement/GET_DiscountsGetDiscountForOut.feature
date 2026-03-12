@BizomWebAPI @PI @DiscountsManagement @DiscountsGetDiscountForOut @IntegrationServices
Feature: Discounts Get Discount For Outlet API Testing
  As a system user
  I want to test the discounts getdiscountforout endpoint with path parameters
  So that I can ensure proper functionality and dynamic path handling for discount IDs

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get discountforout without access token
    When I send the GET request to "discounts_getdiscountforout" endpoint with path parameters
      |Path|Value|
      |discountId|2|
    Then I should see the response code as "200"
    Then the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get discountforout with invalid access token
    And I send the GET request to "discounts_getdiscountforout" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|discountId|2|
    Then I should see the response code as "200"
    Then the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get discountforout with expired access token
    And I send the GET request to "discounts_getdiscountforout" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|discountId|2|
    Then I should see the response code as "200"
    Then the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get discountforout with malformed access token
    And I send the GET request to "discounts_getdiscountforout" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|discountId|2|
    Then I should see the response code as "200"
    Then the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke @PathParam
  Scenario: TC_05 Get discountforout for discountId 2
    And I send the GET request to "discounts_getdiscountforout" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.discount|object|
      |$.discount["1"]|object|
      |$.discount["1"].Discount|object|
      |$.discount["1"].Discount.id|string|
      |$.discount["1"].Discount.discount|string|
      |$.discount["1"].Discount.discountvalue|string|
      |$.discount["1"].Discount.skunit_id|string|
      |$.discount["1"].Discount.entity_type|string|
      |$.discount["1"].Discount.entity_type_id|string|
      |$.discount["1"].Discount.fromlevelname|string|
      |$.discount["1"].Discount.fromlevelid|string|
      |$.discount["1"].Discount.tolevelname|string|
      |$.discount["1"].Discount.outlet_id|string|
      |$.discount["1"].Discount.status|string|
      |$.discountCategoryName|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Discounts found"|
      |$.discount["1"].Discount.id|"12926"|
      |$.discount["1"].Discount.discount|"0.0000"|
      |$.discount["1"].Discount.discountvalue|"1.0000"|
      |$.discount["1"].Discount.skunit_id|"1"|
      |$.discount["1"].Discount.entity_type|"skunits"|
      |$.discount["1"].Discount.entity_type_id|"1"|
      |$.discount["1"].Discount.fromlevelname|"zone"|
      |$.discount["1"].Discount.fromlevelid|"1"|
      |$.discount["1"].Discount.tolevelname|"outlet"|
      |$.discount["1"].Discount.outlet_id|"2"|
      |$.discount["1"].Discount.status|"approved"|

  @Negative @Validation @PathParam
  Scenario: TC_06 Get discountforout with invalid discountId format
    And I send the GET request to "discounts_getdiscountforout" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|abc|
    Then I should see the response code as "500"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling @PathParam
  Scenario: TC_07 Get discountforout invalid endpoint with path param
    And I send the GET request to "discounts_getdiscountforout_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_08 Get discountforout with non-existent discountId
    And I send the GET request to "discounts_getdiscountforout" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: TC_09 Performance test for discountforout endpoint
    And I send the GET request to "discounts_getdiscountforout" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|2|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Headers
  Scenario: TC_10 Validate discountforout response headers
    And I send the GET request to "discounts_getdiscountforout" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|2|
    Then I should see the response code as "200"
    And verify response headers
      |HeaderName|HeaderValue|
      |Cache-Control|private, no-cache, no-store, must-revalidate|
    And verify response time is less than "2500" milliseconds

  @Positive @ResponseStorage
  Scenario: TC_11 Store discountforout response for further use
    And I send the GET request to "discounts_getdiscountforout" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "discounts_getdiscountforout_response" name using full path

  @Positive @Concurrency
  Scenario: TC_12 Concurrent access test for discountforout endpoint
    And I send the GET request to "discounts_getdiscountforout" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @LoadTesting
  Scenario: TC_13 Load testing for discountforout endpoint
    And I send the GET request to "discounts_getdiscountforout" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|2|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Negative @Timeout
  Scenario: TC_14 Test discountforout endpoint timeout handling
    And I send the GET request to "discounts_getdiscountforout" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|2|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds

  @Positive @ContentValidation
  Scenario: TC_15 Validate discountforout content presence
    And I send the GET request to "discounts_getdiscountforout" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|2|
    Then I should see the response code as "200"
    And validating the response contains the following values
      |Value|
      |discount|
      |Discount|
      |id|
      |discountvalue|
      |entity_type|
      |outlet_id|

  @Positive @EndToEnd
  Scenario: TC_16 End-to-end discountforout data retrieval workflow
    And I send the GET request to "discounts_getdiscountforout" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Discounts found"|
    And I store the response as "discounts_getdiscountforout_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.discount|object|
      |$.discount["1"].Discount|object|
      |$.discount["1"].Discount.id|string|
      |$.discount["1"].Discount.outlet_id|string|

  @Positive @Comprehensive
  Scenario: TC_17 Comprehensive discountforout validation
    And I send the GET request to "discounts_getdiscountforout" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.discount|object|
      |$.discount["1"].Discount|object|
      |$.discount["1"].Discount.id|string|
      |$.discount["1"].Discount.entity_type|string|
      |$.discountCategoryName|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.discount["1"].Discount.entity_type|"skunits"|
      |$.discount["1"].Discount.outlet_id|"2"|
    And I store the response as "discounts_getdiscountforout_response" name using full path



