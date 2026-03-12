@BizomWebAPI @CE @UserReportingHierarchy @SystemIntegration
Feature: User Reporting Hierarchy API Testing
  As a system user
  I want to test the getUserReportingHierarchy endpoint
  So that I can ensure proper functionality and data retrieval for user reporting hierarchy

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

#  @Negative @Security
#  Scenario: Get user reporting hierarchy without access token
#    When I send the GET request to "get_user_reporting_hierarchy" endpoint with dynamic access token, path and query parameters
#
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|1|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get user reporting hierarchy with invalid access token
    And I send the GET request to "get_user_reporting_hierarchy" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|userId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get user reporting hierarchy with expired access token
    And I send the GET request to "get_user_reporting_hierarchy" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|userId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get user reporting hierarchy with malformed access token
    And I send the GET request to "get_user_reporting_hierarchy" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|userId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

#  @Positive @Smoke
#  Scenario: Get user reporting hierarchy with valid user ID 1
#    And I send the GET request to "get_user_reporting_hierarchy" endpoint with dynamic access token, path and query parameters
#
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|""|
#      |$.data|[{"Desg":null,"user":"SLV Traders","id":"1","role_id":"1","employeeid":"1","Desg_id":null,"designation_id":null,"active":"1"}]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.reason|string|
#      |$.data|array|
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Content-Type|text/html; charset=UTF-8|
#      |Server|Bizom|
#      |Connection|keep-alive|

  @Positive @Functional
  Scenario: Verify user reporting hierarchy response structure for user ID 1
    And I send the GET request to "get_user_reporting_hierarchy" endpoint with dynamic access token, path and query parameters
    
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
      |$.data|[{"Desg":null,"user":"SLV Traders","id":"1","role_id":"1","employeeid":"1","Desg_id":null,"designation_id":null,"active":"1"}]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|array|
      |$.data[0]|object|
      |$.data[0].Desg|string|
      |$.data[0].user|string|
      |$.data[0].id|string|
      |$.data[0].role_id|string|
      |$.data[0].employeeid|string|
      |$.data[0].Desg_id|string|
      |$.data[0].designation_id|string|
      |$.data[0].active|string|

#  @Positive @Functional
#  Scenario: Verify user reporting hierarchy response structure for user ID 3
#    And I send the GET request to "get_user_reporting_hierarchy" endpoint with dynamic access token, path and query parameters
#
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|3|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|""|
#      |$.data|[{"Desg":null,"user":"SLV Traders","id":"1","role_id":"1","employeeid":"1","Desg_id":null,"designation_id":null,"active":"1"}]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.reason|string|
#      |$.data|array|
#      |$.data[0]|object|
#      |$.data[0].Desg|string|
#      |$.data[0].user|string|
#      |$.data[0].id|string|
#      |$.data[0].role_id|string|
#      |$.data[0].employeeid|string|
#      |$.data[0].Desg_id|string|
#      |$.data[0].designation_id|string|
#      |$.data[0].active|string|


#  @Positive @Functional
#  Scenario: Verify user reporting hierarchy response structure for invalid numeric user ID
#    And I send the GET request to "get_user_reporting_hierarchy" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|65789|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|""|
#      |$.data|[{"Desg":null,"user":"SLV Traders","id":"1","role_id":"1","employeeid":"1","Desg_id":null,"designation_id":null,"active":"1"}]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.reason|string|
#      |$.data|array|


#  @Positive @Functional
#  Scenario: Verify user reporting hierarchy response structure for invalid non-numeric user ID
#    And I send the GET request to "get_user_reporting_hierarchy" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|vjhghkhkj|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|""|
#      |$.data|[{"Desg":null,"user":"SLV Traders","id":"1","role_id":"1","employeeid":"1","Desg_id":null,"designation_id":null,"active":"1"}]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.reason|string|
#      |$.data|array|


#  @Negative @ErrorHandling
#  Scenario: Get user reporting hierarchy with blank user ID
#    And I send the GET request to "get_user_reporting_hierarchy" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|""|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|""|
#      |$.data|[{"Desg":null,"user":"SLV Traders","id":"1","role_id":"1","employeeid":"1","Desg_id":null,"designation_id":null,"active":"1"}]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.reason|string|
#      |$.data|array|

  @Negative @ErrorHandling
  Scenario: Get user reporting hierarchy with invalid endpoint
    And I send the GET request to "get_user_reporting_hierarchy_invalid" endpoint with dynamic access token, path and query parameters
    
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "404"
    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance test for user reporting hierarchy endpoint
    And I send the GET request to "get_user_reporting_hierarchy" endpoint with dynamic access token, path and query parameters
    
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @DataValidation
  Scenario: Verify user reporting hierarchy data integrity for user ID 1
    And I send the GET request to "get_user_reporting_hierarchy" endpoint with dynamic access token, path and query parameters
    
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
      |$.data|[{"Desg":null,"user":"SLV Traders","id":"1","role_id":"1","employeeid":"1","Desg_id":null,"designation_id":null,"active":"1"}]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|array|
      |$.data[0]|object|
      |$.data[0].Desg|string|
      |$.data[0].user|string|
      |$.data[0].id|string|
      |$.data[0].role_id|string|
      |$.data[0].employeeid|string|
      |$.data[0].Desg_id|string|
      |$.data[0].designation_id|string|
      |$.data[0].active|string|


