@BizomWebAPI @CE @ActivitiesManagement @ActivityManagement @GetOutletWiseRemainingFrequencyForActivities @MasterDataManagement
Feature: Get Outlet Wise Remaining Frequency For Activities API Testing
  As a system user
  I want to test the get outlet wise remaining frequency for activities endpoint
  So that I can ensure proper functionality and data retrieval for outlet wise remaining frequency for activities

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get outlet wise remaining frequency for activities without access token
    When I send the GET request to "getoutletwiseremainingfrequencyforactivities" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |
      | <html xmlns="http://www.w3.org/1999/xhtml"> |
      | <head> |
      | <body> |

  @Negative @Security
  Scenario: TC_02 Get outlet wise remaining frequency for activities with invalid access token
    And I send the GET request to "getoutletwiseremainingfrequencyforactivities" endpoint with dynamic access token and query parameters
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
  Scenario: TC_03 Get outlet wise remaining frequency for activities with empty access token
    And I send the GET request to "getoutletwiseremainingfrequencyforactivities" endpoint with dynamic access token and query parameters
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

 

  @Negative @Validation
  Scenario: TC_04 Get outlet wise remaining frequency for activities with missing required headers
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
    And I send the GET request to "getoutletwiseremainingfrequencyforactivities" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |

  @Negative @Validation
  Scenario: TC_05 Get outlet wise remaining frequency for activities with empty headers
    When I send the GET request to "getoutletwiseremainingfrequencyforactivities" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |

  @Negative @Validation
  Scenario: TC_06 Get outlet wise remaining frequency for activities with invalid endpoint
    When I send the GET request to "getoutletwiseremainingfrequencyforactivities_invalid" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |


  @Positive @Sanity
  Scenario: TC_07 Get outlet wise remaining frequency for activities with valid access token
    And I send the GET request to "getoutletwiseremainingfrequencyforactivities" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.result  | false |
      | $.reason  | The enableFormSubmissionFrequencyInInterval setting is disabled. |
      | $.data    | [] |

  @Positive @Performance
  Scenario: TC_08 Get outlet wise remaining frequency for activities performance test
    And I send the GET request to "getoutletwiseremainingfrequencyforactivities" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.result  | false |
      | $.reason  | The enableFormSubmissionFrequencyInInterval setting is disabled. |
      | $.data    | [] |

  @Positive @DataValidation
  Scenario: TC_09 Get outlet wise remaining frequency for activities data validation
    And I send the GET request to "getoutletwiseremainingfrequencyforactivities" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.result  | false |
      | $.reason  | The enableFormSubmissionFrequencyInInterval setting is disabled. |
      | $.data    | [] |

  @Positive @ResponseHeaders
  Scenario: TC_10 Get outlet wise remaining frequency for activities response headers validation
    And I send the GET request to "getoutletwiseremainingfrequencyforactivities" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.result  | false |
      | $.reason  | The enableFormSubmissionFrequencyInInterval setting is disabled. |
      | $.data    | [] |
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | application/json|
      | Connection    | keep-alive                  |

  @Positive @LoadTest
  Scenario: TC_11 Get outlet wise remaining frequency for activities load test
    And I send the GET request to "getoutletwiseremainingfrequencyforactivities" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.result  | false |
      | $.reason  | The enableFormSubmissionFrequencyInInterval setting is disabled. |
      | $.data    | [] |

  @Positive @Authentication
  Scenario: TC_12 Get outlet wise remaining frequency for activities authentication validation
    And I send the GET request to "getoutletwiseremainingfrequencyforactivities" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.result  | false |
      | $.reason  | The enableFormSubmissionFrequencyInInterval setting is disabled. |
      | $.data    | [] |
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | application/json|
      | Connection    | keep-alive                  |

  @Positive @ErrorHandling
  Scenario: TC_13 Get outlet wise remaining frequency for activities error handling validation
    And I send the GET request to "getoutletwiseremainingfrequencyforactivities" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.result  | false |
      | $.reason  | The enableFormSubmissionFrequencyInInterval setting is disabled. |
      | $.data    | [] |

  @Positive @Functional
   Scenario: TC_14 Get outlet wise remaining frequency for activities functional test
    And I send the GET request to "getoutletwiseremainingfrequencyforactivities" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.result  | false |
      | $.reason  | The enableFormSubmissionFrequencyInInterval setting is disabled. |
      | $.data    | [] |
    And I store the response as "getoutletwiseremainingfrequencyforactivities_response" name using full path
