@BizomWebAPI @CE @OutletsManagement @OutletsBuyerFilter @SystemOperations
Feature: Get Buyer Filter API Testing
  As a system user
  I want to test the get buyer filter endpoint
  So that I can ensure proper functionality and data retrieval for buyer filter options

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get buyer filter without access token
    When I send the GET request to "outlets_get_buyer_filter" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds
    
  @Negative @Security
  Scenario: TC_02 Get buyer filter with invalid access token
    And I send the GET request to "outlets_get_buyer_filter" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get buyer filter with expired access token
    And I send the GET request to "outlets_get_buyer_filter" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|

  @Negative @Security
  Scenario: TC_04 Get buyer filter with malformed access token
    And I send the GET request to "outlets_get_buyer_filter" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get buyer filter with valid access token
    And I send the GET request to "outlets_get_buyer_filter" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And I store the response as "buyer_filter_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate buyer filter response structure
    And I send the GET request to "outlets_get_buyer_filter" endpoint with dynamic access token and query parameters
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
      |$.data|array|
      |$.data[0]|object|
      |$.data[0].sequence|number|
      |$.data[0].optiontype|string|
      |$.data[0].alias|string|

  @Positive @DataValidation
  Scenario: TC_07 Validate buyer filter data array structure
    And I send the GET request to "outlets_get_buyer_filter" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
      |$.data[0].sequence|number|
      |$.data[0].optiontype|string|
      |$.data[0].alias|string|
      |$.data[1].sequence|number|
      |$.data[1].optiontype|string|
      |$.data[1].alias|string|
      |$.data[2].sequence|number|
      |$.data[2].optiontype|string|
      |$.data[2].alias|string|

  @Positive @DataValidation
  Scenario: TC_08 Validate buyer filter specific data values
    And I send the GET request to "outlets_get_buyer_filter" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.data[0].sequence|0|
      |$.data[0].optiontype|pjpoutlets|
      |$.data[0].alias|All BEATs|
      |$.data[1].sequence|1|
      |$.data[1].optiontype|keyoutlets|
      |$.data[1].alias|Key Customers|
      |$.data[2].sequence|2|
      |$.data[2].optiontype|mappeddistributor|
      |$.data[2].alias|DISTRIBUTOR|

  @Positive @Performance
  Scenario: TC_09 Performance test for buyer filter endpoint
    And I send the GET request to "outlets_get_buyer_filter" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for buyer filter endpoint
    And I send the GET request to "outlets_get_buyer_filter" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_11 Get buyer filter with invalid query parameters
    And I send the GET request to "outlets_get_buyer_filter" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_12 Get buyer filter with special characters in query parameters
    And I send the GET request to "outlets_get_buyer_filter" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Security
  Scenario: TC_13 Get buyer filter with SQL injection attempt
    And I send the GET request to "outlets_get_buyer_filter" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE outlets; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Boundary
  Scenario: TC_14 Get buyer filter with maximum query parameters
    And I send the GET request to "outlets_get_buyer_filter" endpoint with dynamic access token and query parameters
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

#  @Negative @ErrorHandling
#  Scenario: TC_15 Get buyer filter with invalid endpoint
#    And I send the GET request to "outlets_get_buyer_filter_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_16 Validate buyer filter business logic
    And I send the GET request to "outlets_get_buyer_filter" endpoint with dynamic access token and query parameters
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
      |$.data|array|

  @Positive @DataIntegrity
  Scenario: TC_17 Validate buyer filter data integrity
    And I send the GET request to "outlets_get_buyer_filter" endpoint with dynamic access token and query parameters
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
      |$.data|array|
      |$.data[0].sequence|number|
      |$.data[0].optiontype|string|
      |$.data[0].alias|string|
      |$.data[1].sequence|number|
      |$.data[1].optiontype|string|
      |$.data[1].alias|string|
      |$.data[2].sequence|number|
      |$.data[2].optiontype|string|
      |$.data[2].alias|string|

  @Positive @Regression
  Scenario: TC_18 Regression test for buyer filter endpoint
    And I send the GET request to "outlets_get_buyer_filter" endpoint with dynamic access token and query parameters
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
      |$.data|array|
      |$.data[0]|object|

  @Positive @Functional
  Scenario: TC_19 Validate buyer filter response completeness
    And I send the GET request to "outlets_get_buyer_filter" endpoint with dynamic access token and query parameters
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
      |$.data|array|
      |$.data[0]|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data[0].sequence|0|
      |$.data[0].optiontype|pjpoutlets|
      |$.data[0].alias|All BEATs|

  @Positive @ArrayValidation
  Scenario: TC_20 Validate buyer filter array structure and content
    And I send the GET request to "outlets_get_buyer_filter" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
      |$.data[0]|object|
      |$.data[1]|object|
      |$.data[2]|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data[0].sequence|0|
      |$.data[0].optiontype|pjpoutlets|
      |$.data[0].alias|All BEATs|
      |$.data[1].sequence|1|
      |$.data[1].optiontype|keyoutlets|
      |$.data[1].alias|Key Customers|
      |$.data[2].sequence|2|
      |$.data[2].optiontype|mappeddistributor|
      |$.data[2].alias|DISTRIBUTOR|

  @Positive @ContentValidation
  Scenario: TC_21 Validate buyer filter content structure
    And I send the GET request to "outlets_get_buyer_filter" endpoint with dynamic access token and query parameters
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
      |data|
      |sequence|
      |optiontype|
      |alias|
      |pjpoutlets|
      |keyoutlets|
      |mappeddistributor|

  @Positive @LoadTesting
  Scenario: TC_22 Load testing for buyer filter endpoint
    And I send the GET request to "outlets_get_buyer_filter" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Timeout
  Scenario: TC_23 Test buyer filter endpoint timeout handling
    And I send the GET request to "outlets_get_buyer_filter" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @EndToEnd
  Scenario: TC_24 End-to-end buyer filter data retrieval workflow
    And I send the GET request to "outlets_get_buyer_filter" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And I store the response as "buyer_filter_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.data|array|
      |$.data[0]|object|
      |$.data[0].sequence|number|
      |$.data[0].optiontype|string|
      |$.data[0].alias|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data[0].sequence|0|
      |$.data[0].optiontype|pjpoutlets|
      |$.data[0].alias|All BEATs|
      |$.data[1].sequence|1|
      |$.data[1].optiontype|keyoutlets|
      |$.data[1].alias|Key Customers|
      |$.data[2].sequence|2|
      |$.data[2].optiontype|mappeddistributor|
      |$.data[2].alias|DISTRIBUTOR|

