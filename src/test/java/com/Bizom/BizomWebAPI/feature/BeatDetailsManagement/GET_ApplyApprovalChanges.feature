@BizomWebAPI @CE @BeatDetailsManagement @ApplyApprovalChanges @CoreBusinessOperations
Feature: Apply Approval Changes API Testing
  As a Bizom web API consumer
  I want to validate the apply approval changes endpoint
  So that I can ensure beat change approvals behave correctly

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |accept-language|en-US,en;q=0.9|
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
  Scenario: TC_01 Apply approval changes without access token
    When I send the GET request to "beatdetails_apply_approval_changes" endpoint with path parameters
      |Path|Value|
      |beatId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Apply approval changes with invalid access token
    And I send the GET request to "beatdetails_apply_approval_changes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|beatId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Apply approval changes with expired access token
    And I send the GET request to "beatdetails_apply_approval_changes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|beatId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Apply approval changes with malformed access token
    And I send the GET request to "beatdetails_apply_approval_changes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|beatId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Positive @Smoke
#  Scenario: TC_05 Apply approval changes with valid session cookies
#    When I set cookies
#      |cookieName|cookieValue|
#      |toolbarDisplay|hide|
#      |language|en|
#      |PHPSESSID|727ab0rajjac0lpvj0evrsla8b|
#      |CAKEPHP|83u4gh3j2thnfmhk3qdcrmmct9|
#    And I send the GET request to "beatdetails_apply_approval_changes" endpoint with path parameters
#      |Path|Value|
#      |beatId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|unable to make the changes|
#    And I store the response as "applyApprovalChanges_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate apply approval changes response structure
     And I set cookies
      |cookieName|cookieValue|
      |toolbarDisplay|hide|
      |language|en|
      |PHPSESSID|727ab0rajjac0lpvj0evrsla8b|
      |CAKEPHP|83u4gh3j2thnfmhk3qdcrmmct9| 
    And I send the GET request to "beatdetails_apply_approval_changes" endpoint with path parameters
      |Path|Value|
      |beatId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @Performance
  Scenario: TC_07 Performance test for apply approval changes endpoint
    When I set cookies
      |cookieName|cookieValue|
      |toolbarDisplay|hide|
      |language|en|
      |PHPSESSID|727ab0rajjac0lpvj0evrsla8b|
      |CAKEPHP|83u4gh3j2thnfmhk3qdcrmmct9|    
    And I send the GET request to "beatdetails_apply_approval_changes" endpoint with path parameters
      |Path|Value|
      |beatId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: TC_08 Concurrent access test for apply approval changes endpoint
    When I set cookies
      |cookieName|cookieValue|
      |toolbarDisplay|hide|
      |language|en|
      |PHPSESSID|727ab0rajjac0lpvj0evrsla8b|
      |CAKEPHP|83u4gh3j2thnfmhk3qdcrmmct9|    
    And I send the GET request to "beatdetails_apply_approval_changes" endpoint with path parameters
      |Path|Value|
      |beatId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_09 Apply approval changes with invalid path parameter
    When I set cookies
      |cookieName|cookieValue|
      |toolbarDisplay|hide|
      |language|en|
      |PHPSESSID|727ab0rajjac0lpvj0evrsla8b|
      |CAKEPHP|83u4gh3j2thnfmhk3qdcrmmct9|    
    And I send the GET request to "beatdetails_apply_approval_changes" endpoint with path parameters
      |Path|Value|
      |beatId|invalid_beat_id|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_10 Apply approval changes with special characters in path parameter
    When I set cookies
      |cookieName|cookieValue|
      |toolbarDisplay|hide|
      |language|en|
      |PHPSESSID|727ab0rajjac0lpvj0evrsla8b|
      |CAKEPHP|83u4gh3j2thnfmhk3qdcrmmct9|    
    And I send the GET request to "beatdetails_apply_approval_changes" endpoint with path parameters
      |Path|Value|
      |beatId|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_11 Apply approval changes with SQL injection attempt in path parameter
    When I set cookies
      |cookieName|cookieValue|
      |toolbarDisplay|hide|
      |language|en|
      |PHPSESSID|727ab0rajjac0lpvj0evrsla8b|
      |CAKEPHP|83u4gh3j2thnfmhk3qdcrmmct9|    
    And I send the GET request to "beatdetails_apply_approval_changes" endpoint with path parameters
      |Path|Value|
      |beatId|'; DROP TABLE beatdetails; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: TC_12 Apply approval changes with non-existent beatId
    When I set cookies
      |cookieName|cookieValue|
      |toolbarDisplay|hide|
      |language|en|
      |PHPSESSID|727ab0rajjac0lpvj0evrsla8b|
      |CAKEPHP|83u4gh3j2thnfmhk3qdcrmmct9|    
    And I send the GET request to "beatdetails_apply_approval_changes" endpoint with path parameters
      |Path|Value|
      |beatId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_13 Apply approval changes with invalid endpoint
    When I set cookies
      |cookieName|cookieValue|
      |toolbarDisplay|hide|
      |language|en|
      |PHPSESSID|727ab0rajjac0lpvj0evrsla8b|
      |CAKEPHP|83u4gh3j2thnfmhk3qdcrmmct9|    
    And I send the GET request to "beatdetails_apply_approval_changes_invalid" endpoint with path parameters
      |Path|Value|
      |beatId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Positive @Regression
#  Scenario: TC_14 Regression test for apply approval changes endpoint
#    When I set cookies
#      |cookieName|cookieValue|
#      |toolbarDisplay|hide|
#      |language|en|
#      |PHPSESSID|727ab0rajjac0lpvj0evrsla8b|
#      |CAKEPHP|83u4gh3j2thnfmhk3qdcrmmct9|
#    And I send the GET request to "beatdetails_apply_approval_changes" endpoint with path parameters
#      |Path|Value|
#      |beatId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Reason|unable to make the changes|

  @Positive @LoadTesting
  Scenario: TC_15 Load testing for apply approval changes endpoint
    When I set cookies
      |cookieName|cookieValue|
      |toolbarDisplay|hide|
      |language|en|
      |PHPSESSID|727ab0rajjac0lpvj0evrsla8b|
      |CAKEPHP|83u4gh3j2thnfmhk3qdcrmmct9|    
    And I send the GET request to "beatdetails_apply_approval_changes" endpoint with path parameters
      |Path|Value|
      |beatId|1|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Negative @Timeout
  Scenario: TC_16 Timeout handling for apply approval changes endpoint
    When I set cookies
      |cookieName|cookieValue|
      |toolbarDisplay|hide|
      |language|en|
      |PHPSESSID|727ab0rajjac0lpvj0evrsla8b|
      |CAKEPHP|83u4gh3j2thnfmhk3qdcrmmct9|    
    And I send the GET request to "beatdetails_apply_approval_changes" endpoint with path parameters
      |Path|Value|
      |beatId|1|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds

#  @Positive @EndToEnd
#  Scenario: TC_17 End-to-end apply approval changes workflow
#    When I set cookies
#      |cookieName|cookieValue|
#      |toolbarDisplay|hide|
#      |language|en|
#      |PHPSESSID|727ab0rajjac0lpvj0evrsla8b|
#      |CAKEPHP|83u4gh3j2thnfmhk3qdcrmmct9|
#    And I send the GET request to "beatdetails_apply_approval_changes" endpoint with path parameters
#      |Path|Value|
#      |beatId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#    And I store the response as "applyApprovalChanges_response" name using full path

