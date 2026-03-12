@BizomWebAPI @CE @ActivitiesManagement @ActivityManagement @GetFieldsByFormName @MasterDataManagement
Feature: Get Fields By Form Name API Testing
  As a system user
  I want to test the get fields by form name endpoint
  So that I can ensure proper functionality and data retrieval for fields by form name

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get fields by form name without access token
    When I send the GET request to "getfieldsbyformname" endpoint
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
  Scenario: TC_02 Get fields by form name with invalid access token
    And I send the GET request to "getfieldsbyformname" endpoint with dynamic access token and query parameters
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
  Scenario: TC_03 Get fields by form name with empty access token
    And I send the GET request to "getfieldsbyformname" endpoint with dynamic access token and query parameters
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
  Scenario: TC_04 Access invalid get fields by form name endpoint
    When I send the GET request to "getfieldsbyformname_invalid" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |

  @Negative @Validation
  Scenario: TC_05 Get fields by form name with missing required headers
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
    And I send the GET request to "getfieldsbyformname" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |


  @Negative @Validation
  Scenario: TC_06 Get fields by form name with empty headers
    When I send the GET request to "getfieldsbyformname" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |

  @Positive @Sanity
  Scenario: TC_07 Get fields by form name with valid access token
    And I send the GET request to "getfieldsbyformname" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | false |
      | $.Reason  | Please provide proper form name |
      | $.Data    | [] |

  @Positive @Performance
  Scenario: TC_08 Get fields by form name performance test
    And I send the GET request to "getfieldsbyformname" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | false |
      | $.Reason  | Please provide proper form name |
      | $.Data    | [] |

  @Positive @DataValidation
  Scenario: TC_09 Get fields by form name data validation
    And I send the GET request to "getfieldsbyformname" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | false |
      | $.Reason  | Please provide proper form name |
      | $.Data    | [] |

  @Positive @ResponseHeaders
  Scenario: TC_10 Get fields by form name response headers validation
    And I send the GET request to "getfieldsbyformname" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | false |
      | $.Reason  | Please provide proper form name |
      | $.Data    | [] |
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | application/json; charset=UTF-8 |
      | Connection    | keep-alive                  |
