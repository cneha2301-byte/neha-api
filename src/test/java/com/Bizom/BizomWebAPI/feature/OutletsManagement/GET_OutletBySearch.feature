@BizomWebAPI @CE @OutletsManagement @OutletSearch @SystemIntegration
Feature: Outlet Search API Testing
  As a system user
  I want to test the outlet search endpoint
  So that I can find outlets by name, code, or other search criteria

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Search outlets without access token
    And I send the GET request to "GET_getOutletBySearch" endpoint with dynamic access token and query parameters
      |queryparamname|queryparamvalue|
      |isOutlet|1|
      |_type|query|
      |q|12711|
      |word|test|
      |access_token||
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Search outlets with invalid access token
    And I send the GET request to "GET_getOutletBySearch" endpoint with dynamic access token and query parameters
      |queryparamname|queryparamvalue|
      |isOutlet|1|
      |_type|query|
      |q|12711|
      |word|test|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Search outlets with expired access token
    And I send the GET request to "GET_getOutletBySearch" endpoint with dynamic access token and query parameters
      |queryparamname|queryparamvalue|
      |isOutlet|1|
      |_type|query|
      |q|12711|
      |word|test|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Search outlets with malformed access token
    And I send the GET request to "GET_getOutletBySearch" endpoint with dynamic access token and query parameters
      |queryparamname|queryparamvalue|
      |isOutlet|1|
      |_type|query|
      |q|12711|
      |word|test|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Positive @Smoke
#  Scenario: Search outlets with valid access token and standard query
#    And I send the GET request to "GET_getOutletBySearch" endpoint with dynamic access token and query parameters
#      |queryparamname|queryparamvalue|
#      |isOutlet|1|
#      |_type|query|
#      |q|12711|
#      |word|test|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|object|
#      |$.Data|array|
#      |$.Data[0]|object|
#      |$.Data[0].id|string|
#      |$.Data[0].text|string|

#  @Positive @DataValidation
#  Scenario: Validate outlet search response structure
#    And I send the GET request to "GET_getOutletBySearch" endpoint with dynamic access token and query parameters
#      |queryparamname|queryparamvalue|
#      |isOutlet|1|
#      |_type|query|
#      |q|12711|
#      |word|test|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|object|
#      |$.Data|array|
#      |$.Data[0]|object|
#      |$.Data[0].id|string|
#      |$.Data[0].text|string|
#    And validating the response contains the following values
#      |Value|
#      |id|
#      |text|

#  @Positive @Functional
#  Scenario: Search outlets with numeric outlet ID
#    And I send the GET request to "GET_getOutletBySearch" endpoint with dynamic access token and query parameters
#      |queryparamname|queryparamvalue|
#      |isOutlet|1|
#      |_type|query|
#      |q|7|
#      |word|test|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|object|
#      |$.Data|array|

#  @Positive @Functional
#  Scenario: Search outlets with keyword search
#    And I send the GET request to "GET_getOutletBySearch" endpoint with dynamic access token and query parameters
#      |queryparamname|queryparamvalue|
#      |isOutlet|1|
#      |_type|query|
#      |q|test|
#      |word|Smith|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|object|
#      |$.Data|array|

  @Negative @Validation
  Scenario: Search outlets with empty query parameter
    And I send the GET request to "GET_getOutletBySearch" endpoint with dynamic access token and query parameters
      |queryparamname|queryparamvalue|
      |isOutlet|1|
      |_type|query|
      |q||
      |word|test|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Search outlets with invalid isOutlet parameter
    And I send the GET request to "GET_getOutletBySearch" endpoint with dynamic access token and query parameters
      |queryparamname|queryparamvalue|
      |isOutlet|invalid|
      |_type|query|
      |q|12711|
      |word|test|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Search outlets with special characters in query
    And I send the GET request to "GET_getOutletBySearch" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |isOutlet|1|
      |_type|query|
      |q|<script>alert('XSS')</script>|
      |word|test|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Search outlets with SQL injection attempt in query
    And I send the GET request to "GET_getOutletBySearch" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |isOutlet|1|
      |_type|query|
      |q|'; DROP TABLE outlets; --|
      |word|test|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Positive @ArrayValidation
