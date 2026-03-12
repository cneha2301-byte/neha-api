@BizomWebAPI @CE @TargetsManagement @Targets @AchievementMultiUserNew
Feature: Targets Achievement Multi User New API Testing
  As a system user
  I want to test the targets achievement multiuser new endpoint
  So that I can ensure proper functionality and JSON response validation for multi-user achievement data

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
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

  @Negative @Security
  Scenario: TC_01 Get targets achievement multiuser new without access token
    When I send the GET request to "targets_achievementmultiusernew" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get targets achievement multiuser new with invalid access token
    And I send the GET request to "targets_achievementmultiusernew" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_03 Get targets achievement multiuser new with valid access token
    And I send the GET request to "targets_achievementmultiusernew" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
    And verify response time is less than "2500" milliseconds
    And I store the response as "targets_achievementmultiusernew_response" name using full path

  @Positive @DataValidation
  Scenario: TC_04 Validate targets achievement multiuser new response structure
    And I send the GET request to "targets_achievementmultiusernew" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: TC_05 Performance test for targets achievement multiuser new endpoint
    And I send the GET request to "targets_achievementmultiusernew" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Negative @ErrorHandling
  Scenario: TC_06 Get targets achievement multiuser new with invalid endpoint
    And I send the GET request to "targets_achievementmultiusernew_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

