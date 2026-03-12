@BizomWebAPI @ReasonsManagement @Reasons @OrderManagement @OS
Feature: Active or Deactive Reason API Testing
  As a system user
  I want to test the active_or_deactive_reason endpoint
  So that I can ensure proper functionality for activating and deactivating reasons

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|



#  @Negative @Security
#  Scenario: Activate reason with invalid access token
#    And I send the GET request to "reasons_active_or_deactive_reason" endpoint with dynamic access token, path and query parameters
#      |PathParamName|PathParamValue|QueryParamName|QueryParamValue|
#      |reasonId|6|access_token|invalid_token_12345|
#      |||flag|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Deactivate reason with invalid access token
#    And I send the GET request to "reasons_active_or_deactive_reason" endpoint with dynamic access token, path and query parameters
#      |PathParamName|PathParamValue|QueryParamName|QueryParamValue|
#      |reasonId|6|access_token|invalid_token_12345|
#      |||flag|0|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Activate reason with expired access token
#    And I send the GET request to "reasons_active_or_deactive_reason" endpoint with dynamic access token, path and query parameters
#      |PathParamName|PathParamValue|QueryParamName|QueryParamValue|
#      |reasonId|6|access_token|expired_token_12345|
#      |||flag|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Deactivate reason with expired access token
#    And I send the GET request to "reasons_active_or_deactive_reason" endpoint with dynamic access token, path and query parameters
#      |PathParamName|PathParamValue|QueryParamName|QueryParamValue|
#      |reasonId|6|access_token|expired_token_12345|
#      |||flag|0|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Activate reason with malformed access token
#    And I send the GET request to "reasons_active_or_deactive_reason" endpoint with dynamic access token, path and query parameters
#      |PathParamName|PathParamValue|QueryParamName|QueryParamValue|
#      |reasonId|6|access_token|malformed.token.here|
#      |||flag|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

#  @Positive @Smoke
#  Scenario: Activate reason with valid access token and flag=1
#    And I send the GET request to "reasons_active_or_deactive_reason" endpoint with dynamic access token, path and query parameters
#      |PathParamName|PathParamValue|QueryParamName|QueryParamValue|
#      |reasonId|6|access_token|ACCESS_TOKEN|
#      |||flag|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Reason Activated|
#      |$.data.reasonIsActive|"1"|
#    And I store the response as "activate_reason_response" name using full path

#  @Positive @Smoke
#  Scenario: Deactivate reason with valid access token and flag=0
#    And I send the GET request to "reasons_active_or_deactive_reason" endpoint with dynamic access token, path and query parameters
#      |PathParamName|PathParamValue|QueryParamName|QueryParamValue|
#      |reasonId|6|access_token|ACCESS_TOKEN|
#      |||flag|0|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Reason Deactivated|
#      |$.data.reasonIsActive|"0"|
#    And I store the response as "deactivate_reason_response" name using full path

#  @Positive @DataValidation
#  Scenario: Validate activate reason response structure
#    And I send the GET request to "reasons_active_or_deactive_reason" endpoint with dynamic access token, path and query parameters
#      |PathParamName|PathParamValue|QueryParamName|QueryParamValue|
#      |reasonId|6|access_token|ACCESS_TOKEN|
#      |||flag|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Reason Activated|
#      |$.data.reasonIsActive|"1"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.data|object|
#      |$.data.reasonIsActive|string|

