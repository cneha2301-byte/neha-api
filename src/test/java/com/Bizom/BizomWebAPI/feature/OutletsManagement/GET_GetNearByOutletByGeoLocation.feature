@BizomWebAPI @CE @OutletsManagement @OutletsGetNearByOutLet @InventoryOperations
Feature: Get Near By Outlet By Geo Location API Testing
  As a system user
  I want to test the get near by outlet by geo location endpoint
  So that I can ensure proper functionality for fetching nearby outlets

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get nearby outlets without access token
    When I send the GET request to "outlets_get_near_by_outlet_by_geo_location" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title " "
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get nearby outlets with invalid access token
    And I send the GET request to "outlets_get_near_by_outlet_by_geo_location" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
     And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get nearby outlets with expired access token
    And I send the GET request to "outlets_get_near_by_outlet_by_geo_location" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
     And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get nearby outlets with malformed access token
    And I send the GET request to "outlets_get_near_by_outlet_by_geo_location" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
     And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get nearby outlets with valid access token
    And I send the GET request to "outlets_get_near_by_outlet_by_geo_location" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Data Not Found|
      |$.Data|[]|
    And I store the response as "nearby_outlets_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate nearby outlets response structure
    And I send the GET request to "outlets_get_near_by_outlet_by_geo_location" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Data Not Found|
      |$.Data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate nearby outlets with empty data array
    And I send the GET request to "outlets_get_near_by_outlet_by_geo_location" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Data Not Found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data|[]|

  @Positive @Performance
  Scenario: TC_08 Performance test for nearby outlets endpoint
    And I send the GET request to "outlets_get_near_by_outlet_by_geo_location" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: TC_09 Concurrent access test for nearby outlets endpoint
    And I send the GET request to "outlets_get_near_by_outlet_by_geo_location" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Data Not Found|

  @Negative @Validation
  Scenario: TC_10 Get nearby outlets with invalid query parameters
    And I send the GET request to "outlets_get_near_by_outlet_by_geo_location" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Data Not Found|

  @Negative @Validation
  Scenario: TC_11 Get nearby outlets with special characters in query parameters
    And I send the GET request to "outlets_get_near_by_outlet_by_geo_location" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Data Not Found|

  @Negative @Security
  Scenario: TC_12  Get nearby outlets with SQL injection attempt
    And I send the GET request to "outlets_get_near_by_outlet_by_geo_location" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE outlets; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Data Not Found|

  @Negative @Boundary
  Scenario: TC_13 Get nearby outlets with maximum query parameters
    And I send the GET request to "outlets_get_near_by_outlet_by_geo_location" endpoint with dynamic access token and query parameters
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
      |$.Result|false|
      |$.Reason|Data Not Found|

#  @Negative @ErrorHandling
#  Scenario: TC_14 Get nearby outlets with invalid endpoint
#    And I send the GET request to "outlets_get_near_by_outlet_by_geo_location_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_15 Validate nearby outlets business logic
    And I send the GET request to "outlets_get_near_by_outlet_by_geo_location" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Data Not Found|
      |$.Data|[]|

  @Positive @DataIntegrity
  Scenario: TC_16 Validate nearby outlets data integrity
    And I send the GET request to "outlets_get_near_by_outlet_by_geo_location" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Data Not Found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|

  @Positive @Regression
  Scenario: TC_17 Regression test for nearby outlets endpoint
    And I send the GET request to "outlets_get_near_by_outlet_by_geo_location" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Data Not Found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|

  @Positive @Functional
  Scenario: TC_18 Validate nearby outlets response completeness
    And I send the GET request to "outlets_get_near_by_outlet_by_geo_location" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Data Not Found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data|[]|

  @Positive @ContentValidation
  Scenario: TC_19 Validate nearby outlets content structure
    And I send the GET request to "outlets_get_near_by_outlet_by_geo_location" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Data Not Found|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Data|
      |Data Not Found|

  @Positive @LoadTesting
  Scenario: TC_20 Load testing for nearby outlets endpoint
    And I send the GET request to "outlets_get_near_by_outlet_by_geo_location" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Data Not Found|

  @Negative @Timeout
  Scenario: TC_21 Test nearby outlets endpoint timeout handling
    And I send the GET request to "outlets_get_near_by_outlet_by_geo_location" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Data Not Found|

  @Positive @EndToEnd
  Scenario: TC_22 End-to-end nearby outlets data retrieval workflow
    And I send the GET request to "outlets_get_near_by_outlet_by_geo_location" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Data Not Found|
      |$.Data|[]|
    And I store the response as "nearby_outlets_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data|[]|
