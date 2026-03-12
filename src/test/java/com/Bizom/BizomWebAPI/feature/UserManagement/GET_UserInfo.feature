@BizomWebAPI @CE @UserInfo @SystemIntegration
Feature: User Info API Testing
  As a system user
  I want to test the userinfo endpoint
  So that I can ensure proper functionality and data retrieval for user information

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

#  @Negative @Security
#  Scenario: Get user info without access token
#    When I send the GET request to "userinfo" endpoint
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get user info with invalid access token
    And I send the GET request to "userinfo" endpoint with dynamic access token and query parameters
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
  Scenario: Get user info with expired access token
    And I send the GET request to "userinfo" endpoint with dynamic access token and query parameters
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
  Scenario: Get user info with malformed access token
    And I send the GET request to "userinfo" endpoint with dynamic access token and query parameters
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
  Scenario: Get user info with valid access token
    And I send the GET request to "userinfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.apiVersion|"2.0"|
    And I store the response as "userinfo_response" name using full path

  @Positive @DataValidation
  Scenario: Validate user info response structure
    And I send the GET request to "userinfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.apiVersion|"2.0"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.apiVersion|string|
      |$.error|object|
      |$.data|object|

  @Positive @DataValidation
  Scenario: Validate user info specific data values
    And I send the GET request to "userinfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.apiVersion|"2.0"|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.data.name|DB:users:name: id=1|
      |$.data.email|DB:users:email: id=1|

  @Positive @DataValidation
  Scenario: Validate user info with static values
    And I send the GET request to "userinfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.apiVersion|"2.0"|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data.userid|"1"|
      |$.data.name|SLV Traders|
      |$.data.email|sadhananda@mobisy.com|
      |$.data.address|Bangalore|
      |$.data.emloyeeid|"1"|
      |$.data.active|"1"|
      |$.data.role_id|"1"|
      |$.data.role_name|ADMIN|

  @Positive @Performance
  Scenario: Performance test for user info endpoint
    And I send the GET request to "userinfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.apiVersion|"2.0"|

  @Positive @Concurrency
  Scenario: Concurrent access test for user info endpoint
    And I send the GET request to "userinfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.apiVersion|"2.0"|

  @Negative @Validation
  Scenario: Get user info with invalid query parameters
    And I send the GET request to "userinfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.apiVersion|"2.0"|

  @Negative @Validation
  Scenario: Get user info with special characters in query parameters
    And I send the GET request to "userinfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.apiVersion|"2.0"|

  @Negative @Security
  Scenario: Get user info with SQL injection attempt
    And I send the GET request to "userinfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE users; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.apiVersion|"2.0"|

  @Negative @Boundary
  Scenario: Get user info with maximum query parameters
    And I send the GET request to "userinfo" endpoint with dynamic access token and query parameters
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
      |$.apiVersion|"2.0"|