#  @Positive @DataValidation
#  Scenario: Validate deactivate reason response structure
#    And I send the GET request to "reasons_active_or_deactive_reason" endpoint with dynamic access token, path and query parameters
#      |PathParamName|PathParamValue|QueryParamName|QueryParamValue|
#      |reasonId|6|access_token|ACCESS_TOKEN|
#      |||flag|0|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Reason Deactivated|
#      |$.data.reasonIsActive|"0"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.data|object|
#      |$.data.reasonIsActive|string|
#
#  @Positive @DataValidation
#  Scenario: Validate activate reason with different reason IDs
#    And I send the GET request to "reasons_active_or_deactive_reason" endpoint with dynamic access token, path and query parameters
#      |PathParamName|PathParamValue|QueryParamName|QueryParamValue|
#      |reasonId|1|access_token|ACCESS_TOKEN|
#      |||flag|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Reason Activated|
#      |$.data.reasonIsActive|"1"|
#
#  @Positive @DataValidation
#  Scenario: Validate deactivate reason with different reason IDs
#    And I send the GET request to "reasons_active_or_deactive_reason" endpoint with dynamic access token, path and query parameters
#      |PathParamName|PathParamValue|QueryParamName|QueryParamValue|
#      |reasonId|2|access_token|ACCESS_TOKEN|
#      |||flag|0|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Reason Deactivated|
#      |$.data.reasonIsActive|"0"|
#
#  @Positive @Performance
#  Scenario: Performance test for activate reason endpoint
#    And I send the GET request to "reasons_active_or_deactive_reason" endpoint with dynamic access token, path and query parameters
#      |PathParamName|PathParamValue|QueryParamName|QueryParamValue|
#      |reasonId|6|access_token|ACCESS_TOKEN|
#      |||flag|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Reason Activated|
#
#  @Positive @Performance
#  Scenario: Performance test for deactivate reason endpoint
#    And I send the GET request to "reasons_active_or_deactive_reason" endpoint with dynamic access token, path and query parameters
#      |PathParamName|PathParamValue|QueryParamName|QueryParamValue|
#      |reasonId|6|access_token|ACCESS_TOKEN|
#      |||flag|0|
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Reason Deactivated|
#
#  @Positive @Concurrency
#  Scenario: Concurrent access test for activate reason endpoint
#    And I send the GET request to "reasons_active_or_deactive_reason" endpoint with dynamic access token, path and query parameters
#      |PathParamName|PathParamValue|QueryParamName|QueryParamValue|
#      |reasonId|6|access_token|ACCESS_TOKEN|
#      |||flag|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Reason Activated|
#
#  @Positive @Concurrency
#  Scenario: Concurrent access test for deactivate reason endpoint
#    And I send the GET request to "reasons_active_or_deactive_reason" endpoint with dynamic access token, path and query parameters
#      |PathParamName|PathParamValue|QueryParamName|QueryParamValue|
#      |reasonId|6|access_token|ACCESS_TOKEN|
#      |||flag|0|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Reason Deactivated|

