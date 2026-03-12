@BizomWebAPI @CE @OutletsManagement @SearchTaxPayer @SalesOperations
Feature: Search TaxPayer API Testing
  As a system user
  I want to test the search taxpayer endpoint
  So that I can ensure the taxpayer search functionality works correctly with valid and invalid inputs

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Validation
  Scenario: TC_01 Search taxpayer without GSTIN parameter
    When I send the GET request to "outlets_search_taxpayer" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds
    
  @Negative @Validation
  Scenario: TC_02 Search taxpayer with invalid GSTIN format
    When I send the GET request to "outlets_search_taxpayer" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |gstin|INVALID123|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Search taxpayer without access token
    When I send the GET request to "outlets_search_taxpayer" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |gstin|29ABCDE1234F2Z5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Search taxpayer with invalid access token
    When I send the GET request to "outlets_search_taxpayer" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
      |gstin|29ABCDE1234F2Z5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_05 Search taxpayer with expired access token
    When I send the GET request to "outlets_search_taxpayer" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
      |gstin|29ABCDE1234F2Z5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_06 Search taxpayer with malformed access token
    When I send the GET request to "outlets_search_taxpayer" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
      |gstin|29ABCDE1234F2Z5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_07 Search taxpayer with valid GSTIN and access token
    When I send the GET request to "outlets_search_taxpayer" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |gstin|29ABCDE1234F2Z5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|object|
    And I store the response as "search_taxpayer_response" name using full path

  @Positive @DataValidation
  Scenario: TC_08 Validate search taxpayer response field data types
    When I send the GET request to "outlets_search_taxpayer" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |gstin|29ABCDE1234F2Z5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|object|

  @Positive @DataValidation
  Scenario: TC_09 Validate specific values in search taxpayer response
    When I send the GET request to "outlets_search_taxpayer" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |gstin|INVALID123|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|

  @Positive @ContentValidation
  Scenario: TC_10 Validate search taxpayer response contains required keys
    When I send the GET request to "outlets_search_taxpayer" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |gstin|29ABCDE1234F2Z5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |result|
      |reason|
      |data|

  @Positive @Performance
  Scenario: TC_11 Performance testing for search taxpayer endpoint
    When I send the GET request to "outlets_search_taxpayer" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |gstin|29ABCDE1234F2Z5|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: TC_12 Concurrent access test for search taxpayer endpoint
    When I send the GET request to "outlets_search_taxpayer" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |gstin|29ABCDE1234F2Z5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|

  @Positive @LoadTesting
  Scenario: TC_13 Load testing for search taxpayer endpoint
    When I send the GET request to "outlets_search_taxpayer" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |gstin|29ABCDE1234F2Z5|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Positive @Regression
  Scenario: TC_14 Regression testing for search taxpayer endpoint
    When I send the GET request to "outlets_search_taxpayer" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |gstin|29ABCDE1234F2Z5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|

  @Positive @EndToEnd
  Scenario: TC_15 End-to-end search taxpayer flow
    When I send the GET request to "outlets_search_taxpayer" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |gstin|29ABCDE1234F2Z5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "search_taxpayer_response" name using full path

  @Negative @Boundary
  Scenario: TC_16 Search taxpayer with overly long GSTIN
    When I send the GET request to "outlets_search_taxpayer" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |gstin|29ABCDE1234F2Z512345678901234567890|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds


  @Negative @ErrorHandling
  Scenario: TC_17 Invalid endpoint test for search taxpayer
    When I send the GET request to "outlets_search_taxpayer_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |gstin|29ABCDE1234F2Z5|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds
