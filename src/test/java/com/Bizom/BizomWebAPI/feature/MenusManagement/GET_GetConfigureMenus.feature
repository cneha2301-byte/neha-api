@BizomWebAPI @MenusManagement @GetConfigureMenus @WorkflowAutomation @CE
Feature: Get Configure Menus API Testing
  As a system user
  I want to test the get configure menus endpoint
  So that I can ensure proper functionality and data retrieval for configured menus

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get configure menus without access token
    When I send the GET request to "menus_get_configure_menus" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get configure menus with invalid access token
    And I send the GET request to "menus_get_configure_menus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get configure menus with expired access token
    And I send the GET request to "menus_get_configure_menus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get configure menus with malformed access token
    And I send the GET request to "menus_get_configure_menus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get configure menus with valid access token
    And I send the GET request to "menus_get_configure_menus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Menus Configure for this user|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.MenuList|array|
      |$.MenuList[0]|object|
      |$.MenuList[0].menu_id|number|
      |$.MenuList[0].menu|string|
      |$.MenuList[0].url|string|
      |$.MenuList[0].newwindow|number|
      |$.MenuList[0].submenu|array|
      |$.MenuList[0].submenu[0]|object|
      |$.MenuList[0].submenu[0].menu_id|number|
      |$.MenuList[0].submenu[0].menu|string|
      |$.MenuList[0].submenu[0].url|string|
      |$.MenuList[0].submenu[0].newwindow|number|
    And I store the response as "menus_get_configure_menus_response" name using full path

  @Positive @DataValidation
  Scenario: Validate get configure menus response structure
    And I send the GET request to "menus_get_configure_menus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Menus Configure for this user|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.MenuList|array|
      |$.MenuList[0]|object|
      |$.MenuList[0].menu_id|number|
      |$.MenuList[0].menu|string|
      |$.MenuList[0].url|string|
      |$.MenuList[0].customparameters|null|
      |$.MenuList[0].icon_url|string|
      |$.MenuList[0].white_image_url|string|
      |$.MenuList[0].newwindow|number|
      |$.MenuList[0].submenu|array|
      |$.MenuList[0].submenu[0]|object|
      |$.MenuList[0].submenu[0].menu_id|number|
      |$.MenuList[0].submenu[0].menu|string|
      |$.MenuList[0].submenu[0].url|string|
      |$.MenuList[0].submenu[0].customparameters|null|
      |$.MenuList[0].submenu[0].newwindow|number|

  @Positive @DataValidation
  Scenario: Validate get configure menus nested MenuList structure
    And I send the GET request to "menus_get_configure_menus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.MenuList|array|
      |$.MenuList[0]|object|
      |$.MenuList[0].menu_id|number|
      |$.MenuList[0].menu|string|
      |$.MenuList[0].url|string|
      |$.MenuList[0].customparameters|null|
      |$.MenuList[0].icon_url|string|
      |$.MenuList[0].white_image_url|string|
      |$.MenuList[0].newwindow|number|
      |$.MenuList[0].submenu|array|
      |$.MenuList[0].submenu[0]|object|
      |$.MenuList[0].submenu[0].menu_id|number|
      |$.MenuList[0].submenu[0].menu|string|
      |$.MenuList[0].submenu[0].url|string|
      |$.MenuList[0].submenu[0].customparameters|null|
      |$.MenuList[0].submenu[0].newwindow|number|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Menus Configure for this user|
      |$.MenuList[0].menu_id|1|
      |$.MenuList[0].menu|Dashboard|
      |$.MenuList[0].url|/users/dashboard|
      |$.MenuList[0].newwindow|0|
      |$.MenuList[0].submenu[0].menu_id|26|
      |$.MenuList[0].submenu[0].menu|Dashboard|
      |$.MenuList[0].submenu[0].url|/users/dashboard|
      |$.MenuList[0].submenu[0].newwindow|0|

  @Positive @DataValidation
  Scenario: Validate get configure menus with static values
    And I send the GET request to "menus_get_configure_menus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Menus Configure for this user|
      |$.MenuList[0].menu_id|1|
      |$.MenuList[0].menu|Dashboard|
      |$.MenuList[0].url|/users/dashboard|
      |$.MenuList[0].newwindow|0|
      |$.MenuList[0].submenu[0].menu_id|26|
      |$.MenuList[0].submenu[0].menu|Dashboard|
      |$.MenuList[0].submenu[0].url|/users/dashboard|
      |$.MenuList[0].submenu[0].newwindow|0|
      |$.MenuList[0].submenu[1].menu_id|27|
      |$.MenuList[0].submenu[1].menu|Users|
      |$.MenuList[0].submenu[1].url|/users/ajaxuserindex|
      |$.MenuList[0].submenu[1].newwindow|0|
      |$.MenuList[0].submenu[2].menu_id|28|
      |$.MenuList[0].submenu[2].menu|Organisation|
      |$.MenuList[0].submenu[2].url|/companies/dashboard|
      |$.MenuList[0].submenu[2].newwindow|0|
      |$.MenuList[0].submenu[3].menu_id|29|
      |$.MenuList[0].submenu[3].menu|Unapproved Outlets|
      |$.MenuList[0].submenu[3].url|/outlets/viewunapprovedoutlets|
      |$.MenuList[0].submenu[3].newwindow|0|
      |$.MenuList[0].submenu[4].menu_id|30|
      |$.MenuList[0].submenu[4].menu|Outlet Density Map|
      |$.MenuList[0].submenu[4].url|/companies/outletDensityonMap|
      |$.MenuList[0].submenu[4].newwindow|0|
      |$.MenuList[0].submenu[5].menu_id|31|
      |$.MenuList[0].submenu[5].menu|Update User Targets|
      |$.MenuList[0].submenu[5].url|/targets/updatetargets|
      |$.MenuList[0].submenu[5].newwindow|0|
      |$.MenuList[0].submenu[6].menu_id|32|
      |$.MenuList[0].submenu[6].menu|Set Outlet Targets|
      |$.MenuList[0].submenu[6].url|/outlettargets/settarget|
      |$.MenuList[0].submenu[6].newwindow|0|

  @Positive @Performance
  Scenario: Performance test for get configure menus endpoint
    And I send the GET request to "menus_get_configure_menus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Menus Configure for this user|

  @Positive @Concurrency
  Scenario: Concurrent access test for get configure menus endpoint
    And I send the GET request to "menus_get_configure_menus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Menus Configure for this user|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.MenuList|array|
      |$.MenuList[0]|object|
      |$.MenuList[0].menu_id|number|
      |$.MenuList[0].menu|string|
      |$.MenuList[0].newwindow|number|
      |$.MenuList[0].submenu|array|
      |$.MenuList[0].submenu[0]|object|
      |$.MenuList[0].submenu[0].menu_id|number|
      |$.MenuList[0].submenu[0].menu|string|
      |$.MenuList[0].submenu[0].newwindow|number|

  @Negative @Validation
  Scenario: Get configure menus with invalid query parameters
    And I send the GET request to "menus_get_configure_menus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Menus Configure for this user|

  @Negative @Validation
  Scenario: Get configure menus with special characters in query parameters
    And I send the GET request to "menus_get_configure_menus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Menus Configure for this user|

  @Negative @Security
  Scenario: Get configure menus with SQL injection attempt
    And I send the GET request to "menus_get_configure_menus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE menus; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Menus Configure for this user|

  @Negative @Boundary
  Scenario: Get configure menus with maximum query parameters
    And I send the GET request to "menus_get_configure_menus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Menus Configure for this user|

#  @Negative @ErrorHandling
#  Scenario: Get configure menus with invalid endpoint
#    And I send the GET request to "menus_get_configure_menus_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

  @Positive @BusinessLogic
  Scenario: Validate get configure menus business logic
    And I send the GET request to "menus_get_configure_menus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Menus Configure for this user|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.MenuList|array|
      |$.MenuList[0]|object|
      |$.MenuList[0].menu_id|number|
      |$.MenuList[0].menu|string|
      |$.MenuList[0].url|string|
      |$.MenuList[0].submenu|array|
      |$.MenuList[0].submenu[0]|object|
      |$.MenuList[0].submenu[0].menu_id|number|
      |$.MenuList[0].submenu[0].menu|string|
      |$.MenuList[0].submenu[0].url|string|

  @Positive @DataIntegrity
  Scenario: Validate get configure menus data integrity
    And I send the GET request to "menus_get_configure_menus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.MenuList|array|
      |$.MenuList[0]|object|
      |$.MenuList[0].menu_id|number|
      |$.MenuList[0].menu|string|
      |$.MenuList[0].url|string|
      |$.MenuList[0].customparameters|null|
      |$.MenuList[0].icon_url|string|
      |$.MenuList[0].white_image_url|string|
      |$.MenuList[0].newwindow|number|
      |$.MenuList[0].submenu|array|
      |$.MenuList[0].submenu[0]|object|
      |$.MenuList[0].submenu[0].menu_id|number|
      |$.MenuList[0].submenu[0].menu|string|
      |$.MenuList[0].submenu[0].url|string|
      |$.MenuList[0].submenu[0].customparameters|null|
      |$.MenuList[0].submenu[0].newwindow|number|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |MenuList|
      |menu_id|
      |menu|
      |url|
      |customparameters|
      |icon_url|
      |white_image_url|
      |newwindow|
      |submenu|
      |Dashboard|
      |Users|
      |Organisation|
      |Unapproved Outlets|
      |Outlet Density Map|
      |Update User Targets|
      |Set Outlet Targets|

  @Positive @Regression
  Scenario: Regression test for get configure menus endpoint
    And I send the GET request to "menus_get_configure_menus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Menus Configure for this user|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.MenuList|array|
      |$.MenuList[0]|object|
      |$.MenuList[0].menu_id|number|
      |$.MenuList[0].menu|string|
      |$.MenuList[0].newwindow|number|
      |$.MenuList[0].submenu|array|
      |$.MenuList[0].submenu[0]|object|
      |$.MenuList[0].submenu[0].menu_id|number|
      |$.MenuList[0].submenu[0].menu|string|
      |$.MenuList[0].submenu[0].newwindow|number|

  @Positive @Functional
  Scenario: Validate get configure menus response completeness
    And I send the GET request to "menus_get_configure_menus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.MenuList|array|
      |$.MenuList[0]|object|
      |$.MenuList[0].menu_id|number|
      |$.MenuList[0].menu|string|
      |$.MenuList[0].url|string|
      |$.MenuList[0].customparameters|null|
      |$.MenuList[0].icon_url|string|
      |$.MenuList[0].white_image_url|string|
      |$.MenuList[0].newwindow|number|
      |$.MenuList[0].submenu|array|
      |$.MenuList[0].submenu[0]|object|
      |$.MenuList[0].submenu[0].menu_id|number|
      |$.MenuList[0].submenu[0].menu|string|
      |$.MenuList[0].submenu[0].url|string|
      |$.MenuList[0].submenu[0].customparameters|null|
      |$.MenuList[0].submenu[0].newwindow|number|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Menus Configure for this user|
      |$.MenuList[0].menu_id|1|
      |$.MenuList[0].menu|Dashboard|
      |$.MenuList[0].url|/users/dashboard|
      |$.MenuList[0].newwindow|0|
      |$.MenuList[0].submenu[0].menu_id|26|
      |$.MenuList[0].submenu[0].menu|Dashboard|
      |$.MenuList[0].submenu[0].url|/users/dashboard|
      |$.MenuList[0].submenu[0].newwindow|0|
      |$.MenuList[0].submenu[1].menu_id|27|
      |$.MenuList[0].submenu[1].menu|Users|
      |$.MenuList[0].submenu[1].url|/users/ajaxuserindex|
      |$.MenuList[0].submenu[1].newwindow|0|
      |$.MenuList[0].submenu[2].menu_id|28|
      |$.MenuList[0].submenu[2].menu|Organisation|
      |$.MenuList[0].submenu[2].url|/companies/dashboard|
      |$.MenuList[0].submenu[2].newwindow|0|
      |$.MenuList[0].submenu[3].menu_id|29|
      |$.MenuList[0].submenu[3].menu|Unapproved Outlets|
      |$.MenuList[0].submenu[3].url|/outlets/viewunapprovedoutlets|
      |$.MenuList[0].submenu[3].newwindow|0|
      |$.MenuList[0].submenu[4].menu_id|30|
      |$.MenuList[0].submenu[4].menu|Outlet Density Map|
      |$.MenuList[0].submenu[4].url|/companies/outletDensityonMap|
      |$.MenuList[0].submenu[4].newwindow|0|
      |$.MenuList[0].submenu[5].menu_id|31|
      |$.MenuList[0].submenu[5].menu|Update User Targets|
      |$.MenuList[0].submenu[5].url|/targets/updatetargets|
      |$.MenuList[0].submenu[5].newwindow|0|
      |$.MenuList[0].submenu[6].menu_id|32|
      |$.MenuList[0].submenu[6].menu|Set Outlet Targets|
      |$.MenuList[0].submenu[6].url|/outlettargets/settarget|
      |$.MenuList[0].submenu[6].newwindow|0|

  @Positive @ArrayValidation
  Scenario: Validate get configure menus array structure and content
    And I send the GET request to "menus_get_configure_menus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Menus Configure for this user|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.MenuList|array|
      |$.MenuList[0]|object|
      |$.MenuList[0].submenu|array|
      |$.MenuList[0].submenu[0]|object|
      |$.MenuList[0].submenu[1]|object|
      |$.MenuList[0].submenu[2]|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.MenuList[0].menu_id|1|
      |$.MenuList[0].menu|Dashboard|
      |$.MenuList[0].url|/users/dashboard|
      |$.MenuList[0].newwindow|0|
      |$.MenuList[0].submenu[0].menu_id|26|
      |$.MenuList[0].submenu[0].menu|Dashboard|
      |$.MenuList[0].submenu[0].url|/users/dashboard|
      |$.MenuList[0].submenu[0].newwindow|0|
      |$.MenuList[0].submenu[1].menu_id|27|
      |$.MenuList[0].submenu[1].menu|Users|
      |$.MenuList[0].submenu[1].url|/users/ajaxuserindex|
      |$.MenuList[0].submenu[1].newwindow|0|

  @Positive @ContentValidation
  Scenario: Validate get configure menus content structure
    And I send the GET request to "menus_get_configure_menus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Menus Configure for this user|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |MenuList|
      |menu_id|
      |menu|
      |url|
      |customparameters|
      |icon_url|
      |white_image_url|
      |newwindow|
      |submenu|
      |Dashboard|
      |Users|
      |Organisation|
      |Unapproved Outlets|
      |Outlet Density Map|
      |Update User Targets|
      |Set Outlet Targets|

  @Positive @LoadTesting
  Scenario: Load testing for get configure menus endpoint
    And I send the GET request to "menus_get_configure_menus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Menus Configure for this user|

  @Negative @Timeout
  Scenario: Test get configure menus endpoint timeout handling
    And I send the GET request to "menus_get_configure_menus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Menus Configure for this user|

  @Positive @EndToEnd
  Scenario: End-to-end get configure menus data retrieval workflow
    And I send the GET request to "menus_get_configure_menus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Menus Configure for this user|
      |$.MenuList[0].menu_id|1|
      |$.MenuList[0].menu|Dashboard|
      |$.MenuList[0].url|/users/dashboard|
      |$.MenuList[0].newwindow|0|
      |$.MenuList[0].submenu[0].menu_id|26|
      |$.MenuList[0].submenu[0].menu|Dashboard|
      |$.MenuList[0].submenu[0].url|/users/dashboard|
      |$.MenuList[0].submenu[0].newwindow|0|
      |$.MenuList[0].submenu[1].menu_id|27|
      |$.MenuList[0].submenu[1].menu|Users|
      |$.MenuList[0].submenu[1].url|/users/ajaxuserindex|
      |$.MenuList[0].submenu[1].newwindow|0|
      |$.MenuList[0].submenu[2].menu_id|28|
      |$.MenuList[0].submenu[2].menu|Organisation|
      |$.MenuList[0].submenu[2].url|/companies/dashboard|
      |$.MenuList[0].submenu[2].newwindow|0|
      |$.MenuList[0].submenu[3].menu_id|29|
      |$.MenuList[0].submenu[3].menu|Unapproved Outlets|
      |$.MenuList[0].submenu[3].url|/outlets/viewunapprovedoutlets|
      |$.MenuList[0].submenu[3].newwindow|0|
      |$.MenuList[0].submenu[4].menu_id|30|
      |$.MenuList[0].submenu[4].menu|Outlet Density Map|
      |$.MenuList[0].submenu[4].url|/companies/outletDensityonMap|
      |$.MenuList[0].submenu[4].newwindow|0|
      |$.MenuList[0].submenu[5].menu_id|31|
      |$.MenuList[0].submenu[5].menu|Update User Targets|
      |$.MenuList[0].submenu[5].url|/targets/updatetargets|
      |$.MenuList[0].submenu[5].newwindow|0|
      |$.MenuList[0].submenu[6].menu_id|32|
      |$.MenuList[0].submenu[6].menu|Set Outlet Targets|
      |$.MenuList[0].submenu[6].url|/outlettargets/settarget|
      |$.MenuList[0].submenu[6].newwindow|0|
    And I store the response as "menus_get_configure_menus_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.MenuList|array|
      |$.MenuList[0]|object|
      |$.MenuList[0].menu_id|number|
      |$.MenuList[0].menu|string|
      |$.MenuList[0].url|string|
      |$.MenuList[0].customparameters|null|
      |$.MenuList[0].icon_url|string|
      |$.MenuList[0].white_image_url|string|
      |$.MenuList[0].newwindow|number|
      |$.MenuList[0].submenu|array|
      |$.MenuList[0].submenu[0]|object|
      |$.MenuList[0].submenu[0].menu_id|number|
      |$.MenuList[0].submenu[0].menu|string|
      |$.MenuList[0].submenu[0].url|string|
      |$.MenuList[0].submenu[0].customparameters|null|
      |$.MenuList[0].submenu[0].newwindow|number|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |MenuList|
      |menu_id|
      |menu|
      |url|
      |customparameters|
      |icon_url|
      |white_image_url|
      |newwindow|
      |submenu|
      |Dashboard|
      |Users|
      |Organisation|
      |Unapproved Outlets|
      |Outlet Density Map|
      |Update User Targets|
      |Set Outlet Targets|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Menus Configure for this user|
      |$.MenuList[0].menu_id|1|
      |$.MenuList[0].menu|Dashboard|
      |$.MenuList[0].url|/users/dashboard|
      |$.MenuList[0].newwindow|0|
      |$.MenuList[0].submenu[0].menu_id|26|
      |$.MenuList[0].submenu[0].menu|Dashboard|
      |$.MenuList[0].submenu[0].url|/users/dashboard|
      |$.MenuList[0].submenu[0].newwindow|0|

