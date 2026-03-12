@Execution @BrandMDM  @MDM

Feature: All testcases of Brand MDM
  This feature covers both Upload and Update flows for Brand MDM.
  - Upload: `name` is mandatory.
  - Update: no fields are mandatory. If `id` is passed, mandatory checks are skipped; any other fields present will be updated for that id.
  # GET / basic fields verification
  # -------------------------------------------------------------------------
  # -------------------------------------------------------------------------
  # Upload: Mandatory field(s)
  # -------------------------------------------------------------------------
  @BrandTest2
  Scenario: BrandMDM:BrandTest2 - Upload - mandatory field name provided (positive)
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_brand_MDM" payload
      | JPath              | Value           |
      | data[0].name       | randomString    |
      | data[0].company_id | DB:companies:id |
      | data[1].name       | randomString    |
      | data[1].company_id | DB:companies:id |
    When I post the request with "insertMdmData_brand_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And verify response time is less than "3000" milliseconds

  @BrandTest3
  Scenario: BrandMDM:BrandTest3 - Upload - missing mandatory name (negative)
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_brand_MDM" payload
      | JPath              | Value           |
      | data[0].company_id | DB:companies:id |
      | data[1].company_id | DB:companies:id |
    When I post the request with "insertMdmData_brand_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath             | Value                                         |
      | Result            | false                                         |
      | Reason.1[0].Error | The name is required for creating the Brands. |
      | Reason.1[0].Error | The name is required for creating the Brands. |
    And verify response time is less than "10000" milliseconds

  # -------------------------------------------------------------------------
  # NAME validations: length & allowed characters
  # -------------------------------------------------------------------------
  @BrandTest4
  Scenario: BrandMDM:BrandTest4 - Name boundary positive - exactly 255 characters (positive)
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_brand_MDM" payload
      | JPath        | Value            |
      | data[0].name | randomString:255 |
      | data[1].name | randomString:255 |
    When I post the request with "insertMdmData_brand_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And verify response time is less than "10000" milliseconds

  @BrandTest5
  Scenario: BrandMDM:BrandTest5 - Name boundary negative - 256 characters (negative)
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_brand_MDM" payload
      | JPath        | Value            |
      | data[0].name | randomString:256 |
      | data[1].name | randomString:256 |
    When I post the request with "insertMdmData_brand_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath  | Value |
      | Result | false |
    And verifies the field is present in the response
      | JPath             |
      | Result            |
      | Reason.1[0].Error |
      | Reason.2[0].Error |
    And verify response time is less than "10000" milliseconds

  @BrandTest6
  Scenario: BrandMDM:BrandTest6 - Name allowed special characters & alphanumeric (positive)
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_brand_MDM" payload
      | JPath        | Value              |
      | data[0].name | randomAlphaNumeric |
      | data[1].name | randomAlphaNumeric |
    When I post the request with "insertMdmData_brand_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And verify response time is less than "3000" milliseconds

  @BrandTest7
  Scenario: BrandMDM:BrandTest7 - Name invalid characters (negative)
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_brand_MDM" payload
      | JPath        | Value          |
      | data[0].name | Bad@Brand#1!/  |
      | data[1].name | Another$Name%/ |
    When I post the request with "insertMdmData_brand_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath  | Value |
      | Result | false |
    And verifies the field is present in the response
      | JPath             |
      | Result            |
      | Reason.1[0].Error |
      | Reason.2[0].Error |
    And verify response time is less than "10000" milliseconds

  # -------------------------------------------------------------------------
  # Uniqueness checks: within sheet and vs DB
  # -------------------------------------------------------------------------
  @BrandTest8
  Scenario: BrandMDM:BrandTest8 - Duplicate name within DB (negative)
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_brand_MDM" payload
      | JPath        | Value                   |
      | data[0].name | DB:brands:name:status=1 |
      | data[1].name | DB:brands:name:status=1 |
    When I post the request with "insertMdmData_brand_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath             | Value                              |
      | Result            | false                              |
      | Reason.1[0].Error | Name already exists in the system. |
      | Reason.2[0].Error | Name already exists in the system. |
    And verify response time is less than "10000" milliseconds

  @BrandTest9
  Scenario: BrandMDM:BrandTest9 - Name -Decimal values
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_brand_MDM" payload
      | JPath        | Value        |
      | data[0].name | randomInt    |
      | data[1].name | randomDouble |
    When I post the request with "insertMdmData_brand_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And verify response time is less than "10000" milliseconds

  # -------------------------------------------------------------------------
  # company_id validations and addCompanyId function
  # -------------------------------------------------------------------------
  @BrandTest10 @BugFix
  Scenario: BrandMDM:BrandTest10 - company_id valid processed by addCompanyId (positive)
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_brand_MDM" payload
      | JPath              | Value        |
      | data[0].name       | randomString |
      | data[0].company_id | randomInt    |
      | data[1].name       | randomString |
      | data[1].company_id | randomDouble |
    When I post the request with "insertMdmData_brand_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath  | Value |
      | Result | false |
    And verifies the field is present in the response
      | JPath             |
      | Result            |
      | Reason.1[0].Error |
      | Reason.2[0].Error |
    And verify response time is less than "10000" milliseconds

  @BrandTest11 @BugFix
  Scenario: BrandMDM:BrandTest11 - company_id invalid or non-existent (negative)
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_brand_MDM" payload
      | JPath              | Value        |
      | data[0].name       | randomString |
      | data[0].company_id | -999999      |
      | data[1].name       | randomString |
      | data[1].company_id | 999999.0099  |
    When I post the request with "insertMdmData_brand_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath  | Value |
      | Result | false |
    And verifies the field is present in the response
      | JPath             |
      | Result            |
      | Reason.1[0].Error |
      | Reason.2[0].Error |
    And verify response time is less than "10000" milliseconds

  # -------------------------------------------------------------------------
  # Update flow tests (no mandatory fields)
  # -------------------------------------------------------------------------
  @BrandTest12
  Scenario: BrandMDM:BrandTest12 - Data verification by passing all the field avlues
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_brand_MDM" payload
      | JPath                      | Value           |
      | data[0].company_id         | DB:companies:id |
      | data[0].name               | randomString    |
      | data[0].status             | 1               |
      | data[0].isvisible_retailer | 1               |
      | data[0].erp_id             | randomString    |
      | data[0].sequence           | 1               |
      | data[1].company_id         | DB:companies:id |
      | data[1].name               | randomString    |
      | data[1].status             | 1               |
      | data[1].isvisible_retailer | 1               |
      | data[1].erp_id             | randomString    |
      | data[1].sequence           | 1               |
    When I post the request with "insertMdmData_brand_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And verify response time is less than "10000" milliseconds
    And I verify the data got updated as needed from DB
      | expectedColumn                                                | expectedValue |
      | DB:brands:name: id=(SELECT MAX(id) FROM brands)               | randomString  |
      | DB:brands:company_id: id=(SELECT MAX(id) FROM brands)         | randomString  |
      | DB:brands:status: id=(SELECT MAX(id) FROM brands)             | true          |
      | DB:brands:isvisible_retailer: id=(SELECT MAX(id) FROM brands) | true          |
      | DB:brands:erp_id: id=(SELECT MAX(id) FROM brands)             | randomString  |
      | DB:brands:sequence: id=(SELECT MAX(id) FROM brands)           | 1             |

  @BrandTest13
  Scenario: BrandMDM:BrandTest13 - Data verification by passing all the field values -For update
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_brand_MDM" payload
      | JPath                      | Value                                         |
      | data[0].brand_id           | DB:brands:id: id=(SELECT MAX(id) FROM brands) |
      | data[0].company_id         | DB:companies:id                               |
      | data[0].name               | randomString                                  |
      | data[0].status             | 1                                             |
      | data[0].isvisible_retailer | 1                                             |
      | data[0].erp_id             | randomString                                  |
      | data[0].sequence           | 1                                             |
      | data[1].brand_id           | DB:brands:id: id=(SELECT MAX(id) FROM brands) |
      | data[1].company_id         | DB:companies:id                               |
      | data[1].name               | randomString                                  |
      | data[1].status             | 1                                             |
      | data[1].isvisible_retailer | 1                                             |
      | data[1].erp_id             | randomString                                  |
      | data[1].sequence           | 1                                             |
    When I post the request with "insertMdmData_brand_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And verify response time is less than "3000" milliseconds
    And I verify the data got updated as needed from DB
      | expectedColumn                                                | expectedValue |
      | DB:brands:name: id=(SELECT MAX(id) FROM brands)               | randomString  |
      | DB:brands:company_id: id=(SELECT MAX(id) FROM brands)         | randomString  |
      | DB:brands:status: id=(SELECT MAX(id) FROM brands)             | true          |
      | DB:brands:isvisible_retailer: id=(SELECT MAX(id) FROM brands) | true          |
      | DB:brands:erp_id: id=(SELECT MAX(id) FROM brands)             | randomString  |
      | DB:brands:sequence: id=(SELECT MAX(id) FROM brands)           | 1             |

  @BrandTest14
  Scenario: BrandMDM:BrandTest14 - Update with only id provided (per rules: allowed — positive)-No mandatory check
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_brand_MDM" payload
      | JPath            | Value                 |
      | data[0].brand_id | DB:brands:id:status=1 |
      | data[1].brand_id | DB:brands:id:status=0 |
    When I post the request with "insertMdmData_brand_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    # Per provided rule: update should not enforce mandatory on id; treat as valid
    And the fields in response should match with expected values
      | JPath  | Value |
      | Result | false |
    And verifies the field is present in the response
      | JPath             |
      | Result            |
      | Reason.1[0].Error |
      | Reason.2[0].Error |
    And verify response time is less than "10000" milliseconds

  @BrandTest15
  Scenario: BrandMDM:BrandTest15 - Update with only id provided (per rules: allowed — positive)-No mandatory check
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_brand_MDM" payload
      | JPath            | Value                 |
      | data[0].brand_id | DB:brands:id:status=1 |
      | data[0].name     | randomString          |
      | data[1].brand_id | DB:brands:id:status=0 |
      | data[1].name     | randomString          |
    When I post the request with "insertMdmData_brand_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And I verify the data got updated as needed from DB
      | expectedColumn          | expectedValue |
      | DB:brands:name:status=1 | randomString  |
      | DB:brands:name:status=0 | randomString  |
    And verify response time is less than "10000" milliseconds

  # -------------------------------------------------------------------------
  # Defaults & validations for status and isvisible_retailer
  # -------------------------------------------------------------------------
  @BrandTest16
  Scenario: BrandMDM:BrandTest16 - status defaults to 1 when not provided (positive)
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_brand_MDM" payload
      | JPath        | Value        |
      | data[0].name | randomString |
      | data[1].name | randomString |
    When I post the request with "insertMdmData_brand_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And I verify the data got updated as needed from DB
      | expectedColumn                                    | expectedValue |
      | DB:brands:status: id=(SELECT MAX(id) FROM brands) | true          |
    And verify response time is less than "10000" milliseconds

  @BrandTest17
  Scenario: BrandMDM:BrandTest17 - isvisible_retailer default -Not passed
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_brand_MDM" payload
      | JPath        | Value        |
      | data[0].name | randomString |
      | data[1].name | randomString |
    When I post the request with "insertMdmData_brand_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath  | Value |
      | Result | true  |
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And I verify the data got updated as needed from DB
      | expectedColumn                                                | expectedValue |
      | DB:brands:isvisible_retailer: id=(SELECT MAX(id) FROM brands) | true          |
    And verify response time is less than "10000" milliseconds

  @BrandTest31
  Scenario: BrandMDM:BrandTest31 - isvisible_retailer default -valid values 0 and 1 passed
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_brand_MDM" payload
      | JPath                      | Value        |
      | data[0].name               | randomString |
      | data[0].isvisible_retailer | 1            |
      | data[1].name               | randomString |
      | data[1].isvisible_retailer | 0            |
    When I post the request with "insertMdmData_brand_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath  | Value |
      | Result | true  |
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And I verify the data got updated as needed from DB
      | expectedColumn                                                | expectedValue |
      | DB:brands:isvisible_retailer: id=(SELECT MAX(id) FROM brands) | false         |
    And verify response time is less than "10000" milliseconds

  @BrandTest18
  Scenario: BrandMDM:BrandTest18 - isvisible_retailer default -invalid values
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_brand_MDM" payload
      | JPath                      | Value        |
      | data[0].name               | randomString |
      | data[0].isvisible_retailer | 2            |
      | data[1].name               | randomString |
      | data[1].isvisible_retailer | alphabets    |
    When I post the request with "insertMdmData_brand_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath  | Value |
      | Result | false |
    And verify response time is less than "10000" milliseconds

  @BrandTest19
  Scenario: BrandMDM:BrandTest19 - isvisible_retailer  -invalid values
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_brand_MDM" payload
      | JPath                      | Value              |
      | data[0].name               | randomString       |
      | data[0].isvisible_retailer | -1                 |
      | data[1].name               | randomString       |
      | data[1].isvisible_retailer | randomAlphaNumeric |
    When I post the request with "insertMdmData_brand_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath  | Value |
      | Result | false |
    And verifies the field is present in the response
      | JPath             |
      | Result            |
      | Reason.1[0].Error |
      | Reason.2[0].Error |
    And verify response time is less than "3000" milliseconds

  @BrandTest20
  Scenario: BrandMDM:BrandTest20 - status  -valid values 0 and 1 passed
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_brand_MDM" payload
      | JPath          | Value        |
      | data[0].name   | randomString |
      | data[0].status | 1            |
      | data[1].name   | randomString |
      | data[1].status | 0            |
    When I post the request with "insertMdmData_brand_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath  | Value |
      | Result | true  |
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And I verify the data got updated as needed from DB
      | expectedColumn                                    | expectedValue |
      | DB:brands:status: id=(SELECT MAX(id) FROM brands) | false         |
      | DB:brands:status: id<(SELECT MAX(id) FROM brands) | true          |

    And verify response time is less than "10000" milliseconds

  @BrandTest21
  Scenario: BrandMDM:BrandTest21 - status  -invalid values
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_brand_MDM" payload
      | JPath          | Value        |
      | data[0].name   | randomString |
      | data[0].status | 2            |
      | data[1].name   | randomString |
      | data[1].status | alphabets    |
    When I post the request with "insertMdmData_brand_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath  | Value |
      | Result | false |
    And the fields in response should match with expected values
      | JPath  | Value |
      | Result | false |
    And verifies the field is present in the response
      | JPath             |
      | Result            |
      | Reason.1[0].Error |
      | Reason.2[0].Error |
    And verify response time is less than "3000" milliseconds

  @BrandTest22
  Scenario: BrandMDM:BrandTest22 - status  -invalid values
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_brand_MDM" payload
      | JPath          | Value              |
      | data[0].name   | randomString       |
      | data[0].status | -1                 |
      | data[1].name   | randomString       |
      | data[1].status | randomAlphaNumeric |
    When I post the request with "insertMdmData_brand_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath  | Value |
      | Result | false |
    And verifies the field is present in the response
      | JPath             |
      | Result            |
      | Reason.1[0].Error |
      | Reason.2[0].Error |
    And verify response time is less than "10000" milliseconds

  @BrandTest23
  Scenario: BrandMDM:BrandTest23 - Reject SQL-injection-like name values (negative)
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_brand_MDM" payload
      | JPath              | Value                      |
      | data[0].name       | "'; DROP TABLE brands; --" |
      | data[0].company_id | DB:companies:id            |
      | JPath              | Value                      |
      | data[0].name       | "'; DROP TABLE brands; --" |
      | data[0].company_id | DB:companies:id            |
    When I post the request with "insertMdmData_brand_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath  | Value |
      | Result | false |
    And verify response time is less than "10000" milliseconds

  @BrandTest24
  Scenario: BrandMDM:BrandTest24 - Mixed create and update rows in one upload (positive)
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_brand_MDM" payload
      | JPath            | Value                 |
      | data[0].name     | randomString        |
      | data[1].brand_id | DB:brands:id:status=0 |
      | data[1].name     | randomString       |
    When I post the request with "insertMdmData_brand_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And I verify the data got updated as needed from DB
      | expectedColumn                                  | expectedValue   |
      | DB:brands:name: id=(SELECT MAX(id) FROM brands) | randomString  |
      | DB:brands:name: status=0                        | randomString |
    And verify response time is less than "10000" milliseconds

  @BrandTest25
  Scenario: BrandMDM:BrandTest25 - Bulk upload - mixed valid and invalid rows (functional/stress)
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertBulkMdmData_brand_MDM" payload
      | JPath          | Value        |
      | data[0].name   | randomString |
      | data[1].name   | randomString |
      | data[2].name   | randomString |
      | data[3].name   | randomString |
      | data[4].name   | randomString |
      | data[5].name   | randomString |
      | data[6].name   | randomString |
      | data[7].name   | randomString |
      | data[8].name   | randomString |
      | data[9].name   | randomString |
      | data[10].name  | randomString |
      | data[11].name  | randomString |
      | data[12].name  | randomString |
      | data[13].name  | randomString |
      | data[14].name  | randomString |
      | data[15].name  | randomString |
      | data[16].name  | randomString |
      | data[17].name  | randomString |
      | data[18].name  | randomString |
      | data[19].name  | randomString |
      | data[20].name  | randomString |
      | data[21].name  | randomString |
      | data[22].name  | randomString |
      | data[23].name  | randomString |
      | data[24].name  | randomString |
      | data[25].name  | randomString |
      | data[26].name  | randomString |
      | data[27].name  | randomString |
      | data[28].name  | randomString |
      | data[29].name  | randomString |
      | data[30].name  | randomString |
      | data[31].name  | randomString |
      | data[32].name  | randomString |
      | data[33].name  | randomString |
      | data[34].name  | randomString |
      | data[35].name  | randomString |
      | data[36].name  | randomString |
      | data[37].name  | randomString |
      | data[38].name  | randomString |
      | data[39].name  | randomString |
      | data[40].name  | randomString |
      | data[41].name  | randomString |
      | data[42].name  | randomString |
      | data[43].name  | randomString |
      | data[44].name  | randomString |
      | data[45].name  | randomString |
      | data[46].name  | randomString |
      | data[47].name  | randomString |
      | data[48].name  | randomString |
      | data[49].name  | randomString |
      | data[50].name  | randomString |
      | data[51].name  | randomString |
      | data[52].name  | randomString |
      | data[53].name  | randomString |
      | data[54].name  | randomString |
      | data[55].name  | randomString |
      | data[56].name  | randomString |
      | data[57].name  | randomString |
      | data[58].name  | randomString |
      | data[59].name  | randomString |
      | data[60].name  | randomString |
      | data[61].name  | randomString |
      | data[62].name  | randomString |
      | data[63].name  | randomString |
      | data[64].name  | randomString |
      | data[65].name  | randomString |
      | data[66].name  | randomString |
      | data[67].name  | randomString |
      | data[68].name  | randomString |
      | data[69].name  | randomString |
      | data[70].name  | randomString |
      | data[71].name  | randomString |
      | data[72].name  | randomString |
      | data[73].name  | randomString |
      | data[74].name  | randomString |
      | data[75].name  | randomString |
      | data[76].name  | randomString |
      | data[77].name  | randomString |
      | data[78].name  | randomString |
      | data[79].name  | randomString |
      | data[80].name  | randomString |
      | data[81].name  | randomString |
      | data[82].name  | randomString |
      | data[83].name  | randomString |
      | data[84].name  | randomString |
      | data[85].name  | randomString |
      | data[86].name  | randomString |
      | data[87].name  | randomString |
      | data[88].name  | randomString |
      | data[89].name  | randomString |
      | data[90].name  | randomString |
      | data[91].name  | randomString |
      | data[92].name  | randomString |
      | data[93].name  | randomString |
      | data[94].name  | randomString |
      | data[95].name  | randomString |
      | data[96].name  | randomString |
      | data[97].name  | randomString |
      | data[98].name  | randomString |
      | data[99].name  | randomString |
      | data[100].name | randomString |
      | data[101].name | randomString |
      | data[102].name | randomString |
      | data[103].name | randomString |
      | data[104].name | randomString |
      | data[105].name | randomString |
      | data[106].name | randomString |
      | data[107].name | randomString |
      | data[108].name | randomString |
      | data[109].name | randomString |
      | data[110].name | randomString |
      | data[111].name | randomString |
      | data[112].name | randomString |
      | data[113].name | randomString |
      | data[114].name | randomString |
      | data[115].name | randomString |
      | data[116].name | randomString |
      | data[117].name | randomString |
      | data[118].name | randomString |
      | data[119].name | randomString |
      | data[120].name | randomString |
      | data[121].name | randomString |
      | data[122].name | randomString |
      | data[123].name | randomString |
      | data[124].name | randomString |
      | data[125].name | randomString |
      | data[126].name | randomString |
      | data[127].name | randomString |
      | data[128].name | randomString |
      | data[129].name | randomString |
      | data[130].name | randomString |
      | data[131].name | randomString |
      | data[132].name | randomString |
      | data[133].name | randomString |
      | data[134].name | randomString |
      | data[135].name | randomString |
      | data[136].name | randomString |
      | data[137].name | randomString |
      | data[138].name | randomString |
      | data[139].name | randomString |
      | data[140].name | randomString |
      | data[141].name | randomString |
      | data[142].name | randomString |
      | data[143].name | randomString |
      | data[144].name | randomString |
      | data[145].name | randomString |
      | data[146].name | randomString |
      | data[147].name | randomString |
      | data[148].name | randomString |
      | data[149].name | randomString |
      | data[150].name | randomString |
      | data[151].name | randomString |
      | data[152].name | randomString |
      | data[153].name | randomString |
      | data[154].name | randomString |
      | data[155].name | randomString |
      | data[156].name | randomString |
      | data[157].name | randomString |
      | data[158].name | randomString |
      | data[159].name | randomString |
      | data[160].name | randomString |
      | data[161].name | randomString |
      | data[162].name | randomString |
      | data[163].name | randomString |
      | data[164].name | randomString |
      | data[165].name | randomString |
      | data[166].name | randomString |
      | data[167].name | randomString |
      | data[168].name | randomString |
      | data[169].name | randomString |
      | data[170].name | randomString |
      | data[171].name | randomString |
      | data[172].name | randomString |
      | data[173].name | randomString |
      | data[174].name | randomString |
      | data[175].name | randomString |
      | data[176].name | randomString |
      | data[177].name | randomString |
      | data[178].name | randomString |
      | data[179].name | randomString |
      | data[180].name | randomString |
      | data[181].name | randomString |
      | data[182].name | randomString |
      | data[183].name | randomString |
      | data[184].name | randomString |
      | data[185].name | randomString |
      | data[186].name | randomString |
      | data[187].name | randomString |
      | data[188].name | randomString |
      | data[189].name | randomString |
      | data[190].name | randomString |
      | data[191].name | randomString |
      | data[192].name | randomString |
      | data[193].name | randomString |
      | data[194].name | randomString |
      | data[195].name | randomString |
      | data[196].name | randomString |
      | data[197].name | randomString |
      | data[198].name | randomString |
      | data[199].name | randomString |
      | data[200].name | randomString |
      | data[201].name | randomString |
      | data[202].name | randomString |
      | data[203].name | randomString |
      | data[204].name | randomString |
      | data[205].name | randomString |
      | data[206].name | randomString |
      | data[207].name | randomString |
      | data[208].name | randomString |
      | data[209].name | randomString |
      | data[210].name | randomString |
      | data[211].name | randomString |
      | data[212].name | randomString |
      | data[213].name | randomString |
      | data[214].name | randomString |
      | data[215].name | randomString |
      | data[216].name | randomString |
      | data[217].name | randomString |
      | data[218].name | randomString |
      | data[219].name | randomString |
      | data[220].name | randomString |
      | data[221].name | randomString |
      | data[222].name | randomString |
      | data[223].name | randomString |
      | data[224].name | randomString |
      | data[225].name | randomString |
      | data[226].name | randomString |
      | data[227].name | randomString |
      | data[228].name | randomString |
      | data[229].name | randomString |
      | data[230].name | randomString |
      | data[231].name | randomString |
      | data[232].name | randomString |
      | data[233].name | randomString |
      | data[234].name | randomString |
      | data[235].name | randomString |
      | data[236].name | randomString |
      | data[237].name | randomString |
      | data[238].name | randomString |
      | data[239].name | randomString |
      | data[240].name | randomString |
      | data[241].name | randomString |
      | data[242].name | randomString |
      | data[243].name | randomString |
      | data[244].name | randomString |
      | data[245].name | randomString |
      | data[246].name | randomString |
      | data[247].name | randomString |
      | data[248].name | randomString |
      | data[249].name | randomString |
      | data[250].name | randomString |
      | data[251].name | randomString |
      | data[252].name | randomString |
      | data[253].name | randomString |
      | data[254].name | randomString |
      | data[255].name | randomString |
      | data[256].name | randomString |
      | data[257].name | randomString |
      | data[258].name | randomString |
      | data[259].name | randomString |
      | data[260].name | randomString |
      | data[261].name | randomString |
      | data[262].name | randomString |
      | data[263].name | randomString |
      | data[264].name | randomString |
      | data[265].name | randomString |
      | data[266].name | randomString |
      | data[267].name | randomString |
      | data[268].name | randomString |
      | data[269].name | randomString |
      | data[270].name | randomString |
      | data[271].name | randomString |
      | data[272].name | randomString |
      | data[273].name | randomString |
      | data[274].name | randomString |
      | data[275].name | randomString |
      | data[276].name | randomString |
      | data[277].name | randomString |
      | data[278].name | randomString |
      | data[279].name | randomString |
      | data[280].name | randomString |
      | data[281].name | randomString |
      | data[282].name | randomString |
      | data[283].name | randomString |
      | data[284].name | randomString |
      | data[285].name | randomString |
      | data[286].name | randomString |
      | data[287].name | randomString |
      | data[288].name | randomString |
      | data[289].name | randomString |
      | data[290].name | randomString |
      | data[291].name | randomString |
      | data[292].name | randomString |
      | data[293].name | randomString |
      | data[294].name | randomString |
      | data[295].name | randomString |
      | data[296].name | randomString |
      | data[297].name | randomString |
      | data[298].name | randomString |
      | data[299].name | randomString |
      | data[300].name | randomString |
      | data[301].name | randomString |
      | data[302].name | randomString |
      | data[303].name | randomString |
      | data[304].name | randomString |
      | data[305].name | randomString |
      | data[306].name | randomString |
      | data[307].name | randomString |
      | data[308].name | randomString |
      | data[309].name | randomString |
      | data[310].name | randomString |
      | data[311].name | randomString |
      | data[312].name | randomString |
      | data[313].name | randomString |
      | data[314].name | randomString |
      | data[315].name | randomString |
      | data[316].name | randomString |
      | data[317].name | randomString |
      | data[318].name | randomString |
      | data[319].name | randomString |
      | data[320].name | randomString |
      | data[321].name | randomString |
      | data[322].name | randomString |
      | data[323].name | randomString |
      | data[324].name | randomString |
      | data[325].name | randomString |
      | data[326].name | randomString |
      | data[327].name | randomString |
      | data[328].name | randomString |
      | data[329].name | randomString |
      | data[330].name | randomString |
      | data[331].name | randomString |
      | data[332].name | randomString |
      | data[333].name | randomString |
      | data[334].name | randomString |
      | data[335].name | randomString |
      | data[336].name | randomString |
      | data[337].name | randomString |
      | data[338].name | randomString |
      | data[339].name | randomString |
      | data[340].name | randomString |
      | data[341].name | randomString |
      | data[342].name | randomString |
      | data[343].name | randomString |
      | data[344].name | randomString |
      | data[345].name | randomString |
      | data[346].name | randomString |
      | data[347].name | randomString |
      | data[348].name | randomString |
      | data[349].name | randomString |
      | data[350].name | randomString |
      | data[351].name | randomString |
      | data[352].name | randomString |
      | data[353].name | randomString |
      | data[354].name | randomString |
      | data[355].name | randomString |
      | data[356].name | randomString |
      | data[357].name | randomString |
      | data[358].name | randomString |
      | data[359].name | randomString |
      | data[360].name | randomString |
      | data[361].name | randomString |
      | data[362].name | randomString |
      | data[363].name | randomString |
      | data[364].name | randomString |
      | data[365].name | randomString |
      | data[366].name | randomString |
      | data[367].name | randomString |
      | data[368].name | randomString |
      | data[369].name | randomString |
      | data[370].name | randomString |
      | data[371].name | randomString |
      | data[372].name | randomString |
      | data[373].name | randomString |
      | data[374].name | randomString |
      | data[375].name | randomString |
      | data[376].name | randomString |
      | data[377].name | randomString |
      | data[378].name | randomString |
      | data[379].name | randomString |
      | data[380].name | randomString |
      | data[381].name | randomString |
      | data[382].name | randomString |
      | data[383].name | randomString |
      | data[384].name | randomString |
      | data[385].name | randomString |
      | data[386].name | randomString |
      | data[387].name | randomString |
      | data[388].name | randomString |
      | data[389].name | randomString |
      | data[390].name | randomString |
      | data[391].name | randomString |
      | data[392].name | randomString |
      | data[393].name | randomString |
      | data[394].name | randomString |
      | data[395].name | randomString |
      | data[396].name | randomString |
      | data[397].name | randomString |
      | data[398].name | randomString |
      | data[399].name | randomString |
      | data[400].name | randomString |
      | data[401].name | randomString |
      | data[402].name | randomString |
      | data[403].name | randomString |
      | data[404].name | randomString |
      | data[405].name | randomString |
      | data[406].name | randomString |
      | data[407].name | randomString |
      | data[408].name | randomString |
      | data[409].name | randomString |
      | data[410].name | randomString |
      | data[411].name | randomString |
      | data[412].name | randomString |
      | data[413].name | randomString |
      | data[414].name | randomString |
      | data[415].name | randomString |
      | data[416].name | randomString |
      | data[417].name | randomString |
      | data[418].name | randomString |
      | data[419].name | randomString |
      | data[420].name | randomString |
      | data[421].name | randomString |
      | data[422].name | randomString |
      | data[423].name | randomString |
      | data[424].name | randomString |
      | data[425].name | randomString |
      | data[426].name | randomString |
      | data[427].name | randomString |
      | data[428].name | randomString |
      | data[429].name | randomString |
      | data[430].name | randomString |
      | data[431].name | randomString |
      | data[432].name | randomString |
      | data[433].name | randomString |
      | data[434].name | randomString |
      | data[435].name | randomString |
      | data[436].name | randomString |
      | data[437].name | randomString |
      | data[438].name | randomString |
      | data[439].name | randomString |
      | data[440].name | randomString |
      | data[441].name | randomString |
      | data[442].name | randomString |
      | data[443].name | randomString |
      | data[444].name | randomString |
      | data[445].name | randomString |
      | data[446].name | randomString |
      | data[447].name | randomString |
      | data[448].name | randomString |
      | data[449].name | randomString |
      | data[450].name | randomString |
      | data[451].name | randomString |
      | data[452].name | randomString |
      | data[453].name | randomString |
      | data[454].name | randomString |
      | data[455].name | randomString |
      | data[456].name | randomString |
      | data[457].name | randomString |
      | data[458].name | randomString |
      | data[459].name | randomString |
      | data[460].name | randomString |
      | data[461].name | randomString |
      | data[462].name | randomString |
      | data[463].name | randomString |
      | data[464].name | randomString |
      | data[465].name | randomString |
      | data[466].name | randomString |
      | data[467].name | randomString |
      | data[468].name | randomString |
      | data[469].name | randomString |
      | data[470].name | randomString |
      | data[471].name | randomString |
      | data[472].name | randomString |
      | data[473].name | randomString |
      | data[474].name | randomString |
      | data[475].name | randomString |
      | data[476].name | randomString |
      | data[477].name | randomString |
      | data[478].name | randomString |
      | data[479].name | randomString |
      | data[480].name | randomString |
      | data[481].name | randomString |
      | data[482].name | randomString |
      | data[483].name | randomString |
      | data[484].name | randomString |
      | data[485].name | randomString |
      | data[486].name | randomString |
      | data[487].name | randomString |
      | data[488].name | randomString |
      | data[489].name | randomString |
      | data[490].name | randomString |
      | data[491].name | randomString |
      | data[492].name | randomString |
      | data[493].name | randomString |
      | data[494].name | randomString |
      | data[495].name | randomString |
      | data[496].name | randomString |
      | data[497].name | randomString |
      | data[498].name | randomString |
      | data[499].name | randomString |
      | data[500].name | randomString |
      | data[501].name | randomString |
      | data[502].name | randomString |
      | data[503].name | randomString |
      | data[504].name | randomString |
      | data[505].name | randomString |
      | data[506].name | randomString |
      | data[507].name | randomString |
      | data[508].name | randomString |
      | data[509].name | randomString |
      | data[510].name | randomString |
      | data[511].name | randomString |
      | data[512].name | randomString |
      | data[513].name | randomString |
      | data[514].name | randomString |
      | data[515].name | randomString |
      | data[516].name | randomString |
      | data[517].name | randomString |
      | data[518].name | randomString |
      | data[519].name | randomString |
      | data[520].name | randomString |
      | data[521].name | randomString |
      | data[522].name | randomString |
      | data[523].name | randomString |
      | data[524].name | randomString |
      | data[525].name | randomString |
      | data[526].name | randomString |
      | data[527].name | randomString |
      | data[528].name | randomString |
      | data[529].name | randomString |
      | data[530].name | randomString |
      | data[531].name | randomString |
      | data[532].name | randomString |
      | data[533].name | randomString |
      | data[534].name | randomString |
      | data[535].name | randomString |
      | data[536].name | randomString |
      | data[537].name | randomString |
      | data[538].name | randomString |
      | data[539].name | randomString |
      | data[540].name | randomString |
      | data[541].name | randomString |
      | data[542].name | randomString |
      | data[543].name | randomString |
      | data[544].name | randomString |
      | data[545].name | randomString |
      | data[546].name | randomString |
      | data[547].name | randomString |
      | data[548].name | randomString |
      | data[549].name | randomString |
      | data[550].name | randomString |
      | data[551].name | randomString |
      | data[552].name | randomString |
      | data[553].name | randomString |
      | data[554].name | randomString |
      | data[555].name | randomString |
      | data[556].name | randomString |
      | data[557].name | randomString |
      | data[558].name | randomString |
      | data[559].name | randomString |
      | data[560].name | randomString |
      | data[561].name | randomString |
      | data[562].name | randomString |
      | data[563].name | randomString |
      | data[564].name | randomString |
      | data[565].name | randomString |
      | data[566].name | randomString |
      | data[567].name | randomString |
      | data[568].name | randomString |
      | data[569].name | randomString |
      | data[570].name | randomString |
      | data[571].name | randomString |
      | data[572].name | randomString |
      | data[573].name | randomString |
      | data[574].name | randomString |
      | data[575].name | randomString |
      | data[576].name | randomString |
      | data[577].name | randomString |
      | data[578].name | randomString |
      | data[579].name | randomString |
      | data[580].name | randomString |
      | data[581].name | randomString |
      | data[582].name | randomString |
      | data[583].name | randomString |
      | data[584].name | randomString |
      | data[585].name | randomString |
      | data[586].name | randomString |
      | data[587].name | randomString |
      | data[588].name | randomString |
      | data[589].name | randomString |
      | data[590].name | randomString |
      | data[591].name | randomString |
      | data[592].name | randomString |
      | data[593].name | randomString |
      | data[594].name | randomString |
      | data[595].name | randomString |
      | data[596].name | randomString |
      | data[597].name | randomString |
      | data[598].name | randomString |
      | data[599].name | randomString |
      | data[600].name | randomString |
      | data[601].name | randomString |
      | data[602].name | randomString |
      | data[603].name | randomString |
      | data[604].name | randomString |
      | data[605].name | randomString |
      | data[606].name | randomString |
      | data[607].name | randomString |
      | data[608].name | randomString |
      | data[609].name | randomString |
      | data[610].name | randomString |
      | data[611].name | randomString |
      | data[612].name | randomString |
      | data[613].name | randomString |
      | data[614].name | randomString |
      | data[615].name | randomString |
      | data[616].name | randomString |
      | data[617].name | randomString |
      | data[618].name | randomString |
      | data[619].name | randomString |
      | data[620].name | randomString |
      | data[621].name | randomString |
      | data[622].name | randomString |
      | data[623].name | randomString |
      | data[624].name | randomString |
      | data[625].name | randomString |
      | data[626].name | randomString |
      | data[627].name | randomString |
      | data[628].name | randomString |
      | data[629].name | randomString |
      | data[630].name | randomString |
      | data[631].name | randomString |
      | data[632].name | randomString |
      | data[633].name | randomString |
      | data[634].name | randomString |
      | data[635].name | randomString |
      | data[636].name | randomString |
      | data[637].name | randomString |
      | data[638].name | randomString |
      | data[639].name | randomString |
      | data[640].name | randomString |
      | data[641].name | randomString |
      | data[642].name | randomString |
      | data[643].name | randomString |
      | data[644].name | randomString |
      | data[645].name | randomString |
      | data[646].name | randomString |
      | data[647].name | randomString |
      | data[648].name | randomString |
      | data[649].name | randomString |
      | data[650].name | randomString |
      | data[651].name | randomString |
      | data[652].name | randomString |
      | data[653].name | randomString |
      | data[654].name | randomString |
      | data[655].name | randomString |
      | data[656].name | randomString |
      | data[657].name | randomString |
      | data[658].name | randomString |
      | data[659].name | randomString |
      | data[660].name | randomString |
      | data[661].name | randomString |
      | data[662].name | randomString |
      | data[663].name | randomString |
      | data[664].name | randomString |
      | data[665].name | randomString |
      | data[666].name | randomString |
      | data[667].name | randomString |
      | data[668].name | randomString |
      | data[669].name | randomString |
      | data[670].name | randomString |
      | data[671].name | randomString |
      | data[672].name | randomString |
      | data[673].name | randomString |
      | data[674].name | randomString |
      | data[675].name | randomString |
      | data[676].name | randomString |
      | data[677].name | randomString |
      | data[678].name | randomString |
      | data[679].name | randomString |
      | data[680].name | randomString |
      | data[681].name | randomString |
      | data[682].name | randomString |
      | data[683].name | randomString |
      | data[684].name | randomString |
      | data[685].name | randomString |
      | data[686].name | randomString |
      | data[687].name | randomString |
      | data[688].name | randomString |
      | data[689].name | randomString |
      | data[690].name | randomString |
      | data[691].name | randomString |
      | data[692].name | randomString |
      | data[693].name | randomString |
      | data[694].name | randomString |
      | data[695].name | randomString |
      | data[696].name | randomString |
      | data[697].name | randomString |
      | data[698].name | randomString |
      | data[699].name | randomString |
      | data[700].name | randomString |
      | data[701].name | randomString |
      | data[702].name | randomString |
      | data[703].name | randomString |
      | data[704].name | randomString |
      | data[705].name | randomString |
      | data[706].name | randomString |
      | data[707].name | randomString |
      | data[708].name | randomString |
      | data[709].name | randomString |
      | data[710].name | randomString |
      | data[711].name | randomString |
      | data[712].name | randomString |
      | data[713].name | randomString |
      | data[714].name | randomString |
      | data[715].name | randomString |
      | data[716].name | randomString |
      | data[717].name | randomString |
      | data[718].name | randomString |
      | data[719].name | randomString |
      | data[720].name | randomString |
      | data[721].name | randomString |
      | data[722].name | randomString |
      | data[723].name | randomString |
      | data[724].name | randomString |
      | data[725].name | randomString |
      | data[726].name | randomString |
      | data[727].name | randomString |
      | data[728].name | randomString |
      | data[729].name | randomString |
      | data[730].name | randomString |
      | data[731].name | randomString |
      | data[732].name | randomString |
      | data[733].name | randomString |
      | data[734].name | randomString |
      | data[735].name | randomString |
      | data[736].name | randomString |
      | data[737].name | randomString |
      | data[738].name | randomString |
      | data[739].name | randomString |
      | data[740].name | randomString |
      | data[741].name | randomString |
      | data[742].name | randomString |
      | data[743].name | randomString |
      | data[744].name | randomString |
      | data[745].name | randomString |
      | data[746].name | randomString |
      | data[747].name | randomString |
      | data[748].name | randomString |
      | data[749].name | randomString |
      | data[750].name | randomString |
      | data[751].name | randomString |
      | data[752].name | randomString |
      | data[753].name | randomString |
      | data[754].name | randomString |
      | data[755].name | randomString |
      | data[756].name | randomString |
      | data[757].name | randomString |
      | data[758].name | randomString |
      | data[759].name | randomString |
      | data[760].name | randomString |
      | data[761].name | randomString |
      | data[762].name | randomString |
      | data[763].name | randomString |
      | data[764].name | randomString |
      | data[765].name | randomString |
      | data[766].name | randomString |
      | data[767].name | randomString |
      | data[768].name | randomString |
      | data[769].name | randomString |
      | data[770].name | randomString |
      | data[771].name | randomString |
      | data[772].name | randomString |
      | data[773].name | randomString |
      | data[774].name | randomString |
      | data[775].name | randomString |
      | data[776].name | randomString |
      | data[777].name | randomString |
      | data[778].name | randomString |
      | data[779].name | randomString |
      | data[780].name | randomString |
      | data[781].name | randomString |
      | data[782].name | randomString |
      | data[783].name | randomString |
      | data[784].name | randomString |
      | data[785].name | randomString |
      | data[786].name | randomString |
      | data[787].name | randomString |
      | data[788].name | randomString |
      | data[789].name | randomString |
      | data[790].name | randomString |
      | data[791].name | randomString |
      | data[792].name | randomString |
      | data[793].name | randomString |
      | data[794].name | randomString |
      | data[795].name | randomString |
      | data[796].name | randomString |
      | data[797].name | randomString |
      | data[798].name | randomString |
      | data[799].name | randomString |
      | data[800].name | randomString |
      | data[801].name | randomString |
      | data[802].name | randomString |
      | data[803].name | randomString |
      | data[804].name | randomString |
      | data[805].name | randomString |
      | data[806].name | randomString |
      | data[807].name | randomString |
      | data[808].name | randomString |
      | data[809].name | randomString |
      | data[810].name | randomString |
      | data[811].name | randomString |
      | data[812].name | randomString |
      | data[813].name | randomString |
      | data[814].name | randomString |
      | data[815].name | randomString |
      | data[816].name | randomString |
      | data[817].name | randomString |
      | data[818].name | randomString |
      | data[819].name | randomString |
      | data[820].name | randomString |
      | data[821].name | randomString |
      | data[822].name | randomString |
      | data[823].name | randomString |
      | data[824].name | randomString |
      | data[825].name | randomString |
      | data[826].name | randomString |
      | data[827].name | randomString |
      | data[828].name | randomString |
      | data[829].name | randomString |
      | data[830].name | randomString |
      | data[831].name | randomString |
      | data[832].name | randomString |
      | data[833].name | randomString |
      | data[834].name | randomString |
      | data[835].name | randomString |
      | data[836].name | randomString |
      | data[837].name | randomString |
      | data[838].name | randomString |
      | data[839].name | randomString |
      | data[840].name | randomString |
      | data[841].name | randomString |
      | data[842].name | randomString |
      | data[843].name | randomString |
      | data[844].name | randomString |
      | data[845].name | randomString |
      | data[846].name | randomString |
      | data[847].name | randomString |
      | data[848].name | randomString |
      | data[849].name | randomString |
      | data[850].name | randomString |
      | data[851].name | randomString |
      | data[852].name | randomString |
      | data[853].name | randomString |
      | data[854].name | randomString |
      | data[855].name | randomString |
      | data[856].name | randomString |
      | data[857].name | randomString |
      | data[858].name | randomString |
      | data[859].name | randomString |
      | data[860].name | randomString |
      | data[861].name | randomString |
      | data[862].name | randomString |
      | data[863].name | randomString |
      | data[864].name | randomString |
      | data[865].name | randomString |
      | data[866].name | randomString |
      | data[867].name | randomString |
      | data[868].name | randomString |
      | data[869].name | randomString |
      | data[870].name | randomString |
      | data[871].name | randomString |
      | data[872].name | randomString |
      | data[873].name | randomString |
      | data[874].name | randomString |
      | data[875].name | randomString |
      | data[876].name | randomString |
      | data[877].name | randomString |
      | data[878].name | randomString |
      | data[879].name | randomString |
      | data[880].name | randomString |
      | data[881].name | randomString |
      | data[882].name | randomString |
      | data[883].name | randomString |
      | data[884].name | randomString |
      | data[885].name | randomString |
      | data[886].name | randomString |
      | data[887].name | randomString |
      | data[888].name | randomString |
      | data[889].name | randomString |
      | data[890].name | randomString |
      | data[891].name | randomString |
      | data[892].name | randomString |
      | data[893].name | randomString |
      | data[894].name | randomString |
      | data[895].name | randomString |
      | data[896].name | randomString |
      | data[897].name | randomString |
      | data[898].name | randomString |
      | data[899].name | randomString |
      | data[900].name | randomString |
      | data[901].name | randomString |
      | data[902].name | randomString |
      | data[903].name | randomString |
      | data[904].name | randomString |
      | data[905].name | randomString |
      | data[906].name | randomString |
      | data[907].name | randomString |
      | data[908].name | randomString |
      | data[909].name | randomString |
      | data[910].name | randomString |
      | data[911].name | randomString |
      | data[912].name | randomString |
      | data[913].name | randomString |
      | data[914].name | randomString |
      | data[915].name | randomString |
      | data[916].name | randomString |
      | data[917].name | randomString |
      | data[918].name | randomString |
      | data[919].name | randomString |
      | data[920].name | randomString |
      | data[921].name | randomString |
      | data[922].name | randomString |
      | data[923].name | randomString |
      | data[924].name | randomString |
      | data[925].name | randomString |
      | data[926].name | randomString |
      | data[927].name | randomString |
      | data[928].name | randomString |
      | data[929].name | randomString |
      | data[930].name | randomString |
      | data[931].name | randomString |
      | data[932].name | randomString |
      | data[933].name | randomString |
      | data[934].name | randomString |
      | data[935].name | randomString |
      | data[936].name | randomString |
      | data[937].name | randomString |
      | data[938].name | randomString |
      | data[939].name | randomString |
      | data[940].name | randomString |
      | data[941].name | randomString |
      | data[942].name | randomString |
      | data[943].name | randomString |
      | data[944].name | randomString |
      | data[945].name | randomString |
      | data[946].name | randomString |
      | data[947].name | randomString |
      | data[948].name | randomString |
      | data[949].name | randomString |
      | data[950].name | randomString |
      | data[951].name | randomString |
      | data[952].name | randomString |
      | data[953].name | randomString |
      | data[954].name | randomString |
      | data[955].name | randomString |
      | data[956].name | randomString |
      | data[957].name | randomString |
      | data[958].name | randomString |
      | data[959].name | randomString |
      | data[960].name | randomString |
      | data[961].name | randomString |
      | data[962].name | randomString |
      | data[963].name | randomString |
      | data[964].name | randomString |
      | data[965].name | randomString |
      | data[966].name | randomString |
      | data[967].name | randomString |
      | data[968].name | randomString |
      | data[969].name | randomString |
      | data[970].name | randomString |
      | data[971].name | randomString |
      | data[972].name | randomString |
      | data[973].name | randomString |
      | data[974].name | randomString |
      | data[975].name | randomString |
      | data[976].name | randomString |
      | data[977].name | randomString |
      | data[978].name | randomString |
      | data[979].name | randomString |
      | data[980].name | randomString |
      | data[981].name | randomString |
      | data[982].name | randomString |
      | data[983].name | randomString |
      | data[984].name | randomString |
      | data[985].name | randomString |
      | data[986].name | randomString |
      | data[987].name | randomString |
      | data[988].name | randomString |
      | data[989].name | randomString |
      | data[990].name | randomString |
      | data[991].name | randomString |
      | data[992].name | randomString |
      | data[993].name | randomString |
      | data[994].name | randomString |
      | data[995].name | randomString |
      | data[996].name | randomString |
      | data[997].name | randomString |
      | data[998].name | randomString |
      | data[999].name | randomString |
    When I post the request with "insertBulkMdmData_brand_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath       | Value                      |
      | Result      | true                       |
      | Reason.1    | Data Uploaded Successfully |
      | Reason.2    | Data Uploaded Successfully |
      | Reason.3    | Data Uploaded Successfully |
      | Reason.4    | Data Uploaded Successfully |
      | Reason.5    | Data Uploaded Successfully |
      | Reason.6    | Data Uploaded Successfully |
      | Reason.7    | Data Uploaded Successfully |
      | Reason.8    | Data Uploaded Successfully |
      | Reason.9    | Data Uploaded Successfully |
      | Reason.10   | Data Uploaded Successfully |
      | Reason.11   | Data Uploaded Successfully |
      | Reason.12   | Data Uploaded Successfully |
      | Reason.13   | Data Uploaded Successfully |
      | Reason.14   | Data Uploaded Successfully |
      | Reason.15   | Data Uploaded Successfully |
      | Reason.16   | Data Uploaded Successfully |
      | Reason.17   | Data Uploaded Successfully |
      | Reason.18   | Data Uploaded Successfully |
      | Reason.19   | Data Uploaded Successfully |
      | Reason.20   | Data Uploaded Successfully |
      | Reason.21   | Data Uploaded Successfully |
      | Reason.22   | Data Uploaded Successfully |
      | Reason.23   | Data Uploaded Successfully |
      | Reason.24   | Data Uploaded Successfully |
      | Reason.25   | Data Uploaded Successfully |
      | Reason.26   | Data Uploaded Successfully |
      | Reason.27   | Data Uploaded Successfully |
      | Reason.28   | Data Uploaded Successfully |
      | Reason.29   | Data Uploaded Successfully |
      | Reason.30   | Data Uploaded Successfully |
      | Reason.31   | Data Uploaded Successfully |
      | Reason.32   | Data Uploaded Successfully |
      | Reason.33   | Data Uploaded Successfully |
      | Reason.34   | Data Uploaded Successfully |
      | Reason.35   | Data Uploaded Successfully |
      | Reason.36   | Data Uploaded Successfully |
      | Reason.37   | Data Uploaded Successfully |
      | Reason.38   | Data Uploaded Successfully |
      | Reason.39   | Data Uploaded Successfully |
      | Reason.40   | Data Uploaded Successfully |
      | Reason.41   | Data Uploaded Successfully |
      | Reason.42   | Data Uploaded Successfully |
      | Reason.43   | Data Uploaded Successfully |
      | Reason.44   | Data Uploaded Successfully |
      | Reason.45   | Data Uploaded Successfully |
      | Reason.46   | Data Uploaded Successfully |
      | Reason.47   | Data Uploaded Successfully |
      | Reason.48   | Data Uploaded Successfully |
      | Reason.49   | Data Uploaded Successfully |
      | Reason.50   | Data Uploaded Successfully |
      | Reason.51   | Data Uploaded Successfully |
      | Reason.52   | Data Uploaded Successfully |
      | Reason.53   | Data Uploaded Successfully |
      | Reason.54   | Data Uploaded Successfully |
      | Reason.55   | Data Uploaded Successfully |
      | Reason.56   | Data Uploaded Successfully |
      | Reason.57   | Data Uploaded Successfully |
      | Reason.58   | Data Uploaded Successfully |
      | Reason.59   | Data Uploaded Successfully |
      | Reason.60   | Data Uploaded Successfully |
      | Reason.61   | Data Uploaded Successfully |
      | Reason.62   | Data Uploaded Successfully |
      | Reason.63   | Data Uploaded Successfully |
      | Reason.64   | Data Uploaded Successfully |
      | Reason.65   | Data Uploaded Successfully |
      | Reason.66   | Data Uploaded Successfully |
      | Reason.67   | Data Uploaded Successfully |
      | Reason.68   | Data Uploaded Successfully |
      | Reason.69   | Data Uploaded Successfully |
      | Reason.70   | Data Uploaded Successfully |
      | Reason.71   | Data Uploaded Successfully |
      | Reason.72   | Data Uploaded Successfully |
      | Reason.73   | Data Uploaded Successfully |
      | Reason.74   | Data Uploaded Successfully |
      | Reason.75   | Data Uploaded Successfully |
      | Reason.76   | Data Uploaded Successfully |
      | Reason.77   | Data Uploaded Successfully |
      | Reason.78   | Data Uploaded Successfully |
      | Reason.79   | Data Uploaded Successfully |
      | Reason.80   | Data Uploaded Successfully |
      | Reason.81   | Data Uploaded Successfully |
      | Reason.82   | Data Uploaded Successfully |
      | Reason.83   | Data Uploaded Successfully |
      | Reason.84   | Data Uploaded Successfully |
      | Reason.85   | Data Uploaded Successfully |
      | Reason.86   | Data Uploaded Successfully |
      | Reason.87   | Data Uploaded Successfully |
      | Reason.88   | Data Uploaded Successfully |
      | Reason.89   | Data Uploaded Successfully |
      | Reason.90   | Data Uploaded Successfully |
      | Reason.91   | Data Uploaded Successfully |
      | Reason.92   | Data Uploaded Successfully |
      | Reason.93   | Data Uploaded Successfully |
      | Reason.94   | Data Uploaded Successfully |
      | Reason.95   | Data Uploaded Successfully |
      | Reason.96   | Data Uploaded Successfully |
      | Reason.97   | Data Uploaded Successfully |
      | Reason.98   | Data Uploaded Successfully |
      | Reason.99   | Data Uploaded Successfully |
      | Reason.100  | Data Uploaded Successfully |
      | Reason.101  | Data Uploaded Successfully |
      | Reason.102  | Data Uploaded Successfully |
      | Reason.103  | Data Uploaded Successfully |
      | Reason.104  | Data Uploaded Successfully |
      | Reason.105  | Data Uploaded Successfully |
      | Reason.106  | Data Uploaded Successfully |
      | Reason.107  | Data Uploaded Successfully |
      | Reason.108  | Data Uploaded Successfully |
      | Reason.109  | Data Uploaded Successfully |
      | Reason.110  | Data Uploaded Successfully |
      | Reason.111  | Data Uploaded Successfully |
      | Reason.112  | Data Uploaded Successfully |
      | Reason.113  | Data Uploaded Successfully |
      | Reason.114  | Data Uploaded Successfully |
      | Reason.115  | Data Uploaded Successfully |
      | Reason.116  | Data Uploaded Successfully |
      | Reason.117  | Data Uploaded Successfully |
      | Reason.118  | Data Uploaded Successfully |
      | Reason.119  | Data Uploaded Successfully |
      | Reason.120  | Data Uploaded Successfully |
      | Reason.121  | Data Uploaded Successfully |
      | Reason.122  | Data Uploaded Successfully |
      | Reason.123  | Data Uploaded Successfully |
      | Reason.124  | Data Uploaded Successfully |
      | Reason.125  | Data Uploaded Successfully |
      | Reason.126  | Data Uploaded Successfully |
      | Reason.127  | Data Uploaded Successfully |
      | Reason.128  | Data Uploaded Successfully |
      | Reason.129  | Data Uploaded Successfully |
      | Reason.130  | Data Uploaded Successfully |
      | Reason.131  | Data Uploaded Successfully |
      | Reason.132  | Data Uploaded Successfully |
      | Reason.133  | Data Uploaded Successfully |
      | Reason.134  | Data Uploaded Successfully |
      | Reason.135  | Data Uploaded Successfully |
      | Reason.136  | Data Uploaded Successfully |
      | Reason.137  | Data Uploaded Successfully |
      | Reason.138  | Data Uploaded Successfully |
      | Reason.139  | Data Uploaded Successfully |
      | Reason.140  | Data Uploaded Successfully |
      | Reason.141  | Data Uploaded Successfully |
      | Reason.142  | Data Uploaded Successfully |
      | Reason.143  | Data Uploaded Successfully |
      | Reason.144  | Data Uploaded Successfully |
      | Reason.145  | Data Uploaded Successfully |
      | Reason.146  | Data Uploaded Successfully |
      | Reason.147  | Data Uploaded Successfully |
      | Reason.148  | Data Uploaded Successfully |
      | Reason.149  | Data Uploaded Successfully |
      | Reason.150  | Data Uploaded Successfully |
      | Reason.151  | Data Uploaded Successfully |
      | Reason.152  | Data Uploaded Successfully |
      | Reason.153  | Data Uploaded Successfully |
      | Reason.154  | Data Uploaded Successfully |
      | Reason.155  | Data Uploaded Successfully |
      | Reason.156  | Data Uploaded Successfully |
      | Reason.157  | Data Uploaded Successfully |
      | Reason.158  | Data Uploaded Successfully |
      | Reason.159  | Data Uploaded Successfully |
      | Reason.160  | Data Uploaded Successfully |
      | Reason.161  | Data Uploaded Successfully |
      | Reason.162  | Data Uploaded Successfully |
      | Reason.163  | Data Uploaded Successfully |
      | Reason.164  | Data Uploaded Successfully |
      | Reason.165  | Data Uploaded Successfully |
      | Reason.166  | Data Uploaded Successfully |
      | Reason.167  | Data Uploaded Successfully |
      | Reason.168  | Data Uploaded Successfully |
      | Reason.169  | Data Uploaded Successfully |
      | Reason.170  | Data Uploaded Successfully |
      | Reason.171  | Data Uploaded Successfully |
      | Reason.172  | Data Uploaded Successfully |
      | Reason.173  | Data Uploaded Successfully |
      | Reason.174  | Data Uploaded Successfully |
      | Reason.175  | Data Uploaded Successfully |
      | Reason.176  | Data Uploaded Successfully |
      | Reason.177  | Data Uploaded Successfully |
      | Reason.178  | Data Uploaded Successfully |
      | Reason.179  | Data Uploaded Successfully |
      | Reason.180  | Data Uploaded Successfully |
      | Reason.181  | Data Uploaded Successfully |
      | Reason.182  | Data Uploaded Successfully |
      | Reason.183  | Data Uploaded Successfully |
      | Reason.184  | Data Uploaded Successfully |
      | Reason.185  | Data Uploaded Successfully |
      | Reason.186  | Data Uploaded Successfully |
      | Reason.187  | Data Uploaded Successfully |
      | Reason.188  | Data Uploaded Successfully |
      | Reason.189  | Data Uploaded Successfully |
      | Reason.190  | Data Uploaded Successfully |
      | Reason.191  | Data Uploaded Successfully |
      | Reason.192  | Data Uploaded Successfully |
      | Reason.193  | Data Uploaded Successfully |
      | Reason.194  | Data Uploaded Successfully |
      | Reason.195  | Data Uploaded Successfully |
      | Reason.196  | Data Uploaded Successfully |
      | Reason.197  | Data Uploaded Successfully |
      | Reason.198  | Data Uploaded Successfully |
      | Reason.199  | Data Uploaded Successfully |
      | Reason.200  | Data Uploaded Successfully |
      | Reason.201  | Data Uploaded Successfully |
      | Reason.202  | Data Uploaded Successfully |
      | Reason.203  | Data Uploaded Successfully |
      | Reason.204  | Data Uploaded Successfully |
      | Reason.205  | Data Uploaded Successfully |
      | Reason.206  | Data Uploaded Successfully |
      | Reason.207  | Data Uploaded Successfully |
      | Reason.208  | Data Uploaded Successfully |
      | Reason.209  | Data Uploaded Successfully |
      | Reason.210  | Data Uploaded Successfully |
      | Reason.211  | Data Uploaded Successfully |
      | Reason.212  | Data Uploaded Successfully |
      | Reason.213  | Data Uploaded Successfully |
      | Reason.214  | Data Uploaded Successfully |
      | Reason.215  | Data Uploaded Successfully |
      | Reason.216  | Data Uploaded Successfully |
      | Reason.217  | Data Uploaded Successfully |
      | Reason.218  | Data Uploaded Successfully |
      | Reason.219  | Data Uploaded Successfully |
      | Reason.220  | Data Uploaded Successfully |
      | Reason.221  | Data Uploaded Successfully |
      | Reason.222  | Data Uploaded Successfully |
      | Reason.223  | Data Uploaded Successfully |
      | Reason.224  | Data Uploaded Successfully |
      | Reason.225  | Data Uploaded Successfully |
      | Reason.226  | Data Uploaded Successfully |
      | Reason.227  | Data Uploaded Successfully |
      | Reason.228  | Data Uploaded Successfully |
      | Reason.229  | Data Uploaded Successfully |
      | Reason.230  | Data Uploaded Successfully |
      | Reason.231  | Data Uploaded Successfully |
      | Reason.232  | Data Uploaded Successfully |
      | Reason.233  | Data Uploaded Successfully |
      | Reason.234  | Data Uploaded Successfully |
      | Reason.235  | Data Uploaded Successfully |
      | Reason.236  | Data Uploaded Successfully |
      | Reason.237  | Data Uploaded Successfully |
      | Reason.238  | Data Uploaded Successfully |
      | Reason.239  | Data Uploaded Successfully |
      | Reason.240  | Data Uploaded Successfully |
      | Reason.241  | Data Uploaded Successfully |
      | Reason.242  | Data Uploaded Successfully |
      | Reason.243  | Data Uploaded Successfully |
      | Reason.244  | Data Uploaded Successfully |
      | Reason.245  | Data Uploaded Successfully |
      | Reason.246  | Data Uploaded Successfully |
      | Reason.247  | Data Uploaded Successfully |
      | Reason.248  | Data Uploaded Successfully |
      | Reason.249  | Data Uploaded Successfully |
      | Reason.250  | Data Uploaded Successfully |
      | Reason.251  | Data Uploaded Successfully |
      | Reason.252  | Data Uploaded Successfully |
      | Reason.253  | Data Uploaded Successfully |
      | Reason.254  | Data Uploaded Successfully |
      | Reason.255  | Data Uploaded Successfully |
      | Reason.256  | Data Uploaded Successfully |
      | Reason.257  | Data Uploaded Successfully |
      | Reason.258  | Data Uploaded Successfully |
      | Reason.259  | Data Uploaded Successfully |
      | Reason.260  | Data Uploaded Successfully |
      | Reason.261  | Data Uploaded Successfully |
      | Reason.262  | Data Uploaded Successfully |
      | Reason.263  | Data Uploaded Successfully |
      | Reason.264  | Data Uploaded Successfully |
      | Reason.265  | Data Uploaded Successfully |
      | Reason.266  | Data Uploaded Successfully |
      | Reason.267  | Data Uploaded Successfully |
      | Reason.268  | Data Uploaded Successfully |
      | Reason.269  | Data Uploaded Successfully |
      | Reason.270  | Data Uploaded Successfully |
      | Reason.271  | Data Uploaded Successfully |
      | Reason.272  | Data Uploaded Successfully |
      | Reason.273  | Data Uploaded Successfully |
      | Reason.274  | Data Uploaded Successfully |
      | Reason.275  | Data Uploaded Successfully |
      | Reason.276  | Data Uploaded Successfully |
      | Reason.277  | Data Uploaded Successfully |
      | Reason.278  | Data Uploaded Successfully |
      | Reason.279  | Data Uploaded Successfully |
      | Reason.280  | Data Uploaded Successfully |
      | Reason.281  | Data Uploaded Successfully |
      | Reason.282  | Data Uploaded Successfully |
      | Reason.283  | Data Uploaded Successfully |
      | Reason.284  | Data Uploaded Successfully |
      | Reason.285  | Data Uploaded Successfully |
      | Reason.286  | Data Uploaded Successfully |
      | Reason.287  | Data Uploaded Successfully |
      | Reason.288  | Data Uploaded Successfully |
      | Reason.289  | Data Uploaded Successfully |
      | Reason.290  | Data Uploaded Successfully |
      | Reason.291  | Data Uploaded Successfully |
      | Reason.292  | Data Uploaded Successfully |
      | Reason.293  | Data Uploaded Successfully |
      | Reason.294  | Data Uploaded Successfully |
      | Reason.295  | Data Uploaded Successfully |
      | Reason.296  | Data Uploaded Successfully |
      | Reason.297  | Data Uploaded Successfully |
      | Reason.298  | Data Uploaded Successfully |
      | Reason.299  | Data Uploaded Successfully |
      | Reason.300  | Data Uploaded Successfully |
      | Reason.301  | Data Uploaded Successfully |
      | Reason.302  | Data Uploaded Successfully |
      | Reason.303  | Data Uploaded Successfully |
      | Reason.304  | Data Uploaded Successfully |
      | Reason.305  | Data Uploaded Successfully |
      | Reason.306  | Data Uploaded Successfully |
      | Reason.307  | Data Uploaded Successfully |
      | Reason.308  | Data Uploaded Successfully |
      | Reason.309  | Data Uploaded Successfully |
      | Reason.310  | Data Uploaded Successfully |
      | Reason.311  | Data Uploaded Successfully |
      | Reason.312  | Data Uploaded Successfully |
      | Reason.313  | Data Uploaded Successfully |
      | Reason.314  | Data Uploaded Successfully |
      | Reason.315  | Data Uploaded Successfully |
      | Reason.316  | Data Uploaded Successfully |
      | Reason.317  | Data Uploaded Successfully |
      | Reason.318  | Data Uploaded Successfully |
      | Reason.319  | Data Uploaded Successfully |
      | Reason.320  | Data Uploaded Successfully |
      | Reason.321  | Data Uploaded Successfully |
      | Reason.322  | Data Uploaded Successfully |
      | Reason.323  | Data Uploaded Successfully |
      | Reason.324  | Data Uploaded Successfully |
      | Reason.325  | Data Uploaded Successfully |
      | Reason.326  | Data Uploaded Successfully |
      | Reason.327  | Data Uploaded Successfully |
      | Reason.328  | Data Uploaded Successfully |
      | Reason.329  | Data Uploaded Successfully |
      | Reason.330  | Data Uploaded Successfully |
      | Reason.331  | Data Uploaded Successfully |
      | Reason.332  | Data Uploaded Successfully |
      | Reason.333  | Data Uploaded Successfully |
      | Reason.334  | Data Uploaded Successfully |
      | Reason.335  | Data Uploaded Successfully |
      | Reason.336  | Data Uploaded Successfully |
      | Reason.337  | Data Uploaded Successfully |
      | Reason.338  | Data Uploaded Successfully |
      | Reason.339  | Data Uploaded Successfully |
      | Reason.340  | Data Uploaded Successfully |
      | Reason.341  | Data Uploaded Successfully |
      | Reason.342  | Data Uploaded Successfully |
      | Reason.343  | Data Uploaded Successfully |
      | Reason.344  | Data Uploaded Successfully |
      | Reason.345  | Data Uploaded Successfully |
      | Reason.346  | Data Uploaded Successfully |
      | Reason.347  | Data Uploaded Successfully |
      | Reason.348  | Data Uploaded Successfully |
      | Reason.349  | Data Uploaded Successfully |
      | Reason.350  | Data Uploaded Successfully |
      | Reason.351  | Data Uploaded Successfully |
      | Reason.352  | Data Uploaded Successfully |
      | Reason.353  | Data Uploaded Successfully |
      | Reason.354  | Data Uploaded Successfully |
      | Reason.355  | Data Uploaded Successfully |
      | Reason.356  | Data Uploaded Successfully |
      | Reason.357  | Data Uploaded Successfully |
      | Reason.358  | Data Uploaded Successfully |
      | Reason.359  | Data Uploaded Successfully |
      | Reason.360  | Data Uploaded Successfully |
      | Reason.361  | Data Uploaded Successfully |
      | Reason.362  | Data Uploaded Successfully |
      | Reason.363  | Data Uploaded Successfully |
      | Reason.364  | Data Uploaded Successfully |
      | Reason.365  | Data Uploaded Successfully |
      | Reason.366  | Data Uploaded Successfully |
      | Reason.367  | Data Uploaded Successfully |
      | Reason.368  | Data Uploaded Successfully |
      | Reason.369  | Data Uploaded Successfully |
      | Reason.370  | Data Uploaded Successfully |
      | Reason.371  | Data Uploaded Successfully |
      | Reason.372  | Data Uploaded Successfully |
      | Reason.373  | Data Uploaded Successfully |
      | Reason.374  | Data Uploaded Successfully |
      | Reason.375  | Data Uploaded Successfully |
      | Reason.376  | Data Uploaded Successfully |
      | Reason.377  | Data Uploaded Successfully |
      | Reason.378  | Data Uploaded Successfully |
      | Reason.379  | Data Uploaded Successfully |
      | Reason.380  | Data Uploaded Successfully |
      | Reason.381  | Data Uploaded Successfully |
      | Reason.382  | Data Uploaded Successfully |
      | Reason.383  | Data Uploaded Successfully |
      | Reason.384  | Data Uploaded Successfully |
      | Reason.385  | Data Uploaded Successfully |
      | Reason.386  | Data Uploaded Successfully |
      | Reason.387  | Data Uploaded Successfully |
      | Reason.388  | Data Uploaded Successfully |
      | Reason.389  | Data Uploaded Successfully |
      | Reason.390  | Data Uploaded Successfully |
      | Reason.391  | Data Uploaded Successfully |
      | Reason.392  | Data Uploaded Successfully |
      | Reason.393  | Data Uploaded Successfully |
      | Reason.394  | Data Uploaded Successfully |
      | Reason.395  | Data Uploaded Successfully |
      | Reason.396  | Data Uploaded Successfully |
      | Reason.397  | Data Uploaded Successfully |
      | Reason.398  | Data Uploaded Successfully |
      | Reason.399  | Data Uploaded Successfully |
      | Reason.400  | Data Uploaded Successfully |
      | Reason.401  | Data Uploaded Successfully |
      | Reason.402  | Data Uploaded Successfully |
      | Reason.403  | Data Uploaded Successfully |
      | Reason.404  | Data Uploaded Successfully |
      | Reason.405  | Data Uploaded Successfully |
      | Reason.406  | Data Uploaded Successfully |
      | Reason.407  | Data Uploaded Successfully |
      | Reason.408  | Data Uploaded Successfully |
      | Reason.409  | Data Uploaded Successfully |
      | Reason.410  | Data Uploaded Successfully |
      | Reason.411  | Data Uploaded Successfully |
      | Reason.412  | Data Uploaded Successfully |
      | Reason.413  | Data Uploaded Successfully |
      | Reason.414  | Data Uploaded Successfully |
      | Reason.415  | Data Uploaded Successfully |
      | Reason.416  | Data Uploaded Successfully |
      | Reason.417  | Data Uploaded Successfully |
      | Reason.418  | Data Uploaded Successfully |
      | Reason.419  | Data Uploaded Successfully |
      | Reason.420  | Data Uploaded Successfully |
      | Reason.421  | Data Uploaded Successfully |
      | Reason.422  | Data Uploaded Successfully |
      | Reason.423  | Data Uploaded Successfully |
      | Reason.424  | Data Uploaded Successfully |
      | Reason.425  | Data Uploaded Successfully |
      | Reason.426  | Data Uploaded Successfully |
      | Reason.427  | Data Uploaded Successfully |
      | Reason.428  | Data Uploaded Successfully |
      | Reason.429  | Data Uploaded Successfully |
      | Reason.430  | Data Uploaded Successfully |
      | Reason.431  | Data Uploaded Successfully |
      | Reason.432  | Data Uploaded Successfully |
      | Reason.433  | Data Uploaded Successfully |
      | Reason.434  | Data Uploaded Successfully |
      | Reason.435  | Data Uploaded Successfully |
      | Reason.436  | Data Uploaded Successfully |
      | Reason.437  | Data Uploaded Successfully |
      | Reason.438  | Data Uploaded Successfully |
      | Reason.439  | Data Uploaded Successfully |
      | Reason.440  | Data Uploaded Successfully |
      | Reason.441  | Data Uploaded Successfully |
      | Reason.442  | Data Uploaded Successfully |
      | Reason.443  | Data Uploaded Successfully |
      | Reason.444  | Data Uploaded Successfully |
      | Reason.445  | Data Uploaded Successfully |
      | Reason.446  | Data Uploaded Successfully |
      | Reason.447  | Data Uploaded Successfully |
      | Reason.448  | Data Uploaded Successfully |
      | Reason.449  | Data Uploaded Successfully |
      | Reason.450  | Data Uploaded Successfully |
      | Reason.451  | Data Uploaded Successfully |
      | Reason.452  | Data Uploaded Successfully |
      | Reason.453  | Data Uploaded Successfully |
      | Reason.454  | Data Uploaded Successfully |
      | Reason.455  | Data Uploaded Successfully |
      | Reason.456  | Data Uploaded Successfully |
      | Reason.457  | Data Uploaded Successfully |
      | Reason.458  | Data Uploaded Successfully |
      | Reason.459  | Data Uploaded Successfully |
      | Reason.460  | Data Uploaded Successfully |
      | Reason.461  | Data Uploaded Successfully |
      | Reason.462  | Data Uploaded Successfully |
      | Reason.463  | Data Uploaded Successfully |
      | Reason.464  | Data Uploaded Successfully |
      | Reason.465  | Data Uploaded Successfully |
      | Reason.466  | Data Uploaded Successfully |
      | Reason.467  | Data Uploaded Successfully |
      | Reason.468  | Data Uploaded Successfully |
      | Reason.469  | Data Uploaded Successfully |
      | Reason.470  | Data Uploaded Successfully |
      | Reason.471  | Data Uploaded Successfully |
      | Reason.472  | Data Uploaded Successfully |
      | Reason.473  | Data Uploaded Successfully |
      | Reason.474  | Data Uploaded Successfully |
      | Reason.475  | Data Uploaded Successfully |
      | Reason.476  | Data Uploaded Successfully |
      | Reason.477  | Data Uploaded Successfully |
      | Reason.478  | Data Uploaded Successfully |
      | Reason.479  | Data Uploaded Successfully |
      | Reason.480  | Data Uploaded Successfully |
      | Reason.481  | Data Uploaded Successfully |
      | Reason.482  | Data Uploaded Successfully |
      | Reason.483  | Data Uploaded Successfully |
      | Reason.484  | Data Uploaded Successfully |
      | Reason.485  | Data Uploaded Successfully |
      | Reason.486  | Data Uploaded Successfully |
      | Reason.487  | Data Uploaded Successfully |
      | Reason.488  | Data Uploaded Successfully |
      | Reason.489  | Data Uploaded Successfully |
      | Reason.490  | Data Uploaded Successfully |
      | Reason.491  | Data Uploaded Successfully |
      | Reason.492  | Data Uploaded Successfully |
      | Reason.493  | Data Uploaded Successfully |
      | Reason.494  | Data Uploaded Successfully |
      | Reason.495  | Data Uploaded Successfully |
      | Reason.496  | Data Uploaded Successfully |
      | Reason.497  | Data Uploaded Successfully |
      | Reason.498  | Data Uploaded Successfully |
      | Reason.499  | Data Uploaded Successfully |
      | Reason.500  | Data Uploaded Successfully |
      | Reason.501  | Data Uploaded Successfully |
      | Reason.502  | Data Uploaded Successfully |
      | Reason.503  | Data Uploaded Successfully |
      | Reason.504  | Data Uploaded Successfully |
      | Reason.505  | Data Uploaded Successfully |
      | Reason.506  | Data Uploaded Successfully |
      | Reason.507  | Data Uploaded Successfully |
      | Reason.508  | Data Uploaded Successfully |
      | Reason.509  | Data Uploaded Successfully |
      | Reason.510  | Data Uploaded Successfully |
      | Reason.511  | Data Uploaded Successfully |
      | Reason.512  | Data Uploaded Successfully |
      | Reason.513  | Data Uploaded Successfully |
      | Reason.514  | Data Uploaded Successfully |
      | Reason.515  | Data Uploaded Successfully |
      | Reason.516  | Data Uploaded Successfully |
      | Reason.517  | Data Uploaded Successfully |
      | Reason.518  | Data Uploaded Successfully |
      | Reason.519  | Data Uploaded Successfully |
      | Reason.520  | Data Uploaded Successfully |
      | Reason.521  | Data Uploaded Successfully |
      | Reason.522  | Data Uploaded Successfully |
      | Reason.523  | Data Uploaded Successfully |
      | Reason.524  | Data Uploaded Successfully |
      | Reason.525  | Data Uploaded Successfully |
      | Reason.526  | Data Uploaded Successfully |
      | Reason.527  | Data Uploaded Successfully |
      | Reason.528  | Data Uploaded Successfully |
      | Reason.529  | Data Uploaded Successfully |
      | Reason.530  | Data Uploaded Successfully |
      | Reason.531  | Data Uploaded Successfully |
      | Reason.532  | Data Uploaded Successfully |
      | Reason.533  | Data Uploaded Successfully |
      | Reason.534  | Data Uploaded Successfully |
      | Reason.535  | Data Uploaded Successfully |
      | Reason.536  | Data Uploaded Successfully |
      | Reason.537  | Data Uploaded Successfully |
      | Reason.538  | Data Uploaded Successfully |
      | Reason.539  | Data Uploaded Successfully |
      | Reason.540  | Data Uploaded Successfully |
      | Reason.541  | Data Uploaded Successfully |
      | Reason.542  | Data Uploaded Successfully |
      | Reason.543  | Data Uploaded Successfully |
      | Reason.544  | Data Uploaded Successfully |
      | Reason.545  | Data Uploaded Successfully |
      | Reason.546  | Data Uploaded Successfully |
      | Reason.547  | Data Uploaded Successfully |
      | Reason.548  | Data Uploaded Successfully |
      | Reason.549  | Data Uploaded Successfully |
      | Reason.550  | Data Uploaded Successfully |
      | Reason.551  | Data Uploaded Successfully |
      | Reason.552  | Data Uploaded Successfully |
      | Reason.553  | Data Uploaded Successfully |
      | Reason.554  | Data Uploaded Successfully |
      | Reason.555  | Data Uploaded Successfully |
      | Reason.556  | Data Uploaded Successfully |
      | Reason.557  | Data Uploaded Successfully |
      | Reason.558  | Data Uploaded Successfully |
      | Reason.559  | Data Uploaded Successfully |
      | Reason.560  | Data Uploaded Successfully |
      | Reason.561  | Data Uploaded Successfully |
      | Reason.562  | Data Uploaded Successfully |
      | Reason.563  | Data Uploaded Successfully |
      | Reason.564  | Data Uploaded Successfully |
      | Reason.565  | Data Uploaded Successfully |
      | Reason.566  | Data Uploaded Successfully |
      | Reason.567  | Data Uploaded Successfully |
      | Reason.568  | Data Uploaded Successfully |
      | Reason.569  | Data Uploaded Successfully |
      | Reason.570  | Data Uploaded Successfully |
      | Reason.571  | Data Uploaded Successfully |
      | Reason.572  | Data Uploaded Successfully |
      | Reason.573  | Data Uploaded Successfully |
      | Reason.574  | Data Uploaded Successfully |
      | Reason.575  | Data Uploaded Successfully |
      | Reason.576  | Data Uploaded Successfully |
      | Reason.577  | Data Uploaded Successfully |
      | Reason.578  | Data Uploaded Successfully |
      | Reason.579  | Data Uploaded Successfully |
      | Reason.580  | Data Uploaded Successfully |
      | Reason.581  | Data Uploaded Successfully |
      | Reason.582  | Data Uploaded Successfully |
      | Reason.583  | Data Uploaded Successfully |
      | Reason.584  | Data Uploaded Successfully |
      | Reason.585  | Data Uploaded Successfully |
      | Reason.586  | Data Uploaded Successfully |
      | Reason.587  | Data Uploaded Successfully |
      | Reason.588  | Data Uploaded Successfully |
      | Reason.589  | Data Uploaded Successfully |
      | Reason.590  | Data Uploaded Successfully |
      | Reason.591  | Data Uploaded Successfully |
      | Reason.592  | Data Uploaded Successfully |
      | Reason.593  | Data Uploaded Successfully |
      | Reason.594  | Data Uploaded Successfully |
      | Reason.595  | Data Uploaded Successfully |
      | Reason.596  | Data Uploaded Successfully |
      | Reason.597  | Data Uploaded Successfully |
      | Reason.598  | Data Uploaded Successfully |
      | Reason.599  | Data Uploaded Successfully |
      | Reason.600  | Data Uploaded Successfully |
      | Reason.601  | Data Uploaded Successfully |
      | Reason.602  | Data Uploaded Successfully |
      | Reason.603  | Data Uploaded Successfully |
      | Reason.604  | Data Uploaded Successfully |
      | Reason.605  | Data Uploaded Successfully |
      | Reason.606  | Data Uploaded Successfully |
      | Reason.607  | Data Uploaded Successfully |
      | Reason.608  | Data Uploaded Successfully |
      | Reason.609  | Data Uploaded Successfully |
      | Reason.610  | Data Uploaded Successfully |
      | Reason.611  | Data Uploaded Successfully |
      | Reason.612  | Data Uploaded Successfully |
      | Reason.613  | Data Uploaded Successfully |
      | Reason.614  | Data Uploaded Successfully |
      | Reason.615  | Data Uploaded Successfully |
      | Reason.616  | Data Uploaded Successfully |
      | Reason.617  | Data Uploaded Successfully |
      | Reason.618  | Data Uploaded Successfully |
      | Reason.619  | Data Uploaded Successfully |
      | Reason.620  | Data Uploaded Successfully |
      | Reason.621  | Data Uploaded Successfully |
      | Reason.622  | Data Uploaded Successfully |
      | Reason.623  | Data Uploaded Successfully |
      | Reason.624  | Data Uploaded Successfully |
      | Reason.625  | Data Uploaded Successfully |
      | Reason.626  | Data Uploaded Successfully |
      | Reason.627  | Data Uploaded Successfully |
      | Reason.628  | Data Uploaded Successfully |
      | Reason.629  | Data Uploaded Successfully |
      | Reason.630  | Data Uploaded Successfully |
      | Reason.631  | Data Uploaded Successfully |
      | Reason.632  | Data Uploaded Successfully |
      | Reason.633  | Data Uploaded Successfully |
      | Reason.634  | Data Uploaded Successfully |
      | Reason.635  | Data Uploaded Successfully |
      | Reason.636  | Data Uploaded Successfully |
      | Reason.637  | Data Uploaded Successfully |
      | Reason.638  | Data Uploaded Successfully |
      | Reason.639  | Data Uploaded Successfully |
      | Reason.640  | Data Uploaded Successfully |
      | Reason.641  | Data Uploaded Successfully |
      | Reason.642  | Data Uploaded Successfully |
      | Reason.643  | Data Uploaded Successfully |
      | Reason.644  | Data Uploaded Successfully |
      | Reason.645  | Data Uploaded Successfully |
      | Reason.646  | Data Uploaded Successfully |
      | Reason.647  | Data Uploaded Successfully |
      | Reason.648  | Data Uploaded Successfully |
      | Reason.649  | Data Uploaded Successfully |
      | Reason.650  | Data Uploaded Successfully |
      | Reason.651  | Data Uploaded Successfully |
      | Reason.652  | Data Uploaded Successfully |
      | Reason.653  | Data Uploaded Successfully |
      | Reason.654  | Data Uploaded Successfully |
      | Reason.655  | Data Uploaded Successfully |
      | Reason.656  | Data Uploaded Successfully |
      | Reason.657  | Data Uploaded Successfully |
      | Reason.658  | Data Uploaded Successfully |
      | Reason.659  | Data Uploaded Successfully |
      | Reason.660  | Data Uploaded Successfully |
      | Reason.661  | Data Uploaded Successfully |
      | Reason.662  | Data Uploaded Successfully |
      | Reason.663  | Data Uploaded Successfully |
      | Reason.664  | Data Uploaded Successfully |
      | Reason.665  | Data Uploaded Successfully |
      | Reason.666  | Data Uploaded Successfully |
      | Reason.667  | Data Uploaded Successfully |
      | Reason.668  | Data Uploaded Successfully |
      | Reason.669  | Data Uploaded Successfully |
      | Reason.670  | Data Uploaded Successfully |
      | Reason.671  | Data Uploaded Successfully |
      | Reason.672  | Data Uploaded Successfully |
      | Reason.673  | Data Uploaded Successfully |
      | Reason.674  | Data Uploaded Successfully |
      | Reason.675  | Data Uploaded Successfully |
      | Reason.676  | Data Uploaded Successfully |
      | Reason.677  | Data Uploaded Successfully |
      | Reason.678  | Data Uploaded Successfully |
      | Reason.679  | Data Uploaded Successfully |
      | Reason.680  | Data Uploaded Successfully |
      | Reason.681  | Data Uploaded Successfully |
      | Reason.682  | Data Uploaded Successfully |
      | Reason.683  | Data Uploaded Successfully |
      | Reason.684  | Data Uploaded Successfully |
      | Reason.685  | Data Uploaded Successfully |
      | Reason.686  | Data Uploaded Successfully |
      | Reason.687  | Data Uploaded Successfully |
      | Reason.688  | Data Uploaded Successfully |
      | Reason.689  | Data Uploaded Successfully |
      | Reason.690  | Data Uploaded Successfully |
      | Reason.691  | Data Uploaded Successfully |
      | Reason.692  | Data Uploaded Successfully |
      | Reason.693  | Data Uploaded Successfully |
      | Reason.694  | Data Uploaded Successfully |
      | Reason.695  | Data Uploaded Successfully |
      | Reason.696  | Data Uploaded Successfully |
      | Reason.697  | Data Uploaded Successfully |
      | Reason.698  | Data Uploaded Successfully |
      | Reason.699  | Data Uploaded Successfully |
      | Reason.700  | Data Uploaded Successfully |
      | Reason.701  | Data Uploaded Successfully |
      | Reason.702  | Data Uploaded Successfully |
      | Reason.703  | Data Uploaded Successfully |
      | Reason.704  | Data Uploaded Successfully |
      | Reason.705  | Data Uploaded Successfully |
      | Reason.706  | Data Uploaded Successfully |
      | Reason.707  | Data Uploaded Successfully |
      | Reason.708  | Data Uploaded Successfully |
      | Reason.709  | Data Uploaded Successfully |
      | Reason.710  | Data Uploaded Successfully |
      | Reason.711  | Data Uploaded Successfully |
      | Reason.712  | Data Uploaded Successfully |
      | Reason.713  | Data Uploaded Successfully |
      | Reason.714  | Data Uploaded Successfully |
      | Reason.715  | Data Uploaded Successfully |
      | Reason.716  | Data Uploaded Successfully |
      | Reason.717  | Data Uploaded Successfully |
      | Reason.718  | Data Uploaded Successfully |
      | Reason.719  | Data Uploaded Successfully |
      | Reason.720  | Data Uploaded Successfully |
      | Reason.721  | Data Uploaded Successfully |
      | Reason.722  | Data Uploaded Successfully |
      | Reason.723  | Data Uploaded Successfully |
      | Reason.724  | Data Uploaded Successfully |
      | Reason.725  | Data Uploaded Successfully |
      | Reason.726  | Data Uploaded Successfully |
      | Reason.727  | Data Uploaded Successfully |
      | Reason.728  | Data Uploaded Successfully |
      | Reason.729  | Data Uploaded Successfully |
      | Reason.730  | Data Uploaded Successfully |
      | Reason.731  | Data Uploaded Successfully |
      | Reason.732  | Data Uploaded Successfully |
      | Reason.733  | Data Uploaded Successfully |
      | Reason.734  | Data Uploaded Successfully |
      | Reason.735  | Data Uploaded Successfully |
      | Reason.736  | Data Uploaded Successfully |
      | Reason.737  | Data Uploaded Successfully |
      | Reason.738  | Data Uploaded Successfully |
      | Reason.739  | Data Uploaded Successfully |
      | Reason.740  | Data Uploaded Successfully |
      | Reason.741  | Data Uploaded Successfully |
      | Reason.742  | Data Uploaded Successfully |
      | Reason.743  | Data Uploaded Successfully |
      | Reason.744  | Data Uploaded Successfully |
      | Reason.745  | Data Uploaded Successfully |
      | Reason.746  | Data Uploaded Successfully |
      | Reason.747  | Data Uploaded Successfully |
      | Reason.748  | Data Uploaded Successfully |
      | Reason.749  | Data Uploaded Successfully |
      | Reason.750  | Data Uploaded Successfully |
      | Reason.751  | Data Uploaded Successfully |
      | Reason.752  | Data Uploaded Successfully |
      | Reason.753  | Data Uploaded Successfully |
      | Reason.754  | Data Uploaded Successfully |
      | Reason.755  | Data Uploaded Successfully |
      | Reason.756  | Data Uploaded Successfully |
      | Reason.757  | Data Uploaded Successfully |
      | Reason.758  | Data Uploaded Successfully |
      | Reason.759  | Data Uploaded Successfully |
      | Reason.760  | Data Uploaded Successfully |
      | Reason.761  | Data Uploaded Successfully |
      | Reason.762  | Data Uploaded Successfully |
      | Reason.763  | Data Uploaded Successfully |
      | Reason.764  | Data Uploaded Successfully |
      | Reason.765  | Data Uploaded Successfully |
      | Reason.766  | Data Uploaded Successfully |
      | Reason.767  | Data Uploaded Successfully |
      | Reason.768  | Data Uploaded Successfully |
      | Reason.769  | Data Uploaded Successfully |
      | Reason.770  | Data Uploaded Successfully |
      | Reason.771  | Data Uploaded Successfully |
      | Reason.772  | Data Uploaded Successfully |
      | Reason.773  | Data Uploaded Successfully |
      | Reason.774  | Data Uploaded Successfully |
      | Reason.775  | Data Uploaded Successfully |
      | Reason.776  | Data Uploaded Successfully |
      | Reason.777  | Data Uploaded Successfully |
      | Reason.778  | Data Uploaded Successfully |
      | Reason.779  | Data Uploaded Successfully |
      | Reason.780  | Data Uploaded Successfully |
      | Reason.781  | Data Uploaded Successfully |
      | Reason.782  | Data Uploaded Successfully |
      | Reason.783  | Data Uploaded Successfully |
      | Reason.784  | Data Uploaded Successfully |
      | Reason.785  | Data Uploaded Successfully |
      | Reason.786  | Data Uploaded Successfully |
      | Reason.787  | Data Uploaded Successfully |
      | Reason.788  | Data Uploaded Successfully |
      | Reason.789  | Data Uploaded Successfully |
      | Reason.790  | Data Uploaded Successfully |
      | Reason.791  | Data Uploaded Successfully |
      | Reason.792  | Data Uploaded Successfully |
      | Reason.793  | Data Uploaded Successfully |
      | Reason.794  | Data Uploaded Successfully |
      | Reason.795  | Data Uploaded Successfully |
      | Reason.796  | Data Uploaded Successfully |
      | Reason.797  | Data Uploaded Successfully |
      | Reason.798  | Data Uploaded Successfully |
      | Reason.799  | Data Uploaded Successfully |
      | Reason.800  | Data Uploaded Successfully |
      | Reason.801  | Data Uploaded Successfully |
      | Reason.802  | Data Uploaded Successfully |
      | Reason.803  | Data Uploaded Successfully |
      | Reason.804  | Data Uploaded Successfully |
      | Reason.805  | Data Uploaded Successfully |
      | Reason.806  | Data Uploaded Successfully |
      | Reason.807  | Data Uploaded Successfully |
      | Reason.808  | Data Uploaded Successfully |
      | Reason.809  | Data Uploaded Successfully |
      | Reason.810  | Data Uploaded Successfully |
      | Reason.811  | Data Uploaded Successfully |
      | Reason.812  | Data Uploaded Successfully |
      | Reason.813  | Data Uploaded Successfully |
      | Reason.814  | Data Uploaded Successfully |
      | Reason.815  | Data Uploaded Successfully |
      | Reason.816  | Data Uploaded Successfully |
      | Reason.817  | Data Uploaded Successfully |
      | Reason.818  | Data Uploaded Successfully |
      | Reason.819  | Data Uploaded Successfully |
      | Reason.820  | Data Uploaded Successfully |
      | Reason.821  | Data Uploaded Successfully |
      | Reason.822  | Data Uploaded Successfully |
      | Reason.823  | Data Uploaded Successfully |
      | Reason.824  | Data Uploaded Successfully |
      | Reason.825  | Data Uploaded Successfully |
      | Reason.826  | Data Uploaded Successfully |
      | Reason.827  | Data Uploaded Successfully |
      | Reason.828  | Data Uploaded Successfully |
      | Reason.829  | Data Uploaded Successfully |
      | Reason.830  | Data Uploaded Successfully |
      | Reason.831  | Data Uploaded Successfully |
      | Reason.832  | Data Uploaded Successfully |
      | Reason.833  | Data Uploaded Successfully |
      | Reason.834  | Data Uploaded Successfully |
      | Reason.835  | Data Uploaded Successfully |
      | Reason.836  | Data Uploaded Successfully |
      | Reason.837  | Data Uploaded Successfully |
      | Reason.838  | Data Uploaded Successfully |
      | Reason.839  | Data Uploaded Successfully |
      | Reason.840  | Data Uploaded Successfully |
      | Reason.841  | Data Uploaded Successfully |
      | Reason.842  | Data Uploaded Successfully |
      | Reason.843  | Data Uploaded Successfully |
      | Reason.844  | Data Uploaded Successfully |
      | Reason.845  | Data Uploaded Successfully |
      | Reason.846  | Data Uploaded Successfully |
      | Reason.847  | Data Uploaded Successfully |
      | Reason.848  | Data Uploaded Successfully |
      | Reason.849  | Data Uploaded Successfully |
      | Reason.850  | Data Uploaded Successfully |
      | Reason.851  | Data Uploaded Successfully |
      | Reason.852  | Data Uploaded Successfully |
      | Reason.853  | Data Uploaded Successfully |
      | Reason.854  | Data Uploaded Successfully |
      | Reason.855  | Data Uploaded Successfully |
      | Reason.856  | Data Uploaded Successfully |
      | Reason.857  | Data Uploaded Successfully |
      | Reason.858  | Data Uploaded Successfully |
      | Reason.859  | Data Uploaded Successfully |
      | Reason.860  | Data Uploaded Successfully |
      | Reason.861  | Data Uploaded Successfully |
      | Reason.862  | Data Uploaded Successfully |
      | Reason.863  | Data Uploaded Successfully |
      | Reason.864  | Data Uploaded Successfully |
      | Reason.865  | Data Uploaded Successfully |
      | Reason.866  | Data Uploaded Successfully |
      | Reason.867  | Data Uploaded Successfully |
      | Reason.868  | Data Uploaded Successfully |
      | Reason.869  | Data Uploaded Successfully |
      | Reason.870  | Data Uploaded Successfully |
      | Reason.871  | Data Uploaded Successfully |
      | Reason.872  | Data Uploaded Successfully |
      | Reason.873  | Data Uploaded Successfully |
      | Reason.874  | Data Uploaded Successfully |
      | Reason.875  | Data Uploaded Successfully |
      | Reason.876  | Data Uploaded Successfully |
      | Reason.877  | Data Uploaded Successfully |
      | Reason.878  | Data Uploaded Successfully |
      | Reason.879  | Data Uploaded Successfully |
      | Reason.880  | Data Uploaded Successfully |
      | Reason.881  | Data Uploaded Successfully |
      | Reason.882  | Data Uploaded Successfully |
      | Reason.883  | Data Uploaded Successfully |
      | Reason.884  | Data Uploaded Successfully |
      | Reason.885  | Data Uploaded Successfully |
      | Reason.886  | Data Uploaded Successfully |
      | Reason.887  | Data Uploaded Successfully |
      | Reason.888  | Data Uploaded Successfully |
      | Reason.889  | Data Uploaded Successfully |
      | Reason.890  | Data Uploaded Successfully |
      | Reason.891  | Data Uploaded Successfully |
      | Reason.892  | Data Uploaded Successfully |
      | Reason.893  | Data Uploaded Successfully |
      | Reason.894  | Data Uploaded Successfully |
      | Reason.895  | Data Uploaded Successfully |
      | Reason.896  | Data Uploaded Successfully |
      | Reason.897  | Data Uploaded Successfully |
      | Reason.898  | Data Uploaded Successfully |
      | Reason.899  | Data Uploaded Successfully |
      | Reason.900  | Data Uploaded Successfully |
      | Reason.901  | Data Uploaded Successfully |
      | Reason.902  | Data Uploaded Successfully |
      | Reason.903  | Data Uploaded Successfully |
      | Reason.904  | Data Uploaded Successfully |
      | Reason.905  | Data Uploaded Successfully |
      | Reason.906  | Data Uploaded Successfully |
      | Reason.907  | Data Uploaded Successfully |
      | Reason.908  | Data Uploaded Successfully |
      | Reason.909  | Data Uploaded Successfully |
      | Reason.910  | Data Uploaded Successfully |
      | Reason.911  | Data Uploaded Successfully |
      | Reason.912  | Data Uploaded Successfully |
      | Reason.913  | Data Uploaded Successfully |
      | Reason.914  | Data Uploaded Successfully |
      | Reason.915  | Data Uploaded Successfully |
      | Reason.916  | Data Uploaded Successfully |
      | Reason.917  | Data Uploaded Successfully |
      | Reason.918  | Data Uploaded Successfully |
      | Reason.919  | Data Uploaded Successfully |
      | Reason.920  | Data Uploaded Successfully |
      | Reason.921  | Data Uploaded Successfully |
      | Reason.922  | Data Uploaded Successfully |
      | Reason.923  | Data Uploaded Successfully |
      | Reason.924  | Data Uploaded Successfully |
      | Reason.925  | Data Uploaded Successfully |
      | Reason.926  | Data Uploaded Successfully |
      | Reason.927  | Data Uploaded Successfully |
      | Reason.928  | Data Uploaded Successfully |
      | Reason.929  | Data Uploaded Successfully |
      | Reason.930  | Data Uploaded Successfully |
      | Reason.931  | Data Uploaded Successfully |
      | Reason.932  | Data Uploaded Successfully |
      | Reason.933  | Data Uploaded Successfully |
      | Reason.934  | Data Uploaded Successfully |
      | Reason.935  | Data Uploaded Successfully |
      | Reason.936  | Data Uploaded Successfully |
      | Reason.937  | Data Uploaded Successfully |
      | Reason.938  | Data Uploaded Successfully |
      | Reason.939  | Data Uploaded Successfully |
      | Reason.940  | Data Uploaded Successfully |
      | Reason.941  | Data Uploaded Successfully |
      | Reason.942  | Data Uploaded Successfully |
      | Reason.943  | Data Uploaded Successfully |
      | Reason.944  | Data Uploaded Successfully |
      | Reason.945  | Data Uploaded Successfully |
      | Reason.946  | Data Uploaded Successfully |
      | Reason.947  | Data Uploaded Successfully |
      | Reason.948  | Data Uploaded Successfully |
      | Reason.949  | Data Uploaded Successfully |
      | Reason.950  | Data Uploaded Successfully |
      | Reason.951  | Data Uploaded Successfully |
      | Reason.952  | Data Uploaded Successfully |
      | Reason.953  | Data Uploaded Successfully |
      | Reason.954  | Data Uploaded Successfully |
      | Reason.955  | Data Uploaded Successfully |
      | Reason.956  | Data Uploaded Successfully |
      | Reason.957  | Data Uploaded Successfully |
      | Reason.958  | Data Uploaded Successfully |
      | Reason.959  | Data Uploaded Successfully |
      | Reason.960  | Data Uploaded Successfully |
      | Reason.961  | Data Uploaded Successfully |
      | Reason.962  | Data Uploaded Successfully |
      | Reason.963  | Data Uploaded Successfully |
      | Reason.964  | Data Uploaded Successfully |
      | Reason.965  | Data Uploaded Successfully |
      | Reason.966  | Data Uploaded Successfully |
      | Reason.967  | Data Uploaded Successfully |
      | Reason.968  | Data Uploaded Successfully |
      | Reason.969  | Data Uploaded Successfully |
      | Reason.970  | Data Uploaded Successfully |
      | Reason.971  | Data Uploaded Successfully |
      | Reason.972  | Data Uploaded Successfully |
      | Reason.973  | Data Uploaded Successfully |
      | Reason.974  | Data Uploaded Successfully |
      | Reason.975  | Data Uploaded Successfully |
      | Reason.976  | Data Uploaded Successfully |
      | Reason.977  | Data Uploaded Successfully |
      | Reason.978  | Data Uploaded Successfully |
      | Reason.979  | Data Uploaded Successfully |
      | Reason.980  | Data Uploaded Successfully |
      | Reason.981  | Data Uploaded Successfully |
      | Reason.982  | Data Uploaded Successfully |
      | Reason.983  | Data Uploaded Successfully |
      | Reason.984  | Data Uploaded Successfully |
      | Reason.985  | Data Uploaded Successfully |
      | Reason.986  | Data Uploaded Successfully |
      | Reason.987  | Data Uploaded Successfully |
      | Reason.988  | Data Uploaded Successfully |
      | Reason.989  | Data Uploaded Successfully |
      | Reason.990  | Data Uploaded Successfully |
      | Reason.991  | Data Uploaded Successfully |
      | Reason.992  | Data Uploaded Successfully |
      | Reason.993  | Data Uploaded Successfully |
      | Reason.994  | Data Uploaded Successfully |
      | Reason.995  | Data Uploaded Successfully |
      | Reason.996  | Data Uploaded Successfully |
      | Reason.997  | Data Uploaded Successfully |
      | Reason.998  | Data Uploaded Successfully |
      | Reason.999  | Data Uploaded Successfully |
      | Reason.1000 | Data Uploaded Successfully |
    And verify response time is less than "10000" milliseconds

  @BrandTest26
  Scenario: BrandMDM:BrandTest26 - erp_id valid values
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_brand_MDM" payload
      | JPath            | Value                 |
      | data[0].name     | randomString          |
      | data[0].erp_id   | randomString          |
      | data[1].brand_id | DB:brands:id:status=0 |
      | data[1].erp_id   | randomAlphaNumeric    |
    When I post the request with "insertMdmData_brand_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath  | Value |
      | Result | true  |
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And I verify the data got updated as needed from DB
      | expectedColumn                                    | expectedValue      |
      | DB:brands:erp_id: id=(SELECT MAX(id) FROM brands) | randomString       |
      | DB:brands:erp_id: status=0                        | randomString |

    And verify response time is less than "10000" milliseconds

  @BrandTest27
  Scenario: BrandMDM:BrandTest27 - Valid values erp_id
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_brand_MDM" payload
      | JPath            | Value                 |
      | data[0].name     | randomString          |
      | data[0].erp_id   | randomDouble          |
      | data[1].brand_id | DB:brands:id:status=0 |
      | data[1].erp_id   | randomAsciiCharacters |
    When I post the request with "insertMdmData_brand_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath  | Value |
      | Result | true  |
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And I verify the data got updated as needed from DB
      | expectedColumn                                    | expectedValue         |
      | DB:brands:erp_id: id=(SELECT MAX(id) FROM brands) | randomString          |
      | DB:brands:erp_id: status=0                        | randomString |

    And verify response time is less than "10000" milliseconds

  @BrandTest28
  Scenario: BrandMDM:BrandTest28 - Valid values erp_id
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_brand_MDM" payload
      | JPath            | Value                 |
      | data[0].name     | randomString          |
      | data[0].erp_id   | randomString       |
      | data[1].brand_id | DB:brands:id:status=0 |
      | data[1].erp_id   | randomString:51       |
    When I post the request with "insertMdmData_brand_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | false                      |
      | Reason.1 | Data Uploaded Successfully |
    And verifies the field is present in the response
      | JPath             |
      | Reason.2[0].Error |
    And I verify the data got updated as needed from DB
      | expectedColumn                                    | expectedValue   |
      | DB:brands:erp_id: id=(SELECT MAX(id) FROM brands) | randomString |

  @BrandTest29
  Scenario: BrandMDM:BrandTest29 - Bulk upload - mixed valid and invalid date
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertBulkMdmData_brand_MDM" payload
      | JPath          | Value            |
      | data[0].name   | randomString:256 |
      | data[1].name   | randomString     |
      | data[2].name   | randomString     |
      | data[3].name   | randomString     |
      | data[4].name   | randomString     |
      | data[5].name   | randomString     |
      | data[6].name   | randomString     |
      | data[7].name   | randomString     |
      | data[8].name   | randomString     |
      | data[9].name   | randomString     |
      | data[10].name  | randomString     |
      | data[11].name  | randomString     |
      | data[12].name  | randomString     |
      | data[13].name  | randomString     |
      | data[14].name  | randomString     |
      | data[15].name  | randomString     |
      | data[16].name  | randomString     |
      | data[17].name  | randomString     |
      | data[18].name  | randomString     |
      | data[19].name  | randomString     |
      | data[20].name  | randomString     |
      | data[21].name  | randomString     |
      | data[22].name  | randomString     |
      | data[23].name  | randomString     |
      | data[24].name  | randomString     |
      | data[25].name  | randomString     |
      | data[26].name  | randomString     |
      | data[27].name  | randomString     |
      | data[28].name  | randomString     |
      | data[29].name  | randomString     |
      | data[30].name  | randomString     |
      | data[31].name  | randomString     |
      | data[32].name  | randomString     |
      | data[33].name  | randomString     |
      | data[34].name  | randomString     |
      | data[35].name  | randomString     |
      | data[36].name  | randomString     |
      | data[37].name  | randomString     |
      | data[38].name  | randomString     |
      | data[39].name  | randomString     |
      | data[40].name  | randomString     |
      | data[41].name  | randomString     |
      | data[42].name  | randomString     |
      | data[43].name  | randomString     |
      | data[44].name  | randomString     |
      | data[45].name  | randomString     |
      | data[46].name  | randomString     |
      | data[47].name  | randomString     |
      | data[48].name  | randomString     |
      | data[49].name  | randomString     |
      | data[50].name  | randomString     |
      | data[51].name  | randomString     |
      | data[52].name  | randomString     |
      | data[53].name  | randomString:256 |
      | data[54].name  | randomString     |
      | data[55].name  | randomString     |
      | data[56].name  | randomString     |
      | data[57].name  | randomString     |
      | data[58].name  | randomString     |
      | data[59].name  | randomString     |
      | data[60].name  | randomString     |
      | data[61].name  | randomString     |
      | data[62].name  | randomString     |
      | data[63].name  | randomString     |
      | data[64].name  | randomString     |
      | data[65].name  | randomString     |
      | data[66].name  | randomString     |
      | data[67].name  | randomString     |
      | data[68].name  | randomString     |
      | data[69].name  | randomString     |
      | data[70].name  | randomString     |
      | data[71].name  | randomString     |
      | data[72].name  | randomString     |
      | data[73].name  | randomString     |
      | data[74].name  | randomString     |
      | data[75].name  | randomString     |
      | data[76].name  | randomString     |
      | data[77].name  | randomString     |
      | data[78].name  | randomString     |
      | data[79].name  | randomString     |
      | data[80].name  | randomString     |
      | data[81].name  | randomString     |
      | data[82].name  | randomString     |
      | data[83].name  | randomString     |
      | data[84].name  | randomString     |
      | data[85].name  | randomString     |
      | data[86].name  | randomString     |
      | data[87].name  | randomString     |
      | data[88].name  | randomString     |
      | data[89].name  | randomString     |
      | data[90].name  | randomString     |
      | data[91].name  | randomString     |
      | data[92].name  | randomString     |
      | data[93].name  | randomString     |
      | data[94].name  | randomString     |
      | data[95].name  | randomString     |
      | data[96].name  | randomString     |
      | data[97].name  | randomString     |
      | data[98].name  | randomString     |
      | data[99].name  | randomString     |
      | data[100].name | randomString     |
      | data[101].name | randomString     |
      | data[102].name | randomString     |
      | data[103].name | randomString     |
      | data[104].name | randomString     |
      | data[105].name | randomString     |
      | data[106].name | randomString     |
      | data[107].name | randomString     |
      | data[108].name | randomString     |
      | data[109].name | randomString     |
      | data[110].name | randomString     |
      | data[111].name | randomString:256 |
      | data[112].name | randomString     |
      | data[113].name | randomString     |
      | data[114].name | randomString     |
      | data[115].name | randomString     |
      | data[116].name | randomString     |
      | data[117].name | randomString     |
      | data[118].name | randomString     |
      | data[119].name | randomString     |
      | data[120].name | randomString     |
      | data[121].name | randomString     |
      | data[122].name | randomString     |
      | data[123].name | randomString     |
      | data[124].name | randomString     |
      | data[125].name | randomString     |
      | data[126].name | randomString     |
      | data[127].name | randomString     |
      | data[128].name | randomString     |
      | data[129].name | randomString     |
      | data[130].name | randomString     |
      | data[131].name | randomString     |
      | data[132].name | randomString     |
      | data[133].name | randomString     |
      | data[134].name | randomString     |
      | data[135].name | randomString     |
      | data[136].name | randomString     |
      | data[137].name | randomString     |
      | data[138].name | randomString     |
      | data[139].name | randomString     |
      | data[140].name | randomString     |
      | data[141].name | randomString     |
      | data[142].name | randomString     |
      | data[143].name | randomString     |
      | data[144].name | randomString     |
      | data[145].name | randomString     |
      | data[146].name | randomString     |
      | data[147].name | randomString     |
      | data[148].name | randomString     |
      | data[149].name | randomString     |
      | data[150].name | randomString     |
      | data[151].name | randomString     |
      | data[152].name | randomString     |
      | data[153].name | randomString     |
      | data[154].name | randomString     |
      | data[155].name | randomString     |
      | data[156].name | randomString     |
      | data[157].name | randomString     |
      | data[158].name | randomString     |
      | data[159].name | randomString     |
      | data[160].name | randomString     |
      | data[161].name | randomString     |
      | data[162].name | randomString     |
      | data[163].name | randomString     |
      | data[164].name | randomString     |
      | data[165].name | randomString     |
      | data[166].name | randomString     |
      | data[167].name | randomString     |
      | data[168].name | randomString     |
      | data[169].name | randomString     |
      | data[170].name | randomString     |
      | data[171].name | randomString     |
      | data[172].name | randomString     |
      | data[173].name | randomString     |
      | data[174].name | randomString     |
      | data[175].name | randomString     |
      | data[176].name | randomString     |
      | data[177].name | randomString     |
      | data[178].name | randomString     |
      | data[179].name | randomString     |
      | data[180].name | randomString     |
      | data[181].name | randomString     |
      | data[182].name | randomString     |
      | data[183].name | randomString     |
      | data[184].name | randomString     |
      | data[185].name | randomString     |
      | data[186].name | randomString     |
      | data[187].name | randomString     |
      | data[188].name | randomString     |
      | data[189].name | randomString     |
      | data[190].name | randomString     |
      | data[191].name | randomString     |
      | data[192].name | randomString     |
      | data[193].name | randomString     |
      | data[194].name | randomString     |
      | data[195].name | randomString     |
      | data[196].name | randomString     |
      | data[197].name | randomString     |
      | data[198].name | randomString     |
      | data[199].name | randomString     |
      | data[200].name | randomString     |
      | data[201].name | randomString     |
      | data[202].name | randomString     |
      | data[203].name | randomString     |
      | data[204].name | randomString     |
      | data[205].name | randomString     |
      | data[206].name | randomString     |
      | data[207].name | randomString     |
      | data[208].name | randomString     |
      | data[209].name | randomString     |
      | data[210].name | randomString     |
      | data[211].name | randomString     |
      | data[212].name | randomString     |
      | data[213].name | randomString     |
      | data[214].name | randomString     |
      | data[215].name | randomString     |
      | data[216].name | randomString     |
      | data[217].name | randomString     |
      | data[218].name | randomString     |
      | data[219].name | randomString     |
      | data[220].name | randomString     |
      | data[221].name | randomString     |
      | data[222].name | randomString     |
      | data[223].name | randomString     |
      | data[224].name | randomString     |
      | data[225].name | randomString     |
      | data[226].name | randomString     |
      | data[227].name | randomString     |
      | data[228].name | randomString     |
      | data[229].name | randomString     |
      | data[230].name | randomString     |
      | data[231].name | randomString     |
      | data[232].name | randomString     |
      | data[233].name | randomString     |
      | data[234].name | randomString     |
      | data[235].name | randomString     |
      | data[236].name | randomString     |
      | data[237].name | randomString     |
      | data[238].name | randomString     |
      | data[239].name | randomString     |
      | data[240].name | randomString     |
      | data[241].name | randomString     |
      | data[242].name | randomString     |
      | data[243].name | randomString     |
      | data[244].name | randomString     |
      | data[245].name | randomString     |
      | data[246].name | randomString     |
      | data[247].name | randomString     |
      | data[248].name | randomString     |
      | data[249].name | randomString     |
      | data[250].name | randomString     |
      | data[251].name | randomString     |
      | data[252].name | randomString     |
      | data[253].name | randomString     |
      | data[254].name | randomString     |
      | data[255].name | randomString     |
      | data[256].name | randomString     |
      | data[257].name | randomString     |
      | data[258].name | randomString     |
      | data[259].name | randomString     |
      | data[260].name | randomString     |
      | data[261].name | randomString     |
      | data[262].name | randomString     |
      | data[263].name | randomString     |
      | data[264].name | randomString     |
      | data[265].name | randomString     |
      | data[266].name | randomString     |
      | data[267].name | randomString     |
      | data[268].name | randomString     |
      | data[269].name | randomString     |
      | data[270].name | randomString     |
      | data[271].name | randomString     |
      | data[272].name | randomString     |
      | data[273].name | randomString     |
      | data[274].name | randomString     |
      | data[275].name | randomString     |
      | data[276].name | randomString     |
      | data[277].name | randomString     |
      | data[278].name | randomString     |
      | data[279].name | randomString     |
      | data[280].name | randomString     |
      | data[281].name | randomString     |
      | data[282].name | randomString     |
      | data[283].name | randomString     |
      | data[284].name | randomString     |
      | data[285].name | randomString     |
      | data[286].name | randomString     |
      | data[287].name | randomString     |
      | data[288].name | randomString     |
      | data[289].name | randomString     |
      | data[290].name | randomString     |
      | data[291].name | randomString     |
      | data[292].name | randomString     |
      | data[293].name | randomString     |
      | data[294].name | randomString     |
      | data[295].name | randomString     |
      | data[296].name | randomString     |
      | data[297].name | randomString     |
      | data[298].name | randomString     |
      | data[299].name | randomString     |
      | data[300].name | randomString     |
      | data[301].name | randomString     |
      | data[302].name | randomString     |
      | data[303].name | randomString     |
      | data[304].name | randomString     |
      | data[305].name | randomString     |
      | data[306].name | randomString     |
      | data[307].name | randomString     |
      | data[308].name | randomString     |
      | data[309].name | randomString     |
      | data[310].name | randomString     |
      | data[311].name | randomString     |
      | data[312].name | randomString     |
      | data[313].name | randomString     |
      | data[314].name | randomString     |
      | data[315].name | randomString     |
      | data[316].name | randomString     |
      | data[317].name | randomString     |
      | data[318].name | randomString     |
      | data[319].name | randomString     |
      | data[320].name | randomString     |
      | data[321].name | randomString     |
      | data[322].name | randomString     |
      | data[323].name | randomString     |
      | data[324].name | randomString     |
      | data[325].name | randomString     |
      | data[326].name | randomString     |
      | data[327].name | randomString     |
      | data[328].name | randomString     |
      | data[329].name | randomString     |
      | data[330].name | randomString     |
      | data[331].name | randomString     |
      | data[332].name | randomString     |
      | data[333].name | randomString     |
      | data[334].name | randomString     |
      | data[335].name | randomString     |
      | data[336].name | randomString     |
      | data[337].name | randomString     |
      | data[338].name | randomString     |
      | data[339].name | randomString     |
      | data[340].name | randomString     |
      | data[341].name | randomString     |
      | data[342].name | randomString     |
      | data[343].name | randomString     |
      | data[344].name | randomString     |
      | data[345].name | randomString     |
      | data[346].name | randomString     |
      | data[347].name | randomString     |
      | data[348].name | randomString     |
      | data[349].name | randomString     |
      | data[350].name | randomString     |
      | data[351].name | randomString     |
      | data[352].name | randomString     |
      | data[353].name | randomString     |
      | data[354].name | randomString     |
      | data[355].name | randomString     |
      | data[356].name | randomString     |
      | data[357].name | randomString     |
      | data[358].name | randomString     |
      | data[359].name | randomString     |
      | data[360].name | randomString     |
      | data[361].name | randomString     |
      | data[362].name | randomString     |
      | data[363].name | randomString     |
      | data[364].name | randomString     |
      | data[365].name | randomString     |
      | data[366].name | randomString     |
      | data[367].name | randomString     |
      | data[368].name | randomString     |
      | data[369].name | randomString     |
      | data[370].name | randomString     |
      | data[371].name | randomString     |
      | data[372].name | randomString     |
      | data[373].name | randomString     |
      | data[374].name | randomString     |
      | data[375].name | randomString     |
      | data[376].name | randomString     |
      | data[377].name | randomString     |
      | data[378].name | randomString     |
      | data[379].name | randomString     |
      | data[380].name | randomString     |
      | data[381].name | randomString     |
      | data[382].name | randomString     |
      | data[383].name | randomString     |
      | data[384].name | randomString     |
      | data[385].name | randomString     |
      | data[386].name | randomString     |
      | data[387].name | randomString     |
      | data[388].name | randomString     |
      | data[389].name | randomString     |
      | data[390].name | randomString     |
      | data[391].name | randomString     |
      | data[392].name | randomString     |
      | data[393].name | randomString     |
      | data[394].name | randomString     |
      | data[395].name | randomString     |
      | data[396].name | randomString     |
      | data[397].name | randomString     |
      | data[398].name | randomString     |
      | data[399].name | randomString     |
      | data[400].name | randomString     |
      | data[401].name | randomString     |
      | data[402].name | randomString     |
      | data[403].name | randomString     |
      | data[404].name | randomString     |
      | data[405].name | randomString     |
      | data[406].name | randomString     |
      | data[407].name | randomString     |
      | data[408].name | randomString     |
      | data[409].name | randomString     |
      | data[410].name | randomString     |
      | data[411].name | randomString     |
      | data[412].name | randomString     |
      | data[413].name | randomString     |
      | data[414].name | randomString     |
      | data[415].name | randomString     |
      | data[416].name | randomString     |
      | data[417].name | randomString     |
      | data[418].name | randomString     |
      | data[419].name | randomString     |
      | data[420].name | randomString     |
      | data[421].name | randomString     |
      | data[422].name | randomString     |
      | data[423].name | randomString     |
      | data[424].name | randomString     |
      | data[425].name | randomString     |
      | data[426].name | randomString     |
      | data[427].name | randomString     |
      | data[428].name | randomString     |
      | data[429].name | randomString     |
      | data[430].name | randomString     |
      | data[431].name | randomString     |
      | data[432].name | randomString     |
      | data[433].name | randomString     |
      | data[434].name | randomString     |
      | data[435].name | randomString     |
      | data[436].name | randomString     |
      | data[437].name | randomString     |
      | data[438].name | randomString     |
      | data[439].name | randomString     |
      | data[440].name | randomString     |
      | data[441].name | randomString     |
      | data[442].name | randomString     |
      | data[443].name | randomString     |
      | data[444].name | randomString     |
      | data[445].name | randomString     |
      | data[446].name | randomString     |
      | data[447].name | randomString     |
      | data[448].name | randomString     |
      | data[449].name | randomString     |
      | data[450].name | randomString     |
      | data[451].name | randomString     |
      | data[452].name | randomString     |
      | data[453].name | randomString     |
      | data[454].name | randomString     |
      | data[455].name | randomString     |
      | data[456].name | randomString     |
      | data[457].name | randomString     |
      | data[458].name | randomString     |
      | data[459].name | randomString     |
      | data[460].name | randomString     |
      | data[461].name | randomString     |
      | data[462].name | randomString     |
      | data[463].name | randomString     |
      | data[464].name | randomString     |
      | data[465].name | randomString     |
      | data[466].name | randomString     |
      | data[467].name | randomString     |
      | data[468].name | randomString     |
      | data[469].name | randomString     |
      | data[470].name | randomString     |
      | data[471].name | randomString     |
      | data[472].name | randomString     |
      | data[473].name | randomString     |
      | data[474].name | randomString     |
      | data[475].name | randomString     |
      | data[476].name | randomString     |
      | data[477].name | randomString     |
      | data[478].name | randomString     |
      | data[479].name | randomString     |
      | data[480].name | randomString     |
      | data[481].name | randomString     |
      | data[482].name | randomString     |
      | data[483].name | randomString     |
      | data[484].name | randomString     |
      | data[485].name | randomString     |
      | data[486].name | randomString     |
      | data[487].name | randomString     |
      | data[488].name | randomString     |
      | data[489].name | randomString     |
      | data[490].name | randomString     |
      | data[491].name | randomString     |
      | data[492].name | randomString     |
      | data[493].name | randomString     |
      | data[494].name | randomString     |
      | data[495].name | randomString     |
      | data[496].name | randomString     |
      | data[497].name | randomString     |
      | data[498].name | randomString     |
      | data[499].name | randomString     |
      | data[500].name | randomString     |
      | data[501].name | randomString     |
      | data[502].name | randomString     |
      | data[503].name | randomString     |
      | data[504].name | randomString     |
      | data[505].name | randomString     |
      | data[506].name | randomString     |
      | data[507].name | randomString     |
      | data[508].name | randomString     |
      | data[509].name | randomString     |
      | data[510].name | randomString     |
      | data[511].name | randomString     |
      | data[512].name | randomString     |
      | data[513].name | randomString     |
      | data[514].name | randomString     |
      | data[515].name | randomString     |
      | data[516].name | randomString     |
      | data[517].name | randomString     |
      | data[518].name | randomString     |
      | data[519].name | randomString     |
      | data[520].name | randomString     |
      | data[521].name | randomString     |
      | data[522].name | randomString     |
      | data[523].name | randomString     |
      | data[524].name | randomString     |
      | data[525].name | randomString     |
      | data[526].name | randomString     |
      | data[527].name | randomString     |
      | data[528].name | randomString     |
      | data[529].name | randomString     |
      | data[530].name | randomString     |
      | data[531].name | randomString     |
      | data[532].name | randomString     |
      | data[533].name | randomString     |
      | data[534].name | randomString     |
      | data[535].name | randomString     |
      | data[536].name | randomString     |
      | data[537].name | randomString     |
      | data[538].name | randomString     |
      | data[539].name | randomString     |
      | data[540].name | randomString     |
      | data[541].name | randomString     |
      | data[542].name | randomString     |
      | data[543].name | randomString     |
      | data[544].name | randomString     |
      | data[545].name | randomString     |
      | data[546].name | randomString     |
      | data[547].name | randomString     |
      | data[548].name | randomString     |
      | data[549].name | randomString     |
      | data[550].name | randomString     |
      | data[551].name | randomString     |
      | data[552].name | randomString     |
      | data[553].name | randomString     |
      | data[554].name | randomString     |
      | data[555].name | randomString     |
      | data[556].name | randomString     |
      | data[557].name | randomString     |
      | data[558].name | randomString     |
      | data[559].name | randomString     |
      | data[560].name | randomString     |
      | data[561].name | randomString     |
      | data[562].name | randomString     |
      | data[563].name | randomString     |
      | data[564].name | randomString     |
      | data[565].name | randomString     |
      | data[566].name | randomString     |
      | data[567].name | randomString     |
      | data[568].name | randomString     |
      | data[569].name | randomString     |
      | data[570].name | randomString     |
      | data[571].name | randomString     |
      | data[572].name | randomString     |
      | data[573].name | randomString     |
      | data[574].name | randomString     |
      | data[575].name | randomString     |
      | data[576].name | randomString     |
      | data[577].name | randomString     |
      | data[578].name | randomString     |
      | data[579].name | randomString     |
      | data[580].name | randomString     |
      | data[581].name | randomString     |
      | data[582].name | randomString     |
      | data[583].name | randomString     |
      | data[584].name | randomString     |
      | data[585].name | randomString     |
      | data[586].name | randomString     |
      | data[587].name | randomString     |
      | data[588].name | randomString     |
      | data[589].name | randomString     |
      | data[590].name | randomString     |
      | data[591].name | randomString     |
      | data[592].name | randomString     |
      | data[593].name | randomString     |
      | data[594].name | randomString     |
      | data[595].name | randomString     |
      | data[596].name | randomString     |
      | data[597].name | randomString     |
      | data[598].name | randomString     |
      | data[599].name | randomString     |
      | data[600].name | randomString     |
      | data[601].name | randomString     |
      | data[602].name | randomString     |
      | data[603].name | randomString     |
      | data[604].name | randomString     |
      | data[605].name | randomString     |
      | data[606].name | randomString     |
      | data[607].name | randomString     |
      | data[608].name | randomString     |
      | data[609].name | randomString     |
      | data[610].name | randomString     |
      | data[611].name | randomString     |
      | data[612].name | randomString     |
      | data[613].name | randomString     |
      | data[614].name | randomString     |
      | data[615].name | randomString     |
      | data[616].name | randomString     |
      | data[617].name | randomString     |
      | data[618].name | randomString     |
      | data[619].name | randomString     |
      | data[620].name | randomString     |
      | data[621].name | randomString     |
      | data[622].name | randomString     |
      | data[623].name | randomString     |
      | data[624].name | randomString     |
      | data[625].name | randomString     |
      | data[626].name | randomString     |
      | data[627].name | randomString     |
      | data[628].name | randomString     |
      | data[629].name | randomString     |
      | data[630].name | randomString     |
      | data[631].name | randomString     |
      | data[632].name | randomString     |
      | data[633].name | randomString     |
      | data[634].name | randomString     |
      | data[635].name | randomString     |
      | data[636].name | randomString     |
      | data[637].name | randomString     |
      | data[638].name | randomString     |
      | data[639].name | randomString     |
      | data[640].name | randomString     |
      | data[641].name | randomString     |
      | data[642].name | randomString     |
      | data[643].name | randomString     |
      | data[644].name | randomString     |
      | data[645].name | randomString     |
      | data[646].name | randomString     |
      | data[647].name | randomString     |
      | data[648].name | randomString     |
      | data[649].name | randomString     |
      | data[650].name | randomString     |
      | data[651].name | randomString     |
      | data[652].name | randomString     |
      | data[653].name | randomString     |
      | data[654].name | randomString     |
      | data[655].name | randomString     |
      | data[656].name | randomString     |
      | data[657].name | randomString     |
      | data[658].name | randomString     |
      | data[659].name | randomString     |
      | data[660].name | randomString     |
      | data[661].name | randomString     |
      | data[662].name | randomString     |
      | data[663].name | randomString     |
      | data[664].name | randomString     |
      | data[665].name | randomString     |
      | data[666].name | randomString     |
      | data[667].name | randomString     |
      | data[668].name | randomString     |
      | data[669].name | randomString     |
      | data[670].name | randomString     |
      | data[671].name | randomString     |
      | data[672].name | randomString     |
      | data[673].name | randomString     |
      | data[674].name | randomString     |
      | data[675].name | randomString     |
      | data[676].name | randomString     |
      | data[677].name | randomString     |
      | data[678].name | randomString     |
      | data[679].name | randomString     |
      | data[680].name | randomString     |
      | data[681].name | randomString     |
      | data[682].name | randomString     |
      | data[683].name | randomString     |
      | data[684].name | randomString     |
      | data[685].name | randomString     |
      | data[686].name | randomString     |
      | data[687].name | randomString     |
      | data[688].name | randomString     |
      | data[689].name | randomString     |
      | data[690].name | randomString     |
      | data[691].name | randomString     |
      | data[692].name | randomString     |
      | data[693].name | randomString     |
      | data[694].name | randomString     |
      | data[695].name | randomString     |
      | data[696].name | randomString     |
      | data[697].name | randomString     |
      | data[698].name | randomString     |
      | data[699].name | randomString     |
      | data[700].name | randomString     |
      | data[701].name | randomString     |
      | data[702].name | randomString     |
      | data[703].name | randomString     |
      | data[704].name | randomString     |
      | data[705].name | randomString     |
      | data[706].name | randomString     |
      | data[707].name | randomString     |
      | data[708].name | randomString     |
      | data[709].name | randomString     |
      | data[710].name | randomString     |
      | data[711].name | randomString     |
      | data[712].name | randomString     |
      | data[713].name | randomString     |
      | data[714].name | randomString     |
      | data[715].name | randomString     |
      | data[716].name | randomString     |
      | data[717].name | randomString     |
      | data[718].name | randomString     |
      | data[719].name | randomString     |
      | data[720].name | randomString     |
      | data[721].name | randomString     |
      | data[722].name | randomString     |
      | data[723].name | randomString     |
      | data[724].name | randomString     |
      | data[725].name | randomString     |
      | data[726].name | randomString     |
      | data[727].name | randomString     |
      | data[728].name | randomString     |
      | data[729].name | randomString     |
      | data[730].name | randomString     |
      | data[731].name | randomString     |
      | data[732].name | randomString     |
      | data[733].name | randomString     |
      | data[734].name | randomString     |
      | data[735].name | randomString     |
      | data[736].name | randomString     |
      | data[737].name | randomString     |
      | data[738].name | randomString     |
      | data[739].name | randomString     |
      | data[740].name | randomString     |
      | data[741].name | randomString     |
      | data[742].name | randomString     |
      | data[743].name | randomString     |
      | data[744].name | randomString     |
      | data[745].name | randomString     |
      | data[746].name | randomString     |
      | data[747].name | randomString     |
      | data[748].name | randomString     |
      | data[749].name | randomString     |
      | data[750].name | randomString     |
      | data[751].name | randomString     |
      | data[752].name | randomString     |
      | data[753].name | randomString     |
      | data[754].name | randomString     |
      | data[755].name | randomString     |
      | data[756].name | randomString     |
      | data[757].name | randomString     |
      | data[758].name | randomString     |
      | data[759].name | randomString     |
      | data[760].name | randomString     |
      | data[761].name | randomString     |
      | data[762].name | randomString     |
      | data[763].name | randomString     |
      | data[764].name | randomString     |
      | data[765].name | randomString     |
      | data[766].name | randomString     |
      | data[767].name | randomString     |
      | data[768].name | randomString     |
      | data[769].name | randomString     |
      | data[770].name | randomString     |
      | data[771].name | randomString     |
      | data[772].name | randomString     |
      | data[773].name | randomString     |
      | data[774].name | randomString     |
      | data[775].name | randomString     |
      | data[776].name | randomString     |
      | data[777].name | randomString     |
      | data[778].name | randomString     |
      | data[779].name | randomString     |
      | data[780].name | randomString     |
      | data[781].name | randomString     |
      | data[782].name | randomString     |
      | data[783].name | randomString     |
      | data[784].name | randomString     |
      | data[785].name | randomString     |
      | data[786].name | randomString     |
      | data[787].name | randomString     |
      | data[788].name | randomString     |
      | data[789].name | randomString     |
      | data[790].name | randomString     |
      | data[791].name | randomString     |
      | data[792].name | randomString     |
      | data[793].name | randomString     |
      | data[794].name | randomString     |
      | data[795].name | randomString     |
      | data[796].name | randomString     |
      | data[797].name | randomString     |
      | data[798].name | randomString     |
      | data[799].name | randomString     |
      | data[800].name | randomString     |
      | data[801].name | randomString     |
      | data[802].name | randomString     |
      | data[803].name | randomString     |
      | data[804].name | randomString     |
      | data[805].name | randomString     |
      | data[806].name | randomString     |
      | data[807].name | randomString     |
      | data[808].name | randomString     |
      | data[809].name | randomString     |
      | data[810].name | randomString     |
      | data[811].name | randomString     |
      | data[812].name | randomString     |
      | data[813].name | randomString     |
      | data[814].name | randomString     |
      | data[815].name | randomString     |
      | data[816].name | randomString     |
      | data[817].name | randomString     |
      | data[818].name | randomString     |
      | data[819].name | randomString     |
      | data[820].name | randomString     |
      | data[821].name | randomString     |
      | data[822].name | randomString     |
      | data[823].name | randomString     |
      | data[824].name | randomString     |
      | data[825].name | randomString     |
      | data[826].name | randomString     |
      | data[827].name | randomString     |
      | data[828].name | randomString     |
      | data[829].name | randomString     |
      | data[830].name | randomString     |
      | data[831].name | randomString     |
      | data[832].name | randomString     |
      | data[833].name | randomString     |
      | data[834].name | randomString     |
      | data[835].name | randomString     |
      | data[836].name | randomString     |
      | data[837].name | randomString     |
      | data[838].name | randomString     |
      | data[839].name | randomString     |
      | data[840].name | randomString     |
      | data[841].name | randomString     |
      | data[842].name | randomString     |
      | data[843].name | randomString     |
      | data[844].name | randomString     |
      | data[845].name | randomString     |
      | data[846].name | randomString     |
      | data[847].name | randomString     |
      | data[848].name | randomString     |
      | data[849].name | randomString     |
      | data[850].name | randomString     |
      | data[851].name | randomString     |
      | data[852].name | randomString     |
      | data[853].name | randomString     |
      | data[854].name | randomString     |
      | data[855].name | randomString     |
      | data[856].name | randomString     |
      | data[857].name | randomString     |
      | data[858].name | randomString     |
      | data[859].name | randomString     |
      | data[860].name | randomString     |
      | data[861].name | randomString     |
      | data[862].name | randomString     |
      | data[863].name | randomString     |
      | data[864].name | randomString     |
      | data[865].name | randomString     |
      | data[866].name | randomString     |
      | data[867].name | randomString     |
      | data[868].name | randomString     |
      | data[869].name | randomString     |
      | data[870].name | randomString     |
      | data[871].name | randomString     |
      | data[872].name | randomString     |
      | data[873].name | randomString     |
      | data[874].name | randomString     |
      | data[875].name | randomString     |
      | data[876].name | randomString     |
      | data[877].name | randomString     |
      | data[878].name | randomString     |
      | data[879].name | randomString     |
      | data[880].name | randomString     |
      | data[881].name | randomString     |
      | data[882].name | randomString     |
      | data[883].name | randomString     |
      | data[884].name | randomString     |
      | data[885].name | randomString     |
      | data[886].name | randomString     |
      | data[887].name | randomString     |
      | data[888].name | randomString     |
      | data[889].name | randomString     |
      | data[890].name | randomString     |
      | data[891].name | randomString     |
      | data[892].name | randomString     |
      | data[893].name | randomString     |
      | data[894].name | randomString     |
      | data[895].name | randomString     |
      | data[896].name | randomString     |
      | data[897].name | randomString     |
      | data[898].name | randomString     |
      | data[899].name | randomString     |
      | data[900].name | randomString     |
      | data[901].name | randomString     |
      | data[902].name | randomString     |
      | data[903].name | randomString     |
      | data[904].name | randomString     |
      | data[905].name | randomString     |
      | data[906].name | randomString     |
      | data[907].name | randomString     |
      | data[908].name | randomString     |
      | data[909].name | randomString     |
      | data[910].name | randomString     |
      | data[911].name | randomString     |
      | data[912].name | randomString     |
      | data[913].name | randomString     |
      | data[914].name | randomString     |
      | data[915].name | randomString     |
      | data[916].name | randomString     |
      | data[917].name | randomString     |
      | data[918].name | randomString     |
      | data[919].name | randomString     |
      | data[920].name | randomString     |
      | data[921].name | randomString     |
      | data[922].name | randomString     |
      | data[923].name | randomString     |
      | data[924].name | randomString     |
      | data[925].name | randomString     |
      | data[926].name | randomString     |
      | data[927].name | randomString     |
      | data[928].name | randomString     |
      | data[929].name | randomString     |
      | data[930].name | randomString     |
      | data[931].name | randomString     |
      | data[932].name | randomString     |
      | data[933].name | randomString     |
      | data[934].name | randomString     |
      | data[935].name | randomString     |
      | data[936].name | randomString     |
      | data[937].name | randomString     |
      | data[938].name | randomString     |
      | data[939].name | randomString     |
      | data[940].name | randomString     |
      | data[941].name | randomString     |
      | data[942].name | randomString     |
      | data[943].name | randomString     |
      | data[944].name | randomString     |
      | data[945].name | randomString     |
      | data[946].name | randomString     |
      | data[947].name | randomString     |
      | data[948].name | randomString     |
      | data[949].name | randomString     |
      | data[950].name | randomString     |
      | data[951].name | randomString     |
      | data[952].name | randomString     |
      | data[953].name | randomString     |
      | data[954].name | randomString     |
      | data[955].name | randomString     |
      | data[956].name | randomString     |
      | data[957].name | randomString     |
      | data[958].name | randomString     |
      | data[959].name | randomString     |
      | data[960].name | randomString     |
      | data[961].name | randomString     |
      | data[962].name | randomString     |
      | data[963].name | randomString     |
      | data[964].name | randomString     |
      | data[965].name | randomString     |
      | data[966].name | randomString     |
      | data[967].name | randomString     |
      | data[968].name | randomString     |
      | data[969].name | randomString     |
      | data[970].name | randomString     |
      | data[971].name | randomString     |
      | data[972].name | randomString     |
      | data[973].name | randomString     |
      | data[974].name | randomString     |
      | data[975].name | randomString     |
      | data[976].name | randomString     |
      | data[977].name | randomString     |
      | data[978].name | randomString     |
      | data[979].name | randomString     |
      | data[980].name | randomString     |
      | data[981].name | randomString     |
      | data[982].name | randomString     |
      | data[983].name | randomString     |
      | data[984].name | randomString     |
      | data[985].name | randomString     |
      | data[986].name | randomString     |
      | data[987].name | randomString     |
      | data[988].name | randomString     |
      | data[989].name | randomString     |
      | data[990].name | randomString     |
      | data[991].name | randomString     |
      | data[992].name | randomString     |
      | data[993].name | randomString     |
      | data[994].name | randomString     |
      | data[995].name | randomString     |
      | data[996].name | randomString     |
      | data[997].name | randomString     |
      | data[998].name | randomString     |
      | data[999].name | randomString     |
    When I post the request with "insertBulkMdmData_brand_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath  | Value |
      | Result | false |
    And verify response time is less than "10000" milliseconds

  @BrandTest30
  Scenario: BrandMDM:BrandTest30 - isvisible_retailer default -valid values 0 and 1 passed
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_brand_MDM" payload
      | JPath             | Value                 |
      | data[0].name      | randomString          |
      | data[0].isvisible | 1                     |
      | data[1].brand_id  | DB:brands:id:status=0 |
      | data[1].name      | randomString          |
      | data[1].isvisible | 0                     |
    When I post the request with "insertMdmData_brand_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath  | Value |
      | Result | true  |
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And I verify the data got updated as needed from DB
      | expectedColumn                                       | expectedValue |
      | DB:brands:isvisible: id=(SELECT MAX(id) FROM brands) | true             |
      | DB:brands:isvisible: status=0                        | false             |
    And verify response time is less than "10000" milliseconds
  @BrandTest32
  Scenario: BrandMDM:BrandTest32 - duplicate name for update
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_brand_MDM" payload
      | JPath            | Value                   |
      | data[0].brand_id | DB:brands:id:status=0   |
      | data[0].name     | DB:brands:name:status=1 |
    When I post the request with "insertMdmData_brand_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath  | Value |
      | Result | false |
    |Reason.1[0].Error|"Name already exists in the system."|
    And verify response time is less than "10000" milliseconds

  @BrandTest33
  Scenario: BrandMDM:BrandTest33 - duplicate erp_id for update
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_brand_MDM" payload
      | JPath            | Value                   |
      | data[0].brand_id | DB:brands:id:status=0   |
      | data[0].erp_id    | DB:brands:erp_id IS NOT NULL |
    When I post the request with "insertMdmData_brand_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath  | Value |
      | Result | false |
      |Reason.1[0].Error|"Erp_id already exists in the system."|


    And verify response time is less than "10000" milliseconds


  # End of Brand MDM tests.
