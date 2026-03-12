@BizomWebAPI @CE @ComplianceFormsForUser @UserManagement
Feature: Compliance Forms For User API Testing
  As a system user
  I want to test the compliance forms for user endpoint
  So that I can ensure proper functionality and data retrieval for user compliance forms management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get compliance forms for user without access token
    When I send the GET request to "compliance_forms_for_user" endpoint with path parameters
     |Path|Value|
      |userId|12|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get compliance forms for user with invalid access token
    And I send the GET request to "compliance_forms_for_user" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|12|access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get compliance forms for user with expired access token
    And I send the GET request to "compliance_forms_for_user" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|12|access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get compliance forms for user with malformed access token
    And I send the GET request to "compliance_forms_for_user" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|12|access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke @DataValidation
  Scenario: Get compliance forms for user with valid access token for userId=12 (no forms assigned)
    And I send the GET request to "compliance_forms_for_user" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|12|access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No forms assigned to the user.|
    And I store the response as "compliance_forms_userId_12_response" name using full path

#  @Positive @DataValidation
#  Scenario: Validate compliance forms response structure for userId=12
#    And I send the GET request to "compliance_forms_for_user" endpoint with dynamic access token, path and query parameters
#     |Path|Value|QueryParamName|QueryParamValue|
#      |userId|12|access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|No forms assigned to the user.|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|

#  @Positive @DataValidation
#  Scenario: Validate compliance forms response completeness for userId=12
#    And I send the GET request to "compliance_forms_for_user" endpoint with dynamic access token, path and query parameters
#     |Path|Value|QueryParamName|QueryParamValue|
#      |userId|12|access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|No forms assigned to the user.|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|

  @Positive @Performance
  Scenario: Performance test for compliance forms endpoint
    And I send the GET request to "compliance_forms_for_user" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|12|access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No forms assigned to the user.|

  @Positive @Concurrency
  Scenario: Concurrent access test for compliance forms endpoint
    And I send the GET request to "compliance_forms_for_user" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|12|access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No forms assigned to the user.|

  @Positive @BusinessLogic
  Scenario: Validate compliance forms business logic for userId=12
    And I send the GET request to "compliance_forms_for_user" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|12|access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No forms assigned to the user.|


#  @Positive @DataIntegrity
#  Scenario: Validate compliance forms data integrity for userId=12
#    And I send the GET request to "compliance_forms_for_user" endpoint with dynamic access token, path and query parameters
#     |Path|Value|QueryParamName|QueryParamValue|
#      |userId|12|access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|No forms assigned to the user.|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|

#  @Positive @Regression
#  Scenario: Regression test for compliance forms endpoint
#    And I send the GET request to "compliance_forms_for_user" endpoint with dynamic access token, path and query parameters
#     |Path|Value|QueryParamName|QueryParamValue|
#      |userId|12|access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|No forms assigned to the user.|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|

#  @Positive @Functional
#  Scenario: Validate compliance forms response completeness for userId=12
#    And I send the GET request to "compliance_forms_for_user" endpoint with dynamic access token, path and query parameters
#     |Path|Value|QueryParamName|QueryParamValue|
#      |userId|12|access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|No forms assigned to the user.|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|

  @Positive @ContentValidation
  Scenario: Validate compliance forms content structure for userId=12
    And I send the GET request to "compliance_forms_for_user" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|12|access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No forms assigned to the user.|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |No forms assigned to the user.|

  @Positive @LoadTesting
  Scenario: Load testing for compliance forms endpoint
    And I send the GET request to "compliance_forms_for_user" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|12|access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No forms assigned to the user.|

  @Negative @Timeout
  Scenario: Test compliance forms endpoint timeout handling
    And I send the GET request to "compliance_forms_for_user" endpoint with dynamic access token, path and query parameters
     |Path|Value|QueryParamName|QueryParamValue|
      |userId|12|access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No forms assigned to the user.|

