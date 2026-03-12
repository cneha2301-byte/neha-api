@BizomWebAPI @ClaimTypesManagement @GetAllCombinations @ConfigurationSettings @CE
Feature: Get All Combinations API Testing
  As a system user
  I want to test the get all combinations endpoint
  So that I can ensure proper functionality and data retrieval for claim type combinations

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get all combinations without access token
    When I send the GET request to "claimtypes_getallcombinations" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token||claimTypeId|4|
      |Path|Value|              | |
      |claimTypeId|4|           | |
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get all combinations with invalid access token
    And I send the GET request to "claimtypes_getallcombinations" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|claimTypeId|4|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get all combinations with expired access token
    And I send the GET request to "claimtypes_getallcombinations" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|claimTypeId|4|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get all combinations with malformed access token
    And I send the GET request to "claimtypes_getallcombinations" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|claimTypeId|4|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get all combinations with valid access token
    And I send the GET request to "claimtypes_getallcombinations" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|4|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.status|200|
    And I store the response as "all_combinations_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate all combinations response structure
    And I send the GET request to "claimtypes_getallcombinations" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|4|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
      |$.status|200|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|array|
      |$.status|number|

  @Positive @DataValidation
  Scenario: TC_07 Validate all combinations data array structure
    And I send the GET request to "claimtypes_getallcombinations" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|4|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

  @Positive @Functional
  Scenario: TC_08 Get all combinations for different claim type ID
    And I send the GET request to "claimtypes_getallcombinations" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.data|array|
      |$.status|number|

  @Positive @Functional
  Scenario: TC_09 Get all combinations for claim type ID 4
    And I send the GET request to "claimtypes_getallcombinations" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|4|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
      |$.data|[]|
      |$.status|200|

  @Positive @Performance
  Scenario: TC_10 Performance test for all combinations endpoint
    And I send the GET request to "claimtypes_getallcombinations" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|4|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Positive @Concurrency
  Scenario: TC_11 Concurrent access test for all combinations endpoint
    And I send the GET request to "claimtypes_getallcombinations" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|4|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @Validation
  Scenario: TC_12 Get all combinations with invalid claim type ID
    And I send the GET request to "claimtypes_getallcombinations" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|99999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.data|array|
      |$.status|number|

  @Negative @Validation
  Scenario: TC_13 Get all combinations with special characters in path parameter
    And I send the GET request to "claimtypes_getallcombinations" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|<script>alert('XSS')</script>|
    Then I should see the response code as "STATUS_404_NOT_FOUND"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_14 Get all combinations with SQL injection attempt in path parameter
    And I send the GET request to "claimtypes_getallcombinations" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|'; DROP TABLE claimtypes; --|
    Then I should see the response code as "STATUS_404_NOT_FOUND"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_15 Get all combinations with invalid query parameters
    And I send the GET request to "claimtypes_getallcombinations" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|4|
      |invalid_param|invalid_value|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @ErrorHandling
  Scenario: TC_16 Get all combinations with invalid endpoint
    And I send the GET request to "claimtypes_getallcombinations_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|4|
    Then I should see the response code as "STATUS_404_NOT_FOUND"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_17 Validate all combinations business logic
    And I send the GET request to "claimtypes_getallcombinations" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|4|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
      |$.status|200|

  @Positive @DataIntegrity
  Scenario: TC_18 Validate all combinations data integrity
    And I send the GET request to "claimtypes_getallcombinations" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|4|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|array|
      |$.status|number|

  @Positive @Regression
  Scenario: TC_19 Regression test for all combinations endpoint
    And I send the GET request to "claimtypes_getallcombinations" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|4|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
      |$.data|[]|
      |$.status|200|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|array|
      |$.status|number|

  @Positive @Functional
  Scenario: TC_20 Validate all combinations response completeness
    And I send the GET request to "claimtypes_getallcombinations" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|4|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
      |$.data|[]|
      |$.status|200|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|array|
      |$.status|number|

  @Positive @ArrayValidation
  Scenario: TC_21 Validate all combinations array structure and content
    And I send the GET request to "claimtypes_getallcombinations" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|4|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

  @Positive @ContentValidation
  Scenario: TC_22 Validate all combinations content structure
    And I send the GET request to "claimtypes_getallcombinations" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|4|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |result|
      |reason|
      |data|
      |status|

  @Positive @LoadTesting
  Scenario: TC_23 Load testing for all combinations endpoint
    And I send the GET request to "claimtypes_getallcombinations" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|4|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @Timeout
  Scenario: TC_24 Test all combinations endpoint timeout handling
    And I send the GET request to "claimtypes_getallcombinations" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|4|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Positive @EndToEnd
  Scenario: TC_25 End-to-end all combinations data retrieval workflow
    And I send the GET request to "claimtypes_getallcombinations" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|4|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
      |$.data|[]|
      |$.status|200|
    And I store the response as "all_combinations_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|array|
      |$.status|number|

