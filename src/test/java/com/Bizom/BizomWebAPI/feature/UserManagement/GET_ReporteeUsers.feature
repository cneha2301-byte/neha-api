@BizomWebAPI @CE @ReporteeUsers @ReportingOperations
Feature: Reportee Users API Testing
  As a system user
  I want to test the getReporteeUsers endpoint
  So that I can ensure proper functionality and data retrieval for reportee users

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get reportee users without access token
    When I send the GET request to "get_reportee_users" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get reportee users with invalid access token
    And I send the GET request to "get_reportee_users" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get reportee users with expired access token
    And I send the GET request to "get_reportee_users" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get reportee users with malformed access token
    And I send the GET request to "get_reportee_users" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

#  @Positive @Smoke
#  Scenario: Get reportee users with valid access token
#    And I send the GET request to "get_reportee_users" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Users|[{"1":{"name":"SLV Traders(ADMIN)","reporteeCount":1},"3":{"name":"Covid MGR(WAREHOUSE MANAGER)","reporteeCount":1},"4":{"name":"SLV Traders(ZONE MANAGER)","reporteeCount":0},"5":{"name":"Sadha(DISTRIBUTOR MANAGER)","reporteeCount":0},"6":{"name":"Mobisy(WAREHOUSE MANAGER)","reporteeCount":0},"7":{"name":"Sadha Nanda(DISTRIBUTOR SALES MANAGER)","reporteeCount":0},"9":{"name":"test1(SALESMAN)","reporteeCount":0},"10":{"name":"sadha(DISTRIBUTOR SALESMAN)","reporteeCount":0},"12":{"name":"retailer(ADMIN)","reporteeCount":0},"14":{"name":"sadha(ZONE MANAGER)","reporteeCount":0},"15":{"name":"&lt;blink&gt;Hello there&lt;/blink&gt;(ADMIN)","reporteeCount":0},"585":{"name":"Sampleuser(ZONE MANAGER)","reporteeCount":0}}]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Users|array|
#      |$.Users[0]|object|
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Content-Type|application/json; charset=UTF-8|
#      |Server|Bizom|
#      |Connection|keep-alive|

  @Positive @Functional
  Scenario: Verify reportee users response structure
    And I send the GET request to "get_reportee_users" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Users|[{"1":{"name":"SLV Traders(ADMIN)","reporteeCount":1},"3":{"name":"Covid MGR(WAREHOUSE MANAGER)","reporteeCount":1},"4":{"name":"SLV Traders(ZONE MANAGER)","reporteeCount":0},"5":{"name":"Sadha(DISTRIBUTOR MANAGER)","reporteeCount":0},"6":{"name":"Mobisy(WAREHOUSE MANAGER)","reporteeCount":0},"7":{"name":"Sadha Nanda(DISTRIBUTOR SALES MANAGER)","reporteeCount":0},"9":{"name":"test1(SALESMAN)","reporteeCount":0},"10":{"name":"sadha(DISTRIBUTOR SALESMAN)","reporteeCount":0},"12":{"name":"retailer(ADMIN)","reporteeCount":0},"14":{"name":"sadha(ZONE MANAGER)","reporteeCount":0},"15":{"name":"&lt;blink&gt;Hello there&lt;/blink&gt;(ADMIN)","reporteeCount":0},"585":{"name":"Sampleuser(ZONE MANAGER)","reporteeCount":0}}]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Users|array|
      |$.Users[0]|object|


  @Positive @Regression
  Scenario: Verify reportee users data consistency
    And I send the GET request to "get_reportee_users" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Users|[{"1":{"name":"SLV Traders(ADMIN)","reporteeCount":1},"3":{"name":"Covid MGR(WAREHOUSE MANAGER)","reporteeCount":1},"4":{"name":"SLV Traders(ZONE MANAGER)","reporteeCount":0},"5":{"name":"Sadha(DISTRIBUTOR MANAGER)","reporteeCount":0},"6":{"name":"Mobisy(WAREHOUSE MANAGER)","reporteeCount":0},"7":{"name":"Sadha Nanda(DISTRIBUTOR SALES MANAGER)","reporteeCount":0},"9":{"name":"test1(SALESMAN)","reporteeCount":0},"10":{"name":"sadha(DISTRIBUTOR SALESMAN)","reporteeCount":0},"12":{"name":"retailer(ADMIN)","reporteeCount":0},"14":{"name":"sadha(ZONE MANAGER)","reporteeCount":0},"15":{"name":"&lt;blink&gt;Hello there&lt;/blink&gt;(ADMIN)","reporteeCount":0},"585":{"name":"Sampleuser(ZONE MANAGER)","reporteeCount":0}}]|
   
  @Negative @ErrorHandling
  Scenario: Get reportee users with invalid endpoint
    And I send the GET request to "get_reportee_users_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "404"
    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance test for reportee users endpoint
    And I send the GET request to "get_reportee_users" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @DataValidation
  Scenario: Verify reportee users data integrity
    And I send the GET request to "get_reportee_users" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Users|[{"1":{"name":"SLV Traders(ADMIN)","reporteeCount":1},"3":{"name":"Covid MGR(WAREHOUSE MANAGER)","reporteeCount":1},"4":{"name":"SLV Traders(ZONE MANAGER)","reporteeCount":0},"5":{"name":"Sadha(DISTRIBUTOR MANAGER)","reporteeCount":0},"6":{"name":"Mobisy(WAREHOUSE MANAGER)","reporteeCount":0},"7":{"name":"Sadha Nanda(DISTRIBUTOR SALES MANAGER)","reporteeCount":0},"9":{"name":"test1(SALESMAN)","reporteeCount":0},"10":{"name":"sadha(DISTRIBUTOR SALESMAN)","reporteeCount":0},"12":{"name":"retailer(ADMIN)","reporteeCount":0},"14":{"name":"sadha(ZONE MANAGER)","reporteeCount":0},"15":{"name":"&lt;blink&gt;Hello there&lt;/blink&gt;(ADMIN)","reporteeCount":0},"585":{"name":"Sampleuser(ZONE MANAGER)","reporteeCount":0}}]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Users|array|
      |$.Users[0]|object|


  @Positive @Smoke
  Scenario: Get reportee users with comprehensive validation
    And I send the GET request to "get_reportee_users" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Users|[{"1":{"name":"SLV Traders(ADMIN)","reporteeCount":1},"3":{"name":"Covid MGR(WAREHOUSE MANAGER)","reporteeCount":1},"4":{"name":"SLV Traders(ZONE MANAGER)","reporteeCount":0},"5":{"name":"Sadha(DISTRIBUTOR MANAGER)","reporteeCount":0},"6":{"name":"Mobisy(WAREHOUSE MANAGER)","reporteeCount":0},"7":{"name":"Sadha Nanda(DISTRIBUTOR SALES MANAGER)","reporteeCount":0},"9":{"name":"test1(SALESMAN)","reporteeCount":0},"10":{"name":"sadha(DISTRIBUTOR SALESMAN)","reporteeCount":0},"12":{"name":"retailer(ADMIN)","reporteeCount":0},"14":{"name":"sadha(ZONE MANAGER)","reporteeCount":0},"15":{"name":"&lt;blink&gt;Hello there&lt;/blink&gt;(ADMIN)","reporteeCount":0},"585":{"name":"Sampleuser(ZONE MANAGER)","reporteeCount":0}}]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Users|array|
      |$.Users[0]|object|
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json; charset=UTF-8|
      |Server|Bizom|
      |Connection|keep-alive|

  @Positive @Functional
  Scenario: Verify reportee users response format
    And I send the GET request to "get_reportee_users" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Users|[{"1":{"name":"SLV Traders(ADMIN)","reporteeCount":1},"3":{"name":"Covid MGR(WAREHOUSE MANAGER)","reporteeCount":1},"4":{"name":"SLV Traders(ZONE MANAGER)","reporteeCount":0},"5":{"name":"Sadha(DISTRIBUTOR MANAGER)","reporteeCount":0},"6":{"name":"Mobisy(WAREHOUSE MANAGER)","reporteeCount":0},"7":{"name":"Sadha Nanda(DISTRIBUTOR SALES MANAGER)","reporteeCount":0},"9":{"name":"test1(SALESMAN)","reporteeCount":0},"10":{"name":"sadha(DISTRIBUTOR SALESMAN)","reporteeCount":0},"12":{"name":"retailer(ADMIN)","reporteeCount":0},"14":{"name":"sadha(ZONE MANAGER)","reporteeCount":0},"15":{"name":"&lt;blink&gt;Hello there&lt;/blink&gt;(ADMIN)","reporteeCount":0},"585":{"name":"Sampleuser(ZONE MANAGER)","reporteeCount":0}}]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Users|array|
      |$.Users[0]|object|

  @Positive @DataValidation
  Scenario: Verify reportee users data structure
    And I send the GET request to "get_reportee_users" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Users|[{"1":{"name":"SLV Traders(ADMIN)","reporteeCount":1},"3":{"name":"Covid MGR(WAREHOUSE MANAGER)","reporteeCount":1},"4":{"name":"SLV Traders(ZONE MANAGER)","reporteeCount":0},"5":{"name":"Sadha(DISTRIBUTOR MANAGER)","reporteeCount":0},"6":{"name":"Mobisy(WAREHOUSE MANAGER)","reporteeCount":0},"7":{"name":"Sadha Nanda(DISTRIBUTOR SALES MANAGER)","reporteeCount":0},"9":{"name":"test1(SALESMAN)","reporteeCount":0},"10":{"name":"sadha(DISTRIBUTOR SALESMAN)","reporteeCount":0},"12":{"name":"retailer(ADMIN)","reporteeCount":0},"14":{"name":"sadha(ZONE MANAGER)","reporteeCount":0},"15":{"name":"&lt;blink&gt;Hello there&lt;/blink&gt;(ADMIN)","reporteeCount":0},"585":{"name":"Sampleuser(ZONE MANAGER)","reporteeCount":0}}]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Users|array|
      |$.Users[0]|object|
      |$.Users[0].1|object|
      |$.Users[0].1.name|string|
      |$.Users[0].1.reporteeCount|number|
      |$.Users[0].3|object|
      |$.Users[0].3.name|string|
      |$.Users[0].3.reporteeCount|number|
      |$.Users[0].4|object|
      |$.Users[0].4.name|string|
      |$.Users[0].4.reporteeCount|number|
      |$.Users[0].5|object|
      |$.Users[0].5.name|string|
      |$.Users[0].5.reporteeCount|number|
      |$.Users[0].6|object|
      |$.Users[0].6.name|string|
      |$.Users[0].6.reporteeCount|number|
      |$.Users[0].7|object|
      |$.Users[0].7.name|string|
      |$.Users[0].7.reporteeCount|number|
      |$.Users[0].9|object|
      |$.Users[0].9.name|string|
      |$.Users[0].9.reporteeCount|number|
      |$.Users[0].10|object|
      |$.Users[0].10.name|string|
      |$.Users[0].10.reporteeCount|number|
      |$.Users[0].12|object|
      |$.Users[0].12.name|string|
      |$.Users[0].12.reporteeCount|number|
      |$.Users[0].14|object|
      |$.Users[0].14.name|string|
      |$.Users[0].14.reporteeCount|number|
      |$.Users[0].15|object|
      |$.Users[0].15.name|string|
      |$.Users[0].15.reporteeCount|number|
      |$.Users[0].585|object|
      |$.Users[0].585.name|string|
      |$.Users[0].585.reporteeCount|number|

  @Positive @BusinessLogic
  Scenario: Verify reportee users business logic
    And I send the GET request to "get_reportee_users" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Users|[{"1":{"name":"SLV Traders(ADMIN)","reporteeCount":1},"3":{"name":"Covid MGR(WAREHOUSE MANAGER)","reporteeCount":1},"4":{"name":"SLV Traders(ZONE MANAGER)","reporteeCount":0},"5":{"name":"Sadha(DISTRIBUTOR MANAGER)","reporteeCount":0},"6":{"name":"Mobisy(WAREHOUSE MANAGER)","reporteeCount":0},"7":{"name":"Sadha Nanda(DISTRIBUTOR SALES MANAGER)","reporteeCount":0},"9":{"name":"test1(SALESMAN)","reporteeCount":0},"10":{"name":"sadha(DISTRIBUTOR SALESMAN)","reporteeCount":0},"12":{"name":"retailer(ADMIN)","reporteeCount":0},"14":{"name":"sadha(ZONE MANAGER)","reporteeCount":0},"15":{"name":"&lt;blink&gt;Hello there&lt;/blink&gt;(ADMIN)","reporteeCount":0},"585":{"name":"Sampleuser(ZONE MANAGER)","reporteeCount":0}}]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Users|array|
      |$.Users[0]|object|



  @Positive @EdgeCase
  Scenario: Verify reportee users with empty response
    And I send the GET request to "get_reportee_users" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Users|[{"1":{"name":"SLV Traders(ADMIN)","reporteeCount":1},"3":{"name":"Covid MGR(WAREHOUSE MANAGER)","reporteeCount":1},"4":{"name":"SLV Traders(ZONE MANAGER)","reporteeCount":0},"5":{"name":"Sadha(DISTRIBUTOR MANAGER)","reporteeCount":0},"6":{"name":"Mobisy(WAREHOUSE MANAGER)","reporteeCount":0},"7":{"name":"Sadha Nanda(DISTRIBUTOR SALES MANAGER)","reporteeCount":0},"9":{"name":"test1(SALESMAN)","reporteeCount":0},"10":{"name":"sadha(DISTRIBUTOR SALESMAN)","reporteeCount":0},"12":{"name":"retailer(ADMIN)","reporteeCount":0},"14":{"name":"sadha(ZONE MANAGER)","reporteeCount":0},"15":{"name":"&lt;blink&gt;Hello there&lt;/blink&gt;(ADMIN)","reporteeCount":0},"585":{"name":"Sampleuser(ZONE MANAGER)","reporteeCount":0}}]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Users|array|

  @Positive @Regression
  Scenario: Verify reportee users regression testing
    And I send the GET request to "get_reportee_users" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Users|[{"1":{"name":"SLV Traders(ADMIN)","reporteeCount":1},"3":{"name":"Covid MGR(WAREHOUSE MANAGER)","reporteeCount":1},"4":{"name":"SLV Traders(ZONE MANAGER)","reporteeCount":0},"5":{"name":"Sadha(DISTRIBUTOR MANAGER)","reporteeCount":0},"6":{"name":"Mobisy(WAREHOUSE MANAGER)","reporteeCount":0},"7":{"name":"Sadha Nanda(DISTRIBUTOR SALES MANAGER)","reporteeCount":0},"9":{"name":"test1(SALESMAN)","reporteeCount":0},"10":{"name":"sadha(DISTRIBUTOR SALESMAN)","reporteeCount":0},"12":{"name":"retailer(ADMIN)","reporteeCount":0},"14":{"name":"sadha(ZONE MANAGER)","reporteeCount":0},"15":{"name":"&lt;blink&gt;Hello there&lt;/blink&gt;(ADMIN)","reporteeCount":0},"585":{"name":"Sampleuser(ZONE MANAGER)","reporteeCount":0}}]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Users|array|
      |$.Users[0]|object|

