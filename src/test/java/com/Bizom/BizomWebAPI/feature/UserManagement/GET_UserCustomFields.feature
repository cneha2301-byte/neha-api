@BizomWebAPI @CE @UserCustomFields @ReportingOperations
Feature: User Custom Fields API Testing
  As a system user
  I want to test the getUserCustomFields endpoint
  So that I can ensure proper functionality and data retrieval for user custom fields

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get user custom fields without access token
    When I send the GET request to "get_user_custom_fields" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get user custom fields with invalid access token
    And I send the GET request to "get_user_custom_fields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get user custom fields with expired access token
    And I send the GET request to "get_user_custom_fields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get user custom fields with malformed access token
    And I send the GET request to "get_user_custom_fields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

#  @Positive @Smoke
#  Scenario: Get user custom fields with valid access token
#    And I send the GET request to "get_user_custom_fields" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|User custom field Data retrived successfully.|
#      |$.Data|[{"name":"name","type":"SingleLineText","restirction":"no","addmore":"","fordevice":true,"groupno":"","required":"","editable":true,"addvalidation":true,"validationtype":"regex","validationalert":"","checkButtonArrayDefault":""},{"name":"image1","type":"Image","restirction":"no","addmore":"","fordevice":true,"groupno":"","required":"","editable":true,"addvalidation":"","validationtype":"","validationalert":"","checkButtonArrayDefault":""},{"name":"video1","type":"Video","restirction":"no","addmore":"","fordevice":true,"groupno":"","required":"","editable":true,"addvalidation":"","validationtype":"","validationalert":"","checkButtonArrayDefault":""}]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Data|array|
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Content-Type|application/json; charset=UTF-8|
#      |Server|Bizom|
#      |Connection|keep-alive|

#  @Positive @Functional
#  Scenario: Verify user custom fields response structure
#    And I send the GET request to "get_user_custom_fields" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|User custom field Data retrived successfully.|
#      |$.Data|[{"name":"name","type":"SingleLineText","restirction":"no","addmore":"","fordevice":true,"groupno":"","required":"","editable":true,"addvalidation":true,"validationtype":"regex","validationalert":"","checkButtonArrayDefault":""},{"name":"image1","type":"Image","restirction":"no","addmore":"","fordevice":true,"groupno":"","required":"","editable":true,"addvalidation":"","validationtype":"","validationalert":"","checkButtonArrayDefault":""},{"name":"video1","type":"Video","restirction":"no","addmore":"","fordevice":true,"groupno":"","required":"","editable":true,"addvalidation":"","validationtype":"","validationalert":"","checkButtonArrayDefault":""}]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Data|array|
#      |$.Data[0]|object|
#      |$.Data[1]|object|
#      |$.Data[2]|object|
#

  @Positive @Regression
  Scenario: Verify user custom fields data consistency
    And I send the GET request to "get_user_custom_fields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|User custom field Data retrived successfully.|
      |$.Data|[{"name":"name","type":"SingleLineText","restirction":"no","addmore":"","fordevice":true,"groupno":"","required":"","editable":true,"addvalidation":true,"validationtype":"regex","validationalert":"","checkButtonArrayDefault":""},{"name":"image1","type":"Image","restirction":"no","addmore":"","fordevice":true,"groupno":"","required":"","editable":true,"addvalidation":"","validationtype":"","validationalert":"","checkButtonArrayDefault":""},{"name":"video1","type":"Video","restirction":"no","addmore":"","fordevice":true,"groupno":"","required":"","editable":true,"addvalidation":"","validationtype":"","validationalert":"","checkButtonArrayDefault":""}]|

  @Negative @ErrorHandling
  Scenario: Get user custom fields with invalid endpoint
    And I send the GET request to "get_user_custom_fields_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "404"
    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance test for user custom fields endpoint
    And I send the GET request to "get_user_custom_fields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

#  @Positive @DataValidation
#  Scenario: Verify user custom fields data integrity
#    And I send the GET request to "get_user_custom_fields" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|User custom field Data retrived successfully.|
#      |$.Data|[{"name":"name","type":"SingleLineText","restirction":"no","addmore":"","fordevice":true,"groupno":"","required":"","editable":true,"addvalidation":true,"validationtype":"regex","validationalert":"","checkButtonArrayDefault":""},{"name":"image1","type":"Image","restirction":"no","addmore":"","fordevice":true,"groupno":"","required":"","editable":true,"addvalidation":"","validationtype":"","validationalert":"","checkButtonArrayDefault":""},{"name":"video1","type":"Video","restirction":"no","addmore":"","fordevice":true,"groupno":"","required":"","editable":true,"addvalidation":"","validationtype":"","validationalert":"","checkButtonArrayDefault":""}]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Data|array|
#      |$.Data[0]|object|
#      |$.Data[1]|object|
#      |$.Data[2]|object|
#

