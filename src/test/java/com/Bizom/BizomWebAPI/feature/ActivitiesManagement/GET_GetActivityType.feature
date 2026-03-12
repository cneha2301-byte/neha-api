@BizomWebAPI @CE @ActivitiesManagement @ActivityManagement @GetActivityType @MasterDataManagement
Feature: Get Activity Type API Testing
  As a system user
  I want to test the get activity type API endpoint
  So that I can ensure proper functionality and data retrieval for activity types

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get activity type API without access token
    When I send the GET request to "getactivitytype" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |

  @Negative @Security
  Scenario: TC_02 Get activity type API with invalid access token
    And I send the GET request to "getactivitytype" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.result  | false |
      | $.error.code | 401 |
      | $.error.message | Invalid Access Token or Credentials |

  @Negative @Security
  Scenario: TC_03 Get activity type API with empty access token
    And I send the GET request to "getactivitytype" endpoint with dynamic access token and query parameters
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
  Scenario: TC_04 Get activity type API with valid access token
    And I send the GET request to "getactivitytype" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.result  | true  |
      | $.error.code | "" |
      | $.error.message | "" |
      | $.activitytype[0].id | "1" |
      | $.activitytype[0].name | "location" |
      | $.activitytype[1].id | "2" |
      | $.activitytype[1].name | "signature" |
    And I store the response as "getactivitytype_response" name using full path

  @Positive @Performance
  Scenario: TC_05 Get activity type API performance test
    And I send the GET request to "getactivitytype" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.result  | true  |
      | $.error.code | "" |
      | $.error.message | "" |
      | $.activitytype[0].id | "1" |
      | $.activitytype[0].name | "location" |

  @Negative @InvalidEndpoint
  Scenario: TC_06 Get activity type API with invalid endpoint
    When I send the GET request to "getactivitytype_invalid" endpoint
    Then I should see the response code as "STATUS_404_NOT_FOUND"
    And verify response time is less than "2000" milliseconds

  @Positive @ResponseHeaders
  Scenario: TC_07 Get activity type API response headers validation
    And I send the GET request to "getactivitytype" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.result  | true  |
      | $.error.code | "" |
      | $.error.message | "" |
      | $.activitytype[0].id | "1" |
      | $.activitytype[0].name | "location" |
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | application/json; charset=UTF-8 |
      | Connection    | keep-alive                  |

  @Positive @DataValidation
  Scenario: TC_08 Get activity type API data validation
    And I send the GET request to "getactivitytype" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.result  | true  |
      | $.error.code | "" |
      | $.error.message | "" |
      | $.activitytype[0].id | "1" |
      | $.activitytype[0].name | "location" |
      | $.activitytype[1].id | "2" |
      | $.activitytype[1].name | "signature" |

  @Positive @LoadTest
  Scenario: TC_09 Get activity type API load test
    And I send the GET request to "getactivitytype" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.result  | true  |
      | $.error.code | "" |
      | $.error.message | "" |
      | $.activitytype[0].id | "1" |
      | $.activitytype[0].name | "location" |

