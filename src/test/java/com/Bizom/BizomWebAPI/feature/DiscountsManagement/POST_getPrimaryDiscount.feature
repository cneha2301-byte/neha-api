@BizomWebAPI @PI @SupportingFunctions @DiscountsManagement @GetPrimaryDiscount
Feature: This feature file is of the testcases of POST end point of get primary discount

#-------------------------------------------------------------------------------------------------

  @Test_1-positive
  Scenario: TC_01 Get primary discount - positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "discounts_get_primary" payload
      |JPath|Value|
      |$.toOutletIds|"2,3,4,5"|
      |$.fromWarehouseIds|"1"|
    And I post the request with "discounts_get_primary" payload with dynamic access token and query parameters
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
      |$.Data|array|
      |$.enablePD|string|

    #-----------------------------------------------------------------------------------------------------

  @Test_2-negative
  Scenario: TC_02 Get primary discount without access token - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "discounts_get_primary" payload
      |JPath|Value|
      |$.toOutletIds|"2,3,4,5"|
      |$.fromWarehouseIds|"1"|
    And I post the request with "discounts_get_primary" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token||
      |language|en|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------

  @Test_3-negative
  Scenario: TC_03 Get primary discount with invalid access token - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "discounts_get_primary" payload
      |JPath|Value|
      |$.toOutletIds|"2,3,4,5"|
      |$.fromWarehouseIds|"1"|
    And I post the request with "discounts_get_primary" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|invalid_token_12345|
      |language|en|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_4-negative @Validation
  Scenario: TC_04 Get primary discount with blank toOutletIds field - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "discounts_get_primary" payload
      |JPath|Value|
      |$.fromWarehouseIds|"1"|
    And I post the request with "discounts_get_primary" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_5-negative @Validation
  Scenario: TC_05 Get primary discount with blank fromWarehouseIds field - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "discounts_get_primary" payload
      |JPath|Value|
      |$.toOutletIds|"2,3,4,5"|
    And I post the request with "discounts_get_primary" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_6-negative @Validation
  Scenario: TC_06 Get primary discount with invalid toOutletIds format - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "discounts_get_primary" payload
      |JPath|Value|
      |$.toOutletIds|"invalid,ids,format"|
      |$.fromWarehouseIds|"1"|
    And I post the request with "discounts_get_primary" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_7-negative @Validation
  Scenario: TC_07 Get primary discount with non-existent outlet IDs - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "discounts_get_primary" payload
      |JPath|Value|
      |$.toOutletIds|"99999,99998"|
      |$.fromWarehouseIds|"1"|
    And I post the request with "discounts_get_primary" payload with dynamic access token and query parameters
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
  Scenario: TC_08 Get primary discount with non-existent warehouse IDs - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "discounts_get_primary" payload
      |JPath|Value|
      |$.toOutletIds|"2,3,4,5"|
      |$.fromWarehouseIds|"99999"|
    And I post the request with "discounts_get_primary" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

    #-----------------------------------------------------------------------------------------------------

  @Test_9-positive
  Scenario: TC_09 Get primary discount with single outlet ID - positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "discounts_get_primary" payload
      |JPath|Value|
      |$.toOutletIds|"2"|
      |$.fromWarehouseIds|"1"|
    And I post the request with "discounts_get_primary" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

    #-----------------------------------------------------------------------------------------------------

  @Test_10-positive
  Scenario: TC_10 Get primary discount with multiple warehouse IDs - positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "discounts_get_primary" payload
      |JPath|Value|
      |$.toOutletIds|"2,3,4,5"|
      |$.fromWarehouseIds|"1,2"|
    And I post the request with "discounts_get_primary" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

    #-----------------------------------------------------------------------------------------------------

  @Test_11-positive @DataValidation
  Scenario: TC_11 Validate get primary discount response structure when no data found
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "discounts_get_primary" payload
      |JPath|Value|
      |$.toOutletIds|"2,3,4,5"|
      |$.fromWarehouseIds|"1"|
    And I post the request with "discounts_get_primary" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"No Data found."|
      |$.Data|[]|
    And I store the response as "getPrimaryDiscount_response" name using full path

    #-----------------------------------------------------------------------------------------------------

  @Test_12-positive @ContentValidation
  Scenario: TC_12 Validate get primary discount response contains expected keys
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "discounts_get_primary" payload
      |JPath|Value|
      |$.toOutletIds|"2,3,4,5"|
      |$.fromWarehouseIds|"1"|
    And I post the request with "discounts_get_primary" payload with dynamic access token and query parameters
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
      |enablePD|

    #-----------------------------------------------------------------------------------------------------

  @Test_13-positive @Performance
  Scenario: TC_13 Performance test for get primary discount endpoint
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "discounts_get_primary" payload
      |JPath|Value|
      |$.toOutletIds|"2,3,4,5"|
      |$.fromWarehouseIds|"1"|
    And I post the request with "discounts_get_primary" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

    #-----------------------------------------------------------------------------------------------------

  @Test_14-positive @DataValidation
  Scenario: TC_14 Get primary discount with different language parameter
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "discounts_get_primary" payload
      |JPath|Value|
      |$.toOutletIds|"2,3,4,5"|
      |$.fromWarehouseIds|"1"|
    And I post the request with "discounts_get_primary" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
      |language|hi|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

    #-----------------------------------------------------------------------------------------------------

  @Test_15-negative @Validation
  Scenario: TC_15 Get primary discount with missing language parameter
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "discounts_get_primary" payload
      |JPath|Value|
      |$.toOutletIds|"2,3,4,5"|
      |$.fromWarehouseIds|"1"|
    And I post the request with "discounts_get_primary" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

    #-----------------------------------------------------------------------------------------------------

  @Test_16-positive @Boundary
  Scenario: TC_16 Get primary discount with maximum number of outlet IDs
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "discounts_get_primary" payload
      |JPath|Value|
      |$.toOutletIds|"1,2,3,4,5,6,7,8,9,10"|
      |$.fromWarehouseIds|"1"|
    And I post the request with "discounts_get_primary" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

    #-----------------------------------------------------------------------------------------------------

  @Test_17-negative @Security
  Scenario: TC_17 Get primary discount with expired access token - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "discounts_get_primary" payload
      |JPath|Value|
      |$.toOutletIds|"2,3,4,5"|
      |$.fromWarehouseIds|"1"|
    And I post the request with "discounts_get_primary" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|expired_token_12345|
      |language|en|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_18-negative @Security
  Scenario: TC_18 Get primary discount with malformed access token - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "discounts_get_primary" payload
      |JPath|Value|
      |$.toOutletIds|"2,3,4,5"|
      |$.fromWarehouseIds|"1"|
    And I post the request with "discounts_get_primary" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|malformed.token.here|
      |language|en|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_19-negative @Validation
  Scenario: TC_19 Get primary discount with empty payload - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "discounts_get_primary" payload
      |JPath|Value|
      |$.toOutletIds|""|
      |$.fromWarehouseIds|""|
    And I post the request with "discounts_get_primary" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_20-positive @DataValidation
  Scenario: TC_20 Validate get primary discount response when data exists
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "discounts_get_primary" payload
      |JPath|Value|
      |$.toOutletIds|"2,3,4,5"|
      |$.fromWarehouseIds|"1"|
    And I post the request with "discounts_get_primary" payload with dynamic access token and query parameters
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
      |$.Data|array|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Data|
      |enablePD|

    #-----------------------------------------------------------------------------------------------------

  @Test_21-negative @ErrorHandling
  Scenario: TC_21 Get primary discount with invalid endpoint
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "discounts_get_primary_invalid" payload
      |JPath|Value|
      |$.toOutletIds|"2,3,4,5"|
      |$.fromWarehouseIds|"1"|
    And I post the request with "discounts_get_primary_invalid" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "405"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_22-negative @Validation
  Scenario: TC_22 Get primary discount with special characters in outlet IDs - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "discounts_get_primary" payload
      |JPath|Value|
      |$.toOutletIds|"@#$%,!@#"|
      |$.fromWarehouseIds|"1"|
    And I post the request with "discounts_get_primary" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_23-negative @Validation
  Scenario: TC_23 Get primary discount with negative outlet IDs - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "discounts_get_primary" payload
      |JPath|Value|
      |$.toOutletIds|"-1,-2"|
      |$.fromWarehouseIds|"1"|
    And I post the request with "discounts_get_primary" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_24-negative @Validation
  Scenario: TC_24 Get primary discount with negative warehouse IDs - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "discounts_get_primary" payload
      |JPath|Value|
      |$.toOutletIds|"2,3,4,5"|
      |$.fromWarehouseIds|"-1"|
    And I post the request with "discounts_get_primary" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_25-positive @DataValidation
  Scenario: TC_25 Get primary discount with valid data and store response
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "discounts_get_primary" payload
      |JPath|Value|
      |$.toOutletIds|"2,3,4,5"|
      |$.fromWarehouseIds|"1"|
    And I post the request with "discounts_get_primary" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And I store the response as "getPrimaryDiscount_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|



