@BizomWebAPI @CE @BeatDetailsManagement @BeatDetails @GetOutletsForBeatWithArea @CoreBusinessOperations
Feature: This feature file contains testcases for GET endpoint Beat Details - get outlets for beat with area

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Positive @Sanity
  Scenario: TC_01 Get outlets for beat with area using valid area ID
    And I send the GET request to "beatdetails_getoutletsforbeatwitharea" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | "" |
      | $.Outlets.2 | Sadha Nanda1 |
      | $.Outlets.5 | Poonam Provision |
      | $.Outlets.6 | Paal General Store |

  @Negative @Security
  Scenario: TC_02 Get outlets for beat with area using invalid access token
    And I send the GET request to "beatdetails_getoutletsforbeatwitharea" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_123|areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |

  @Negative @Validation
  Scenario: TC_03 Get outlets for beat with area using empty access token
    And I send the GET request to "beatdetails_getoutletsforbeatwitharea" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token||areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |

  @Negative @Validation
  Scenario: TC_04 Get outlets for beat with area using invalid area ID
    And I send the GET request to "beatdetails_getoutletsforbeatwitharea" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | false |
      | $.Reason  | "No data found." |

  @Negative @Validation
  Scenario: TC_05 Get outlets for beat with area using non-numeric area ID
    And I send the GET request to "beatdetails_getoutletsforbeatwitharea" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|invalid_area|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Positive @ResponseHeaders
  Scenario: TC_06 Get outlets for beat with area response headers validation
    And I send the GET request to "beatdetails_getoutletsforbeatwitharea" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | application/json |
      | Connection    | keep-alive                  |

  @Positive @Performance
  Scenario: TC_07 Get outlets for beat with area performance validation
    And I send the GET request to "beatdetails_getoutletsforbeatwitharea" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | "" |

  @Positive @ContentValidation
  Scenario: TC_08 Get outlets for beat with area content validation
    And I send the GET request to "beatdetails_getoutletsforbeatwitharea" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | "" |

  @Positive @DataValidation
  Scenario: TC_09 Get outlets for beat with area data structure validation
    And I send the GET request to "beatdetails_getoutletsforbeatwitharea" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true |
      | $.Reason  | "" |

  @Positive @EdgeCase
  Scenario: TC_10 Get outlets for beat with area using zero area ID
    And I send the GET request to "beatdetails_getoutletsforbeatwitharea" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true |
      | $.Reason  | "" |

  @Positive @EdgeCase
  Scenario: TC_11 Get outlets for beat with area using negative area ID
    And I send the GET request to "beatdetails_getoutletsforbeatwitharea" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | false |
      | $.Reason  | "No data found." |

  @Positive @SecurityHeaders
  Scenario: TC_12 Get outlets for beat with area security headers validation
    And I send the GET request to "beatdetails_getoutletsforbeatwitharea" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | application/json |
      | Connection    | keep-alive                  |
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | "" |

  @Positive @DBValidation @DataIntegrity
  Scenario: TC_13 Verify outlets data against database for area
    And I send the GET request to "beatdetails_getoutletsforbeatwitharea" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | "" |
    And I verify API response at path with DB and static values
      | JPath     | Value |
      | $.Outlets.19 | DB:outlets:name: id=19 |

  @Positive @DBValidation @DataCount
  Scenario: TC_14 Verify outlets count against database for area
    And I send the GET request to "beatdetails_getoutletsforbeatwitharea" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | "" |

  @Positive @DBValidation @DataIntegrity
  Scenario: TC_15 Verify outlets data consistency for different area
    And I send the GET request to "beatdetails_getoutletsforbeatwitharea" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | "" |
    And I verify API response at path with DB and static values
      | JPath     | Value |
      | $.Outlets.3 | DB:outlets:name: id=3 |
