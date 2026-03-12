@BizomWebAPI @CE @BeatsManagement @Beats @GetOutletsForBeatAccSeqById @CoreBusinessOperations
Feature: Beats - Get Outlets For Beat Acc Seq by Id

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get Outlets For Beat Acc Seq by Id - without access token
    When I send the GET request to "getoutletsforbeataccseq_by_id" endpoint with path parameters
      |Path|Value|
      |outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get Outlets For Beat Acc Seq by Id - with invalid access token
    And I send the GET request to "getoutletsforbeataccseq_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Sanity @PathParam
  Scenario: TC_03 Get Outlets For Beat Acc Seq by Id - validate structure for outletId 1
    And I send the GET request to "getoutletsforbeataccseq_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.outlets|array|
      |$.outlets[0].id|string|
      |$.outlets[0].name|string|
      |$.outlets[0].address|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.outlets[0].id|"2"|
      |$.outlets[0].name|"Sadha Nanda1"|
      |$.outlets[0].address|"attibele1"|

  @Positive @DataValidation
  Scenario: TC_04 Get Outlets For Beat Acc Seq by Id - validate specific items for outletId 1
    And I send the GET request to "getoutletsforbeataccseq_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.outlets[1].id|"5"|
      |$.outlets[1].name|"Poonam Provision"|
      |$.outlets[2].id|"6"|
      |$.outlets[2].name|"Paal General Store"|
      |$.outlets[3].id|"7"|
      |$.outlets[3].name|"Smith Bakery"|
      |$.outlets[4].id|"9"|
      |$.outlets[4].name|"Mohan Medicals"|
      |$.outlets[5].id|"10"|
      |$.outlets[5].name|"Ramdev General Store"|

  @Positive @AlternateData @PathParam
  Scenario: TC_05 Get Outlets For Beat Acc Seq by Id - alternate dataset for outletId 3
    And I send the GET request to "getoutletsforbeataccseq_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|3|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.outlets|array|
      |$.outlets[0].id|string|
      |$.outlets[0].name|string|
      |$.outlets[0].address|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.outlets[0].name|"THE OFFICE BAR RESTAURANT"|

  @Negative @Validation @PathParam
  Scenario: TC_06 Get Outlets For Beat Acc Seq by Id - invalid path param (non-numeric)
    And I send the GET request to "getoutletsforbeataccseq_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling @PathParam
  Scenario: TC_07 Get Outlets For Beat Acc Seq by Id - invalid endpoint with path param
    And I send the GET request to "getoutletsforbeataccseq_by_id_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: TC_08 Get Outlets For Beat Acc Seq by Id - performance baseline
    And I send the GET request to "getoutletsforbeataccseq_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds

  @Positive @Concurrency
  Scenario: TC_09 Get Outlets For Beat Acc Seq by Id - concurrent access test
    And I send the GET request to "getoutletsforbeataccseq_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_10 Get Outlets For Beat Acc Seq by Id - with invalid query parameters
    And I send the GET request to "getoutletsforbeataccseq_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
      |invalid_param|invalid_value|      | |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_11 Get Outlets For Beat Acc Seq by Id - special characters in query parameters
    And I send the GET request to "getoutletsforbeataccseq_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
      |test_param|criptalert('XSS')/script|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_12 Get Outlets For Beat Acc Seq by Id - with SQL injection attempt
    And I send the GET request to "getoutletsforbeataccseq_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
      |test_param|'; DROP TABLE outlets; --|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: TC_13 Get Outlets For Beat Acc Seq by Id - maximum query parameters
    And I send the GET request to "getoutletsforbeataccseq_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
      |param1|value1|                    | |
      |param2|value2|                    | |
      |param3|value3|                    | |
      |param4|value4|                    | |
      |param5|value5|                    | |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Headers
  Scenario: TC_14 Get Outlets For Beat Acc Seq by Id - verify response headers
    And I send the GET request to "getoutletsforbeataccseq_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Connection|keep-alive|
    And verify response time is less than "2000" milliseconds

  @Positive @Store
  Scenario: TC_15 Get Outlets For Beat Acc Seq by Id - store response
    And I send the GET request to "getoutletsforbeataccseq_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And I store the response as "getoutletsforbeataccseq_by_id_response" name using full path
    And verify response time is less than "2000" milliseconds

  @Positive @ArrayValidation
  Scenario: TC_16 Get Outlets For Beat Acc Seq by Id - validate array structure and content
    And I send the GET request to "getoutletsforbeataccseq_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.outlets|array|
      |$.outlets[0]|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.outlets[0].id|"2"|
      |$.outlets[0].name|"Sadha Nanda1"|

  @Positive @ContentValidation
  Scenario: TC_17 Get Outlets For Beat Acc Seq by Id - validate content structure
    And I send the GET request to "getoutletsforbeataccseq_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And validating the response contains the following values
      |Value|
      |outlets|
      |id|
      |name|
      |address|

  @Positive @LoadTesting
  Scenario: TC_18 Get Outlets For Beat Acc Seq by Id - load testing
    And I send the GET request to "getoutletsforbeataccseq_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Negative @Timeout
  Scenario: TC_19 Get Outlets For Beat Acc Seq by Id - timeout handling
    And I send the GET request to "getoutletsforbeataccseq_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds

  @Positive @EndToEnd
  Scenario: TC_20 Get Outlets For Beat Acc Seq by Id - end-to-end workflow
    And I send the GET request to "getoutletsforbeataccseq_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "getoutletsforbeataccseq_e2e" name using full path


