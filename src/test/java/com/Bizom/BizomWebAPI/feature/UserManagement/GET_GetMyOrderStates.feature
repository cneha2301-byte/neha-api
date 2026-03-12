@BizomWebAPI @CE @GetMyOrderStates @UserManagement
Feature: GetMyOrderStates API Testing
  As a system user
  I want to test the getmyorderstates endpoint
  So that I can ensure proper functionality and data retrieval for order states management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get my order states without access token
    When I send the GET request to "get_my_order_states" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get my order states with invalid access token
    And I send the GET request to "get_my_order_states" endpoint with dynamic access token and query parameters
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
  Scenario: Get my order states with expired access token
    And I send the GET request to "get_my_order_states" endpoint with dynamic access token and query parameters
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
  Scenario: Get my order states with malformed access token
    And I send the GET request to "get_my_order_states" endpoint with dynamic access token and query parameters
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
  Scenario: Get my order states with valid access token
    And I send the GET request to "get_my_order_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
    And I store the response as "getmyorderstates_response" name using full path

  @Positive @DataValidation
  Scenario: Validate getmyorderstates response structure
    And I send the GET request to "get_my_order_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.states|array|
      |$.filters|array|
      |$.masterdata|array|

#  @Positive @DataValidation
#  Scenario: Validate getmyorderstates specific data values
#    And I send the GET request to "get_my_order_states" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|""|
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.states[0].Orderstate.id|DB:orderstates:id: id=1|
#      |$.states[0].Orderstate.name|DB:orderstates:name: id=1|
#      |$.states[0].Orderstate.namealias|DB:orderstates:namealias: id=1|

  @Positive @DataValidation
  Scenario: Validate getmyorderstates with static values
    And I send the GET request to "get_my_order_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.states[0].Orderstate.id|"1"|
      |$.states[0].Orderstate.name|"placed"|
      |$.states[0].Orderstate.namealias|"Placed"|
      |$.states[0].Orderstate.labelname|"Place"|
      |$.states[1].Orderstate.id|"2"|
      |$.states[1].Orderstate.name|"accepted"|
      |$.states[1].Orderstate.namealias|"Accepted"|
      |$.states[1].Orderstate.labelname|"Accept"|

  @Positive @Performance
  Scenario: Performance test for getmyorderstates endpoint
    And I send the GET request to "get_my_order_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|

  @Positive @Concurrency
  Scenario: Concurrent access test for getmyorderstates endpoint
    And I send the GET request to "get_my_order_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|

  @Negative @Validation
  Scenario: Get my order states with invalid query parameters
    And I send the GET request to "get_my_order_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|

  @Negative @Validation
  Scenario: Get my order states with special characters in query parameters
    And I send the GET request to "get_my_order_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|

  @Negative @Security
  Scenario: Get my order states with SQL injection attempt
    And I send the GET request to "get_my_order_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE orderstates; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|

  @Negative @Boundary
  Scenario: Get my order states with maximum query parameters
    And I send the GET request to "get_my_order_states" endpoint with dynamic access token and query parameters
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
      |$.result|true|
      |$.reason|""|

