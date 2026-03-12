@BizomWebAPI @Innovation @AssetsManagement @DeleteAsset @SystemOperations
Feature: Delete Asset API Testing
  As a Bizom web API consumer
  I want to test the delete asset endpoint
  So that I can ensure proper functionality for deleting assets

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Positive @Smoke
  Scenario: TC_01 DeleteAsset with valid asset ID - positive case
    And I send the GET request to "GET_DeleteAsset" endpoint with path parameters and follow redirection to "assets_index" endpoint
      |Path|Value|
      |assetId|DB:assets:id: is_active=1 ORDER BY id DESC LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify the data got updated as needed from DB
      |expectedColumn|expectedValue|
      |DB:assets:is_deleted: id=2068|1|

  #-----------------------------------------------------------------------------------------------------

  @Positive @Functional
  Scenario: TC_02 DeleteAsset with different asset ID
    And I send the GET request to "GET_DeleteAsset" endpoint with path parameters and follow redirection to "assets_index" endpoint
      |Path|Value|
      |assetId|DB:assets:id: is_active=1 ORDER BY id DESC LIMIT 1 OFFSET 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify the data got updated as needed from DB
      |expectedColumn|expectedValue|
      |DB:assets:is_deleted: id=2068|1|

  #-----------------------------------------------------------------------------------------------------

  @Negative @Security
  Scenario: TC_03 DeleteAsset without access token
    When I send the GET request to "GET_DeleteAsset" endpoint with path parameters
      |Path|Value|
      |assetId|DB:assets:id: is_active=1 ORDER BY id DESC LIMIT 1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  #-----------------------------------------------------------------------------------------------------

  @Negative @Validation
  Scenario: TC_04 DeleteAsset with invalid asset ID
    And I send the GET request to "GET_DeleteAsset" endpoint with path parameters and follow redirection to "assets_index" endpoint
      |Path|Value|
      |assetId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  #-----------------------------------------------------------------------------------------------------

  @Negative @Validation
  Scenario: TC_05 DeleteAsset with non-existent asset ID
    And I send the GET request to "GET_DeleteAsset" endpoint with path parameters and follow redirection to "assets_index" endpoint
      |Path|Value|
      |assetId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  #-----------------------------------------------------------------------------------------------------

  @Negative @Validation
  Scenario: TC_06 DeleteAsset with negative asset ID
    And I send the GET request to "GET_DeleteAsset" endpoint with path parameters and follow redirection to "assets_index" endpoint
      |Path|Value|
      |assetId|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  #-----------------------------------------------------------------------------------------------------

  @Negative @Validation
  Scenario: TC_07 DeleteAsset with already deleted asset ID
    And I send the GET request to "GET_DeleteAsset" endpoint with path parameters and follow redirection to "assets_index" endpoint
      |Path|Value|
      |assetId|DB:assets:id: deactivated=1 LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  #-----------------------------------------------------------------------------------------------------

#  @Negative @ErrorHandling
#  Scenario: TC_08 DeleteAsset with invalid endpoint
#    And I send the GET request to "GET_DeleteAsset_invalid" endpoint with path parameters
#      |Path|Value|
#      |assetId|DB:assets:id: is_active=1 ORDER BY id DESC LIMIT 1|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  #-----------------------------------------------------------------------------------------------------

  @Positive @Performance
  Scenario: TC_09 Performance test for delete asset endpoint
    And I send the GET request to "GET_DeleteAsset" endpoint with path parameters and follow redirection to "assets_index" endpoint
      |Path|Value|
      |assetId|DB:assets:id: is_active=1 ORDER BY id DESC LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  #-----------------------------------------------------------------------------------------------------

  @Positive @Regression
  Scenario: TC_10 Regression test for delete asset endpoint
    And I send the GET request to "GET_DeleteAsset" endpoint with path parameters and follow redirection to "assets_index" endpoint
      |Path|Value|
      |assetId|DB:assets:id: is_active=1 ORDER BY id DESC LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify the data got updated as needed from DB
      |expectedColumn|expectedValue|
      |DB:assets:is_deleted: id=2068|1|

  #-----------------------------------------------------------------------------------------------------

  @Positive @Smoke
  Scenario: TC_11 DeleteAsset and verify redirect to assets index
    And I send the GET request to "GET_DeleteAsset" endpoint with path parameters and follow redirection to "assets_index" endpoint
      |Path|Value|
      |assetId|DB:assets:id: is_active=1 ORDER BY id DESC LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify the data got updated as needed from DB
      |expectedColumn|expectedValue|
      |DB:assets:is_deleted: id=2068|1|

