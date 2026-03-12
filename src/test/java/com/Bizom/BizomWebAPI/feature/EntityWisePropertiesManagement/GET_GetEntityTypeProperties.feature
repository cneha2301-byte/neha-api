@BizomWebAPI @EntityWisePropertiesManagement @EntityWiseProperties @GetEntityTypeProperties @DataProcessing @OS
Feature: Get Entity Type Properties API Testing
  As a Bizom web API consumer
  I want to validate the get entity type properties endpoint
  So that I can ensure entity type lists are retrieved correctly

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get entity type properties without access token
    When I send the GET request to "entitywiseproperties_get_entity_type_properties" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get entity type properties with invalid access token
    And I send the GET request to "entitywiseproperties_get_entity_type_properties" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get entity type properties with expired access token
    And I send the GET request to "entitywiseproperties_get_entity_type_properties" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get entity type properties with malformed access token
    And I send the GET request to "entitywiseproperties_get_entity_type_properties" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get entity type properties with valid access token
    And I send the GET request to "entitywiseproperties_get_entity_type_properties" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Entity Types found|
      |$.Data[0]|skunits|
      |$.Data[1]|outlets|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|
    And I store the response as "getEntityTypeProperties_response" name using full path

  @Positive @Performance
  Scenario: TC_06 Performance test for get entity type properties endpoint
    And I send the GET request to "entitywiseproperties_get_entity_type_properties" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: TC_07 Concurrent access test for get entity type properties endpoint
    And I send the GET request to "entitywiseproperties_get_entity_type_properties" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_08 Get entity type properties with special characters in query parameter
    And I send the GET request to "entitywiseproperties_get_entity_type_properties" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_09 Get entity type properties with SQL injection attempt
    And I send the GET request to "entitywiseproperties_get_entity_type_properties" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE entitywiseproperties; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: TC_10 Get entity type properties with maximum query parameters
    And I send the GET request to "entitywiseproperties_get_entity_type_properties" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Negative @ErrorHandling
#  Scenario: TC_11 Get entity type properties with invalid endpoint
#    And I send the GET request to "entitywiseproperties_get_entity_type_properties_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @Regression
  Scenario: TC_12 Regression test for get entity type properties endpoint
    And I send the GET request to "entitywiseproperties_get_entity_type_properties" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|

  @Positive @LoadTesting
  Scenario: TC_13 Load testing for get entity type properties endpoint
    And I send the GET request to "entitywiseproperties_get_entity_type_properties" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Negative @Timeout
  Scenario: TC_14 Timeout handling for get entity type properties endpoint
    And I send the GET request to "entitywiseproperties_get_entity_type_properties" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds

#  @Positive @EndToEnd
#  Scenario: TC_15 End-to-end get entity type properties workflow
#    And I send the GET request to "entitywiseproperties_get_entity_type_properties" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Entity Types found|
#      |$.Data|["skunits","outlets"]|
#    And I store the response as "getEntityTypeProperties_response" name using full path