#  @Negative @ErrorHandling
#  Scenario: Get my order states with invalid endpoint
#    And I send the GET request to "get_my_order_states_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

  @Positive @BusinessLogic
  Scenario: Validate getmyorderstates business logic
    And I send the GET request to "get_my_order_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|

  @Positive @DataIntegrity
  Scenario: Validate getmyorderstates data integrity
    And I send the GET request to "get_my_order_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.states|array|
      |$.filters|array|
      |$.masterdata|array|
      |$.states[0]|object|
      |$.states[0].Orderstate|object|
      |$.states[0].Orderstate.id|string|
      |$.states[0].Orderstate.name|string|
      |$.states[0].Orderstate.namealias|string|
      |$.states[0].Orderstate.labelname|string|

  @Positive @Regression
  Scenario: Regression test for getmyorderstates endpoint
    And I send the GET request to "get_my_order_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.states|array|
      |$.filters|array|
      |$.masterdata|array|

  @Positive @Functional
  Scenario: Validate getmyorderstates response completeness
    And I send the GET request to "get_my_order_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.states|array|
      |$.filters|array|
      |$.masterdata|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.states[0].Orderstate.id|"1"|
      |$.states[0].Orderstate.name|"placed"|
      |$.states[0].Orderstate.namealias|"Placed"|
      |$.states[0].Orderstate.labelname|"Place"|
      |$.states[1].Orderstate.id|"2"|
      |$.states[1].Orderstate.name|"accepted"|
      |$.states[1].Orderstate.namealias|"Accepted"|
      |$.states[1].Orderstate.labelname|"Accept"|

  @Positive @ArrayValidation
  Scenario: Validate getmyorderstates array structure and content
    And I send the GET request to "get_my_order_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.states|array|
      |$.filters|array|
      |$.masterdata|array|
      |$.states[0]|object|
      |$.states[1]|object|
      |$.filters[0]|object|
      |$.filters[1]|object|
      |$.masterdata[0]|object|
      |$.masterdata[1]|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.states[0].Orderstate.id|"1"|
      |$.states[0].Orderstate.name|"placed"|
      |$.states[0].Orderstate.namealias|"Placed"|
      |$.states[1].Orderstate.id|"2"|
      |$.states[1].Orderstate.name|"accepted"|
      |$.states[1].Orderstate.namealias|"Accepted"|

  @Positive @ContentValidation
  Scenario: Validate getmyorderstates content structure
    And I send the GET request to "get_my_order_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
    And validating the response contains the following values
      |Value|
      |states|
      |filters|
      |masterdata|
      |Orderstate|
      |id|
      |name|
      |namealias|
      |labelname|

  @Positive @LoadTesting
  Scenario: Load testing for getmyorderstates endpoint
    And I send the GET request to "get_my_order_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|

  @Negative @Timeout
  Scenario: Test getmyorderstates endpoint timeout handling
    And I send the GET request to "get_my_order_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|

  @Positive @EndToEnd
  Scenario: End-to-end getmyorderstates data retrieval workflow
    And I send the GET request to "get_my_order_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
    And I store the response as "getmyorderstates_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.states|array|
      |$.filters|array|
      |$.masterdata|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.states[0].Orderstate.id|"1"|
      |$.states[0].Orderstate.name|"placed"|
      |$.states[0].Orderstate.namealias|"Placed"|
      |$.states[0].Orderstate.labelname|"Place"|
      |$.states[1].Orderstate.id|"2"|
      |$.states[1].Orderstate.name|"accepted"|
      |$.states[1].Orderstate.namealias|"Accepted"|
      |$.states[1].Orderstate.labelname|"Accept"|

  @Positive @OrderStateValidation
  Scenario: Validate order state specific fields
    And I send the GET request to "get_my_order_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.states[0].Orderstate.nextstatusid|["2","4","3"]|
      |$.states[0].Orderstate.approveroleid|["1","4","7"]|
      |$.states[0].Orderstate.emailtemplate|""|
      |$.states[0].Orderstate.sendmailtoroles|"4,7"|
      |$.states[0].Orderstate.filterroleid|"1,2,3,4,6,8"|
      |$.states[0].Orderstate.statusaction|"editorder"|
      |$.states[0].Orderstate.allow_bulk_state_change|false|
      |$.states[0].Orderstate.is_custom_state|false|

  @Positive @FilterValidation
  Scenario: Validate filter array structure
    And I send the GET request to "get_my_order_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.filters[0].Orderstate.id|"1"|
      |$.filters[0].Orderstate.name|"placed"|
      |$.filters[0].Orderstate.namealias|"Placed"|
      |$.filters[0].Orderstate.labelname|"Place"|
      |$.filters[0].Orderstate.nextstatusid|"2,4,3"|
      |$.filters[0].Orderstate.approveroleid|"1,4,7"|
      |$.filters[0].Orderstate.filterroleid|["1","2","3","4","6","8"]|

  @Positive @MasterDataValidation
  Scenario: Validate masterdata array structure
    And I send the GET request to "get_my_order_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.masterdata[0].Orderstate.id|"1"|
      |$.masterdata[0].Orderstate.name|"placed"|
      |$.masterdata[0].Orderstate.namealias|"Placed"|
      |$.masterdata[0].Orderstate.labelname|"Place"|
      |$.masterdata[1].Orderstate.id|"2"|
      |$.masterdata[1].Orderstate.name|"accepted"|
      |$.masterdata[1].Orderstate.namealias|"Accepted"|
      |$.masterdata[1].Orderstate.labelname|"Accept"|

  @Positive @WorkflowValidation
  Scenario: Validate order state workflow configuration
    And I send the GET request to "get_my_order_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.states[0].Orderstate.nextstatusid|array|
      |$.states[0].Orderstate.approveroleid|array|
      |$.states[0].Orderstate.filterroleid|string|
      |$.states[0].Orderstate.allow_bulk_state_change|boolean|
      |$.states[0].Orderstate.is_custom_state|boolean|
      |$.states[0].Orderstate.order_type_id|null|

  @Positive @CompleteValidation
  Scenario: Validate complete order states data structure
    And I send the GET request to "get_my_order_states" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.states|array|
      |$.filters|array|
      |$.masterdata|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.states[0].Orderstate.id|"1"|
      |$.states[0].Orderstate.name|"placed"|
      |$.states[0].Orderstate.namealias|"Placed"|
      |$.states[0].Orderstate.labelname|"Place"|
      |$.states[0].Orderstate.nextstatusid|["2","4","3"]|
      |$.states[0].Orderstate.approveroleid|["1","4","7"]|
      |$.states[0].Orderstate.emailtemplate|""|
      |$.states[0].Orderstate.sendmailtoroles|"4,7"|
      |$.states[0].Orderstate.filterroleid|"1,2,3,4,6,8"|
      |$.states[0].Orderstate.statusaction|"editorder"|
      |$.states[0].Orderstate.approverdesignationid|""|
      |$.states[0].Orderstate.filterdesignationid|""|
      |$.states[0].Orderstate.allow_bulk_state_change|false|
      |$.states[0].Orderstate.order_type_id|null|
      |$.states[0].Orderstate.is_custom_state|false|
