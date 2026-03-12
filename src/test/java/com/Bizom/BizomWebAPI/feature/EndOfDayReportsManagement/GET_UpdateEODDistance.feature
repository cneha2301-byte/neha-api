@BizomWebAPI  @CE@EndOfDayReportsManagement @EndOfDayReports @UpdateEODDistance @SystemIntegration
Feature: Update EOD Distance API Testing
  As a Bizom web API consumer
  I want to validate the updateEODdistance endpoint
  So that I can ensure travelled distance is updated for end-of-day reports

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Update EOD distance without access token
    When I send the GET request to "endofdayreports_update_eod_distance" endpoint with path parameters
      |Path|Value|
      |userId|2|
      |date|22-03-2021|
      |distance|10.00|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Update EOD distance with invalid access token
    And I send the GET request to "endofdayreports_update_eod_distance" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|userId|2|
      |||date|22-03-2021|
      |||distance|10.00|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Update EOD distance with expired access token
    And I send the GET request to "endofdayreports_update_eod_distance" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|userId|2|
      |||date|22-03-2021|
      |||distance|10.00|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Update EOD distance with malformed access token
    And I send the GET request to "endofdayreports_update_eod_distance" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|userId|2|
      |||date|22-03-2021|
      |||distance|10.00|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Update EOD distance with valid access token - positive case
    And I send the GET request to "endofdayreports_update_eod_distance" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
      |||date|22-03-2021|
      |||distance|10.00|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Updated totaldistance.|
    And I store the response as "updateEodDistance_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate update EOD distance response structure
    And I send the GET request to "endofdayreports_update_eod_distance" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
      |||date|22-03-2021|
      |||distance|10.00|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

#  @Positive @DBValidation
#  Scenario: TC_07 Validate total distance travelled updated in DB for the given user and date
#    And I send the GET request to "endofdayreports_update_eod_distance" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|2|
#      |||date|22-03-2021|
#      |||distance|10.00|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Updated totaldistance.|
#    And I verify the data got updated as needed from DB
#      |expectedColumn|expectedValue|
#      |DB:endofdayreports:totaldistancetravelled: user_id=2 AND fordate='2021-03-22'|10.00|

  @Negative @Validation
  Scenario: TC_08 Update EOD distance with invalid user id - negative case
    And I send the GET request to "endofdayreports_update_eod_distance" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|999999|
      |||date|22-03-2021|
      |||distance|10.00|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Invalid request.|

  @Negative @Validation
  Scenario: TC_09 Update EOD distance with invalid date - negative case
    And I send the GET request to "endofdayreports_update_eod_distance" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
      |||date|99-99-9999|
      |||distance|10.00|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Invalid request.|

  @Negative @Validation
  Scenario: TC_10 Update EOD distance with invalid distance format - negative case
    And I send the GET request to "endofdayreports_update_eod_distance" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
      |||date|22-03-2021|
      |||distance|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Invalid request.|

  @Negative @ErrorHandling
  Scenario: TC_11 Update EOD distance with invalid endpoint
    And I send the GET request to "endofdayreports_update_eod_distance_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
      |||date|22-03-2021|
      |||distance|10.00|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: TC_12 Performance test for update EOD distance endpoint
    And I send the GET request to "endofdayreports_update_eod_distance" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
      |||date|22-03-2021|
      |||distance|10.00|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Regression
  Scenario: TC_13 Regression test for update EOD distance endpoint
    And I send the GET request to "endofdayreports_update_eod_distance" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
      |||date|22-03-2021|
      |||distance|10.00|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Updated totaldistance.|




