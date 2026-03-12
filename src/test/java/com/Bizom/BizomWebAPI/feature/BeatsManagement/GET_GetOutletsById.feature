@BizomWebAPI @CE @BeatsManagement @Beats @GetOutletsById @CoreBusinessOperations
Feature: Beats - Get Outlets By Id

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get Outlets By Id - without access token
    When I send the GET request to "getoutlets_by_id" endpoint with path parameters
      |Path|Value|
      |outletId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get Outlets By Id - with invalid access token
    And I send the GET request to "getoutlets_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get Outlets By Id - with expired access token
    And I send the GET request to "getoutlets_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get Outlets By Id - with malformed access token
    And I send the GET request to "getoutlets_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Sanity @PathParam
  Scenario: TC_05 Get Outlets By Id - validate top-level fields for outletId 1
    And I send the GET request to "getoutlets_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|
      |$.Data.unames|string|
      |$.Data.Outlets|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.Data.unames|"No Users assigned for this beat"|

  @Positive @DataValidation
  Scenario: TC_06 Get Outlets By Id - validate nested outlet structure for id 2
    And I send the GET request to "getoutlets_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data.Outlets.2.Outlet.id|string|
      |$.Data.Outlets.2.Outlet.name|string|
      |$.Data.Outlets.2.Outlet.approved|string|
      |$.Data.Outlets.2.Area.id|string|
      |$.Data.Outlets.2.Area.name|string|
      |$.Data.Outlets.2.Warehouse.id|string|

  @Negative @Validation @PathParam
  Scenario: TC_07 Get Outlets By Id - invalid path param (non-numeric)
    And I send the GET request to "getoutlets_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling @PathParam
  Scenario: TC_08 Get Outlets By Id - invalid endpoint with path param
    And I send the GET request to "getoutlets_by_id_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: TC_09 Get Outlets By Id - performance baseline
    And I send the GET request to "getoutlets_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds

  @Positive @Headers
  Scenario: TC_10 Get Outlets By Id - verify standard headers
    And I send the GET request to "getoutlets_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Connection|keep-alive|
    And verify response time is less than "1500" milliseconds

  @Positive @Store
  Scenario: TC_11 Get Outlets By Id - store response
    And I send the GET request to "getoutlets_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And I store the response as "getoutlets_by_id_response" name using full path
    And verify response time is less than "2000" milliseconds

  @Positive @Contains
  Scenario: TC_12 Get Outlets By Id - response contains expected outlet keys
    And I send the GET request to "getoutlets_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And validating the response contains the following values
      |Value|
      |Data|
      |Outlets|
      |2|
      |5|
      |6|
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: TC_13 Get Outlets By Id - non-existent outlet id
    And I send the GET request to "getoutlets_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_14 Get Outlets By Id - SQL injection attempt in query param
    And I send the GET request to "getoutlets_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |test_param|'; DROP TABLE outlets; --|outletId|1|
      |access_token|ACCESS_TOKEN|||
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_15 Get Outlets By Id - XSS attempt in query param
    And I send the GET request to "getoutlets_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |test_param|<script>alert('x')</script>|outletId|1|
      |access_token|ACCESS_TOKEN|||
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Positive @Concurrency
  Scenario: TC_16 Get Outlets By Id - concurrency baseline
    And I send the GET request to "getoutlets_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds


