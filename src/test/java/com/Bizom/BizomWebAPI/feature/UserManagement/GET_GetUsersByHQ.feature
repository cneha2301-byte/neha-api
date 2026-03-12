@BizomWebAPI @CE @UsersByHQ @ReportingOperations
Feature: Users by HQ API Testing
  As a system user
  I want to test the getUsersByHQ endpoint
  So that I can ensure proper functionality and data retrieval for users associated with specific headquarters

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get users by HQ without access token
    When I send the GET request to "get_users_by_hq" endpoint with path parameters
      |Path|Value|
      |hqId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get users by HQ with invalid access token
    And I send the GET request to "get_users_by_hq" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|hqId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get users by HQ with expired access token
    And I send the GET request to "get_users_by_hq" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|hqId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get users by HQ with malformed access token
    And I send the GET request to "get_users_by_hq" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|hqId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

#  @Positive @Smoke
#  Scenario: Get users by HQ ID 1 with valid access token
#    And I send the GET request to "get_users_by_hq" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|hqId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason|""|
#      |$.Model|[]|
#      |$.Data|{"16":"lion12","19":"msm","20":"msm","23":"kji","25":"kji","26":"kjijj","28":"ytftyfy","31":"mobisy","40":"mobisy"}|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|string|
#      |$.Reason|string|
#      |$.Model|array|
#      |$.Data|object|
#      |$.Data['16']|string|
#      |$.Data['19']|string|
#      |$.Data['20']|string|

#  @Positive @Functional
#  Scenario: Get users by HQ ID 1 with valid access token - detailed validation
#    And I send the GET request to "get_users_by_hq" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|hqId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason|""|
#      |$.Model|[]|
#      |$.Data['16']|"lion12"|
#      |$.Data['19']|"msm"|
#      |$.Data['20']|"msm"|
#      |$.Data['23']|"kji"|
#      |$.Data."25"|"kji"|
#      |$.Data."26"|"kjijj"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|string|
#      |$.Reason|string|
#      |$.Model|array|
#      |$.Data|object|
#      |$.Data['16']|string|
#      |$.Data['19']|string|
#      |$.Data['20']|string|
#      |$.Data['23']|string|
#      |$.Data."25"|string|
#      |$.Data."26"|string|

#  @Negative @Validation
#  Scenario: Get users by HQ without HQ ID - missing parameter
#    And I send the GET request to "get_users_by_hq" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|hqId||
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|"Please supply an HQ Id."|
#      |$.Model|[]|
#      |$.Data|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Model|array|
#      |$.Data|array|

#  @Negative @Validation
#  Scenario: Get users by HQ with invalid HQ ID
#    And I send the GET request to "get_users_by_hq" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|hqId|abc|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason|""|
#      |$.Model|[]|
#      |$.Data|{"5":"Sadha","11":"southsalesmgr"}|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|string|
#      |$.Reason|string|
#      |$.Model|array|
    

#  @Negative @Validation
#  Scenario: Get users by HQ with special characters in HQ ID
#    And I send the GET request to "get_users_by_hq" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|hqId|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
   

#  @Negative @Security
#  Scenario: Get users by HQ with SQL injection attempt
#    And I send the GET request to "get_users_by_hq" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|hqId|'; DROP TABLE users; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
   
  @Negative @ErrorHandling
  Scenario: Get users by HQ with invalid endpoint
    And I send the GET request to "get_users_by_hq_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "404"
    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance test for users by HQ endpoint
    And I send the GET request to "get_users_by_hq" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|hqId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Regression
  Scenario: Regression test for users by HQ endpoint
    And I send the GET request to "get_users_by_hq" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|hqId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: Get users by HQ ID 1 with valid access token - DB validation
    And I send the GET request to "get_users_by_hq" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|hqId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
      |$.Model|[]|
      |$.Data['16']|DB:users:name: id=16|
      |$.Data['19']|DB:users:name: id=19|
      |$.Data['20']|DB:users:name: id=20|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Model|array|
      |$.Data|object|
      |$.Data['16']|string|
      |$.Data['19']|string|
      |$.Data['20']|string|

