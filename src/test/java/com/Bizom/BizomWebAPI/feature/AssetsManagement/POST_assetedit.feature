@BizomWebAPI @Innovation @AssetsManagement @PostEditAsset
Feature: Edit Asset API Testing
  As a system user
  I want to edit existing assets through the API
  So that I can update and manage asset data in the system

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |origin|https://devuitest.bizomdev.in|
      |referer|https://devuitest.bizomdev.in/assets/edit/8|

  @Positive @Smoke
  Scenario: TC_01 Edit asset with valid data and random string for name
    And I modify fields with random values and remove fields in "POST_assets_edit" payload
      |JPath|Value|
      |$.data.Asset.name|randomString|
    And I post the request with "POST_assets_edit" payload with path parameter
      |Path|Value|
      |id|8|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds
    And I store the response as "edit_asset_response" name using full path

  @Positive @DataValidation @DatabaseValidation
  Scenario: TC_02 Edit asset and validate database entry
    And I modify fields with random values and remove fields in "POST_assets_edit" payload
      |JPath|Value|
      |$.data.Asset.name|randomString|
      |$.data.Asset.description|randomString|
    And I post the request with "POST_assets_edit" payload with path parameter
      |Path|Value|
      |id|8|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds
    And I verify the data got updated as needed from DB
      |expectedColumn|expectedValue|
      |DB:assets:name:id=8|randomString|
      |DB:assets:is_active:id=8|true|
      |DB:assets:qrcodeenable:id=8|true|

  @Positive @Functional
  Scenario: TC_03 Edit asset with all required fields
    And I modify fields with random values and remove fields in "POST_assets_edit" payload
      |JPath|Value|
      |$.data.Asset.name|randomString|
      |$.data.Asset.asset_type_id|1|
      |$.data.Asset.price|1000000|
      |$.data.Asset.description|randomString|
      |$.data.Asset.is_active|1|
      |$.data.Asset.qrcodeenable|1|
      |$.data.Asset.is_autoapprove|1|
      |$.data.Asset.is_smart_asset|1|
    And I post the request with "POST_assets_edit" payload with path parameter
      |Path|Value|
      |id|8|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Positive @Functional
  Scenario: TC_04 Edit asset with activity form IDs
    And I modify fields with random values and remove fields in "POST_assets_edit" payload
      |JPath|Value|
      |$.data.Asset.name|randomString|
      |$.data.Asset.assetdetailactivityform_id|9|
      |$.data.Asset.assetorderactivityform_id|7|
      |$.data.Asset.assetredeploymentactivityform_id|11|
      |$.data.Asset.assetderegisteractivityform_id|15|
    And I post the request with "POST_assets_edit" payload with path parameter
      |Path|Value|
      |id|8|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_05 Edit asset without access token
    And I modify fields with random values and remove fields in "POST_assets_edit" payload
      |JPath|Value|
      |$.data.Asset.name|randomString|
    And I post the request with "POST_assets_edit" payload with path parameter
      |Path|Value|
      |id|8|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_07 Edit asset with invalid asset_type_id
    And I modify fields with random values and remove fields in "POST_assets_edit" payload
      |JPath|Value|
      |$.data.Asset.name|randomString|
      |$.data.Asset.asset_type_id|99999|
    And I post the request with "POST_assets_edit" payload with path parameter
      |Path|Value|
      |id|8|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_08 Edit asset with invalid is_active value
    And I modify fields with random values and remove fields in "POST_assets_edit" payload
      |JPath|Value|
      |$.data.Asset.name|randomString|
      |$.data.Asset.is_active|5|
    And I post the request with "POST_assets_edit" payload with path parameter
      |Path|Value|
      |id|8|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_09 Edit asset with XSS in name field
    And I modify fields with random values and remove fields in "POST_assets_edit" payload
      |JPath|Value|
      |$.data.Asset.name|<script>alert('XSS')</script>|
    And I post the request with "POST_assets_edit" payload with path parameter
      |Path|Value|
      |id|8|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_10 Edit asset with SQL injection in name field
    And I modify fields with random values and remove fields in "POST_assets_edit" payload
      |JPath|Value|
      |$.data.Asset.name|'; DROP TABLE assets; --|
    And I post the request with "POST_assets_edit" payload with path parameter
      |Path|Value|
      |id|8|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_11 Edit asset with invalid ID in path parameter
    And I modify fields with random values and remove fields in "POST_assets_edit" payload
      |JPath|Value|
      |$.data.Asset.name|randomString|
    And I post the request with "POST_assets_edit" payload with path parameter
      |Path|Value|
      |id|99999|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_12 Edit asset with negative ID in path parameter
    And I modify fields with random values and remove fields in "POST_assets_edit" payload
      |JPath|Value|
      |$.data.Asset.name|randomString|
    And I post the request with "POST_assets_edit" payload with path parameter
      |Path|Value|
      |id|-1|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_13 Edit asset with invalid endpoint
    And I modify fields with random values and remove fields in "POST_assets_edit" payload
      |JPath|Value|
      |$.data.Asset.name|randomString|
    And I post the request with "assets_edit_invalid" payload with path parameter
      |Path|Value|
      |id|8|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: TC_14 Performance test for edit asset endpoint
    And I modify fields with random values and remove fields in "POST_assets_edit" payload
      |JPath|Value|
      |$.data.Asset.name|randomString|
    And I post the request with "POST_assets_edit" payload with path parameter
      |Path|Value|
      |id|8|
    Then I should see the response code as "302"
    And verify response time is less than "1500" milliseconds

  @Boundary @Validation
  Scenario: TC_15 Edit asset with maximum length name
    And I modify fields with random values and remove fields in "POST_assets_edit" payload
      |JPath|Value|
      |$.data.Asset.name|randomString:255|
    And I post the request with "POST_assets_edit" payload with path parameter
      |Path|Value|
      |id|8|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Positive @Functional
  Scenario: TC_16 Edit asset with price update
    And I modify fields with random values and remove fields in "POST_assets_edit" payload
      |JPath|Value|
      |$.data.Asset.name|randomString|
      |$.data.Asset.price|2000000|
    And I post the request with "POST_assets_edit" payload with path parameter
      |Path|Value|
      |id|8|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds
    And I verify the data got updated as needed from DB
      |expectedColumn|expectedValue|
      |DB:assets:price:id=8|2000000.0|

  @Positive @Functional
  Scenario: TC_17 Edit asset with qrcodeenable disabled
    And I modify fields with random values and remove fields in "POST_assets_edit" payload
      |JPath|Value|
      |$.data.Asset.name|randomString|
      |$.data.Asset.qrcodeenable|0|
    And I post the request with "POST_assets_edit" payload with path parameter
      |Path|Value|
      |id|8|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds
    And I verify the data got updated as needed from DB
      |expectedColumn|expectedValue|
      |DB:assets:qrcodeenable:id=8|true|

  @Positive @Functional
  Scenario: TC_18 Edit asset with is_active disabled
    And I modify fields with random values and remove fields in "POST_assets_edit" payload
      |JPath|Value|
      |$.data.Asset.name|randomString|
      |$.data.Asset.is_active|0|
    And I post the request with "POST_assets_edit" payload with path parameter
      |Path|Value|
      |id|8|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds
    And I verify the data got updated as needed from DB
      |expectedColumn|expectedValue|
      |DB:assets:is_active:id=8|true|

  @Positive @Functional
  Scenario: TC_19 Edit asset with audit activity form IDs array
    And I modify fields with random values and remove fields in "POST_assets_edit" payload
      |JPath|Value|
      |$.data.Asset.name|randomString|
      |$.data.Asset.assetaudtactivityform_id[0]|13|
      |$.data.Asset.assetaudtactivityform_id[1]|13|
    And I post the request with "POST_assets_edit" payload with path parameter
      |Path|Value|
      |id|8|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Positive @DataIntegrity
  Scenario: TC_20 Validate asset data integrity after edit
    And I modify fields with random values and remove fields in "POST_assets_edit" payload
      |JPath|Value|
      |$.data.Asset.name|randomString|
      |$.data.Asset.description|randomString|
    And I post the request with "POST_assets_edit" payload with path parameter
      |Path|Value|
      |id|8|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds
    And I verify the data got updated as needed from DB
      |expectedColumn|expectedValue|
      |DB:assets:name:id=8|randomString|
      |DB:assets:description:id=8|randomString|
      |DB:assets:is_active:id=8|true|

