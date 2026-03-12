@BizomWebAPI @Innovation @AssetsManagement @PostAddAsset
Feature: Add Asset API Testing
  As a system user
  I want to add new assets through the API
  So that I can create and manage asset data in the system

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |origin|https://devuitest.bizomdev.in|
      |referer|https://devuitest.bizomdev.in/assets/add|

  @Positive @Smoke
  Scenario: TC_01 Add asset with valid data and random strings
    And I modify fields with random values and remove fields in "POST_assets_add" payload
      |JPath|Value|
      |$.data.Asset.name|randomString|
    And I post the request with "POST_assets_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "add_asset_response" name using full path

  @Positive @DataValidation @DatabaseValidation
  Scenario: TC_02 Add asset and validate database entry
    And I modify fields with random values and remove fields in "POST_assets_add" payload
      |JPath|Value|
      |$.data.Asset.name|randomString|
    And I post the request with "POST_assets_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And I verify the data got updated as needed from DB
      |expectedColumn|expectedValue|
      |DB:assets:is_autoapprove:id = (SELECT MAX(id) FROM assets)|1|
      |DB:assets:is_smart_asset:id = (SELECT MAX(id) FROM assets)|0|
      |DB:assets:Asset_validation:id = (SELECT MAX(id) FROM assets)|0|

  @Positive @Functional
  Scenario: TC_03 Add asset with all required fields
    And I modify fields with random values and remove fields in "POST_assets_add" payload
      |JPath|Value|
      |$.data.Asset.name|randomString|
      |$.data.Asset.asset_type_id|1|
      |$.data.Asset.is_active|1|
      |$.data.Asset.qrcodeenable|0|
      |$.data.Asset.is_autoapprove|1|
      |$.data.Asset.is_smart_asset|0|
      |$.data.Asset.Asset_validation|0|
    And I post the request with "POST_assets_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Add asset without access token
    And I modify fields with random values and remove fields in "POST_assets_add" payload
      |JPath|Value|
      |$.data.Asset.name|randomString|
    And I post the request with "POST_assets_add" payload
    Then I should see the response code as "403"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_05 Add asset with invalid access token
    And I modify fields with random values and remove fields in "POST_assets_add" payload
      |JPath|Value|
      |$.data.Asset.name|randomString|
    And I post the request with "POST_assets_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title ""
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_06 Add asset with expired access token
    And I modify fields with random values and remove fields in "POST_assets_add" payload
      |JPath|Value|
      |$.data.Asset.name|randomString|
    And I post the request with "POST_assets_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title ""
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_07 Add asset with empty name
    And I modify fields with random values and remove fields in "POST_assets_add" payload
      |JPath|Value|
      |$.data.Asset.name||
    And I post the request with "POST_assets_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_08 Add asset with invalid asset_type_id
    And I modify fields with random values and remove fields in "POST_assets_add" payload
      |JPath|Value|
      |$.data.Asset.name|randomString|
      |$.data.Asset.asset_type_id|99999|
    And I post the request with "POST_assets_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_09 Add asset with invalid is_active value
    And I modify fields with random values and remove fields in "POST_assets_add" payload
      |JPath|Value|
      |$.data.Asset.name|randomString|
      |$.data.Asset.is_active|5|
    And I post the request with "POST_assets_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_10 Add asset with invalid qrcodeenable value
    And I modify fields with random values and remove fields in "POST_assets_add" payload
      |JPath|Value|
      |$.data.Asset.name|randomString|
      |$.data.Asset.qrcodeenable|5|
    And I post the request with "POST_assets_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_11 Add asset with invalid is_autoapprove value
    And I modify fields with random values and remove fields in "POST_assets_add" payload
      |JPath|Value|
      |$.data.Asset.name|randomString|
      |$.data.Asset.is_autoapprove|5|
    And I post the request with "POST_assets_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_12 Add asset with invalid is_smart_asset value
    And I modify fields with random values and remove fields in "POST_assets_add" payload
      |JPath|Value|
      |$.data.Asset.name|randomString|
      |$.data.Asset.is_smart_asset|5|
    And I post the request with "POST_assets_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_13 Add asset with XSS in name field
    And I modify fields with random values and remove fields in "POST_assets_add" payload
      |JPath|Value|
      |$.data.Asset.name|<script>alert('XSS')</script>|
    And I post the request with "POST_assets_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_14 Add asset with SQL injection in name field
    And I modify fields with random values and remove fields in "POST_assets_add" payload
      |JPath|Value|
      |$.data.Asset.name|'; DROP TABLE assets; --|
    And I post the request with "POST_assets_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_15 Add asset with missing required fields
    And I modify fields with random values and remove fields in "POST_assets_add" payload
      |JPath|Value|
      |$.data.Asset.name||
      |$.data.Asset.asset_type_id||
    And I post the request with "POST_assets_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"

    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_16 Add asset with null asset_type_id
    And I modify fields with random values and remove fields in "POST_assets_add" payload
      |JPath|Value|
      |$.data.Asset.name|randomString|
      |$.data.Asset.asset_type_id|null|
    And I post the request with "POST_assets_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_17 Add asset with invalid endpoint
    And I modify fields with random values and remove fields in "POST_assets_add" payload
      |JPath|Value|
      |$.data.Asset.name|randomString|
    And I post the request with "assets_add_invalid" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @DataIntegrity
  Scenario: TC_18 Validate asset data integrity after creation
    And I modify fields with random values and remove fields in "POST_assets_add" payload
      |JPath|Value|
      |$.data.Asset.name|randomString|
    And I post the request with "POST_assets_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify the data got updated as needed from DB
      |expectedColumn|expectedValue|
      |DB:assets:is_autoapprove:id = (SELECT MAX(id) FROM assets)|1|
     
      

  @Positive @Regression
  Scenario: TC_19 Regression test for add asset endpoint
    And I modify fields with random values and remove fields in "POST_assets_add" payload
      |JPath|Value|
      |$.data.Asset.name|randomString|
    And I post the request with "POST_assets_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_20 Validate asset business logic
    And I modify fields with random values and remove fields in "POST_assets_add" payload
      |JPath|Value|
      |$.data.Asset.name|randomString|
      |$.data.Asset.asset_type_id|1|
      |$.data.Asset.is_active|1|
      |$.data.Asset.qrcodeenable|0|
      |$.data.Asset.is_autoapprove|1|
      |$.data.Asset.is_smart_asset|0|
      |$.data.Asset.Asset_validation|0|
    And I post the request with "POST_assets_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify the data got updated as needed from DB
      |expectedColumn|expectedValue|
       |DB:assets:is_smart_asset:id = (SELECT MAX(id) FROM assets)|0|

  @Positive @Functional
  Scenario: TC_21 Add asset with optional fields populated
    And I modify fields with random values and remove fields in "POST_assets_add" payload
      |JPath|Value|
      |$.data.Asset.name|randomString|
      |$.data.Asset.erpno|randomString|
      |$.data.Asset.price|100.50|
      |$.data.Asset.description|randomString|
    And I post the request with "POST_assets_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
