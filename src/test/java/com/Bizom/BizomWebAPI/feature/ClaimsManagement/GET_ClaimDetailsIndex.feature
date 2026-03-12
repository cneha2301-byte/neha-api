@BizomWebAPI @ClaimsManagement @ClaimDetails @Index @ReportsAnalyticsGroup2 @CE
Feature: This feature file contains testcases for GET endpoint Claim Details - index

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Positive @Sanity
  Scenario: TC_01 Get claim details index with valid access token
    And I send the GET request to "claimdetails_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | <!DOCTYPE html |
      | <html |
      | <head> |
      | <title> |
      | <body> |

  @Negative @Security
  Scenario: TC_02 Get claim details index with invalid access token
    And I send the GET request to "claimdetails_index" endpoint with dynamic access token and query parameters
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
  Scenario: TC_03 Get claim details index with empty access token
    And I send the GET request to "claimdetails_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token||
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | <!DOCTYPE html |
      | <html |
      | <head> |
      | <title> |
      | <body> |

  @Positive @ResponseHeaders
  Scenario: TC_04 Get claim details index response headers validation
    And I send the GET request to "claimdetails_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | text/html; charset=UTF-8    |
      | Connection    | keep-alive                  |

  @Positive @Performance
  Scenario: TC_05 Get claim details index performance validation
    And I send the GET request to "claimdetails_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1000" milliseconds
    And validating the response contains the following values
      | Value |
      | <!DOCTYPE html |
      | <html |
      | <head> |
      | <title> |
      | <body> |

  

  @Positive @EdgeCase
  Scenario: TC_06 Get claim details index with special characters in query parameters
    And I send the GET request to "claimdetails_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|special@#$%^&*()|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | <!DOCTYPE html |
      | <html |
      | <head> |
      | <title> |
      | <body> |

  @Positive @SecurityHeaders
  Scenario: TC_07 Get claim details index security headers validation
    And I send the GET request to "claimdetails_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | text/html; charset=UTF-8    |
      | Connection    | keep-alive                  |
    And validating the response contains the following values
      | Value |
      | <!DOCTYPE html |
      | <html |
      | <head> |
      | <title> |
      | <body> |

  @Positive @LoadTest
  Scenario: TC_08 Get claim details index load testing
    And I send the GET request to "claimdetails_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "500" milliseconds
    And validating the response contains the following values
      | Value |
      | <!DOCTYPE html |
      | <html |
      | <head> |
      | <title> |
      | <body> |

  @Positive @Concurrent
  Scenario: TC_09 Get claim details index concurrent request validation
    And I send the GET request to "claimdetails_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | <!DOCTYPE html |
      | <html |
      | <head> |
      | <title> |
      | <body> |

#  @Negative @HTTPMethod
#  Scenario: TC_10 Get claim details index with POST method
#    And I send the POST request to "claimdetails_index" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "405"
#    And verify response time is less than "2000" milliseconds



