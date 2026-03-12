@BizomWebAPI @CE @UsersManagement @GetOutletList
Feature: This feature file contains testcases for GET endpoint getoutletlist
  As a system user
  I want to test the outlet list endpoint
  So that I can ensure proper functionality and data retrieval for outlet lists

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

  @Positive @Smoke
  Scenario: TC_01 Get outlet list with valid request
    And I send the GET request to "getoutletlist" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
      |warehouseId|2|                    | |
      |addressField|1|                   | |
      |gst_flag|all|                     | |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.outlets|object|
    And I store the response as "outlet_list_response" name using full path

  @Positive @DataValidation
  Scenario: TC_02 Validate outlet list response structure
    And I send the GET request to "getoutletlist" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
      |warehouseId|2|                    | |
      |addressField|1|                   | |
      |gst_flag|all|                     | |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.outlets|object|
      |$.outlets.688|object|
      |$.outlets.688.id|string|
      |$.outlets.688.name|string|
      |$.outlets.688.address|string|

  @Positive @DataValidation
  Scenario: TC_03 Validate outlet list specific outlet data
    And I send the GET request to "getoutletlist" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
      |warehouseId|2|                    | |
      |addressField|1|                   | |
      |gst_flag|all|                     | |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.outlets.688.id|string|
      |$.outlets.688.name|string|
      |$.outlets.688.address|string|
      |$.outlets.767.id|string|
      |$.outlets.767.name|string|
      |$.outlets.767.address|string|

  @Positive @DataValidation
  Scenario: TC_04 Validate outlet list with different gst_flag values
    And I send the GET request to "getoutletlist" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
      |warehouseId|2|                    | |
      |addressField|1|                   | |
      |gst_flag|yes|                     | |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.outlets|object|

  @Positive @Performance
  Scenario: TC_05 Performance test for outlet list endpoint
    And I send the GET request to "getoutletlist" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
      |warehouseId|2|                    | |
      |addressField|1|                   | |
      |gst_flag|all|                     | |
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @DataIntegrity
  Scenario: TC_06 Validate outlet list data integrity
    And I send the GET request to "getoutletlist" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
      |warehouseId|2|                    | |
      |addressField|1|                   | |
      |gst_flag|all|                     | |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.outlets|object|
      |$.outlets.688.id|string|
      |$.outlets.688.name|string|
      |$.outlets.688.address|string|
      |$.outlets.767.id|string|
      |$.outlets.767.name|string|
      |$.outlets.767.address|string|

  @Positive @Functional
  Scenario: TC_07 Validate outlet list response completeness
    And I send the GET request to "getoutletlist" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
      |warehouseId|2|                    | |
      |addressField|1|                   | |
      |gst_flag|all|                     | |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.outlets|object|
      |$.outlets.688|object|
      |$.outlets.767|object|
      |$.outlets.16|object|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |outlets|
      |id|
      |name|
      |address|

  @Negative @Security
  Scenario: TC_08 Get outlet list without access token
    When I send the GET request to "getoutletlist" endpoint with path parameters
      |Path|Value|
      |outletId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_09 Get outlet list with invalid access token
    And I send the GET request to "getoutletlist" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|outletId|1|
      |warehouseId|2|                           | |
      |addressField|1|                          | |
      |gst_flag|all|                            | |
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_10 Get outlet list with expired access token
    And I send the GET request to "getoutletlist" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|outletId|1|
      |warehouseId|2|                           | |
      |addressField|1|                          | |
      |gst_flag|all|||
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_11 Get outlet list with malformed access token
    And I send the GET request to "getoutletlist" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|outletId|1|
      |warehouseId|2|                            | |
      |addressField|1|                           | |
      |gst_flag|all|                             | |
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds


  @Negative @ErrorHandling
  Scenario: TC_12 Get outlet list with invalid endpoint
    And I send the GET request to "getoutletlist_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
      |warehouseId|2|                    | |
      |addressField|1|                   | |
      |gst_flag|all|                     | |
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @DataValidation
  Scenario: TC_13 Validate outlet list with DB validation
    And I send the GET request to "getoutletlist" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
      |warehouseId|2|                    | |
      |addressField|1|                   | |
      |gst_flag|all|                     | |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data found|
     # |$.outlets.767.name|DB:outlets:name:id=767| #In DB the data is like <"dis1, ,">.

