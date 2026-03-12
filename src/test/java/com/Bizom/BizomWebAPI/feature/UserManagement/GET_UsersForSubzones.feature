@BizomWebAPI @CE @UsersForSubzones @SystemIntegration
Feature: Users For Subzones API Testing
  As a system user
  I want to test the getusersforsubzones endpoint
  So that I can ensure proper functionality and data retrieval for users in specific subzones

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get users for subzones without access token
    When I send the GET request to "get_users_for_subzones" endpoint with path parameters
      |Path|Value|
      |subzoneId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get users for subzones with invalid access token
    And I send the GET request to "get_users_for_subzones" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|subzoneId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get users for subzones with expired access token
    And I send the GET request to "get_users_for_subzones" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|subzoneId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get users for subzones with malformed access token
    And I send the GET request to "get_users_for_subzones" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|subzoneId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

#  @Positive @Smoke
#  Scenario: Get users for subzone ID 1 with valid access token
#    And I send the GET request to "get_users_for_subzones" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|subzoneId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.users.2|SLV Traders|
#      |$.users.8|SLV Traders|
#      |$.users.9|test1|
#      |$.users.10|sadha|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.users|object|
#      |$.users.2|string|
#      |$.users.8|string|
#      |$.users.9|string|
#      |$.users.10|string|

#  @Positive @Functional
#  Scenario: Get users for subzone ID 2 with valid access token
#    And I send the GET request to "get_users_for_subzones" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|subzoneId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.users|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.users|array|

#  @Negative @Validation
#  Scenario: Get users for subzones with blank subzone ID
#    And I send the GET request to "get_users_for_subzones" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|subzoneId|""|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|Invalie zoneId|

  @Negative @Validation
  Scenario: Get users for subzones with invalid subzone ID
    And I send the GET request to "get_users_for_subzones" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|subzoneId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.users|{"13":"testuser_tourplan","16":"lion12","23":"kji"}|

  @Negative @Validation
  Scenario: Get users for subzones with non-existent subzone ID
    And I send the GET request to "get_users_for_subzones" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|subzoneId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.users|[]|

  @Negative @ErrorHandling
  Scenario: Get users for subzones with invalid endpoint
    And I send the GET request to "get_users_for_subzones_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "404"
    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance test for users for subzones endpoint
    And I send the GET request to "get_users_for_subzones" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|subzoneId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Regression
  Scenario: Regression test for users for subzones endpoint
    And I send the GET request to "get_users_for_subzones" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|subzoneId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: Get users for subzone ID 1 with valid access token and DB validation
    And I send the GET request to "get_users_for_subzones" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|subzoneId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.users.2|DB:users:name: id=2|
      |$.users.8|DB:users:name: id=8|
      |$.users.9|DB:users:name: id=9|
      |$.users.10|DB:users:name: id=10|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.users|object|
      |$.users.2|string|
      |$.users.8|string|
      |$.users.9|string|
      |$.users.10|string|

  @Positive @Functional
  Scenario: Get users for subzone ID 2 with valid access token and DB validation
    And I send the GET request to "get_users_for_subzones" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|subzoneId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.users|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.users|array|

#  @Positive @DataValidation
#  Scenario: Validate users for subzones response structure for subzone with users
#    And I send the GET request to "get_users_for_subzones" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|subzoneId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.users|object|
#      |$.users.2|string|
#      |$.users.8|string|
#      |$.users.9|string|
#      |$.users.10|string|

#  @Positive @DataValidation
#  Scenario: Validate users for subzones response structure for subzone without users
#    And I send the GET request to "get_users_for_subzones" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|subzoneId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.users|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.users|array|

#  @Negative @DataValidation
#  Scenario: Validate users for subzones response structure for blank subzone ID
#    And I send the GET request to "get_users_for_subzones" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|subzoneId|""|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|Invalie zoneId|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|

#  @Positive @DataValidation
#  Scenario: Validate users for subzones response structure for invalid subzone ID
#    And I send the GET request to "get_users_for_subzones" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|subzoneId|abc|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.users|{"13":"testuser_tourplan","16":"lion12","23":"kji"}|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.users|object|

  @Positive @BusinessLogic
  Scenario: Validate users for subzones business logic for subzone with users
    And I send the GET request to "get_users_for_subzones" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|subzoneId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.users.2|SLV Traders|
      |$.users.8|SLV Traders|
      |$.users.9|test1|
      |$.users.10|sadha|

  @Positive @BusinessLogic
  Scenario: Validate users for subzones business logic for subzone without users
    And I send the GET request to "get_users_for_subzones" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|subzoneId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.users|[]|

#  @Negative @BusinessLogic
#  Scenario: Validate users for subzones business logic for blank subzone ID
#    And I send the GET request to "get_users_for_subzones" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|subzoneId|""|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|Invalie zoneId|

  @Positive @BusinessLogic
  Scenario: Validate users for subzones business logic for invalid subzone ID
    And I send the GET request to "get_users_for_subzones" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|subzoneId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.users|{"13":"testuser_tourplan","16":"lion12","23":"kji"}|

  @Positive @EdgeCase
  Scenario: Get users for subzones with zero subzone ID
    And I send the GET request to "get_users_for_subzones" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|subzoneId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.users|{"13":"testuser_tourplan","16":"lion12","23":"kji"}|

  @Positive @EdgeCase
  Scenario: Get users for subzones with negative subzone ID
    And I send the GET request to "get_users_for_subzones" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|subzoneId|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.users|[]|

  @Positive @Concurrency
  Scenario: Concurrent access test for users for subzones endpoint
    And I send the GET request to "get_users_for_subzones" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|subzoneId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.users.2|SLV Traders|
      |$.users.8|SLV Traders|
      |$.users.9|test1|
      |$.users.10|sadha|

  @Positive @LoadTesting
  Scenario: Load testing for users for subzones endpoint
    And I send the GET request to "get_users_for_subzones" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|subzoneId|1|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.users.2|SLV Traders|
      |$.users.8|SLV Traders|
      |$.users.9|test1|
      |$.users.10|sadha|

#  @Positive @EndToEnd
#  Scenario: End-to-end users for subzones data retrieval workflow
#    And I send the GET request to "get_users_for_subzones" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|subzoneId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.users.2|SLV Traders|
#      |$.users.8|SLV Traders|
#      |$.users.9|test1|
#      |$.users.10|sadha|
#    And I store the response as "users_for_subzones_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.users|object|
#      |$.users.2|string|
#      |$.users.8|string|
#      |$.users.9|string|
#      |$.users.10|string|

#  @Positive @SubzoneValidation
#  Scenario: Validate users for different subzone IDs
#    And I send the GET request to "get_users_for_subzones" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|subzoneId|3|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.users|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.users|array|

#  @Positive @UserDataValidation
#  Scenario: Validate user data structure in subzone response
#    And I send the GET request to "get_users_for_subzones" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|subzoneId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.users|object|
#      |$.users.2|string|
#      |$.users.8|string|
#      |$.users.9|string|
#      |$.users.10|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.users.2|SLV Traders|
#      |$.users.8|SLV Traders|
#      |$.users.9|test1|
#      |$.users.10|sadha|

#  @Positive @ErrorHandlingValidation
#  Scenario: Validate error handling for various subzone ID scenarios
#    And I send the GET request to "get_users_for_subzones" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|subzoneId|999999|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.users|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.users|array|