#  @Positive @Smoke
#  Scenario: Get user custom fields with comprehensive validation
#    And I send the GET request to "get_user_custom_fields" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|User custom field Data retrived successfully.|
#      |$.Data|[{"name":"name","type":"SingleLineText","restirction":"no","addmore":"","fordevice":true,"groupno":"","required":"","editable":true,"addvalidation":true,"validationtype":"regex","validationalert":"","checkButtonArrayDefault":""},{"name":"image1","type":"Image","restirction":"no","addmore":"","fordevice":true,"groupno":"","required":"","editable":true,"addvalidation":"","validationtype":"","validationalert":"","checkButtonArrayDefault":""},{"name":"video1","type":"Video","restirction":"no","addmore":"","fordevice":true,"groupno":"","required":"","editable":true,"addvalidation":"","validationtype":"","validationalert":"","checkButtonArrayDefault":""}]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Data|array|
#      |$.Data[0]|object|
#      |$.Data[1]|object|
#      |$.Data[2]|object|
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Content-Type|application/json; charset=UTF-8|
#      |Server|Bizom|
#      |Connection|keep-alive|
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.Result|true|

#  @Positive @Functional
#  Scenario: Verify user custom fields response format
#    And I send the GET request to "get_user_custom_fields" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|User custom field Data retrived successfully.|
#      |$.Data|[{"name":"name","type":"SingleLineText","restirction":"no","addmore":"","fordevice":true,"groupno":"","required":"","editable":true,"addvalidation":true,"validationtype":"regex","validationalert":"","checkButtonArrayDefault":""},{"name":"image1","type":"Image","restirction":"no","addmore":"","fordevice":true,"groupno":"","required":"","editable":true,"addvalidation":"","validationtype":"","validationalert":"","checkButtonArrayDefault":""},{"name":"video1","type":"Video","restirction":"no","addmore":"","fordevice":true,"groupno":"","required":"","editable":true,"addvalidation":"","validationtype":"","validationalert":"","checkButtonArrayDefault":""}]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Data|array|
#      |$.Data[0]|object|
#      |$.Data[1]|object|
#      |$.Data[2]|object|

#  @Positive @BusinessLogic
#  Scenario: Verify user custom fields business logic
#    And I send the GET request to "get_user_custom_fields" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|User custom field Data retrived successfully.|
#      |$.Data|[{"name":"name","type":"SingleLineText","restirction":"no","addmore":"","fordevice":true,"groupno":"","required":"","editable":true,"addvalidation":true,"validationtype":"regex","validationalert":"","checkButtonArrayDefault":""},{"name":"image1","type":"Image","restirction":"no","addmore":"","fordevice":true,"groupno":"","required":"","editable":true,"addvalidation":"","validationtype":"","validationalert":"","checkButtonArrayDefault":""},{"name":"video1","type":"Video","restirction":"no","addmore":"","fordevice":true,"groupno":"","required":"","editable":true,"addvalidation":"","validationtype":"","validationalert":"","checkButtonArrayDefault":""}]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Data|array|
#      |$.Data[0]|object|
#      |$.Data[1]|object|
#      |$.Data[2]|object|

