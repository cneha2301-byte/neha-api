@BizomWebAPI @CE @ActivitiesManagement @ActivityFormDatas @GetActivityFormDatasByType @MasterDataManagement
Feature: Get Activity Form Datas By Type API Testing
  As a system user
  I want to test the get activity form datas by type API endpoint
  So that I can ensure proper functionality and data retrieval for activity form datas by type

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get activity form datas by type API without access token
    When I send the GET request to "getactivityformdatasbytype" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |

  @Negative @Security
  Scenario: TC_02 Get activity form datas by type API with invalid access token
    And I send the GET request to "getactivityformdatasbytype" endpoint with dynamic access token and query parameters
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
  Scenario: TC_03 Get activity form datas by type API with empty access token
    And I send the GET request to "getactivityformdatasbytype" endpoint with dynamic access token and query parameters
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
  Scenario: TC_04 Get activity form datas by type API with valid access token
    And I send the GET request to "getactivityformdatasbytype" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | false |
      | $.Error.code | 404 |
      | $.Error.message | No data found for this request |
      | $.data    | [] |

  @Positive @Performance
  Scenario: TC_05 Get activity form datas by type API performance test
    And I send the GET request to "getactivityformdatasbytype" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | false |
      | $.Error.code | 404 |
      | $.Error.message | No data found for this request |
      | $.data    | [] |

  @Negative @InvalidEndpoint
  Scenario: TC_06 Get activity form datas by type API with invalid endpoint
    When I send the GET request to "getactivityformdatasbytype_invalid" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |

  @Negative @Security
  Scenario: TC_07 Get activity form datas by type API with expired access token
    And I send the GET request to "getactivityformdatasbytype" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.result  | false |
      | $.error.code | 401 |
      | $.error.message | Invalid Access Token or Credentials |

    
  @Positive @ResponseHeaders
  Scenario: TC_08 Get activity form datas by type API response headers validation
    And I send the GET request to "getactivityformdatasbytype" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | application/json; charset=UTF-8 |
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |

  @Positive @ContentValidation
  Scenario: TC_09 Get activity form datas by type API content validation
    And I send the GET request to "getactivityformdatasbytype" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | false |
      | $.Error.code | 404 |
      | $.Error.message | No data found for this request |
      | $.data    | [] |

  @Positive @SecurityHeaders
  Scenario: TC_10 Get activity form datas by type API security headers validation
    And I send the GET request to "getactivityformdatasbytype" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | application/json; charset=UTF-8 |
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |

  @Positive @LoadTest
  Scenario: TC_11 Get activity form datas by type API load test
    And I send the GET request to "getactivityformdatasbytype" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | false |
      | $.Error.code | 404 |
      | $.Error.message | No data found for this request |
      | $.data    | [] |


  @Positive @Authentication
  Scenario: TC_12 Get activity form datas by type API authentication validation
    And I send the GET request to "getactivityformdatasbytype" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | false |
      | $.Error.code | 404 |
      | $.Error.message | No data found for this request |
      | $.data    | [] |
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | application/json; charset=UTF-8 |
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |



