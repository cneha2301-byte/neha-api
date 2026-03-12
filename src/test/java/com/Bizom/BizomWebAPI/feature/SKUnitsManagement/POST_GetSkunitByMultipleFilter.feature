@BizomWebAPI @SkunitsManagement @GetSkunitByMultipleFilter @ProductManagement @OS
Feature: GetSkunitByMultipleFilter API Testing
  As a system user
  I want to test the getSkunitByMultipleFilter endpoint
  So that I can ensure proper functionality and data retrieval for SKUs by multiple filters

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get SKU by multiple filter without access token
    And I post the request with "POST_get_skunit_by_multiple_filter" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token||
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get SKU by multiple filter with invalid access token
    And I post the request with "POST_get_skunit_by_multiple_filter" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|invalid_token_12345|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get SKU by multiple filter with expired access token
    And I post the request with "POST_get_skunit_by_multiple_filter" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|expired_token_12345|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get SKU by multiple filter with malformed access token
    And I post the request with "POST_get_skunit_by_multiple_filter" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|malformed.token.here|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get SKU by multiple filter with valid parameters
    And I post the request with "POST_get_skunit_by_multiple_filter" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
      |$[0]|array|
      |$[0].id|array|
      |$[0].text|array|
    And I store the response as "getskunitbymultiplefilter_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate get SKU by multiple filter response structure
    And I post the request with "POST_get_skunit_by_multiple_filter" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
      |$[0]|array|
      |$[0].id|array|
      |$[0].text|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate SKU object fields in array
    And I post the request with "POST_get_skunit_by_multiple_filter" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$[0].id|"1"|
      |$[0].text|"Cuba- Cafe Cuba upc:24"|
      |$[0]["data-upc"]|"24"|
      |$[0]["data-batchenable"]|"0"|

  @Positive @DataValidation
  Scenario: TC_08 Validate multiple SKU objects in array
    And I post the request with "POST_get_skunit_by_multiple_filter" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$[1]|object|

  @Positive @DataValidation
  Scenario: TC_09 Validate get SKU by multiple filter response contains required fields
    And I post the request with "POST_get_skunit_by_multiple_filter" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |id|
      |text|
      |data-upc|
      |data-batchenable|

  @Negative @Validation
  Scenario: TC_10 Get SKU by multiple filter with invalid brandId
    And I modify fields with random values and remove fields in "POST_get_skunit_by_multiple_filter" payload
      |JPath|Value|
      |$.brandId|["invalid"]|
    And I post the request with "POST_get_skunit_by_multiple_filter" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_11 Get SKU by multiple filter with non-existent brandId
    And I modify fields with random values and remove fields in "POST_get_skunit_by_multiple_filter" payload
      |JPath|Value|
      |$.brandId|["999999"]|
    And I post the request with "POST_get_skunit_by_multiple_filter" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_12 Get SKU by multiple filter with missing brandId
    And I modify fields with random values and remove fields in "POST_get_skunit_by_multiple_filter" payload
      |JPath|Value|
      |$.brandId|""|
    And I post the request with "POST_get_skunit_by_multiple_filter" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_13 Get SKU by multiple filter with empty brandId array
    And I modify fields with random values and remove fields in "POST_get_skunit_by_multiple_filter" payload
      |JPath|Value|
      |$.brandId|[]|
    And I post the request with "POST_get_skunit_by_multiple_filter" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_14 Get SKU by multiple filter with empty body
    And I send empty body with "POST_get_skunit_by_multiple_filter" request
    And I post the request with "POST_get_skunit_by_multiple_filter" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_15 Get SKU by multiple filter with invalid endpoint
    And I post the request with "POST_get_skunit_by_multiple_filter_invalid" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "405"
    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: TC_16 Performance test for get SKU by multiple filter endpoint
    And I post the request with "POST_get_skunit_by_multiple_filter" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Positive @BusinessLogic
  Scenario: TC_17 Get SKU by multiple filter with different brandId
    And I modify fields with random values and remove fields in "POST_get_skunit_by_multiple_filter" payload
      |JPath|Value|
      |$.brandId|["2"]|
    And I post the request with "POST_get_skunit_by_multiple_filter" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
      |$[0]|array|

  @Positive @BusinessLogic
  Scenario: TC_18 Get SKU by multiple filter with multiple brandIds
    And I modify fields with random values and remove fields in "POST_get_skunit_by_multiple_filter" payload
      |JPath|Value|
      |$.brandId|["1","2"]|
    And I post the request with "POST_get_skunit_by_multiple_filter" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
      |$[0]|array|

  @Positive @Regression
  Scenario: TC_19 Regression test for get SKU by multiple filter endpoint
    And I post the request with "POST_get_skunit_by_multiple_filter" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
      |$[0]|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$[0].id|"1"|
      |$[0]["data-batchenable"]|"0"|
    And I store the response as "getskunitbymultiplefilter_response" name using full path

  @Positive @DataValidation
  Scenario: TC_20 Validate all SKU objects have required fields
    And I post the request with "POST_get_skunit_by_multiple_filter" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$[0].id|array|
      |$[0].text|array|
      |$[0]["data-upc"]|array|
      |$[0]["data-batchenable"]|array|
      |$[1].id|array|
      |$[1].text|array|
      |$[1]["data-upc"]|array|
      |$[1]["data-batchenable"]|array|
      |$[2].id|array|
      |$[2].text|array|
      |$[2]["data-upc"]|array|
      |$[2]["data-batchenable"]|array|

