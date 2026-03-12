@BizomWebAPI @MdmsManagement @MdmsForeignKeysInTable @OS
Feature: Foreign Keys In Table API Testing
  As a system user
  I want to test the foreign keys in table endpoint
  So that I can ensure proper functionality and JSON response validation for foreign keys data retrieval

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |priority|u=0, i|
      |sec-ch-ua|"Chromium";v="142", "Google Chrome";v="142", "Not_A Brand";v="99"|
      |sec-ch-ua-mobile|?0|
      |sec-ch-ua-platform|"Windows"|
      |sec-fetch-dest|document|
      |sec-fetch-mode|navigate|
      |sec-fetch-site|none|
      |sec-fetch-user|?1|
      |upgrade-insecure-requests|1|
      |user-agent|Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36|

  @Negative @Security
  Scenario: TC_01 Get foreign keys in table without access token
    When I send the GET request to "mdms_foreign_keys_in_table" endpoint with path parameters
      |Path|Value|
      |id|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get foreign keys in table with invalid access token
    And I send the GET request to "mdms_foreign_keys_in_table" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|id|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get foreign keys in table with expired access token
    And I send the GET request to "mdms_foreign_keys_in_table" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|id|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get foreign keys in table with malformed access token
    And I send the GET request to "mdms_foreign_keys_in_table" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|id|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get foreign keys in table with valid access token and valid ID
    And I send the GET request to "mdms_foreign_keys_in_table" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data|[]|
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json; charset=UTF-8|
    And verify response time is less than "2500" milliseconds
    And I store the response as "mdms_foreign_keys_in_table_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate foreign keys in table JSON response structure
    And I send the GET request to "mdms_foreign_keys_in_table" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data|[]|
    And verify response time is less than "2500" milliseconds

  @Positive @DataValidation
  Scenario: TC_07 Validate foreign keys in table response data types
    And I send the GET request to "mdms_foreign_keys_in_table" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data|[]|
    And verify response time is less than "2500" milliseconds

  @Positive @ContentValidation
  Scenario: TC_08 Validate foreign keys in table response content
    And I send the GET request to "mdms_foreign_keys_in_table" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data|[]|
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |data|

  @Positive @ResponseHeaders
  Scenario: TC_09 Verify foreign keys in table response headers
    And I send the GET request to "mdms_foreign_keys_in_table" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
    Then I should see the response code as "200"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json; charset=UTF-8|
      |Connection|keep-alive|
    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: TC_10 Performance test for foreign keys in table endpoint
    And I send the GET request to "mdms_foreign_keys_in_table" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data|[]|

  @Positive @Concurrency
  Scenario: TC_11 Concurrent access test for foreign keys in table endpoint
    And I send the GET request to "mdms_foreign_keys_in_table" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data|[]|

  @Negative @Validation @PathParam
  Scenario: TC_12 Get foreign keys in table with invalid ID (non-numeric)
    And I send the GET request to "mdms_foreign_keys_in_table" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation @PathParam
  Scenario: TC_13 Get foreign keys in table with invalid ID (negative)
    And I send the GET request to "mdms_foreign_keys_in_table" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation @PathParam
  Scenario: TC_14 Get foreign keys in table with invalid ID (zero)
    And I send the GET request to "mdms_foreign_keys_in_table" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation @PathParam
  Scenario: TC_15 Get foreign keys in table with invalid ID (very large number)
    And I send the GET request to "mdms_foreign_keys_in_table" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|999999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_16 Get foreign keys in table with invalid query parameters
    And I send the GET request to "mdms_foreign_keys_in_table" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |invalid_param|invalid_value|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data|[]|

  @Negative @Validation
  Scenario: TC_17 Get foreign keys in table with special characters in query parameters
    And I send the GET request to "mdms_foreign_keys_in_table" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |test_param|<script>alert('XSS')</script>|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data|[]|

  @Negative @Security
  Scenario: TC_18 Get foreign keys in table with SQL injection attempt in path parameter
    And I send the GET request to "mdms_foreign_keys_in_table" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|'; DROP TABLE mdms; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: TC_19 Get foreign keys in table with maximum query parameters
    And I send the GET request to "mdms_foreign_keys_in_table" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |param1|value1|||
      |param2|value2|||
      |param3|value3|||
      |param4|value4|||
      |param5|value5|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data|[]|

  @Negative @ErrorHandling
  Scenario: TC_20 Get foreign keys in table with invalid endpoint
    And I send the GET request to "mdms_foreign_keys_in_table_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Functional
  Scenario: TC_21 Verify foreign keys in table endpoint functionality
    And I send the GET request to "mdms_foreign_keys_in_table" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
    Then I should see the response code as "200"
    And contentType as "application/json; charset=UTF-8"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data|[]|

  @Positive @BusinessLogic
  Scenario: TC_22 Validate foreign keys in table business logic
    And I send the GET request to "mdms_foreign_keys_in_table" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

  @Positive @DataIntegrity
  Scenario: TC_23 Validate foreign keys in table data integrity
    And I send the GET request to "mdms_foreign_keys_in_table" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data|[]|
    And verify response time is less than "2500" milliseconds

  @Positive @Regression
  Scenario: TC_24 Regression test for foreign keys in table endpoint
    And I send the GET request to "mdms_foreign_keys_in_table" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

  @Positive @Functional
  Scenario: TC_25 Validate foreign keys in table response completeness
    And I send the GET request to "mdms_foreign_keys_in_table" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
    And validating the response contains the following values
      |Value|
      |data|
    And I store the response as "mdms_foreign_keys_in_table_response" name using full path

  @Positive @DataFieldValidation
  Scenario: TC_26 Validate foreign keys in table data array field
    And I send the GET request to "mdms_foreign_keys_in_table" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data|[]|

  @Positive @Functional
  Scenario: TC_27 Get foreign keys in table with different valid IDs
    And I send the GET request to "mdms_foreign_keys_in_table" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

