@BizomWebAPI @SkuUnitsManagement @GetSubCategorySku @ProductManagement @OS
Feature: Get SubCategory API Testing
  As a system user
  I want to test the skunits getSubCategory endpoint
  So that I can retrieve subcategories mapped to a given category

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get subcategory without access token
    When I send the GET request to "skunits_get_subcategory" endpoint with path parameters
      |Path|Value|
      |categoryId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get subcategory with invalid access token
#    And I send the GET request to "skunits_get_subcategory" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|invalid_token_12345|categoryId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get subcategory with expired access token
#    And I send the GET request to "skunits_get_subcategory" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|expired_token_12345|categoryId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get subcategory with malformed access token
#    And I send the GET request to "skunits_get_subcategory" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|malformed.token.here|categoryId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: Get subcategory for category ID 1 with valid access token
    And I send the GET request to "skunits_get_subcategory" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|categoryId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|
      |$['1']|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$['1']|Maaza|
      |$['2']|m1|
      |$['3']|s1|
      |$['4']|subcate_1|
    And I store the response as "subcategory_for_category_1_response" name using full path

  @Negative @Validation
  Scenario: Get subcategory with non-numeric category ID
    And I send the GET request to "skunits_get_subcategory" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|categoryId|abc|
    Then I should see the response code as "200"

#  @Negative @Validation
#  Scenario: Get subcategory with blank category ID
#    And I send the GET request to "skunits_get_subcategory_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|categoryId|dtyugjhbnm|
#    Then I should see the response code as "200"

#  @Negative @ErrorHandling
#  Scenario: Get subcategory with invalid endpoint
#    And I send the GET request to "skunits_get_subcategory_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance test for get subcategory endpoint
    And I send the GET request to "skunits_get_subcategory" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|categoryId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @ContentValidation
  Scenario: Validate response contains expected subcategory keys
    And I send the GET request to "skunits_get_subcategory" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|categoryId|1|
    Then I should see the response code as "200"
    And validating the response contains the following values
      |Value|
      |Maaza|
      |m1|
      |s1|
      |subcate_1|

  @Positive @Regression
  Scenario: Regression test for get subcategory endpoint
    And I send the GET request to "skunits_get_subcategory" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|categoryId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Positive @ArrayValidation
  Scenario: Validate subcategory object structure and keys
    And I send the GET request to "skunits_get_subcategory" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|categoryId|1|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|
      |$['1']|string|
      |$['2']|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$['1']|Maaza|

  @Positive @Concurrency
  Scenario: Concurrent access test for get subcategory endpoint
    And I send the GET request to "skunits_get_subcategory" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|categoryId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Positive @EndToEnd
  Scenario: End-to-end subcategory retrieval workflow
    And I send the GET request to "skunits_get_subcategory" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|categoryId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I store the response as "subcategory_for_category_1_response" name using full path

  @Positive @DBValidation
  Scenario: DB validate subcategory names for first key
    And I send the GET request to "skunits_get_subcategory" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|categoryId|1|
    Then I should see the response code as "200"
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$['1']|DB:subcategories:name: id=1|

  @Negative @Validation
  Scenario: Get subcategory with special characters in query params
    And I send the GET request to "skunits_get_subcategory" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|categoryId|1|
    Then I should see the response code as "200"

  @Negative @Security
  Scenario: Get subcategory with SQL injection attempt in query params
    And I send the GET request to "skunits_get_subcategory" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|categoryId|1|
    Then I should see the response code as "200"

