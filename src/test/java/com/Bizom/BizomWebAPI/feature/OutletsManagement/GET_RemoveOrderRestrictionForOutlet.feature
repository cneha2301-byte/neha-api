@BizomWebAPI @CE @OutletsManagement @SalesOperations
Feature: Remove Order Restriction for Outlet API Testing
  As a system user
  I want to test the Remove Order Restriction for Outlet endpoint
  So that I can ensure outlet order restrictions can be removed successfully and handled properly

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Remove order restriction for outlet without access token
    When I send the GET request to "outlets_removeOrderRestrictionForOutlet" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @ErrorHandling
#  Scenario: TC_02 Error handling test for remove order restriction using invalid endpoint
#    When I send the GET request to "outlets_removeOrderRestrictionForOutlet_invalid" endpoint
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Negative @Security @RemoveOrderRestrictionForOutlet
  Scenario: TC_03 Remove order restriction for outlet with invalid access token
    And I send the GET request to "outlets_removeOrderRestrictionForOutlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
      |outletId|invalidOutletId|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds


  @Negative @Security
  Scenario: TC_04 Remove order restriction for outlet with SQL injection attempt
    And I send the GET request to "outlets_removeOrderRestrictionForOutlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|' OR 1=1; --|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.UpdatedEntities|[]|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_05 Remove order restriction for outlet with special characters in outlet ID
    And I send the GET request to "outlets_removeOrderRestrictionForOutlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|<script>alert('test')</script>|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.UpdatedEntities|[]|
    And verify response time is less than "2500" milliseconds

  @Positive @DataValidation
  Scenario: TC_06 Validate Remove Order Restriction response data structure
    And I send the GET request to "outlets_removeOrderRestrictionForOutlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.UpdatedEntities|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.UpdatedEntities|array|

  @Positive @Performance
  Scenario: TC_07 Performance validation for Remove Order Restriction endpoint
    And I send the GET request to "outlets_removeOrderRestrictionForOutlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.UpdatedEntities|[]|

  @Negative @Timeout
  Scenario: TC_08 Timeout handling for Remove Order Restriction API
    And I send the GET request to "outlets_removeOrderRestrictionForOutlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.UpdatedEntities|[]|

  @Positive @EndToEnd
  Scenario: TC_09 End-to-end validation for Remove Order Restriction flow
    And I send the GET request to "outlets_removeOrderRestrictionForOutlet" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.UpdatedEntities|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.UpdatedEntities|array|
    And I store the response as "remove_order_restriction_response" name using full path
