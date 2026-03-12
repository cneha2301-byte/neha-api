@BizomWebAPI @CE @OutletsManagement @SearchOutletByPhonenumber @SalesOperations
Feature: Search Outlet by Phone Number API Testing
  As a system user
  I want to test the searchOutletByPhonenumber endpoint
  So that I can verify outlet data retrieval based on phone number

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Search outlet by phone number without access token
    When I send the GET request to "outlets_searchOutletByPhonenumber" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |phoneNumber|9738918021|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_02 Search outlet by phone number with invalid access token
    And I send the GET request to "outlets_searchOutletByPhonenumber" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
      |phoneNumber|9738918021|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_03 Search outlet by phone number with expired access token
    And I send the GET request to "outlets_searchOutletByPhonenumber" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
      |phoneNumber|9738918021|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_04 Search outlet by phone number with malformed access token
    And I send the GET request to "outlets_searchOutletByPhonenumber" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
      |phoneNumber|9738918021|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Search outlet by valid phone number with valid access token
    And I send the GET request to "outlets_searchOutletByPhonenumber" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |phoneNumber|9738918021|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|
      |$.Data.id|"2"|
      |$.Data.state_id|"1"|
      |$.Data.name|"Sadha Nanda1"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|
      |$.Data.id|string|
      |$.Data.state_id|string|
      |$.Data.name|string|

  @Negative @Validation
  Scenario: TC_06 Search outlet with invalid phone number format
    And I send the GET request to "outlets_searchOutletByPhonenumber" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |phoneNumber|invalidPhone|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Data Not Found"|

  @Negative @Validation
  Scenario: TC_07 Search outlet with non-existent phone number
    And I send the GET request to "outlets_searchOutletByPhonenumber" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |phoneNumber|9999999999|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

#  @Negative @ErrorHandling
#  Scenario: TC_08 Search outlet by phone number using invalid endpoint
#    And I send the GET request to "outlets_searchOutletByPhonenumber_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |phoneNumber|9738918021|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2000" milliseconds

  @Positive @Regression
  Scenario: TC_09 Regression test for search outlet by phone number endpoint
    And I send the GET request to "outlets_searchOutletByPhonenumber" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |phoneNumber|9738918021|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

