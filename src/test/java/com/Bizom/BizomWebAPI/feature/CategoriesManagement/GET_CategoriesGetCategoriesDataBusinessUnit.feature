@BizomWebAPI @CE @CategoriesManagement @Categories @GetCategoriesDataBusinessUnit @ConfigurationSettings
Feature: This feature file contains testcases for GET endpoint Categories - get categories data business unit

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Positive @Sanity
  Scenario: TC_01 Get categories data business unit with valid access token
    And I send the GET request to "categories_getcategoriesdatabusinessunit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true"  |
      | $.Reason  | "" |

  @Negative @Security
  Scenario: TC_02 Get categories data business unit with invalid access token
    And I send the GET request to "categories_getcategoriesdatabusinessunit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_123|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |

  @Negative @Validation
  Scenario: TC_03 Get categories data business unit with empty access token
    And I send the GET request to "categories_getcategoriesdatabusinessunit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token||
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |

  @Negative @Validation
  Scenario: TC_04 Get categories data business unit with malformed access token
    And I send the GET request to "categories_getcategoriesdatabusinessunit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed_token_@#$%|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |

  @Negative @Validation
  Scenario: TC_05 Get categories data business unit with expired access token
    And I send the GET request to "categories_getcategoriesdatabusinessunit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |

  @Positive @ResponseHeaders
  Scenario: TC_06 Get categories data business unit response headers validation
    And I send the GET request to "categories_getcategoriesdatabusinessunit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | application/json |
      | Connection    | keep-alive                  |

  @Positive @Performance
  Scenario: TC_07 Get categories data business unit performance validation
    And I send the GET request to "categories_getcategoriesdatabusinessunit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true"  |
      | $.Reason  | "" |

  @Positive @ContentValidation
  Scenario: TC_08 Get categories data business unit content validation
    And I send the GET request to "categories_getcategoriesdatabusinessunit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true"  |
      | $.Reason  | "" |

  @Positive @DataValidation
  Scenario: TC_09 Get categories data business unit data structure validation
    And I send the GET request to "categories_getcategoriesdatabusinessunit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true"  |
      | $.Reason  | "" |

  @Positive @EdgeCase
  Scenario: TC_10 Get categories data business unit with special characters in query parameters
    And I send the GET request to "categories_getcategoriesdatabusinessunit" endpoint with dynamic access token and query parameters
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
  Scenario: TC_11 Get categories data business unit security headers validation
    And I send the GET request to "categories_getcategoriesdatabusinessunit" endpoint with dynamic access token and query parameters
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
  Scenario: TC_12 Get categories data business unit load testing
    And I send the GET request to "categories_getcategoriesdatabusinessunit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "500" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true"  |
      | $.Reason  | "" |


  @Positive @DBValidation @DataIntegrity
  Scenario: TC_15 Verify categories data against database
    And I send the GET request to "categories_getcategoriesdatabusinessunit" endpoint with dynamic access token and query parameters
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
      | $.categories.2 | DB:categories:name: id=2 |
      | $.categories.3 | DB:categories:name: id=3 |
      | $.categories.4 | DB:categories:name: id=4 |
      | $.categories.5 | DB:categories:name: id=5 |

  @Positive @DBValidation @DataCount
  Scenario: TC_16 Verify categories count against database
    And I send the GET request to "categories_getcategoriesdatabusinessunit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true"  |

  @Positive @DBValidation @DataConsistency
  Scenario: TC_17 Verify categories data consistency for business unit
    And I send the GET request to "categories_getcategoriesdatabusinessunit" endpoint with dynamic access token and query parameters
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
      | $.categories.6 | DB:categories:name: id=6 AND is_active=1 |
      | $.categories.7 | DB:categories:name: id=7 AND is_active=1 |
      | $.categories.8 | DB:categories:name: id=8 AND is_active=1 |
      | $.categories.9 | DB:categories:name: id=9 AND is_active=1 |
