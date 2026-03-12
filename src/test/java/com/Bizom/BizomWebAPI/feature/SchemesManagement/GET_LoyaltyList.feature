@BizomWebAPI @PI @SchemesManagement @LoyaltyList @PaymentProcessing
Feature: LoyaltyList API Testing
  As a system user
  I want to test the loyaltylist endpoint
  So that I can ensure proper functionality and data retrieval for loyalty schemes list with pagination

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get loyalty list without access token
    When I send the GET request to "loyalty_list" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |sEcho|1|
      |iColumns|5|
      |iDisplayStart|0|
      |iDisplayLength|10|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get loyalty list with invalid access token
    And I send the GET request to "loyalty_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
      |sEcho|1|
      |iColumns|5|
      |iDisplayStart|0|
      |iDisplayLength|10|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get loyalty list with expired access token
    And I send the GET request to "loyalty_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
      |sEcho|1|
      |iColumns|5|
      |iDisplayStart|0|
      |iDisplayLength|10|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get loyalty list with malformed access token
    And I send the GET request to "loyalty_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
      |sEcho|1|
      |iColumns|5|
      |iDisplayStart|0|
      |iDisplayLength|10|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_05 Get loyalty list with empty access token
    And I send the GET request to "loyalty_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token||
      |sEcho|1|
      |iColumns|5|
      |iDisplayStart|0|
      |iDisplayLength|10|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_06 Get loyalty list with valid parameters
    And I send the GET request to "loyalty_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|5|
      |iDisplayStart|0|
      |iDisplayLength|10|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|
      |$.sEcho|1|
      |$.aaData|[]|
    And I store the response as "loyaltylist_response" name using full path

  @Positive @DataValidation
  Scenario: TC_07 Validate loyalty list response structure
    And I send the GET request to "loyalty_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|5|
      |iDisplayStart|0|
      |iDisplayLength|10|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|
      |$.sEcho|1|
      |$.aaData|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.sEcho|number|
      |$.aaData|array|

  @Positive @DataValidation
  Scenario: TC_08 Validate aaData array is empty
    And I send the GET request to "loyalty_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|5|
      |iDisplayStart|0|
      |iDisplayLength|10|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.aaData|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData|array|

  @Positive @DataValidation
  Scenario: TC_09 Validate loyalty list response contains required fields
    And I send the GET request to "loyalty_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|5|
      |iDisplayStart|0|
      |iDisplayLength|10|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |iTotalRecords|
      |iTotalDisplayRecords|
      |sEcho|
      |aaData|

  @Negative @Validation
  Scenario: TC_10 Get loyalty list with invalid sEcho
    And I send the GET request to "loyalty_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|abc|
      |iColumns|5|
      |iDisplayStart|0|
      |iDisplayLength|10|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_11 Get loyalty list with invalid iDisplayStart
    And I send the GET request to "loyalty_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|5|
      |iDisplayStart|xyz|
      |iDisplayLength|10|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_12 Get loyalty list with invalid iDisplayLength
    And I send the GET request to "loyalty_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|5|
      |iDisplayStart|0|
      |iDisplayLength|invalid|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_13 Get loyalty list with missing sEcho
    And I send the GET request to "loyalty_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |iColumns|5|
      |iDisplayStart|0|
      |iDisplayLength|10|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_14 Get loyalty list with missing iDisplayStart
    And I send the GET request to "loyalty_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|5|
      |iDisplayLength|10|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_15 Get loyalty list with missing iDisplayLength
    And I send the GET request to "loyalty_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|5|
      |iDisplayStart|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_16 Get loyalty list with invalid endpoint
    And I send the GET request to "loyalty_list_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|5|
      |iDisplayStart|0|
      |iDisplayLength|10|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: TC_17 Performance test for loyalty list endpoint
    And I send the GET request to "loyalty_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|5|
      |iDisplayStart|0|
      |iDisplayLength|10|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.aaData|[]|

  @Positive @BusinessLogic
  Scenario: TC_18 Get loyalty list with different sEcho value
    And I send the GET request to "loyalty_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|2|
      |iColumns|5|
      |iDisplayStart|0|
      |iDisplayLength|10|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

  @Positive @BusinessLogic
  Scenario: TC_19 Get loyalty list with different pagination parameters
    And I send the GET request to "loyalty_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|5|
      |iDisplayStart|10|
      |iDisplayLength|20|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.iTotalRecords|0|
      |$.aaData|[]|

  @Positive @Boundary
  Scenario: TC_20 Get loyalty list with zero iDisplayStart
    And I send the GET request to "loyalty_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|5|
      |iDisplayStart|0|
      |iDisplayLength|10|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.aaData|[]|

  @Positive @Boundary
  Scenario: TC_21 Get loyalty list with zero iDisplayLength
    And I send the GET request to "loyalty_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|5|
      |iDisplayStart|0|
      |iDisplayLength|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Boundary
  Scenario: TC_22 Get loyalty list with very large iDisplayLength
    And I send the GET request to "loyalty_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|5|
      |iDisplayStart|0|
      |iDisplayLength|2147483647|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Regression
  Scenario: TC_23 Regression test for loyalty list endpoint
    And I send the GET request to "loyalty_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|5|
      |iDisplayStart|0|
      |iDisplayLength|10|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|
      |$.sEcho|1|
      |$.aaData|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.sEcho|number|
      |$.aaData|array|
    And I store the response as "loyaltylist_response" name using full path

