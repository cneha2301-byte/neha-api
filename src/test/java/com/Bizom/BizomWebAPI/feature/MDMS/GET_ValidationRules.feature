@BizomWebAPI @MDMS @GetValidationRules @OS
Feature: This feature file contains testcases for GET endpoint validationRules
  As a system user
  I want to test the validationRules endpoint
  So that I can ensure proper functionality and data retrieval for validation rules

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |accept-language|en-US,en;q=0.9|
      |cache-control|max-age=0|
      |priority|u=0, i|
      |sec-ch-ua|"Google Chrome";v="143", "Chromium";v="143", "Not A(Brand";v="24"|
      |sec-ch-ua-mobile|?0|
      |sec-ch-ua-platform|"Windows"|
      |sec-fetch-dest|document|
      |sec-fetch-mode|navigate|
      |sec-fetch-site|none|
      |sec-fetch-user|?1|
      |upgrade-insecure-requests|1|
      |user-agent|Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36|

  @Positive @Smoke
  Scenario: TC_01 Get validation rules with valid request
    And I send the GET request to "validationrules" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data.1.id|string|
      |$.data.1.validationtype|string|
    And I store the response as "validationrules_response" name using full path

  @Positive @DataValidation
  Scenario: TC_02 Validate validation rules response structure and sample data
    And I send the GET request to "validationrules" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data.1.id|string|
      |$.data.1.validationtype|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data.1.id|"1"|
      |$.data.1.validationtype|None|
      |$.data.1.hasvalue|false|
      |$.data.2.id|"2"|
      |$.data.2.validationtype|Value exists in foreign table|
      |$.data.2.hasvalue|false|

  @Positive @DataValidation
  Scenario: TC_03 Validate all validation types in response
    And I send the GET request to "validationrules" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data.1.validationtype|string|
      |$.data.2.validationtype|string|
      |$.data.3.validationtype|string|
      |$.data.4.validationtype|string|
      |$.data.5.validationtype|string|
      |$.data.6.validationtype|string|
      |$.data.7.validationtype|string|
      |$.data.8.validationtype|string|
      |$.data.9.validationtype|string|
      |$.data.10.validationtype|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data.1.validationtype|None|
      |$.data.2.validationtype|Value exists in foreign table|
      |$.data.3.validationtype|Is email|
      |$.data.4.validationtype|Is mobile|
      |$.data.5.validationtype|Boolean (0 or 1)|
      |$.data.6.validationtype|Date (YYYY-MM-DD)|
      |$.data.7.validationtype|Datetime (YYYY-MM-DD H:i:s)|
      |$.data.8.validationtype|User defined method|
      |$.data.9.validationtype|Is unique|
      |$.data.10.validationtype|Max length|

  @Positive @DataValidation
  Scenario: TC_04 Validate hasvalue field for all rules
    And I send the GET request to "validationrules" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data.1.hasvalue|false|
      |$.data.2.hasvalue|false|
      |$.data.3.hasvalue|false|
      |$.data.4.hasvalue|false|
      |$.data.5.hasvalue|false|
      |$.data.6.hasvalue|false|
      |$.data.7.hasvalue|false|
      |$.data.8.hasvalue|"1"|
      |$.data.9.hasvalue|false|
      |$.data.10.hasvalue|"1"|

  @Positive @DataIntegrity
  Scenario: TC_05 Validate validation rules data integrity
    And I send the GET request to "validationrules" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data.1.id|string|
      |$.data.1.validationtype|string|
      |$.data.2.id|string|
      |$.data.2.validationtype|string|
      |$.data.3.id|string|
      |$.data.3.validationtype|string|

  @Positive @Functional
  Scenario: TC_06 Validate validation rules response completeness
    And I send the GET request to "validationrules" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data.1|object|
      |$.data.2|object|
      |$.data.3|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data.1.id|"1"|
      |$.data.2.id|"2"|
      |$.data.3.id|"3"|
    And validating the response contains the following values
      |Value|
      |data|
      |id|
      |validationtype|
      |hasvalue|

  @Positive @ContentValidation
  Scenario: TC_07 Validate validation rules content structure
    And I send the GET request to "validationrules" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |data|
      |id|
      |validationtype|
      |hasvalue|
      |None|
      |Is email|
      |Is mobile|

  @Positive @EndToEnd
  Scenario: TC_08 End-to-end validation rules data retrieval workflow
    And I send the GET request to "validationrules" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "validationrules_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data.1.id|string|
      |$.data.1.validationtype|string|
      |$.data.2.id|string|
      |$.data.2.validationtype|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data.1.id|"1"|
      |$.data.1.validationtype|None|
      |$.data.2.id|"2"|
      |$.data.2.validationtype|Value exists in foreign table|

  @Negative @Security
  Scenario: TC_09 Get validation rules with invalid access token
    And I send the GET request to "validationrules" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_10 Get validation rules with expired access token
    And I send the GET request to "validationrules" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_11 Get validation rules with malformed access token
    And I send the GET request to "validationrules" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_12 Get validation rules with invalid resource URI
    When I send the GET request to "validationrules_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

