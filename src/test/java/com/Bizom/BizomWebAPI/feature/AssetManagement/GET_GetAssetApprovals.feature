@BizomWebAPI @Innovation @AssetManagement @GetAssetApprovals @CoreBusinessOperations
Feature: Get Asset Approvals API Testing
  As a Bizom web API consumer
  I want to validate the get asset approvals endpoint
  So that I can ensure asset approval data is fetched correctly

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get asset approvals without access token
    When I send the GET request to "assetorders_get_asset_approvals" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token||
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get asset approvals with invalid access token
    And I send the GET request to "assetorders_get_asset_approvals" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get asset approvals with expired access token
    And I send the GET request to "assetorders_get_asset_approvals" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get asset approvals with malformed access token
    And I send the GET request to "assetorders_get_asset_approvals" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get asset approvals with valid request
    And I send the GET request to "assetorders_get_asset_approvals" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.AssetDetailRequests|[]|
      |$.AssetOrderRequests|[]|
      |$.Activityformdatas|[]|
      |$.AssetMultilevelOrderRequests|[]|
      |$.AssetMultilevelDetailRequests|[]|
      |$.AssetOrderAllApprovalRequests|[]|
      |$.AssetAllRedeploymentRequests|[]|
      |$.orderCreatorData|[]|
      |$.redeploymentcreatorData|[]|
    And I store the response as "getAssetApprovals_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate asset approvals response structure
    And I send the GET request to "assetorders_get_asset_approvals" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|Value|
      |$.Result|boolean|
      |$.AssetDetailRequests|array|
      |$.AssetOrderRequests|array|
      |$.Activityformdatas|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate asset approvals array structures
    And I send the GET request to "assetorders_get_asset_approvals" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.AssetDetailRequests|[]|
      |$.AssetOrderRequests|[]|
      |$.Activityformdatas|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.AssetDetailRequests|array|
      |$.AssetOrderRequests|array|
      |$.Activityformdatas|array|
      |$.AssetMultilevelOrderRequests|array|
      |$.AssetMultilevelDetailRequests|array|
      |$.AssetOrderAllApprovalRequests|array|
      |$.AssetAllRedeploymentRequests|array|
      |$.orderCreatorData|array|
      |$.redeploymentcreatorData|array|

  @Positive @Performance
  Scenario: TC_08 Performance test for get asset approvals endpoint
    And I send the GET request to "assetorders_get_asset_approvals" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @Concurrency
  Scenario: TC_09 Concurrent access test for get asset approvals endpoint
    And I send the GET request to "assetorders_get_asset_approvals" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_10 Get asset approvals with invalid query parameters
    And I send the GET request to "assetorders_get_asset_approvals" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_11 Get asset approvals with special characters in query parameters
    And I send the GET request to "assetorders_get_asset_approvals" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Security
  Scenario: TC_12 Get asset approvals with SQL injection attempt
    And I send the GET request to "assetorders_get_asset_approvals" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE assetorders; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Boundary
  Scenario: TC_13 Get asset approvals with maximum query parameters
    And I send the GET request to "assetorders_get_asset_approvals" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @ErrorHandling
  Scenario: TC_14 Get asset approvals with invalid endpoint
    And I send the GET request to "assetorders_get_asset_approvals_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_15 Validate asset approvals business logic
    And I send the GET request to "assetorders_get_asset_approvals" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.AssetDetailRequests|[]|
      |$.AssetOrderRequests|[]|
      |$.Activityformdatas|[]|
      |$.AssetMultilevelOrderRequests|[]|
      |$.AssetMultilevelDetailRequests|[]|
      |$.AssetOrderAllApprovalRequests|[]|
      |$.AssetAllRedeploymentRequests|[]|
      |$.orderCreatorData|[]|
      |$.redeploymentcreatorData|[]|

  @Positive @DataIntegrity
  Scenario: TC_16 Validate asset approvals data integrity
    And I send the GET request to "assetorders_get_asset_approvals" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.AssetDetailRequests|array|
      |$.AssetOrderRequests|array|
      |$.Activityformdatas|array|
      |$.AssetMultilevelOrderRequests|array|
      |$.AssetMultilevelDetailRequests|array|
      |$.AssetOrderAllApprovalRequests|array|
      |$.AssetAllRedeploymentRequests|array|
      |$.orderCreatorData|array|
      |$.redeploymentcreatorData|array|

  @Positive @Regression
  Scenario: TC_17 Regression test for get asset approvals endpoint
    And I send the GET request to "assetorders_get_asset_approvals" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.AssetDetailRequests|[]|
      |$.AssetOrderRequests|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.AssetDetailRequests|array|
      |$.AssetOrderRequests|array|
      |$.Activityformdatas|array|
      |$.AssetMultilevelOrderRequests|array|
      |$.AssetMultilevelDetailRequests|array|
      |$.AssetOrderAllApprovalRequests|array|
      |$.AssetAllRedeploymentRequests|array|
      |$.orderCreatorData|array|
      |$.redeploymentcreatorData|array|

  @Positive @Functional
  Scenario: TC_18 Validate asset approvals response completeness
    And I send the GET request to "assetorders_get_asset_approvals" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.AssetDetailRequests|[]|
      |$.AssetOrderRequests|[]|
      |$.Activityformdatas|[]|
      |$.AssetMultilevelOrderRequests|[]|
      |$.AssetMultilevelDetailRequests|[]|
      |$.AssetOrderAllApprovalRequests|[]|
      |$.AssetAllRedeploymentRequests|[]|
      |$.orderCreatorData|[]|
      |$.redeploymentcreatorData|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.AssetDetailRequests|array|
      |$.AssetOrderRequests|array|
      |$.Activityformdatas|array|

  @Positive @ArrayValidation
  Scenario: TC_19 Validate asset approvals array structure and content
    And I send the GET request to "assetorders_get_asset_approvals" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.AssetDetailRequests|[]|
      |$.AssetOrderRequests|[]|
      |$.Activityformdatas|[]|
      |$.AssetMultilevelOrderRequests|[]|
      |$.AssetMultilevelDetailRequests|[]|
      |$.AssetOrderAllApprovalRequests|[]|
      |$.AssetAllRedeploymentRequests|[]|
      |$.orderCreatorData|[]|
      |$.redeploymentcreatorData|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.AssetDetailRequests|array|
      |$.AssetOrderRequests|array|
      |$.Activityformdatas|array|
      |$.AssetMultilevelOrderRequests|array|
      |$.AssetMultilevelDetailRequests|array|
      |$.AssetOrderAllApprovalRequests|array|
      |$.AssetAllRedeploymentRequests|array|
      |$.orderCreatorData|array|
      |$.redeploymentcreatorData|array|

  @Positive @ContentValidation
  Scenario: TC_20 Validate asset approvals content structure
    And I send the GET request to "assetorders_get_asset_approvals" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |AssetDetailRequests|
      |AssetOrderRequests|
      |Activityformdatas|
      |AssetMultilevelOrderRequests|
      |AssetMultilevelDetailRequests|
      |AssetOrderAllApprovalRequests|
      |AssetAllRedeploymentRequests|
      |orderCreatorData|
      |redeploymentcreatorData|

  @Positive @LoadTesting
  Scenario: TC_21 Load testing for get asset approvals endpoint
    And I send the GET request to "assetorders_get_asset_approvals" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Timeout
  Scenario: TC_22 Test get asset approvals endpoint timeout handling
    And I send the GET request to "assetorders_get_asset_approvals" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @EndToEnd
  Scenario: TC_23 End-to-end get asset approvals data retrieval workflow
    And I send the GET request to "assetorders_get_asset_approvals" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.AssetDetailRequests|[]|
      |$.AssetOrderRequests|[]|
      |$.Activityformdatas|[]|
      |$.AssetMultilevelOrderRequests|[]|
      |$.AssetMultilevelDetailRequests|[]|
      |$.AssetOrderAllApprovalRequests|[]|
      |$.AssetAllRedeploymentRequests|[]|
      |$.orderCreatorData|[]|
      |$.redeploymentcreatorData|[]|
    And I store the response as "getAssetApprovals_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.AssetDetailRequests|array|
      |$.AssetOrderRequests|array|
      |$.Activityformdatas|array|
      |$.AssetMultilevelOrderRequests|array|
      |$.AssetMultilevelDetailRequests|array|
      |$.AssetOrderAllApprovalRequests|array|
      |$.AssetAllRedeploymentRequests|array|
      |$.orderCreatorData|array|
      |$.redeploymentcreatorData|array|

