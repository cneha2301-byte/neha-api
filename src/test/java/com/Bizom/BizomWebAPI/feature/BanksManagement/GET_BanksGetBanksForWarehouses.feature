@BizomWebAPI @BanksManagement @GetBanksForWarehouses @CoreBusinessOperations @CE
Feature: This feature file contains testcases for GET endpoint Banks - get banks for warehouses

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Positive @Sanity
  Scenario: TC_01 Get banks for a valid warehouse id
    And I send the GET request to "banks_getbanksforwarehouses" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.banks.1 | ICICI |
      | $.banks.2 | canara |

  @Negative @Validation
  Scenario: TC_02 Get banks for warehouses with invalid warehouse id
    And I send the GET request to "banks_getbanksforwarehouses" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |

  @Negative @Security
  Scenario: TC_03 Get banks for warehouses with invalid access token
    And I send the GET request to "banks_getbanksforwarehouses" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.result  | false |
      | $.error.code | 401 |
      | $.error.message | Invalid Access Token or Credentials |

 @Negative @Validation
 Scenario: TC_04 Get banks for warehouses with missing warehouse id
   And I send the GET request to "banks_getbanksforwarehouses_invalid" endpoint with dynamic access token and query parameters
     |QueryParamName|QueryParamValue|
     |access_token|ACCESS_TOKEN|
   Then I should see the response code as "STATUS_404_NOT_FOUND"
   And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: TC_05 Get banks for warehouses with non-numeric warehouse id
    And I send the GET request to "banks_getbanksforwarehouses" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
    

  @Positive @ResponseHeaders
  Scenario: TC_06 Validate response headers for valid request
    And I send the GET request to "banks_getbanksforwarehouses" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | application/json; charset=UTF-8 |
      | Connection    | keep-alive                  |

  @Positive @Performance
  Scenario: TC_07 Verify response time performance for banks retrieval
    And I send the GET request to "banks_getbanksforwarehouses" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.banks.1 | ICICI |
      | $.banks.2 | canara |

  @Positive @DataValidation
  Scenario: TC_08 Verify banks data structure and content
    And I send the GET request to "banks_getbanksforwarehouses" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.banks.1 | ICICI |
      | $.banks.2 | canara |
    And I store the response as "banks_response" name using full path

  @Positive @Functional
  Scenario: TC_09 Verify banks endpoint with different warehouse IDs
    And I send the GET request to "banks_getbanksforwarehouses" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
    

  @Negative @Security
  Scenario: TC_10 Get banks for warehouses with empty access token
    And I send the GET request to "banks_getbanksforwarehouses" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token||warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |


  @Negative @Validation
  Scenario: TC_11 Get banks for warehouses with zero warehouse ID
    And I send the GET request to "banks_getbanksforwarehouses" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true |
      | $.Reason  | "" |
      | $.banks   | []    |

  @Positive @DBValidation @DataIntegrity
  Scenario: TC_12 Verify banks data against database for warehouse
    And I send the GET request to "banks_getbanksforwarehouses" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
    And I verify API response at path with DB and static values
      | JPath     | Value |
      | $.banks.1 | DB:banks:bankname: id=1 |
      | $.banks.2 | DB:banks:bankname: id=2 |

  @Positive @DBValidation @DataIntegrity
  Scenario: TC_13 Verify banks database consistency for different warehouse
    And I send the GET request to "banks_getbanksforwarehouses" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |



       