#  @Positive @Functional
#  Scenario: Get users by HQ ID 2 with valid access token - DB validation
#    And I send the GET request to "get_users_by_hq" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|hqId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|"No users found Under HQ."|
#      |$.Model|[]|
#
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|string|
#      |$.Reason|string|
#      |$.Model|array|
#      |$.Data|object|
#      |$.Data['1']|string|
#      |$.Data['2']|string|
#      |$.Data['3']|string|

  @Positive @DataValidation
  Scenario: Validate users by HQ response structure
    And I send the GET request to "get_users_by_hq" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|hqId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Model|array|
      |$.Data|object|
      |$.Data['16']|string|
      |$.Data['19']|string|
      |$.Data['20']|string|

  @Positive @ContentValidation
  Scenario: Validate users by HQ content structure
    And I send the GET request to "get_users_by_hq" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|hqId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
      |$.Model|[]|
      |$.Data|{"16":"lion12","19":"msm","20":"msm","23":"kji","25":"kji","26":"kjijj","28":"ytftyfy","31":"mobisy","40":"mobisy"}|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Model|
      |Data|
      |lion12|
      |msm|
      |kji|
      |kjijj|
      |ytftyfy|
      |mobisy|
      |16|
      |19|
      |20|
      |23|
      |25|
      |26|

#  @Positive @LoadTesting
#  Scenario: Load testing for users by HQ endpoint
#    And I send the GET request to "get_users_by_hq" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|hqId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "3000" milliseconds
#     And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason|string|
#      |$.Model|[]|
#      |$.Data|{"16":"lion12","19":"msm","20":"msm","23":"kji","25":"kji","26":"kjijj","28":"ytftyfy","31":"mobisy","40":"mobisy"}|

#  @Negative @Timeout
#  Scenario: Test users by HQ endpoint timeout handling
#    And I send the GET request to "get_users_by_hq" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|hqId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "5000" milliseconds
#     And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason|string|
#      |$.Model|[]|
#      |$.Data|{"16":"lion12","19":"msm","20":"msm","23":"kji","25":"kji","26":"kjijj","28":"ytftyfy","31":"mobisy","40":"mobisy"}|

  @Positive @EndToEnd
  Scenario: End-to-end users by HQ data retrieval workflow
    And I send the GET request to "get_users_by_hq" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|hqId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
      |$.Model|[]|
      |$.Data|{"16":"lion12","19":"msm","20":"msm","23":"kji","25":"kji","26":"kjijj","28":"ytftyfy","31":"mobisy","40":"mobisy"}|
    And I store the response as "users_by_hq_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Model|array|
      |$.Data|object|
      |$.Data['16']|string|
      |$.Data['19']|string|
      |$.Data['20']|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
      |$.Model|[]|
      |$.Data['16']|"lion12"|
      |$.Data['19']|"msm"|
      |$.Data['20']|"msm"|
      |$.Data['23']|"kji"|


  @Positive @HeaderValidation
  Scenario: Validate users by HQ response headers
    And I send the GET request to "get_users_by_hq" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|hqId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json; charset=UTF-8|
      |Server|Bizom|
      |Connection|keep-alive|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
      |$.Model|[]|
      |$.Data|{"16":"lion12","19":"msm","20":"msm","23":"kji","25":"kji","26":"kjijj","28":"ytftyfy","31":"mobisy","40":"mobisy"}|

  @Positive @SessionValidation
  Scenario: Validate users by HQ with session handling
    And I send the GET request to "get_users_by_hq" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|hqId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
      |$.Model|[]|
      |$.Data|{"16":"lion12","19":"msm","20":"msm","23":"kji","25":"kji","26":"kjijj","28":"ytftyfy","31":"mobisy","40":"mobisy"}|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Model|array|
      |$.Data|object|
      |$.Data['16']|string|

  @Positive @HQSpecificValidation
  Scenario: Validate users by HQ HQ-specific data
    And I send the GET request to "get_users_by_hq" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|hqId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
      |$.Model|[]|
      |$.Data|{"16":"lion12","19":"msm","20":"msm","23":"kji","25":"kji","26":"kjijj","28":"ytftyfy","31":"mobisy","40":"mobisy"}|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Data['16']|DB:users:name: id=16|
      |$.Data['19']|DB:users:name: id=19|
      |$.Data['20']|DB:users:name: id=20|

  @Positive @ObjectValidation
  Scenario: Validate users by HQ object structure and content
    And I send the GET request to "get_users_by_hq" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|hqId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Model|array|
      |$.Data|object|
      |$.Data['16']|string|
      |$.Data['19']|string|
      |$.Data['20']|string|
      |$.Data['23']|string|
      |$.Data."25"|string|
      |$.Data."26"|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
      |$.Model|[]|
      |$.Data['16']|"lion12"|
      |$.Data['19']|"msm"|
      |$.Data['20']|"msm"|
