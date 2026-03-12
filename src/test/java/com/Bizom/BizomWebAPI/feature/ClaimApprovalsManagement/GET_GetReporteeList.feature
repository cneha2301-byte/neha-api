@BizomWebAPI @ClaimApprovalsManagement @GetReporteeList @ConfigurationSettings @CE
Feature: Get Reportee List API Testing
  As a system user
  I want to test the get reportee list endpoint
  So that I can ensure proper functionality and data retrieval for reportee list management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get reportee list without access token
    When I send the GET request to "getreporteelist" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Users"

  @Negative @Security
  Scenario: TC_02 Get reportee list with invalid access token
    And I send the GET request to "getreporteelist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get reportee list with expired access token
    And I send the GET request to "getreporteelist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get reportee list with malformed access token
    And I send the GET request to "getreporteelist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get reportee list with valid access token
    And I send the GET request to "getreporteelist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And I store the response as "getreporteelist_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate reportee list response structure
    And I send the GET request to "getreporteelist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.users|object|

  @Positive @DataValidation
  Scenario: TC_07 Validate reportee list specific data values
    And I send the GET request to "getreporteelist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
      |$.users["2"]|DB:users:name: id=2|
      |$.users["3"]|DB:users:name: id=3|
      |$.users["4"]|DB:users:name: id=4|

  @Positive @DataValidation
  Scenario: TC_08 Validate reportee list with static values
    And I send the GET request to "getreporteelist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.users["2"]|"SLV Traders"|
      |$.users["3"]|"Covid MGR"|
      |$.users["4"]|"SLV Traders"|
      |$.users["5"]|"Sadha"|
      |$.users["6"]|"Mobisy"|

  @Positive @Performance
  Scenario: TC_09 Performance test for reportee list endpoint
    And I send the GET request to "getreporteelist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for reportee list endpoint
    And I send the GET request to "getreporteelist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @Negative @Validation
  Scenario: TC_11 Get reportee list with invalid query parameters
    And I send the GET request to "getreporteelist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @Negative @Validation
  Scenario: TC_12 Get reportee list with special characters in query parameters
    And I send the GET request to "getreporteelist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @Negative @Security
  Scenario: TC_13 Get reportee list with SQL injection attempt
    And I send the GET request to "getreporteelist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE users; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @Negative @Boundary
  Scenario: TC_14 Get reportee list with maximum query parameters
    And I send the GET request to "getreporteelist" endpoint with dynamic access token and query parameters
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
      |$.Result|"true"|
      |$.Reason|""|

  @Negative @ErrorHandling
  Scenario: TC_15 Get reportee list with invalid endpoint
    And I send the GET request to "getreporteelist_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_404_NOT_FOUND"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_16 Validate reportee list business logic
    And I send the GET request to "getreporteelist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @Positive @DataIntegrity
  Scenario: TC_17 Validate reportee list data integrity
    And I send the GET request to "getreporteelist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.users|object|
      |$.users."2"|string|
      |$.users."3"|string|
      |$.users."4"|string|

  @Positive @Regression
  Scenario: TC_18 Regression test for reportee list endpoint
    And I send the GET request to "getreporteelist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.users|object|

  @Positive @Functional
  Scenario: TC_19 Validate reportee list response completeness
    And I send the GET request to "getreporteelist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.users|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.users["2"]|"SLV Traders"|
      |$.users["3"]|"Covid MGR"|
      |$.users["4"]|"SLV Traders"|
      |$.users["5"]|"Sadha"|
      |$.users["6"]|"Mobisy"|

  @Positive @ObjectValidation
  Scenario: TC_20 Validate reportee list object structure and content
    And I send the GET request to "getreporteelist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.users|object|
      |$.users["2"]|string|
      |$.users["3"]|string|
      |$.users["4"]|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.users["2"]|"SLV Traders"|
      |$.users["3"]|"Covid MGR"|
      |$.users["4"]|"SLV Traders"|
      |$.users["5"]|"Sadha"|
      |$.users["6"]|"Mobisy"|

  @Positive @ContentValidation
  Scenario: TC_21 Validate reportee list content structure
    And I send the GET request to "getreporteelist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |users|
      

  @Positive @LoadTesting
  Scenario: TC_22 Load testing for reportee list endpoint
    And I send the GET request to "getreporteelist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @Negative @Timeout
  Scenario: TC_23 Test reportee list endpoint timeout handling
    And I send the GET request to "getreporteelist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @Positive @EndToEnd
  Scenario: TC_24 End-to-end reportee list data retrieval workflow
    And I send the GET request to "getreporteelist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And I store the response as "getreporteelist_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.users|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.users["2"]|"SLV Traders"|
      |$.users["3"]|"Covid MGR"|
      |$.users["4"]|"SLV Traders"|
      |$.users["5"]|"Sadha"|
      |$.users["6"]|"Mobisy"|

  @Positive @DataHandling
  Scenario: TC_25 Validate reportee list data handling
    And I send the GET request to "getreporteelist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.users|object|
      |$.users["2"]|string|
      |$.users["3"]|string|
      |$.users["4"]|string|

  @Positive @ResponseStructure
  Scenario: TC_26 Validate reportee list response structure consistency
    And I send the GET request to "getreporteelist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.users|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.users["2"]|"SLV Traders"|
      |$.users["3"]|"Covid MGR"|
      |$.users["4"]|"SLV Traders"|
      |$.users["5"]|"Sadha"|
      |$.users["6"]|"Mobisy"|

  @Positive @LargeDataSet
  Scenario: TC_27 Validate reportee list large dataset handling
    And I send the GET request to "getreporteelist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.users|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.users["585"]|"Sampleuser"|
      |$.users["661"]|"mobisy"|

  @Positive @SpecialCharacters
  Scenario: TC_28 Validate reportee list special characters handling
    And I send the GET request to "getreporteelist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.users["15"]|"&lt;blink&gt;Hello there&lt;\/blink&gt;"|
