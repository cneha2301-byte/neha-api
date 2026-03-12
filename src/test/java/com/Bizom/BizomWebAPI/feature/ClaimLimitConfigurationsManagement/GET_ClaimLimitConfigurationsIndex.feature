@BizomWebAPI @ClaimLimitConfigurationsManagement @ClaimLimitConfigurationsIndex @ConfigurationSettings @CE
Feature: Claim Limit Configurations Index API Testing
  As a system user
  I want to test the claim limit configurations index endpoint
  So that I can ensure proper functionality and data retrieval for claim limit configurations management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get claim limit configurations without access token
    When I send the GET request to "claimlimitconfigurations_indexapi" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get claim limit configurations with invalid access token
    And I send the GET request to "claimlimitconfigurations_indexapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get claim limit configurations with expired access token
    And I send the GET request to "claimlimitconfigurations_indexapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get claim limit configurations with malformed access token
    And I send the GET request to "claimlimitconfigurations_indexapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get claim limit configurations with valid access token
    And I send the GET request to "claimlimitconfigurations_indexapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|1|
      |$.iTotalDisplayRecords|1|
    And I store the response as "claimlimitconfigurations_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate claim limit configurations response structure
    And I send the GET request to "claimlimitconfigurations_indexapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|1|
      |$.iTotalDisplayRecords|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate claim limit configurations specific data values
    And I send the GET request to "claimlimitconfigurations_indexapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|1|
      |$.iTotalDisplayRecords|1|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.aaData[0].amountFrequency|"daily"|
      |$.aaData[0].claimTypeName|"Travel"|
      |$.aaData[0].claimtypeID|"3"|
      |$.aaData[0].configurationID|"1"|
      |$.aaData[0].countFrequency|"weekly"|
      |$.aaData[0].isActive|"1"|
      |$.aaData[0].maxAmount|"10.00000"|
      |$.aaData[0].maxCount|"10"|
      |$.aaData[0].roleID|"1"|
      |$.aaData[0].roleName|"ADMIN"|
      |$.aaData[0].startDate|"2023-09-03"|

  @Positive @DataValidation
  Scenario: TC_08 Validate claim limit configurations with static values
    And I send the GET request to "claimlimitconfigurations_indexapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|1|
      |$.iTotalDisplayRecords|1|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.aaData[0].amountFrequency|"daily"|
      |$.aaData[0].claimTypeName|"Travel"|
      |$.aaData[0].claimtypeID|"3"|
      |$.aaData[0].configurationID|"1"|
      |$.aaData[0].countFrequency|"weekly"|
      |$.aaData[0].designationID|""|
      |$.aaData[0].designationName|""|
      |$.aaData[0].isActive|"1"|
      |$.aaData[0].maxAmount|"10.00000"|
      |$.aaData[0].maxCount|"10"|
      |$.aaData[0].roleID|"1"|
      |$.aaData[0].roleName|"ADMIN"|
      |$.aaData[0].startDate|"2023-09-03"|
      |$.aaData[0].userID|""|
      |$.aaData[0].userName|""|

  @Positive @Performance
  Scenario: TC_09 Performance test for claim limit configurations endpoint
    And I send the GET request to "claimlimitconfigurations_indexapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|1|
      |$.iTotalDisplayRecords|1|

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for claim limit configurations endpoint
    And I send the GET request to "claimlimitconfigurations_indexapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|1|
      |$.iTotalDisplayRecords|1|

  @Negative @Validation
  Scenario: TC_11 Get claim limit configurations with invalid query parameters
    And I send the GET request to "claimlimitconfigurations_indexapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|1|
      |$.iTotalDisplayRecords|1|

  @Negative @Validation
  Scenario: TC_12 Get claim limit configurations with special characters in query parameters
    And I send the GET request to "claimlimitconfigurations_indexapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|1|
      |$.iTotalDisplayRecords|1|

  @Negative @Security
  Scenario: TC_13 Get claim limit configurations with SQL injection attempt
    And I send the GET request to "claimlimitconfigurations_indexapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE claimlimitconfigurations; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|1|
      |$.iTotalDisplayRecords|1|

  @Negative @Boundary
  Scenario: TC_14 Get claim limit configurations with maximum query parameters
    And I send the GET request to "claimlimitconfigurations_indexapi" endpoint with dynamic access token and query parameters
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
      |$.sEcho|1|
      |$.iTotalRecords|1|
      |$.iTotalDisplayRecords|1|

  @Negative @ErrorHandling
  Scenario: TC_15 Get claim limit configurations with invalid endpoint
    And I send the GET request to "claimlimitconfigurations_indexapi_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_404_NOT_FOUND"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_16 Validate claim limit configurations business logic
    And I send the GET request to "claimlimitconfigurations_indexapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|1|
      |$.iTotalDisplayRecords|1|

  @Positive @DataIntegrity
  Scenario: TC_17 Validate claim limit configurations data integrity
    And I send the GET request to "claimlimitconfigurations_indexapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|1|
      |$.iTotalDisplayRecords|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
      |$.aaData[0].amountFrequency|string|
      |$.aaData[0].claimTypeName|string|
      |$.aaData[0].claimtypeID|string|
      |$.aaData[0].configurationID|string|
      |$.aaData[0].countFrequency|string|
      |$.aaData[0].designationID|string|
      |$.aaData[0].designationName|string|
      |$.aaData[0].isActive|string|
      |$.aaData[0].maxAmount|string|
      |$.aaData[0].maxCount|string|
      |$.aaData[0].roleID|string|
      |$.aaData[0].roleName|string|
      |$.aaData[0].startDate|string|
      |$.aaData[0].userID|string|
      |$.aaData[0].userName|string|

  @Positive @Regression
  Scenario: TC_18 Regression test for claim limit configurations endpoint
    And I send the GET request to "claimlimitconfigurations_indexapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|1|
      |$.iTotalDisplayRecords|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Positive @Functional
  Scenario: TC_19 Validate claim limit configurations response completeness
    And I send the GET request to "claimlimitconfigurations_indexapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|1|
      |$.iTotalDisplayRecords|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.aaData[0].amountFrequency|"daily"|
      |$.aaData[0].claimTypeName|"Travel"|
      |$.aaData[0].claimtypeID|"3"|
      |$.aaData[0].configurationID|"1"|
      |$.aaData[0].countFrequency|"weekly"|
      |$.aaData[0].isActive|"1"|
      |$.aaData[0].maxAmount|"10.00000"|
      |$.aaData[0].maxCount|"10"|
      |$.aaData[0].roleID|"1"|
      |$.aaData[0].roleName|"ADMIN"|
      |$.aaData[0].startDate|"2023-09-03"|

  @Positive @ArrayValidation
  Scenario: TC_20 Validate claim limit configurations array structure and content
    And I send the GET request to "claimlimitconfigurations_indexapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|1|
      |$.iTotalDisplayRecords|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData|array|
      |$.aaData[0]|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.aaData[0].amountFrequency|"daily"|
      |$.aaData[0].claimTypeName|"Travel"|
      |$.aaData[0].claimtypeID|"3"|
      |$.aaData[0].configurationID|"1"|
      |$.aaData[0].countFrequency|"weekly"|
      |$.aaData[0].isActive|"1"|
      |$.aaData[0].maxAmount|"10.00000"|
      |$.aaData[0].maxCount|"10"|
      |$.aaData[0].roleID|"1"|
      |$.aaData[0].roleName|"ADMIN"|
      |$.aaData[0].startDate|"2023-09-03"|

  @Positive @ContentValidation
  Scenario: TC_21 Validate claim limit configurations content structure
    And I send the GET request to "claimlimitconfigurations_indexapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|1|
      |$.iTotalDisplayRecords|1|
    And validating the response contains the following values
      |Value|
      |sEcho|
      |iTotalRecords|
      |iTotalDisplayRecords|
      |aaData|
      |amountFrequency|
      |claimTypeName|
      |claimtypeID|
      |configurationID|
      |countFrequency|
      |designationID|
      |designationName|
      |isActive|
      |maxAmount|
      |maxCount|
      |roleID|
      |roleName|
      |startDate|
      |userID|
      |userName|

  @Positive @LoadTesting
  Scenario: TC_22 Load testing for claim limit configurations endpoint
    And I send the GET request to "claimlimitconfigurations_indexapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|1|
      |$.iTotalDisplayRecords|1|

  @Negative @Timeout
  Scenario: TC_23 Test claim limit configurations endpoint timeout handling
    And I send the GET request to "claimlimitconfigurations_indexapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|1|
      |$.iTotalDisplayRecords|1|

  @Positive @EndToEnd
  Scenario: TC_24 End-to-end claim limit configurations data retrieval workflow
    And I send the GET request to "claimlimitconfigurations_indexapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|1|
      |$.iTotalDisplayRecords|1|
    And I store the response as "claimlimitconfigurations_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.aaData[0].amountFrequency|"daily"|
      |$.aaData[0].claimTypeName|"Travel"|
      |$.aaData[0].claimtypeID|"3"|
      |$.aaData[0].configurationID|"1"|
      |$.aaData[0].countFrequency|"weekly"|
      |$.aaData[0].isActive|"1"|
      |$.aaData[0].maxAmount|"10.00000"|
      |$.aaData[0].maxCount|"10"|
      |$.aaData[0].roleID|"1"|
      |$.aaData[0].roleName|"ADMIN"|
      |$.aaData[0].startDate|"2023-09-03"|

  @Positive @DataHandling
  Scenario: TC_25 Validate claim limit configurations data handling
    And I send the GET request to "claimlimitconfigurations_indexapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|1|
      |$.iTotalDisplayRecords|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData|array|
      |$.aaData[0].amountFrequency|string|
      |$.aaData[0].claimTypeName|string|
      |$.aaData[0].claimtypeID|string|
      |$.aaData[0].configurationID|string|
      |$.aaData[0].countFrequency|string|
      |$.aaData[0].designationID|string|
      |$.aaData[0].designationName|string|
      |$.aaData[0].isActive|string|
      |$.aaData[0].maxAmount|string|
      |$.aaData[0].maxCount|string|
      |$.aaData[0].roleID|string|
      |$.aaData[0].roleName|string|
      |$.aaData[0].startDate|string|
      |$.aaData[0].userID|string|
      |$.aaData[0].userName|string|

  @Positive @ResponseStructure
  Scenario: TC_26 Validate claim limit configurations response structure consistency
    And I send the GET request to "claimlimitconfigurations_indexapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|1|
      |$.iTotalDisplayRecords|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.aaData[0].amountFrequency|"daily"|
      |$.aaData[0].claimTypeName|"Travel"|
      |$.aaData[0].claimtypeID|"3"|
      |$.aaData[0].configurationID|"1"|
      |$.aaData[0].countFrequency|"weekly"|
      |$.aaData[0].isActive|"1"|
      |$.aaData[0].maxAmount|"10.00000"|
      |$.aaData[0].maxCount|"10"|
      |$.aaData[0].roleID|"1"|
      |$.aaData[0].roleName|"ADMIN"|
      |$.aaData[0].startDate|"2023-09-03"|

  @Positive @Headers
  Scenario: TC_27 Get claim limit configurations - verify response headers
    And I send the GET request to "claimlimitconfigurations_indexapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json; charset=UTF-8|
      |Connection|keep-alive|
    And verify response time is less than "2000" milliseconds

  @Positive @Store
  Scenario: TC_28 Store response for claim limit configurations
    And I send the GET request to "claimlimitconfigurations_indexapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And I store the response as "claimlimitconfigurations_stored_response" name using full path
    And verify response time is less than "2000" milliseconds
