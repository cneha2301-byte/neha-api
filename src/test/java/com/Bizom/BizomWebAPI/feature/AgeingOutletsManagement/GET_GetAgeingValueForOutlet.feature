@BizomWebAPI @AgeingOutletsManagement @GetAgeingValueForOutlet @MasterDataManagement @CE
Feature: Get Ageing Value For Outlet API Testing
  As a Bizom web API consumer
  I want to validate the get ageing value for outlet endpoint
  So that I can ensure ageing outlet data is fetched correctly

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get ageing value for outlet without access token
    When I send the GET request to "ageingoutlets_get_ageing_value_for_outlet" endpoint with path parameters
      |Path|Value|
      |outletId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get ageing value for outlet with invalid access token
    And I send the GET request to "ageingoutlets_get_ageing_value_for_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|outletId|2|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get ageing value for outlet with expired access token
    And I send the GET request to "ageingoutlets_get_ageing_value_for_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|outletId|2|
    Then I should see the response code as "200"    
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get ageing value for outlet with malformed access token
    And I send the GET request to "ageingoutlets_get_ageing_value_for_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|outletId|2|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get ageing value for outlet with valid path parameter
     And I send the GET request to "ageingoutlets_get_ageing_value_for_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result| "true"|
      |$.Reason|"Ageing not Available"|
    And I store the response as "getAgeingValueForOutlet_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate ageing value for outlet response structure
    And I send the GET request to "ageingoutlets_get_ageing_value_for_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result| "true"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Ageingoutlet|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate ageing value for outlet array structure
     And I send the GET request to "ageingoutlets_get_ageing_value_for_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result| "true"|
      |$.Reason|"Ageing not Available"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Ageingoutlet|array|
      |$.Ageingoutlet[0]|object|
      |$.Ageingoutlet[0].Ageingoutlet|array|

  @Positive @Performance
  Scenario: TC_08 Performance test for get ageing value for outlet endpoint
     And I send the GET request to "ageingoutlets_get_ageing_value_for_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result| "true"|

  @Positive @Concurrency
  Scenario: TC_09 Concurrent access test for get ageing value for outlet endpoint
     And I send the GET request to "ageingoutlets_get_ageing_value_for_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result| "true"|

  @Negative @Validation
  Scenario: TC_10 Get ageing value for outlet with invalid outlet id
     And I send the GET request to "ageingoutlets_get_ageing_value_for_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|invalid|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_11 Get ageing value for outlet with special characters in outlet id
    And I send the GET request to "ageingoutlets_get_ageing_value_for_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|<script>alert('XSS')</script>|
    Then I should see the response code as "STATUS_404_NOT_FOUND"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_12 Get ageing value for outlet with SQL injection attempt
     And I send the GET request to "ageingoutlets_get_ageing_value_for_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|'; DROP TABLE ageingoutlets; --|
    Then I should see the response code as "STATUS_404_NOT_FOUND"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_13 Get ageing value for outlet with negative outlet id
    And I send the GET request to "ageingoutlets_get_ageing_value_for_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_14 Get ageing value for outlet with zero outlet id
     And I send the GET request to "ageingoutlets_get_ageing_value_for_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_15 Get ageing value for outlet with very large outlet id
     And I send the GET request to "ageingoutlets_get_ageing_value_for_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|999999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_16 Get ageing value for outlet with invalid endpoint
    And I send the GET request to "ageingoutlets_get_ageing_value_for_outlet_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "STATUS_404_NOT_FOUND"
    And verify response time is less than "2500" milliseconds

  @Positive @Regression
  Scenario: TC_17 Regression test for get ageing value for outlet endpoint
    And I send the GET request to "ageingoutlets_get_ageing_value_for_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result| "true"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Ageingoutlet|array|

  @Positive @BusinessLogic
  Scenario: TC_18 Validate ageing value for outlet business logic
     And I send the GET request to "ageingoutlets_get_ageing_value_for_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result| "true"|

  @Positive @DataIntegrity
  Scenario: TC_19 Validate ageing value for outlet data integrity
     And I send the GET request to "ageingoutlets_get_ageing_value_for_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result| "true"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Ageingoutlet|array|
      |$.Ageingoutlet[0]|object|
      |$.Ageingoutlet[0].Ageingoutlet|array|

  @Positive @Functional
  Scenario: TC_20 Validate ageing value for outlet response completeness
    And I send the GET request to "ageingoutlets_get_ageing_value_for_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result| "true"|
      |$.Reason|"Ageing not Available" |
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Ageingoutlet|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Ageingoutlet[0].Ageingoutlet|[]|

  @Positive @ArrayValidation
  Scenario: TC_21 Validate ageing value for outlet array structure and content
    And I send the GET request to "ageingoutlets_get_ageing_value_for_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result| "true"|
      |$.Reason|"Ageing not Available"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Ageingoutlet|array|
      |$.Ageingoutlet[0]|object|
      |$.Ageingoutlet[0].Ageingoutlet|array|

  @Positive @ContentValidation
  Scenario: TC_22 Validate ageing value for outlet content structure
     And I send the GET request to "ageingoutlets_get_ageing_value_for_outlet" endpoint with dynamic access token, path and query parameters    
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value| 
      |$.Result| "true"|
    And validating the response contains the following values
      |Value|
      |Ageingoutlet|
      |Result|
      |Reason|

  @Positive @LoadTesting
  Scenario: TC_23 Load testing for ageing value for outlet endpoint
     And I send the GET request to "ageingoutlets_get_ageing_value_for_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result| "true"|

  @Negative @Timeout
  Scenario: TC_24 Test ageing value for outlet endpoint timeout handling
    And I send the GET request to "ageingoutlets_get_ageing_value_for_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result| "true"|

  @Positive @EndToEnd
  Scenario: TC_25 End-to-end ageing value for outlet data retrieval workflow
    And I send the GET request to "ageingoutlets_get_ageing_value_for_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result| "true"|
      |$.Reason|"Ageing not Available"|
    And I store the response as "getAgeingValueForOutlet_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Ageingoutlet|array|
      |$.Ageingoutlet[0]|object|
      |$.Ageingoutlet[0].Ageingoutlet|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Ageingoutlet[0].Ageingoutlet|[]|

