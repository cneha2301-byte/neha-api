@BizomWebAPI @PI @SchemesManagement @GetSchemeForSchemeIds @SystemIntegration
Feature: Get Scheme For Scheme IDs API Testing
  As a system user
  I want to test the getSchemeForSchemeIds endpoint
  So that I can ensure proper retrieval of scheme details for given scheme IDs

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
  Scenario: TC_01 Get scheme for scheme IDs without access token
    And I post the request with "POST_getSchemeForSchemeIds" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token||
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get scheme for scheme IDs with invalid access token
    And I post the request with "POST_getSchemeForSchemeIds" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get scheme for scheme IDs with expired access token
    And I post the request with "POST_getSchemeForSchemeIds" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get scheme for scheme IDs with malformed access token
    And I post the request with "POST_getSchemeForSchemeIds" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get scheme for scheme IDs with valid request
    And I post the request with "POST_getSchemeForSchemeIds" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|
      |$.Scheme[0].id|"1"|
      |$.Scheme[0].name|SCH1|
      |$.Scheme[1].id|"2"|
      |$.Scheme[1].name|SCH 2|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Scheme|array|
      |$.Scheme[0]|object|
      |$.Scheme[0].id|string|
      |$.Scheme[0].name|string|
      |$.Scheme[0].forquantity|string|
      |$.Scheme[0].foramount|string|
      |$.Scheme[0].discountpercent|string|
      |$.Scheme[0].active|string|
      |$.Scheme[0].applytype|string|
      |$.Scheme[0].type|string|
      |$.Scheme[0].user_id|string|
      |$.Scheme[0].company_id|string|
      |$.Scheme[0].startdatetime|string|
      |$.Scheme[0].created|string|
      |$.Scheme[0].modified|string|
      |$.Scheme[0].enddatetime|string|
      |$.Scheme[0].for_skunit_id|array|
      |$.Scheme[0].forentitytypedetails|array|
      |$.Scheme[0].free_skus|array|
      |$.Groupscheme|array|
    And I store the response as "get_scheme_for_scheme_ids_response" name using full path

  @Positive @DBValidation
  Scenario: TC_06 Validate scheme details with DB
    And I post the request with "POST_getSchemeForSchemeIds" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Scheme[0].name|DB:schemes:name: id=1|

  @Positive @Performance
  Scenario: TC_07 Performance test for get scheme for scheme IDs endpoint
    And I post the request with "POST_getSchemeForSchemeIds" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_08 Get scheme for scheme IDs with invalid scheme IDs
    And I modify fields with random values and remove fields in "POST_getSchemeForSchemeIds" payload
      |JPath|Value|
      |$.schemeIds|abc,xyz|
    And I post the request with "POST_getSchemeForSchemeIds" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Scheme|array|
      |$.Groupscheme|array|

  @Negative @Validation
  Scenario: TC_09 Get scheme for scheme IDs with empty body
    And I send empty body with "POST_getSchemeForSchemeIds" request
    And I post the request with "POST_getSchemeForSchemeIds" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Invalid Request"|

#  @Negative @ErrorHandling
#  Scenario: TC_10 Get scheme for scheme IDs with invalid endpoint
#    And I post the request with "POST_getSchemeForSchemeIds_invalid" payload with dynamic access token and query parameters
#      |Query|Value|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_11 Get scheme for scheme IDs with empty schemeIds
    And I modify fields with random values and remove fields in "POST_getSchemeForSchemeIds" payload
      |JPath|Value|
      |$.schemeIds|""|
    And I post the request with "POST_getSchemeForSchemeIds" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Scheme|array|
      |$.Groupscheme|array|

  @Negative @Validation
  Scenario: TC_12 Get scheme for scheme IDs with non-existent scheme IDs
    And I modify fields with random values and remove fields in "POST_getSchemeForSchemeIds" payload
      |JPath|Value|
      |$.schemeIds|999999,999998|
    And I post the request with "POST_getSchemeForSchemeIds" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Scheme|array|
      |$.Groupscheme|array|

  @Positive @ObjectValidation
  Scenario: TC_13 Validate scheme object structure and data types
    And I post the request with "POST_getSchemeForSchemeIds" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Scheme[0].id|string|
      |$.Scheme[0].name|string|
      |$.Scheme[0].forquantity|string|
      |$.Scheme[0].foramount|string|
      |$.Scheme[0].discountpercent|string|
      |$.Scheme[0].active|string|
      |$.Scheme[0].erp_id|string|
      |$.Scheme[0].schemetype|string|
      |$.Scheme[0].applytype|string|
      |$.Scheme[0].type|string|
      |$.Scheme[0].user_id|string|
      |$.Scheme[0].company_id|string|
      |$.Scheme[0].startdatetime|string|
      |$.Scheme[0].enddatetime|string|
      |$.Scheme[0].for_skunit_id|array|
      |$.Scheme[0].for_skunit_qty|array|
      |$.Scheme[0].forentitytypedetails|array|
      |$.Scheme[0].forentitytypedetails[0]|object|
      |$.Scheme[0].forentitytypedetails[0].id|string|
      |$.Scheme[0].forentitytypedetails[0].name|string|
      |$.Scheme[0].free_skus|array|
      |$.Scheme[0].free_skus[0]|object|
      |$.Scheme[0].free_skus[0].freequantity|string|

  @Positive @ContentValidation
  Scenario: TC_14 Validate scheme response contains mandatory keys
    And I post the request with "POST_getSchemeForSchemeIds" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Scheme|
      |Groupscheme|
      |id|
      |name|
      |forquantity|
      |foramount|
      |discountpercent|
      |active|
      |applytype|
      |type|
      |user_id|
      |company_id|
      |startdatetime|
      |enddatetime|
      |for_skunit_id|
      |forentitytypedetails|
      |free_skus|

  @Positive @Regression
  Scenario: TC_15 Regression test for get scheme for scheme IDs endpoint
    And I post the request with "POST_getSchemeForSchemeIds" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Scheme|array|
      |$.Groupscheme|array|

  @Positive @Concurrency
  Scenario: TC_16 Concurrent access test for get scheme for scheme IDs endpoint
    And I post the request with "POST_getSchemeForSchemeIds" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @LoadTesting
  Scenario: TC_17 Load testing for get scheme for scheme IDs endpoint
    And I post the request with "POST_getSchemeForSchemeIds" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Timeout
  Scenario: TC_18 Test get scheme for scheme IDs endpoint timeout handling
    And I post the request with "POST_getSchemeForSchemeIds" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

