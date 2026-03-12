@BizomWebAPI @CompaniesManagement @CreateOutletDensityKml @SupportingFunctions @CE
#API have BUG so Responce validation is failing //<pre>Outlet filter is Null</pre> 
Feature: Create Outlet Density KML API Testing
  As a system user
  I want to test the create outlet density KML endpoint
  So that I can ensure proper functionality and data retrieval for outlet density KML creation

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Create outlet density KML without access token
    When I send the GET request to "companies_createoutletdensitykml" endpoint with path parameters
      |Path|Value|
      |param1|2|
      |param2|2|
      |param3|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Create outlet density KML with invalid access token
    And I send the GET request to "companies_createoutletdensitykml" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|param1|2|
      |||param2|2|
      |||param3|2|
    Then I should see the response code as "200"
     And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Create outlet density KML with expired access token
    And I send the GET request to "companies_createoutletdensitykml" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|param1|2|
      |||param2|2|
      |||param3|2|
    Then I should see the response code as "200"
     And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Create outlet density KML with malformed access token
    And I send the GET request to "companies_createoutletdensitykml" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|param1|2|
      |||param2|2|
      |||param3|2|
    Then I should see the response code as "200"
     And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

#  @Positive @Smoke
#  Scenario: TC_05 Create outlet density KML with valid access token
#    And I send the GET request to "companies_createoutletdensitykml" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|param1|2|
#      |||param2|2|
#      |||param3|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.dataarray[0].Outletview.id|"3"|
#      |$.dataarray[0].Outletview.Name|"chinaAmma Store"|
#      |$.dataarray[0].Outletview.Warehouse_Name|"SLV DISTRIBUTOR"|
#      |$.dataarray[0].Outletview.Area|"Attibele"|
#    And I store the response as "create_outlet_density_kml_response" name using full path

#  @Positive @DataValidation
#  Scenario: TC_06 Validate create outlet density KML response structure
#    And I send the GET request to "companies_createoutletdensitykml" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|param1|2|
#      |||param2|2|
#      |||param3|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#     And the fields in response should match with expected values
#      |JPath|Value|
#      |$.dataarray[0].Outletview.id|"3"|
#      |$.dataarray[0].Outletview.Name|"chinaAmma Store"|
#      |$.dataarray[0].Outletview.Warehouse_Name|"SLV DISTRIBUTOR"|
#      |$.dataarray[0].Outletview.Area|"Attibele"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.dataarray|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate create outlet density KML dataarray structure
    And I send the GET request to "companies_createoutletdensitykml" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|param1|2|
      |||param2|2|
      |||param3|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.dataarray|array|
      |$.dataarray[0]|object|
      |$.dataarray[0].Outletview|object|
      |$.dataarray[0].Outletcategory|object|
      |$.dataarray[0].Beat|object|

  @Positive @DataValidation
  Scenario: TC_08 Validate create outlet density KML Outletview object structure
    And I send the GET request to "companies_createoutletdensitykml" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|param1|2|
      |||param2|2|
      |||param3|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.dataarray[0].Outletview|object|
      |$.dataarray[0].Outletview.id|string|
      |$.dataarray[0].Outletview.longitude|string|
      |$.dataarray[0].Outletview.latitude|string|
      |$.dataarray[0].Outletview.OutletType|string|
      |$.dataarray[0].Outletview.Name|string|
      |$.dataarray[0].Outletview.Address|string|

  @Positive @DataValidation
  Scenario: TC_09 Validate create outlet density KML Outletcategory object structure
    And I send the GET request to "companies_createoutletdensitykml" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|param1|2|
      |||param2|2|
      |||param3|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.dataarray[0].Outletcategory|object|
      |$.dataarray[0].Outletcategory.Category|string|
      |$.dataarray[0].Outletcategory.CategoryId|string|

  @Positive @DataValidation
  Scenario: TC_10 Validate create outlet density KML Beat object structure
    And I send the GET request to "companies_createoutletdensitykml" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|param1|2|
      |||param2|2|
      |||param3|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.dataarray[0].Beat|object|
      |$.dataarray[0].Beat.Name|string|
      |$.dataarray[0].Beat.id|string|

  @Positive @Functional
  Scenario: TC_11 Create outlet density KML with different path parameters
    And I send the GET request to "companies_createoutletdensitykml" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|param1|1|
      |||param2|1|
      |||param3|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.dataarray|array|