#  @Positive @DataValidation
#  Scenario: Verify user reporting hierarchy data integrity for user ID 3
#    And I send the GET request to "get_user_reporting_hierarchy" endpoint with dynamic access token, path and query parameters
#
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|3|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|""|
#      |$.data|[{"Desg":null,"user":"SLV Traders","id":"1","role_id":"1","employeeid":"1","Desg_id":null,"designation_id":null,"active":"1"}]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.reason|string|
#      |$.data|array|
#      |$.data[0]|object|
#      |$.data[0].Desg|string|
#      |$.data[0].user|string|
#      |$.data[0].id|string|
#      |$.data[0].role_id|string|
#      |$.data[0].employeeid|string|
#      |$.data[0].Desg_id|string|
#      |$.data[0].designation_id|string|
#      |$.data[0].active|string|

#  @Positive @Smoke
#  Scenario: Get user reporting hierarchy with comprehensive validation for user ID 1
#    And I send the GET request to "get_user_reporting_hierarchy" endpoint with dynamic access token, path and query parameters
#
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|""|
#      |$.data|[{"Desg":null,"user":"SLV Traders","id":"1","role_id":"1","employeeid":"1","Desg_id":null,"designation_id":null,"active":"1"}]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.reason|string|
#      |$.data|array|
#      |$.data[0]|object|
#      |$.data[0].Desg|string|
#      |$.data[0].user|string|
#      |$.data[0].id|string|
#      |$.data[0].role_id|string|
#      |$.data[0].employeeid|string|
#      |$.data[0].Desg_id|string|
#      |$.data[0].designation_id|string|
#      |$.data[0].active|string|
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Content-Type|text/html; charset=UTF-8|
#      |Server|Bizom|
#      |Connection|keep-alive|
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.data|DB:users:reporting_hierarchy_1|
#      |$.result|true|

  @Positive @BusinessLogic
  Scenario: Verify user reporting hierarchy business logic for user ID 1
    And I send the GET request to "get_user_reporting_hierarchy" endpoint with dynamic access token, path and query parameters
    
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
      |$.data|[{"Desg":null,"user":"SLV Traders","id":"1","role_id":"1","employeeid":"1","Desg_id":null,"designation_id":null,"active":"1"}]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|array|
      |$.data[0]|object|
      |$.data[0].Desg|string|
      |$.data[0].user|string|
      |$.data[0].id|string|
      |$.data[0].role_id|string|
      |$.data[0].employeeid|string|
      |$.data[0].Desg_id|string|
      |$.data[0].designation_id|string|
      |$.data[0].active|string|


#  @Positive @BusinessLogic
#  Scenario: Verify user reporting hierarchy business logic for user ID 3
#    And I send the GET request to "get_user_reporting_hierarchy" endpoint with dynamic access token, path and query parameters
#
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|3|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|""|
#      |$.data|[{"Desg":null,"user":"SLV Traders","id":"1","role_id":"1","employeeid":"1","Desg_id":null,"designation_id":null,"active":"1"}]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.reason|string|
#      |$.data|array|
#      |$.data[0]|object|
#      |$.data[0].Desg|string|
#      |$.data[0].user|string|
#      |$.data[0].id|string|
#      |$.data[0].role_id|string|
#      |$.data[0].employeeid|string|
#      |$.data[0].Desg_id|string|
#      |$.data[0].designation_id|string|
#      |$.data[0].active|string|


  @Positive @Regression
  Scenario: Verify user reporting hierarchy regression testing for user ID 1
    And I send the GET request to "get_user_reporting_hierarchy" endpoint with dynamic access token, path and query parameters
    
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
      |$.data|[{"Desg":null,"user":"SLV Traders","id":"1","role_id":"1","employeeid":"1","Desg_id":null,"designation_id":null,"active":"1"}]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|array|
      |$.data[0]|object|
      |$.data[0].Desg|string|
      |$.data[0].user|string|
      |$.data[0].id|string|
      |$.data[0].role_id|string|
      |$.data[0].employeeid|string|
      |$.data[0].Desg_id|string|
      |$.data[0].designation_id|string|
      |$.data[0].active|string|

#  @Positive @Regression
#  Scenario: Verify user reporting hierarchy regression testing for user ID 3
#    And I send the GET request to "get_user_reporting_hierarchy" endpoint with dynamic access token, path and query parameters
#
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|3|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|""|
#      |$.data|[{"Desg":null,"user":"SLV Traders","id":"1","role_id":"1","employeeid":"1","Desg_id":null,"designation_id":null,"active":"1"}]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.reason|string|
#      |$.data|array|
#      |$.data[0]|object|
#      |$.data[0].Desg|string|
#      |$.data[0].user|string|
#      |$.data[0].id|string|
#      |$.data[0].role_id|string|
#      |$.data[0].employeeid|string|
#      |$.data[0].Desg_id|string|
#      |$.data[0].designation_id|string|
#      |$.data[0].active|string|
   