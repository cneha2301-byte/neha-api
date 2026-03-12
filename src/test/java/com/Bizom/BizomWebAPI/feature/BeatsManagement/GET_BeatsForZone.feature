@BizomWebAPI @CE @BeatsManagement @Beats @BeatsForZone @CoreBusinessOperations
Feature: Beats - Get Beats For Zone by Id

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get Beats For Zone by Id - without access token
    When I send the GET request to "getbeatsforzone_by_id" endpoint with path parameters
      |Path|Value|
      |zoneId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_02 Get Beats For Zone by Id - with invalid access token
    And I send the GET request to "getbeatsforzone_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|zoneId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_03 Get Beats For Zone by Id - with expired access token
    And I send the GET request to "getbeatsforzone_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|zoneId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_04 Get Beats For Zone by Id - with malformed access token
    And I send the GET request to "getbeatsforzone_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|zoneId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get Beats For Zone by Id - zoneId 1 with valid token
    And I send the GET request to "getbeatsforzone_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|zoneId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Connection|keep-alive|

  @Positive @Functional
  Scenario: TC_06 Get Beats For Zone by Id - validate more entries for zoneId 1
    And I send the GET request to "getbeatsforzone_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|zoneId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Positive @AlternateData
  Scenario: TC_07 Get Beats For Zone by Id - zoneId 3 (no user beats)
    And I send the GET request to "getbeatsforzone_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|zoneId|3|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Negative @Validation
  Scenario: TC_08 Get Beats For Zone by Id - invalid path param (non-numeric)
    And I send the GET request to "getbeatsforzone_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|zoneId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: TC_09 Get Beats For Zone by Id - non-existent zoneId
    And I send the GET request to "getbeatsforzone_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|zoneId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_10 Get Beats For Zone by Id - invalid endpoint
    And I send the GET request to "getbeatsforzone_by_id_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|zoneId|1|
    Then I should see the response code as "200"
    
    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: TC_11 Get Beats For Zone by Id - performance baseline
    And I send the GET request to "getbeatsforzone_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|zoneId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds


  @PositiveScenario @PathParam @Sanity
  Scenario: TC_12 Beats For Zone By Id - status code positive case with zoneId 1
    And I send the GET request to "getbeatsforzone_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|zoneId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @PathParam @DataValidation
  Scenario: TC_13 Beats For Zone By Id - validate response structure and content for zoneId 1
    And I send the GET request to "getbeatsforzone_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|zoneId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @PositiveScenario @PathParam @AlternateData
  Scenario: TC_14 Beats For Zone By Id - validate response for zoneId 3 (no user beats)
    And I send the GET request to "getbeatsforzone_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|zoneId|3|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @PositiveScenario @PathParam @DBValidation @DataIntegrity
  Scenario: TC_15 Beats For Zone By Id - comprehensive database validation for zoneId 1
    And I send the GET request to "getbeatsforzone_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|zoneId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @PathParam @DBValidation @Regression
  Scenario: TC_16 Beats For Zone By Id - database consistency validation for zoneId 1
    And I send the GET request to "getbeatsforzone_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|zoneId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @PathParam @DBValidation @EndToEnd
  Scenario: TC_17 Beats For Zone By Id - end-to-end database validation workflow for zoneId 1
    And I send the GET request to "getbeatsforzone_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|zoneId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @PathParam @DBValidation @DataIntegrity
  Scenario: TC_18 Beats For Zone By Id - database validation for zoneId 3
    And I send the GET request to "getbeatsforzone_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|zoneId|3|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @PathParam @DBValidation @BusinessLogic
  Scenario: TC_19 Beats For Zone By Id - validate business logic with database for zoneId 1
    And I send the GET request to "getbeatsforzone_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|zoneId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.['1']|"Silkboard (85)"|
      |$.['31']|"b1 (17)"|
      |$.['35']|"562111erp999 (2)"|

  @PositiveScenario @PathParam @DBValidation @Functional
  Scenario: TC_20 Beats For Zone By Id - functional database validation for zoneId 1
    And I send the GET request to "getbeatsforzone_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|zoneId|1|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "1200" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.['1']|"Silkboard (85)"|
      |$.['31']|"b1 (17)"|
      |$.['35']|"562111erp999 (2)"|

  @PositiveScenario @PathParam @DBValidation @Performance
  Scenario: TC_21 Beats For Zone By Id - database validation with performance check for zoneId 1
    And I send the GET request to "getbeatsforzone_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|zoneId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.['1']|"Silkboard (85)"|
      |$.['31']|"b1 (17)"|
      |$.['35']|"562111erp999 (2)"|

  @PositiveScenario @PathParam @DBValidation @Concurrency
  Scenario: TC_22 Beats For Zone By Id - concurrent database validation for zoneId 1
    And I send the GET request to "getbeatsforzone_by_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|zoneId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.['1']|"Silkboard (85)"|
      |$.['31']|"b1 (17)"|
      |$.['35']|"562111erp999 (2)"|


 


