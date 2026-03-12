@BizomWebAPI @CE @IncentiveConfigurationsManagement @IncentiveConfigurations @GetIncentiveConfigurationsForOutlet @SystemIntegration
Feature: Get Incentive Configurations For Outlet API Testing
  As a system user
  I want to test the get incentive configurations for outlet endpoint
  So that I can ensure proper functionality and data retrieval for incentive configurations

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get incentive configurations for outlet without access token
    When I send the GET request to "incentiveconfigurations_get_incentive_configurations_for_outlet" endpoint with path parameters
      |Path|Value|
      |outletId|5|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get incentive configurations for outlet with invalid access token
#    And I send the GET request to "incentiveconfigurations_get_incentive_configurations_for_outlet" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|invalid_token_12345|outletId|5|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get incentive configurations for outlet with expired access token
#    And I send the GET request to "incentiveconfigurations_get_incentive_configurations_for_outlet" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|expired_token_12345|outletId|5|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get incentive configurations for outlet with malformed access token
#    And I send the GET request to "incentiveconfigurations_get_incentive_configurations_for_outlet" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|malformed.token.here|outletId|5|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: Get incentive configurations for outlet ID 5 with valid access token
    And I send the GET request to "incentiveconfigurations_get_incentive_configurations_for_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|5|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|The setting: isIncentiveModuleEnabled is not enabled.|
      |$.Redirect|users/dashboard|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Redirect|string|
      |$.incentiveConfigurationEntityMappings|array|
      |$.incentiveConfiguration|array|

  @Positive @Functional
  Scenario: Get incentive configurations for outlet ID 1 with valid access token
    And I send the GET request to "incentiveconfigurations_get_incentive_configurations_for_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Redirect|string|
      |$.incentiveConfigurationEntityMappings|array|
      |$.incentiveConfiguration|array|

  @Positive @Functional
  Scenario: Get incentive configurations for outlet ID 10 with valid access token
    And I send the GET request to "incentiveconfigurations_get_incentive_configurations_for_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|10|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Redirect|string|
      |$.incentiveConfigurationEntityMappings|array|
      |$.incentiveConfiguration|array|

  @Negative @Validation
  Scenario: Get incentive configurations for outlet with invalid outlet ID
    And I send the GET request to "incentiveconfigurations_get_incentive_configurations_for_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Redirect|string|
      |$.incentiveConfigurationEntityMappings|array|
      |$.incentiveConfiguration|array|

  @Negative @Validation
  Scenario: Get incentive configurations for outlet with non-existent outlet ID
    And I send the GET request to "incentiveconfigurations_get_incentive_configurations_for_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Redirect|string|
      |$.incentiveConfigurationEntityMappings|array|
      |$.incentiveConfiguration|array|

  @Negative @Validation
  Scenario: Get incentive configurations for outlet with negative outlet ID
    And I send the GET request to "incentiveconfigurations_get_incentive_configurations_for_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Redirect|string|
      |$.incentiveConfigurationEntityMappings|array|
      |$.incentiveConfiguration|array|

  @Negative @Validation
  Scenario: Get incentive configurations for outlet with zero outlet ID
    And I send the GET request to "incentiveconfigurations_get_incentive_configurations_for_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Redirect|string|
      |$.incentiveConfigurationEntityMappings|array|
      |$.incentiveConfiguration|array|

#  @Negative @ErrorHandling
#  Scenario: Get incentive configurations for outlet with invalid endpoint
#    And I send the GET request to "incentiveconfigurations_get_incentive_configurations_for_outlet_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|outletId|5|
#    Then I should see the response code as "404"
#    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance test for get incentive configurations for outlet endpoint
    And I send the GET request to "incentiveconfigurations_get_incentive_configurations_for_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|5|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Regression
  Scenario: Regression test for get incentive configurations for outlet endpoint
    And I send the GET request to "incentiveconfigurations_get_incentive_configurations_for_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|5|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|The setting: isIncentiveModuleEnabled is not enabled.|
      |$.Redirect|users/dashboard|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Redirect|string|
      |$.incentiveConfigurationEntityMappings|array|
      |$.incentiveConfiguration|array|

  @Positive @DataValidation
  Scenario: Validate response structure for get incentive configurations for outlet
    And I send the GET request to "incentiveconfigurations_get_incentive_configurations_for_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|5|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Redirect|string|
      |$.incentiveConfigurationEntityMappings|array|
      |$.incentiveConfiguration|array|
    And I store the response as "getIncentiveConfigurationsForOutlet_response" name using full path

  @Positive @Smoke
  Scenario: Get incentive configurations for outlet ID 5 with valid access token - verify arrays are empty when module disabled
    And I send the GET request to "incentiveconfigurations_get_incentive_configurations_for_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|5|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|The setting: isIncentiveModuleEnabled is not enabled.|
      |$.Redirect|users/dashboard|
      |$.incentiveConfigurationEntityMappings|[]|
      |$.incentiveConfiguration|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Redirect|string|
      |$.incentiveConfigurationEntityMappings|array|
      |$.incentiveConfiguration|array|


