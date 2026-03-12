@BizomWebAPI @SyncApisManagement @SyncApisIndex @OutletManagement
Feature: Sync APIs Index API Testing
  As a system user
  I want to test the syncapis/index endpoint
  So that I can ensure proper functionality and data retrieval for sync APIs management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|application/json, text/javascript, */*; q=0.01|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |X-Requested-With|XMLHttpRequest|

#  @Negative @Security
#  Scenario: Get sync APIs index without access token
#    When I send the GET request to "syncapis_index" endpoint with path parameters
#      |Path|Value|
#      |companyId|1|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
    # And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get sync APIs index with invalid access token
    And I send the GET request to "syncapis_index" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|companyId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds
      # And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get sync APIs index with expired access token
    And I send the GET request to "syncapis_index" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|companyId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    # And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get sync APIs index with malformed access token
    And I send the GET request to "syncapis_index" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|companyId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    # And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get sync APIs index company ID 1 with valid access token
    And I send the GET request to "syncapis_index" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|companyId|1|
      |sEcho|1|                           | |
      |iColumns|7|                        | |
      |sColumns|,,,,,,|                   | |
      |iDisplayStart|0|                   | |
      |iDisplayLength|25|                 | |
    Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|34|
      |$.iTotalDisplayRecords|34|
      |$.aaData|[["1","GET_USER_INFO","users/getuserinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["2","GET_AREAWISE_PRODUCT_INFO","skunits/getareawisecategoriesproducts?topMappedDepoData=true","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["3","GET_ALL_DISCOUNTS","discounts/getalldiscounts","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["4","GET_LOADOUTS","loadouts/getloadininfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["5","GET_COMPANY_INFO","companies/getinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["6","GET_TARGET_ACHIEVMENTS","targets/achievement","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["7","GET_COMPANIES_OUTLET_FIELD","companies/getCustomOutletFields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["8","GET_OUTLET_TYPES","outlets/getoutlettypes","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["9","GET_ALL_AREAS_FOR_OUTLET_FIELD","areas/getallareasforuser","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["10","GET_COMPANIES_PAYMENT_FIELD","companies/getCustomPaymentFields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["11","GET_COMPANIES_ORDER_FIELD","companies/getCustomOrderFields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["12","GET_COMPANIES_ENDOFDAY_DETAILS","endofdayreports/getendofday","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["13","GET_COLLATORALS","skunits/getcollateralinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["14","GET_ACTIVITY_FORM_FIELD","companies/getactivityformfields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["15","GET_COST_OF_SALE","payments/getcost","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["16","GET_COMPANIES_COLLATERAL_INFO","skunits/getcollateralinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["17","GET_TODAY_BEAT_INFO","outlets/getbeatfortoday","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["18","GET_BEATWISE_OUTLETS_NEW","outlets/getbeatwiseoutletsnew","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["19","GET_PENDING_PAYMENTS","payments/getpendingpayments","127","2014-05-23 00:00:00","2014-05-23 00:00:00","1"],["20","CLEAR_DATA","app/cleardata","1","2014-07-31 00:00:00","2014-07-31 00:00:00","470212"],["21","EXPORT_DB","app/exportdb","1","2014-07-31 00:00:00","2014-07-31 00:00:00","470212"],["22","GET_CALLS","/calls/getMyCalls?outletId=NN","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"],["23","GET_POPS","/pops/getpopinfo","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"],["24","GET_COMPANY_LOGO","/companies/logo","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"],["25","GET_NEARBY_OUTLETS","/outlets/getNearestOutletsWithoutConditions","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"]]|
    And I store the response as "syncapis_index_response" name using full path

  @Positive @DataValidation
  Scenario: Validate sync APIs index response structure
    And I send the GET request to "syncapis_index" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|companyId|1|
      |sEcho|1|                           | |
      |iColumns|7|                        | |
      |sColumns|,,,,,,|                   | |
      |iDisplayStart|0|                   | |
      |iDisplayLength|25|                 | |
    Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
      |$.aaData[0]|array|
      |$.aaData[0][0]|string|
      |$.aaData[0][1]|string|
      |$.aaData[0][2]|string|

#  @Positive @DataValidation
#  Scenario: Validate sync APIs index specific data values
#    And I send the GET request to "syncapis_index" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|companyId|1|
#      |sEcho|1|                           | |
#      |iColumns|7|                        | |
#      |sColumns|,,,,,,|                   | |
#      |iDisplayStart|0|                   | |
#      |iDisplayLength|25|                 | |
#    Then I should see the response code as "200"
#    # And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|34|
#      |$.iTotalDisplayRecords|34|
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.aaData[0][1]|DB:syncapis:name: company_id=470212|
#      |$.aaData[0][2]|DB:syncapis:endpoint: company_id=470212|

  @Positive @DataValidation
  Scenario: Validate sync APIs index with static values
    And I send the GET request to "syncapis_index" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|companyId|1|
      |sEcho|1|                           | |
      |iColumns|7|                        | |
      |sColumns|,,,,,,|                   | |
      |iDisplayStart|0|                   | |
      |iDisplayLength|25|                 | |
    Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|34|
      |$.iTotalDisplayRecords|34|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.aaData[0][0]|"1"|
      |$.aaData[0][1]|"GET_USER_INFO"|
      |$.aaData[0][2]|"users/getuserinfo"|
      |$.aaData[0][3]|"1"|
      |$.aaData[0][4]|"2014-05-23 00:00:00"|
      |$.aaData[0][5]|"2014-05-23 00:00:00"|
      |$.aaData[0][6]|"470212"|

  @Positive @Performance
  Scenario: Performance test for sync APIs index endpoint
    And I send the GET request to "syncapis_index" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|companyId|1|
      |sEcho|1|                           | |
      |iColumns|7|                        | |
      |sColumns|,,,,,,|                   | |
      |iDisplayStart|0|                   | |
      |iDisplayLength|25|                 | |
    Then I should see the response code as "200"
    # And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|34|
      |$.iTotalDisplayRecords|34|
      |$.aaData|[["1","GET_USER_INFO","users/getuserinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["2","GET_AREAWISE_PRODUCT_INFO","skunits/getareawisecategoriesproducts?topMappedDepoData=true","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["3","GET_ALL_DISCOUNTS","discounts/getalldiscounts","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["4","GET_LOADOUTS","loadouts/getloadininfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["5","GET_COMPANY_INFO","companies/getinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["6","GET_TARGET_ACHIEVMENTS","targets/achievement","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["7","GET_COMPANIES_OUTLET_FIELD","companies/getCustomOutletFields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["8","GET_OUTLET_TYPES","outlets/getoutlettypes","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["9","GET_ALL_AREAS_FOR_OUTLET_FIELD","areas/getallareasforuser","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["10","GET_COMPANIES_PAYMENT_FIELD","companies/getCustomPaymentFields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["11","GET_COMPANIES_ORDER_FIELD","companies/getCustomOrderFields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["12","GET_COMPANIES_ENDOFDAY_DETAILS","endofdayreports/getendofday","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["13","GET_COLLATORALS","skunits/getcollateralinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["14","GET_ACTIVITY_FORM_FIELD","companies/getactivityformfields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["15","GET_COST_OF_SALE","payments/getcost","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["16","GET_COMPANIES_COLLATERAL_INFO","skunits/getcollateralinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["17","GET_TODAY_BEAT_INFO","outlets/getbeatfortoday","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["18","GET_BEATWISE_OUTLETS_NEW","outlets/getbeatwiseoutletsnew","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["19","GET_PENDING_PAYMENTS","payments/getpendingpayments","127","2014-05-23 00:00:00","2014-05-23 00:00:00","1"],["20","CLEAR_DATA","app/cleardata","1","2014-07-31 00:00:00","2014-07-31 00:00:00","470212"],["21","EXPORT_DB","app/exportdb","1","2014-07-31 00:00:00","2014-07-31 00:00:00","470212"],["22","GET_CALLS","/calls/getMyCalls?outletId=NN","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"],["23","GET_POPS","/pops/getpopinfo","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"],["24","GET_COMPANY_LOGO","/companies/logo","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"],["25","GET_NEARBY_OUTLETS","/outlets/getNearestOutletsWithoutConditions","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"]]|

  @Positive @Concurrency
  Scenario: Concurrent access test for sync APIs index endpoint
    And I send the GET request to "syncapis_index" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|companyId|1|
      |sEcho|1|                           | |
      |iColumns|7|                        | |
      |sColumns|,,,,,,|                   | |
      |iDisplayStart|0|                   | |
      |iDisplayLength|25|                 | |
    Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|34|
      |$.iTotalDisplayRecords|34|
      |$.aaData|[["1","GET_USER_INFO","users/getuserinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["2","GET_AREAWISE_PRODUCT_INFO","skunits/getareawisecategoriesproducts?topMappedDepoData=true","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["3","GET_ALL_DISCOUNTS","discounts/getalldiscounts","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["4","GET_LOADOUTS","loadouts/getloadininfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["5","GET_COMPANY_INFO","companies/getinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["6","GET_TARGET_ACHIEVMENTS","targets/achievement","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["7","GET_COMPANIES_OUTLET_FIELD","companies/getCustomOutletFields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["8","GET_OUTLET_TYPES","outlets/getoutlettypes","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["9","GET_ALL_AREAS_FOR_OUTLET_FIELD","areas/getallareasforuser","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["10","GET_COMPANIES_PAYMENT_FIELD","companies/getCustomPaymentFields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["11","GET_COMPANIES_ORDER_FIELD","companies/getCustomOrderFields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["12","GET_COMPANIES_ENDOFDAY_DETAILS","endofdayreports/getendofday","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["13","GET_COLLATORALS","skunits/getcollateralinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["14","GET_ACTIVITY_FORM_FIELD","companies/getactivityformfields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["15","GET_COST_OF_SALE","payments/getcost","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["16","GET_COMPANIES_COLLATERAL_INFO","skunits/getcollateralinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["17","GET_TODAY_BEAT_INFO","outlets/getbeatfortoday","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["18","GET_BEATWISE_OUTLETS_NEW","outlets/getbeatwiseoutletsnew","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["19","GET_PENDING_PAYMENTS","payments/getpendingpayments","127","2014-05-23 00:00:00","2014-05-23 00:00:00","1"],["20","CLEAR_DATA","app/cleardata","1","2014-07-31 00:00:00","2014-07-31 00:00:00","470212"],["21","EXPORT_DB","app/exportdb","1","2014-07-31 00:00:00","2014-07-31 00:00:00","470212"],["22","GET_CALLS","/calls/getMyCalls?outletId=NN","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"],["23","GET_POPS","/pops/getpopinfo","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"],["24","GET_COMPANY_LOGO","/companies/logo","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"],["25","GET_NEARBY_OUTLETS","/outlets/getNearestOutletsWithoutConditions","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"]]|

  @Negative @Validation
  Scenario: Get sync APIs index with invalid query parameters
    And I send the GET request to "syncapis_index" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|companyId|1|
      |sEcho|1|                           | |
      |iColumns|7|                        | |
      |sColumns|,,,,,,|                   | |
      |iDisplayStart|0|                   | |
      |iDisplayLength|25|                 | |
      |invalid_param|invalid_value|       | |
    Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|34|
      |$.iTotalDisplayRecords|34|
      |$.aaData|[["1","GET_USER_INFO","users/getuserinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["2","GET_AREAWISE_PRODUCT_INFO","skunits/getareawisecategoriesproducts?topMappedDepoData=true","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["3","GET_ALL_DISCOUNTS","discounts/getalldiscounts","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["4","GET_LOADOUTS","loadouts/getloadininfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["5","GET_COMPANY_INFO","companies/getinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["6","GET_TARGET_ACHIEVMENTS","targets/achievement","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["7","GET_COMPANIES_OUTLET_FIELD","companies/getCustomOutletFields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["8","GET_OUTLET_TYPES","outlets/getoutlettypes","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["9","GET_ALL_AREAS_FOR_OUTLET_FIELD","areas/getallareasforuser","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["10","GET_COMPANIES_PAYMENT_FIELD","companies/getCustomPaymentFields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["11","GET_COMPANIES_ORDER_FIELD","companies/getCustomOrderFields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["12","GET_COMPANIES_ENDOFDAY_DETAILS","endofdayreports/getendofday","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["13","GET_COLLATORALS","skunits/getcollateralinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["14","GET_ACTIVITY_FORM_FIELD","companies/getactivityformfields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["15","GET_COST_OF_SALE","payments/getcost","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["16","GET_COMPANIES_COLLATERAL_INFO","skunits/getcollateralinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["17","GET_TODAY_BEAT_INFO","outlets/getbeatfortoday","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["18","GET_BEATWISE_OUTLETS_NEW","outlets/getbeatwiseoutletsnew","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["19","GET_PENDING_PAYMENTS","payments/getpendingpayments","127","2014-05-23 00:00:00","2014-05-23 00:00:00","1"],["20","CLEAR_DATA","app/cleardata","1","2014-07-31 00:00:00","2014-07-31 00:00:00","470212"],["21","EXPORT_DB","app/exportdb","1","2014-07-31 00:00:00","2014-07-31 00:00:00","470212"],["22","GET_CALLS","/calls/getMyCalls?outletId=NN","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"],["23","GET_POPS","/pops/getpopinfo","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"],["24","GET_COMPANY_LOGO","/companies/logo","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"],["25","GET_NEARBY_OUTLETS","/outlets/getNearestOutletsWithoutConditions","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"]]|

  @Negative @Validation
  Scenario: Get sync APIs index with special characters in query parameters
    And I send the GET request to "syncapis_index" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|companyId|1|
      |sEcho|1|                           | |
      |iColumns|7|                        | |
      |sColumns|,,,,,,|                   | |
      |iDisplayStart|0|                   | |
      |iDisplayLength|25|                 | |
      |test_param|<script>alert('XSS')</script>|||
    Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|34|
      |$.iTotalDisplayRecords|34|
      |$.aaData|[["1","GET_USER_INFO","users/getuserinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["2","GET_AREAWISE_PRODUCT_INFO","skunits/getareawisecategoriesproducts?topMappedDepoData=true","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["3","GET_ALL_DISCOUNTS","discounts/getalldiscounts","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["4","GET_LOADOUTS","loadouts/getloadininfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["5","GET_COMPANY_INFO","companies/getinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["6","GET_TARGET_ACHIEVMENTS","targets/achievement","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["7","GET_COMPANIES_OUTLET_FIELD","companies/getCustomOutletFields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["8","GET_OUTLET_TYPES","outlets/getoutlettypes","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["9","GET_ALL_AREAS_FOR_OUTLET_FIELD","areas/getallareasforuser","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["10","GET_COMPANIES_PAYMENT_FIELD","companies/getCustomPaymentFields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["11","GET_COMPANIES_ORDER_FIELD","companies/getCustomOrderFields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["12","GET_COMPANIES_ENDOFDAY_DETAILS","endofdayreports/getendofday","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["13","GET_COLLATORALS","skunits/getcollateralinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["14","GET_ACTIVITY_FORM_FIELD","companies/getactivityformfields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["15","GET_COST_OF_SALE","payments/getcost","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["16","GET_COMPANIES_COLLATERAL_INFO","skunits/getcollateralinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["17","GET_TODAY_BEAT_INFO","outlets/getbeatfortoday","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["18","GET_BEATWISE_OUTLETS_NEW","outlets/getbeatwiseoutletsnew","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["19","GET_PENDING_PAYMENTS","payments/getpendingpayments","127","2014-05-23 00:00:00","2014-05-23 00:00:00","1"],["20","CLEAR_DATA","app/cleardata","1","2014-07-31 00:00:00","2014-07-31 00:00:00","470212"],["21","EXPORT_DB","app/exportdb","1","2014-07-31 00:00:00","2014-07-31 00:00:00","470212"],["22","GET_CALLS","/calls/getMyCalls?outletId=NN","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"],["23","GET_POPS","/pops/getpopinfo","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"],["24","GET_COMPANY_LOGO","/companies/logo","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"],["25","GET_NEARBY_OUTLETS","/outlets/getNearestOutletsWithoutConditions","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"]]|

  @Negative @Security
  Scenario: Get sync APIs index with SQL injection attempt
    And I send the GET request to "syncapis_index" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|companyId|1|
      |sEcho|1|                           | |
      |iColumns|7|                        | |
      |sColumns|,,,,,,|                   | |
      |iDisplayStart|0|                   | |
      |iDisplayLength|25|                 | |
      |test_param|'; DROP TABLE syncapis; --|||
    Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|34|
      |$.iTotalDisplayRecords|34|
      |$.aaData|[["1","GET_USER_INFO","users/getuserinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["2","GET_AREAWISE_PRODUCT_INFO","skunits/getareawisecategoriesproducts?topMappedDepoData=true","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["3","GET_ALL_DISCOUNTS","discounts/getalldiscounts","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["4","GET_LOADOUTS","loadouts/getloadininfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["5","GET_COMPANY_INFO","companies/getinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["6","GET_TARGET_ACHIEVMENTS","targets/achievement","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["7","GET_COMPANIES_OUTLET_FIELD","companies/getCustomOutletFields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["8","GET_OUTLET_TYPES","outlets/getoutlettypes","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["9","GET_ALL_AREAS_FOR_OUTLET_FIELD","areas/getallareasforuser","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["10","GET_COMPANIES_PAYMENT_FIELD","companies/getCustomPaymentFields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["11","GET_COMPANIES_ORDER_FIELD","companies/getCustomOrderFields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["12","GET_COMPANIES_ENDOFDAY_DETAILS","endofdayreports/getendofday","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["13","GET_COLLATORALS","skunits/getcollateralinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["14","GET_ACTIVITY_FORM_FIELD","companies/getactivityformfields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["15","GET_COST_OF_SALE","payments/getcost","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["16","GET_COMPANIES_COLLATERAL_INFO","skunits/getcollateralinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["17","GET_TODAY_BEAT_INFO","outlets/getbeatfortoday","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["18","GET_BEATWISE_OUTLETS_NEW","outlets/getbeatwiseoutletsnew","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["19","GET_PENDING_PAYMENTS","payments/getpendingpayments","127","2014-05-23 00:00:00","2014-05-23 00:00:00","1"],["20","CLEAR_DATA","app/cleardata","1","2014-07-31 00:00:00","2014-07-31 00:00:00","470212"],["21","EXPORT_DB","app/exportdb","1","2014-07-31 00:00:00","2014-07-31 00:00:00","470212"],["22","GET_CALLS","/calls/getMyCalls?outletId=NN","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"],["23","GET_POPS","/pops/getpopinfo","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"],["24","GET_COMPANY_LOGO","/companies/logo","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"],["25","GET_NEARBY_OUTLETS","/outlets/getNearestOutletsWithoutConditions","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"]]|

  @Negative @Boundary
  Scenario: Get sync APIs index with maximum query parameters
    And I send the GET request to "syncapis_index" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|companyId|1|
      |sEcho|1|                           | |
      |iColumns|7|                        | |
      |sColumns|,,,,,,|                   | |
      |iDisplayStart|0|                   | |
      |iDisplayLength|25|                 | |
      |mDataProp_0|0|                     | |
      |sSearch_0||                        | |
      |bRegex_0|false|                    | |
      |bSearchable_0|true|                | |
      |bSortable_0|true|                  | |
      |mDataProp_1|1|                     | |
      |sSearch_1||                        | |
      |bRegex_1|false|                    | |
      |bSearchable_1|true|                | |
      |bSortable_1|true|                  | |
      |mDataProp_2|2|                     | |
      |sSearch_2||                        | |
      |bRegex_2|false|                    | |
      |bSearchable_2|true|                | |
      |bSortable_2|true|                  | |
      |mDataProp_3|3|                     | |
      |sSearch_3||                        | |
      |bRegex_3|false|                    | |
      |bSearchable_3|true|                | |
      |bSortable_3|true|                  | |
      |mDataProp_4|4|                     | |
      |sSearch_4||                        | |
      |bRegex_4|false|                    | |
      |bSearchable_4|true|                | |
      |bSortable_4|true|                  | |
      |mDataProp_5|5|                     | |
      |sSearch_5||                        | |
      |bRegex_5|false|                    | |
      |bSearchable_5|true|                | |
      |bSortable_5|true|                  | |
      |mDataProp_6|6|                     | |
      |sSearch_6||                        | |
      |bRegex_6|false|                    | |
      |bSearchable_6|false|               | |
      |bSortable_6|false|                 | |
      |sSearch||                          | |
      |bRegex|false|                      | |
      |iSortCol_0|0|                      | |
      |sSortDir_0|asc|                    | |
      |iSortingCols|1|                    | |
    Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|34|
      |$.iTotalDisplayRecords|34|
      |$.aaData|[["1","GET_USER_INFO","users/getuserinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["2","GET_AREAWISE_PRODUCT_INFO","skunits/getareawisecategoriesproducts?topMappedDepoData=true","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["3","GET_ALL_DISCOUNTS","discounts/getalldiscounts","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["4","GET_LOADOUTS","loadouts/getloadininfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["5","GET_COMPANY_INFO","companies/getinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["6","GET_TARGET_ACHIEVMENTS","targets/achievement","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["7","GET_COMPANIES_OUTLET_FIELD","companies/getCustomOutletFields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["8","GET_OUTLET_TYPES","outlets/getoutlettypes","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["9","GET_ALL_AREAS_FOR_OUTLET_FIELD","areas/getallareasforuser","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["10","GET_COMPANIES_PAYMENT_FIELD","companies/getCustomPaymentFields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["11","GET_COMPANIES_ORDER_FIELD","companies/getCustomOrderFields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["12","GET_COMPANIES_ENDOFDAY_DETAILS","endofdayreports/getendofday","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["13","GET_COLLATORALS","skunits/getcollateralinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["14","GET_ACTIVITY_FORM_FIELD","companies/getactivityformfields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["15","GET_COST_OF_SALE","payments/getcost","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["16","GET_COMPANIES_COLLATERAL_INFO","skunits/getcollateralinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["17","GET_TODAY_BEAT_INFO","outlets/getbeatfortoday","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["18","GET_BEATWISE_OUTLETS_NEW","outlets/getbeatwiseoutletsnew","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["19","GET_PENDING_PAYMENTS","payments/getpendingpayments","127","2014-05-23 00:00:00","2014-05-23 00:00:00","1"],["20","CLEAR_DATA","app/cleardata","1","2014-07-31 00:00:00","2014-07-31 00:00:00","470212"],["21","EXPORT_DB","app/exportdb","1","2014-07-31 00:00:00","2014-07-31 00:00:00","470212"],["22","GET_CALLS","/calls/getMyCalls?outletId=NN","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"],["23","GET_POPS","/pops/getpopinfo","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"],["24","GET_COMPANY_LOGO","/companies/logo","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"],["25","GET_NEARBY_OUTLETS","/outlets/getNearestOutletsWithoutConditions","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"]]|

#  @Negative @ErrorHandling
#  Scenario: Get sync APIs index with invalid endpoint
#    And I send the GET request to "syncapis_index_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|companyId|1|
#      |sEcho|1|                           | |
#      |iColumns|7|                        | |
#      |sColumns|,,,,,,|                   | |
#      |iDisplayStart|0|                   | |
#      |iDisplayLength|25|                 | |
#    Then I should see the response code as "404"
#    # And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

  @Positive @BusinessLogic
  Scenario: Validate sync APIs index business logic
    And I send the GET request to "syncapis_index" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|companyId|1|
      |sEcho|1|                           | |
      |iColumns|7|                        | |
      |sColumns|,,,,,,|                   | |
      |iDisplayStart|0|                   | |
      |iDisplayLength|25|                 | |
    Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|34|
      |$.iTotalDisplayRecords|34|
      |$.aaData|[["1","GET_USER_INFO","users/getuserinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["2","GET_AREAWISE_PRODUCT_INFO","skunits/getareawisecategoriesproducts?topMappedDepoData=true","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["3","GET_ALL_DISCOUNTS","discounts/getalldiscounts","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["4","GET_LOADOUTS","loadouts/getloadininfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["5","GET_COMPANY_INFO","companies/getinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["6","GET_TARGET_ACHIEVMENTS","targets/achievement","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["7","GET_COMPANIES_OUTLET_FIELD","companies/getCustomOutletFields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["8","GET_OUTLET_TYPES","outlets/getoutlettypes","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["9","GET_ALL_AREAS_FOR_OUTLET_FIELD","areas/getallareasforuser","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["10","GET_COMPANIES_PAYMENT_FIELD","companies/getCustomPaymentFields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["11","GET_COMPANIES_ORDER_FIELD","companies/getCustomOrderFields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["12","GET_COMPANIES_ENDOFDAY_DETAILS","endofdayreports/getendofday","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["13","GET_COLLATORALS","skunits/getcollateralinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["14","GET_ACTIVITY_FORM_FIELD","companies/getactivityformfields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["15","GET_COST_OF_SALE","payments/getcost","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["16","GET_COMPANIES_COLLATERAL_INFO","skunits/getcollateralinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["17","GET_TODAY_BEAT_INFO","outlets/getbeatfortoday","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["18","GET_BEATWISE_OUTLETS_NEW","outlets/getbeatwiseoutletsnew","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["19","GET_PENDING_PAYMENTS","payments/getpendingpayments","127","2014-05-23 00:00:00","2014-05-23 00:00:00","1"],["20","CLEAR_DATA","app/cleardata","1","2014-07-31 00:00:00","2014-07-31 00:00:00","470212"],["21","EXPORT_DB","app/exportdb","1","2014-07-31 00:00:00","2014-07-31 00:00:00","470212"],["22","GET_CALLS","/calls/getMyCalls?outletId=NN","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"],["23","GET_POPS","/pops/getpopinfo","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"],["24","GET_COMPANY_LOGO","/companies/logo","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"],["25","GET_NEARBY_OUTLETS","/outlets/getNearestOutletsWithoutConditions","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"]]|

  @Positive @DataIntegrity
  Scenario: Validate sync APIs index data integrity
    And I send the GET request to "syncapis_index" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|companyId|1|
      |sEcho|1|                           | |
      |iColumns|7|                        | |
      |sColumns|,,,,,,|                   | |
      |iDisplayStart|0|                   | |
      |iDisplayLength|25|                 | |
    Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|34|
      |$.iTotalDisplayRecords|34|
      |$.aaData|[["1","GET_USER_INFO","users/getuserinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["2","GET_AREAWISE_PRODUCT_INFO","skunits/getareawisecategoriesproducts?topMappedDepoData=true","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["3","GET_ALL_DISCOUNTS","discounts/getalldiscounts","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["4","GET_LOADOUTS","loadouts/getloadininfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["5","GET_COMPANY_INFO","companies/getinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["6","GET_TARGET_ACHIEVMENTS","targets/achievement","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["7","GET_COMPANIES_OUTLET_FIELD","companies/getCustomOutletFields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["8","GET_OUTLET_TYPES","outlets/getoutlettypes","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["9","GET_ALL_AREAS_FOR_OUTLET_FIELD","areas/getallareasforuser","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["10","GET_COMPANIES_PAYMENT_FIELD","companies/getCustomPaymentFields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["11","GET_COMPANIES_ORDER_FIELD","companies/getCustomOrderFields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["12","GET_COMPANIES_ENDOFDAY_DETAILS","endofdayreports/getendofday","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["13","GET_COLLATORALS","skunits/getcollateralinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["14","GET_ACTIVITY_FORM_FIELD","companies/getactivityformfields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["15","GET_COST_OF_SALE","payments/getcost","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["16","GET_COMPANIES_COLLATERAL_INFO","skunits/getcollateralinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["17","GET_TODAY_BEAT_INFO","outlets/getbeatfortoday","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["18","GET_BEATWISE_OUTLETS_NEW","outlets/getbeatwiseoutletsnew","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["19","GET_PENDING_PAYMENTS","payments/getpendingpayments","127","2014-05-23 00:00:00","2014-05-23 00:00:00","1"],["20","CLEAR_DATA","app/cleardata","1","2014-07-31 00:00:00","2014-07-31 00:00:00","470212"],["21","EXPORT_DB","app/exportdb","1","2014-07-31 00:00:00","2014-07-31 00:00:00","470212"],["22","GET_CALLS","/calls/getMyCalls?outletId=NN","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"],["23","GET_POPS","/pops/getpopinfo","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"],["24","GET_COMPANY_LOGO","/companies/logo","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"],["25","GET_NEARBY_OUTLETS","/outlets/getNearestOutletsWithoutConditions","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"]]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
      |$.aaData[0]|array|
      |$.aaData[0][0]|string|
      |$.aaData[0][1]|string|
      |$.aaData[0][2]|string|
      |$.aaData[0][3]|string|
      |$.aaData[0][4]|string|
      |$.aaData[0][5]|string|
      |$.aaData[0][6]|string|

  @Positive @Regression
  Scenario: Regression test for sync APIs index endpoint
    And I send the GET request to "syncapis_index" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|companyId|1|
      |sEcho|1|                           | |
      |iColumns|7|                        | |
      |sColumns|,,,,,,|  | |
      |iDisplayStart|0|| |
      |iDisplayLength|25|| |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|34|
      |$.iTotalDisplayRecords|34|
      |$.aaData|[["1","GET_USER_INFO","users/getuserinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["2","GET_AREAWISE_PRODUCT_INFO","skunits/getareawisecategoriesproducts?topMappedDepoData=true","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["3","GET_ALL_DISCOUNTS","discounts/getalldiscounts","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["4","GET_LOADOUTS","loadouts/getloadininfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["5","GET_COMPANY_INFO","companies/getinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["6","GET_TARGET_ACHIEVMENTS","targets/achievement","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["7","GET_COMPANIES_OUTLET_FIELD","companies/getCustomOutletFields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["8","GET_OUTLET_TYPES","outlets/getoutlettypes","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["9","GET_ALL_AREAS_FOR_OUTLET_FIELD","areas/getallareasforuser","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["10","GET_COMPANIES_PAYMENT_FIELD","companies/getCustomPaymentFields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["11","GET_COMPANIES_ORDER_FIELD","companies/getCustomOrderFields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["12","GET_COMPANIES_ENDOFDAY_DETAILS","endofdayreports/getendofday","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["13","GET_COLLATORALS","skunits/getcollateralinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["14","GET_ACTIVITY_FORM_FIELD","companies/getactivityformfields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["15","GET_COST_OF_SALE","payments/getcost","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["16","GET_COMPANIES_COLLATERAL_INFO","skunits/getcollateralinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["17","GET_TODAY_BEAT_INFO","outlets/getbeatfortoday","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["18","GET_BEATWISE_OUTLETS_NEW","outlets/getbeatwiseoutletsnew","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["19","GET_PENDING_PAYMENTS","payments/getpendingpayments","127","2014-05-23 00:00:00","2014-05-23 00:00:00","1"],["20","CLEAR_DATA","app/cleardata","1","2014-07-31 00:00:00","2014-07-31 00:00:00","470212"],["21","EXPORT_DB","app/exportdb","1","2014-07-31 00:00:00","2014-07-31 00:00:00","470212"],["22","GET_CALLS","/calls/getMyCalls?outletId=NN","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"],["23","GET_POPS","/pops/getpopinfo","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"],["24","GET_COMPANY_LOGO","/companies/logo","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"],["25","GET_NEARBY_OUTLETS","/outlets/getNearestOutletsWithoutConditions","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"]]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Positive @Functional
  Scenario: Validate sync APIs index response completeness
    And I send the GET request to "syncapis_index" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|companyId|1|
      |sEcho|1|| |
      |iColumns|7|| |
      |sColumns|,,,,,,|| |
      |iDisplayStart|0|| |
      |iDisplayLength|25|| |
    Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|34|
      |$.iTotalDisplayRecords|34|
      |$.aaData|[["1","GET_USER_INFO","users/getuserinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["2","GET_AREAWISE_PRODUCT_INFO","skunits/getareawisecategoriesproducts?topMappedDepoData=true","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["3","GET_ALL_DISCOUNTS","discounts/getalldiscounts","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["4","GET_LOADOUTS","loadouts/getloadininfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["5","GET_COMPANY_INFO","companies/getinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["6","GET_TARGET_ACHIEVMENTS","targets/achievement","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["7","GET_COMPANIES_OUTLET_FIELD","companies/getCustomOutletFields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["8","GET_OUTLET_TYPES","outlets/getoutlettypes","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["9","GET_ALL_AREAS_FOR_OUTLET_FIELD","areas/getallareasforuser","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["10","GET_COMPANIES_PAYMENT_FIELD","companies/getCustomPaymentFields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["11","GET_COMPANIES_ORDER_FIELD","companies/getCustomOrderFields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["12","GET_COMPANIES_ENDOFDAY_DETAILS","endofdayreports/getendofday","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["13","GET_COLLATORALS","skunits/getcollateralinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["14","GET_ACTIVITY_FORM_FIELD","companies/getactivityformfields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["15","GET_COST_OF_SALE","payments/getcost","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["16","GET_COMPANIES_COLLATERAL_INFO","skunits/getcollateralinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["17","GET_TODAY_BEAT_INFO","outlets/getbeatfortoday","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["18","GET_BEATWISE_OUTLETS_NEW","outlets/getbeatwiseoutletsnew","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["19","GET_PENDING_PAYMENTS","payments/getpendingpayments","127","2014-05-23 00:00:00","2014-05-23 00:00:00","1"],["20","CLEAR_DATA","app/cleardata","1","2014-07-31 00:00:00","2014-07-31 00:00:00","470212"],["21","EXPORT_DB","app/exportdb","1","2014-07-31 00:00:00","2014-07-31 00:00:00","470212"],["22","GET_CALLS","/calls/getMyCalls?outletId=NN","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"],["23","GET_POPS","/pops/getpopinfo","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"],["24","GET_COMPANY_LOGO","/companies/logo","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"],["25","GET_NEARBY_OUTLETS","/outlets/getNearestOutletsWithoutConditions","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"]]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.aaData[0][0]|"1"|
      |$.aaData[0][1]|"GET_USER_INFO"|
      |$.aaData[0][2]|"users/getuserinfo"|
      |$.aaData[0][3]|"1"|
      |$.aaData[0][4]|"2014-05-23 00:00:00"|
      |$.aaData[0][5]|"2014-05-23 00:00:00"|
      |$.aaData[0][6]|"470212"|

  @Positive @ArrayValidation
  Scenario: Validate sync APIs index array structure and content
    And I send the GET request to "syncapis_index" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|companyId|1|
      |sEcho|1|| |
      |iColumns|7|| |
      |sColumns|,,,,,,|| |
      |iDisplayStart|0|| |
      |iDisplayLength|25|| |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|34|
      |$.iTotalDisplayRecords|34|
      |$.aaData|[["1","GET_USER_INFO","users/getuserinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["2","GET_AREAWISE_PRODUCT_INFO","skunits/getareawisecategoriesproducts?topMappedDepoData=true","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["3","GET_ALL_DISCOUNTS","discounts/getalldiscounts","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["4","GET_LOADOUTS","loadouts/getloadininfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["5","GET_COMPANY_INFO","companies/getinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["6","GET_TARGET_ACHIEVMENTS","targets/achievement","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["7","GET_COMPANIES_OUTLET_FIELD","companies/getCustomOutletFields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["8","GET_OUTLET_TYPES","outlets/getoutlettypes","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["9","GET_ALL_AREAS_FOR_OUTLET_FIELD","areas/getallareasforuser","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["10","GET_COMPANIES_PAYMENT_FIELD","companies/getCustomPaymentFields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["11","GET_COMPANIES_ORDER_FIELD","companies/getCustomOrderFields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["12","GET_COMPANIES_ENDOFDAY_DETAILS","endofdayreports/getendofday","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["13","GET_COLLATORALS","skunits/getcollateralinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["14","GET_ACTIVITY_FORM_FIELD","companies/getactivityformfields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["15","GET_COST_OF_SALE","payments/getcost","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["16","GET_COMPANIES_COLLATERAL_INFO","skunits/getcollateralinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["17","GET_TODAY_BEAT_INFO","outlets/getbeatfortoday","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["18","GET_BEATWISE_OUTLETS_NEW","outlets/getbeatwiseoutletsnew","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["19","GET_PENDING_PAYMENTS","payments/getpendingpayments","127","2014-05-23 00:00:00","2014-05-23 00:00:00","1"],["20","CLEAR_DATA","app/cleardata","1","2014-07-31 00:00:00","2014-07-31 00:00:00","470212"],["21","EXPORT_DB","app/exportdb","1","2014-07-31 00:00:00","2014-07-31 00:00:00","470212"],["22","GET_CALLS","/calls/getMyCalls?outletId=NN","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"],["23","GET_POPS","/pops/getpopinfo","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"],["24","GET_COMPANY_LOGO","/companies/logo","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"],["25","GET_NEARBY_OUTLETS","/outlets/getNearestOutletsWithoutConditions","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"]]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData|array|
      |$.aaData[0]|array|
      |$.aaData[1]|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.aaData[0][0]|"1"|
      |$.aaData[0][1]|"GET_USER_INFO"|
      |$.aaData[0][2]|"users/getuserinfo"|
      |$.aaData[1][0]|"2"|
      |$.aaData[1][1]|"GET_AREAWISE_PRODUCT_INFO"|
      |$.aaData[1][2]|"skunits/getareawisecategoriesproducts?topMappedDepoData=true"|

#  @Positive @ContentValidation
#  Scenario: Validate sync APIs index content structure
#    And I send the GET request to "syncapis_index" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|companyId|1|
#      |sEcho|1|| |
#      |iColumns|7|| |
#      |sColumns|,,,,,,|| |
#      |iDisplayStart|0|| |
#      |iDisplayLength|25|| |
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|34|
#      |$.iTotalDisplayRecords|34|
#      |$.aaData|[["1","GET_USER_INFO","users/getuserinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["2","GET_AREAWISE_PRODUCT_INFO","skunits/getareawisecategoriesproducts?topMappedDepoData=true","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["3","GET_ALL_DISCOUNTS","discounts/getalldiscounts","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["4","GET_LOADOUTS","loadouts/getloadininfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["5","GET_COMPANY_INFO","companies/getinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["6","GET_TARGET_ACHIEVMENTS","targets/achievement","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["7","GET_COMPANIES_OUTLET_FIELD","companies/getCustomOutletFields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["8","GET_OUTLET_TYPES","outlets/getoutlettypes","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["9","GET_ALL_AREAS_FOR_OUTLET_FIELD","areas/getallareasforuser","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["10","GET_COMPANIES_PAYMENT_FIELD","companies/getCustomPaymentFields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["11","GET_COMPANIES_ORDER_FIELD","companies/getCustomOrderFields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["12","GET_COMPANIES_ENDOFDAY_DETAILS","endofdayreports/getendofday","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["13","GET_COLLATORALS","skunits/getcollateralinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["14","GET_ACTIVITY_FORM_FIELD","companies/getactivityformfields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["15","GET_COST_OF_SALE","payments/getcost","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["16","GET_COMPANIES_COLLATERAL_INFO","skunits/getcollateralinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["17","GET_TODAY_BEAT_INFO","outlets/getbeatfortoday","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["18","GET_BEATWISE_OUTLETS_NEW","outlets/getbeatwiseoutletsnew","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["19","GET_PENDING_PAYMENTS","payments/getpendingpayments","127","2014-05-23 00:00:00","2014-05-23 00:00:00","1"],["20","CLEAR_DATA","app/cleardata","1","2014-07-31 00:00:00","2014-07-31 00:00:00","470212"],["21","EXPORT_DB","app/exportdb","1","2014-07-31 00:00:00","2014-07-31 00:00:00","470212"],["22","GET_CALLS","/calls/getMyCalls?outletId=NN","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"],["23","GET_POPS","/pops/getpopinfo","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"],["24","GET_COMPANY_LOGO","/companies/logo","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"],["25","GET_NEARBY_OUTLETS","/outlets/getNearestOutletsWithoutConditions","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"]]|
#    And validating the response contains the following values
#      |Value|
#      |sEcho|
#      |iTotalRecords|
#      |iTotalDisplayRecords|
#      |aaData|
#      |GET_USER_INFO|
#      |GET_AREAWISE_PRODUCT_INFO|
#      |GET_ALL_DISCOUNTS|
#      |GET_LOADOUTS|
#      |GET_COMPANY_INFO|
#      |users/getuserinfo|
#      |skunits/getareawisecategoriesproducts|

  @Positive @LoadTesting
  Scenario: Load testing for sync APIs index endpoint
    And I send the GET request to "syncapis_index" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|companyId|1|
      |sEcho|1|| |
      |iColumns|7|| |
      |sColumns|,,,,,,|| |
      |iDisplayStart|0|| |
      |iDisplayLength|25|| |
    Then I should see the response code as "200"
    # And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|34|
      |$.iTotalDisplayRecords|34|
      |$.aaData|[["1","GET_USER_INFO","users/getuserinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["2","GET_AREAWISE_PRODUCT_INFO","skunits/getareawisecategoriesproducts?topMappedDepoData=true","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["3","GET_ALL_DISCOUNTS","discounts/getalldiscounts","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["4","GET_LOADOUTS","loadouts/getloadininfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["5","GET_COMPANY_INFO","companies/getinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["6","GET_TARGET_ACHIEVMENTS","targets/achievement","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["7","GET_COMPANIES_OUTLET_FIELD","companies/getCustomOutletFields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["8","GET_OUTLET_TYPES","outlets/getoutlettypes","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["9","GET_ALL_AREAS_FOR_OUTLET_FIELD","areas/getallareasforuser","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["10","GET_COMPANIES_PAYMENT_FIELD","companies/getCustomPaymentFields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["11","GET_COMPANIES_ORDER_FIELD","companies/getCustomOrderFields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["12","GET_COMPANIES_ENDOFDAY_DETAILS","endofdayreports/getendofday","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["13","GET_COLLATORALS","skunits/getcollateralinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["14","GET_ACTIVITY_FORM_FIELD","companies/getactivityformfields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["15","GET_COST_OF_SALE","payments/getcost","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["16","GET_COMPANIES_COLLATERAL_INFO","skunits/getcollateralinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["17","GET_TODAY_BEAT_INFO","outlets/getbeatfortoday","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["18","GET_BEATWISE_OUTLETS_NEW","outlets/getbeatwiseoutletsnew","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["19","GET_PENDING_PAYMENTS","payments/getpendingpayments","127","2014-05-23 00:00:00","2014-05-23 00:00:00","1"],["20","CLEAR_DATA","app/cleardata","1","2014-07-31 00:00:00","2014-07-31 00:00:00","470212"],["21","EXPORT_DB","app/exportdb","1","2014-07-31 00:00:00","2014-07-31 00:00:00","470212"],["22","GET_CALLS","/calls/getMyCalls?outletId=NN","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"],["23","GET_POPS","/pops/getpopinfo","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"],["24","GET_COMPANY_LOGO","/companies/logo","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"],["25","GET_NEARBY_OUTLETS","/outlets/getNearestOutletsWithoutConditions","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"]]|

  @Negative @Timeout
  Scenario: Test sync APIs index endpoint timeout handling
    And I send the GET request to "syncapis_index" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|companyId|1|
      |sEcho|1|| |
      |iColumns|7|| |
      |sColumns|,,,,,,|| |
      |iDisplayStart|0|| |
      |iDisplayLength|25|| |
    Then I should see the response code as "200"
    # And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|34|
      |$.iTotalDisplayRecords|34|
      |$.aaData|[["1","GET_USER_INFO","users/getuserinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["2","GET_AREAWISE_PRODUCT_INFO","skunits/getareawisecategoriesproducts?topMappedDepoData=true","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["3","GET_ALL_DISCOUNTS","discounts/getalldiscounts","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["4","GET_LOADOUTS","loadouts/getloadininfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["5","GET_COMPANY_INFO","companies/getinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["6","GET_TARGET_ACHIEVMENTS","targets/achievement","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["7","GET_COMPANIES_OUTLET_FIELD","companies/getCustomOutletFields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["8","GET_OUTLET_TYPES","outlets/getoutlettypes","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["9","GET_ALL_AREAS_FOR_OUTLET_FIELD","areas/getallareasforuser","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["10","GET_COMPANIES_PAYMENT_FIELD","companies/getCustomPaymentFields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["11","GET_COMPANIES_ORDER_FIELD","companies/getCustomOrderFields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["12","GET_COMPANIES_ENDOFDAY_DETAILS","endofdayreports/getendofday","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["13","GET_COLLATORALS","skunits/getcollateralinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["14","GET_ACTIVITY_FORM_FIELD","companies/getactivityformfields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["15","GET_COST_OF_SALE","payments/getcost","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["16","GET_COMPANIES_COLLATERAL_INFO","skunits/getcollateralinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["17","GET_TODAY_BEAT_INFO","outlets/getbeatfortoday","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["18","GET_BEATWISE_OUTLETS_NEW","outlets/getbeatwiseoutletsnew","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["19","GET_PENDING_PAYMENTS","payments/getpendingpayments","127","2014-05-23 00:00:00","2014-05-23 00:00:00","1"],["20","CLEAR_DATA","app/cleardata","1","2014-07-31 00:00:00","2014-07-31 00:00:00","470212"],["21","EXPORT_DB","app/exportdb","1","2014-07-31 00:00:00","2014-07-31 00:00:00","470212"],["22","GET_CALLS","/calls/getMyCalls?outletId=NN","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"],["23","GET_POPS","/pops/getpopinfo","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"],["24","GET_COMPANY_LOGO","/companies/logo","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"],["25","GET_NEARBY_OUTLETS","/outlets/getNearestOutletsWithoutConditions","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"]]|

  @Positive @EndToEnd
  Scenario: End-to-end sync APIs index data retrieval workflow
    And I send the GET request to "syncapis_index" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|companyId|1|
      |sEcho|1|| |
      |iColumns|7|| |
      |sColumns|,,,,,,|| |
      |iDisplayStart|0|| |
      |iDisplayLength|25|| |
    Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|34|
      |$.iTotalDisplayRecords|34|
      |$.aaData|[["1","GET_USER_INFO","users/getuserinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["2","GET_AREAWISE_PRODUCT_INFO","skunits/getareawisecategoriesproducts?topMappedDepoData=true","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["3","GET_ALL_DISCOUNTS","discounts/getalldiscounts","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["4","GET_LOADOUTS","loadouts/getloadininfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["5","GET_COMPANY_INFO","companies/getinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["6","GET_TARGET_ACHIEVMENTS","targets/achievement","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["7","GET_COMPANIES_OUTLET_FIELD","companies/getCustomOutletFields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["8","GET_OUTLET_TYPES","outlets/getoutlettypes","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["9","GET_ALL_AREAS_FOR_OUTLET_FIELD","areas/getallareasforuser","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["10","GET_COMPANIES_PAYMENT_FIELD","companies/getCustomPaymentFields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["11","GET_COMPANIES_ORDER_FIELD","companies/getCustomOrderFields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["12","GET_COMPANIES_ENDOFDAY_DETAILS","endofdayreports/getendofday","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["13","GET_COLLATORALS","skunits/getcollateralinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["14","GET_ACTIVITY_FORM_FIELD","companies/getactivityformfields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["15","GET_COST_OF_SALE","payments/getcost","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["16","GET_COMPANIES_COLLATERAL_INFO","skunits/getcollateralinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["17","GET_TODAY_BEAT_INFO","outlets/getbeatfortoday","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["18","GET_BEATWISE_OUTLETS_NEW","outlets/getbeatwiseoutletsnew","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["19","GET_PENDING_PAYMENTS","payments/getpendingpayments","127","2014-05-23 00:00:00","2014-05-23 00:00:00","1"],["20","CLEAR_DATA","app/cleardata","1","2014-07-31 00:00:00","2014-07-31 00:00:00","470212"],["21","EXPORT_DB","app/exportdb","1","2014-07-31 00:00:00","2014-07-31 00:00:00","470212"],["22","GET_CALLS","/calls/getMyCalls?outletId=NN","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"],["23","GET_POPS","/pops/getpopinfo","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"],["24","GET_COMPANY_LOGO","/companies/logo","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"],["25","GET_NEARBY_OUTLETS","/outlets/getNearestOutletsWithoutConditions","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"]]|
    And I store the response as "syncapis_index_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.aaData[0][0]|"1"|
      |$.aaData[0][1]|"GET_USER_INFO"|
      |$.aaData[0][2]|"users/getuserinfo"|
      |$.aaData[0][3]|"1"|
      |$.aaData[0][4]|"2014-05-23 00:00:00"|
      |$.aaData[0][5]|"2014-05-23 00:00:00"|
      |$.aaData[0][6]|"470212"|

#  @Positive @HeaderValidation
#  Scenario: Validate sync APIs index response headers
#    And I send the GET request to "syncapis_index" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|companyId|1|
#      |sEcho|1|| |
#      |iColumns|7|| |
#      |sColumns|,,,,,,|| |
#      |iDisplayStart|0|| |
#      |iDisplayLength|25|| |
#    Then I should see the response code as "200"
#    # And verify response time is less than "2500" milliseconds
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Content-Type|application/json|
#      |Server|Bizom|
#      |Connection|keep-alive|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|34|
#      |$.iTotalDisplayRecords|34|
#      |$.aaData|[["1","GET_USER_INFO","users/getuserinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["2","GET_AREAWISE_PRODUCT_INFO","skunits/getareawisecategoriesproducts?topMappedDepoData=true","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["3","GET_ALL_DISCOUNTS","discounts/getalldiscounts","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["4","GET_LOADOUTS","loadouts/getloadininfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["5","GET_COMPANY_INFO","companies/getinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["6","GET_TARGET_ACHIEVMENTS","targets/achievement","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["7","GET_COMPANIES_OUTLET_FIELD","companies/getCustomOutletFields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["8","GET_OUTLET_TYPES","outlets/getoutlettypes","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["9","GET_ALL_AREAS_FOR_OUTLET_FIELD","areas/getallareasforuser","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["10","GET_COMPANIES_PAYMENT_FIELD","companies/getCustomPaymentFields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["11","GET_COMPANIES_ORDER_FIELD","companies/getCustomOrderFields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["12","GET_COMPANIES_ENDOFDAY_DETAILS","endofdayreports/getendofday","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["13","GET_COLLATORALS","skunits/getcollateralinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["14","GET_ACTIVITY_FORM_FIELD","companies/getactivityformfields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["15","GET_COST_OF_SALE","payments/getcost","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["16","GET_COMPANIES_COLLATERAL_INFO","skunits/getcollateralinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["17","GET_TODAY_BEAT_INFO","outlets/getbeatfortoday","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["18","GET_BEATWISE_OUTLETS_NEW","outlets/getbeatwiseoutletsnew","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["19","GET_PENDING_PAYMENTS","payments/getpendingpayments","127","2014-05-23 00:00:00","2014-05-23 00:00:00","1"],["20","CLEAR_DATA","app/cleardata","1","2014-07-31 00:00:00","2014-07-31 00:00:00","470212"],["21","EXPORT_DB","app/exportdb","1","2014-07-31 00:00:00","2014-07-31 00:00:00","470212"],["22","GET_CALLS","/calls/getMyCalls?outletId=NN","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"],["23","GET_POPS","/pops/getpopinfo","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"],["24","GET_COMPANY_LOGO","/companies/logo","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"],["25","GET_NEARBY_OUTLETS","/outlets/getNearestOutletsWithoutConditions","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"]]|

  @Positive @SessionValidation
  Scenario: Validate sync APIs index with session handling
    And I send the GET request to "syncapis_index" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|companyId|1|
      |sEcho|1|| |
      |iColumns|7|| |
      |sColumns|,,,,,,|| |
      |iDisplayStart|0|| |
      |iDisplayLength|25|| |
    Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|34|
      |$.iTotalDisplayRecords|34|
      |$.aaData|[["1","GET_USER_INFO","users/getuserinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["2","GET_AREAWISE_PRODUCT_INFO","skunits/getareawisecategoriesproducts?topMappedDepoData=true","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["3","GET_ALL_DISCOUNTS","discounts/getalldiscounts","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["4","GET_LOADOUTS","loadouts/getloadininfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["5","GET_COMPANY_INFO","companies/getinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["6","GET_TARGET_ACHIEVMENTS","targets/achievement","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["7","GET_COMPANIES_OUTLET_FIELD","companies/getCustomOutletFields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["8","GET_OUTLET_TYPES","outlets/getoutlettypes","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["9","GET_ALL_AREAS_FOR_OUTLET_FIELD","areas/getallareasforuser","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["10","GET_COMPANIES_PAYMENT_FIELD","companies/getCustomPaymentFields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["11","GET_COMPANIES_ORDER_FIELD","companies/getCustomOrderFields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["12","GET_COMPANIES_ENDOFDAY_DETAILS","endofdayreports/getendofday","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["13","GET_COLLATORALS","skunits/getcollateralinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["14","GET_ACTIVITY_FORM_FIELD","companies/getactivityformfields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["15","GET_COST_OF_SALE","payments/getcost","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["16","GET_COMPANIES_COLLATERAL_INFO","skunits/getcollateralinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["17","GET_TODAY_BEAT_INFO","outlets/getbeatfortoday","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["18","GET_BEATWISE_OUTLETS_NEW","outlets/getbeatwiseoutletsnew","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["19","GET_PENDING_PAYMENTS","payments/getpendingpayments","127","2014-05-23 00:00:00","2014-05-23 00:00:00","1"],["20","CLEAR_DATA","app/cleardata","1","2014-07-31 00:00:00","2014-07-31 00:00:00","470212"],["21","EXPORT_DB","app/exportdb","1","2014-07-31 00:00:00","2014-07-31 00:00:00","470212"],["22","GET_CALLS","/calls/getMyCalls?outletId=NN","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"],["23","GET_POPS","/pops/getpopinfo","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"],["24","GET_COMPANY_LOGO","/companies/logo","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"],["25","GET_NEARBY_OUTLETS","/outlets/getNearestOutletsWithoutConditions","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"]]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
      |$.aaData[0]|array|

#  @Positive @SyncApisSpecificValidation
#  Scenario: Validate sync APIs index sync-specific data
#    And I send the GET request to "syncapis_index" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|companyId|1|
#      |sEcho|1|| |
#      |iColumns|7|| |
#      |sColumns|,,,,,,|| |
#      |iDisplayStart|0|| |
#      |iDisplayLength|25|| |
#    Then I should see the response code as "200"
#    # And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|34|
#      |$.iTotalDisplayRecords|34|
#      |$.aaData|[["1","GET_USER_INFO","users/getuserinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["2","GET_AREAWISE_PRODUCT_INFO","skunits/getareawisecategoriesproducts?topMappedDepoData=true","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["3","GET_ALL_DISCOUNTS","discounts/getalldiscounts","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["4","GET_LOADOUTS","loadouts/getloadininfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["5","GET_COMPANY_INFO","companies/getinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["6","GET_TARGET_ACHIEVMENTS","targets/achievement","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["7","GET_COMPANIES_OUTLET_FIELD","companies/getCustomOutletFields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["8","GET_OUTLET_TYPES","outlets/getoutlettypes","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["9","GET_ALL_AREAS_FOR_OUTLET_FIELD","areas/getallareasforuser","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["10","GET_COMPANIES_PAYMENT_FIELD","companies/getCustomPaymentFields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["11","GET_COMPANIES_ORDER_FIELD","companies/getCustomOrderFields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["12","GET_COMPANIES_ENDOFDAY_DETAILS","endofdayreports/getendofday","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["13","GET_COLLATORALS","skunits/getcollateralinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["14","GET_ACTIVITY_FORM_FIELD","companies/getactivityformfields","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["15","GET_COST_OF_SALE","payments/getcost","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["16","GET_COMPANIES_COLLATERAL_INFO","skunits/getcollateralinfo","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["17","GET_TODAY_BEAT_INFO","outlets/getbeatfortoday","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["18","GET_BEATWISE_OUTLETS_NEW","outlets/getbeatwiseoutletsnew","1","2014-05-23 00:00:00","2014-05-23 00:00:00","470212"],["19","GET_PENDING_PAYMENTS","payments/getpendingpayments","127","2014-05-23 00:00:00","2014-05-23 00:00:00","1"],["20","CLEAR_DATA","app/cleardata","1","2014-07-31 00:00:00","2014-07-31 00:00:00","470212"],["21","EXPORT_DB","app/exportdb","1","2014-07-31 00:00:00","2014-07-31 00:00:00","470212"],["22","GET_CALLS","/calls/getMyCalls?outletId=NN","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"],["23","GET_POPS","/pops/getpopinfo","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"],["24","GET_COMPANY_LOGO","/companies/logo","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"],["25","GET_NEARBY_OUTLETS","/outlets/getNearestOutletsWithoutConditions","1","0000-00-00 00:00:00","0000-00-00 00:00:00","470212"]]|
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.aaData[0][0]|DB:syncapis:id: company_id=470212 AND active=1|
#      |$.aaData[0][1]|DB:syncapis:name: company_id=470212 AND active=1|
#      |$.aaData[0][2]|DB:syncapis:endpoint: company_id=470212 AND active=1|

  @Positive @DataTableValidation
  Scenario: Validate sync APIs index data table structure
    And I send the GET request to "syncapis_index" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|companyId|1|
      |sEcho|1|| |
      |iColumns|7|| |
      |sColumns|,,,,,,|| |
      |iDisplayStart|0|| |
      |iDisplayLength|25|| |
    Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
      |$.aaData[0]|array|
      |$.aaData[0][0]|string|
      |$.aaData[0][1]|string|
      |$.aaData[0][2]|string|
      |$.aaData[0][3]|string|
      |$.aaData[0][4]|string|
      |$.aaData[0][5]|string|
      |$.aaData[0][6]|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|34|
      |$.iTotalDisplayRecords|34|
      |$.aaData[0][0]|"1"|
      |$.aaData[0][1]|"GET_USER_INFO"|
      |$.aaData[0][2]|"users/getuserinfo"|
      |$.aaData[0][3]|"1"|
      |$.aaData[0][4]|"2014-05-23 00:00:00"|
      |$.aaData[0][5]|"2014-05-23 00:00:00"|
      |$.aaData[0][6]|"470212"|
