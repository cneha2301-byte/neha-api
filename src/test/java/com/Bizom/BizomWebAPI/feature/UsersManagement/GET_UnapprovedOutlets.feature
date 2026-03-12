@BizomWebAPI @CE @UsersManagement @Get_UnapprovedOutlets @SystemIntegration
Feature: Get Unapproved Outlets API Testing
  As a system user
  I want to test the getunapprovedoutlets endpoint
  So that I can ensure proper functionality and data retrieval for unapproved outlets

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
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
      |cookie|toolbarDisplay=hide; language=en; CAKEPHP=esou8jdtagil7rtldatmc8pdiu; PHPSESSID=esou8jdtagil7rtldatmc8pdiu; XSRF-TOKEN=eyJpdiI6Ii9EMGcvSXJYS3BTUm9kdTdVMm9DNXc9PSIsInZhbHVlIjoiRndlRFAxamwrMWxQZ0toNWJ0QmNpZFptYmYxdHg5NmV4SzRjaTlyR3NBejhtUHFQa2dTVmhVdjZ1dXQzOStYTGd6c3dyWU85dHFPVWU4RVRWb2twd1ZvMDNicFEvLzBvSW12OVZHckhSYmFYRE1OdVRsSWxndVI3VVdZRWNxVFYiLCJtYWMiOiIxMGY0MDNlZTQwNmRmMGZkYjMzODMzNmYzYTA5ZGVkNjVlNTRhNGVlYTJjMDgzNWNhMzMwNjA1ZmNiY2NlMDE3IiwidGFnIjoiIn0%3D|

  @Positive @Smoke
  Scenario: TC_01 Get unapproved outlets with valid access token
    And I send the GET request to "getunapprovedoutlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Outlets|[]|
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_02 Get unapproved outlets with invalid resource URI
    When I send the GET request to "getunapprovedoutlets_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"

  @Negative @Security
  Scenario: TC_03 Get unapproved outlets with invalid access token
    And I send the GET request to "getunapprovedoutlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get unapproved outlets with expired access token
    And I send the GET request to "getunapprovedoutlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_05 Get unapproved outlets with malformed access token
    And I send the GET request to "getunapprovedoutlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_06 Get unapproved outlets without access token
    When I send the GET request to "getunapprovedoutlets" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: TC_07 Performance test for getunapprovedoutlets endpoint
    And I send the GET request to "getunapprovedoutlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Outlets|[]|

  @Positive @DataValidation
  Scenario: TC_08 Validate unapproved outlets response structure
    And I send the GET request to "getunapprovedoutlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Outlets|array|

  @Negative @EdgeCase
  Scenario: TC_09 Get unapproved outlets with special characters in access token
    And I send the GET request to "getunapprovedoutlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|!@#$%^&*()_+|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

 


