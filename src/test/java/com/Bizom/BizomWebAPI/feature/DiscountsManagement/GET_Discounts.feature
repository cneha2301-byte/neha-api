@BizomWebAPI @PI @DiscountsManagement @DiscountsList @IntegrationServices
Feature: Discounts API Testing
  As a system user
  I want to test the discounts endpoint
  So that I can ensure proper functionality and data retrieval for discounts management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get discounts without access token
    When I send the GET request to "discounts_getdiscounts" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get discounts with invalid access token
    And I send the GET request to "discounts_getdiscounts" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_03 Get discounts with valid access token
    And I send the GET request to "discounts_getdiscounts" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And I store the response as "discounts_response" name using full path

  @Positive @DataValidation
  Scenario: TC_04 Validate discounts response structure and data types
    And I send the GET request to "discounts_getdiscounts" endpoint with dynamic access token and query parameters
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
      |$.discounts|array|
      |$.discounts[0]|object|
      |$.discounts[0].Discount|object|
      |$.discounts[0].Discount.id|string|
      |$.discounts[0].Discount.discount|string|
      |$.discounts[0].Outlet|object|
      |$.discounts[0].Outlet.id|string|
      |$.discounts[0].Skunit|object|
      |$.discounts[0].Skunit.id|string|
      |$.discounts[0].Skunit.name|string|
      |$.discounts[0].User|object|
      |$.discounts[0].User.id|string|

  @Positive @ContentValidation
  Scenario: TC_05 Validate discounts response contains expected keys
    And I send the GET request to "discounts_getdiscounts" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response contains the following values
      |Value|
      |discounts|
      |Discount|
      |Outlet|
      |Skunit|
      |User|
      |id|
      |discount|
      |is_active|

  @Positive @Performance
  Scenario: TC_06 Performance test for discounts endpoint
    And I send the GET request to "discounts_getdiscounts" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Security
  Scenario: TC_07 Get discounts with expired access token
    And I send the GET request to "discounts_getdiscounts" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_08 Get discounts with malformed access token
    And I send the GET request to "discounts_getdiscounts" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @DataValidation
  Scenario: TC_09 Validate discounts specific static values
    And I send the GET request to "discounts_getdiscounts" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.discounts[0].Discount.id|"1"|
      |$.discounts[0].Skunit.name|Cafe Cuba|
      |$.discounts[1].Discount.id|"2"|
      |$.discounts[1].Skunit.name|Cafe Cuba|

  @Positive @DataValidation
  Scenario: TC_10 Validate discounts with database verification
    And I send the GET request to "discounts_getdiscounts" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.discounts[0].Skunit.name|DB:skunits:name: id=1|
      |$.discounts[0].User.username|DB:users:username: id=1|

  @Positive @ArrayValidation
  Scenario: TC_11 Validate discounts array structure and content
    And I send the GET request to "discounts_getdiscounts" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.discounts|array|
      |$.discounts[0]|object|
      |$.discounts[1]|object|
      |$.discounts[0].Discount.id|string|
      |$.discounts[1].Discount.id|string|
      |$.discounts[0].Skunit.name|string|
      |$.discounts[1].Skunit.name|string|

  @Positive @LoadTesting
  Scenario: TC_12 Load testing for discounts endpoint
    And I send the GET request to "discounts_getdiscounts" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Timeout
  Scenario: TC_13 Test discounts endpoint timeout handling
    And I send the GET request to "discounts_getdiscounts" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_14 Get discounts with invalid query parameters
    And I send the GET request to "discounts_getdiscounts" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Boundary
  Scenario: TC_15 Get discounts with maximum query parameters
    And I send the GET request to "discounts_getdiscounts" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds


