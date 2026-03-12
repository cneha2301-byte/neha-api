@BizomWebAPI @MenusManagement @GetMenus @WorkflowAutomation @CE
Feature: Get Menus API Testing
  As a system user
  I want to test the get menus endpoint
  So that I can ensure proper functionality and data retrieval for menus

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |accept-language|en-US,en;q=0.9|
      |cache-control|max-age=0|
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
    And I set cookies
      |cookieName|cookieValue|
      |toolbarDisplay|hide|
      |language|en|
      |CAKEPHP|c3lm5g4vu08sg2430pqv41ot7h|
      |PHPSESSID|c3lm5g4vu08sg2430pqv41ot7h|
      |XSRF-TOKEN|eyJpdiI6InBISFBOd3ZHdE9wY0lkU2x3QkFRTUE9PSIsInZhbHVlIjoieENRZUdlaC9Wb1dqakJROVV4QVFnSkFaOTRNc3U4TmtrWWhCODBpRUxJMW1vM0RVTzZBeFZLZVJxQjd5azE5a3JuS3d1S1QzTThCMkhKN0NhMTE4OUlCZFhWbEpvZTFrZmkyYm42T2hsTW5xa3RienFUQm1QVTd0Qk5RRldGVTQiLCJtYWMiOiIzNGM4MjNiMjUwMTY3YTJiYTQ4MTk4YmUyMmJmNDRiYTcyY2EyYzYxZWUzNjJiYjY1MjI0NjU4MGM0Yjk0Yzk0IiwidGFnIjoiIn0%3D|

  @Negative @Security
  Scenario: TC_01 Get menus without access token
    When I send the GET request to "menus_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token||
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get menus with invalid access token
    And I send the GET request to "menus_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get menus with expired access token
    And I send the GET request to "menus_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get menus with malformed access token
    And I send the GET request to "menus_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Positive @Smoke
