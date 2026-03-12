@BizomWebAPI @SkuUnitsManagement @GetSkusBySubcategories @ProductManagement @OS
Feature: Get SKUs By Subcategories API Testing
  As a system user
  I want to test the skunits getSkusBySubcategories endpoint
  So that I can retrieve skunits mapped to a specific subcategory

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get skus by subcategory without access token
    When I send the GET request to "skunits_get_skus_by_subcategories" endpoint with path parameters
      |Path|Value|
      |subcategoryId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get skus by subcategory with invalid access token
#    And I send the GET request to "skunits_get_skus_by_subcategories" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|invalid_token_12345|subcategoryId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get skus by subcategory with expired access token
#    And I send the GET request to "skunits_get_skus_by_subcategories" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|expired_token_12345|subcategoryId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get skus by subcategory with malformed access token
#    And I send the GET request to "skunits_get_skus_by_subcategories" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|malformed.token.here|subcategoryId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

#  @Positive @Smoke
#  Scenario: Get skus by subcategory ID 1 with valid access token
#    And I send the GET request to "skunits_get_skus_by_subcategories" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|subcategoryId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data.skunits|array|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.data|object|
#      |$.data.skunits|array|
#      |$.data.skunits[0].id|string|
#      |$.data.skunits[0].name|string|
#      |$.data.skunits[0].skucode|string|
#    And I store the response as "skus_by_subcategory_1_response" name using full path

#  @Positive @StaticValues
#  Scenario: Validate sample skunits for subcategory ID 1
#    And I send the GET request to "skunits_get_skus_by_subcategories" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|subcategoryId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.data.skunits[?(@.name=='Fanta')].length()|1|
#      |$.data.skunits[?(@.name=='Cafe Cuba')].length()|1|
#      |$.data.skunits[?(@.skucode=='Cuba')].length()|1|

  @Negative @Validation
  Scenario: Get skus by subcategory with invalid or blank subcategory ID
    And I send the GET request to "skunits_get_skus_by_subcategories_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No suks mapped to subcategories|
      |$.data|[]|

#  @Negative @ErrorHandling
#  Scenario: Get skus by subcategory with invalid endpoint
#    And I send the GET request to "skunits_get_skus_by_subcategories_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance test for get skus by subcategory endpoint
    And I send the GET request to "skunits_get_skus_by_subcategories" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|subcategoryId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @DBValidation
  Scenario: DB validate one skunit mapped to subcategory 1
    And I send the GET request to "skunits_get_skus_by_subcategories" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|subcategoryId|1|
    Then I should see the response code as "200"
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.data.skunits[0].name|DB:skunits:name: id=3|
      |$.data.skunits[0].skucode|DB:skunits:skucode: id=3|

  @Positive @ArrayValidation
  Scenario: Validate skunits array structure and minimum content
    And I send the GET request to "skunits_get_skus_by_subcategories" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|subcategoryId|1|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data.skunits[0].id|string|
      |$.data.skunits[0].name|string|
      |$.data.skunits[0].skucode|string|

  @Positive @ContentValidation
  Scenario: Validate response contains expected keys for subcategory listing
    And I send the GET request to "skunits_get_skus_by_subcategories" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|subcategoryId|1|
    Then I should see the response code as "200"
    And validating the response contains the following values
      |Value|
      |data|
      |skunits|
      |id|
      |name|
      |skucode|

  @Negative @Validation
  Scenario: Get skus by subcategory with non-numeric subcategory ID
    And I send the GET request to "skunits_get_skus_by_subcategories" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|subcategoryId|abc|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No suks mapped to subcategories|

  @Negative @Security
  Scenario: Get skus by subcategory with SQL injection attempt in query param
    And I send the GET request to "skunits_get_skus_by_subcategories" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|subcategoryId|1|
    Then I should see the response code as "200"

  @Negative @Validation
  Scenario: Get skus by subcategory with special characters in query param
    And I send the GET request to "skunits_get_skus_by_subcategories" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|subcategoryId|1|
    Then I should see the response code as "200"

  @Positive @Concurrency
  Scenario: Concurrent access test for get skus by subcategory endpoint
    And I send the GET request to "skunits_get_skus_by_subcategories" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|subcategoryId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Positive @Regression
  Scenario: Regression test for get skus by subcategory endpoint
    And I send the GET request to "skunits_get_skus_by_subcategories" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|subcategoryId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Positive @EndToEnd
  Scenario: End-to-end skus by subcategory retrieval workflow
    And I send the GET request to "skunits_get_skus_by_subcategories" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|subcategoryId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I store the response as "skus_by_subcategory_1_response" name using full path
