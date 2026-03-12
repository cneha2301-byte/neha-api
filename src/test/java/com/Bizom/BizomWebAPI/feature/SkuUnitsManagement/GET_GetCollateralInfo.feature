@BizomWebAPI @SkuUnitsManagement @Collaterals @ProductManagement @OS
Feature: SKU Units Get Collateral Info API Testing
  As a system user
  I want to test the skunits getcollateralinfo endpoint
  So that I can ensure proper functionality and data retrieval for SKU collateral information

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get collateral info without access token
    When I send the GET request to "skunits_get_collateral_info" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get collateral info with invalid access token
#    And I send the GET request to "skunits_get_collateral_info" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|invalid_token_12345|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get collateral info with expired access token
#    And I send the GET request to "skunits_get_collateral_info" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|expired_token_12345|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get collateral info with malformed access token
#    And I send the GET request to "skunits_get_collateral_info" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|malformed.token.here|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

#  @Positive @Smoke
#  Scenario: Get collateral info with valid access token
#    And I send the GET request to "skunits_get_collateral_info" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason||
#    And I store the response as "collateral_info_response" name using full path

#  @Positive @DataValidation
#  Scenario: Validate collateral info response structure
#    And I send the GET request to "skunits_get_collateral_info" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason||
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|string|
#      |$.Reason|string|
#      |$.collaterals|array|
#      |$.collaterals[0]|object|
#      |$.collaterals[0].Collateral|object|
#      |$.collaterals[0].Collateral.id|string|
#      |$.collaterals[0].Collateral.name|string|
#      |$.collaterals[0].Collateral.type|string|
#      |$.collaterals[0].Collateral.url|string|
#      |$.collaterals[0].Collateral.thumbnailurl|string|
#      |$.collaterals[0].Collateral.skunit_id|string|
#      |$.collaterals[0].Collateral.collateral_types_id|string|
#      |$.collaterals[0].Collateral.collateral_type|string|
#      |$.collaterals[0].OutletType|object|
#      |$.collateralMappings|array|

#  @Positive @DataValidation
#  Scenario: Validate collateral info specific data values
#    And I send the GET request to "skunits_get_collateral_info" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason||
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.collaterals[0].Collateral.name|DB:collaterals:name: id=1|
#      |$.collaterals[0].Collateral.type|DB:collaterals:type: id=1|
#      |$.collaterals[1].Collateral.name|DB:collaterals:name: id=2|
#      |$.collaterals[1].Collateral.type|DB:collaterals:type: id=2|

#  @Positive @DataValidation
#  Scenario: Validate collateral info with static values
#    And I send the GET request to "skunits_get_collateral_info" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason||
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.collaterals[0].Collateral.id|"1"|
#      |$.collaterals[0].Collateral.name|Maaza|
#      |$.collaterals[0].Collateral.type|Category|
#      |$.collaterals[0].Collateral.skunit_id|"2"|
#      |$.collaterals[0].Collateral.collateral_type|IMAGE|
#      |$.collaterals[1].Collateral.id|"2"|
#      |$.collaterals[1].Collateral.name|cuba|
#      |$.collaterals[1].Collateral.type|Category|
#      |$.collaterals[1].Collateral.skunit_id|"1"|
#      |$.collaterals[1].Collateral.collateral_type|IMAGE|

#  @Positive @Performance
#  Scenario: Performance test for collateral info endpoint
#    And I send the GET request to "skunits_get_collateral_info" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason||

#  @Positive @Concurrency
#  Scenario: Concurrent access test for collateral info endpoint
#    And I send the GET request to "skunits_get_collateral_info" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason||
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|string|
#      |$.Reason|string|
#      |$.collaterals|array|
#      |$.collaterals[0].Collateral|object|
#      |$.collaterals[0].OutletType|object|
#      |$.collateralMappings|array|

#  @Negative @Validation
#  Scenario: Get collateral info with invalid query parameters
#    And I send the GET request to "skunits_get_collateral_info" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |invalid_param|invalid_value|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason||

#  @Negative @Validation
#  Scenario: Get collateral info with special characters in query parameters
#    And I send the GET request to "skunits_get_collateral_info" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason||

#  @Negative @Security
#  Scenario: Get collateral info with SQL injection attempt
#    And I send the GET request to "skunits_get_collateral_info" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|'; DROP TABLE collaterals; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason||

#  @Negative @Boundary
#  Scenario: Get collateral info with maximum query parameters
#    And I send the GET request to "skunits_get_collateral_info" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |param1|value1|
#      |param2|value2|
#      |param3|value3|
#      |param4|value4|
#      |param5|value5|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason||

#  @Negative @ErrorHandling
#  Scenario: Get collateral info with invalid endpoint
#    And I send the GET request to "skunits_get_collateral_info_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

#  @Positive @BusinessLogic
#  Scenario: Validate collateral info business logic
#    And I send the GET request to "skunits_get_collateral_info" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason||
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|string|
#      |$.Reason|string|
#      |$.collaterals|array|
#      |$.collaterals[0].Collateral|object|
#      |$.collaterals[0].OutletType|object|
#      |$.collateralMappings|array|

  @Positive @DataIntegrity
  Scenario: Validate collateral info data integrity
    And I send the GET request to "skunits_get_collateral_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.collaterals|array|
      |$.collaterals[0].Collateral|object|
      |$.collaterals[0].Collateral.id|string|
      |$.collaterals[0].Collateral.name|string|
      |$.collaterals[0].Collateral.type|string|
      |$.collaterals[0].Collateral.url|string|
      |$.collaterals[0].Collateral.thumbnailurl|string|
      |$.collaterals[0].Collateral.skunit_id|string|
      |$.collaterals[0].Collateral.collateral_types_id|string|
      |$.collaterals[0].Collateral.collateral_type|string|
      |$.collaterals[0].OutletType|object|
      |$.collateralMappings|array|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |collaterals|
      |Collateral|
      |OutletType|
      |collateralMappings|
      |Maaza|
      |cuba|
      |Category|
      |IMAGE|

