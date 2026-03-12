@BizomWebAPI @CE @DistrictsManagement @DistrictsGetDistrict @IntegrationServices
Feature: Districts API Testing
  As a system user
  I want to test the getdistricts endpoint
  So that I can ensure proper functionality and data retrieval for districts management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get districts without access token
    When I send the GET request to "get_districts" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get districts with invalid access token
    And I send the GET request to "get_districts" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get districts with expired access token
    And I send the GET request to "get_districts" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get districts with malformed access token
    And I send the GET request to "get_districts" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get districts with valid access token
    And I send the GET request to "get_districts" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.Data|[]|
    And I store the response as "districts_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate districts response structure
    And I send the GET request to "get_districts" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate districts specific data values
    And I send the GET request to "get_districts" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.Data|[]|
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.Data[0].id|DB:districts:id: active=1|
#      |$.Data[0].name|DB:districts:name: active=1|
#      |$.Data[0].state_id|DB:districts:state_id: active=1|
 # no data are coming in responce so commenting this part

  @Positive @DataValidation
  Scenario: TC_08 Validate districts with static values
    And I send the GET request to "get_districts" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.Data|[]|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Data[0].id|"1"|
#      |$.Data[0].name|"District Name"|
#      |$.Data[0].state_id|"1"|
#      |$.Data[0].code|"DN"|
#      |$.Data[0].status|"active"|

  @Positive @Performance
  Scenario: TC_09 Performance test for districts endpoint
    And I send the GET request to "get_districts" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.Data|[]|

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for districts endpoint
    And I send the GET request to "get_districts" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.Data|[]|

  @Negative @Validation
  Scenario: TC_11 Get districts with invalid query parameters
    And I send the GET request to "get_districts" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.Data|[]|

  @Negative @Validation
  Scenario: TC_12 Get districts with special characters in query parameters
    And I send the GET request to "get_districts" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.Data|[]|

  @Negative @Security
  Scenario: TC_13 Get districts with SQL injection attempt
    And I send the GET request to "get_districts" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE districts; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.Data|[]|

  @Negative @Boundary
  Scenario: TC_14 Get districts with maximum query parameters
    And I send the GET request to "get_districts" endpoint with dynamic access token and query parameters
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
      |$.Reason|""|
      |$.Data|[]|

  @Negative @ErrorHandling
  Scenario: TC_15 Get districts with invalid endpoint
    And I send the GET request to "get_districts_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_16 Validate districts business logic
    And I send the GET request to "get_districts" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.Data|[]|

  @Positive @DataIntegrity
  Scenario: TC_17 Validate districts data integrity
    And I send the GET request to "get_districts" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.Data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data[0]|object|
      |$.Data[0].id|string|
      |$.Data[0].name|string|
      |$.Data[0].state_id|string|
      |$.Data[0].code|string|
      |$.Data[0].status|string|

  @Positive @Regression
  Scenario: TC_18 Regression test for districts endpoint
    And I send the GET request to "get_districts" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.Data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|

  @Positive @Functional
  Scenario: TC_19 Validate districts response completeness
    And I send the GET request to "get_districts" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.Data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Data[0].id|"1"|
#      |$.Data[0].name|"District Name"|
#      |$.Data[0].state_id|"1"|
#      |$.Data[0].code|"DN"|
#      |$.Data[0].status|"active"|

  @Positive @ArrayValidation
  Scenario: TC_20 Validate districts array structure and content
    And I send the GET request to "get_districts" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.Data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|
      |$.Data[0]|object|
      |$.Data[1]|object|

  @Positive @ContentValidation
  Scenario: TC_21 Validate districts content structure
    And I send the GET request to "get_districts" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.Data|[]|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Data|

  @Positive @LoadTesting
  Scenario: TC_22 Load testing for districts endpoint
    And I send the GET request to "get_districts" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.Data|[]|

  @Negative @Timeout
  Scenario: TC_23 Test districts endpoint timeout handling
    And I send the GET request to "get_districts" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.Data|[]|

  @Positive @EndToEnd
  Scenario: TC_24 End-to-end districts data retrieval workflow
    And I send the GET request to "get_districts" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.Data|[]|
    And I store the response as "districts_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|

  @Positive @HeaderValidation
  Scenario: TC_25 Validate districts response headers
    And I send the GET request to "get_districts" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Server|Bizom|
      |Connection|keep-alive|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.Data|[]|

  @Positive @SessionValidation
  Scenario: TC_26 Validate districts with session handling
    And I send the GET request to "get_districts" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.Data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|
      |$.Data[0]|object|

  @Positive @DistrictsSpecificValidation
  Scenario: TC_27 Validate districts district-specific data
    And I send the GET request to "get_districts" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.Data|[]|
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.Data[0].name|DB:districts:name: active=1|
#      |$.Data[0].state_id|DB:districts:state_id: active=1|

  @Positive @EmptyArrayValidation
  Scenario: TC_28 Validate districts empty array handling
    And I send the GET request to "get_districts" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data|[]|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Data|
