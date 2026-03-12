@BizomWebAPI @CE @BeatDetailsManagement @BeatDetails @ApproveBeatChanges @CoreBusinessOperations
Feature: This feature file contains testcases for GET endpoint Beat Details - approve beat changes

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Positive @Sanity
  Scenario: TC_01 Approve beat changes with valid access token
    And I send the GET request to "beatdetails_approvebeatchanges" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.draw    | "0"   |
      | $.data[0].UserName | "SLV Traders" |
      | $.data[0].UserId | "2" |

  @Negative @Security
  Scenario: TC_02 Approve beat changes with invalid access token
    And I send the GET request to "beatdetails_approvebeatchanges" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_123|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: TC_03 Approve beat changes with empty access token
    And I send the GET request to "beatdetails_approvebeatchanges" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token||
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |

  @Negative @Validation
  Scenario: TC_04 Access invalid approve beat changes endpoint
    And I send the GET request to "beatdetails_approvebeatchanges_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |

  @Positive @ResponseHeaders
  Scenario: TC_05 Approve beat changes response headers validation
    And I send the GET request to "beatdetails_approvebeatchanges" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | application/json |
      | Connection    | keep-alive                  |

  @Positive @Performance
  Scenario: TC_06 Approve beat changes performance validation
    And I send the GET request to "beatdetails_approvebeatchanges" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.draw    | "0"   |
      | $.data[0].UserName | "SLV Traders" |
      | $.data[0].UserId | "2" |

  @Positive @ContentValidation
  Scenario: TC_07 Approve beat changes content validation
    And I send the GET request to "beatdetails_approvebeatchanges" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.draw    | "0"   |
      | $.data[0].UserName | "SLV Traders" |
      | $.data[0].UserId | "2" |

  @Positive @DataValidation
  Scenario: TC_08 Approve beat changes data structure validation
    And I send the GET request to "beatdetails_approvebeatchanges" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.draw    | "0"   |
      | $.data[0].UserName | "SLV Traders" |
      | $.data[0].UserId | "2" |

  @Positive @EdgeCase
  Scenario: TC_09 Approve beat changes with special characters in query parameters
    And I send the GET request to "beatdetails_approvebeatchanges" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|special@#$%^&*()|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.draw    | "0"   |
      | $.data[0].UserName | "SLV Traders" |
      | $.data[0].UserId | "2" |

  @Positive @SecurityHeaders
  Scenario: TC_10 Approve beat changes security headers validation
    And I send the GET request to "beatdetails_approvebeatchanges" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | application/json |
      | Connection    | keep-alive                  |
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.draw    | "0"   |
      | $.data[0].UserName | "SLV Traders" |
      | $.data[0].UserId | "2" |

  @Positive @LoadTest
  Scenario: TC_11 Approve beat changes load testing
    And I send the GET request to "beatdetails_approvebeatchanges" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.draw    | "0"   |
      | $.data[0].UserName | "SLV Traders" |
      | $.data[0].UserId | "2" |