#  @Negative @Validation
#  Scenario: Activate reason without flag parameter
#    And I send the GET request to "reasons_active_or_deactive_reason" endpoint with dynamic access token, path and query parameters
#      |PathParamName|PathParamValue|QueryParamName|QueryParamValue|
#      |reasonId|6|access_token|ACCESS_TOKEN|
#    Then I should see the response code as "400"
#    And verify response time is less than "2500" milliseconds
#
#  @Negative @Validation
#  Scenario: Activate reason with invalid flag value
#    And I send the GET request to "reasons_active_or_deactive_reason" endpoint with dynamic access token, path and query parameters
#      |PathParamName|PathParamValue|QueryParamName|QueryParamValue|
#      |reasonId|6|access_token|ACCESS_TOKEN|
#      |||flag|2|
#    Then I should see the response code as "400"
#    And verify response time is less than "2500" milliseconds
#
#  @Negative @Validation
#  Scenario: Activate reason with negative flag value
#    And I send the GET request to "reasons_active_or_deactive_reason" endpoint with dynamic access token, path and query parameters
#      |PathParamName|PathParamValue|QueryParamName|QueryParamValue|
#      |reasonId|6|access_token|ACCESS_TOKEN|
#      |||flag|-1|
#    Then I should see the response code as "400"
#    And verify response time is less than "2500" milliseconds
#
#  @Negative @Validation
#  Scenario: Activate reason with non-numeric flag value
#    And I send the GET request to "reasons_active_or_deactive_reason" endpoint with dynamic access token, path and query parameters
#      |PathParamName|PathParamValue|QueryParamName|QueryParamValue|
#      |reasonId|6|access_token|ACCESS_TOKEN|
#      |||flag|abc|
#    Then I should see the response code as "400"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Validation
#  Scenario: Activate reason with empty flag parameter
#    And I send the GET request to "reasons_active_or_deactive_reason" endpoint with dynamic access token, path and query parameters
#      |PathParamName|PathParamValue|QueryParamName|QueryParamValue|
#      |reasonId|6|access_token|ACCESS_TOKEN|
#      |||flag||
#    Then I should see the response code as "400"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Validation
#  Scenario: Activate reason with invalid reason ID
#    And I send the GET request to "reasons_active_or_deactive_reason" endpoint with dynamic access token, path and query parameters
#      |PathParamName|PathParamValue|QueryParamName|QueryParamValue|
#      |reasonId|99999|access_token|ACCESS_TOKEN|
#      |||flag|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Validation
#  Scenario: Activate reason with negative reason ID
#    And I send the GET request to "reasons_active_or_deactive_reason" endpoint with dynamic access token, path and query parameters
#      |PathParamName|PathParamValue|QueryParamName|QueryParamValue|
#      |reasonId|-1|access_token|ACCESS_TOKEN|
#      |||flag|1|
#    Then I should see the response code as "400"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Validation
#  Scenario: Activate reason with zero reason ID
#    And I send the GET request to "reasons_active_or_deactive_reason" endpoint with dynamic access token, path and query parameters
#      |PathParamName|PathParamValue|QueryParamName|QueryParamValue|
#      |reasonId|0|access_token|ACCESS_TOKEN|
#      |||flag|1|
#    Then I should see the response code as "400"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Validation
#  Scenario: Activate reason with non-numeric reason ID
#    And I send the GET request to "reasons_active_or_deactive_reason" endpoint with dynamic access token, path and query parameters
#      |PathParamName|PathParamValue|QueryParamName|QueryParamValue|
#      |reasonId|abc|access_token|ACCESS_TOKEN|
#      |||flag|1|
#    Then I should see the response code as "400"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Validation
#  Scenario: Activate reason with special characters in flag parameter
#    And I send the GET request to "reasons_active_or_deactive_reason" endpoint with dynamic access token, path and query parameters
#      |PathParamName|PathParamValue|QueryParamName|QueryParamValue|
#      |reasonId|6|access_token|ACCESS_TOKEN|
#      |||flag|<script>alert('XSS')</script>|
#    Then I should see the response code as "400"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Activate reason with SQL injection attempt in flag parameter
#    And I send the GET request to "reasons_active_or_deactive_reason" endpoint with dynamic access token, path and query parameters
#      |PathParamName|PathParamValue|QueryParamName|QueryParamValue|
#      |reasonId|6|access_token|ACCESS_TOKEN|
#      |||flag|'; DROP TABLE reasons; --|
#    Then I should see the response code as "400"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Activate reason with SQL injection attempt in reason ID
#    And I send the GET request to "reasons_active_or_deactive_reason" endpoint with dynamic access token, path and query parameters
#      |PathParamName|PathParamValue|QueryParamName|QueryParamValue|
#      |reasonId|'; DROP TABLE reasons; --|access_token|ACCESS_TOKEN|
#      |||flag|1|
#    Then I should see the response code as "400"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Boundary
#  Scenario: Activate reason with maximum query parameters
#    And I send the GET request to "reasons_active_or_deactive_reason" endpoint with dynamic access token, path and query parameters
#      |PathParamName|PathParamValue|QueryParamName|QueryParamValue|
#      |reasonId|6|access_token|ACCESS_TOKEN|
#      |||flag|1|
#      |||param1|value1|
#      |||param2|value2|
#      |||param3|value3|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Reason Activated|

#  @Negative @ErrorHandling
#  Scenario: Activate reason with invalid endpoint
#    And I send the GET request to "reasons_active_or_deactive_reason_invalid" endpoint with dynamic access token, path and query parameters
#      |PathParamName|PathParamValue|QueryParamName|QueryParamValue|
#      |reasonId|6|access_token|ACCESS_TOKEN|
#      |||flag|1|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds

#  @Positive @BusinessLogic
#  Scenario: Validate activate reason business logic - toggle activation
#    And I send the GET request to "reasons_active_or_deactive_reason" endpoint with dynamic access token, path and query parameters
#      |PathParamName|PathParamValue|QueryParamName|QueryParamValue|
#      |reasonId|6|access_token|ACCESS_TOKEN|
#      |||flag|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Reason Activated|
#      |$.data.reasonIsActive|"1"|
#    And I send the GET request to "reasons_active_or_deactive_reason" endpoint with dynamic access token, path and query parameters
#      |PathParamName|PathParamValue|QueryParamName|QueryParamValue|
#      |reasonId|6|access_token|ACCESS_TOKEN|
#      |||flag|0|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Reason Deactivated|
#      |$.data.reasonIsActive|"0"|

#  @Positive @BusinessLogic
#  Scenario: Validate deactivate reason business logic - toggle deactivation
#    And I send the GET request to "reasons_active_or_deactive_reason" endpoint with dynamic access token, path and query parameters
#      |PathParamName|PathParamValue|QueryParamName|QueryParamValue|
#      |reasonId|6|access_token|ACCESS_TOKEN|
#      |||flag|0|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Reason Deactivated|
#      |$.data.reasonIsActive|"0"|
#    And I send the GET request to "reasons_active_or_deactive_reason" endpoint with dynamic access token, path and query parameters
#      |PathParamName|PathParamValue|QueryParamName|QueryParamValue|
#      |reasonId|6|access_token|ACCESS_TOKEN|
#      |||flag|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Reason Activated|
#      |$.data.reasonIsActive|"1"|

