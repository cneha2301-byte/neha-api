@BizomWebAPI @AppTabSequencesManagement @AppTabSequences @Index @MasterDataManagement @CE
Feature: App Tab Sequences Index API Testing
  As a system user
  I want to test the app tab sequences index API endpoint
  So that I can ensure proper functionality and data retrieval for app tab sequences

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 App tab sequences index API without access token
    When I send the GET request to "apptabsequences_index" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |

  @Negative @Security
  Scenario: TC_02 App tab sequences index API with invalid access token
    And I send the GET request to "apptabsequences_index" endpoint with dynamic access token and query parameters
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
  Scenario: TC_03 App tab sequences index API with empty access token
    And I send the GET request to "apptabsequences_index" endpoint with dynamic access token and query parameters
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
  Scenario: TC_04 App tab sequences index API with valid access token
    And I send the GET request to "apptabsequences_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Users |
      | title |
      | mainURL |
      | script |
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | text/html; charset=UTF-8    |
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |

  @Positive @Performance
  Scenario: TC_05 App tab sequences index API performance test
    And I send the GET request to "apptabsequences_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1000" milliseconds
    And validating the response contains the following values
      | Value |
      | Users |
      | title |
      | mainURL |
      | script |

  @Negative @InvalidEndpoint
  Scenario: TC_06 App tab sequences index API with invalid endpoint
    When I send the GET request to "apptabsequences_index_invalid" endpoint
    Then I should see the response code as "STATUS_404_NOT_FOUND"
    And verify response time is less than "2000" milliseconds

  @Positive @DataValidation
  Scenario: TC_07 App tab sequences index API data validation
    And I send the GET request to "apptabsequences_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Users |
      | title |
      | mainURL |
      | script |

  @Positive @BusinessLogic
  Scenario: TC_08 App tab sequences index API business logic validation
    And I send the GET request to "apptabsequences_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Users |
      | title |
      | mainURL |
      | script |

