@Retailer @Companieskyc @Sanity @allGet
Feature: This feature file contains testcases for GET endpoint getCompanyKycForm

  @CompanieskycPositive
  Scenario: TC_01 getCompanyKycForm - status code positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCompanyKycForm" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath                    | Value |
      | $.Result                 | "true" |
      | $.Reason                 | "" |
      | $.CompanyKyc.company_id  | "470212" |
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | application/json; charset=UTF-8    |
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "companyKycForm" name using full path

  @CompanieskycPositive
  Scenario: TC_02 getCompanyKycForm - verify response structure
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCompanyKycForm" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verifies the field is present in the response
      | JPath                    |
      | $.Result                 |
      | $.Reason                 |
      | $.CompanyKyc             |
      | $.CompanyKyc.company_id |
      | $.CompanyKyc.kycForm     |
    And verify response time is less than "1200" milliseconds
    And I store the response as "companyKycForm" name using full path

  @CompanieskycPositive
  Scenario: TC_03 getCompanyKycForm - verify data types
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCompanyKycForm" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response field data types
      | JPath                    | ExpectedType |
      | $.Result                 | string       |
      | $.Reason                 | string       |
      | $.CompanyKyc             | object       |
      | $.CompanyKyc.company_id  | string       |
      | $.CompanyKyc.kycForm     | null         |
    And verify response time is less than "1200" milliseconds
    And I store the response as "companyKycForm" name using full path

  @CompanieskycPositive
  Scenario: TC_04 getCompanyKycForm - verify business logic validation
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCompanyKycForm" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath                    | Value |
      | $.Result                 | "true" |
      | $.Reason                 | "" |
      | $.CompanyKyc.company_id  | "470212" |
      | $.CompanyKyc.kycForm     | null |
    And verify response time is less than "1200" milliseconds
    And I store the response as "companyKycForm" name using full path

  @Performance @Load
  Scenario: TC_05 getCompanyKycForm - verify API performance under normal load
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCompanyKycForm" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "800" milliseconds
    And I store the response as "companyKycForm" name using full path

  @BusinessLogic @DataIntegrity
  Scenario: TC_06 getCompanyKycForm - verify company KYC data consistency
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCompanyKycForm" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath                    | Value |
      | $.Result                 | "true" |
      | $.Reason                 | "" |
      | $.CompanyKyc.company_id  | "470212" |
    And I store the response as "companyKycForm" name using full path