#  @Positive @DataIntegrity
#  Scenario: Validate activate reason data integrity
#    And I send the GET request to "reasons_active_or_deactive_reason" endpoint with dynamic access token, path and query parameters
#      |PathParamName|PathParamValue|QueryParamName|QueryParamValue|
#      |reasonId|6|access_token|ACCESS_TOKEN|
#      |||flag|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Reason Activated|
#      |$.data.reasonIsActive|"1"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.data|object|
#      |$.data.reasonIsActive|string|

#  @Positive @DataIntegrity
#  Scenario: Validate deactivate reason data integrity
#    And I send the GET request to "reasons_active_or_deactive_reason" endpoint with dynamic access token, path and query parameters
#      |PathParamName|PathParamValue|QueryParamName|QueryParamValue|
#      |reasonId|6|access_token|ACCESS_TOKEN|
#      |||flag|0|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Reason Deactivated|
#      |$.data.reasonIsActive|"0"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.data|object|
#      |$.data.reasonIsActive|string|
#
#  @Positive @Regression
#  Scenario: Regression test for activate reason endpoint
#    And I send the GET request to "reasons_active_or_deactive_reason" endpoint with dynamic access token, path and query parameters
#      |PathParamName|PathParamValue|QueryParamName|QueryParamValue|
#      |reasonId|6|access_token|ACCESS_TOKEN|
#      |||flag|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Reason Activated|
#      |$.data.reasonIsActive|"1"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.data|object|
#      |$.data.reasonIsActive|string|
#
#  @Positive @Regression
#  Scenario: Regression test for deactivate reason endpoint
#    And I send the GET request to "reasons_active_or_deactive_reason" endpoint with dynamic access token, path and query parameters
#      |PathParamName|PathParamValue|QueryParamName|QueryParamValue|
#      |reasonId|6|access_token|ACCESS_TOKEN|
#      |||flag|0|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Reason Deactivated|
#      |$.data.reasonIsActive|"0"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.data|object|
#      |$.data.reasonIsActive|string|
#
#  @Positive @Functional
#  Scenario: Validate activate reason response completeness
#    And I send the GET request to "reasons_active_or_deactive_reason" endpoint with dynamic access token, path and query parameters
#      |PathParamName|PathParamValue|QueryParamName|QueryParamValue|
#      |reasonId|6|access_token|ACCESS_TOKEN|
#      |||flag|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Reason Activated|
#      |$.data.reasonIsActive|"1"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.data|object|
#      |$.data.reasonIsActive|string|
#
#  @Positive @Functional
#  Scenario: Validate deactivate reason response completeness
#    And I send the GET request to "reasons_active_or_deactive_reason" endpoint with dynamic access token, path and query parameters
#      |PathParamName|PathParamValue|QueryParamName|QueryParamValue|
#      |reasonId|6|access_token|ACCESS_TOKEN|
#      |||flag|0|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Reason Deactivated|
#      |$.data.reasonIsActive|"0"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.data|object|
#      |$.data.reasonIsActive|string|
#
#  @Positive @ContentValidation
#  Scenario: Validate activate reason content structure
#    And I send the GET request to "reasons_active_or_deactive_reason" endpoint with dynamic access token, path and query parameters
#      |PathParamName|PathParamValue|QueryParamName|QueryParamValue|
#      |reasonId|6|access_token|ACCESS_TOKEN|
#      |||flag|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Reason Activated|
#    And validating the response contains the following values
#      |Value|
#      |Result|
#      |Reason|
#      |Reason Activated|
#      |data|
#      |reasonIsActive|
#
#  @Positive @ContentValidation
#  Scenario: Validate deactivate reason content structure
#    And I send the GET request to "reasons_active_or_deactive_reason" endpoint with dynamic access token, path and query parameters
#      |PathParamName|PathParamValue|QueryParamName|QueryParamValue|
#      |reasonId|6|access_token|ACCESS_TOKEN|
#      |||flag|0|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Reason Deactivated|
#    And validating the response contains the following values
#      |Value|
#      |Result|
#      |Reason|
#      |Reason Deactivated|
#      |data|
#      |reasonIsActive|

