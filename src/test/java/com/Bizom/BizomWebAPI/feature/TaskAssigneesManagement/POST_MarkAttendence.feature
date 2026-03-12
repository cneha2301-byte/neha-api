@BizomWebAPI @TaskAssigneesManagement @MarkAttendence @SystemIntegration @Innovation
Feature: Mark Attendence API Testing
  As a system user
  I want to test the markAttendence endpoint
  So that I can ensure proper marking of attendance for task assignees

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |accept-language|en-US,en;q=0.9|
      |priority|u=0, i|
      |sec-ch-ua|"Google Chrome";v="143", "Chromium";v="143", "Not A(Brand";v="24"|
      |sec-ch-ua-mobile|?0|
      |sec-ch-ua-platform|"Windows"|
      |sec-fetch-dest|document|
      |sec-fetch-mode|navigate|
      |sec-fetch-site|none|
      |sec-fetch-user|?1|
      |upgrade-insecure-requests|1|
      |user-agent|Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36|

  @Negative @Security
  Scenario: TC_01 Mark attendance without access token
    And I post the request with "POST_markAttendence" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token||
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Mark attendance with invalid access token
    And I post the request with "POST_markAttendence" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|"Invalid Access Token or Credentials"|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Mark attendance with expired access token
    And I post the request with "POST_markAttendence" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|"Invalid Access Token or Credentials"|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Mark attendance with malformed access token
    And I post the request with "POST_markAttendence" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|"Invalid Access Token or Credentials"|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Mark attendance with valid request
    And I post the request with "POST_markAttendence" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Attendence marked."|
    And I store the response as "markattendence_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate mark attendance response structure
    And I post the request with "POST_markAttendence" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Attendence marked."|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.success|array|
      |$.error|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate mark attendance success array
    And I post the request with "POST_markAttendence" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Attendence marked."|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.success|array|
    And validating the response contains the following values
      |Value|
      |Result|
      |success|
      |error|

  @Positive @DataValidation
  Scenario: TC_08 Validate mark attendance with DB data
    And I post the request with "POST_markAttendence" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|true|

  @Positive @Performance
  Scenario: TC_09 Performance test for mark attendance endpoint
    And I post the request with "POST_markAttendence" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Attendence marked."|

  @Negative @Validation
  Scenario: TC_10 Mark attendance with invalid taskassignee ID
    And I modify fields with random values and remove fields in "POST_markAttendence" payload
      |JPath|Value|
      |$.Taskassignee[0].id|abc|
    And I post the request with "POST_markAttendence" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_11 Mark attendance with empty body
    And I send empty body with "POST_markAttendence" request
    And I post the request with "POST_markAttendence" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_12 Mark attendance with empty Taskassignee array
    And I modify fields with random values and remove fields in "POST_markAttendence" payload
      |JPath|Value|
      |$.Taskassignee|[]|
    And I post the request with "POST_markAttendence" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_13 Mark attendance with non-existent taskassignee ID
    And I modify fields with random values and remove fields in "POST_markAttendence" payload
      |JPath|Value|
      |$.Taskassignee[0].id|999999|
    And I post the request with "POST_markAttendence" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_14 Mark attendance with invalid status_id
    And I modify fields with random values and remove fields in "POST_markAttendence" payload
      |JPath|Value|
      |$.Taskassignee[0].status_id|abc|
    And I post the request with "POST_markAttendence" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_15 Mark attendance with invalid taskdetail_id
    And I modify fields with random values and remove fields in "POST_markAttendence" payload
      |JPath|Value|
      |$.Taskassignee[0].taskdetail_id|xyz|
    And I post the request with "POST_markAttendence" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_16 Mark attendance with missing id field
    And I modify fields with random values and remove fields in "POST_markAttendence" payload
      |JPath|Value|
      |$.Taskassignee[0].id|""|
    And I post the request with "POST_markAttendence" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_17 Mark attendance with missing status_id field
    And I modify fields with random values and remove fields in "POST_markAttendence" payload
      |JPath|Value|
      |$.Taskassignee[0].status_id|""|
    And I post the request with "POST_markAttendence" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_18 Mark attendance with missing taskdetail_id field
    And I modify fields with random values and remove fields in "POST_markAttendence" payload
      |JPath|Value|
      |$.Taskassignee[0].taskdetail_id|""|
    And I post the request with "POST_markAttendence" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Please try again."|
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_19 Mark attendance with zero id
    And I modify fields with random values and remove fields in "POST_markAttendence" payload
      |JPath|Value|
      |$.Taskassignee[0].id|0|
    And I post the request with "POST_markAttendence" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_20 Mark attendance with negative id
    And I modify fields with random values and remove fields in "POST_markAttendence" payload
      |JPath|Value|
      |$.Taskassignee[0].id|-1|
    And I post the request with "POST_markAttendence" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Negative @ErrorHandling
#  Scenario: TC_21 Mark attendance with invalid endpoint
#    And I post the request with "POST_markAttendence_invalid" payload with dynamic access token and query parameters
#      |Query|Value|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds

  @Positive @DataValidation
  Scenario: TC_22 Validate mark attendance response contains mandatory keys
    And I post the request with "POST_markAttendence" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Attendence marked."|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |success|
      |error|

  @Positive @BusinessLogic
  Scenario: TC_23 Validate mark attendance success array content
    And I post the request with "POST_markAttendence" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Attendence marked."|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.success|array|
      |$.error|array|

  @Positive @Regression
  Scenario: TC_24 Regression test for mark attendance endpoint
    And I post the request with "POST_markAttendence" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Attendence marked."|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.success|array|
      |$.error|array|

  @Positive @Concurrency
  Scenario: TC_25 Concurrent access test for mark attendance endpoint
    And I post the request with "POST_markAttendence" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Attendence marked."|

  @Positive @LoadTesting
  Scenario: TC_26 Load testing for mark attendance endpoint
    And I post the request with "POST_markAttendence" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Attendence marked."|

  @Negative @Timeout
  Scenario: TC_27 Test mark attendance endpoint timeout handling
    And I post the request with "POST_markAttendence" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Attendence marked."|

  @Positive @EndToEnd
  Scenario: TC_28 End-to-end mark attendance workflow
    And I post the request with "POST_markAttendence" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Attendence marked."|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.success|array|
      |$.error|array|
    And I store the response as "markattendence_response" name using full path

  @Positive @Boundary
  Scenario: TC_29 Mark attendance with very large taskassignee ID
    And I modify fields with random values and remove fields in "POST_markAttendence" payload
      |JPath|Value|
      |$.Taskassignee[0].id|2147483647|
    And I post the request with "POST_markAttendence" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Boundary
  Scenario: TC_30 Mark attendance with different status_id values
    And I modify fields with random values and remove fields in "POST_markAttendence" payload
      |JPath|Value|
      |$.Taskassignee[0].status_id|1|
    And I post the request with "POST_markAttendence" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Attendence marked."|

