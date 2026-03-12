@BizomWebAPI @CE @OutletsManagement @Outlet @GetSkusForOutlets @SalesOperations
Feature: Get SKUs For Outlets API Testing
  As a system user
  I want to test the "getSkusForOutlets" endpoint
  So that I can ensure proper functionality, validation, and performance of SKU data retrieval for outlets

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |accept|application/json|
      |Content-Type|application/json|
      |Connection|keep-alive|

  #--------------------------------#
  # SECURITY TEST CASES            #
  #--------------------------------#

  @Negative @Security
  Scenario: TC_01 Get SKUs without access token
    When I send the GET request to "outlets_get_skus_for_outlet" endpoint with path parameters
      |Path|Value|
      |outletId|1|
    Then I should see the response code as "403"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_02 Get SKUs with invalid access token
    And I send the GET request to "outlets_get_skus_for_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_123|outletId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_03 Get SKUs with expired access token
    And I send the GET request to "outlets_get_skus_for_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_123|outletId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_04 Get SKUs with malformed access token
    And I send the GET request to "outlets_get_skus_for_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|outletId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2000" milliseconds

  #--------------------------------#
  # POSITIVE TEST CASES            #
  #--------------------------------#

  @Positive @Smoke
  Scenario: TC_05 Get SKUs for outlet ID 1 with valid access token
    And I send the GET request to "outlets_get_skus_for_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|SKUs fetched successfully.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.outlets|object|

  @Positive @Functional
  Scenario: TC_06 Validate SKUs list for outlet ID 1
    And I send the GET request to "outlets_get_skus_for_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.outlets.1|Cafe Cuba|
      |$.outlets.3|Fanta|
      |$.outlets.4|Slice|
      |$.outlets.5|"Lays " |
      |$.outlets.6|Kurkure|

  @Positive @Performance
  Scenario: TC_07 Performance test for getSkusForOutlets endpoint
    And I send the GET request to "outlets_get_skus_for_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  #--------------------------------#
  # VALIDATION TEST CASES          #
  #--------------------------------#

  @Negative @Validation
  Scenario: TC_08 Get SKUs with invalid outlet ID (non-numeric)
    And I send the GET request to "outlets_get_skus_for_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|abc|
    Then I should see the response code as "500"
    And verify response time is less than "2000" milliseconds

  #--------------------------------#
  # ERROR HANDLING & INVALID URI   #
  #--------------------------------#

#  @Negative @ErrorHandling
#  Scenario: TC_09 Get SKUs with incorrect endpoint name
#    And I send the GET request to "outlets_get_skus_for_outlet_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|outletId|1|
#    Then I should see the response code as "403"
#    And verify response time is less than "2000" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_10 Get SKUs with invalid resource URI (missing outletId path)
    And I send the GET request to "outlets_get_skus_for_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId||
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Invalid outlet ID."|

  #--------------------------------#
  # INTEGRATION TEST CASE          #
  #--------------------------------#

  @Positive @Integration
  Scenario: TC_11 Verify API response matches SKU data from DB
    And I send the GET request to "outlets_get_skus_for_outlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|SKUs fetched successfully.|
      |$.outlets.1|DB:skunits:name:id=1|
      |$.outlets.3|DB:skunits:name:id=3|
      |$.outlets.4|DB:skunits:name:id=4|
      |$.outlets.5|DB:skunits:name:id=5|
      |$.outlets.6|DB:skunits:name:id=6|
