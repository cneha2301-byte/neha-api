@BizomWebAPI @BidTypesManagement @ApiGetBidTypes @ConfigurationSettings
Feature: Get Bid Types API Testing
  As a system user
  I want to test the get bid types endpoint
  So that I can ensure proper functionality and data retrieval for bid types management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get bid types without access token
    When I send the GET request to "bidtypes_api_get_bid_types" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get bid types with invalid access token
    And I send the GET request to "bidtypes_api_get_bid_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get bid types with expired access token
    And I send the GET request to "bidtypes_api_get_bid_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get bid types with malformed access token
    And I send the GET request to "bidtypes_api_get_bid_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get bid types with valid access token
    And I send the GET request to "bidtypes_api_get_bid_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|      
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And I store the response as "bid_types_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate bid types response structure
    And I send the GET request to "bidtypes_api_get_bid_types" endpoint with dynamic access token and query parameters
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
      |$.Bids|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate bid types data structure and content
    And I send the GET request to "bidtypes_api_get_bid_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Bids|array|
      |$.Bids[0]|object|
      |$.Bids[0].Bidtype|object|
      |$.Bids[0].Bidtypedetail|array|

  @Positive @DataValidation
  Scenario: TC_08 Validate bid type object structure
    And I send the GET request to "bidtypes_api_get_bid_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Bids[0].Bidtype|object|
      |$.Bids[0].Bidtype.name|string|
      |$.Bids[0].Bidtype.id|string|

  @Positive @DataValidation
  Scenario: TC_09 Validate bid type detail structure
    And I send the GET request to "bidtypes_api_get_bid_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Bids[0].Bidtypedetail|array|
      |$.Bids[0].Bidtypedetail[0]|object|
      |$.Bids[0].Bidtypedetail[0].Customfield|object|

  @Positive @Performance
  Scenario: TC_10 Performance test for bid types endpoint
    And I send the GET request to "bidtypes_api_get_bid_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @Concurrency
  Scenario: TC_11 Concurrent access test for bid types endpoint
    And I send the GET request to "bidtypes_api_get_bid_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_12 Get bid types with invalid query parameters
    And I send the GET request to "bidtypes_api_get_bid_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_13 Get bid types with special characters in query parameters
    And I send the GET request to "bidtypes_api_get_bid_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Security
  Scenario: TC_14 Get bid types with SQL injection attempt
    And I send the GET request to "bidtypes_api_get_bid_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE bidtypes; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Boundary
  Scenario: TC_15 Get bid types with maximum query parameters
    And I send the GET request to "bidtypes_api_get_bid_types" endpoint with dynamic access token and query parameters
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
  Scenario: TC_16 Get bid types with invalid endpoint
    And I send the GET request to "bidtypes_api_get_bid_types_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_17 Validate bid types business logic
    And I send the GET request to "bidtypes_api_get_bid_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @DataIntegrity
  Scenario: TC_18 Validate bid types data integrity
    And I send the GET request to "bidtypes_api_get_bid_types" endpoint with dynamic access token and query parameters
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
      |$.Bids|array|
      |$.Bids[0].Bidtype|object|
      |$.Bids[0].Bidtypedetail|array|

  @Positive @Regression
  Scenario: TC_19 Regression test for bid types endpoint
    And I send the GET request to "bidtypes_api_get_bid_types" endpoint with dynamic access token and query parameters
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
      |$.Bids|array|

  @Positive @Functional
  Scenario: TC_20 Validate bid types response completeness
    And I send the GET request to "bidtypes_api_get_bid_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Bids|array|
      |$.Bids[0].Bidtype|object|
      |$.Bids[0].Bidtypedetail|array|

  @Positive @ArrayValidation
  Scenario: TC_21 Validate bid types array structure and content
    And I send the GET request to "bidtypes_api_get_bid_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Bids|array|
      |$.Bids[0]|object|
      |$.Bids[0].Bidtype|object|
      |$.Bids[0].Bidtypedetail|array|
      |$.Bids[0].Bidtypedetail[0]|object|

  @Positive @ContentValidation
  Scenario: TC_22 Validate bid types content structure
    And I send the GET request to "bidtypes_api_get_bid_types" endpoint with dynamic access token and query parameters
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
      |Bids|
      |Bidtype|
      |Bidtypedetail|

  @Positive @LoadTesting
  Scenario: TC_23 Load testing for bid types endpoint
    And I send the GET request to "bidtypes_api_get_bid_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Timeout
  Scenario: TC_24 Test bid types endpoint timeout handling
    And I send the GET request to "bidtypes_api_get_bid_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @EndToEnd
  Scenario: TC_25 End-to-end bid types data retrieval workflow
    And I send the GET request to "bidtypes_api_get_bid_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And I store the response as "bid_types_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Bids|array|
      |$.Bids[0].Bidtype|object|
      |$.Bids[0].Bidtype.name|string|
      |$.Bids[0].Bidtype.id|string|
      |$.Bids[0].Bidtypedetail|array|
      |$.Bids[0].Bidtypedetail[0].Customfield|object|