#  @Positive @EndToEnd
#  Scenario: End-to-end compliance forms data retrieval workflow for userId=12
#    And I send the GET request to "compliance_forms_for_user" endpoint with dynamic access token, path and query parameters
#     |Path|Value|QueryParamName|QueryParamValue|
#      |userId|12|access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|No forms assigned to the user.|
#    And I store the response as "compliance_forms_userId_12_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|

#  @Positive @ComplianceFormsValidation
#  Scenario: Validate compliance forms data accuracy for userId=12
#    And I send the GET request to "compliance_forms_for_user" endpoint with dynamic access token, path and query parameters
#     |Path|Value|QueryParamName|QueryParamValue|
#      |userId|12|access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|No forms assigned to the user.|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|

#  @Positive @UserManagementValidation
#  Scenario: Validate compliance forms user management interface for userId=12
#    And I send the GET request to "compliance_forms_for_user" endpoint with dynamic access token, path and query parameters
#     |Path|Value|QueryParamName|QueryParamValue|
#      |userId|12|access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|No forms assigned to the user.|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|

#  @Positive @EmptyResponseValidation
#  Scenario: Validate compliance forms empty response for userId=12
#    And I send the GET request to "compliance_forms_for_user" endpoint with dynamic access token, path and query parameters
#     |Path|Value|QueryParamName|QueryParamValue|
#      |userId|12|access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|No forms assigned to the user.|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|

#  @Positive @NoFormsAssignedValidation
#  Scenario: Validate compliance forms no forms assigned scenario for userId=12
#    And I send the GET request to "compliance_forms_for_user" endpoint with dynamic access token, path and query parameters
#     |Path|Value|QueryParamName|QueryParamValue|
#      |userId|12|access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|No forms assigned to the user.|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|

#  @Positive @ComplianceFormsBusinessLogic
#  Scenario: Validate compliance forms business logic for no forms assigned
#    And I send the GET request to "compliance_forms_for_user" endpoint with dynamic access token, path and query parameters
#     |Path|Value|QueryParamName|QueryParamValue|
#      |userId|12|access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|No forms assigned to the user.|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|

#  @Positive @ComplianceFormsDataValidation
#  Scenario: Validate compliance forms data validation for userId=12
#    And I send the GET request to "compliance_forms_for_user" endpoint with dynamic access token, path and query parameters
#     |Path|Value|QueryParamName|QueryParamValue|
#      |userId|12|access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|No forms assigned to the user.|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|

#  @Positive @ComplianceFormsResponseValidation
#  Scenario: Validate compliance forms response validation for userId=12
#    And I send the GET request to "compliance_forms_for_user" endpoint with dynamic access token, path and query parameters
#     |Path|Value|QueryParamName|QueryParamValue|
#      |userId|12|access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|No forms assigned to the user.|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|

#  @Positive @ComplianceFormsStructureValidation
#  Scenario: Validate compliance forms structure validation for userId=12
#    And I send the GET request to "compliance_forms_for_user" endpoint with dynamic access token, path and query parameters
#     |Path|Value|QueryParamName|QueryParamValue|
#      |userId|12|access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|No forms assigned to the user.|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|

#  @Positive @ComplianceFormsContentValidation
#  Scenario: Validate compliance forms content validation for userId=12
#    And I send the GET request to "compliance_forms_for_user" endpoint with dynamic access token, path and query parameters
#     |Path|Value|QueryParamName|QueryParamValue|
#      |userId|12|access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|No forms assigned to the user.|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|

#  @Positive @ComplianceFormsAccuracyValidation
#  Scenario: Validate compliance forms accuracy validation for userId=12
#    And I send the GET request to "compliance_forms_for_user" endpoint with dynamic access token, path and query parameters
#     |Path|Value|QueryParamName|QueryParamValue|
#      |userId|12|access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|No forms assigned to the user.|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|

