@BizomWebAPI @SkuUnitsManagement @GetAreaWiseCategoriesProducts @ProductManagement @OS
Feature: Area-wise Categories - Products API Testing
  As a system user
  I want to test the skunits getareawisecategoriesproducts endpoint
  So that I can ensure proper functionality and category/subcategory/products mapping

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get area-wise categories products without access token
    When I send the GET request to "skunits_get_areawise_categories_products" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get area-wise categories products with invalid access token
    And I send the GET request to "skunits_get_areawise_categories_products" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get area-wise categories products with expired access token
    And I send the GET request to "skunits_get_areawise_categories_products" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get area-wise categories products with malformed access token
    And I send the GET request to "skunits_get_areawise_categories_products" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

#  @Positive @Smoke
#  Scenario: Get area-wise categories products with valid access token
#    And I send the GET request to "skunits_get_areawise_categories_products" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason|""|
#    And I store the response as "areawise_categories_products_legacy_response" name using full path

  @Positive @DataValidation
  Scenario: Validate categories response structure
    And I send the GET request to "skunits_get_areawise_categories_products" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Categories|array|
      |$.Categories[0]|object|
      |$.Categories[0].Category|object|
      |$.Categories[0].Category.id|string|
      |$.Categories[0].Category.name|string|
      |$.Categories[0].Category.special|string|
      |$.Categories[0].Category.products|array|

#  @Positive @NestedValidation
#  Scenario: Validate nested subcategories and products
#    And I send the GET request to "skunits_get_areawise_categories_products" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Categories[?(@.Category.name=='Juice')].Category.Subcategories|array|
#      |$.Categories[?(@.Category.name=='Juice')].Category.products|array|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Categories[?(@.Category.name=='special-category')].Category.name|["special-category"]|

  @Positive @ContentValidation
  Scenario: Validate categories content presence
    And I send the GET request to "skunits_get_areawise_categories_products" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response contains the following values
      |Value|
      |Categories|
      |Category|
      |Subcategories|
      |products|
      |name|

  @Positive @Performance
  Scenario: Performance test for area-wise categories products endpoint
    And I send the GET request to "skunits_get_areawise_categories_products" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: Concurrent access test for area-wise categories products endpoint
    And I send the GET request to "skunits_get_areawise_categories_products" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get area-wise categories products with invalid query parameters
    And I send the GET request to "skunits_get_areawise_categories_products" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get area-wise categories products with special characters in query parameters
    And I send the GET request to "skunits_get_areawise_categories_products" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get area-wise categories products with SQL injection attempt
    And I send the GET request to "skunits_get_areawise_categories_products" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE skunits; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: Get area-wise categories products with maximum query parameters
    And I send the GET request to "skunits_get_areawise_categories_products" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: Get area-wise categories products with invalid endpoint
    And I send the GET request to "skunits_get_areawise_categories_products_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"

#  @Positive @Regression
#  Scenario: Regression test for area-wise categories products endpoint
#    And I send the GET request to "skunits_get_areawise_categories_products" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @Functional
  Scenario: Validate area-wise categories products response completeness
    And I send the GET request to "skunits_get_areawise_categories_products" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @EndToEnd
  Scenario: End-to-end area-wise categories products retrieval workflow
    And I send the GET request to "skunits_get_areawise_categories_products" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "areawise_categories_products_legacy_response" name using full path