#  @Positive @Regression
#  Scenario: Regression test for collateral info endpoint
#    And I send the GET request to "skunits_get_collateral_info" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason||
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|string|
#      |$.Reason|string|
#      |$.collaterals|array|
#      |$.collaterals[0].Collateral|object|
#      |$.collaterals[0].OutletType|object|
#      |$.collateralMappings|array|

  @Positive @Functional
  Scenario: Validate collateral info response completeness
    And I send the GET request to "skunits_get_collateral_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.collaterals|array|
      |$.collaterals[0].Collateral|object|
      |$.collaterals[0].Collateral.id|string|
      |$.collaterals[0].Collateral.name|string|
      |$.collaterals[0].Collateral.type|string|
      |$.collaterals[0].Collateral.url|string|
      |$.collaterals[0].Collateral.thumbnailurl|string|
      |$.collaterals[0].Collateral.skunit_id|string|
      |$.collaterals[0].Collateral.collateral_types_id|string|
      |$.collaterals[0].Collateral.collateral_type|string|
      |$.collaterals[0].OutletType|object|
      |$.collateralMappings|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.collaterals[0].Collateral.id|"1"|
      |$.collaterals[0].Collateral.name|Maaza|
      |$.collaterals[0].Collateral.type|Category|
      |$.collaterals[0].Collateral.skunit_id|"2"|
      |$.collaterals[0].Collateral.collateral_type|IMAGE|
      |$.collaterals[1].Collateral.id|"2"|
      |$.collaterals[1].Collateral.name|cuba|
      |$.collaterals[1].Collateral.type|Category|
      |$.collaterals[1].Collateral.skunit_id|"1"|
      |$.collaterals[1].Collateral.collateral_type|IMAGE|

#  @Positive @ArrayValidation
#  Scenario: Validate collateral info array structure and content
#    And I send the GET request to "skunits_get_collateral_info" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason||
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.collaterals|array|
#      |$.collaterals[0]|object|
#      |$.collaterals[0].Collateral|object|
#      |$.collaterals[0].OutletType|object|
#      |$.collaterals[1]|object|
#      |$.collaterals[1].Collateral|object|
#      |$.collaterals[1].OutletType|object|
#      |$.collateralMappings|array|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.collaterals[0].Collateral.id|"1"|
#      |$.collaterals[0].Collateral.name|Maaza|
#      |$.collaterals[0].Collateral.type|Category|
#      |$.collaterals[1].Collateral.id|"2"|
#      |$.collaterals[1].Collateral.name|cuba|
#      |$.collaterals[1].Collateral.type|Category|

#  @Positive @ContentValidation
#  Scenario: Validate collateral info content structure
#    And I send the GET request to "skunits_get_collateral_info" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason||
#    And validating the response contains the following values
#      |Value|
#      |Result|
#      |Reason|
#      |collaterals|
#      |Collateral|
#      |OutletType|
#      |collateralMappings|
#      |id|
#      |name|
#      |type|
#      |url|
#      |thumbnailurl|
#      |skunit_id|
#      |collateral_type|
#      |Maaza|
#      |cuba|
#      |Category|
#      |IMAGE|

#  @Positive @LoadTesting
#  Scenario: Load testing for collateral info endpoint
#    And I send the GET request to "skunits_get_collateral_info" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "3000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason||

#  @Negative @Timeout
#  Scenario: Test collateral info endpoint timeout handling
#    And I send the GET request to "skunits_get_collateral_info" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "5000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason||

#  @Positive @EndToEnd
#  Scenario: End-to-end collateral info data retrieval workflow
#    And I send the GET request to "skunits_get_collateral_info" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason||
#    And I store the response as "collateral_info_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|string|
#      |$.Reason|string|
#      |$.collaterals|array|
#      |$.collaterals[0].Collateral|object|
#      |$.collaterals[0].Collateral.id|string|
#      |$.collaterals[0].Collateral.name|string|
#      |$.collaterals[0].Collateral.type|string|
#      |$.collaterals[0].Collateral.url|string|
#      |$.collaterals[0].Collateral.thumbnailurl|string|
#      |$.collaterals[0].Collateral.skunit_id|string|
#      |$.collaterals[0].Collateral.collateral_types_id|string|
#      |$.collaterals[0].Collateral.collateral_type|string|
#      |$.collaterals[0].OutletType|object|
#      |$.collateralMappings|array|
#    And validating the response contains the following values
#      |Value|
#      |Result|
#      |Reason|
#      |collaterals|
#      |Collateral|
#      |OutletType|
#      |collateralMappings|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.collaterals[0].Collateral.id|"1"|
#      |$.collaterals[0].Collateral.name|Maaza|
#      |$.collaterals[0].Collateral.type|Category|
#      |$.collaterals[0].Collateral.skunit_id|"2"|
#      |$.collaterals[0].Collateral.collateral_type|IMAGE|
#      |$.collaterals[1].Collateral.id|"2"|
#      |$.collaterals[1].Collateral.name|cuba|
#      |$.collaterals[1].Collateral.type|Category|
#      |$.collaterals[1].Collateral.skunit_id|"1"|
#      |$.collaterals[1].Collateral.collateral_type|IMAGE|

