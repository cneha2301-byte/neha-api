@BizomWebAPI @CE @ActivitiesManagement @ActivityManagement @GetFormFeildsByType @MasterDataManagement
Feature: Get Form Feilds By Type API Testing
  As a system user
  I want to test the get form feilds by type endpoint
  So that I can ensure proper functionality and data retrieval for form feilds by type

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get form feilds by type without access token
    When I send the GET request to "getformfeildsbytype" endpoint
    Then I should see the response code as "200"
    # And verify response time is less than "2000" milliseconds
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
  Scenario: TC_02 Get form feilds by type with invalid access token
    And I send the GET request to "getformfeildsbytype" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    # And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.result  | false |
      | $.error.code | 401 |
      | $.error.message | Invalid Access Token or Credentials |

  @Negative @Security
  Scenario: TC_03 Get form feilds by type with empty access token
    And I send the GET request to "getformfeildsbytype" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token||
    Then I should see the response code as "200"
    # And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |

  @Negative @Validation
  Scenario: TC_04 Access invalid get form feilds by type endpoint
    When I send the GET request to "getformfeildsbytype_invalid" endpoint
    Then I should see the response code as "200"
    # And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |

  @Negative @Validation
  Scenario: TC_05 Get form feilds by type with missing required headers
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
    And I send the GET request to "getformfeildsbytype" endpoint
    Then I should see the response code as "200"
    # And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |    

  @Negative @Validation
  Scenario: TC_06 Get form feilds by type with empty headers
    When I send the GET request to "getformfeildsbytype" endpoint
    Then I should see the response code as "200"
    # And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |

  @Positive @Sanity
  Scenario: TC_07 Get form feilds by type with valid access token
    And I send the GET request to "getformfeildsbytype" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    # And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | false |
      | $.Reason  | Please provide proper form |
      | $.Data    | [] |

  @Positive @Performance
  Scenario: TC_08 Get form feilds by type performance test
    And I send the GET request to "getformfeildsbytype" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    # And verify response time is less than "1000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | false |
      | $.Reason  | Please provide proper form |
      | $.Data    | [] |

  @Positive @ResponseHeaders
  Scenario: TC_09 Get form feilds by type response headers validation
    And I send the GET request to "getformfeildsbytype" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    # And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | false |
      | $.Reason  | Please provide proper form |
      | $.Data    | [] |
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | application/json; charset=UTF-8 |
      | Connection    | keep-alive                  |

  @Positive @LoadTest
  Scenario: TC_10 Get form feilds by type load test
    And I send the GET request to "getformfeildsbytype" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    # And verify response time is less than "1000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | false |
      | $.Reason  | Please provide proper form |
      | $.Data    | [] |





