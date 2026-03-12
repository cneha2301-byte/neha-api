@BizomWebAPI @CE @OutletTypesManagement @OutletGetOutletTypes @SystemOperations
Feature: Get Outlet Types API Testing
  As a system user
  I want to test the get outlet types endpoint
  So that I can ensure proper functionality and data retrieval for outlet types information

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Tc_1  Get outlet types without access token
    When I send the GET request to "outlettypes_get_outlet_types" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |  access_token|               |
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Tc_2  Get outlet types with invalid access token
    And I send the GET request to "outlettypes_get_outlet_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |invalid_token_12345|
     
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Tc_3  Get outlet types with expired access token
    And I send the GET request to "outlettypes_get_outlet_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |expired_token_12345|
     
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Tc_4  Get outlet types with malformed access token
    And I send the GET request to "outlettypes_get_outlet_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |malformed.token.here|
     
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: Tc_5  Get outlet types with valid access token
    And I send the GET request to "outlettypes_get_outlet_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
     
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Outlettype|object|

  @Positive @Functional
  Scenario: Tc_6  Get outlet types and validate response structure
    And I send the GET request to "outlettypes_get_outlet_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.Outlettype.1|Outlets1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Outlettype|object|

  @Positive @DataValidation
  Scenario: Tc_7  Validate outlet types Outlettype object structure
    And I send the GET request to "outlettypes_get_outlet_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
     
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Outlettype.1|Outlets1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Outlettype|object|

  @Positive @DataValidation
  Scenario: Tc_8  Validate outlet types complete response structure
    And I send the GET request to "outlettypes_get_outlet_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
     
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.Outlettype.1|Outlets1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Outlettype|object|

  @Positive @DataValidation
  Scenario: Tc_9  Validate outlet types data content
    And I send the GET request to "outlettypes_get_outlet_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Outlettype.1|Outlets1|
      |$.Outlettype.2|Direct|
      |$.Outlettype.3|Indirect|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Outlettype|object|

  @Positive @Functional
  Scenario: Tc_10  Get outlet types with different cache buster parameter
    And I send the GET request to "outlettypes_get_outlet_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
      |_|1764664166894|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Positive @Functional
  Scenario: Tc_11  Get outlet types without cache buster parameter
    And I send the GET request to "outlettypes_get_outlet_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

#  @Negative @ErrorHandling
#  Scenario: Tc_12  Get outlet types with invalid endpoint
#    And I send the GET request to "outlettypes_get_outlet_types_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token  |ACCESS_TOKEN  |
#
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Tc_13  Performance test for get outlet types endpoint
    And I send the GET request to "outlettypes_get_outlet_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
     
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Regression
  Scenario: Tc_14  Regression test for get outlet types endpoint
    And I send the GET request to "outlettypes_get_outlet_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
     
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.Outlettype.1|Outlets1|

  @Positive @EndToEnd
  Scenario: Tc_15  End-to-end get outlet types data retrieval workflow
    And I send the GET request to "outlettypes_get_outlet_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
     
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.Outlettype.1|Outlets1|
    And I store the response as "get_outlet_types_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Outlettype|object|

  @Positive @DataValidation
  Scenario: Tc_16  Validate outlet types Outlettype key-value pairs
    And I send the GET request to "outlettypes_get_outlet_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
     
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Outlettype.1|Outlets1|
      |$.Outlettype.2|Direct|
      |$.Outlettype.3|Indirect|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Outlettype|object|
      |$.Outlettype.1|string|
      |$.Outlettype.2|string|
      |$.Outlettype.3|string|
      |$.Outlettype.5|string|
      |$.Outlettype.6|string|
      |$.Outlettype.7|string|

  @Positive @LoadTesting
  Scenario: Tc_17  Load testing for get outlet types endpoint
    And I send the GET request to "outlettypes_get_outlet_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
     
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

