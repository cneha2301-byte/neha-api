@BizomWebAPI @CE @ReportersForRole @ReportingOperations
Feature: Reporters For Role API Testing
  As a system user
  I want to test the getReportersforrole endpoint
  So that I can ensure proper functionality and data retrieval for reporters based on user role

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get reporters for role without access token
    When I send the GET request to "get_reporters_for_role" endpoint with path parameters
      |Path|Value|
      |userId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get reporters for role with invalid access token
    And I send the GET request to "get_reporters_for_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|userId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get reporters for role with expired access token
    And I send the GET request to "get_reporters_for_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|userId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get reporters for role with malformed access token
    And I send the GET request to "get_reporters_for_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|userId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

#  @Positive @Smoke
#  Scenario: Get reporters for role for user ID 1 with valid access token
#    And I send the GET request to "get_reporters_for_role" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#  And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data|{"1":"SLV Traders","12":"retailer","15":"&lt;blink&gt;Hello there&lt;/blink&gt;"}|
#
  
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|false|
      |$.Reason|string|
      |$.data|object|
      |$.reportingToDesignations|array|
      |$.designationWiseUsers|array|
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json; charset=UTF-8|
      |Server|Bizom|
      |Connection|keep-alive|

#  @Positive @Functional
#  Scenario: Get reporters for role for user ID 2 with valid access token
#    And I send the GET request to "get_reporters_for_role" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#  And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data|{"1":"SLV Traders","12":"retailer","15":"&lt;blink&gt;Hello there&lt;/blink&gt;"}|
#
  
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|false|
      |$.Reason|string|
      |$.data|object|
      |$.reportingToDesignations|array|
      |$.designationWiseUsers|array|

#  @Positive @Functional
#  Scenario: Get reporters for role for user ID 3 with valid access token
#    And I send the GET request to "get_reporters_for_role" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|3|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#  And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data|{"1":"SLV Traders","12":"retailer","15":"&lt;blink&gt;Hello there&lt;/blink&gt;"}|
#
  
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|false|
      |$.Reason|string|
      |$.data|object|
      |$.reportingToDesignations|array|
      |$.designationWiseUsers|array|

#  @Negative @Validation
#  Scenario: Get reporters for role with invalid user ID
#    And I send the GET request to "get_reporters_for_role" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|abc|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#  And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data|{"1":"SLV Traders","12":"retailer","15":"&lt;blink&gt;Hello there&lt;/blink&gt;"}|
#
  
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|false|
      |$.Reason|string|
      |$.data|object|
      |$.reportingToDesignations|array|
      |$.designationWiseUsers|array|

#  @Negative @Validation
#  Scenario: Get reporters for role with non-existent user ID
#    And I send the GET request to "get_reporters_for_role" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|999999|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#  And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data|{"1":"SLV Traders","12":"retailer","15":"&lt;blink&gt;Hello there&lt;/blink&gt;"}|
#
  
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|false|
      |$.Reason|string|
      |$.data|object|
      |$.reportingToDesignations|array|
      |$.designationWiseUsers|array|

#  @Negative @Validation
#  Scenario: Get reporters for role with negative user ID
#    And I send the GET request to "get_reporters_for_role" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|-1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#  And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data|{"1":"SLV Traders","12":"retailer","15":"&lt;blink&gt;Hello there&lt;/blink&gt;"}|
#
  
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|false|
      |$.Reason|string|
      |$.data|object|
      |$.reportingToDesignations|array|
      |$.designationWiseUsers|array|

#  @Negative @Validation
#  Scenario: Get reporters for role with zero user ID
#    And I send the GET request to "get_reporters_for_role" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|0|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#  And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data|{"1":"SLV Traders","12":"retailer","15":"&lt;blink&gt;Hello there&lt;/blink&gt;"}|
#
  
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|false|
      |$.Reason|string|
      |$.data|object|
      |$.reportingToDesignations|array|
      |$.designationWiseUsers|array|

  @Negative @ErrorHandling
  Scenario: Get reporters for role with invalid endpoint
    And I send the GET request to "get_reporters_for_role_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "404"
    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance test for reporters for role endpoint
    And I send the GET request to "get_reporters_for_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Regression
  Scenario: Regression test for reporters for role endpoint
    And I send the GET request to "get_reporters_for_role" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
  And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data|{"1":"SLV Traders","12":"retailer","15":"&lt;blink&gt;Hello there&lt;/blink&gt;"}|
  
  

