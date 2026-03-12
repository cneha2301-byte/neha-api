@BizomWebAPI @OS @LoadoutsManagement @GetLoadoutForUsers @UserAccessManagement
Feature: Get Loadout For Users API Testing
  As a system user
  I want to test the get loadout for users endpoint
  So that I can ensure proper functionality and data retrieval for loadout for users management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get loadout for users without access token
    When I send the GET request to "loadouts_getloadoutforusers" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_02 Get loadout for users with invalid access token
#    And I send the GET request to "loadouts_getloadoutforusers" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|invalid_token_12345|
#    Then I should see the response code as "200"
#     And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_03 Get loadout for users with valid access token
    And I send the GET request to "loadouts_getloadoutforusers" endpoint 
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: TC_04 Performance test for get loadout for users endpoint
    And I send the GET request to "loadouts_getloadoutforusers" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

#  @Negative @ErrorHandling
#  Scenario: TC_05 Get loadout for users with invalid endpoint
#    And I send the GET request to "loadouts_getloadoutforusers_invalid" endpoint
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

