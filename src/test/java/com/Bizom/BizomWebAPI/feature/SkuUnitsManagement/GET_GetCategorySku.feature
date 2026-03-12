@BizomWebAPI @SkuUnitsManagement @GetCategorySku @ProductManagement @OS
Feature: Get Category SKU API Testing
  As a system user
  I want to test the get category SKU endpoint
  So that I can ensure proper functionality and data retrieval for category-based SKU management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

#  @Negative @Security
#  Scenario: Get category SKU without access token
#    When I send the GET request to "GET_GetCategorySku" endpoint with query parameters
#      |QueryParamName|QueryParamValue|
#      |categoryList[]|DB:categories:id: id=1 LIMIT 1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.message|"Unauthenticated."|
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get category SKU with invalid access token
#    And I send the GET request to "GET_GetCategorySku" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|invalid_token_12345|
#      |categoryList[]|DB:categories:id: id=1 LIMIT 1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.message|"Unauthenticated."|
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get category SKU with expired access token
#    And I send the GET request to "GET_GetCategorySku" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|expired_token_12345|
#      |categoryList[]|DB:categories:id: id=1 LIMIT 1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.message|"Unauthenticated."|
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get category SKU with malformed access token
#    And I send the GET request to "GET_GetCategorySku" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|malformed.token.here|
#      |categoryList[]|DB:categories:id: id=1 LIMIT 1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.message|"Unauthenticated."|
#    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get category SKU with valid access token and category ID
    And I send the GET request to "GET_GetCategorySku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |categoryList[]|DB:categories:id: id=1 LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.skunit|array|
    And I store the response as "category_sku_response" name using full path

  @Positive @DataValidation
  Scenario: Validate category SKU response structure
    And I send the GET request to "GET_GetCategorySku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |categoryList[]|DB:categories:id: id=1 LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.skunit|array|
      |$.skunit[0]|object|
      |$.skunit[0].Skunit|object|

  @Positive @DataValidation
  Scenario: Validate category SKU array structure and content
    And I send the GET request to "GET_GetCategorySku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |categoryList[]|DB:categories:id: id=1 LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.skunit|array|
      |$.skunit[0]|object|
      |$.skunit[0].Skunit|object|
      |$.skunit[0].Skunit.id|string|
      |$.skunit[0].Skunit.name|string|
      |$.skunit[0].Skunit.mrp|string|
      |$.skunit[0].Skunit.price|string|
      |$.skunit[0].Skunit.active|string|

  @Positive @DataValidation
  Scenario: Validate category SKU specific data values
    And I send the GET request to "GET_GetCategorySku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |categoryList[]|DB:categories:id: id=1 LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.skunit[0].Skunit.id|string|
      |$.skunit[0].Skunit.name|string|
      |$.skunit[0].Skunit.skucode|string|
      |$.skunit[0].Skunit.mrp|string|
      |$.skunit[0].Skunit.price|string|
      |$.skunit[0].Skunit.gst|string|
      |$.skunit[0].Skunit.active|string|

  @Positive @QueryParameter
  Scenario: Get category SKU with different category ID
    And I send the GET request to "GET_GetCategorySku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |categoryList[]|DB:categories:id: id=2 LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.skunit|array|

  @Positive @QueryParameter
  Scenario: Get category SKU with static category ID
    And I send the GET request to "GET_GetCategorySku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |categoryList[]|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.skunit|array|

  @Positive @Performance
  Scenario: Performance test for category SKU endpoint
    And I send the GET request to "GET_GetCategorySku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |categoryList[]|DB:categories:id: id=1 LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @Concurrency
  Scenario: Concurrent access test for category SKU endpoint
    And I send the GET request to "GET_GetCategorySku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |categoryList[]|DB:categories:id: id=1 LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: Get category SKU with invalid category ID
    And I send the GET request to "GET_GetCategorySku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |categoryList[]|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: Get category SKU with non-existent category ID
    And I send the GET request to "GET_GetCategorySku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |categoryList[]|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: Get category SKU with negative category ID
    And I send the GET request to "GET_GetCategorySku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |categoryList[]|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: Get category SKU with string category ID
    And I send the GET request to "GET_GetCategorySku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |categoryList[]|invalid_category_id|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get category SKU with SQL injection in category ID
    And I send the GET request to "GET_GetCategorySku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |categoryList[]|1'; DROP TABLE categories; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: Get category SKU with invalid endpoint
    And I send the GET request to "GET_GetCategorySku_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |categoryList[]|DB:categories:id: id=1 LIMIT 1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate category SKU business logic
    And I send the GET request to "GET_GetCategorySku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |categoryList[]|DB:categories:id: id=1 LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.skunit|array|

  @Positive @DataIntegrity
  Scenario: Validate category SKU data integrity
    And I send the GET request to "GET_GetCategorySku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |categoryList[]|DB:categories:id: id=1 LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.skunit|array|
      |$.skunit[0]|object|
      |$.skunit[0].Skunit|object|
      |$.skunit[0].Skunit.id|string|
      |$.skunit[0].Skunit.name|string|
      |$.skunit[0].Skunit.active|string|

  @Positive @Regression
  Scenario: Regression test for category SKU endpoint
    And I send the GET request to "GET_GetCategorySku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |categoryList[]|DB:categories:id: id=1 LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.skunit|array|

  @Positive @Functional
  Scenario: Validate category SKU response completeness
    And I send the GET request to "GET_GetCategorySku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |categoryList[]|DB:categories:id: id=1 LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.skunit|array|
      |$.skunit[0]|object|
      |$.skunit[0].Skunit|object|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |skunit|
      |Skunit|
      |id|
      |name|
      |mrp|
      |price|

  @Positive @ArrayValidation
  Scenario: Validate category SKU array structure and content
    And I send the GET request to "GET_GetCategorySku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |categoryList[]|DB:categories:id: id=1 LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.skunit|array|
      |$.skunit[0]|object|
      |$.skunit[0].Skunit|object|
      |$.skunit[0].Skunit.id|string|
      |$.skunit[0].Skunit.name|string|
      |$.skunit[0].Skunit.skucode|string|
      |$.skunit[0].Skunit.mrp|string|
      |$.skunit[0].Skunit.price|string|
    And validating the response contains the following values
      |Value|
      |skunit|
      |Skunit|
      |id|
      |name|
      |mrp|
      |price|

  @Positive @ContentValidation
  Scenario: Validate category SKU content structure
    And I send the GET request to "GET_GetCategorySku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |categoryList[]|DB:categories:id: id=1 LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |skunit|
      |Skunit|
      |id|
      |name|
      |skucode|
      |mrp|
      |price|
      |gst|
      |active|

  @Positive @LoadTesting
  Scenario: Load testing for category SKU endpoint
    And I send the GET request to "GET_GetCategorySku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |categoryList[]|DB:categories:id: id=1 LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Timeout
  Scenario: Test category SKU endpoint timeout handling
    And I send the GET request to "GET_GetCategorySku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |categoryList[]|DB:categories:id: id=1 LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @EndToEnd
  Scenario: End-to-end category SKU data retrieval workflow
    And I send the GET request to "GET_GetCategorySku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |categoryList[]|DB:categories:id: id=1 LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And I store the response as "category_sku_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.skunit|array|
      |$.skunit[0]|object|
      |$.skunit[0].Skunit|object|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |skunit|
      |Skunit|
      |id|
      |name|
      |mrp|
      |price|
      |gst|
      |active|

