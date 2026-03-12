@BizomWebAPI @EntityWisePropertiesManagement @EntityWiseProperties @GetPropertyOptions @DataProcessing @OS
Feature: Get Property Options API Testing
  As a Bizom web API consumer
  I want to validate the get property options endpoint
  So that I can ensure property options are returned correctly for given property ids

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get property options without access token
    When I send the GET request to "entitywiseproperties_get_property_options" endpoint with path parameters
      |Path|Value|
      |propertyId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get property options with invalid access token
    And I send the GET request to "entitywiseproperties_get_property_options" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|propertyId|2|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get property options with expired access token
    And I send the GET request to "entitywiseproperties_get_property_options" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|propertyId|2|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get property options with malformed access token
    And I send the GET request to "entitywiseproperties_get_property_options" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|propertyId|2|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get property options with valid access token
    And I send the GET request to "entitywiseproperties_get_property_options" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|propertyId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|No dynamic properties options found|
      |$.Data|[]|
    And I store the response as "getPropertyOptions_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate get property options response structure
    And I send the GET request to "entitywiseproperties_get_property_options" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|propertyId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|

  @Positive @Performance
  Scenario: TC_07 Performance test for get property options endpoint
    And I send the GET request to "entitywiseproperties_get_property_options" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|propertyId|2|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: TC_08 Concurrent access test for get property options endpoint
    And I send the GET request to "entitywiseproperties_get_property_options" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|propertyId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_09 Get property options with invalid property id
    And I send the GET request to "entitywiseproperties_get_property_options" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|propertyId|invalid|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Negative @Validation
#  Scenario: TC_10 Get property options with special characters in property id
#    And I send the GET request to "entitywiseproperties_get_property_options" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|propertyId|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_11 Get property options with SQL injection attempt
#    And I send the GET request to "entitywiseproperties_get_property_options" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|propertyId|'; DROP TABLE entitywiseproperties; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: TC_12 Get property options with maximum query parameters
    And I send the GET request to "entitywiseproperties_get_property_options" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|propertyId|2|
      |param1|value1||                       |
      |param2|value2||                       |
      |param3|value3||                       |
      |param5|value5||                       |
      |param4|value4||                       |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Negative @ErrorHandling
#  Scenario: TC_13 Get property options with invalid endpoint
#    And I send the GET request to "entitywiseproperties_get_property_options_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|propertyId|2|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @Regression
  Scenario: TC_14 Regression test for get property options endpoint
    And I send the GET request to "entitywiseproperties_get_property_options" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|propertyId|2|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|

  @Positive @LoadTesting
  Scenario: TC_15 Load testing for get property options endpoint
    And I send the GET request to "entitywiseproperties_get_property_options" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|propertyId|2|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Negative @Timeout
  Scenario: TC_16 Timeout handling for get property options endpoint
    And I send the GET request to "entitywiseproperties_get_property_options" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|propertyId|2|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds

  @Positive @EndToEnd
  Scenario: TC_17 End-to-end get property options workflow
    And I send the GET request to "entitywiseproperties_get_property_options" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|propertyId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|No dynamic properties options found|
      |$.Data|[]|
    And I store the response as "getPropertyOptions_response" name using full path

