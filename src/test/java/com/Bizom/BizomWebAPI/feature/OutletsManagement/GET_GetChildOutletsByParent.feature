@BizomWebAPI @CE @OutletsManagement @GetChildOutletsByParent @SystemOperations
Feature: Get Child Outlets By Parent API Testing
  As a system user
  I want to test the get child outlets by parent endpoint
  So that I can ensure proper functionality and data retrieval for child outlets based on parent outlet ID

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get child outlets by parent without access token
    When I send the GET request to "outlets_get_child_outlets_by_parent" endpoint with path parameters
      |Path|Value|
      |outletId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_02 Get child outlets by parent with invalid access token
    And I send the GET request to "outlets_get_child_outlets_by_parent" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|outletId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_03 Get child outlets by parent with expired access token
    And I send the GET request to "outlets_get_child_outlets_by_parent" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|outletId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_04 Get child outlets by parent with malformed access token
    And I send the GET request to "outlets_get_child_outlets_by_parent" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|outletId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get child outlets by parent for outlet ID 1 with valid access token
    And I send the GET request to "outlets_get_child_outlets_by_parent" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.outlets|object|

  @Positive @Functional
  Scenario: TC_06 Get child outlets by parent for outlet ID 2 with valid access token
    And I send the GET request to "outlets_get_child_outlets_by_parent" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.outlets|object|

  @Negative @Validation
  Scenario: TC_07 Get child outlets by parent with invalid outlet ID
    And I send the GET request to "outlets_get_child_outlets_by_parent" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|abc|
    Then I should see the response code as "500"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: TC_08 Get child outlets by parent with non-existent outlet ID
    And I send the GET request to "outlets_get_child_outlets_by_parent" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

#  @Negative @ErrorHandling
#  Scenario: TC_09 Get child outlets by parent with invalid endpoint
#    And I send the GET request to "outlets_get_child_outlets_by_parent_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|outletId|1|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: TC_10 Performance test for get child outlets by parent endpoint
    And I send the GET request to "outlets_get_child_outlets_by_parent" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Regression
  Scenario: TC_11 Regression test for get child outlets by parent endpoint
    And I send the GET request to "outlets_get_child_outlets_by_parent" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Positive @Smoke @DatabaseValidation
  Scenario: TC_12 Get child outlets by parent for outlet ID 1 with database validation
    And I send the GET request to "outlets_get_child_outlets_by_parent" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|true|
      |$.outlets['1']|DB:outlets:name: id=1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.outlets|object|

  @Positive @Functional @DatabaseValidation
  Scenario: TC_13 Get child outlets by parent for outlet ID 2 with database validation
    And I send the GET request to "outlets_get_child_outlets_by_parent" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|true|
      |$.outlets['2']|DB:outlets:name: id=2|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.outlets|object|

  @Positive @DataValidation
  Scenario: TC_14 Validate child outlets response structure for outlet ID 1
    And I send the GET request to "outlets_get_child_outlets_by_parent" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.outlets['1']|SLV Traders|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.outlets|object|
      |$.outlets['1']|string|

  @Positive @DataValidation
  Scenario: TC_15 Validate child outlets response completeness
    And I send the GET request to "outlets_get_child_outlets_by_parent" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.outlets|object|
    And I store the response as "child_outlets_response" name using full path

  @Positive @Integration @DatabaseValidation
  Scenario: TC_16 Validate child outlets data integrity with database for outlet ID 1
    And I send the GET request to "outlets_get_child_outlets_by_parent" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.outlets['1']|DB:outlets:name: id=1|
    


  @Positive @Integration @DatabaseValidation
  Scenario: TC_17 Validate child outlets data integrity with database for outlet ID 2
    And I send the GET request to "outlets_get_child_outlets_by_parent" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.outlets['2']|DB:outlets:name: id=2|

