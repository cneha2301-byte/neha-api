@BizomWebAPI @CE @OutletsManagement @OutletElegibleForActivity
Feature: Outlet Eligible For Activity API Testing
  As a system user
  I want to test the getOutletElegibleForActivity endpoint
  So that I can ensure proper functionality and data retrieval for outlet activity eligibility

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |accept-language|en-US,en;q=0.9|
      |cache-control|max-age=0|
      |priority|u=0, i|
      |sec-ch-ua|"Chromium";v="142", "Google Chrome";v="142", "Not_A Brand";v="99"|
      |sec-ch-ua-mobile|?0|
      |sec-ch-ua-platform|"Windows"|
      |sec-fetch-dest|document|
      |sec-fetch-mode|navigate|
      |sec-fetch-site|none|
      |sec-fetch-user|?1|
      |upgrade-insecure-requests|1|
      |user-agent|Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36|
      |cookie|toolbarDisplay=hide; language=en; CAKEPHP=30pib9oe9tbem17hldtshe4spd; PHPSESSID=30pib9oe9tbem17hldtshe4spd; XSRF-TOKEN=eyJpdiI6InBucFRQU05SVytCT1ZwbXlEMG1nUVE9PSIsInZhbHVlIjoiUm45T3lZUERZdlpnWCtZZEZ0bEtRV2hDcm92ZmQvWGdHbi9WU0RGRkhPaTllYW9uNjN1UDJZeFk1am54OENUTU5jSittb2c1UStVaUowNjFLeVkxbjFjWm5BNU5iN3BqdDNqR2dEQ2xxWkZGbFhFNnZVcThTa0VqNlNnRHdaSGEiLCJtYWMiOiI5YmFlMTdiMzEwMjcyNzIzY2M4Y2YyNjI5OTYwNzFiNzJjODk1ZmMyYzAzNDQ1NGU0ODIyM2JhZDY3MmNkMThhIiwidGFnIjoiIn0%3D|


  @Negative @Security
  Scenario: TC_01 Get outlet eligibility without access token
    When I send the GET request to "getOutletElegibleForActivity" endpoint with path parameters
      |Path|Value|
      |outletId|3|
      |activityType|order|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get outlet eligibility with invalid access token
    And I send the GET request to "getOutletElegibleForActivity" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|outletId|3|
      | | |activityType|order|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users" 
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get outlet eligibility with expired access token
    And I send the GET request to "getOutletElegibleForActivity" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|outletId|3|
      | | |activityType|order|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get outlet eligibility with malformed access token
    And I send the GET request to "getOutletElegibleForActivity" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|outletId|3|
      | | |activityType|order|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get outlet eligibility for activity with valid access token
    And I send the GET request to "getOutletElegibleForActivity" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|3|
      | | |activityType|order|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Response|null|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Response|null|

  @Positive @Functional
  Scenario: TC_06 Get outlet eligibility for another activity type with valid access token
    And I send the GET request to "getOutletElegibleForActivity" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|3|
      | | |activityType|visit|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Response|null|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Response|null|

  @Negative @Validation
  Scenario: TC_07 Get outlet eligibility with invalid outletId
    And I send the GET request to "getOutletElegibleForActivity" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|abc|
      | | |activityType|order|
    Then I should see the response code as "500"
    And verify response time is less than "2500" milliseconds


  @Negative @Validation
  Scenario: TC_08 Get outlet eligibility with non-existent outletId
    And I send the GET request to "getOutletElegibleForActivity" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|999999|
      | | |activityType|order|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @ErrorHandling
  Scenario: TC_09 Get outlet eligibility with invalid endpoint
    And I send the GET request to "getOutletElegibleForActivity_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|3|
      | | |activityType|order|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: TC_10 Performance test for outlet eligibility endpoint
    And I send the GET request to "getOutletElegibleForActivity" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|3|
      | | |activityType|order|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Regression
  Scenario: TC_11 Regression test for outlet eligibility endpoint
    And I send the GET request to "getOutletElegibleForActivity" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|3|
      | | |activityType|order|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
