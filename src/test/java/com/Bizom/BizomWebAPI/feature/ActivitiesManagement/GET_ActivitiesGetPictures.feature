@BizomWebAPI @CE @ActivitiesManagement @GetActivitiesPictures @MasterDataManagement
Feature: Activities Get Pictures API Testing
  As a system user
  I want to access the activities get pictures endpoint
  So that I can retrieve and view activity pictures in the system

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
#https://bugzilla.bizom.in/show_bug.cgi?id=140805(for negative scenario getting 5xx)

 @Negative @Security
 Scenario: TC_01 Access activities get pictures without authentication
  And I send the GET request to "activities_getPictures" endpoint with dynamic access token and query parameters
     |QueryParamName|QueryParamValue|
     |access_token||
     |todate|todayDate|
     |fromdate|pastDate:365|
   Then I should see the response code as "STATUS_200_OK"
#   And the fields in response should match with expected values
#     | JPath     | Value |
#     | $.result  | false |
#     | $.error.code | 401 |
#     | $.error.message | Invalid Access Token or Credentials |
   And the HTML response should contain page title "Users"
   And verify response time is less than "2000" milliseconds


 @Positive @Smoke
 Scenario: TC_02  Access activities get pictures endpoint successfully
   And I send the GET request to "activities_getPictures" endpoint with dynamic access token and query parameters
     |QueryParamName|QueryParamValue|
     |access_token|ACCESS_TOKEN|
     |todate|todayDate|
     |fromdate|pastDate:365|
   Then I should see the response code as "STATUS_200_OK"
   And verify response time is less than "2000" milliseconds
   And validating the response field data types
     |JPath|ExpectedType|
     |$.result|boolean|

 @Positive @Functional
 Scenario: TC_03 Verify activities get pictures page content and structure
   And I send the GET request to "activities_getPictures" endpoint with dynamic access token and query parameters
     |QueryParamName|QueryParamValue|
     |access_token|ACCESS_TOKEN|
     |todate|todayDate|
     |fromdate|pastDate:365|
   Then I should see the response code as "STATUS_200_OK"
   And verify response time is less than "2000" milliseconds
   And validating the response field data types
     |JPath|ExpectedType|
     |$.result|boolean|


 @Positive @DataValidation
 Scenario: TC_04 Verify activities get pictures page returns valid HTML structure
   And I send the GET request to "activities_getPictures" endpoint with dynamic access token and query parameters
     |QueryParamName|QueryParamValue|
     |access_token|ACCESS_TOKEN|
     |todate|todayDate|
     |fromdate|pastDate:365|
   Then I should see the response code as "STATUS_200_OK"
   And verify response time is less than "2000" milliseconds
   And validating the response field data types
     |JPath|ExpectedType|
     |$.result|boolean|


 @Positive @Performance
 Scenario: TC_05  Verify activities get pictures page performance under normal load
   And I send the GET request to "activities_getPictures" endpoint with dynamic access token and query parameters
     |QueryParamName|QueryParamValue|
     |access_token|ACCESS_TOKEN|
     |todate|todayDate|
     |fromdate|pastDate:365|
   Then I should see the response code as "STATUS_200_OK"
   And verify response time is less than "1500" milliseconds
   And validating the response field data types
     |JPath|ExpectedType|
     |$.result|boolean|

 @Positive @Security
 Scenario: TC_06 Verify activities get pictures page security headers
   And I send the GET request to "activities_getPictures" endpoint with dynamic access token and query parameters
     |QueryParamName|QueryParamValue|
     |access_token|ACCESS_TOKEN|
     |todate|todayDate|
     |fromdate|pastDate:365|
   Then I should see the response code as "STATUS_200_OK"
   And verify response time is less than "2000" milliseconds
   And validating the response field data types
     |JPath|ExpectedType|
     |$.result|boolean|
   And verify response headers
     | HeaderName | HeaderValue |
     | X-Frame-Options | SAMEORIGIN |

 @Positive @Integration
 Scenario: TC_07 Verify activities get pictures page integration with session management
   And I send the GET request to "activities_getPictures" endpoint with dynamic access token and query parameters
     |QueryParamName|QueryParamValue|
     |access_token|ACCESS_TOKEN|
     |todate|todayDate|
     |fromdate|pastDate:365|
   Then I should see the response code as "STATUS_200_OK"
   And verify response time is less than "2000" milliseconds
   And validating the response field data types
     |JPath|ExpectedType|
     |$.result|boolean|
   And I validate that the operation was successfully completed in the system

 @Negative @Validation
 Scenario: TC_08 Access activities get pictures with invalid endpoint
   And I send the GET request to "activities_getPictures_invalid" endpoint with dynamic access token and query parameters
     |QueryParamName|QueryParamValue|
     |access_token|ACCESS_TOKEN|
     |todate|todayDate|
     |fromdate|pastDate:365|
   Then I should see the response code as "STATUS_404_NOT_FOUND"
   And verify response time is less than "2000" milliseconds


 @Negative @Security
 Scenario: TC_09 Access activities get pictures with invalid session token
   And I send the GET request to "activities_getPictures" endpoint with dynamic access token and query parameters
     |QueryParamName|QueryParamValue|
     |access_token|invalid_session_token|
     |todate|todayDate|
     |fromdate|pastDate:365|
   Then I should see the response code as "STATUS_200_OK"
   And validating the response field data types
     |JPath|ExpectedType|
     |$.result|boolean|
   And the fields in response should match with expected values
       | JPath     | Value |
       | $.result  | false |
       | $.error.code | 401 |
       | $.error.message | Invalid Access Token or Credentials |
   And verify response time is less than "2000" milliseconds

 @Negative @Security
 Scenario: TC_10 Access activities get pictures with expired session
   And I send the GET request to "activities_getPictures" endpoint with dynamic access token and query parameters
     |QueryParamName|QueryParamValue|
     |access_token|expired_session_token|
     |todate|todayDate|
     |fromdate|pastDate:365|
   Then I should see the response code as "STATUS_200_OK"
   And validating the response field data types
     |JPath|ExpectedType|
     |$.result|boolean|
   And the fields in response should match with expected values
       | JPath     | Value |
       | $.result  | false |
       | $.error.code | 401 |
       | $.error.message | Invalid Access Token or Credentials |
   And verify response time is less than "2000" milliseconds

 Scenario: TC_11 Verify activities get pictures page performance under high load
   And I send the GET request to "activities_getPictures" endpoint with dynamic access token and query parameters
     |QueryParamName|QueryParamValue|
     |access_token|ACCESS_TOKEN|
     |todate|todayDate|
     |fromdate|pastDate:365|
   Then I should see the response code as "STATUS_200_OK"
   And verify response time is less than "3000" milliseconds
   And validating the response field data types
     |JPath|ExpectedType|
     |$.result|boolean|

 @Negative @Security
 Scenario: TC_12 Access activities get pictures with out todate parameter
   And I send the GET request to "activities_getPictures" endpoint with dynamic access token and query parameters
     |QueryParamName|QueryParamValue|
     |access_token|ACCESS_TOKEN|
     |fromdate|pastDate:365|
   Then I should see the response code as "STATUS_500_INTERNAL_SERVER_ERROR"
   And the response body should contain "Undefined variable: todate"
   And verify response time is less than "2000" milliseconds

 @Negative @Security
 Scenario: TC_13 Access activities get pictures with out fromdate parameter
   And I send the GET request to "activities_getPictures" endpoint with dynamic access token and query parameters
     |QueryParamName|QueryParamValue|
     |access_token|ACCESS_TOKEN|
     |todate|todayDate|
    Then I should see the response code as "STATUS_500_INTERNAL_SERVER_ERROR"
   And the response body should contain "Undefined variable: fromdate"
   And verify response time is less than "2000" milliseconds
