@BizomWebAPI @SkunitsManagement @GetSkuForFilter @ProductManagement @OS
Feature: GetSkuForFilter API Testing
  As a system user
  I want to test the getskuforfilter endpoint
  So that I can ensure proper functionality and data retrieval for SKUs by filter type and filter ID

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get SKU for filter without access token
    When I send the GET request to "skunits_get_sku_for_filter" endpoint with path parameters
      |Path|Value|
      |filterType|categories|
      |filterId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get SKU for filter with invalid access token
    And I send the GET request to "skunits_get_sku_for_filter" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|filterType|categories|
      |||filterId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get SKU for filter with expired access token
    And I send the GET request to "skunits_get_sku_for_filter" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|filterType|categories|
      |||filterId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get SKU for filter with malformed access token
    And I send the GET request to "skunits_get_sku_for_filter" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|filterType|categories|
      |||filterId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_05 Get SKU for filter with empty access token
    And I send the GET request to "skunits_get_sku_for_filter" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token||filterType|categories|
      |||filterId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_06 Get SKU for filter with valid parameters
    And I send the GET request to "skunits_get_sku_for_filter" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|filterType|categories|
      |||filterId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And I store the response as "getskuforfilter_response" name using full path

  @Positive @DataValidation
  Scenario: TC_07 Validate get SKU for filter response structure
    And I send the GET request to "skunits_get_sku_for_filter" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|filterType|categories|
      |||filterId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|object|

  @Positive @DataValidation
  Scenario: TC_08 Validate data object with dynamic keys
    And I send the GET request to "skunits_get_sku_for_filter" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|filterType|categories|
      |||filterId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data["5"]|"Lays - Lays  upc: 96"|
      |$.data["6"]|"6 - Kurkure upc: 48"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data["5"]|string|
      |$.data["6"]|string|

  @Positive @DataValidation
  Scenario: TC_09 Validate get SKU for filter response contains required fields
    And I send the GET request to "skunits_get_sku_for_filter" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|filterType|categories|
      |||filterId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |data|

  @Negative @Validation
  Scenario: TC_10 Get SKU for filter with invalid filterType
    And I send the GET request to "skunits_get_sku_for_filter" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|filterType|invalid_type|
      |||filterId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_11 Get SKU for filter with invalid filterId
    And I send the GET request to "skunits_get_sku_for_filter" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|filterType|categories|
      |||filterId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_12 Get SKU for filter with non-existent filterId
    And I send the GET request to "skunits_get_sku_for_filter" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|filterType|categories|
      |||filterId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_13 Get SKU for filter with blank filterType
    And I send the GET request to "skunits_get_sku_for_filter" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|filterType||
      |||filterId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_14 Get SKU for filter with blank filterId
    And I send the GET request to "skunits_get_sku_for_filter" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|filterType|categories|
      |||filterId||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_15 Get SKU for filter with invalid endpoint
    And I send the GET request to "skunits_get_sku_for_filter_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|filterType|categories|
      |||filterId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Positive @Performance
#  Scenario: TC_16 Performance test for get SKU for filter endpoint
#    And I send the GET request to "skunits_get_sku_for_filter" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|filterType|categories|
#      |||filterId|2|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|

  @Positive @BusinessLogic
  Scenario: TC_17 Get SKU for filter with different filterType
    And I send the GET request to "skunits_get_sku_for_filter" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|filterType|brands|
      |||filterId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Positive @BusinessLogic
  Scenario: TC_18 Get SKU for filter with different filterId
    And I send the GET request to "skunits_get_sku_for_filter" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|filterType|categories|
      |||filterId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @Boundary
  Scenario: TC_19 Get SKU for filter with zero filterId
    And I send the GET request to "skunits_get_sku_for_filter" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|filterType|categories|
      |||filterId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Boundary
  Scenario: TC_20 Get SKU for filter with very large filterId
    And I send the GET request to "skunits_get_sku_for_filter" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|filterType|categories|
      |||filterId|2147483647|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Regression
  Scenario: TC_21 Regression test for get SKU for filter endpoint
    And I send the GET request to "skunits_get_sku_for_filter" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|filterType|categories|
      |||filterId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|object|
      |$.data["5"]|string|
    And I store the response as "getskuforfilter_response" name using full path

  @Positive @DataValidation
  Scenario: TC_22 Validate data object contains SKU information
    And I send the GET request to "skunits_get_sku_for_filter" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|filterType|categories|
      |||filterId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data["857"]|" - Demo Product upc: 10"|
      |$.data["858"]|" - Demo Product X upc: 10"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data["857"]|string|
      |$.data["858"]|string|
      |$.data["859"]|string|
      |$.data["860"]|string|

