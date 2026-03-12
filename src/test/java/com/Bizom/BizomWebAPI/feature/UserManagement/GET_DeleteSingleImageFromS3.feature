@BizomWebAPI @CE @GetDeleteSingleImageFromS3 @UserManagement
#This API has notice in responce so for a time being we are not testing this API
Feature: Delete Single Image From S3 API Testing
  As a system user
  I want to test the delete single image from S3 endpoint
  So that I can ensure proper functionality for deleting images from S3 storage in user management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get delete single image from S3 without access token
    When I send the GET request to "users_deletesingleimagefroms3" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get delete single image from S3 with invalid access token
    And I send the GET request to "users_deletesingleimagefroms3" endpoint with dynamic access token and query parameters
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
  Scenario: TC_03 Get delete single image from S3 with expired access token
    And I send the GET request to "users_deletesingleimagefroms3" endpoint with dynamic access token and query parameters
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
  Scenario: TC_04 Get delete single image from S3 with malformed access token
    And I send the GET request to "users_deletesingleimagefroms3" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

#  @Positive @Smoke
#  Scenario: TC_05 Get delete single image from S3 with valid access token
#    And I send the GET request to "users_deletesingleimagefroms3" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.success|true|
#      |$.reason|Data could not be deleted.|
#    And I store the response as "delete_single_image_s3_response" name using full path

#  @Positive @DataValidation
#  Scenario: TC_06 Validate delete single image from S3 response structure
#    And I send the GET request to "users_deletesingleimagefroms3" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.success|true|
#      |$.reason|Data could not be deleted.|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.success|boolean|
#      |$.reason|string|

#  @Positive @DataValidation
#  Scenario: TC_07 Validate delete single image from S3 success field
#    And I send the GET request to "users_deletesingleimagefroms3" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.success|true|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.success|boolean|

#  @Positive @DataValidation
#  Scenario: TC_08 Validate delete single image from S3 reason field
#    And I send the GET request to "users_deletesingleimagefroms3" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.reason|Data could not be deleted.|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.reason|string|

#  @Positive @DataValidation
#  Scenario: TC_09 Validate delete single image from S3 complete structure
#    And I send the GET request to "users_deletesingleimagefroms3" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.success|true|
#      |$.reason|Data could not be deleted.|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.success|boolean|
#      |$.reason|string|

#  @Positive @Performance
#  Scenario: TC_10 Performance test for delete single image from S3 endpoint
#    And I send the GET request to "users_deletesingleimagefroms3" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.success|true|
#      |$.reason|Data could not be deleted.|

#  @Positive @Concurrency
#  Scenario: TC_11 Concurrent access test for delete single image from S3 endpoint
#    And I send the GET request to "users_deletesingleimagefroms3" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.success|true|
#      |$.reason|Data could not be deleted.|

#  @Negative @Validation
#  Scenario: TC_12 Get delete single image from S3 with invalid query parameters
#    And I send the GET request to "users_deletesingleimagefroms3" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |invalid_param|invalid_value|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.success|true|
#      |$.reason|Data could not be deleted.|

#  @Negative @Validation
#  Scenario: TC_13 Get delete single image from S3 with special characters in query parameters
#    And I send the GET request to "users_deletesingleimagefroms3" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.success|true|
#      |$.reason|Data could not be deleted.|

#  @Negative @Security
#  Scenario: TC_14 Get delete single image from S3 with SQL injection attempt
#    And I send the GET request to "users_deletesingleimagefroms3" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|'; DROP TABLE users; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.success|true|
#      |$.reason|Data could not be deleted.|

#  @Negative @Boundary
#  Scenario: TC_15 Get delete single image from S3 with maximum query parameters
#    And I send the GET request to "users_deletesingleimagefroms3" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |param1|value1|
#      |param2|value2|
#      |param3|value3|
#      |param4|value4|
#      |param5|value5|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.success|true|
#      |$.reason|Data could not be deleted.|

#  @Negative @ErrorHandling
#  Scenario: TC_16 Get delete single image from S3 with invalid endpoint
#    And I send the GET request to "users_deletesingleimagefroms3_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

#  @Positive @BusinessLogic
#  Scenario: TC_17 Validate delete single image from S3 business logic
#    And I send the GET request to "users_deletesingleimagefroms3" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.success|true|
#      |$.reason|Data could not be deleted.|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.success|boolean|
#      |$.reason|string|

#  @Positive @DataIntegrity
#  Scenario: TC_18 Validate delete single image from S3 data integrity
#    And I send the GET request to "users_deletesingleimagefroms3" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.success|boolean|
#      |$.reason|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.success|true|
#      |$.reason|Data could not be deleted.|

#  @Positive @Regression
#  Scenario: TC_19 Regression test for delete single image from S3 endpoint
#    And I send the GET request to "users_deletesingleimagefroms3" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.success|true|
#      |$.reason|Data could not be deleted.|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.success|boolean|
#      |$.reason|string|

#  @Positive @Functional
#  Scenario: TC_20 Validate delete single image from S3 response completeness
#    And I send the GET request to "users_deletesingleimagefroms3" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.success|true|
#      |$.reason|Data could not be deleted.|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.success|boolean|
#      |$.reason|string|
#    And validating the response contains the following values
#      |Value|
#      |success|
#      |reason|
#      |Data could not be deleted.|
#    And I store the response as "delete_single_image_s3_response" name using full path

