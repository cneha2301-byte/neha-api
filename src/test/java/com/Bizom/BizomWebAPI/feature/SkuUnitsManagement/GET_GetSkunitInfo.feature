@BizomWebAPI @SkuUnitsManagement @GetSkunitInfo @ProductManagement @OS
Feature: Get Skunit Info API Testing
  As a system user
  I want to test the skunits getSkunitInfo endpoint
  So that I can retrieve detailed information for a given skunit by ID

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get skunit info without access token
    When I send the GET request to "skunits_get_skunit_info" endpoint with path parameters
      |Path|Value|
      |skunitId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get skunit info with invalid access token
#    And I send the GET request to "skunits_get_skunit_info" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|invalid_token_12345|skunitId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get skunit info with expired access token
#    And I send the GET request to "skunits_get_skunit_info" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|expired_token_12345|skunitId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get skunit info with malformed access token
#    And I send the GET request to "skunits_get_skunit_info" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|malformed.token.here|skunitId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2000" milliseconds

#  @Positive @Smoke
#  Scenario: Get skunit info for skunit ID 1 with valid access token
#    And I send the GET request to "skunits_get_skunit_info" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|skunitId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Skunit data found.|
#      |$.Data.Skunit.id|"1"|
#      |$.Data.Skunit.name|Cafe Cuba|
#      |$.Data.Skunit.brand_name|oOKCPj|
#      |$.Data.Skunit.category_name|Juice|
#      |$.Data.Subcategory.name|Maaza|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Data|object|
#      |$.Data.Skunit|object|
#      |$.Data.Skunit.id|string|
#      |$.Data.Skunit.name|string|
#      |$.Data.Skunit.mrp|string|
#      |$.Data.Skunit.price|string|
#      |$.Data.Skunit.brand_name|string|
#      |$.Data.Skunit.category_name|string|
#      |$.Data.Subcategory|object|
#      |$.Data.Subcategory.name|string|
#      |$.Data.gstSlabs|array|
#      |$.Data.gstSlabs[0].id|string|
#      |$.Data.gstSlabs[0].gst|string|
#      |$.Data.gstSlabs[0].isActive|string|
#    And I store the response as "skunit_info_1_response" name using full path

#  @Positive @DBValidation
#  Scenario: DB validate core fields for skunit ID 1
#    And I send the GET request to "skunits_get_skunit_info" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|skunitId|1|
#    Then I should see the response code as "200"
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.Data.Skunit.name|DB:skunits:name: id=1|
#      |$.Data.Skunit.price|DB:skunits:price: id=1|
#      |$.Data.Skunit.mrp|DB:skunits:mrp: id=1|
#      |$.Data.Subcategory.name|DB:subcategories:name: id=1|

#  @Positive @Functional
#  Scenario: Get skunit info for skunit ID 2 with valid access token
#    And I send the GET request to "skunits_get_skunit_info" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|skunitId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Skunit data found.|
#      |$.Data.Skunit.id|"2"|
#      |$.Data.Skunit.name|Maaza|
#      |$.Data.Skunit.brand_name|oOKCPj|
#      |$.Data.Skunit.category_name|Juice|
#      |$.Data.Subcategory.name|Maaza|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Data|object|
#      |$.Data.Skunit|object|
#      |$.Data.Skunit.id|string|
#      |$.Data.Skunit.name|string|
#      |$.Data.Skunit.mrp|string|
#      |$.Data.Skunit.price|string|
#      |$.Data.Skunit.brand_name|string|
#      |$.Data.Skunit.category_name|string|
#      |$.Data.Subcategory|object|
#      |$.Data.Subcategory.name|string|
#      |$.Data.gstSlabs|array|
#      |$.Data.gstSlabs[0].id|string|
#      |$.Data.gstSlabs[0].gst|string|
#      |$.Data.gstSlabs[0].isActive|string|
#    And I store the response as "skunit_info_2_response" name using full path
#
#  @Positive @DBValidation
#  Scenario: DB validate core fields for skunit ID 2
#    And I send the GET request to "skunits_get_skunit_info" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|skunitId|2|
#    Then I should see the response code as "200"
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.Data.Skunit.name|DB:skunits:name: id=2|
#      |$.Data.Skunit.price|DB:skunits:price: id=2|
#      |$.Data.Skunit.mrp|DB:skunits:mrp: id=2|
#      |$.Data.Subcategory.name|DB:subcategories:name: id=1|

  @Negative @Validation
  Scenario: Get skunit info with invalid or blank skunit ID
    And I send the GET request to "skunits_get_skunit_info_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Invalid Request|
      |$.Data|[]|

  @Negative @Validation
  Scenario: Get skunit info with non-numeric skunit ID
    And I send the GET request to "skunits_get_skunit_info" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|skunitId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

#  @Negative @ErrorHandling
#  Scenario: Get skunit info with invalid endpoint
#    And I send the GET request to "skunits_get_skunit_info_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance test for get skunit info endpoint
    And I send the GET request to "skunits_get_skunit_info" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|skunitId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Regression
  Scenario: Regression test for get skunit info endpoint
    And I send the GET request to "skunits_get_skunit_info" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|skunitId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
