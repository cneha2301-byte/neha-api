@BizomWebAPI @BackgroundProcessesManagement @BackgroundProcesses @ProcessList @CoreBusinessOperations @OS
Feature: Background Processes Process List API Testing
  As a system user
  I want to test the background processes process list endpoint
  So that I can ensure proper functionality and data retrieval for background processes

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Background processes process list without access token
    When I send the GET request to "backgroundprocesses_processlist" endpoint
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
  Scenario: TC_02 Background processes process list with invalid access token
    And I send the GET request to "backgroundprocesses_processlist" endpoint with dynamic access token and query parameters
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
  Scenario: TC_03 Background processes process list with empty access token
    And I send the GET request to "backgroundprocesses_processlist" endpoint with dynamic access token and query parameters
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
  Scenario: TC_04 Background processes process list with missing required headers
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
    And I send the GET request to "backgroundprocesses_processlist" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |

  @Negative @Validation
  Scenario: TC_05 Background processes process list with empty headers
    When I send the GET request to "backgroundprocesses_processlist" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |

  @Negative @Validation
  Scenario: TC_06 Background processes process list with invalid endpoint
    When I send the GET request to "backgroundprocesses_processlist_invalid" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |

  @Negative @Validation
  Scenario: TC_07 Background processes process list with invalid HTTP method
    When I send the GET request to "backgroundprocesses_processlist" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |

  @Positive @Sanity
  Scenario: TC_08 Background processes process list with valid access token
    And I send the GET request to "backgroundprocesses_processlist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.sEcho   | 1     |

  @Positive @Performance
  Scenario: TC_09 Background processes process list performance test
    And I send the GET request to "backgroundprocesses_processlist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.sEcho   | 1     |

  @Positive @DataValidation
  Scenario: TC_10 Background processes process list data validation
    And I send the GET request to "backgroundprocesses_processlist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.sEcho   | 1     |

  @Positive @ResponseHeaders
  Scenario: TC_11 Background processes process list response headers validation
    And I send the GET request to "backgroundprocesses_processlist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.sEcho   | 1     |
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Connection    | keep-alive                  |





