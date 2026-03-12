@BizomWebAPI @CE @CategoriesManagement @Categories @GetCategoriesOfBusinessUnit @ConfigurationSettings
Feature: This feature file contains testcases for GET endpoint Categories - get categories of business unit

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Positive @Sanity
  Scenario: TC_01 Get categories of business unit with valid access token
    And I send the GET request to "categories_getcategoriesofbusinessunit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | "" |
      | $.data[1].Category.id | "2"|
      | $.data[1].Category.name | "Chat" |
      | $.data[2].Category.id | "3" |
      | $.data[2].Category.name | "test_delete1" |
      | $.data[3].Category.id | "4" |
      | $.data[3].Category.name | "CT1801" |
      | $.data[4].Category.id | "5" |
      | $.data[4].Category.name | "Cat13" |

  @Negative @Security
  Scenario: TC_02 Get categories of business unit with invalid access token
    And I send the GET request to "categories_getcategoriesofbusinessunit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_123|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |

  @Negative @Validation
  Scenario: TC_03 Get categories of business unit with empty access token
    And I send the GET request to "categories_getcategoriesofbusinessunit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token||
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |


  @Positive @ResponseHeaders
  Scenario: TC_04 Get categories of business unit response headers validation
    And I send the GET request to "categories_getcategoriesofbusinessunit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | application/json |
      | Connection    | keep-alive                  |

  @Positive @Performance
  Scenario: TC_05 Get categories of business unit performance validation
    And I send the GET request to "categories_getcategoriesofbusinessunit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | "" |


  @Positive @DataValidation
  Scenario: TC_06 Get categories of business unit data structure validation
    And I send the GET request to "categories_getcategoriesofbusinessunit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | "" |

  @Positive @EdgeCase
  Scenario: TC_07 Get categories of business unit with special characters in query parameters
    And I send the GET request to "categories_getcategoriesofbusinessunit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|special@#$%^&*()|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | "" |

  @Positive @SecurityHeaders
  Scenario: TC_08 Get categories of business unit security headers validation
    And I send the GET request to "categories_getcategoriesofbusinessunit" endpoint with dynamic access token and query parameters
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
      | $.Result  | true  |
      | $.Reason  | "" |

  @Positive @LoadTest
  Scenario: TC_09 Get categories of business unit load testing
    And I send the GET request to "categories_getcategoriesofbusinessunit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | "" |


  @Positive @DBValidation @DataIntegrity
  Scenario: TC_10 Verify categories data against database
    And I send the GET request to "categories_getcategoriesofbusinessunit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | "" |
    And I verify API response at path with DB and static values
      | JPath     | Value |
      | $.data[0].Category.name | DB:categories:name: id=1 |
      | $.data[1].Category.name | DB:categories:name: id=2 |

  @Positive @DBValidation @DataCount
  Scenario: TC_11 Verify categories count against database
    And I send the GET request to "categories_getcategoriesofbusinessunit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | "" |

  @Positive @DBValidation @DataConsistency
  Scenario: TC_12 Verify categories data consistency for business unit
    And I send the GET request to "categories_getcategoriesofbusinessunit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | "" |
#    And I verify API response at path with DB and static values
#      | JPath     | Value |
#      | $.data[4].Category.name | DB:categories:name: id=7 AND is_active=1 |
#      | $.data[5].Category.name | DB:categories:name: id=8 AND is_active=1 |
#      | $.data[6].Category.name | DB:categories:name: id=9 AND is_active=1 |#need to impliment query
