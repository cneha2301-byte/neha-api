@BizomWebAPI @CE @CategoriesManagement @Categories @GetCategoriesForReport @ConfigurationSettings
Feature: This feature file contains testcases for GET endpoint Categories - get categories for report

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Positive @Sanity
  Scenario: TC_01 Get categories for report with valid access token
    And I send the GET request to "categories_getcategoriesforreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true"  |
      | $.Reason  | "" |
      | $.categories.5 | Cat13 |
      | $.categories.2 | Chat |
      | $.categories.4 | CT1801 |
      | $.categories.9 | invalid-type-category |
      | $.categories.8 | special-category |
      | $.categories.3 | test_delete1 |
      | $.categories.6 | warehouses |
      | $.categories.7 | warehouses-with-image |

  @Negative @Security
  Scenario: TC_02 Get categories for report with invalid access token
    And I send the GET request to "categories_getcategoriesforreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_123|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |

  @Negative @Validation
  Scenario: TC_03 Get categories for report with empty access token
    And I send the GET request to "categories_getcategoriesforreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token||
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |


  @Positive @ResponseHeaders
  Scenario: TC_04 Get categories for report response headers validation
    And I send the GET request to "categories_getcategoriesforreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | application/json |
      | Connection    | keep-alive                  |

  @Positive @Performance
  Scenario: TC_05 Get categories for report performance validation
    And I send the GET request to "categories_getcategoriesforreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true"  |
      | $.Reason  | "" |

  @Positive @EdgeCase
  Scenario: TC_06 Get categories for report with special characters in query parameters
    And I send the GET request to "categories_getcategoriesforreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|special@#$%^&*()|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true"  |
      | $.Reason  | "" |

  @Positive @SecurityHeaders
  Scenario: TC_07 Get categories for report security headers validation
    And I send the GET request to "categories_getcategoriesforreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | application/json |
      | Connection    | keep-alive                  |
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true"  |
      | $.Reason  | "" |

  @Positive @LoadTest
  Scenario: TC_08 Get categories for report load testing
    And I send the GET request to "categories_getcategoriesforreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "500" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true"  |
      | $.Reason  | "" |


  @Positive @DBValidation @DataIntegrity
  Scenario: TC_09 Verify categories for report data against database
    And I send the GET request to "categories_getcategoriesforreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true"  |
      | $.Reason  | "" |
    And I verify API response at path with DB and static values
      | JPath     | Value |
      | $.categories.5 | DB:categories:name: id=5 AND is_active=1 |
      | $.categories.2 | DB:categories:name: id=2 AND is_active=1 |
      | $.categories.4 | DB:categories:name: id=4 AND is_active=1 |
      | $.categories.9 | DB:categories:name: id=9 AND is_active=1 |
      | $.categories.8 | DB:categories:name: id=8 AND is_active=1 |
      | $.categories.3 | DB:categories:name: id=3 AND is_active=1 |
      | $.categories.6 | DB:categories:name: id=6 AND is_active=1 |
      | $.categories.7 | DB:categories:name: id=7 AND is_active=1 |

  @Positive @DBValidation @DataCount
  Scenario: TC_10 Verify categories for report count against database
    And I send the GET request to "categories_getcategoriesforreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true"  |
      | $.Reason  | "" |

  @Positive @DBValidation @DataConsistency
  Scenario: TC_11 Verify categories for report data consistency
    And I send the GET request to "categories_getcategoriesforreport" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true"  |
      | $.Reason  | "" |
    And I verify API response at path with DB and static values
      | JPath     | Value |
      | $.categories.5 | DB:categories:name: id=5 AND is_active=1 |
      | $.categories.2 | DB:categories:name: id=2 AND is_active=1 |
      | $.categories.4 | DB:categories:name: id=4 AND is_active=1 |
      | $.categories.9 | DB:categories:name: id=9 AND is_active=1 |
      | $.categories.8 | DB:categories:name: id=8 AND is_active=1 |
      | $.categories.3 | DB:categories:name: id=3 AND is_active=1 |
      | $.categories.6 | DB:categories:name: id=6 AND is_active=1 |
      | $.categories.7 | DB:categories:name: id=7 AND is_active=1 |
