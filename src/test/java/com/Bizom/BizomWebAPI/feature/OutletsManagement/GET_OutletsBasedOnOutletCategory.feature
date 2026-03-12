@BizomWebAPI @CE @OutletsManagement @OutletCategoryInfo @SalesOperations
Feature: Get Outlets Based on Outlet Category API Testing
  As a system user
  I want to test the get outlets based on outlet category endpoint
  So that I can ensure proper functionality, data retrieval, and access control for outlet category mapping

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get outlets based on category without access token
    When I send the GET request to "outlets_get_outlets_based_on_category" endpoint with path parameters
      |Path|Value|
      |categoryId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: TC_02 Get outlets based on category with invalid access token
#    And I send the GET request to "outlets_get_outlets_based_on_category" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|invalid_token_12345|categoryId|2|
#   Then I should see the response code as "200"
#   And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: TC_03 Get outlets based on category with expired access token
#    And I send the GET request to "outlets_get_outlets_based_on_category" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|expired_token_12345|categoryId|2|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: TC_04 Get outlets based on category with malformed access token
#    And I send the GET request to "outlets_get_outlets_based_on_category" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|malformed.token.here|categoryId|2|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#    And verify response time is less than "2000" milliseconds

#  @Positive @Smoke
#  Scenario: TC_05 Get outlets based on category ID 2 with valid access token
#    And I send the GET request to "outlets_get_outlets_based_on_category" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|categoryId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Outlet[0].id|"5365"|
#      |$.Outlet[0].name|"ABBBCdennxxcfg kEnterprises"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Outlet|array|
#      |$.Outlet[0].id|string|
#      |$.Outlet[0].name|string|

  @Positive @Functional
  Scenario: TC_06 Get outlets based on category ID 3 with valid access token
    And I send the GET request to "outlets_get_outlets_based_on_category" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|categoryId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Outlet|array|

#  @Negative @Validation
#  Scenario: TC_07 Get outlets based on category with invalid category ID
#    And I send the GET request to "outlets_get_outlets_based_on_category" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|categoryId|abc|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|"Invalid Outlet Category"|

#  @Negative @Validation
#  Scenario: TC_08 Get outlets based on category with non-existent category ID
#    And I send the GET request to "outlets_get_outlets_based_on_category" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|categoryId|999999|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|"Invalid Outlet Category"|

  @Negative @ErrorHandling
  Scenario: TC_09 Get outlets based on category with invalid endpoint
    And I send the GET request to "outlets_get_outlets_based_on_category_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|categoryId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: TC_10 Performance test for outlets based on category endpoint
    And I send the GET request to "outlets_get_outlets_based_on_category" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|categoryId|2|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Regression
  Scenario: TC_11 Regression test for outlets based on category endpoint
    And I send the GET request to "outlets_get_outlets_based_on_category" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|categoryId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

#  @Positive @Smoke
#  Scenario: TC_12 Verify outlet category response with DB values
#    And I send the GET request to "outlets_get_outlets_based_on_category" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|categoryId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Outlet[0].name|DB:outlets:name:id=5365|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Outlet|array|

#  @Positive @EndToEnd
#  Scenario: TC_13 End-to-end workflow for outlet category info retrieval
#    And I send the GET request to "outlets_get_outlets_based_on_category" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|categoryId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Outlet[0].id|"5365"|
#      |$.Outlet[0].name|"ABBBCdennxxcfg kEnterprises"|
#    And I store the response as "outlet_category_info_e2e_response" name using full path
