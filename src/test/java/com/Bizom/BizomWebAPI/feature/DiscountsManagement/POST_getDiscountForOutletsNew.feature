@BizomWebAPI @PI @SupportingFunctions @DiscountsManagement @GetDiscountForOutletsNew
Feature: This feature file is of the testcases of POST end point of get discount for outlets new

#-------------------------------------------------------------------------------------------------

  @Test_1-positive
  Scenario: TC_01 Get discount for outlets new - positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "discounts_getdiscountforoutletsnew" payload
      |JPath|Value|
      |$.forentity|"2"|
      |$.toOutletIds|"2,3,4,5"|
      |$.fromWarehouseIds|"1"|
    And I post the request with "discounts_getdiscountforoutletsnew" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|

    #-----------------------------------------------------------------------------------------------------

  @Test_2-negative
  Scenario: TC_02 Get discount for outlets new without access token - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "discounts_getdiscountforoutletsnew" payload
      |JPath|Value|
      |$.forentity|"2"|
      |$.toOutletIds|"2,3,4,5"|
      |$.fromWarehouseIds|"1"|
    And I post the request with "discounts_getdiscountforoutletsnew" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token||
      |language|en|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------

  @Test_3-negative
  Scenario: TC_03 Get discount for outlets new with invalid access token - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "discounts_getdiscountforoutletsnew" payload
      |JPath|Value|
      |$.forentity|"2"|
      |$.toOutletIds|"2,3,4,5"|
      |$.fromWarehouseIds|"1"|
    And I post the request with "discounts_getdiscountforoutletsnew" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|invalid_token_12345|
      |language|en|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_4-negative @Validation
  Scenario: TC_04 Get discount for outlets new with blank forentity field - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "discounts_getdiscountforoutletsnew" payload
      |JPath|Value|
      |$.forentity|""|
      |$.toOutletIds|"2,3,4,5"|
      |$.fromWarehouseIds|"1"|
    And I post the request with "discounts_getdiscountforoutletsnew" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_5-negative @Validation
  Scenario: TC_05 Get discount for outlets new with blank toOutletIds field - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "discounts_getdiscountforoutletsnew" payload
      |JPath|Value|
      |$.forentity|"2"|
      |$.toOutletIds|""|
      |$.fromWarehouseIds|"1"|
    And I post the request with "discounts_getdiscountforoutletsnew" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_6-negative @Validation
  Scenario: TC_06 Get discount for outlets new with blank fromWarehouseIds field - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "discounts_getdiscountforoutletsnew" payload
      |JPath|Value|
      |$.forentity|"2"|
      |$.toOutletIds|"2,3,4,5"|
      |$.fromWarehouseIds|""|
    And I post the request with "discounts_getdiscountforoutletsnew" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_7-negative @Validation
  Scenario: TC_07 Get discount for outlets new with invalid forentity value - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "discounts_getdiscountforoutletsnew" payload
      |JPath|Value|
      |$.forentity|"99999"|
      |$.toOutletIds|"2,3,4,5"|
      |$.fromWarehouseIds|"1"|
    And I post the request with "discounts_getdiscountforoutletsnew" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

    #-----------------------------------------------------------------------------------------------------

  @Test_8-negative @Validation
  Scenario: TC_08 Get discount for outlets new with invalid toOutletIds format - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "discounts_getdiscountforoutletsnew" payload
      |JPath|Value|
      |$.forentity|"2"|
      |$.toOutletIds|"invalid,ids,format"|
      |$.fromWarehouseIds|"1"|
    And I post the request with "discounts_getdiscountforoutletsnew" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_9-negative @Validation
  Scenario: TC_09 Get discount for outlets new with non-existent outlet IDs - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "discounts_getdiscountforoutletsnew" payload
      |JPath|Value|
      |$.forentity|"2"|
      |$.toOutletIds|"99999,99998"|
      |$.fromWarehouseIds|"1"|
    And I post the request with "discounts_getdiscountforoutletsnew" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

    #-----------------------------------------------------------------------------------------------------

  @Test_10-negative @Validation
  Scenario: TC_10 Get discount for outlets new with non-existent warehouse IDs - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "discounts_getdiscountforoutletsnew" payload
      |JPath|Value|
      |$.forentity|"2"|
      |$.toOutletIds|"2,3,4,5"|
      |$.fromWarehouseIds|"99999"|
    And I post the request with "discounts_getdiscountforoutletsnew" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

    #-----------------------------------------------------------------------------------------------------

  @Test_11-positive
  Scenario: TC_11 Get discount for outlets new with single outlet ID - positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "discounts_getdiscountforoutletsnew" payload
      |JPath|Value|
      |$.forentity|"2"|
      |$.toOutletIds|"2"|
      |$.fromWarehouseIds|"1"|
    And I post the request with "discounts_getdiscountforoutletsnew" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

    #-----------------------------------------------------------------------------------------------------

  @Test_12-positive
  Scenario: TC_12 Get discount for outlets new with multiple warehouse IDs - positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "discounts_getdiscountforoutletsnew" payload
      |JPath|Value|
      |$.forentity|"2"|
      |$.toOutletIds|"2,3,4,5"|
      |$.fromWarehouseIds|"1,2"|
    And I post the request with "discounts_getdiscountforoutletsnew" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

    #-----------------------------------------------------------------------------------------------------

  @Test_13-positive @DataValidation
  Scenario: TC_13 Validate get discount for outlets new response structure when no discount found
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "discounts_getdiscountforoutletsnew" payload
      |JPath|Value|
      |$.forentity|"2"|
      |$.toOutletIds|"2,3,4,5"|
      |$.fromWarehouseIds|"1"|
    And I post the request with "discounts_getdiscountforoutletsnew" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"No discount found"|
      |$.Data|{}|
    And I store the response as "getDiscountForOutletsNew_response" name using full path

    #-----------------------------------------------------------------------------------------------------

  @Test_14-positive @ContentValidation
  Scenario: TC_14 Validate get discount for outlets new response contains expected keys
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "discounts_getdiscountforoutletsnew" payload
      |JPath|Value|
      |$.forentity|"2"|
      |$.toOutletIds|"2,3,4,5"|
      |$.fromWarehouseIds|"1"|
    And I post the request with "discounts_getdiscountforoutletsnew" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Data|

    #-----------------------------------------------------------------------------------------------------

  @Test_15-positive @Performance
  Scenario: TC_15 Performance test for get discount for outlets new endpoint
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "discounts_getdiscountforoutletsnew" payload
      |JPath|Value|
      |$.forentity|"2"|
      |$.toOutletIds|"2,3,4,5"|
      |$.fromWarehouseIds|"1"|
    And I post the request with "discounts_getdiscountforoutletsnew" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

    #-----------------------------------------------------------------------------------------------------

  @Test_16-positive @DataValidation
  Scenario: TC_16 Get discount for outlets new with different language parameter
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "discounts_getdiscountforoutletsnew" payload
      |JPath|Value|
      |$.forentity|"2"|
      |$.toOutletIds|"2,3,4,5"|
      |$.fromWarehouseIds|"1"|
    And I post the request with "discounts_getdiscountforoutletsnew" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
      |language|hi|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

    #-----------------------------------------------------------------------------------------------------

  @Test_17-negative @Validation
  Scenario: TC_17 Get discount for outlets new with missing language parameter
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "discounts_getdiscountforoutletsnew" payload
      |JPath|Value|
      |$.forentity|"2"|
      |$.toOutletIds|"2,3,4,5"|
      |$.fromWarehouseIds|"1"|
    And I post the request with "discounts_getdiscountforoutletsnew" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

    #-----------------------------------------------------------------------------------------------------

  @Test_18-positive @Boundary
  Scenario: TC_18 Get discount for outlets new with maximum number of outlet IDs
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "discounts_getdiscountforoutletsnew" payload
      |JPath|Value|
      |$.forentity|"2"|
      |$.toOutletIds|"1,2,3,4,5,6,7,8,9,10"|
      |$.fromWarehouseIds|"1"|
    And I post the request with "discounts_getdiscountforoutletsnew" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

    #-----------------------------------------------------------------------------------------------------

  @Test_19-negative @Validation
  Scenario: TC_19 Get discount for outlets new with string value for forentity - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "discounts_getdiscountforoutletsnew" payload
      |JPath|Value|
      |$.forentity|"invalidEntity"|
      |$.toOutletIds|"2,3,4,5"|
      |$.fromWarehouseIds|"1"|
    And I post the request with "discounts_getdiscountforoutletsnew" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_20-negative @Validation
  Scenario: TC_20 Get discount for outlets new with numeric value for forentity - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "discounts_getdiscountforoutletsnew" payload
      |JPath|Value|
      |$.forentity|99999|
      |$.toOutletIds|"2,3,4,5"|
      |$.fromWarehouseIds|"1"|
    And I post the request with "discounts_getdiscountforoutletsnew" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_21-negative @Security
  Scenario: TC_21 Get discount for outlets new with expired access token - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "discounts_getdiscountforoutletsnew" payload
      |JPath|Value|
      |$.forentity|"2"|
      |$.toOutletIds|"2,3,4,5"|
      |$.fromWarehouseIds|"1"|
    And I post the request with "discounts_getdiscountforoutletsnew" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|expired_token_12345|
      |language|en|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_22-negative @Security
  Scenario: TC_22 Get discount for outlets new with malformed access token - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "discounts_getdiscountforoutletsnew" payload
      |JPath|Value|
      |$.forentity|"2"|
      |$.toOutletIds|"2,3,4,5"|
      |$.fromWarehouseIds|"1"|
    And I post the request with "discounts_getdiscountforoutletsnew" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|malformed.token.here|
      |language|en|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_23-positive @DataValidation
  Scenario: TC_23 Get discount for outlets new with different forentity values - positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "discounts_getdiscountforoutletsnew" payload
      |JPath|Value|
      |$.forentity|"1"|
      |$.toOutletIds|"2,3,4,5"|
      |$.fromWarehouseIds|"1"|
    And I post the request with "discounts_getdiscountforoutletsnew" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

    #-----------------------------------------------------------------------------------------------------

  @Test_24-negative @ErrorHandling
  Scenario: TC_24 Get discount for outlets new with invalid endpoint
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "discounts_getdiscountforoutletsnew_invalid" payload
      |JPath|Value|
      |$.forentity|"2"|
      |$.toOutletIds|"2,3,4,5"|
      |$.fromWarehouseIds|"1"|
    And I post the request with "discounts_getdiscountforoutletsnew_invalid" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "405"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_25-positive @DataValidation
  Scenario: TC_25 Validate get discount for outlets new response when data exists
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "discounts_getdiscountforoutletsnew" payload
      |JPath|Value|
      |$.forentity|"2"|
      |$.toOutletIds|"2,3,4,5"|
      |$.fromWarehouseIds|"1"|
    And I post the request with "discounts_getdiscountforoutletsnew" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Data|




