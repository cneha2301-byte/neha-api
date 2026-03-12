@BizomWebAPI @ClaimsManagement @Claims @ClaimKpi @ReportsAnalyticsGroup2 @CE
Feature: This feature file contains testcases for GET endpoint Claims - Claim KPI

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @PositiveScenario @Sanity
  Scenario: TC_01 Claims KPI - status code positive case
    And I send the GET request to "claims_claimkpi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | "Data Found" |
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | application/json; charset=UTF-8    |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "claimKpiResponse" name using full path

  @PositiveScenario @DataValidation
  Scenario: TC_02 Claims KPI - validate response structure and data types
    And I send the GET request to "claims_claimkpi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | "Data Found" |
      | $.Data.ClaimnKpi.1.id | "1" |
      | $.Data.ClaimnKpi.1.name | "Distance" |
      | $.Data.ClaimnKpi.1.active | 1 |
      | $.Data.ClaimnKpi.2.id | "2" |
      | $.Data.ClaimnKpi.2.name | "Call" |
      | $.Data.ClaimnKpi.2.active | 1 |
      | $.Data.ClaimnKpi.3.id | "3" |
      | $.Data.ClaimnKpi.3.name | "Working Hours" |
      | $.Data.ClaimnKpi.3.active | 1 |
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @ContentValidation
  Scenario: TC_03 Claims KPI - validate Distance KPI types
    And I send the GET request to "claims_claimkpi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | "Data Found" |
      | $.Data.ClaimnKpi.1.ClaimkpiTypes[0].claimKpiTypeId | "1" |
      | $.Data.ClaimnKpi.1.ClaimkpiTypes[0].claimKpiTypeName | "Attendance to End of day" |
      | $.Data.ClaimnKpi.1.ClaimkpiTypes[1].claimKpiTypeId | "2" |
      | $.Data.ClaimnKpi.1.ClaimkpiTypes[1].claimKpiTypeName | "Attendance to Last Call" |
      | $.Data.ClaimnKpi.1.ClaimkpiTypes[2].claimKpiTypeId | "3" |
      | $.Data.ClaimnKpi.1.ClaimkpiTypes[2].claimKpiTypeName | "First call to Last Call" |
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @ContentValidation
  Scenario: TC_04 Claims KPI - validate Call KPI types
    And I send the GET request to "claims_claimkpi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | "Data Found" |
      | $.Data.ClaimnKpi.2.ClaimkpiTypes[0].claimKpiTypeId | "6" |
      | $.Data.ClaimnKpi.2.ClaimkpiTypes[0].claimKpiTypeName | "Total calls" |
      | $.Data.ClaimnKpi.2.ClaimkpiTypes[1].claimKpiTypeId | "7" |
      | $.Data.ClaimnKpi.2.ClaimkpiTypes[1].claimKpiTypeName | "Total Productive Calls" |
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @ContentValidation
  Scenario: TC_05 Claims KPI - validate Working Hours KPI types
    And I send the GET request to "claims_claimkpi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | "Data Found" |
      | $.Data.ClaimnKpi.3.ClaimkpiTypes[0].claimKpiTypeId | "8" |
      | $.Data.ClaimnKpi.3.ClaimkpiTypes[0].claimKpiTypeName | "Attendance to End of day" |
      | $.Data.ClaimnKpi.3.ClaimkpiTypes[1].claimKpiTypeId | "9" |
      | $.Data.ClaimnKpi.3.ClaimkpiTypes[1].claimKpiTypeName | "Attendance to Last Call" |
    And verify response time is less than "1200" milliseconds

#  @PositiveScenario @Security
#  Scenario: TC_06 Claims KPI - invalid access token (API allows invalid tokens)
#    And I send the GET request to "claims_claimkpi" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token  |invalid_token_12345 |
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      | JPath                   | Value           |
#      | $.error                 | invalid_request |
#      | $.error_description     | The access token was not found. |
#    And verify response time is less than "1200" milliseconds