#  @Negative @ErrorHandling
#  Scenario: Get user info with invalid endpoint
#    And I send the GET request to "userinfo_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

  @Positive @BusinessLogic
  Scenario: Validate user info business logic
    And I send the GET request to "userinfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.apiVersion|"2.0"|

  @Positive @DataIntegrity
  Scenario: Validate user info data integrity
    And I send the GET request to "userinfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.apiVersion|"2.0"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.apiVersion|string|
      |$.error|object|
      |$.data|object|
      |$.data.userid|string|
      |$.data.name|string|
      |$.data.email|string|
      |$.data.address|string|
      |$.data.emloyeeid|string|
      |$.data.active|string|
      |$.data.role_id|string|
      |$.data.role_name|string|

  @Positive @Regression
  Scenario: Regression test for user info endpoint
    And I send the GET request to "userinfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.apiVersion|"2.0"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.apiVersion|string|
      |$.error|object|
      |$.data|object|

  @Positive @Functional
  Scenario: Validate user info response completeness
    And I send the GET request to "userinfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.apiVersion|"2.0"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data.userid|"1"|
      |$.data.name|SLV Traders|
      |$.data.email|sadhananda@mobisy.com|
      |$.data.address|Bangalore|
      |$.data.emloyeeid|"1"|
      |$.data.active|"1"|
      |$.data.role_id|"1"|
      |$.data.role_name|ADMIN|

  @Positive @ObjectValidation
  Scenario: Validate user info object structure and content
    And I send the GET request to "userinfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.apiVersion|"2.0"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.error|object|
      |$.data.workflows|object|
      |$.data.role_specific_id|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data.userid|"1"|
      |$.data.name|SLV Traders|
      |$.data.email|sadhananda@mobisy.com|
      |$.data.address|Bangalore|
      |$.data.emloyeeid|"1"|
      |$.data.active|"1"|
      |$.data.role_id|"1"|
      |$.data.role_name|ADMIN|

  @Positive @ContentValidation
  Scenario: Validate user info content structure
    And I send the GET request to "userinfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.apiVersion|"2.0"|
    And validating the response contains the following values
      |Value|
      |userid|
      |name|
      |email|
      |address|
      |emloyeeid|
      |active|
      |role_id|
      |role_name|
      |workflows|

  @Positive @LoadTesting
  Scenario: Load testing for user info endpoint
    And I send the GET request to "userinfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.apiVersion|"2.0"|

  @Negative @Timeout
  Scenario: Test user info endpoint timeout handling
    And I send the GET request to "userinfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.apiVersion|"2.0"|

  @Positive @EndToEnd
  Scenario: End-to-end user info data retrieval workflow
    And I send the GET request to "userinfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.apiVersion|"2.0"|
    And I store the response as "userinfo_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.apiVersion|string|
      |$.error|object|
      |$.data|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data.userid|"1"|
      |$.data.name|SLV Traders|
      |$.data.email|sadhananda@mobisy.com|
      |$.data.address|Bangalore|
      |$.data.emloyeeid|"1"|
      |$.data.active|"1"|
      |$.data.role_id|"1"|
      |$.data.role_name|ADMIN|

  @Positive @WorkflowValidation
  Scenario: Validate user info workflows structure
    And I send the GET request to "userinfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.apiVersion|"2.0"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data.workflows|object|
      |$.data.workflows.sale|string|
      |$.data.workflows.order|string|
      |$.data.workflows.salereturn|string|
      |$.data.workflows.stockatoutlet|string|
      |$.data.workflows.collection|string|
      |$.data.workflows.print|string|
      |$.data.workflows.adhocads|string|
      |$.data.workflows.addoutlet|string|
      |$.data.workflows.activity|string|
      |$.data.workflows.attendance|string|
      |$.data.workflows.attendanceimage|string|
      |$.data.workflows.collaterals|string|
      |$.data.workflows.pop|string|
      |$.data.workflows.claims|string|
      |$.data.workflows.genericform|string|
      |$.data.workflows.outletageing|string|
      |$.data.workflows.vendorbid|string|
      |$.data.workflows.activitypicture|string|
      |$.data.workflows.activitycomment|string|
      |$.data.workflows.activityform|string|
      |$.data.workflows.outletenrollment|string|
      |$.data.workflows.emailtoretailer|string|
      |$.data.workflows.lms|string|
      |$.data.workflows.readgeolocation|string|
      |$.data.workflows.assettrack|string|
      |$.data.workflows.orderfulfil|string|
      |$.data.workflows.outletedit|string|
      |$.data.workflows.tasks|string|
      |$.data.workflows.assetorder|string|
      |$.data.workflows.existingasset|string|
      |$.data.workflows.reqfordiscount|string|
      |$.data.workflows.assetaudit|string|
      |$.data.workflows.addtask|string|
      |$.data.workflows.emailpacreport|string|
      |$.data.workflows.searchoutletonline|string|
      |$.data.workflows.shownearestoutlets|string|
      |$.data.workflows.enrolwithtarget|string|
      |$.data.workflows.sampling|string|
      |$.data.workflows.enterskuprice|string|
      |$.data.workflows.edituserlocvisibility|string|
      |$.data.workflows.printertype|string|
      |$.data.workflows.primaryorder|string|
      |$.data.workflows.primarysalereturn|string|
      |$.data.workflows.primarycollections|string|
      |$.data.workflows.txnsinsinglescreen|string|
      |$.data.workflows.edituserinfo|string|
      |$.data.workflows.beatplanning|string|
      |$.data.workflows.stock_transfer|string|
      |$.data.workflows.primaryactivityform|string|
      |$.data.workflows.reporteeview|string|
      |$.data.workflows.trainer|string|
      |$.data.workflows.taskapprover|string|
      |$.data.workflows.addevent|string|
      |$.data.workflows.secondarygrn|string|
      |$.data.workflows.claim_auditor|string|
      |$.data.workflows.assetapprover|string|
      |$.data.workflows.assetderegister|string|
      |$.data.workflows.van_sale_with_orders|boolean|
      |$.data.workflows.tertiary_sale|boolean|
      |$.data.workflows.distributor_order_edit|boolean|
      |$.data.workflows.return_for_retailer_app|string|
      |$.data.workflows.is_smart_asset|string|
      |$.data.workflows.twofactorauth|string|
      |$.data.workflows.cancelcollection|string|
      |$.data.workflows.cancelsalereturn|string|
      |$.data.workflows.permission_to_update_userworkflow|string|

  @Positive @RoleValidation
  Scenario: Validate user info role specific data
    And I send the GET request to "userinfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.apiVersion|"2.0"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data.role_specific_id|array|
      |$.data.role_specific_id[0]|object|
      |$.data.role_specific_id[0].id|string|
      |$.data.role_specific_id[0].name|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data.role_specific_id[0].id|"470212"|
      |$.data.role_specific_id[0].name|ui|

  @Positive @ErrorObjectValidation
  Scenario: Validate user info error object structure
    And I send the GET request to "userinfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.apiVersion|"2.0"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.error|object|
      |$.error.code|number|
      |$.error.message|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.error.code|200|
      |$.error.message|no error|
