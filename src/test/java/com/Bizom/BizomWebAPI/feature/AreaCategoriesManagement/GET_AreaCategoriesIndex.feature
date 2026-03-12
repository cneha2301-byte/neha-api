@BizomWebAPI @AreaCategoriesManagement @AreaCategoriesIndex @Index @MasterDataManagement @CE
Feature: Area Categories Index API Testing
  As a system user
  I want to test the area categories index API endpoint
  So that I can ensure proper functionality and data retrieval for area categories

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Area categories index API without access token
    When I send the GET request to "areacategories_index" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |

  @Negative @Security
  Scenario: TC_02 Area categories index API with invalid access token
    And I send the GET request to "areacategories_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |
  
  @Negative @Security
  Scenario: TC_03 Area categories index API with empty access token
    And I send the GET request to "areacategories_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token||
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |

  @Positive @Sanity
  Scenario: TC_04 Area categories index API with valid access token
    And I send the GET request to "areacategories_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Area Categories |
      | title |
      | mainURL |
      | script |

  @Positive @Performance
  Scenario: TC_05 Area categories index API performance test
    And I send the GET request to "areacategories_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1000" milliseconds
    And validating the response contains the following values
      | Value |
      | Area Categories |
      | title |
      | mainURL |
      | script |

  @Negative @InvalidEndpoint
  Scenario: TC_06 Area categories index API with invalid endpoint
    When I send the GET request to "areacategories_index_invalid" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |

  @Positive @DataValidation
  Scenario: TC_07 Area categories index API data validation
    And I send the GET request to "areacategories_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Area Categories |
      | title |
      | mainURL |
      | script |

  @Positive @BusinessLogic
  Scenario: TC_08 Area categories index API business logic validation
    And I send the GET request to "areacategories_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Area Categories |
      | title |
      | mainURL |
      | script |

  @Positive @ResponseHeaders
  Scenario: TC_09 Area categories index API response headers validation
    And I send the GET request to "areacategories_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | text/html; charset=UTF-8    |
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |

  @Positive @ContentValidation
  Scenario: TC_10 Area categories index API content validation
    And I send the GET request to "areacategories_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Area Categories |
      | title |
      | mainURL |
      | script |

  @Positive @LoadTest
  Scenario: TC_11 Area categories index API load test
    And I send the GET request to "areacategories_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1000" milliseconds
    And validating the response contains the following values
      | Value |
      | Area Categories |
      | title |
      | mainURL |
      | script |