#  Scenario: TC_05 Get menus with valid cookies
#    And I send the GET request to "menus_get" endpoint
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Data|object|
#      |$.Data['1']|object|
#      |$.Data['1'].id|string|
#      |$.Data['1'].menu|string|
#      |$.Data['1'].parent_id|string|
#      |$.Data['1'].firstchild_id|string|
#      |$.Data['1'].nextmenu_id|string|
#      |$.Data['1'].url|string|
#      |$.Data['1'].in_display|string|
#      |$.Data['1'].newwindow|boolean|
#    And I store the response as "menus_get_response" name using full path
#
#  @Positive @DataValidation
#  Scenario: TC_06 Validate get menus response structure
#    And I send the GET request to "menus_get" endpoint
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Data|object|
#      |$.Data['1']|object|
#      |$.Data['1'].id|string|
#      |$.Data['1'].menu|string|
#      |$.Data['1'].parent_id|string|
#      |$.Data['1'].firstchild_id|string|
#      |$.Data['1'].nextmenu_id|string|
#      |$.Data['1'].url|string|
#      |$.Data['1'].in_display|string|
#      |$.Data['1'].newwindow|boolean|
#
#  @Positive @DataValidation
#  Scenario: TC_07 Validate get menus nested Data object structure
#    And I send the GET request to "menus_get" endpoint
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Data|object|
#      |$.Data['1']|object|
#      |$.Data['1'].id|string|
#      |$.Data['1'].menu|string|
#      |$.Data['1'].parent_id|string|
#      |$.Data['1'].firstchild_id|string|
#      |$.Data['1'].nextmenu_id|string|
#      |$.Data['1'].url|string|
#      |$.Data['1'].in_display|string|
#      |$.Data['1'].customparameters|null|
#      |$.Data['1'].newwindow|boolean|
#      |$.Data['1'].product|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#
#      |$.Data['1'].id|"1"|
#      |$.Data['1'].menu|Dashboard|
#      |$.Data['1'].parent_id|"0"|
#      |$.Data['1'].firstchild_id|"26"|
#      |$.Data['1'].nextmenu_id|"2"|
#      |$.Data['1'].url|/users/dashboard|
#      |$.Data['1'].in_display|"1"|
#      |$.Data['1'].newwindow|false|
#
#  @Positive @DataValidation
#  Scenario: TC_08 Validate get menus with static values
#    And I send the GET request to "menus_get" endpoint
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Data['1'].id|"1"|
#      |$.Data['1'].menu|Dashboard|
#      |$.Data['1'].parent_id|"0"|
#      |$.Data['1'].firstchild_id|"26"|
#      |$.Data['1'].nextmenu_id|"2"|
#      |$.Data['1'].url|/users/dashboard|
#      |$.Data['1'].in_display|"1"|
#      |$.Data['1'].newwindow|false|
#      |$.Data['2'].id|"2"|
#      |$.Data['2'].menu|Inventory|
#      |$.Data['2'].parent_id|"0"|
#      |$.Data['2'].firstchild_id|"33"|
#      |$.Data['2'].nextmenu_id|"3"|
#      |$.Data['2'].url|/inventories/index|
#      |$.Data['2'].in_display|"1"|
#      |$.Data['2'].newwindow|false|
#      |$.Data['3'].id|"3"|
#      |$.Data['3'].menu|Products|
#      |$.Data['3'].parent_id|"0"|
#      |$.Data['3'].firstchild_id|"46"|
#      |$.Data['3'].nextmenu_id|"4"|
#      |$.Data['3'].url|/skunits/ajaxskuindex|
#      |$.Data['3'].in_display|"1"|
#      |$.Data['3'].newwindow|false|
#
#  @Positive @Performance
#  Scenario: TC_09 Performance test for get menus endpoint
#    And I send the GET request to "menus_get" endpoint
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#
#
#  @Positive @Concurrency
#  Scenario: TC_10 Concurrent access test for get menus endpoint
#    And I send the GET request to "menus_get" endpoint
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Data|object|
#      |$.Data['1']|object|
#      |$.Data['1'].id|string|
#      |$.Data['1'].menu|string|
#      |$.Data['1'].newwindow|boolean|
#
#  @Negative @Validation
#  Scenario: TC_11 Get menus with invalid query parameters
#    And I send the GET request to "menus_get" endpoint with query parameters
#      |QueryParamName|QueryParamValue|
#      |invalid_param|invalid_value|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#
#
#  @Negative @Validation
#  Scenario: TC_12 Get menus with special characters in query parameters
#    And I send the GET request to "menus_get" endpoint with query parameters
#      |QueryParamName|QueryParamValue|
#      |test_param|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#
#
#  @Negative @Security
#  Scenario: TC_13 Get menus with SQL injection attempt
#    And I send the GET request to "menus_get" endpoint with query parameters
#      |QueryParamName|QueryParamValue|
#      |test_param|'; DROP TABLE menus; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#
#
#  @Negative @Boundary
#  Scenario: TC_14 Get menus with maximum query parameters
#    And I send the GET request to "menus_get" endpoint with query parameters
#      |QueryParamName|QueryParamValue|
#      |param1|value1|
#      |param2|value2|
#      |param3|value3|
#      |param4|value4|
#      |param5|value5|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#
#
#  @Negative @ErrorHandling
#  Scenario: TC_15 Get menus with invalid endpoint
#    And I send the GET request to "menus_get_invalid" endpoint
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|
#
#  @Positive @BusinessLogic
#  Scenario: TC_16 Validate get menus business logic
#    And I send the GET request to "menus_get" endpoint
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#
#
#  @Positive @DataIntegrity
#  Scenario: TC_17 Validate get menus data integrity
#    And I send the GET request to "menus_get" endpoint
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Data|object|
#      |$.Data['1']|object|
#      |$.Data['1'].id|string|
#      |$.Data['1'].menu|string|
#      |$.Data['1'].parent_id|string|
#      |$.Data['1'].firstchild_id|string|
#      |$.Data['1'].nextmenu_id|string|
#      |$.Data['1'].url|string|
#      |$.Data['1'].in_display|string|
#      |$.Data['1'].newwindow|boolean|
#    And validating the response contains the following values
#      |Value|
#      |Result|
#      |Reason|
#      |Data|
#      |id|
#      |menu|
#      |parent_id|
#      |firstchild_id|
#      |nextmenu_id|
#      |url|
#      |in_display|
#      |newwindow|
#      |Dashboard|
#      |Inventory|
#      |Products|
#      |Reports|
#
#  @Positive @Regression
#  Scenario: TC_18 Regression test for get menus endpoint
#    And I send the GET request to "menus_get" endpoint
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Data|object|
#      |$.Data['1']|object|
#      |$.Data['1'].id|string|
#      |$.Data['1'].menu|string|
#      |$.Data['1'].newwindow|boolean|
#
#  @Positive @Functional
#  Scenario: TC_19 Validate get menus response completeness
#    And I send the GET request to "menus_get" endpoint
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Data|object|
#      |$.Data['1']|object|
#      |$.Data['1'].id|string|
#      |$.Data['1'].menu|string|
#      |$.Data['1'].parent_id|string|
#      |$.Data['1'].firstchild_id|string|
#      |$.Data['1'].nextmenu_id|string|
#      |$.Data['1'].url|string|
#      |$.Data['1'].in_display|string|
#      |$.Data['1'].customparameters|null|
#      |$.Data['1'].newwindow|boolean|
#      |$.Data['1'].product|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Data['1'].id|"1"|
#      |$.Data['1'].menu|Dashboard|
#      |$.Data['1'].parent_id|"0"|
#      |$.Data['1'].firstchild_id|"26"|
#      |$.Data['1'].nextmenu_id|"2"|
#      |$.Data['1'].url|/users/dashboard|
#      |$.Data['1'].in_display|"1"|
#      |$.Data['1'].newwindow|false|
#
#  @Positive @ContentValidation
#  Scenario: TC_20 Validate get menus content structure
#    And I send the GET request to "menus_get" endpoint
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#
#    And validating the response contains the following values
#      |Value|
#      |Result|
#      |Reason|
#      |Data|
#      |id|
#      |menu|
#      |parent_id|
#      |firstchild_id|
#      |nextmenu_id|
#      |url|
#      |in_display|
#      |newwindow|
#      |Dashboard|
#      |Inventory|
#      |Products|
#      |Reports|
#      |Discounts|
#      |Users|
#
#  @Positive @LoadTesting
#  Scenario: TC_21 Load testing for get menus endpoint
#    And I send the GET request to "menus_get" endpoint
#    Then I should see the response code as "200"
#    And verify response time is less than "3000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#
#
#  @Negative @Timeout
#  Scenario: TC_22 Test get menus endpoint timeout handling
#    And I send the GET request to "menus_get" endpoint
#    Then I should see the response code as "200"
#    And verify response time is less than "5000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#
#
#  @Positive @EndToEnd
#  Scenario: TC_23 End-to-end get menus data retrieval workflow
#    And I send the GET request to "menus_get" endpoint
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Data['1'].id|"1"|
#      |$.Data['1'].menu|Dashboard|
#      |$.Data['1'].parent_id|"0"|
#      |$.Data['1'].firstchild_id|"26"|
#      |$.Data['1'].nextmenu_id|"2"|
#      |$.Data['1'].url|/users/dashboard|
#      |$.Data['1'].in_display|"1"|
#      |$.Data['1'].newwindow|false|
#      |$.Data['2'].id|"2"|
#      |$.Data['2'].menu|Inventory|
#      |$.Data['2'].parent_id|"0"|
#      |$.Data['2'].firstchild_id|"33"|
#      |$.Data['2'].nextmenu_id|"3"|
#      |$.Data['2'].url|/inventories/index|
#      |$.Data['2'].in_display|"1"|
#      |$.Data['2'].newwindow|false|
#      |$.Data['3'].id|"3"|
#      |$.Data['3'].menu|Products|
#      |$.Data['3'].parent_id|"0"|
#      |$.Data['3'].firstchild_id|"46"|
#      |$.Data['3'].nextmenu_id|"4"|
#      |$.Data['3'].url|/skunits/ajaxskuindex|
#      |$.Data['3'].in_display|"1"|
#      |$.Data['3'].newwindow|false|
#    And I store the response as "menus_get_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Data|object|
#      |$.Data['1']|object|
#      |$.Data['1'].id|string|
#      |$.Data['1'].menu|string|
#      |$.Data['1'].parent_id|string|
#      |$.Data['1'].firstchild_id|string|
#      |$.Data['1'].nextmenu_id|string|
#      |$.Data['1'].url|string|
#      |$.Data['1'].in_display|string|
#      |$.Data['1'].customparameters|null|
#      |$.Data['1'].newwindow|boolean|
#      |$.Data['1'].product|string|
#    And validating the response contains the following values
#      |Value|
#      |Result|
#      |Reason|
#      |Data|
#      |id|
#      |menu|
#      |parent_id|
#      |firstchild_id|
#      |nextmenu_id|
#      |url|
#      |in_display|
#      |newwindow|
#      |Dashboard|
#      |Inventory|
#      |Products|
#      |Reports|
#      |Discounts|
#      |Users|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Data['1'].id|"1"|
#      |$.Data['1'].menu|Dashboard|
#      |$.Data['1'].parent_id|"0"|
#      |$.Data['1'].firstchild_id|"26"|
#      |$.Data['1'].nextmenu_id|"2"|
#      |$.Data['1'].in_display|"1"|
#      |$.Data['1'].newwindow|false|

