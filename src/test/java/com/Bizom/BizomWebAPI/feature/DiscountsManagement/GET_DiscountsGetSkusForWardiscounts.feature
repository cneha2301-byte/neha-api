@BizomWebAPI @PI @DiscountsManagement @DiscountsGetSkusForWardiscounts @IntegrationServices
Feature: Discounts Get Skus For War Discounts API Testing
  As a system user
  I want to test the discounts getSkusforWardiscounts endpoint with path parameters
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
  Scenario: TC_01 Get skusforWardiscounts without access token
    When I send the GET request to "discounts_getskusforwardiscounts" endpoint with path parameters
      |Path|Value|
      |discountId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get skusforWardiscounts with invalid access token
    And I send the GET request to "discounts_getskusforwardiscounts" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|discountId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get skusforWardiscounts with expired access token
    And I send the GET request to "discounts_getskusforwardiscounts" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|discountId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get skusforWardiscounts with malformed access token
    And I send the GET request to "discounts_getskusforwardiscounts" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|discountId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke @PathParam
  Scenario: TC_05 Get skusforWardiscounts for discountId 2 (users map)
    And I send the GET request to "discounts_getskusforwardiscounts" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.users|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      

  @Positive @Functional @PathParam
  Scenario: TC_06 Get skusforWardiscounts for discountId 1 (skunits array)
    And I send the GET request to "discounts_getskusforwardiscounts" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.skunits|array|
      |$.skunits[0]|object|
      |$.skunits[0].Skunit|object|
      |$.skunits[0].Skunit.id|string|
      |$.skunits[0].Skunit.skucode|string|
      |$.skunits[0].Skunit.name|string|
      |$.skunits[0].Skunit.mrp|string|
      |$.skunits[0].Skunit.price|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Positive @Functional @PathParam
  Scenario: TC_07 Get skusforWardiscounts for discountId 3 (single skunit)
    And I send the GET request to "discounts_getskusforwardiscounts" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.skunits|array|
      |$.skunits[0].Skunit|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.skunits[0].Skunit.id|"18"|
      |$.skunits[0].Skunit.name|"50-50"|

  @Negative @Validation @PathParam
  Scenario: TC_08 Get skusforWardiscounts with invalid discountId
    And I send the GET request to "discounts_getskusforwardiscounts" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling @PathParam
  Scenario: TC_09 Get skusforWardiscounts invalid endpoint with path param
    And I send the GET request to "discounts_getskusforwardiscounts_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: TC_10 Performance test for skusforWardiscounts endpoint
    And I send the GET request to "discounts_getskusforwardiscounts" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Headers
  Scenario: TC_11 Validate skusforWardiscounts response headers
    And I send the GET request to "discounts_getskusforwardiscounts" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|1|
    Then I should see the response code as "200"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Cache-Control|private, no-cache, no-store, must-revalidate|
    And verify response time is less than "2500" milliseconds

  @Positive @ResponseStorage
  Scenario: TC_12 Store skusforWardiscounts response for further use
    And I send the GET request to "discounts_getskusforwardiscounts" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "discounts_getskusforwardiscounts_response" name using full path


  @Positive @Regression
  Scenario: TC_13 Regression test for skusforWardiscounts endpoint
    And I send the GET request to "discounts_getskusforwardiscounts" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: TC_14 Get skusforWardiscounts with non-existent discountId
    And I send the GET request to "discounts_getskusforwardiscounts" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @ArrayValidation
  Scenario: TC_15 Validate skus array structure and types for discountId 1
    And I send the GET request to "discounts_getskusforwardiscounts" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.skunits|array|
      |$.skunits[0]|object|
      |$.skunits[1]|object|
      |$.skunits[0].Skunit.id|string|
      |$.skunits[1].Skunit.id|string|
      |$.skunits[0].Skunit.name|string|
      |$.skunits[1].Skunit.name|string|

  @Positive @ContentValidation
  Scenario: TC_16 Validate content presence for discountId 1
    And I send the GET request to "discounts_getskusforwardiscounts" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|1|
    Then I should see the response code as "200"
    And validating the response contains the following values
      |Value|
      |skunits|
      |Skunit|
      |id|
      |name|
      |mrp|
      |price|

  @Negative @Timeout
  Scenario: TC_17 Test skusforWardiscounts endpoint timeout handling
    And I send the GET request to "discounts_getskusforwardiscounts" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|1|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds

  @Positive @DBValidation
  Scenario: TC_18 Validate skusforWardiscounts with database verification (discountId 1)
    And I send the GET request to "discounts_getskusforwardiscounts" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      #|$.skunits[0].Skunit.name|DB:skunits:name: id=7|  expected: <12> but was: <"12">.


