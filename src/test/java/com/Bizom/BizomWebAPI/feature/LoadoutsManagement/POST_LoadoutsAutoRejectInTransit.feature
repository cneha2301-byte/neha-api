@BizomWebAPI @LoadoutsManagement @AutoRejectInTransit @Execution @allPost
Feature: Loadouts Auto Reject In Transit API Testing
  As a loadout operations user
  I want to test the /loadouts/autorejectintrasit endpoint
  So that in-transit loadouts can be rejected automatically with proper validation

  # Related setting: feature_loadout_setting (should be set to 1 for positive response)
  # Database table: settings
  # To enable: UPDATE settings SET value = 1 WHERE name = 'feature_loadout_setting'

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      | origin                    | https://devuitest.bizomdev.in|
      | priority                  | u=0, i|
      | referer                   | https://devuitest.bizomdev.in/loadouts/manage|
      |X-Requested-With|XMLHttpRequest|
      |User-Agent|Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36|
      |Accept|application/json, text/javascript, */*; q=0.01|

  @Negative @Security
  Scenario: TC_01 Auto reject in transit without access token
    And I post the request with "POST_LoadoutsAutoRejectInTransit" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token||
    Then I should see the response code as "403"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Auto reject in transit with invalid access token
    And I post the request with "POST_LoadoutsAutoRejectInTransit" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Auto reject in transit with expired access token
    And I post the request with "POST_LoadoutsAutoRejectInTransit" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Auto reject in transit with malformed access token
    And I post the request with "POST_LoadoutsAutoRejectInTransit" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @SettingDisabled @DBValidation
  Scenario: TC_05 Auto reject in transit with valid request but setting is disabled (feature_loadout_setting=0)
    Given I update the following columns in "settings" table where "name='feature_loadout_setting'"
      | column | value |
      | value  | 0     |
    And I verify the data got updated as needed from DB
      |expectedColumn |expectedValue |
      |DB:settings:value:name='feature_loadout_setting' |0 |
    And I post the request with "POST_LoadoutsAutoRejectInTransit" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Future Loadout setting is not enable for the user/company|
    And I store the response as "autorejectintransit_disabled_response" name using full path

  @Positive @Smoke @SettingEnabled @DBValidation
  Scenario: TC_06 Auto reject in transit with valid request and setting is enabled (feature_loadout_setting=1)
    Given I update the following columns in "settings" table where "name='feature_loadout_setting'"
      | column | value |
      | value  | 1     |
    And I verify the data got updated as needed from DB
      |expectedColumn |expectedValue |
      |DB:settings:value:name='feature_loadout_setting' |1 |
    And I post the request with "POST_LoadoutsAutoRejectInTransit" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "autorejectintransit_enabled_response" name using full path

  @Positive @DataValidation @SettingEnabled @DBValidation
  Scenario: TC_07 Validate auto reject in transit response structure when setting is enabled
    Given I update the following columns in "settings" table where "name='feature_loadout_setting'"
      | column | value |
      | value  | 1     |
    And I verify the data got updated as needed from DB
      |expectedColumn |expectedValue |
      |DB:settings:value:name='feature_loadout_setting' |1 |
    And I post the request with "POST_LoadoutsAutoRejectInTransit" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|

  @Negative @DataValidation @SettingDisabled @DBValidation
  Scenario: TC_08 Validate auto reject in transit response structure when setting is disabled
    Given I update the following columns in "settings" table where "name='feature_loadout_setting'"
      | column | value |
      | value  | 0     |
    And I verify the data got updated as needed from DB
      |expectedColumn |expectedValue |
      |DB:settings:value:name='feature_loadout_setting' |0 |
    And I post the request with "POST_LoadoutsAutoRejectInTransit" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Future Loadout setting is not enable for the user/company|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @Performance @SettingEnabled @DBValidation
  Scenario: TC_09 Performance test for auto reject in transit endpoint with setting enabled
    Given I update the following columns in "settings" table where "name='feature_loadout_setting'"
      | column | value |
      | value  | 1     |
    And I verify the data got updated as needed from DB
      |expectedColumn |expectedValue |
      |DB:settings:value:name='feature_loadout_setting' |1 |
    And I post the request with "POST_LoadoutsAutoRejectInTransit" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds


  @Negative @Performance @SettingDisabled @DBValidation
  Scenario: TC_10 Performance test for auto reject in transit endpoint with setting disabled
    Given I update the following columns in "settings" table where "name='feature_loadout_setting'"
      | column | value |
      | value  | 0     |
    And I verify the data got updated as needed from DB
      |expectedColumn |expectedValue |
      |DB:settings:value:name='feature_loadout_setting' |0 |
    And I post the request with "POST_LoadoutsAutoRejectInTransit" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Future Loadout setting is not enable for the user/company|