#  @Positive @DataValidation
#  Scenario: Verify reporters for role response structure
#    And I send the GET request to "get_reporters_for_role" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#  And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data|{"1":"SLV Traders","12":"retailer","15":"&lt;blink&gt;Hello there&lt;/blink&gt;"}|
#
  
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|false|
      |$.Reason|string|
      |$.data|object|
      |$.reportingToDesignations|array|
      |$.designationWiseUsers|array|
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json; charset=UTF-8|
      |Server|Bizom|
      |Connection|keep-alive|

#  @Positive @Smoke
#  Scenario: Get reporters for role for user ID 1 with comprehensive validation
#    And I send the GET request to "get_reporters_for_role" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#  And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data|{"1":"SLV Traders","12":"retailer","15":"&lt;blink&gt;Hello there&lt;/blink&gt;"}|
#
  
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|false|
      |$.Reason|string|
      |$.data|object|
      |$.reportingToDesignations|array|
      |$.designationWiseUsers|array|
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json; charset=UTF-8|
      |Server|Bizom|
      |Connection|keep-alive|
    And I verify API response at path with DB and static values
      |JPath|Value|

      |$.Result|true|

#  @Positive @Functional
#  Scenario: Get reporters for role for user ID 2 with comprehensive validation
#    And I send the GET request to "get_reporters_for_role" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#  And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data|{"1":"SLV Traders","12":"retailer","15":"&lt;blink&gt;Hello there&lt;/blink&gt;"}|
#
  
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|false|
      |$.Reason|string|
      |$.data|object|
      |$.reportingToDesignations|array|
      |$.designationWiseUsers|array|
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json; charset=UTF-8|
      |Server|Bizom|
      |Connection|keep-alive|
    And I verify API response at path with DB and static values
      |JPath|Value|
  
      |$.Result|true|

#  @Positive @BusinessLogic
#  Scenario: Verify reporters for role business logic
#    And I send the GET request to "get_reporters_for_role" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#  And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data|{"1":"SLV Traders","12":"retailer","15":"&lt;blink&gt;Hello there&lt;/blink&gt;"}|
#
  
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|false|
      |$.Reason|string|
      |$.data|object|
      |$.reportingToDesignations|array|
      |$.designationWiseUsers|array|

#  @Positive @DataValidation
#  Scenario: Verify reporters for role data structure
#    And I send the GET request to "get_reporters_for_role" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#  And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data|{"1":"SLV Traders","12":"retailer","15":"&lt;blink&gt;Hello there&lt;/blink&gt;"}|
#
#
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|false|
      |$.Reason|string|
      |$.data|object|
      |$.data.1|string|
      |$.data.12|string|
      |$.data.15|string|
      |$.reportingToDesignations|array|
      |$.designationWiseUsers|array|
      |$.designationWiseUsers[0]|object|
      |$.designationWiseUsers[0].1|string|
      |$.designationWiseUsers[0].12|string|
      |$.designationWiseUsers[0].15|string|

#  @Positive @EdgeCase
#  Scenario: Verify reporters for role with empty response
#    And I send the GET request to "get_reporters_for_role" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#  And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data|{"1":"SLV Traders","12":"retailer","15":"&lt;blink&gt;Hello there&lt;/blink&gt;"}|
#
  
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|false|
      |$.Reason|string|
      |$.data|object|
      |$.reportingToDesignations|array|
      |$.designationWiseUsers|array|

#  @Positive @Regression
#  Scenario: Verify reporters for role consistency across different user IDs
#    And I send the GET request to "get_reporters_for_role" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#  And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.data|{"1":"SLV Traders","12":"retailer","15":"&lt;blink&gt;Hello there&lt;/blink&gt;"}|
#
  
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|false|
      |$.Reason|string|
      |$.data|object|
      |$.reportingToDesignations|array|
      |$.designationWiseUsers|array|
   

