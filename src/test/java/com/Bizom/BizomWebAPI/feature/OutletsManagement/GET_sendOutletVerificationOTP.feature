@BizomWebAPI @CE @OutletsManagement @OutletVerification @SendOutletVerificationOTP @SalesOperations
#This API have Bug , Notice is coming in responce
Feature: Send Outlet Verification OTP API Testing
  As a system user
  I want to test the Send Outlet Verification OTP endpoint
  So that I can ensure OTP sending functionality works properly for valid and invalid inputs

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

#  @Negative @Validation
#  Scenario: Send OTP without phone number
#    When I send the GET request to "outlets_sendOutletVerificationOTP" endpoint
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.reason|Invalid format.|

#  @Negative @Validation
#  Scenario: Send OTP with invalid phone number
#    And I send the GET request to "outlets_sendOutletVerificationOTP" endpoint with query parameters
#      |QueryParamName|QueryParamValue|
#      |phoneNumber|999|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.reason|Invalid format.|

#  @Positive @Smoke
#  Scenario: Send OTP with valid phone number
#    And I send the GET request to "outlets_sendOutletVerificationOTP" endpoint with query parameters
#      |QueryParamName|QueryParamValue|
#      |phoneNumber|9738918021|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Data Found|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Data.id|string|
#      |$.Data.state_id|string|
#      |$.Data.name|string|
#    And I store the response as "send_otp_response" name using full path

#  @Negative @Security
#  Scenario: Send OTP with SQL injection attempt
#    And I send the GET request to "outlets_sendOutletVerificationOTP" endpoint with query parameters
#      |QueryParamName|QueryParamValue|
#      |phoneNumber|'; DROP TABLE outlets; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.reason|Invalid format.|
#      |$.Result|false|
#      |$.Reason|Invalid format.|

#  @Negative @Security
#  Scenario: Send OTP with special characters in phone number
#    And I send the GET request to "outlets_sendOutletVerificationOTP" endpoint with query parameters
#      |QueryParamName|QueryParamValue|
#      |phoneNumber|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.reason|Invalid format.|
#      |$.Result|false|
#      |$.Reason|Invalid format.|

  @Negative @ErrorHandling
  Scenario: Send OTP with invalid endpoint
    And I send the GET request to "outlets_sendOutletVerificationOTP_invalid" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |phoneNumber|9738918021|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Positive @DataValidation
#  Scenario: Validate Send OTP response data structure
#    And I send the GET request to "outlets_sendOutletVerificationOTP" endpoint with query parameters
#      |QueryParamName|QueryParamValue|
#      |phoneNumber|9738918021|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Data Found|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Data|object|
#      |$.Data.id|string|
#      |$.Data.state_id|string|
#      |$.Data.name|string|

#  @Positive @Performance
#  Scenario: Performance test for Send OTP endpoint
#    And I send the GET request to "outlets_sendOutletVerificationOTP" endpoint with query parameters
#      |QueryParamName|QueryParamValue|
#      |phoneNumber|9738918021|
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Data Found|
#
#  @Negative @Timeout
#  Scenario: Test Send OTP endpoint timeout handling
#    And I send the GET request to "outlets_sendOutletVerificationOTP" endpoint with query parameters
#      |QueryParamName|QueryParamValue|
#      |phoneNumber|9738918021|
#    Then I should see the response code as "200"
#    And verify response time is less than "5000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Data Found|
#
#  @Positive @EndToEnd
#  Scenario: End-to-end Send OTP API validation workflow
#    And I send the GET request to "outlets_sendOutletVerificationOTP" endpoint with query parameters
#      |QueryParamName|QueryParamValue|
#      |phoneNumber|9738918021|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Data Found|
#    And I store the response as "send_otp_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Data.id|string|
#      |$.Data.name|string|
