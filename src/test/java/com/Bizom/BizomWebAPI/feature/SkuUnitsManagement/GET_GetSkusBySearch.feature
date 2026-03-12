@BizomWebAPI @SkuUnitsManagement @SkuUnitsBySearch @ProductManagement @OS
Feature: Get SKUs By Search API Testing
  As a system user
  I want to test the get SKUs by search endpoint
  So that I can ensure proper functionality and data retrieval for searching SKUs by warehouse and keyword

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01  Get SKUs by search without access token
    When I send the GET request to "skunits_get_skus_by_search" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |warehouseId|1|
      |word|Maaza|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_02 Get SKUs by search with invalid access token
    And I send the GET request to "skunits_get_skus_by_search" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
      |warehouseId|1|
      |word|Maaza|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_03 Get SKUs by search with expired access token
    And I send the GET request to "skunits_get_skus_by_search" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
      |warehouseId|1|
      |word|Maaza|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_04 Get SKUs by search with malformed access token
    And I send the GET request to "skunits_get_skus_by_search" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
      |warehouseId|1|
      |word|Maaza|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get SKUs by search with valid access token and search word Maaza
    And I send the GET request to "skunits_get_skus_by_search" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|1|
      |word|Maaza|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.2|"2,Maaza - Maza"|
    And I store the response as "getSkusBySearch_response" name using full path

  @Positive @Functional
  Scenario: TC_06 Get SKUs by search with different warehouse ID
    And I send the GET request to "skunits_get_skus_by_search" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|2|
      |word|Maaza|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I store the response as "getSkusBySearch_response" name using full path

  @Positive @Functional
  Scenario: TC_07 Get SKUs by search with different search word
    And I send the GET request to "skunits_get_skus_by_search" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|1|
      |word|Maza|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I store the response as "getSkusBySearch_response" name using full path

  @Positive @DataValidation
  Scenario: TC_08 Validate SKUs by search response structure
    And I send the GET request to "skunits_get_skus_by_search" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|1|
      |word|Maaza|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.2|"2,Maaza - Maza"|
    And I store the response as "getSkusBySearch_response" name using full path

  @Negative @Validation
  Scenario: TC_09 Get SKUs by search with missing warehouseId parameter
    And I send the GET request to "skunits_get_skus_by_search" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |word|Maaza|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I store the response as "getSkusBySearch_response" name using full path

  @Negative @Validation
  Scenario: TC_10 Get SKUs by search with missing word parameter
    And I send the GET request to "skunits_get_skus_by_search" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I store the response as "getSkusBySearch_response" name using full path

  @Negative @Validation
  Scenario: TC_11 Get SKUs by search with invalid warehouseId format
    And I send the GET request to "skunits_get_skus_by_search" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|invalid|
      |word|Maaza|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I store the response as "getSkusBySearch_response" name using full path

  @Negative @Validation
  Scenario: TC_12 Get SKUs by search with empty word parameter
    And I send the GET request to "skunits_get_skus_by_search" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|1|
      |word||
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I store the response as "getSkusBySearch_response" name using full path

  @Negative @ErrorHandling
  Scenario: TC_13 Get SKUs by search with invalid endpoint
    And I send the GET request to "skunits_get_skus_by_search_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|1|
      |word|Maaza|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

#  @Positive @Performance
#  Scenario: TC_14 Performance test for get SKUs by search endpoint
#    And I send the GET request to "skunits_get_skus_by_search" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |warehouseId|1|
#      |word|Maaza|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "1500" milliseconds
#    And I store the response as "getSkusBySearch_response" name using full path

  @Positive @DataValidation
  Scenario: TC_15 Validate SKUs by search response with expected values
    And I send the GET request to "skunits_get_skus_by_search" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|1|
      |word|Maaza|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.2|"2,Maaza - Maza"|


