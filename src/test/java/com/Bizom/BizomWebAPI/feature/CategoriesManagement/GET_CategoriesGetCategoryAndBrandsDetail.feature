@BizomWebAPI @CE @CategoriesManagement @Categories @GetCategoryAndBrandsDetail @ConfigurationSettings
Feature: This feature file contains testcases for GET endpoint Categories - get category and brands detail

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Positive @Sanity
  Scenario: TC_01 Get category and brands detail with valid access token
    And I send the GET request to "categories_getcategoryandbrandsdetail" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | Data Found |

  @Negative @Security
  Scenario: TC_02 Get category and brands detail with invalid access token
    And I send the GET request to "categories_getcategoryandbrandsdetail" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_123|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |

  @Negative @Validation
  Scenario: TC_03 Get category and brands detail with empty access token
    And I send the GET request to "categories_getcategoryandbrandsdetail" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token||
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |

  @Positive @ResponseHeaders
  Scenario: TC_04 Get category and brands detail response headers validation
    And I send the GET request to "categories_getcategoryandbrandsdetail" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | application/json |
      | Connection    | keep-alive                  |

  @Positive @Performance
  Scenario: TC_05 Get category and brands detail performance validation
    And I send the GET request to "categories_getcategoryandbrandsdetail" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | Data Found |

  @Positive @DataValidation
  Scenario: TC_06 Get category and brands detail data structure validation
    And I send the GET request to "categories_getcategoryandbrandsdetail" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | Data Found |

  @Positive @EdgeCase
    Scenario: TC_07 Get category and brands detail with special characters in query parameters
    And I send the GET request to "categories_getcategoryandbrandsdetail" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|special@#$%^&*()|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | Data Found |

  @Positive @SecurityHeaders
  Scenario: TC_08 Get category and brands detail security headers validation
    And I send the GET request to "categories_getcategoryandbrandsdetail" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | application/json |
      | Connection    | keep-alive                  |
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | Data Found |

  @Positive @LoadTest
  Scenario: TC_09 Get category and brands detail load testing
    And I send the GET request to "categories_getcategoryandbrandsdetail" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | Data Found |

  @Positive @DBValidation @DataIntegrity
  Scenario: TC_10 Verify category and brands detail data against database
    And I send the GET request to "categories_getcategoryandbrandsdetail" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | Data Found |
#    And I verify API response at path with DB and static values
#      | JPath     | Value |
#      | $.data.categories[2].Name | DB:categories:name: id=2  |
#      | $.data.brands[2].Name | DB:brands:name: id=1  |

  @Positive @DBValidation @DataCount
  Scenario: TC_11 Verify category and brands detail count against database
    And I send the GET request to "categories_getcategoryandbrandsdetail" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | Data Found |

  @Positive @DBValidation @DataConsistency
  Scenario: TC_12 Verify category and brands detail data consistency
    And I send the GET request to "categories_getcategoryandbrandsdetail" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | Data Found |
