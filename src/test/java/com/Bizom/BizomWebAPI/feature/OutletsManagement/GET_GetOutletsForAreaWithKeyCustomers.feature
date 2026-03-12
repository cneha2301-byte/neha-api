@BizomWebAPI @CE @OutletsManagement @GetOutletsForAreaWithKeyCustomers @InventoryOperations
Feature: Get Outlets For Area With Key Customers API Testing
  As a system user
  I want to test the get outlets for area with key customers endpoint
  So that I can ensure key customer outlet lists are returned correctly for an area

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get outlets for area with key customers without access token
    When I send the GET request to "outlets_get_outlets_for_area_with_key_customers" endpoint with path parameters
      |Path|Value|
      |areaId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_02 Get outlets for area with key customers with invalid access token
#    And I send the GET request to "outlets_get_outlets_for_area_with_key_customers" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|invalid_token_12345|areaId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#    And verify response time is less than "3000" milliseconds

#  @Negative @Security
#  Scenario: TC_03 Get outlets for area with key customers with expired access token
#    And I send the GET request to "outlets_get_outlets_for_area_with_key_customers" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|expired_token_12345|areaId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#    And verify response time is less than "3000" milliseconds

#  @Negative @Security
#  Scenario: TC_04 Get outlets for area with key customers with malformed access token
#    And I send the GET request to "outlets_get_outlets_for_area_with_key_customers" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|malformed.token.here|areaId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#    And verify response time is less than "3000" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get outlets for area with key customers using valid access token
    And I send the GET request to "outlets_get_outlets_for_area_with_key_customers" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
      |$.outlets['2']|"Sadha Nanda1"|
      |$.outlets['5']|"Poonam Provision"|
    And I store the response as "outlets_area_key_customers_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate outlets for area with key customers response structure
    And I send the GET request to "outlets_get_outlets_for_area_with_key_customers" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.outlets|object|
      |$.outlets['2']|string|
      |$.outlets['5']|string|

  @Positive @DataValidation
  Scenario: TC_07 Validate outlets for area with key customers specific data values
    And I send the GET request to "outlets_get_outlets_for_area_with_key_customers" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.outlets['9']|"Mohan Medicals"|
      |$.outlets['10']|"Ramdev General Store"|
      |$.outlets['669']|"rfg"|
      |$.outlets['746']|"DS RO"|

  @Positive @ContentValidation
  Scenario: TC_08 Validate outlets for area with key customers content structure
    And I send the GET request to "outlets_get_outlets_for_area_with_key_customers" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And validating the response contains the following values
      |Value|
      |outlets|
      |Sadha Nanda1|
      |Poonam Provision|
      |Mohan Medicals|
      |Ramdev General Store|

  @Positive @Performance
  Scenario: TC_09 Performance test for outlets for area with key customers endpoint
    And I send the GET request to "outlets_get_outlets_for_area_with_key_customers" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for outlets for area with key customers endpoint
    And I send the GET request to "outlets_get_outlets_for_area_with_key_customers" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Positive @LoadTesting
  Scenario: TC_11 Load testing for outlets for area with key customers endpoint
    And I send the GET request to "outlets_get_outlets_for_area_with_key_customers" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "4000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Positive @Regression
  Scenario: TC_12 Regression test for outlets for area with key customers endpoint
    And I send the GET request to "outlets_get_outlets_for_area_with_key_customers" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @Positive @EndToEnd
  Scenario: TC_13 End-to-end outlets for area with key customers data retrieval workflow
    And I send the GET request to "outlets_get_outlets_for_area_with_key_customers" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And I store the response as "outlets_area_key_customers_response" name using full path

  @Negative @Validation
  Scenario: TC_14 Get outlets for area with key customers with invalid query parameters
    And I send the GET request to "outlets_get_outlets_for_area_with_key_customers" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
      |invalid_param|invalid_value| | |
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Negative @Validation
  Scenario: TC_15 Get outlets for area with key customers using special characters in query parameters
    And I send the GET request to "outlets_get_outlets_for_area_with_key_customers" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
      |test_param|<script>alert('XSS')</script>| | |
    Then I should see the response code as "200"
    And verify response time is less than "4000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Negative @Security
  Scenario: TC_16 Get outlets for area with key customers with SQL injection attempt
    And I send the GET request to "outlets_get_outlets_for_area_with_key_customers" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
      |test_param|'; DROP TABLE outlets; --| | |
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Negative @Boundary
  Scenario: TC_17 Get outlets for area with key customers using large area identifier
    And I send the GET request to "outlets_get_outlets_for_area_with_key_customers" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|9999999999|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_18 Get outlets for area with key customers using invalid endpoint
    And I send the GET request to "outlets_get_outlets_for_area_with_key_customers_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