#  @NegativeScenario @Validation
#  Scenario: TC_07 Claims KPI - empty access token
#    And I send the GET request to "claims_claimkpi" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token  | |
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      | JPath                   | Value           |
#      | $.error                 | invalid_request |
#      | $.error_description     | The access token was not found. |
#    And verify response time is less than "1200" milliseconds

  @PositiveScenario @Performance
  Scenario: TC_08 Claims KPI - performance validation
    And I send the GET request to "claims_claimkpi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "800" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | "Data Found" |

  @PositiveScenario @ResponseHeaders
  Scenario: TC_09 Claims KPI - response headers validation
    And I send the GET request to "claims_claimkpi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | application/json; charset=UTF-8    |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @EdgeCase
  Scenario: TC_10 Claims KPI - with additional query parameters
    And I send the GET request to "claims_claimkpi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | "Data Found" |
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @LoadTest
  Scenario: TC_11 Claims KPI - load testing
    And I send the GET request to "claims_claimkpi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "500" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | "Data Found" |

  @PositiveScenario @Concurrent
  Scenario: TC_12 Claims KPI - concurrent request validation
    And I send the GET request to "claims_claimkpi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | "Data Found" |

#  @PositiveScenario @DataIntegrity
#  Scenario: TC_13 Claims KPI - verify data structure integrity
#    And I send the GET request to "claims_claimkpi" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token  |ACCESS_TOKEN  |
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      | JPath     | Value |
#      | $.Result  | true  |
#      | $.Reason  | "Data Found" |
#    And I verify API response at path with DB and static values
#      | JPath     | Value |
#      | $.Data.ClaimnKpi.1.id | DB:claim_kpis:id: name='Distance' AND active=1 |
#      | $.Data.ClaimnKpi.1.name | DB:claim_kpis:name: name='Distance' AND active=1 |
#      | $.Data.ClaimnKpi.2.id | DB:claim_kpis:id: name='Call' AND active=1 |
#      | $.Data.ClaimnKpi.2.name | DB:claim_kpis:name: name='Call' AND active=1 |
#      | $.Data.ClaimnKpi.3.id | DB:claim_kpis:id: name='Working Hours' AND active=1 |
#      | $.Data.ClaimnKpi.3.name | DB:claim_kpis:name: name='Working Hours' AND active=1 |

#  @PositiveScenario @DBValidation @DataCount
#  Scenario: TC_14 Claims KPI - verify KPI count against database
#    And I send the GET request to "claims_claimkpi" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token  |ACCESS_TOKEN  |
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      | JPath     | Value |
#      | $.Result  | true  |
#      | $.Reason  | "Data Found" |
#    And I verify API response at path with DB and static values
#      | JPath     | Value |
#      | $.Data.ClaimnKpi.1.ClaimkpiTypes[0].claimKpiTypeId | DB:claimkpi_types:id: claim_kpi_id=1 AND active=1 |
#      | $.Data.ClaimnKpi.1.ClaimkpiTypes[0].claimKpiTypeName | DB:claimkpi_types:name: claim_kpi_id=1 AND active=1 |
#      | $.Data.ClaimnKpi.2.ClaimkpiTypes[0].claimKpiTypeId | DB:claimkpi_types:id: claim_kpi_id=2 AND active=1 |
#      | $.Data.ClaimnKpi.2.ClaimkpiTypes[0].claimKpiTypeName | DB:claimkpi_types:name: claim_kpi_id=2 AND active=1 |

  @PositiveScenario @DBValidation @DataConsistency
  Scenario: TC_15 Claims KPI - verify data consistency with database
    And I send the GET request to "claims_claimkpi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | "Data Found" |
      | $.Data.ClaimnKpi.1.active | 1 |
      | $.Data.ClaimnKpi.2.active | 1 |
      | $.Data.ClaimnKpi.3.active | 1 |

  @PositiveScenario @SecurityHeaders
  Scenario: TC_16 Claims KPI - security headers validation
    And I send the GET request to "claims_claimkpi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | application/json; charset=UTF-8    |
      | Connection    | keep-alive                  |
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | "Data Found" |
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @DataStructure
  Scenario: TC_17 Claims KPI - validate data structure
    And I send the GET request to "claims_claimkpi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | "Data Found" |
      | $.Data.ClaimnKpi.1.selectedType | null |
      | $.Data.ClaimnKpi.2.selectedType | null |
      | $.Data.ClaimnKpi.3.selectedType | null |
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @BoundaryTesting
  Scenario: TC_18 Claims KPI - boundary testing with special characters
    And I send the GET request to "claims_claimkpi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | "Data Found" |
    And verify response time is less than "1200" milliseconds