#  @Positive @Performance
#  Scenario: TC_12 Performance test for create outlet density KML endpoint
#    And I send the GET request to "companies_createoutletdensitykml" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|param1|2|
#      |||param2|2|
#      |||param3|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#       And the fields in response should match with expected values
#      |JPath|Value|
#      |$.dataarray[0].Outletview.id|"3"|
#      |$.dataarray[0].Outletview.Name|"chinaAmma Store"|
#      |$.dataarray[0].Outletview.Warehouse_Name|"SLV DISTRIBUTOR"|
#      |$.dataarray[0].Outletview.Area|"Attibele"|

#  @Positive @Concurrency
#  Scenario: TC_13 Concurrent access test for create outlet density KML endpoint
#    And I send the GET request to "companies_createoutletdensitykml" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|param1|2|
#      |||param2|2|
#      |||param3|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#       And the fields in response should match with expected values
#      |JPath|Value|
#      |$.dataarray[0].Outletview.id|"3"|
#      |$.dataarray[0].Outletview.Name|"chinaAmma Store"|
#      |$.dataarray[0].Outletview.Warehouse_Name|"SLV DISTRIBUTOR"|
#      |$.dataarray[0].Outletview.Area|"Attibele"|

  @Negative @Validation
  Scenario: TC_14 Create outlet density KML with invalid path parameters
    And I send the GET request to "companies_createoutletdensitykml" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|param1|99999|
      |||param2|99999|
      |||param3|99999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.dataarray|array|

#  @Negative @Validation
#  Scenario: TC_15 Create outlet density KML with special characters in path parameters
#    And I send the GET request to "companies_createoutletdensitykml" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|param1|<script>alert('XSS')</script>|
#      |||param2|2|
#      |||param3|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#
#  @Negative @Security
#  Scenario: TC_16 Create outlet density KML with SQL injection attempt in path parameters
#    And I send the GET request to "companies_createoutletdensitykml" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|param1|'; DROP TABLE companies; --|
#      |||param2|2|
#      |||param3|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#
#  @Negative @Validation
#  Scenario: TC_17 Create outlet density KML with invalid query parameters
#    And I send the GET request to "companies_createoutletdensitykml" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|param1|2|
#      |||param2|2|
#      |||param3|2|
#      |invalid_param|invalid_value|||
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#       And the fields in response should match with expected values
#      |JPath|Value|
#      |$.dataarray[0].Outletview.id|"3"|
#      |$.dataarray[0].Outletview.Name|"chinaAmma Store"|
#      |$.dataarray[0].Outletview.Warehouse_Name|"SLV DISTRIBUTOR"|
#      |$.dataarray[0].Outletview.Area|"Attibele"|
#
#  @Negative @ErrorHandling
#  Scenario: TC_18 Create outlet density KML with invalid endpoint
#    And I send the GET request to "companies_createoutletdensitykml_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|param1|2|
#      |||param2|2|
#      |||param3|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the HTML response should contain page title "Users"
#
#  @Positive @BusinessLogic
#  Scenario: TC_19 Validate create outlet density KML business logic
#    And I send the GET request to "companies_createoutletdensitykml" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|param1|2|
#      |||param2|2|
#      |||param3|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#       And the fields in response should match with expected values
#      |JPath|Value|
#      |$.dataarray[0].Outletview.id|"3"|
#      |$.dataarray[0].Outletview.Name|"chinaAmma Store"|
#      |$.dataarray[0].Outletview.Warehouse_Name|"SLV DISTRIBUTOR"|
#      |$.dataarray[0].Outletview.Area|"Attibele"|
#  @Positive @DataIntegrity
#  Scenario: TC_20 Validate create outlet density KML data integrity
#    And I send the GET request to "companies_createoutletdensitykml" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|param1|2|
#      |||param2|2|
#      |||param3|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#       And the fields in response should match with expected values
#      |JPath|Value|
#      |$.dataarray[0].Outletview.id|"3"|
#      |$.dataarray[0].Outletview.Name|"chinaAmma Store"|
#      |$.dataarray[0].Outletview.Warehouse_Name|"SLV DISTRIBUTOR"|
#      |$.dataarray[0].Outletview.Area|"Attibele"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.dataarray|array|
#      |$.dataarray[0].Outletview|object|
#      |$.dataarray[0].Outletcategory|object|
#      |$.dataarray[0].Beat|object|
#
#  @Positive @Regression
#  Scenario: TC_21 Regression test for create outlet density KML endpoint
#    And I send the GET request to "companies_createoutletdensitykml" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|param1|2|
#      |||param2|2|
#      |||param3|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#       And the fields in response should match with expected values
#      |JPath|Value|
#      |$.dataarray[0].Outletview.id|"3"|
#      |$.dataarray[0].Outletview.Name|"chinaAmma Store"|
#      |$.dataarray[0].Outletview.Warehouse_Name|"SLV DISTRIBUTOR"|
#      |$.dataarray[0].Outletview.Area|"Attibele"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.dataarray|array|
#
#  @Positive @Functional
#  Scenario: TC_22 Validate create outlet density KML response completeness
#    And I send the GET request to "companies_createoutletdensitykml" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|param1|2|
#      |||param2|2|
#      |||param3|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#       And the fields in response should match with expected values
#      |JPath|Value|
#      |$.dataarray[0].Outletview.id|"3"|
#      |$.dataarray[0].Outletview.Name|"chinaAmma Store"|
#      |$.dataarray[0].Outletview.Warehouse_Name|"SLV DISTRIBUTOR"|
#      |$.dataarray[0].Outletview.Area|"Attibele"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.dataarray|array|
#      |$.dataarray[0].Outletview|object|
#      |$.dataarray[0].Outletcategory|object|
#      |$.dataarray[0].Beat|object|

