@BizomWebAPI @CE @ActivitiesManagement @ActivityManagement @GetActivitiesApi @MasterDataManagement
Feature: Get Activities API Testing
  As a system user
  I want to test the get activities API endpoint
  So that I can ensure proper functionality and data retrieval for activities

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get activities API without access token
    When I send the GET request to "getactivitiesapi" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |

  @Negative @Security
  Scenario: TC_02 Get activities API with invalid access token
    And I send the GET request to "getactivitiesapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |


  @Positive @Smoke
  Scenario: TC_03 Get activities API with valid access token
     And I send the GET request to "getactivitiesapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | false |
      | $.Reason  | No data found |
      | $.Activityformdatas | [] |
    And I store the response as "getactivitiesapi_response" name using full path


  @Positive @DataValidation
  Scenario: TC_04 Verify get activities API returns valid JSON structure
    And I send the GET request to "getactivitiesapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | false |
      | $.Reason  | No data found |
      | $.Activityformdatas | [] |


  @Negative @Validation
  Scenario: TC_05 Get activities API with invalid endpoint
    And I send the GET request to "getactivitiesapi_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |


  @Negative @ErrorHandling
  Scenario: TC_06 Get activities API with invalid endpoint path
    And I send the GET request to "getactivitiesapi_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |


  @Positive @DataIntegrity
  Scenario: TC_07 Validate get activities API data integrity
     And I send the GET request to "getactivitiesapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | false |
      | $.Reason  | No data found |
      | $.Activityformdatas | [] |

  @Positive @SessionManagement
  Scenario: TC_08 Verify get activities API with valid session management
    And I send the GET request to "getactivitiesapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | false |
      | $.Reason  | No data found |
      | $.Activityformdatas | [] |

  @Negative @Security
  Scenario: TC_09 Get activities API with empty access token
    And I send the GET request to "getactivitiesapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token||
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |

 


  
