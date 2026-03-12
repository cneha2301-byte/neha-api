@BizomWebAPI @BankReceiptsManagement @BankReceipts @RemoveDetail @CoreBusinessOperations @CE
Feature: Bank Receipts Remove Detail API Testing
  As a system user
  I want to test the bank receipts remove detail endpoint
  So that I can ensure proper functionality and data retrieval for bank receipt details

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Bank receipts remove detail without access token
    When I send the GET request to "bankreceipts_removedetail" endpoint
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
  Scenario: TC_02 Bank receipts remove detail with invalid access token
    And I send the GET request to "bankreceipts_removedetail" endpoint with dynamic access token and query parameters
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
  Scenario: TC_03 Bank receipts remove detail with empty access token
    And I send the GET request to "bankreceipts_removedetail" endpoint with dynamic access token and query parameters
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
  Scenario: TC_04 Bank receipts remove detail with missing required headers
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
    And I send the GET request to "bankreceipts_removedetail" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |

  @Negative @Validation
  Scenario: TC_05 Bank receipts remove detail with empty headers
    When I send the GET request to "bankreceipts_removedetail" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |

 @Negative @Validation
 Scenario: TC_06 Bank receipts remove detail with invalid endpoint
   When I send the GET request to "bankreceipts_removedetail_invalid" endpoint
   Then I should see the response code as "STATUS_404_NOT_FOUND"
   And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: TC_07 Bank receipts remove detail with invalid HTTP method
    When I send the GET request to "bankreceipts_removedetail" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |

  @Positive @Sanity
  Scenario: TC_08 Bank receipts remove detail with valid access token
    And I send the GET request to "bankreceipts_removedetail" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | false |
      | $.Reason  | Invalid data |

  @Positive @Performance
  Scenario: TC_09 Bank receipts remove detail performance test
    And I send the GET request to "bankreceipts_removedetail" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | false |
      | $.Reason  | Invalid data |

  @Positive @DataValidation
  Scenario: TC_10 Bank receipts remove detail data validation
    And I send the GET request to "bankreceipts_removedetail" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | false |
      | $.Reason  | Invalid data |

  @Positive @ResponseHeaders
  Scenario: TC_11 Bank receipts remove detail response headers validation
    And I send the GET request to "bankreceipts_removedetail" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | false |
      | $.Reason  | Invalid data |
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | application/json; charset=UTF-8 |
      | Connection    | keep-alive                  |