#  @Positive @DataValidation
#  Scenario: Verify user custom fields data structure
#    And I send the GET request to "get_user_custom_fields" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|User custom field Data retrived successfully.|
#      |$.Data|[{"name":"name","type":"SingleLineText","restirction":"no","addmore":"","fordevice":true,"groupno":"","required":"","editable":true,"addvalidation":true,"validationtype":"regex","validationalert":"","checkButtonArrayDefault":""},{"name":"image1","type":"Image","restirction":"no","addmore":"","fordevice":true,"groupno":"","required":"","editable":true,"addvalidation":"","validationtype":"","validationalert":"","checkButtonArrayDefault":""},{"name":"video1","type":"Video","restirction":"no","addmore":"","fordevice":true,"groupno":"","required":"","editable":true,"addvalidation":"","validationtype":"","validationalert":"","checkButtonArrayDefault":""}]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Data|array|
#      |$.Data[0]|object|
#      |$.Data[0].name|string|
#      |$.Data[0].type|string|
#      |$.Data[0].restirction|string|
#      |$.Data[0].addmore|string|
#      |$.Data[0].fordevice|boolean|
#      |$.Data[0].groupno|string|
#      |$.Data[0].required|string|
#      |$.Data[0].editable|boolean|
#      |$.Data[0].addvalidation|boolean|
#      |$.Data[0].validationtype|string|
#      |$.Data[0].validationalert|string|
#      |$.Data[0].checkButtonArrayDefault|string|
#      |$.Data[1]|object|
#      |$.Data[1].name|string|
#      |$.Data[1].type|string|
#      |$.Data[1].restirction|string|
#      |$.Data[1].addmore|string|
#      |$.Data[1].fordevice|boolean|
#      |$.Data[1].groupno|string|
#      |$.Data[1].required|string|
#      |$.Data[1].editable|boolean|
#      |$.Data[1].addvalidation|string|
#      |$.Data[1].validationtype|string|
#      |$.Data[1].validationalert|string|
#      |$.Data[1].checkButtonArrayDefault|string|
#      |$.Data[2]|object|
#      |$.Data[2].name|string|
#      |$.Data[2].type|string|
#      |$.Data[2].restirction|string|
#      |$.Data[2].addmore|string|
#      |$.Data[2].fordevice|boolean|
#      |$.Data[2].groupno|string|
#      |$.Data[2].required|string|
#      |$.Data[2].editable|boolean|
#      |$.Data[2].addvalidation|string|
#      |$.Data[2].validationtype|string|
#      |$.Data[2].validationalert|string|
#      |$.Data[2].checkButtonArrayDefault|string|


#  @Positive @EdgeCase
#  Scenario: Verify user custom fields with empty response
#    And I send the GET request to "get_user_custom_fields" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|User custom field Data retrived successfully.|
#      |$.Data|[{"name":"name","type":"SingleLineText","restirction":"no","addmore":"","fordevice":true,"groupno":"","required":"","editable":true,"addvalidation":true,"validationtype":"regex","validationalert":"","checkButtonArrayDefault":""},{"name":"image1","type":"Image","restirction":"no","addmore":"","fordevice":true,"groupno":"","required":"","editable":true,"addvalidation":"","validationtype":"","validationalert":"","checkButtonArrayDefault":""},{"name":"video1","type":"Video","restirction":"no","addmore":"","fordevice":true,"groupno":"","required":"","editable":true,"addvalidation":"","validationtype":"","validationalert":"","checkButtonArrayDefault":""}]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Data|array|

#  @Positive @Regression
#  Scenario: Verify user custom fields regression testing
#    And I send the GET request to "get_user_custom_fields" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|User custom field Data retrived successfully.|
#      |$.Data|[{"name":"name","type":"SingleLineText","restirction":"no","addmore":"","fordevice":true,"groupno":"","required":"","editable":true,"addvalidation":true,"validationtype":"regex","validationalert":"","checkButtonArrayDefault":""},{"name":"image1","type":"Image","restirction":"no","addmore":"","fordevice":true,"groupno":"","required":"","editable":true,"addvalidation":"","validationtype":"","validationalert":"","checkButtonArrayDefault":""},{"name":"video1","type":"Video","restirction":"no","addmore":"","fordevice":true,"groupno":"","required":"","editable":true,"addvalidation":"","validationtype":"","validationalert":"","checkButtonArrayDefault":""}]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Data|array|
#      |$.Data[0]|object|
#      |$.Data[1]|object|
#      |$.Data[2]|object|



#  @Positive @DataValidation
#  Scenario: Verify user custom fields specific field validation
#    And I send the GET request to "get_user_custom_fields" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|User custom field Data retrived successfully.|
#      |$.Data|[{"name":"name","type":"SingleLineText","restirction":"no","addmore":"","fordevice":true,"groupno":"","required":"","editable":true,"addvalidation":true,"validationtype":"regex","validationalert":"","checkButtonArrayDefault":""},{"name":"image1","type":"Image","restirction":"no","addmore":"","fordevice":true,"groupno":"","required":"","editable":true,"addvalidation":"","validationtype":"","validationalert":"","checkButtonArrayDefault":""},{"name":"video1","type":"Video","restirction":"no","addmore":"","fordevice":true,"groupno":"","required":"","editable":true,"addvalidation":"","validationtype":"","validationalert":"","checkButtonArrayDefault":""}]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Data|array|
#      |$.Data[0]|object|
#      |$.Data[1]|object|
#      |$.Data[2]|object|
   
