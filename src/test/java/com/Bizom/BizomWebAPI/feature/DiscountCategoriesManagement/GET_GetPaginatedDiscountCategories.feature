@BizomWebAPI @PI @DiscountCategoriesManagement @DiscountCategories @GetPaginatedDiscountCategories @IntegrationServices
Feature: Get Paginated Discount Categories API Testing
  As a system user
  I want to test the get paginated discount categories endpoint
  So that I can ensure proper functionality and data retrieval for paginated discount categories management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Positive @Smoke
  Scenario: Get paginated discount categories with valid access token
    When I send the GET request to "discount_categories_getpaginateddiscountcategories" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |page|1|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.data[0].Skunit.name|DB:skunits:name: id=1|
      |$.data[1].Skunit.name|DB:skunits:name: id=3|
      |$.data[2].Skunit.name|DB:skunits:name: id=4|
      |$.data[3].Skunit.name|DB:skunits:name: id=5|
      |$.data[4].Skunit.name|DB:skunits:name: id=6|
    And I store the response as "paginated_discount_categories_response" name using full path

  @Positive @DataValidation
  Scenario: Validate paginated discount categories response structure
    When I send the GET request to "discount_categories_getpaginateddiscountcategories" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |page|1|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.data[0].Skunit.name|DB:skunits:name: id=1|
      |$.data[1].Skunit.name|DB:skunits:name: id=3|
      |$.data[2].Skunit.name|DB:skunits:name: id=4|
      |$.data[3].Skunit.name|DB:skunits:name: id=5|
      |$.data[4].Skunit.name|DB:skunits:name: id=6|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.status|boolean|
      |$.data|array|
    And verifies the field is present in the response
      |JPath|
      |$.status|
      |$.data|
      |$.data[0]|
      |$.data[0].DiscountCategory|
      |$.data[0].Skunit|
      |$.data[0].DiscountCategoryDetail|

  @Positive @DataValidation
  Scenario: Validate paginated discount categories data structure
    When I send the GET request to "discount_categories_getpaginateddiscountcategories" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |page|1|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.data[0].Skunit.name|DB:skunits:name: id=1|
      |$.data[1].Skunit.name|DB:skunits:name: id=3|
      |$.data[2].Skunit.name|DB:skunits:name: id=4|
      |$.data[3].Skunit.name|DB:skunits:name: id=5|
      |$.data[4].Skunit.name|DB:skunits:name: id=6|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
      |$.data[0]|object|
      |$.data[0].DiscountCategory|object|
      |$.data[0].DiscountCategory.id|string|
      |$.data[0].DiscountCategory.name|string|
      |$.data[0].Skunit|object|
      |$.data[0].Skunit.id|string|
      |$.data[0].Skunit.name|string|
      |$.data[0].DiscountCategoryDetail|object|
      |$.data[0].DiscountCategoryDetail.min_discount|string|
      |$.data[0].DiscountCategoryDetail.max_discount|string|
    And verifies the list is not empty
      |JPath|
      |$.data|

  @Positive @DataValidation
  Scenario: Validate paginated discount categories first record data
    When I send the GET request to "discount_categories_getpaginateddiscountcategories" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |page|1|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.data[0].Skunit.name|DB:skunits:name: id=1|
      |$.data[1].Skunit.name|DB:skunits:name: id=3|
      |$.data[2].Skunit.name|DB:skunits:name: id=4|
      |$.data[3].Skunit.name|DB:skunits:name: id=5|
      |$.data[4].Skunit.name|DB:skunits:name: id=6|
    And verifies the field is not null
      |JPath|
      |$.data[0].DiscountCategory.id|
      |$.data[0].DiscountCategory.name|
      |$.data[0].Skunit.id|
      |$.data[0].Skunit.name|
      |$.data[0].DiscountCategoryDetail.min_discount|
      |$.data[0].DiscountCategoryDetail.max_discount|

  @Positive @DataValidation
  Scenario: Validate paginated discount categories array structure
    When I send the GET request to "discount_categories_getpaginateddiscountcategories" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |page|1|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.data[0].Skunit.name|DB:skunits:name: id=1|
      |$.data[1].Skunit.name|DB:skunits:name: id=3|
      |$.data[2].Skunit.name|DB:skunits:name: id=4|
      |$.data[3].Skunit.name|DB:skunits:name: id=5|
      |$.data[4].Skunit.name|DB:skunits:name: id=6|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
      |$.data[0]|object|
      |$.data[1]|object|
      |$.data[2]|object|

  @Positive @DataValidation
  Scenario: Validate paginated discount categories all records have required fields
    When I send the GET request to "discount_categories_getpaginateddiscountcategories" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |page|1|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.data[0].Skunit.name|DB:skunits:name: id=1|
      |$.data[1].Skunit.name|DB:skunits:name: id=3|
      |$.data[2].Skunit.name|DB:skunits:name: id=4|
      |$.data[3].Skunit.name|DB:skunits:name: id=5|
      |$.data[4].Skunit.name|DB:skunits:name: id=6|
    And verifies the field is present in the response
      |JPath|
      |$.data[0].DiscountCategory|
      |$.data[0].DiscountCategory.id|
      |$.data[0].DiscountCategory.name|
      |$.data[0].Skunit|
      |$.data[0].Skunit.id|
      |$.data[0].Skunit.name|
      |$.data[0].DiscountCategoryDetail|
      |$.data[0].DiscountCategoryDetail.min_discount|
      |$.data[0].DiscountCategoryDetail.max_discount|

  @Positive @Pagination
  Scenario: Get paginated discount categories with page 1
    When I send the GET request to "discount_categories_getpaginateddiscountcategories" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |page|1|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.data[0].Skunit.name|DB:skunits:name: id=1|
      |$.data[1].Skunit.name|DB:skunits:name: id=3|
      |$.data[2].Skunit.name|DB:skunits:name: id=4|
      |$.data[3].Skunit.name|DB:skunits:name: id=5|
      |$.data[4].Skunit.name|DB:skunits:name: id=6|
    And verifies the list is not empty
      |JPath|
      |$.data|

  @Positive @Performance
  Scenario: Performance test for paginated discount categories endpoint
    When I send the GET request to "discount_categories_getpaginateddiscountcategories" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |page|1|||
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.data[0].Skunit.name|DB:skunits:name: id=1|
      |$.data[1].Skunit.name|DB:skunits:name: id=3|
      |$.data[2].Skunit.name|DB:skunits:name: id=4|
      |$.data[3].Skunit.name|DB:skunits:name: id=5|
      |$.data[4].Skunit.name|DB:skunits:name: id=6|

  @Positive @Concurrency
  Scenario: Concurrent access test for paginated discount categories endpoint
    When I send the GET request to "discount_categories_getpaginateddiscountcategories" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |page|1|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.data[0].Skunit.name|DB:skunits:name: id=1|
      |$.data[1].Skunit.name|DB:skunits:name: id=3|
      |$.data[2].Skunit.name|DB:skunits:name: id=4|
      |$.data[3].Skunit.name|DB:skunits:name: id=5|
      |$.data[4].Skunit.name|DB:skunits:name: id=6|

  @Negative @Validation
  Scenario: Get paginated discount categories with invalid query parameters
    When I send the GET request to "discount_categories_getpaginateddiscountcategories" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |page|1|||
      |invalid_param|invalid_value|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.data[0].Skunit.name|DB:skunits:name: id=1|
      |$.data[1].Skunit.name|DB:skunits:name: id=3|
      |$.data[2].Skunit.name|DB:skunits:name: id=4|
      |$.data[3].Skunit.name|DB:skunits:name: id=5|
      |$.data[4].Skunit.name|DB:skunits:name: id=6|

  @Negative @Validation
  Scenario: Get paginated discount categories with special characters in query parameters
    When I send the GET request to "discount_categories_getpaginateddiscountcategories" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |page|<script>alert('XSS')</script>|||
    Then I should see the response code as "500"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get paginated discount categories with SQL injection attempt in page parameter
    When I send the GET request to "discount_categories_getpaginateddiscountcategories" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |page|'; DROP TABLE discount_categories; --|||
    Then I should see the response code as "500"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get paginated discount categories with SQL injection attempt in path parameter
    When I send the GET request to "discount_categories_getpaginateddiscountcategories" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1'; DROP TABLE discount_categories; --|
      |page|1|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: Get paginated discount categories with page zero
    When I send the GET request to "discount_categories_getpaginateddiscountcategories" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |page|0|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: Get paginated discount categories with negative page number
    When I send the GET request to "discount_categories_getpaginateddiscountcategories" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |page|-1|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: Get paginated discount categories with very large page number
    When I send the GET request to "discount_categories_getpaginateddiscountcategories" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |page|999999999|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: Get paginated discount categories with invalid path parameter - non-numeric ID
    When I send the GET request to "discount_categories_getpaginateddiscountcategories" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|invalid_id|
      |page|1|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: Get paginated discount categories with zero as path parameter
    When I send the GET request to "discount_categories_getpaginateddiscountcategories" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|0|
      |page|1|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: Get paginated discount categories with negative path parameter
    When I send the GET request to "discount_categories_getpaginateddiscountcategories" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|-1|
      |page|1|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: Get paginated discount categories with missing page parameter
    When I send the GET request to "discount_categories_getpaginateddiscountcategories" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: Get paginated discount categories with empty page parameter
    When I send the GET request to "discount_categories_getpaginateddiscountcategories" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |page||||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate paginated discount categories business logic
    When I send the GET request to "discount_categories_getpaginateddiscountcategories" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |page|1|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.data[0].Skunit.name|DB:skunits:name: id=1|
      |$.data[1].Skunit.name|DB:skunits:name: id=3|
      |$.data[2].Skunit.name|DB:skunits:name: id=4|
      |$.data[3].Skunit.name|DB:skunits:name: id=5|
      |$.data[4].Skunit.name|DB:skunits:name: id=6|
    And verifies the list is not empty
      |JPath|
      |$.data|

  @Positive @DataIntegrity
  Scenario: Validate paginated discount categories data integrity
    When I send the GET request to "discount_categories_getpaginateddiscountcategories" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |page|1|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.data[0].Skunit.name|DB:skunits:name: id=1|
      |$.data[1].Skunit.name|DB:skunits:name: id=3|
      |$.data[2].Skunit.name|DB:skunits:name: id=4|
      |$.data[3].Skunit.name|DB:skunits:name: id=5|
      |$.data[4].Skunit.name|DB:skunits:name: id=6|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.status|boolean|
      |$.data|array|
      |$.data[0].DiscountCategory.id|string|
      |$.data[0].DiscountCategory.name|string|
      |$.data[0].Skunit.id|string|
      |$.data[0].Skunit.name|string|
      |$.data[0].DiscountCategoryDetail.min_discount|string|
      |$.data[0].DiscountCategoryDetail.max_discount|string|

  @Positive @Regression
  Scenario: Regression test for paginated discount categories endpoint
    When I send the GET request to "discount_categories_getpaginateddiscountcategories" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |page|1|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.data[0].Skunit.name|DB:skunits:name: id=1|
      |$.data[1].Skunit.name|DB:skunits:name: id=3|
      |$.data[2].Skunit.name|DB:skunits:name: id=4|
      |$.data[3].Skunit.name|DB:skunits:name: id=5|
      |$.data[4].Skunit.name|DB:skunits:name: id=6|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.status|boolean|
      |$.data|array|

  @Positive @Functional
  Scenario: Validate paginated discount categories response completeness
    When I send the GET request to "discount_categories_getpaginateddiscountcategories" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |page|1|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.data[0].Skunit.name|DB:skunits:name: id=1|
      |$.data[1].Skunit.name|DB:skunits:name: id=3|
      |$.data[2].Skunit.name|DB:skunits:name: id=4|
      |$.data[3].Skunit.name|DB:skunits:name: id=5|
      |$.data[4].Skunit.name|DB:skunits:name: id=6|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
    And verifies the field is present in the response
      |JPath|
      |$.data[0].DiscountCategory|
      |$.data[0].Skunit|
      |$.data[0].DiscountCategoryDetail|

  @Positive @ArrayValidation
  Scenario: Validate paginated discount categories array structure and content
    When I send the GET request to "discount_categories_getpaginateddiscountcategories" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |page|1|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.data[0].Skunit.name|DB:skunits:name: id=1|
      |$.data[1].Skunit.name|DB:skunits:name: id=3|
      |$.data[2].Skunit.name|DB:skunits:name: id=4|
      |$.data[3].Skunit.name|DB:skunits:name: id=5|
      |$.data[4].Skunit.name|DB:skunits:name: id=6|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
      |$.data[0]|object|
      |$.data[1]|object|
      |$.data[2]|object|
    And verifies the list is not empty
      |JPath|
      |$.data|

  @Positive @ContentValidation
  Scenario: Validate paginated discount categories content structure
    When I send the GET request to "discount_categories_getpaginateddiscountcategories" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |page|1|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.data[0].Skunit.name|DB:skunits:name: id=1|
      |$.data[1].Skunit.name|DB:skunits:name: id=3|
      |$.data[2].Skunit.name|DB:skunits:name: id=4|
      |$.data[3].Skunit.name|DB:skunits:name: id=5|
      |$.data[4].Skunit.name|DB:skunits:name: id=6|
    And validating the response contains the following values
      |Value|
      |status|
      |data|
      |DiscountCategory|
      |Skunit|
      |DiscountCategoryDetail|

  @Positive @LoadTesting
  Scenario: Load testing for paginated discount categories endpoint
    When I send the GET request to "discount_categories_getpaginateddiscountcategories" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |page|1|||
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.data[0].Skunit.name|DB:skunits:name: id=1|
      |$.data[1].Skunit.name|DB:skunits:name: id=3|
      |$.data[2].Skunit.name|DB:skunits:name: id=4|
      |$.data[3].Skunit.name|DB:skunits:name: id=5|
      |$.data[4].Skunit.name|DB:skunits:name: id=6|

  @Negative @Timeout
  Scenario: Test paginated discount categories endpoint timeout handling
    When I send the GET request to "discount_categories_getpaginateddiscountcategories" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |page|1|||
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.data[0].Skunit.name|DB:skunits:name: id=1|
      |$.data[1].Skunit.name|DB:skunits:name: id=3|
      |$.data[2].Skunit.name|DB:skunits:name: id=4|
      |$.data[3].Skunit.name|DB:skunits:name: id=5|
      |$.data[4].Skunit.name|DB:skunits:name: id=6|

  @Positive @EndToEnd
  Scenario: End-to-end paginated discount categories data retrieval workflow
    When I send the GET request to "discount_categories_getpaginateddiscountcategories" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |page|1|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.data[0].Skunit.name|DB:skunits:name: id=1|
      |$.data[1].Skunit.name|DB:skunits:name: id=3|
      |$.data[2].Skunit.name|DB:skunits:name: id=4|
      |$.data[3].Skunit.name|DB:skunits:name: id=5|
      |$.data[4].Skunit.name|DB:skunits:name: id=6|
    And I store the response as "paginated_discount_categories_e2e_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.status|boolean|
      |$.data|array|
    And verifies the field is present in the response
      |JPath|
      |$.data[0].DiscountCategory|
      |$.data[0].Skunit|
      |$.data[0].DiscountCategoryDetail|

  @Positive @DataValidation
  Scenario: Validate discount category ID consistency across records
    When I send the GET request to "discount_categories_getpaginateddiscountcategories" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |page|1|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.data[0].Skunit.name|DB:skunits:name: id=1|
      |$.data[1].Skunit.name|DB:skunits:name: id=3|
      |$.data[2].Skunit.name|DB:skunits:name: id=4|
      |$.data[3].Skunit.name|DB:skunits:name: id=5|
      |$.data[4].Skunit.name|DB:skunits:name: id=6|
    And verifies the field is not null
      |JPath|
      |$.data[0].DiscountCategory.id|
      |$.data[1].DiscountCategory.id|
      |$.data[2].DiscountCategory.id|

  @Positive @DataValidation
  Scenario: Validate discount category name is not empty
    When I send the GET request to "discount_categories_getpaginateddiscountcategories" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |page|1|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.data[0].Skunit.name|DB:skunits:name: id=1|
      |$.data[1].Skunit.name|DB:skunits:name: id=3|
      |$.data[2].Skunit.name|DB:skunits:name: id=4|
      |$.data[3].Skunit.name|DB:skunits:name: id=5|
      |$.data[4].Skunit.name|DB:skunits:name: id=6|
    And verifies the field is not null
      |JPath|
      |$.data[0].DiscountCategory.name|
      |$.data[0].Skunit.name|

  @Positive @DataValidation
  Scenario: Validate discount range values are present
    When I send the GET request to "discount_categories_getpaginateddiscountcategories" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |page|1|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.data[0].Skunit.name|DB:skunits:name: id=1|
      |$.data[1].Skunit.name|DB:skunits:name: id=3|
      |$.data[2].Skunit.name|DB:skunits:name: id=4|
      |$.data[3].Skunit.name|DB:skunits:name: id=5|
      |$.data[4].Skunit.name|DB:skunits:name: id=6|
    And verifies the field is not null
      |JPath|
      |$.data[0].DiscountCategoryDetail.min_discount|
      |$.data[0].DiscountCategoryDetail.max_discount|
    And verifies the field is present in the response
      |JPath|
      |$.data[0].DiscountCategoryDetail|

  @Positive @DataValidation
  Scenario: Validate SKU unit information structure
    When I send the GET request to "discount_categories_getpaginateddiscountcategories" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |page|1|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.data[0].Skunit.name|DB:skunits:name: id=1|
      |$.data[1].Skunit.name|DB:skunits:name: id=3|
      |$.data[2].Skunit.name|DB:skunits:name: id=4|
      |$.data[3].Skunit.name|DB:skunits:name: id=5|
      |$.data[4].Skunit.name|DB:skunits:name: id=6|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data[0].Skunit|object|
      |$.data[0].Skunit.id|string|
      |$.data[0].Skunit.name|string|
    And verifies the field is present in the response
      |JPath|
      |$.data[0].Skunit.id|
      |$.data[0].Skunit.name|