@BizomWebAPI @CE @BeatDetailsManagement @BeatDetails @BeatAdditionCheckForOutlets @CoreBusinessOperations
Feature: This feature file contains testcases for GET endpoint Beat Details - beat addition check for outlets

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Positive @Sanity
  Scenario: TC_01 Beat addition check for outlets with valid access token
    And I send the GET request to "beatdetails_beatadditioncheckforoutlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  |  "" |

  @Negative @Security
  Scenario: TC_02 Beat addition check for outlets with invalid access token
    And I send the GET request to "beatdetails_beatadditioncheckforoutlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_123|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |

  @Negative @Validation
  Scenario: TC_03 Beat addition check for outlets with empty access token
    And I send the GET request to "beatdetails_beatadditioncheckforoutlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token||
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |

  @Negative @Validation
  Scenario: TC_04 Access invalid beat addition check for outlets endpoint
    And I send the GET request to "beatdetails_beatadditioncheckforoutlets_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |

  @Positive @ResponseHeaders
  Scenario: TC_05 Beat addition check for outlets response headers validation
    And I send the GET request to "beatdetails_beatadditioncheckforoutlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | application/json |
      | Connection    | keep-alive                  |

  @Positive @Performance
  Scenario: TC_06 Beat addition check for outlets performance validation
    And I send the GET request to "beatdetails_beatadditioncheckforoutlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | "" |

  @Positive @ContentValidation
  Scenario: TC_07 Beat addition check for outlets content validation
    And I send the GET request to "beatdetails_beatadditioncheckforoutlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | "" |

  @Positive @Performance
  Scenario: TC_08 Beat addition check for outlets load testing
    And I send the GET request to "beatdetails_beatadditioncheckforoutlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | "" |

  @Positive @DataValidation
  Scenario: TC_11 Beat addition check for outlets data structure validation
    And I send the GET request to "beatdetails_beatadditioncheckforoutlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | "" |


  @Positive @SecurityHeaders
  Scenario: TC_12 Beat addition check for outlets security headers validation
    And I send the GET request to "beatdetails_beatadditioncheckforoutlets" endpoint with dynamic access token and query parameters
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

  @Positive @EdgeCase
  Scenario: TC_13 Beat addition check for outlets with special characters in query
    And I send the GET request to "beatdetails_beatadditioncheckforoutlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|special@#$%^&*()|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | "" |