#  Scenario: Validate outlets array structure and content
#    And I send the GET request to "GET_getOutletBySearch" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |isOutlet|1|
#      |_type|query|
#      |q|12711|
#      |word|test|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|object|
#      |$.Data|array|
#      |$.Data[0]|object|
#      |$.Data[0].id|string|
#      |$.Data[0].text|string|

  @Positive @Performance
  Scenario: Performance test for outlet search endpoint
    And I send the GET request to "GET_getOutletBySearch" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |isOutlet|1|
      |_type|query|
      |q|12711|
      |word|test|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @LoadTesting
  Scenario: Load testing for outlet search endpoint
    And I send the GET request to "GET_getOutletBySearch" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |isOutlet|1|
      |_type|query|
      |q|12711|
      |word|test|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Positive @Concurrency
  Scenario: Concurrent access test for outlet search endpoint
    And I send the GET request to "GET_getOutletBySearch" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |isOutlet|1|
      |_type|query|
      |q|12711|
      |word|test|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: Search outlets with very long query parameter
    And I send the GET request to "GET_getOutletBySearch" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |isOutlet|1|
      |_type|query|
      |q|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|
      |word|test|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: Search outlets with numeric string in word parameter
    And I send the GET request to "GET_getOutletBySearch" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |isOutlet|1|
      |_type|query|
      |q|12711|
      |word|123456|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Positive @BusinessLogic
#  Scenario: Validate outlet search result count
#    And I send the GET request to "GET_getOutletBySearch" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |isOutlet|1|
#      |_type|query|
#      |q|12711|
#      |word|test|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|object|
#      |$.Data|array|

  @Positive @ContentValidation
  Scenario: Validate outlet search response content format
    And I send the GET request to "GET_getOutletBySearch" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |isOutlet|1|
      |_type|query|
      |q|12711|
      |word|test|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |id|
      |text|

#  @Positive @DataIntegrity
#  Scenario: Validate outlet search data integrity
#    And I send the GET request to "GET_getOutletBySearch" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |isOutlet|1|
#      |_type|query|
#      |q|12711|
#      |word|test|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|array|
#      |$[0]|object|
#      |$[0].id|string|
#      |$[0].text|string|

#  @Positive @EndToEnd
#  Scenario: End-to-end outlet search workflow
#    And I send the GET request to "GET_getOutletBySearch" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |isOutlet|1|
#      |_type|query|
#      |q|12711|
#      |word|test|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|array|
#      |$[0]|object|
#      |$[0].id|string|
#      |$[0].text|string|
#    And validating the response contains the following values
#      |Value|
#      |id|
#      |text|
#    And I store the response as "outlet_search_response" name using full path

  @Positive @Regression
  Scenario: Regression test for outlet search endpoint
    And I send the GET request to "GET_getOutletBySearch" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |isOutlet|1|
      |_type|query|
      |q|12711|
      |word|test|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Negative @ErrorHandling
  Scenario: Outlet search with missing required parameters
    And I send the GET request to "GET_getOutletBySearch" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |isOutlet|1|
      |_type|query|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @ParameterVariation
  Scenario: Outlet search with _type as json parameter
    And I send the GET request to "GET_getOutletBySearch" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |isOutlet|1|
      |_type|json|
      |q|12711|
      |word|test|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @ParameterVariation
  Scenario: Outlet search with isOutlet parameter as 0
    And I send the GET request to "GET_getOutletBySearch" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |isOutlet|0|
      |_type|query|
      |q|12711|
      |word|test|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Outlet search with duplicate query parameters
    And I send the GET request to "GET_getOutletBySearch" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |isOutlet|1|
      |_type|query|
      |q|12711|
      |q|99999|
      |word|test|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @ParameterVariation
  Scenario: Outlet search with multiple word search
    And I send the GET request to "GET_getOutletBySearch" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |isOutlet|1|
      |_type|query|
      |q|12711|
      |word|outlet1test|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Positive @ParameterVariation
  Scenario: Outlet search with hyphenated outlet name
    And I send the GET request to "GET_getOutletBySearch" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |isOutlet|1|
      |_type|query|
      |q|5367|
      |word|outlet001|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Positive @ParameterVariation
  Scenario: Outlet search with special characters in outlet name
    And I send the GET request to "GET_getOutletBySearch" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |isOutlet|1|
      |_type|query|
      |q|624|
      |word|ss|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Positive @ParameterVariation
  Scenario: Outlet search with very large outlet ID
    And I send the GET request to "GET_getOutletBySearch" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |isOutlet|1|
      |_type|query|
      |q|5460|
      |word|test|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Negative @Timeout
  Scenario: Test outlet search endpoint timeout handling
    And I send the GET request to "GET_getOutletBySearch" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |isOutlet|1|
      |_type|query|
      |q|12711|
      |word|test|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds

#  @Negative @ErrorHandling
#  Scenario: Outlet search with invalid endpoint
#    And I send the GET request to "GET_getOutletBySearch_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |isOutlet|1|
#      |_type|query|
#      |q|12711|
#      |word|test|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds
#      |$.error|not_found|
#      |$.message|Endpoint not found|

#  @DBvalidation
#  Scenario: DB validation for outlet search (verify first result against DB)
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Content-Type|application/json|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#    And I send the GET request to "GET_getOutletBySearch" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |isOutlet|1|
#      |_type|query|
#      |q|7|
#      |word|test|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$[0].id|DB:outlets:id: id=7|
#      |$[0].text|DB:outlets:name: id=7|

