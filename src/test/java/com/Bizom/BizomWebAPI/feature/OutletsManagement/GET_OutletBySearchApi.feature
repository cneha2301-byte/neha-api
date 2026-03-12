@BizomWebAPI @CE @OutletsManagement @OutletSearchApi @SystemIntegration
Feature: Outlet Search API (getOutletBySearchApi) Testing
  As a system user
  I want to test the outlet search API endpoint
  So that I can find outlets by search criteria with dynamic word parameter

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Search outlets via API without access token
    And I send the GET request to "GET_getOutletBySearchApi" endpoint with dynamic access token and query parameters
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
  Scenario: Search outlets via API with invalid access token
    And I send the GET request to "GET_getOutletBySearchApi" endpoint with dynamic access token and query parameters
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
  Scenario: Search outlets via API with expired access token
    And I send the GET request to "GET_getOutletBySearchApi" endpoint with dynamic access token and query parameters
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
  Scenario: Search outlets via API with malformed access token
    And I send the GET request to "GET_getOutletBySearchApi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |isOutlet|1|
      |_type|query|
      |q|12711|
      |word|test|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Search outlets via API with valid access token and standard query
    And I send the GET request to "GET_getOutletBySearchApi" endpoint with dynamic access token and query parameters
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
      |$[0]|object|
      |$[0].id|string|
      |$[0].text|string|

  @Positive @DataValidation
  Scenario: Validate outlet search API response structure
    And I send the GET request to "GET_getOutletBySearchApi" endpoint with dynamic access token and query parameters
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
      |$[0]|object|
      |$[0].id|string|
      |$[0].text|string|
    And validating the response contains the following values
      |Value|
      |id|
      |text|

  @Positive @Functional
  Scenario: Search outlets via API with numeric outlet ID
    And I send the GET request to "GET_getOutletBySearchApi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |isOutlet|1|
      |_type|query|
      |q|7|
      |word|Smith|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Positive @Functional
  Scenario: Search outlets via API with keyword search
    And I send the GET request to "GET_getOutletBySearchApi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |isOutlet|1|
      |_type|query|
      |q|test|
      |word|Smith|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Negative @Validation
  Scenario: Search outlets via API with empty query parameter
    And I send the GET request to "GET_getOutletBySearchApi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |isOutlet|1|
      |_type|query|
      |q||
      |word|test|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Search outlets via API with empty word parameter
    And I send the GET request to "GET_getOutletBySearchApi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |isOutlet|1|
      |_type|query|
      |q|12711|
      |word||
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Search outlets via API with invalid isOutlet parameter
    And I send the GET request to "GET_getOutletBySearchApi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |isOutlet|invalid|
      |_type|query|
      |q|12711|
      |word|test|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Search outlets via API with special characters in query
    And I send the GET request to "GET_getOutletBySearchApi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |isOutlet|1|
      |_type|query|
      |q|<script>alert('XSS')</script>|
      |word|test|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Search outlets via API with SQL injection attempt in query
    And I send the GET request to "GET_getOutletBySearchApi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |isOutlet|1|
      |_type|query|
      |q|'; DROP TABLE outlets; --|
      |word|test|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @ArrayValidation
  Scenario: Validate outlets array structure and content via API
    And I send the GET request to "GET_getOutletBySearchApi" endpoint with dynamic access token and query parameters
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
      |$[0]|object|
      |$[0].id|string|
      |$[0].text|string|

  @Positive @Performance
  Scenario: Performance test for outlet search API endpoint
    And I send the GET request to "GET_getOutletBySearchApi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |isOutlet|1|
      |_type|query|
      |q|12711|
      |word|test|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @LoadTesting
  Scenario: Load testing for outlet search API endpoint
    And I send the GET request to "GET_getOutletBySearchApi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |isOutlet|1|
      |_type|query|
      |q|12711|
      |word|test|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Positive @Concurrency
  Scenario: Concurrent access test for outlet search API endpoint
    And I send the GET request to "GET_getOutletBySearchApi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |isOutlet|1|
      |_type|query|
      |q|12711|
      |word|test|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: Search outlets via API with very long query parameter
    And I send the GET request to "GET_getOutletBySearchApi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |isOutlet|1|
      |_type|query|
      |q|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|
      |word|test|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: Search outlets via API with very long word parameter
    And I send the GET request to "GET_getOutletBySearchApi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |isOutlet|1|
      |_type|query|
      |q|12711|
      |word|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: Search outlets via API with numeric string in word parameter
    And I send the GET request to "GET_getOutletBySearchApi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |isOutlet|1|
      |_type|query|
      |q|12711|
      |word|123456|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate outlet search API result count
    And I send the GET request to "GET_getOutletBySearchApi" endpoint with dynamic access token and query parameters
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

  @Positive @ContentValidation
  Scenario: Validate outlet search API response content format
    And I send the GET request to "GET_getOutletBySearchApi" endpoint with dynamic access token and query parameters
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

  @Positive @DataIntegrity
  Scenario: Validate outlet search API data integrity
    And I send the GET request to "GET_getOutletBySearchApi" endpoint with dynamic access token and query parameters
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
      |$[0]|object|
      |$[0].id|string|
      |$[0].text|string|

  @Positive @EndToEnd
  Scenario: End-to-end outlet search API workflow
    And I send the GET request to "GET_getOutletBySearchApi" endpoint with dynamic access token and query parameters
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
      |$[0]|object|
      |$[0].id|string|
      |$[0].text|string|
    And validating the response contains the following values
      |Value|
      |id|
      |text|
    And I store the response as "outlet_search_api_response" name using full path

  @Positive @Regression
  Scenario: Regression test for outlet search API endpoint
    And I send the GET request to "GET_getOutletBySearchApi" endpoint with dynamic access token and query parameters
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
  Scenario: Search outlets via API with missing query parameter
    And I send the GET request to "GET_getOutletBySearchApi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |isOutlet|1|
      |_type|query|
      |word|test|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @ParameterVariation
  Scenario: Outlet search via API with _type as json parameter
    And I send the GET request to "GET_getOutletBySearchApi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |isOutlet|1|
      |_type|json|
      |q|12711|
      |word|test|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @ParameterVariation
  Scenario: Outlet search via API with isOutlet parameter as 0
    And I send the GET request to "GET_getOutletBySearchApi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |isOutlet|0|
      |_type|query|
      |q|12711|
      |word|test|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Outlet search via API with duplicate query parameters
    And I send the GET request to "GET_getOutletBySearchApi" endpoint with dynamic access token and query parameters
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
  Scenario: Outlet search via API with multiple word search
    And I send the GET request to "GET_getOutletBySearchApi" endpoint with dynamic access token and query parameters
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
  Scenario: Outlet search via API with hyphenated outlet name
    And I send the GET request to "GET_getOutletBySearchApi" endpoint with dynamic access token and query parameters
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
  Scenario: Outlet search via API with special characters in outlet name
    And I send the GET request to "GET_getOutletBySearchApi" endpoint with dynamic access token and query parameters
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
  Scenario: Outlet search via API with very large outlet ID
    And I send the GET request to "GET_getOutletBySearchApi" endpoint with dynamic access token and query parameters
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

  @Positive @ParameterVariation
  Scenario: Outlet search via API with Smith Bakery outlet
    And I send the GET request to "GET_getOutletBySearchApi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |isOutlet|1|
      |_type|query|
      |q|7|
      |word|Bakery|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Negative @Timeout
  Scenario: Test outlet search API endpoint timeout handling
    And I send the GET request to "GET_getOutletBySearchApi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |isOutlet|1|
      |_type|query|
      |q|12711|
      |word|test|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds

#  @Negative @ErrorHandling
#  Scenario: Outlet search via API with invalid endpoint
#    And I send the GET request to "GET_getOutletBySearchApi_invalid" endpoint with dynamic access token and query parameters
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
#  Scenario: DB validation for outlet search API (verify first result against DB)
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Content-Type|application/json|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#    And I send the GET request to "GET_getOutletBySearchApi" endpoint with dynamic access token and query parameters
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