#  @Positive @ArrayValidation
#  Scenario: TC_23 Validate create outlet density KML array structure and content
#    And I send the GET request to "companies_createoutletdensitykml" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|param1|2|
#      |||param2|2|
#      |||param3|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.dataarray|array|
#      |$.dataarray[0]|object|
#      |$.dataarray[0].Outletview|object|
#      |$.dataarray[0].Outletcategory|object|
#      |$.dataarray[0].Beat|object|
#
#  @Positive @ContentValidation
#  Scenario: TC_24 Validate create outlet density KML content structure
#    And I send the GET request to "companies_createoutletdensitykml" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|param1|2|
#      |||param2|2|
#      |||param3|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response contains the following values
#      |Value|
#      |dataarray|
#      |Outletview|
#      |Outletcategory|
#      |Beat|
#
#  @Positive @LoadTesting
#  Scenario: TC_25 Load testing for create outlet density KML endpoint
#    And I send the GET request to "companies_createoutletdensitykml" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|param1|2|
#      |||param2|2|
#      |||param3|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "3000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#       And the fields in response should match with expected values
#      |JPath|Value|
#      |$.dataarray[0].Outletview.id|"3"|
#      |$.dataarray[0].Outletview.Name|"chinaAmma Store"|
#      |$.dataarray[0].Outletview.Warehouse_Name|"SLV DISTRIBUTOR"|
#      |$.dataarray[0].Outletview.Area|"Attibele"|
#
#  @Negative @Timeout
#  Scenario: TC_26 Test create outlet density KML endpoint timeout handling
#    And I send the GET request to "companies_createoutletdensitykml" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|param1|2|
#      |||param2|2|
#      |||param3|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "5000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#       And the fields in response should match with expected values
#      |JPath|Value|
#      |$.dataarray[0].Outletview.id|"3"|
#      |$.dataarray[0].Outletview.Name|"chinaAmma Store"|
#      |$.dataarray[0].Outletview.Warehouse_Name|"SLV DISTRIBUTOR"|
#      |$.dataarray[0].Outletview.Area|"Attibele"|
#
#  @Positive @EndToEnd
#  Scenario: TC_27 End-to-end create outlet density KML data retrieval workflow
#    And I send the GET request to "companies_createoutletdensitykml" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|param1|2|
#      |||param2|2|
#      |||param3|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#       And the fields in response should match with expected values
#      |JPath|Value|
#      |$.dataarray[0].Outletview.id|"3"|
#      |$.dataarray[0].Outletview.Name|"chinaAmma Store"|
#      |$.dataarray[0].Outletview.Warehouse_Name|"SLV DISTRIBUTOR"|
#      |$.dataarray[0].Outletview.Area|"Attibele"|
#    And I store the response as "create_outlet_density_kml_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.dataarray|array|
#      |$.dataarray[0].Outletview|object|
#      |$.dataarray[0].Outletcategory|object|
#      |$.dataarray[0].Beat|object|
#      |$.dataarray[0].Outletview.id|string|
#      |$.dataarray[0].Outletview.longitude|string|
#      |$.dataarray[0].Outletview.latitude|string|
#      |$.dataarray[0].Outletcategory.Category|string|
#      |$.dataarray[0].Beat.Name|string|

