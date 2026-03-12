@BizomWebAPI @SkuUnitsManagement @SkuUnitsForBrands @ProductManagement @OS
Feature: Get SKUs For Brand API Testing
  As a system user
  I want to test the get SKUs for brand endpoint
  So that I can ensure proper functionality and data retrieval for SKUs filtered by brand ID

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get SKUs for brand without access token
    When I send the GET request to "skunits_get_skus_for_brand" endpoint with path parameters
      |Path|Value|
      |brandId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_02 Get SKUs for brand with invalid access token
    And I send the GET request to "skunits_get_skus_for_brand" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|brandId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_03 Get SKUs for brand with expired access token
    And I send the GET request to "skunits_get_skus_for_brand" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|brandId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_04 Get SKUs for brand with malformed access token
    And I send the GET request to "skunits_get_skus_for_brand" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|brandId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get SKUs for brand with valid access token and brand ID 1
    And I send the GET request to "skunits_get_skus_for_brand" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|brandId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
      |$.skus.1|"Cafe Cuba"|
    And I store the response as "getSkusForBrand_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate SKUs for brand response structure
    And I send the GET request to "skunits_get_skus_for_brand" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|brandId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And verifies the field is present in the response
      |JPath|
      |$.Result|
      |$.Reason|
      |$.skus|
      |$.skus.1|
      |$.skus.2|
      |$.skus.3|
    And I store the response as "getSkusForBrand_response" name using full path

  @Positive @DataValidation
  Scenario: TC_07 Validate SKUs for brand data types
    And I send the GET request to "skunits_get_skus_for_brand" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|brandId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.skus|object|
      |$.skus.1|string|
      |$.skus.2|string|
    And I store the response as "getSkusForBrand_response" name using full path

  @Positive @Functional
  Scenario: TC_08 Get SKUs for brand with different brand ID
    And I send the GET request to "skunits_get_skus_for_brand" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|brandId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
      |$.skus.801|"SKU976"|
    And I store the response as "getSkusForBrand_response" name using full path

  @Positive @DataValidation
  Scenario: TC_09 Validate SKUs for brand response with expected values
    And I send the GET request to "skunits_get_skus_for_brand" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|brandId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
      |$.skus.1|"Cafe Cuba"|
      |$.skus.2|"Maaza"|
      |$.skus.3|"Fanta"|
    And I store the response as "getSkusForBrand_response" name using full path

  @Negative @Validation
  Scenario: TC_10 Get SKUs for brand with invalid brand ID format
    And I send the GET request to "skunits_get_skus_for_brand" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|brandId|invalid|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I store the response as "getSkusForBrand_response" name using full path

  @Negative @Validation
  Scenario: TC_11 Get SKUs for brand with non-existent brand ID
    And I send the GET request to "skunits_get_skus_for_brand" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|brandId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I store the response as "getSkusForBrand_response" name using full path

  @Negative @ErrorHandling
  Scenario: TC_12 Get SKUs for brand with invalid endpoint
    And I send the GET request to "skunits_get_skus_for_brand_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|brandId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

#  @Positive @Performance
#  Scenario: TC_13 Performance test for get SKUs for brand endpoint
#    And I send the GET request to "skunits_get_skus_for_brand" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|brandId|1|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "1500" milliseconds
#    And I store the response as "getSkusForBrand_response" name using full path

  @DBvalidation
  Scenario: TC_14 Get SKUs for brand - verify response data with DB
    And I send the GET request to "skunits_get_skus_for_brand" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|brandId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
      |$.skus.1|"Cafe Cuba"|
      |$.skus.2|"Maaza"|
      |$.skus.3|"Fanta"|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.skus.1|DB:skunits:name: id=1 LIMIT 1|
      |$.skus.2|DB:skunits:name: id=2 LIMIT 1|
      |$.skus.3|DB:skunits:name: id=3 LIMIT 1|
    And verify response time is less than "2000" milliseconds

