@BizomWebAPI @SkuEntityPrioritiesManagement @SkuEntityPriorities @WarehouseOperations @OS
Feature: SKU Entity Priorities API Testing
  As a system user
  I want to test the skunit entity priorities getPriorities endpoint
  So that I can ensure proper functionality and data retrieval for SKU entity priorities management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get priorities without access token
    When I send the GET request to "skunitentitypriorities_get_priorities" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get priorities with invalid access token
    And I send the GET request to "skunitentitypriorities_get_priorities" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get priorities with expired access token
    And I send the GET request to "skunitentitypriorities_get_priorities" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get priorities with malformed access token
    And I send the GET request to "skunitentitypriorities_get_priorities" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get priorities with valid access token
    And I send the GET request to "skunitentitypriorities_get_priorities" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data fetched.|
    And I store the response as "skunitentitypriorities_response" name using full path

  @Positive @DataValidation
  Scenario: Validate priorities response structure
    And I send the GET request to "skunitentitypriorities_get_priorities" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data fetched.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|
      |$.Data[0]|object|
      |$.Data[0].Skunitentitypriority|object|
      |$.Data[0].Skunitentitypriority.id|string|
      |$.Data[0].Skunitentitypriority.entity|string|
      |$.Data[0].Skunitentitypriority.priority|string|
      |$.Data[0].Skunitentitypriority.is_active|string|

  @Positive @DataValidation
  Scenario: Validate priorities specific data values
    And I send the GET request to "skunitentitypriorities_get_priorities" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data fetched.|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Data[0].Skunitentitypriority.entity|DB:skunitentitypriorities:entity: id=1|
      |$.Data[1].Skunitentitypriority.entity|DB:skunitentitypriorities:entity: id=2|
      |$.Data[2].Skunitentitypriority.entity|DB:skunitentitypriorities:entity: id=3|

  @Positive @DataValidation
  Scenario: Validate priorities with static values
    And I send the GET request to "skunitentitypriorities_get_priorities" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data fetched.|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data[0].Skunitentitypriority.id|"1"|
      |$.Data[0].Skunitentitypriority.entity|skunits|
      |$.Data[0].Skunitentitypriority.priority|"1"|
      |$.Data[0].Skunitentitypriority.is_active|"1"|
      |$.Data[1].Skunitentitypriority.id|"2"|
      |$.Data[1].Skunitentitypriority.entity|categories|
      |$.Data[1].Skunitentitypriority.priority|"2"|
      |$.Data[1].Skunitentitypriority.is_active|"1"|
      |$.Data[2].Skunitentitypriority.id|"3"|
      |$.Data[2].Skunitentitypriority.entity|subcategories|
      |$.Data[2].Skunitentitypriority.priority|"3"|
      |$.Data[2].Skunitentitypriority.is_active|"1"|
      |$.Data[3].Skunitentitypriority.id|"4"|
      |$.Data[3].Skunitentitypriority.entity|brands|
      |$.Data[3].Skunitentitypriority.priority|"4"|
      |$.Data[3].Skunitentitypriority.is_active|"1"|
      |$.Data[4].Skunitentitypriority.id|"5"|
      |$.Data[4].Skunitentitypriority.entity|subbrands|
      |$.Data[4].Skunitentitypriority.priority|"5"|
      |$.Data[4].Skunitentitypriority.is_active|"1"|
      |$.Data[5].Skunitentitypriority.id|"6"|
      |$.Data[5].Skunitentitypriority.entity|variants|
      |$.Data[5].Skunitentitypriority.priority|"6"|
      |$.Data[5].Skunitentitypriority.is_active|"1"|
      |$.Data[6].Skunitentitypriority.id|"7"|
      |$.Data[6].Skunitentitypriority.entity|erpgroups|
      |$.Data[6].Skunitentitypriority.priority|"7"|
      |$.Data[6].Skunitentitypriority.is_active|"1"|
      |$.Data[7].Skunitentitypriority.id|"8"|
      |$.Data[7].Skunitentitypriority.entity|packagings|
      |$.Data[7].Skunitentitypriority.priority|"8"|
      |$.Data[7].Skunitentitypriority.is_active|"1"|
      |$.Data[8].Skunitentitypriority.id|"9"|
      |$.Data[8].Skunitentitypriority.entity|sizes|
      |$.Data[8].Skunitentitypriority.priority|"9"|
      |$.Data[8].Skunitentitypriority.is_active|"1"|

  @Positive @Performance
  Scenario: Performance test for priorities endpoint
    And I send the GET request to "skunitentitypriorities_get_priorities" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data fetched.|

  @Positive @Concurrency
  Scenario: Concurrent access test for priorities endpoint
    And I send the GET request to "skunitentitypriorities_get_priorities" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data fetched.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|

  @Negative @Validation
  Scenario: Get priorities with invalid query parameters
    And I send the GET request to "skunitentitypriorities_get_priorities" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data fetched.|

  @Negative @Validation
  Scenario: Get priorities with special characters in query parameters
    And I send the GET request to "skunitentitypriorities_get_priorities" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data fetched.|

  @Negative @Security
  Scenario: Get priorities with SQL injection attempt
    And I send the GET request to "skunitentitypriorities_get_priorities" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE skunitentitypriorities; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data fetched.|

  @Negative @Boundary
  Scenario: Get priorities with maximum query parameters
    And I send the GET request to "skunitentitypriorities_get_priorities" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data fetched.|

