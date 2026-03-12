@BizomWebAPI @CE @BeatsManagement @Beats @GetOutletsForBeatById @ConfigurationSettings
Feature: Beats - Get Outlets For Beat by Id

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get Outlets For Beat by Id - without access token
    When I send the GET request to "getoutletsforbeat_by_id" endpoint with path parameters
      |Path|Value|
      |outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get Outlets For Beat by Id - with invalid access token
    And I send the GET request to "getoutletsforbeat_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get Outlets For Beat by Id - with expired access token
    And I send the GET request to "getoutletsforbeat_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get Outlets For Beat by Id - with malformed access token
    And I send the GET request to "getoutletsforbeat_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Sanity @PathParam
  Scenario: TC_05 Get Outlets For Beat by Id - validate for outletId 1
    And I send the GET request to "getoutletsforbeat_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.outlets|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Positive @AlternateData @PathParam
  Scenario: TC_06 Get Outlets For Beat by Id - validate for outletId 3 (alternate dataset)
    And I send the GET request to "getoutletsforbeat_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|3|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.outlets|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Negative @Validation @PathParam
  Scenario: TC_07 Get Outlets For Beat by Id - invalid path param (non-numeric)
    And I send the GET request to "getoutletsforbeat_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling @PathParam
  Scenario: TC_08 Get Outlets For Beat by Id - invalid endpoint with path param
    And I send the GET request to "getoutletsforbeat_by_id_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Headers
  Scenario: TC_09 Get Outlets For Beat by Id - verify standard headers
    And I send the GET request to "getoutletsforbeat_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Connection|keep-alive|
    And verify response time is less than "1500" milliseconds

  @Positive @Store
  Scenario: TC_10 Get Outlets For Beat by Id - store response
    And I send the GET request to "getoutletsforbeat_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And I store the response as "getoutletsforbeat_by_id_response" name using full path
    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: TC_11 Get Outlets For Beat by Id - performance baseline
    And I send the GET request to "getoutletsforbeat_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds

  @Positive @DataValidation
  Scenario: TC_12 Get Outlets For Beat by Id - validate multiple outlet entries for outletId 1
    And I send the GET request to "getoutletsforbeat_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.outlets['2']|"Sadha Nanda1"|
      |$.outlets['5']|"Poonam Provision"|
      |$.outlets['6']|"Paal General Store"|
      |$.outlets['9']|"Mohan Medicals"|
      |$.outlets['10']|"Ramdev General Store"|
      |$.outlets['669']|"rfg"|
      |$.outlets['741']|"TT"|
      |$.outlets['746']|"DS RO"|
    And verify response time is less than "2000" milliseconds

  @Positive @ObjectTypes
  Scenario: TC_13 Get Outlets For Beat by Id - validate outlets object structure
    And I send the GET request to "getoutletsforbeat_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.|object|
      |$.outlets|object|
      |$.outlets['2']|string|
      |$.outlets['5']|string|
      |$.outlets['10']|string|
    And verify response time is less than "2000" milliseconds

  @Positive @AlternateData @SpecialChars
  Scenario: TC_14 Get Outlets For Beat by Id - validate alternate dataset with special characters (outletId 3)
    And I send the GET request to "getoutletsforbeat_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|3|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.outlets['5381']|"THE OFFICE BAR  RESTAURANT"|
      |$.outlets['5453']|"THE OFFICE BAR RESTAURANT"|
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: TC_15 Get Outlets For Beat by Id - non-existent outlet id
    And I send the GET request to "getoutletsforbeat_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: TC_16 Get Outlets For Beat by Id - tight performance threshold
    And I send the GET request to "getoutletsforbeat_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1000" milliseconds