#  @Positive @FieldSpecificValidation
#  Scenario: Validate activate reason Result field
#    And I send the GET request to "reasons_active_or_deactive_reason" endpoint with dynamic access token, path and query parameters
#      |PathParamName|PathParamValue|QueryParamName|QueryParamValue|
#      |reasonId|6|access_token|ACCESS_TOKEN|
#      |||flag|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#
#  @Positive @FieldSpecificValidation
#  Scenario: Validate activate reason Reason field
#    And I send the GET request to "reasons_active_or_deactive_reason" endpoint with dynamic access token, path and query parameters
#      |PathParamName|PathParamValue|QueryParamName|QueryParamValue|
#      |reasonId|6|access_token|ACCESS_TOKEN|
#      |||flag|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Reason|Reason Activated|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Reason|string|
#
#  @Positive @FieldSpecificValidation
#  Scenario: Validate activate reason reasonIsActive field
#    And I send the GET request to "reasons_active_or_deactive_reason" endpoint with dynamic access token, path and query parameters
#      |PathParamName|PathParamValue|QueryParamName|QueryParamValue|
#      |reasonId|6|access_token|ACCESS_TOKEN|
#      |||flag|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.data.reasonIsActive|"1"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.data.reasonIsActive|string|

#  @Positive @FieldSpecificValidation
#  Scenario: Validate deactivate reason reasonIsActive field
#    And I send the GET request to "reasons_active_or_deactive_reason" endpoint with dynamic access token, path and query parameters
#      |PathParamName|PathParamValue|QueryParamName|QueryParamValue|
#      |reasonId|6|access_token|ACCESS_TOKEN|
#      |||flag|0|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.data.reasonIsActive|"0"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.data.reasonIsActive|string|

#  @Positive @LoadTesting
#  Scenario: Load testing for activate reason endpoint
#    And I send the GET request to "reasons_active_or_deactive_reason" endpoint with dynamic access token, path and query parameters
#      |PathParamName|PathParamValue|QueryParamName|QueryParamValue|
#      |reasonId|6|access_token|ACCESS_TOKEN|
#      |||flag|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "3000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Reason Activated|

#  @Positive @LoadTesting
#  Scenario: Load testing for deactivate reason endpoint
#    And I send the GET request to "reasons_active_or_deactive_reason" endpoint with dynamic access token, path and query parameters
#      |PathParamName|PathParamValue|QueryParamName|QueryParamValue|
#      |reasonId|6|access_token|ACCESS_TOKEN|
#      |||flag|0|
#    Then I should see the response code as "200"
#    And verify response time is less than "3000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Reason Deactivated|

#  @Negative @Timeout
#  Scenario: Test activate reason endpoint timeout handling
#    And I send the GET request to "reasons_active_or_deactive_reason" endpoint with dynamic access token, path and query parameters
#      |PathParamName|PathParamValue|QueryParamName|QueryParamValue|
#      |reasonId|6|access_token|ACCESS_TOKEN|
#      |||flag|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "5000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Reason Activated|

#  @Negative @Timeout
#  Scenario: Test deactivate reason endpoint timeout handling
#    And I send the GET request to "reasons_active_or_deactive_reason" endpoint with dynamic access token, path and query parameters
#      |PathParamName|PathParamValue|QueryParamName|QueryParamValue|
#      |reasonId|6|access_token|ACCESS_TOKEN|
#      |||flag|0|
#    Then I should see the response code as "200"
#    And verify response time is less than "5000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Reason Deactivated|

#  @Positive @EndToEnd
#  Scenario: End-to-end activate reason workflow
#    And I send the GET request to "reasons_active_or_deactive_reason" endpoint with dynamic access token, path and query parameters
#      |PathParamName|PathParamValue|QueryParamName|QueryParamValue|
#      |reasonId|6|access_token|ACCESS_TOKEN|
#      |||flag|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Reason Activated|
#      |$.data.reasonIsActive|"1"|
#    And I store the response as "activate_reason_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.data|object|
#      |$.data.reasonIsActive|string|

#  @Positive @EndToEnd
#  Scenario: End-to-end deactivate reason workflow
#    And I send the GET request to "reasons_active_or_deactive_reason" endpoint with dynamic access token, path and query parameters
#      |PathParamName|PathParamValue|QueryParamName|QueryParamValue|
#      |reasonId|6|access_token|ACCESS_TOKEN|
#      |||flag|0|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Reason Deactivated|
#      |$.data.reasonIsActive|"0"|
#    And I store the response as "deactivate_reason_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.data|object|
#      |$.data.reasonIsActive|string|