#  @Negative @ErrorHandling
#  Scenario: Get priorities with invalid endpoint
#    And I send the GET request to "skunitentitypriorities_get_priorities_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

  @Positive @BusinessLogic
  Scenario: Validate priorities business logic
    And I send the GET request to "skunitentitypriorities_get_priorities" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data fetched.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|
      |$.Data[0].Skunitentitypriority|object|

  @Positive @DataIntegrity
  Scenario: Validate priorities data integrity
    And I send the GET request to "skunitentitypriorities_get_priorities" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data fetched.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|
      |$.Data[0].Skunitentitypriority.id|string|
      |$.Data[0].Skunitentitypriority.entity|string|
      |$.Data[0].Skunitentitypriority.priority|string|
      |$.Data[0].Skunitentitypriority.is_active|string|
    And validating the response contains the following values
      |Value|
      |skunits|
      |categories|
      |subcategories|
      |brands|
      |subbrands|
      |variants|
      |erpgroups|
      |packagings|
      |sizes|

  @Positive @Regression
  Scenario: Regression test for priorities endpoint
    And I send the GET request to "skunitentitypriorities_get_priorities" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data fetched.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|
      |$.Data[0].Skunitentitypriority|object|

  @Positive @Functional
  Scenario: Validate priorities response completeness
    And I send the GET request to "skunitentitypriorities_get_priorities" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data fetched.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|
      |$.Data[0].Skunitentitypriority|object|
      |$.Data[0].Skunitentitypriority.id|string|
      |$.Data[0].Skunitentitypriority.entity|string|
      |$.Data[0].Skunitentitypriority.priority|string|
      |$.Data[0].Skunitentitypriority.is_active|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data[0].Skunitentitypriority.id|"1"|
      |$.Data[0].Skunitentitypriority.entity|skunits|
      |$.Data[0].Skunitentitypriority.priority|"1"|
      |$.Data[0].Skunitentitypriority.is_active|"1"|
      |$.Data[1].Skunitentitypriority.id|"2"|
      |$.Data[1].Skunitentitypriority.entity|categories|
      |$.Data[1].Skunitentitypriority.priority|"2"|
      |$.Data[1].Skunitentitypriority.is_active|"1"|
      |$.Data[2].Skunitentitypriority.id|"3"|
      |$.Data[2].Skunitentitypriority.entity|subcategories|
      |$.Data[2].Skunitentitypriority.priority|"3"|
      |$.Data[2].Skunitentitypriority.is_active|"1"|

  @Positive @ArrayValidation
  Scenario: Validate priorities array structure and content
    And I send the GET request to "skunitentitypriorities_get_priorities" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data fetched.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|
      |$.Data[0]|object|
      |$.Data[0].Skunitentitypriority|object|
      |$.Data[1]|object|
      |$.Data[1].Skunitentitypriority|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data[0].Skunitentitypriority.id|"1"|
      |$.Data[0].Skunitentitypriority.entity|skunits|
      |$.Data[1].Skunitentitypriority.id|"2"|
      |$.Data[1].Skunitentitypriority.entity|categories|
      |$.Data[2].Skunitentitypriority.id|"3"|
      |$.Data[2].Skunitentitypriority.entity|subcategories|
      |$.Data[3].Skunitentitypriority.id|"4"|
      |$.Data[3].Skunitentitypriority.entity|brands|

  @Positive @ContentValidation
  Scenario: Validate priorities content structure
    And I send the GET request to "skunitentitypriorities_get_priorities" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data fetched.|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Data|
      |Skunitentitypriority|
      |id|
      |entity|
      |priority|
      |is_active|
      |skunits|
      |categories|
      |subcategories|
      |brands|

  @Positive @LoadTesting
  Scenario: Load testing for priorities endpoint
    And I send the GET request to "skunitentitypriorities_get_priorities" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data fetched.|

  @Negative @Timeout
  Scenario: Test priorities endpoint timeout handling
    And I send the GET request to "skunitentitypriorities_get_priorities" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data fetched.|

  @Positive @EndToEnd
  Scenario: End-to-end priorities data retrieval workflow
    And I send the GET request to "skunitentitypriorities_get_priorities" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data fetched.|
    And I store the response as "skunitentitypriorities_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|
      |$.Data[0].Skunitentitypriority|object|
      |$.Data[0].Skunitentitypriority.id|string|
      |$.Data[0].Skunitentitypriority.entity|string|
      |$.Data[0].Skunitentitypriority.priority|string|
      |$.Data[0].Skunitentitypriority.is_active|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data[0].Skunitentitypriority.id|"1"|
      |$.Data[0].Skunitentitypriority.entity|skunits|
      |$.Data[0].Skunitentitypriority.priority|"1"|
      |$.Data[0].Skunitentitypriority.is_active|"1"|
      |$.Data[1].Skunitentitypriority.id|"2"|
      |$.Data[1].Skunitentitypriority.entity|categories|
      |$.Data[1].Skunitentitypriority.priority|"2"|
      |$.Data[1].Skunitentitypriority.is_active|"1"|
      |$.Data[2].Skunitentitypriority.id|"3"|
      |$.Data[2].Skunitentitypriority.entity|subcategories|
      |$.Data[2].Skunitentitypriority.priority|"3"|
      |$.Data[2].Skunitentitypriority.is_active|"1"|
      |$.Data[3].Skunitentitypriority.id|"4"|
      |$.Data[3].Skunitentitypriority.entity|brands|
      |$.Data[3].Skunitentitypriority.priority|"4"|
      |$.Data[3].Skunitentitypriority.is_active|"1"|
      |$.Data[4].Skunitentitypriority.id|"5"|
      |$.Data[4].Skunitentitypriority.entity|subbrands|
      |$.Data[4].Skunitentitypriority.priority|"5"|
      |$.Data[4].Skunitentitypriority.is_active|"1"|
      |$.Data[5].Skunitentitypriority.id|"6"|
      |$.Data[5].Skunitentitypriority.entity|variants|
      |$.Data[5].Skunitentitypriority.priority|"6"|
      |$.Data[5].Skunitentitypriority.is_active|"1"|
      |$.Data[6].Skunitentitypriority.id|"7"|
      |$.Data[6].Skunitentitypriority.entity|erpgroups|
      |$.Data[6].Skunitentitypriority.priority|"7"|
      |$.Data[6].Skunitentitypriority.is_active|"1"|
      |$.Data[7].Skunitentitypriority.id|"8"|
      |$.Data[7].Skunitentitypriority.entity|packagings|
      |$.Data[7].Skunitentitypriority.priority|"8"|
      |$.Data[7].Skunitentitypriority.is_active|"1"|
      |$.Data[8].Skunitentitypriority.id|"9"|
      |$.Data[8].Skunitentitypriority.entity|sizes|
      |$.Data[8].Skunitentitypriority.priority|"9"|
      |$.Data[8].Skunitentitypriority.is_active|"1"|

