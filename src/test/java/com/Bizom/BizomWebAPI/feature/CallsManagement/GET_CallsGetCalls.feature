@BizomWebAPI @CallsManagement @Calls @GetCalls @ConfigurationSettings
Feature: This feature file contains testcases for GET endpoint Calls - get calls

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Positive @Sanity
  Scenario: TC_01 Get calls with valid access token
    And I send the GET request to "list_calls" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Response.Result  | "true"  |
      | $.Response.Reason  | "" |
      | $.Response.Calls  | [] |

  @Negative @Security
  Scenario: TC_02 Get calls with invalid access token
    And I send the GET request to "list_calls" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_123|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.result  | false |
      | $.error.code | 401 |
      | $.error.message | "Invalid Access Token or Credentials" |

  @Negative @Validation
  Scenario: TC_03 Get calls with empty access token
    And I send the GET request to "list_calls" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token||
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |



  @Positive @ResponseHeaders
  Scenario: TC_04 Get calls response headers validation
    And I send the GET request to "list_calls" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | application/json; charset=UTF-8 |
      | Connection    | keep-alive                  |

  @Positive @ContentValidation
  Scenario: TC_05 Get calls content validation
    And I send the GET request to "list_calls" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Response.Result  | "true"  |
      | $.Response.Reason  | "" |

  @Positive @DataValidation
  Scenario: TC_06 Get calls data structure validation
    And I send the GET request to "list_calls" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Response.Result  | "true"  |
      | $.Response.Reason  | "" |

  @Positive @EdgeCase
  Scenario: TC_07 Get calls with special characters in query parameters
    And I send the GET request to "list_calls" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|special@#$%^&*()|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Response.Result  | "true"  |
      | $.Response.Reason  | "" |

  @Positive @SecurityHeaders
  Scenario: TC_08 Get calls security headers validation
    And I send the GET request to "list_calls" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | application/json; charset=UTF-8 |
      | Connection    | keep-alive                  |
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Response.Result  | "true"  |
      | $.Response.Reason  | "" |

  @Positive @LoadTest
  Scenario: TC_09 Get calls load testing
    And I send the GET request to "list_calls" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "500" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Response.Result  | "true"  |
      | $.Response.Reason  | "" |

  @Positive @Concurrent
  Scenario: TC_10 Get calls concurrent request validation
    And I send the GET request to "list_calls" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Response.Result  | "true"  |
      | $.Response.Reason  | "" |

#  @Negative @HTTPMethod
#  Scenario: TC_11 Get calls with POST method
#    And I send the POST request to "list_calls" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "405"
#    And verify response time is less than "2000" milliseconds



