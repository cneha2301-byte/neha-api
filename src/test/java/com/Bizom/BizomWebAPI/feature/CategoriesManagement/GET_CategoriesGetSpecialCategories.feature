@BizomWebAPI @CE @CategoriesManagement @Categories @GetSpecialCategories @ConfigurationSettings
Feature: This feature file contains testcases for GET endpoint Categories - get special categories

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Positive @Sanity
  Scenario: TC_01 Get special categories with valid access token
    And I send the GET request to "categories_getspecialcategories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true"  |
      | $.Reason  | "" |
      | $.data[0].id | "3" |
      | $.data[0].name | test_delete1 |
      | $.data[1].id | "7" |
      | $.data[1].name | warehouses-with-image |
      | $.data[2].id | "8" |
      | $.data[2].name | special-category |

  @Negative @Security
  Scenario: TC_02 Get special categories with invalid access token
    And I send the GET request to "categories_getspecialcategories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_123|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |

  @Negative @Validation
  Scenario: TC_03 Get special categories with empty access token
    And I send the GET request to "categories_getspecialcategories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token||
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |

  @Negative @Validation
  Scenario: TC_04 Get special categories with malformed access token
    And I send the GET request to "categories_getspecialcategories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed_token_@#$%|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |

  @Negative @Validation
  Scenario: TC_05 Get special categories with expired access token
    And I send the GET request to "categories_getspecialcategories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |

  @Positive @ResponseHeaders
  Scenario: TC_06 Get special categories response headers validation
    And I send the GET request to "categories_getspecialcategories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | application/json |
      | Connection    | keep-alive                  |

  @Positive @Performance
  Scenario: TC_07 Get special categories performance validation
    And I send the GET request to "categories_getspecialcategories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true"  |
      | $.Reason  | "" |

  @Positive @ContentValidation
  Scenario: TC_08 Get special categories content validation
    And I send the GET request to "categories_getspecialcategories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true"  |
      | $.Reason  | "" |

  @Positive @DataValidation
  Scenario: TC_09 Get special categories data structure validation
    And I send the GET request to "categories_getspecialcategories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true"  |
      | $.Reason  | "" |

  @Positive @EdgeCase
  Scenario: TC_10 Get special categories with special characters in query parameters
    And I send the GET request to "categories_getspecialcategories" endpoint with dynamic access token and query parameters
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
  Scenario: TC_11 Get special categories security headers validation
    And I send the GET request to "categories_getspecialcategories" endpoint with dynamic access token and query parameters
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
  Scenario: TC_12 Get special categories load testing
    And I send the GET request to "categories_getspecialcategories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "500" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true"  |
      | $.Reason  | "" |

  @Positive @Concurrent
  Scenario: TC_13 Get special categories concurrent request validation
    And I send the GET request to "categories_getspecialcategories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true"  |
      | $.Reason  | "" |

  @Positive @DBValidation @DataIntegrity
  Scenario: TC_16 Verify special categories data against database
    And I send the GET request to "categories_getspecialcategories" endpoint with dynamic access token and query parameters
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
      | $.data[0].name | DB:categories:name: id=3 |
      | $.data[1].name | DB:categories:name: id=7 |
      | $.data[2].name | DB:categories:name: id=8 |

  @Positive @DBValidation @DataCount
  Scenario: TC_17 Verify special categories count against database
    And I send the GET request to "categories_getspecialcategories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true"  |
      | $.Reason  | "" |

  @Positive @DBValidation @DataConsistency
  Scenario: TC_18 Verify special categories data consistency
    And I send the GET request to "categories_getspecialcategories" endpoint with dynamic access token and query parameters
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
      | $.data[0].name | DB:categories:name: id=3 AND is_active=1 |
      | $.data[1].name | DB:categories:name: id=7 AND is_active=1 |
      | $.data[2].name | DB:categories:name: id=8 AND is_active=1 |
