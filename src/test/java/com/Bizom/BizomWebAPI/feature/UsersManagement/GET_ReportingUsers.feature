@BizomWebAPI @CE @UsersManagement @GetReportingUsers
Feature: Get Reporting Users API Testing
  As a system user
  I want to test the getreportingusers endpoint
  So that I can ensure proper functionality and data retrieval for reporting users

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |accept-language|en-US,en;q=0.9|
      |priority|u=0, i|
      |sec-ch-ua|"Google Chrome";v="143", "Chromium";v="143", "Not A(Brand";v="24"|
      |sec-ch-ua-mobile|?0|
      |sec-ch-ua-platform|"Windows"|
      |sec-fetch-dest|document|
      |sec-fetch-mode|navigate|
      |sec-fetch-site|none|
      |sec-fetch-user|?1|
      |upgrade-insecure-requests|1|
      |user-agent|Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36|
      |cookie|toolbarDisplay=hide; PHPSESSID=SVU0lt0NuLWzW9DmBrnvh5e3b9gUqm5VlEBBbWPl; CAKEPHP=og843cmth1usd1br358jq9v21h|

  @Negative @Security
  Scenario: TC_01 Get reporting users without access token
    When I send the GET request to "getreportingusers" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get reporting users with invalid access token
    And I send the GET request to "getreportingusers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get reporting users with expired access token
    And I send the GET request to "getreportingusers" endpoint with dynamic access token and query parameters
        |QueryParamName|QueryParamValue|
        |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get reporting users with malformed access token
    And I send the GET request to "getreportingusers" endpoint with dynamic access token and query parameters
        |QueryParamName|QueryParamValue|
        |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get reporting users with valid access token
    And I send the GET request to "getreportingusers" endpoint with dynamic access token and query parameters
       |QueryParamName|QueryParamValue|
       |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.apiVersion|2|
      |$.data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.apiVersion|number|
      |$.data|array|

  @Positive @Performance
  Scenario: TC_06 Performance test for getreportingusers endpoint
    And I send the GET request to "getreportingusers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
        |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.apiVersion|2|
      |$.data|[]|

  @Positive @Regression
  Scenario: TC_07 Regression test for getreportingusers endpoint
    And I send the GET request to "getreportingusers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.apiVersion|2|
      |$.data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.apiVersion|number|
      |$.data|array|

  @Negative @ErrorHandling
  Scenario: TC_08 Get reporting users with invalid endpoint
    And I send the GET request to "getreportingusers" endpoint with dynamic access token and query parameters
        |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title ""
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_09 Get reporting users with missing required headers
    And I send the GET request to "getreportingusers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Boundary
  Scenario: TC_10 Get reporting users with large number of users
    And I send the GET request to "getreportingusers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |limit|1000|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.apiVersion|2|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.apiVersion|number|
      |$.data|array|

  @Positive @Compatibility
  Scenario: TC_11 Get reporting users with supported API version
    And I send the GET request to "getreportingusers" endpoint with dynamic access token and query parameters
        |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |apiVersion|2|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.apiVersion|2|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.apiVersion|number|
