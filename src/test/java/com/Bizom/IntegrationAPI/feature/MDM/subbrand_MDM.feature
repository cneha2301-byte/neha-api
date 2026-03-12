@Execution @MDM @SubbrandMDM

Feature: All testcases of Area MDM

  @Subbrand1
  Scenario: SubbrandMDM:Subbrand1 - Upload - mandatory field name provided (positive)
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_subbrand_mdm" payload
      | JPath        | Value        |
      | data[0].name | randomString |
      | data[1].name | randomString |
    When I post the request with "insertMdmData_subbrand_mdm" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And verify response time is less than "3000" milliseconds

  @Subbrand2
  Scenario: SubbrandMDM:Subbrand2 - Upload - mandatory field name not provided (negative)
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_subbrand_mdm" payload
      | JPath             | Value |
      | data[0].is_active | 1     |
      | data[1].is_active | 1     |
    When I post the request with "insertMdmData_subbrand_mdm" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath             | Value                                            |
      | Result            | false                                            |
      | Reason.1[0].Error | The name is required for creating the Subbrands. |
      | Reason.2[0].Error | The name is required for creating the Subbrands. |
    And verify response time is less than "3000" milliseconds

  @Subbrand3
  Scenario: SubbrandMDM:Subbrand3 - Data verification by passing all fields valid data -For upload
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_subbrand_mdm" payload
      | JPath                      | Value                 |
      | data[0].name               | randomString          |
      | data[0].is_active          | 1                     |
      | data[0].isvisible_retailer | 1                     |
      | data[0].erp_id             | randomString          |
      | data[0].brand_id           | DB:brands:id:status=1 |
      | data[0].imageurl           | randomString          |
      | data[1].name               | randomString          |
      | data[1].is_active          | 1                     |
      | data[1].isvisible_retailer | 1                     |
      | data[1].erp_id             | randomString          |
      | data[1].brand_id           | DB:brands:id:status=1 |
      | data[1].imageurl           | randomString          |
    When I post the request with "insertMdmData_subbrand_mdm" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And I verify the data got updated as needed from DB
      | expectedColumn                                                        | expectedValue         |
      | DB:subbrands:name: id=(SELECT MAX(id)-1 FROM subbrands)               | randomString          |
      | DB:subbrands:is_active: id=(SELECT MAX(id)-1 FROM subbrands)          | true                  |
      | DB:subbrands:isvisible_retailer: id=(SELECT MAX(id)-1 FROM subbrands) | true                  |
      | DB:subbrands:erp_id: id=(SELECT MAX(id)-1 FROM subbrands)             | randomString          |
      | DB:subbrands:brand_id: id=(SELECT MAX(id)-1 FROM subbrands)           | DB:brands:id:status=1 |
      | DB:subbrands:imageurl: id=(SELECT MAX(id)-1 FROM subbrands)           | randomString          |
      | DB:subbrands:name: id=(SELECT MAX(id) FROM subbrands)                 | randomString          |
      | DB:subbrands:is_active: id=(SELECT MAX(id) FROM subbrands)            | true                  |
      | DB:subbrands:isvisible_retailer: id=(SELECT MAX(id) FROM subbrands)   | true                  |
      | DB:subbrands:erp_id: id=(SELECT MAX(id) FROM subbrands)               | randomString          |
      | DB:subbrands:brand_id: id=(SELECT MAX(id) FROM subbrands)             | DB:brands:id:status=1 |
      | DB:subbrands:imageurl: id=(SELECT MAX(id) FROM subbrands)             | randomString          |
    And verify response time is less than "3000" milliseconds

  @Subbrand4
  Scenario: SubbrandMDM:Subbrand4 - Data verification by passing all fields valid data -For update
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_subbrand_mdm" payload
      | JPath                      | Value                 |
      | data[0].subbrand_id        | DB:subbrands:id:id=1  |
      | data[0].name               | randomString          |
      | data[0].is_active          | 0                     |
      | data[0].isvisible_retailer | 0                     |
      | data[0].erp_id             | randomString          |
      | data[0].brand_id           | DB:brands:id:status=1 |
      | data[0].imageurl           | randomString          |
      | data[1].subbrand_id        | DB:subbrands:id:id=2  |
      | data[1].name               | randomString          |
      | data[1].is_active          | 1                     |
      | data[1].isvisible_retailer | 1                     |
      | data[1].erp_id             | randomString          |
      | data[1].brand_id           | DB:brands:id:status=1 |
      | data[1].imageurl           | randomString          |
    When I post the request with "insertMdmData_subbrand_mdm" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And I verify the data got updated as needed from DB
      | expectedColumn                        | expectedValue         |
      | DB:subbrands:name: id=1               | randomString          |
      | DB:subbrands:is_active: id=1          | false                 |
      | DB:subbrands:isvisible_retailer: id=1 | false                 |
      | DB:subbrands:erp_id: id=1             | randomString          |
      | DB:subbrands:brand_id: id=1           | DB:brands:id:status=1 |
      | DB:subbrands:imageurl: id=1           | randomString          |
      | DB:subbrands:name: id=2               | randomString          |
      | DB:subbrands:is_active: id=2          | true                  |
      | DB:subbrands:isvisible_retailer: id=2 | true                  |
      | DB:subbrands:erp_id: id=2             | randomString          |
      | DB:subbrands:brand_id: id=2           | DB:brands:id:status=1 |
      | DB:subbrands:imageurl: id=2           | randomString          |
    And verify response time is less than "3000" milliseconds

  @Subbrand5
  Scenario: SubbrandMDM:Subbrand5 - Valid data for name field -alphabets and alpha numerical values
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_subbrand_mdm" payload
      | JPath                      | Value                 |
      | data[0].name               | randomString          |
      | data[0].is_active          | 1                     |
      | data[0].isvisible_retailer | 1                     |
      | data[0].erp_id             | randomString          |
      | data[0].brand_id           | DB:brands:id:status=1 |
      | data[0].imageurl           | randomString          |
      | data[1].name               | randomAlphanumeric    |
      | data[1].is_active          | 1                     |
      | data[1].isvisible_retailer | 1                     |
      | data[1].erp_id             | randomString          |
      | data[1].brand_id           | DB:brands:id:status=1 |
      | data[1].imageurl           | randomString          |
    When I post the request with "insertMdmData_subbrand_mdm" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And I verify the data got updated as needed from DB
      | expectedColumn                                                        | expectedValue         |
      | DB:subbrands:name: id=(SELECT MAX(id)-1 FROM subbrands)               | randomString          |
      | DB:subbrands:is_active: id=(SELECT MAX(id)-1 FROM subbrands)          | true                  |
      | DB:subbrands:isvisible_retailer: id=(SELECT MAX(id)-1 FROM subbrands) | true                  |
      | DB:subbrands:erp_id: id=(SELECT MAX(id)-1 FROM subbrands)             | randomString          |
      | DB:subbrands:brand_id: id=(SELECT MAX(id)-1 FROM subbrands)           | DB:brands:id:status=1 |
      | DB:subbrands:imageurl: id=(SELECT MAX(id)-1 FROM subbrands)           | randomString          |
      | DB:subbrands:name: id=(SELECT MAX(id) FROM subbrands)                 | randomString          |
      | DB:subbrands:is_active: id=(SELECT MAX(id) FROM subbrands)            | true                  |
      | DB:subbrands:isvisible_retailer: id=(SELECT MAX(id) FROM subbrands)   | true                  |
      | DB:subbrands:erp_id: id=(SELECT MAX(id) FROM subbrands)               | randomString          |
      | DB:subbrands:brand_id: id=(SELECT MAX(id) FROM subbrands)             | DB:brands:id:status=1 |
      | DB:subbrands:imageurl: id=(SELECT MAX(id) FROM subbrands)             | randomString          |
    And verify response time is less than "3000" milliseconds

  @Subbrand6 @SubBrandBugFix
  Scenario: SubbrandMDM:Subbrand6 - Valid data for name field -special characters and  and decimal values
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_subbrand_mdm" payload
      | JPath                      | Value                 |
      | data[0].name               | randomAsciiCharacters |
      | data[0].is_active          | 1                     |
      | data[0].isvisible_retailer | 1                     |
      | data[0].erp_id             | randomString          |
      | data[0].brand_id           | DB:brands:id:status=1 |
      | data[0].imageurl           | randomString          |
      | data[1].name               | randomAlphanumeric    |
      | data[1].is_active          | 1                     |
      | data[1].isvisible_retailer | 1                     |
      | data[1].erp_id             | randomString          |
      | data[1].brand_id           | DB:brands:id:status=1 |
      | data[1].imageurl           | randomDouble          |
    When I post the request with "insertMdmData_subbrand_mdm" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And I verify the data got updated as needed from DB
      | expectedColumn                                                        | expectedValue         |
      | DB:subbrands:name: id=(SELECT MAX(id)-1 FROM subbrands)               | randomString          |
      | DB:subbrands:is_active: id=(SELECT MAX(id)-1 FROM subbrands)          | true                  |
      | DB:subbrands:isvisible_retailer: id=(SELECT MAX(id)-1 FROM subbrands) | true                  |
      | DB:subbrands:erp_id: id=(SELECT MAX(id)-1 FROM subbrands)             | randomString          |
      | DB:subbrands:brand_id: id=(SELECT MAX(id)-1 FROM subbrands)           | DB:brands:id:status=1 |
      | DB:subbrands:imageurl: id=(SELECT MAX(id)-1 FROM subbrands)           | randomString          |
      | DB:subbrands:name: id=(SELECT MAX(id) FROM subbrands)                 | randomString          |
      | DB:subbrands:is_active: id=(SELECT MAX(id) FROM subbrands)            | true                  |
      | DB:subbrands:isvisible_retailer: id=(SELECT MAX(id) FROM subbrands)   | true                  |
      | DB:subbrands:erp_id: id=(SELECT MAX(id) FROM subbrands)               | randomString          |
      | DB:subbrands:brand_id: id=(SELECT MAX(id) FROM subbrands)             | DB:brands:id:status=1 |
      | DB:subbrands:imageurl: id=(SELECT MAX(id) FROM subbrands)             | randomString          |
    And verify response time is less than "3000" milliseconds

  @Subbrand7
  Scenario: SubbrandMDM:Subbrand7 - Valid data for name field -alphabets and alpha numerical values
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_subbrand_mdm" payload
      | JPath                      | Value                 |
      | data[0].name               | randomAsciiCharacters |
      | data[0].is_active          | 1                     |
      | data[0].isvisible_retailer | 1                     |
      | data[0].erp_id             | randomString          |
      | data[0].brand_id           | DB:brands:id:status=1 |
      | data[0].imageurl           | randomString          |
      | data[1].name               | randomAlphanumeric    |
      | data[1].is_active          | 1                     |
      | data[1].isvisible_retailer | 1                     |
      | data[1].erp_id             | randomString          |
      | data[1].brand_id           | DB:brands:id:status=1 |
      | data[1].imageurl           | randomDouble          |
    When I post the request with "insertMdmData_subbrand_mdm" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And I verify the data got updated as needed from DB
      | expectedColumn                                                        | expectedValue         |
      | DB:subbrands:name: id=(SELECT MAX(id)-1 FROM subbrands)               | randomString          |
      | DB:subbrands:is_active: id=(SELECT MAX(id)-1 FROM subbrands)          | true                  |
      | DB:subbrands:isvisible_retailer: id=(SELECT MAX(id)-1 FROM subbrands) | true                  |
      | DB:subbrands:erp_id: id=(SELECT MAX(id)-1 FROM subbrands)             | randomString          |
      | DB:subbrands:brand_id: id=(SELECT MAX(id)-1 FROM subbrands)           | DB:brands:id:status=1 |
      | DB:subbrands:imageurl: id=(SELECT MAX(id)-1 FROM subbrands)           | randomString          |
      | DB:subbrands:name: id=(SELECT MAX(id) FROM subbrands)                 | randomString          |
      | DB:subbrands:is_active: id=(SELECT MAX(id) FROM subbrands)            | true                  |
      | DB:subbrands:isvisible_retailer: id=(SELECT MAX(id) FROM subbrands)   | true                  |
      | DB:subbrands:erp_id: id=(SELECT MAX(id) FROM subbrands)               | randomString          |
      | DB:subbrands:brand_id: id=(SELECT MAX(id) FROM subbrands)             | DB:brands:id:status=1 |
      | DB:subbrands:imageurl: id=(SELECT MAX(id) FROM subbrands)             | randomString          |
    And verify response time is less than "3000" milliseconds

  @Subbrand8
  Scenario: SubbrandMDM:Subbrand8 - Boundary valid values for name field -40 characters
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_subbrand_mdm" payload
      | JPath                      | Value                 |
      | data[0].name               | randomString:40       |
      | data[0].is_active          | 1                     |
      | data[0].isvisible_retailer | 1                     |
      | data[0].erp_id             | randomString          |
      | data[0].brand_id           | DB:brands:id:status=1 |
      | data[0].imageurl           | randomString          |
      | data[1].name               | randomAlphanumeric    |
      | data[1].is_active          | 1                     |
      | data[1].isvisible_retailer | 1                     |
      | data[1].erp_id             | randomString:1        |
      | data[1].brand_id           | DB:brands:id:status=1 |
      | data[1].imageurl           | randomDouble          |
    When I post the request with "insertMdmData_subbrand_mdm" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And I verify the data got updated as needed from DB
      | expectedColumn                                                        | expectedValue         |
      | DB:subbrands:name: id=(SELECT MAX(id)-1 FROM subbrands)               | randomString          |
      | DB:subbrands:is_active: id=(SELECT MAX(id)-1 FROM subbrands)          | true                  |
      | DB:subbrands:isvisible_retailer: id=(SELECT MAX(id)-1 FROM subbrands) | true                  |
      | DB:subbrands:erp_id: id=(SELECT MAX(id)-1 FROM subbrands)             | randomString          |
      | DB:subbrands:brand_id: id=(SELECT MAX(id)-1 FROM subbrands)           | DB:brands:id:status=1 |
      | DB:subbrands:imageurl: id=(SELECT MAX(id)-1 FROM subbrands)           | randomString          |
      | DB:subbrands:name: id=(SELECT MAX(id) FROM subbrands)                 | randomString          |
      | DB:subbrands:is_active: id=(SELECT MAX(id) FROM subbrands)            | true                  |
      | DB:subbrands:isvisible_retailer: id=(SELECT MAX(id) FROM subbrands)   | true                  |
      | DB:subbrands:erp_id: id=(SELECT MAX(id) FROM subbrands)               | randomString          |
      | DB:subbrands:brand_id: id=(SELECT MAX(id) FROM subbrands)             | DB:brands:id:status=1 |
      | DB:subbrands:imageurl: id=(SELECT MAX(id) FROM subbrands)             | randomString          |
    And verify response time is less than "3000" milliseconds

  @Subbrand9
  Scenario: SubbrandMDM:Subbrand9 - Boundary valid values for name field -41 characters
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_subbrand_mdm" payload
      | JPath                      | Value                                     |
      | data[0].name               | AGfPCauVAbMrXVBzMnMHxfMUjdfoongFjpVkCVUnn |
      | data[0].is_active          | 1                                         |
      | data[0].isvisible_retailer | 1                                         |
      | data[0].erp_id             | randomString                              |
      | data[0].brand_id           | DB:brands:id:status=1                     |
      | data[0].imageurl           | randomString                              |
      | data[1].name               | AGfPCauVAbMrXVBzMnMHxfMUjdfoongFjpVkCVUnn |
      | data[1].is_active          | 1                                         |
      | data[1].isvisible_retailer | 1                                         |
      | data[1].erp_id             | randomString                              |
      | data[1].brand_id           | DB:brands:id:status=1                     |
      | data[1].imageurl           | randomDouble                              |
    When I post the request with "insertMdmData_subbrand_mdm" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath              | Value                                                                               |
      | Result             | false                                                                               |
      | Reason.1[0].Error  | The value AGfPCauVAbMrXVBzMnMHxfMUjdfoongFjpVkCVUnn should have maximum 40 letters. |
      | Reason.1[0].Column | name                                                                                |
      | Reason.2[0].Error  | The value AGfPCauVAbMrXVBzMnMHxfMUjdfoongFjpVkCVUnn should have maximum 40 letters. |
      | Reason.2[0].Column | name                                                                                |
    And verify response time is less than "3000" milliseconds

  @Subbrand10
  Scenario: SubbrandMDM:Subbrand10 - Valid values 0 an 1 to is_active and isivisible column
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_subbrand_mdm" payload
      | JPath                      | Value                 |
      | data[0].name               | randomString          |
      | data[0].is_active          | 1                     |
      | data[0].isvisible_retailer | 1                     |
      | data[0].erp_id             | randomString          |
      | data[0].brand_id           | DB:brands:id:status=1 |
      | data[0].imageurl           | randomString          |
      | data[1].name               | randomString          |
      | data[1].is_active          | 0                     |
      | data[1].isvisible_retailer | 0                     |
      | data[1].erp_id             | randomString          |
      | data[1].brand_id           | DB:brands:id:status=1 |
      | data[1].imageurl           | randomDouble          |
    When I post the request with "insertMdmData_subbrand_mdm" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And I verify the data got updated as needed from DB
      | expectedColumn                                                        | expectedValue         |
      | DB:subbrands:name: id=(SELECT MAX(id)-1 FROM subbrands)               | randomString          |
      | DB:subbrands:is_active: id=(SELECT MAX(id)-1 FROM subbrands)          | true                  |
      | DB:subbrands:isvisible_retailer: id=(SELECT MAX(id)-1 FROM subbrands) | true                  |
      | DB:subbrands:erp_id: id=(SELECT MAX(id)-1 FROM subbrands)             | randomString          |
      | DB:subbrands:brand_id: id=(SELECT MAX(id)-1 FROM subbrands)           | DB:brands:id:status=1 |
      | DB:subbrands:imageurl: id=(SELECT MAX(id)-1 FROM subbrands)           | randomString          |
      | DB:subbrands:name: id=(SELECT MAX(id) FROM subbrands)                 | randomString          |
      | DB:subbrands:is_active: id=(SELECT MAX(id) FROM subbrands)            | false                 |
      | DB:subbrands:isvisible_retailer: id=(SELECT MAX(id) FROM subbrands)   | false                 |
      | DB:subbrands:erp_id: id=(SELECT MAX(id) FROM subbrands)               | randomString          |
      | DB:subbrands:brand_id: id=(SELECT MAX(id) FROM subbrands)             | DB:brands:id:status=1 |
      | DB:subbrands:imageurl: id=(SELECT MAX(id) FROM subbrands)             | randomString          |
    And verify response time is less than "3000" milliseconds

  @Subbrand11
  Scenario: SubbrandMDM:Subbrand11 - InValid values 0 an 1 to is_active and isivisible column
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_subbrand_mdm" payload
      | JPath                      | Value                 |
      | data[0].name               | randomString          |
      | data[0].is_active          | 2                     |
      | data[0].isvisible_retailer | 2                     |
      | data[0].erp_id             | randomString          |
      | data[0].brand_id           | DB:brands:id:status=1 |
      | data[0].imageurl           | randomString          |
      | data[1].name               | randomString          |
      | data[1].is_active          | -1                    |
      | data[1].isvisible_retailer | -1                    |
      | data[1].erp_id             | randomString          |
      | data[1].brand_id           | DB:brands:id:status=1 |
      | data[1].imageurl           | randomDouble          |
    When I post the request with "insertMdmData_subbrand_mdm" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath              | Value                    |
      | Result             | false                    |
      | Reason.1[0].Column | is_active                |
      | Reason.1[0].Error  | Only 1 or 0 is accepted. |
      | Reason.1[1].Column | isvisible_retailer       |
      | Reason.1[1].Error  | Only 1 or 0 is accepted. |
      | Reason.2[0].Column | is_active                |
      | Reason.2[0].Error  | Only 1 or 0 is accepted. |
      | Reason.2[1].Column | isvisible_retailer       |
      | Reason.2[1].Error  | Only 1 or 0 is accepted. |
    And verify response time is less than "3000" milliseconds

  @Subbrand12
  Scenario: SubbrandMDM:Subbrand12 - InValid values 0 an 1 to is_active and isivisible column
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_subbrand_mdm" payload
      | JPath                      | Value                 |
      | data[0].name               | randomString          |
      | data[0].is_active          | randomString          |
      | data[0].isvisible_retailer | 2                     |
      | data[0].erp_id             | randomString          |
      | data[0].brand_id           | DB:brands:id:status=1 |
      | data[0].imageurl           | randomString          |
      | data[1].name               | randomString          |
      | data[1].is_active          | randomAlphanumeric    |
      | data[1].isvisible_retailer | -1                    |
      | data[1].erp_id             | randomString          |
      | data[1].brand_id           | DB:brands:id:status=1 |
      | data[1].imageurl           | randomDouble          |
    When I post the request with "insertMdmData_subbrand_mdm" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath              | Value                    |
      | Result             | false                    |
      | Reason.1[0].Column | is_active                |
      | Reason.1[0].Error  | Only 1 or 0 is accepted. |
      | Reason.1[1].Column | isvisible_retailer       |
      | Reason.1[1].Error  | Only 1 or 0 is accepted. |
      | Reason.2[0].Column | is_active                |
      | Reason.2[0].Error  | Only 1 or 0 is accepted. |
      | Reason.2[1].Column | isvisible_retailer       |
      | Reason.2[1].Error  | Only 1 or 0 is accepted. |
    And verify response time is less than "3000" milliseconds

  @Subbrand13
  Scenario: SubbrandMDM:Subbrand13 - Valid values for erp_id column -alphabets and alphanuemric values
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_subbrand_mdm" payload
      | JPath          | Value              |
      | data[0].name   | randomString       |
      | data[0].erp_id | randomString       |
      | data[1].name   | randomString       |
      | data[1].erp_id | randomAlphanumeric |
    When I post the request with "insertMdmData_subbrand_mdm" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And I verify the data got updated as needed from DB
      | expectedColumn                                               | expectedValue |
      | DB:subbrands:name: id=(SELECT MAX(id)-1 FROM subbrands)      | randomString  |
      | DB:subbrands:is_active: id=(SELECT MAX(id)-1 FROM subbrands) | true          |
      | DB:subbrands:erp_id: id=(SELECT MAX(id)-1 FROM subbrands)    | randomString  |
      | DB:subbrands:name: id=(SELECT MAX(id) FROM subbrands)        | randomString  |
      | DB:subbrands:is_active: id=(SELECT MAX(id) FROM subbrands)   | true          |
      | DB:subbrands:erp_id: id=(SELECT MAX(id) FROM subbrands)      | randomString  |
    And verify response time is less than "3000" milliseconds

  @Subbrand14
  Scenario: SubbrandMDM:Subbrand14 - Valid values for erp_id column -randomInt and randomDouble values
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_subbrand_mdm" payload
      | JPath          | Value        |
      | data[0].name   | randomString |
      | data[0].erp_id | randomInt    |
      | data[1].name   | randomString |
      | data[1].erp_id | randomDouble |
    When I post the request with "insertMdmData_subbrand_mdm" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And I verify the data got updated as needed from DB
      | expectedColumn                                               | expectedValue |
      | DB:subbrands:name: id=(SELECT MAX(id)-1 FROM subbrands)      | randomString  |
      | DB:subbrands:is_active: id=(SELECT MAX(id)-1 FROM subbrands) | true          |
      | DB:subbrands:erp_id: id=(SELECT MAX(id)-1 FROM subbrands)    | randomString  |
      | DB:subbrands:name: id=(SELECT MAX(id) FROM subbrands)        | randomString  |
      | DB:subbrands:is_active: id=(SELECT MAX(id) FROM subbrands)   | true          |
      | DB:subbrands:erp_id: id=(SELECT MAX(id) FROM subbrands)      | randomString  |
    And verify response time is less than "3000" milliseconds

  @Subbrand15
  Scenario: SubbrandMDM:Subbrand15 - Valid values for erp_id column -randomAscii values
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_subbrand_mdm" payload
      | JPath          | Value                 |
      | data[0].name   | randomAsciiCharacters |
      | data[0].erp_id | randomInt             |
      | data[1].name   | randomString          |
      | data[1].erp_id | randomAsciiCharacters |
    When I post the request with "insertMdmData_subbrand_mdm" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And I verify the data got updated as needed from DB
      | expectedColumn                                               | expectedValue |
      | DB:subbrands:name: id=(SELECT MAX(id)-1 FROM subbrands)      | randomString  |
      | DB:subbrands:is_active: id=(SELECT MAX(id)-1 FROM subbrands) | true          |
      | DB:subbrands:erp_id: id=(SELECT MAX(id)-1 FROM subbrands)    | randomString  |
      | DB:subbrands:name: id=(SELECT MAX(id) FROM subbrands)        | randomString  |
      | DB:subbrands:is_active: id=(SELECT MAX(id) FROM subbrands)   | true          |
      | DB:subbrands:erp_id: id=(SELECT MAX(id) FROM subbrands)      | randomString  |
    And verify response time is less than "3000" milliseconds

  @Subbrand16
  Scenario: SubbrandMDM:Subbrand16 - Boundary length 50 characters-valid and positive
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_subbrand_mdm" payload
      | JPath          | Value                 |
      | data[0].name   | randomAsciiCharacters |
      | data[0].erp_id | randomString:50       |
      | data[1].name   | randomString          |
      | data[1].erp_id | randomString:50       |
    When I post the request with "insertMdmData_subbrand_mdm" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And I verify the data got updated as needed from DB
      | expectedColumn                                               | expectedValue |
      | DB:subbrands:name: id=(SELECT MAX(id)-1 FROM subbrands)      | randomString  |
      | DB:subbrands:is_active: id=(SELECT MAX(id)-1 FROM subbrands) | true          |
      | DB:subbrands:erp_id: id=(SELECT MAX(id)-1 FROM subbrands)    | randomString  |
      | DB:subbrands:name: id=(SELECT MAX(id) FROM subbrands)        | randomString  |
      | DB:subbrands:is_active: id=(SELECT MAX(id) FROM subbrands)   | true          |
      | DB:subbrands:erp_id: id=(SELECT MAX(id) FROM subbrands)      | randomString  |
    And verify response time is less than "3000" milliseconds

  @Subbrand17
  Scenario: SubbrandMDM:Subbrand17 - Boundary length 51 characters-invalid and negative
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_subbrand_mdm" payload
      | JPath          | Value                                               |
      | data[0].name   | randomString                                        |
      | data[0].erp_id | JmVKqhpQprESlrkaLBmnHjkrtJnPLpaDZhfeywPzZuYkbfRPUEX |
      | data[1].name   | randomString                                        |
      | data[1].erp_id | JmVKqhpQprESlrkaLBmnHjkrtJnPLpaDZhfeywPzZuYkbfRPUEX |
    When I post the request with "insertMdmData_subbrand_mdm" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath              | Value                                                                                         |
      | Result             | false                                                                                         |
      | Reason.1[0].Column | erp_id                                                                                        |
      | Reason.1[0].Error  | The value JmVKqhpQprESlrkaLBmnHjkrtJnPLpaDZhfeywPzZuYkbfRPUEX should have maximum 50 letters. |
      | Reason.2[0].Column | erp_id                                                                                        |
      | Reason.2[0].Error  | The value JmVKqhpQprESlrkaLBmnHjkrtJnPLpaDZhfeywPzZuYkbfRPUEX should have maximum 50 letters. |
    And verify response time is less than "3000" milliseconds

  @Subbrand18
  Scenario: SubbrandMDM:Subbrand18 - Duplicate erp_id
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_subbrand_mdm" payload
      | JPath          | Value                                  |
      | data[0].name   | randomString                           |
      | data[0].erp_id | DB:subbrands:erp_id:erp_id IS NOT NULL |
      | data[1].name   | randomString                           |
      | data[1].erp_id | DB:subbrands:erp_id:erp_id IS NOT NULL |
    When I post the request with "insertMdmData_subbrand_mdm" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath              | Value                                |
      | Result             | false                                |
      | Reason.1[0].Column | erp_id                               |
      | Reason.1[0].Error  | Erp_id already exists in the system. |
      | Reason.2[0].Column | erp_id                               |
      | Reason.2[0].Error  | Erp_id already exists in the system. |
    And verify response time is less than "3000" milliseconds

  @Subbrand19
  Scenario: SubbrandMDM:Subbrand19 - Valid values for erp_id column -alphabets and alphanuemric values
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_subbrand_mdm" payload
      | JPath            | Value                                                        |
      | data[0].name     | randomString                                                 |
      | data[0].imageurl | https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d |
      | data[1].name     | randomString                                                 |
      | data[1].imageurl | https://images.unsplash.com/photo-1494790108377-be9c29b29330 |
    When I post the request with "insertMdmData_subbrand_mdm" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And I verify the data got updated as needed from DB
      | expectedColumn                                               | expectedValue                                                |
      | DB:subbrands:name: id=(SELECT MAX(id)-1 FROM subbrands)      | randomString                                                 |
      | DB:subbrands:is_active: id=(SELECT MAX(id)-1 FROM subbrands) | true                                                         |
      | DB:subbrands:imageurl: id=(SELECT MAX(id)-1 FROM subbrands)  | https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d |
      | DB:subbrands:name: id=(SELECT MAX(id) FROM subbrands)        | randomString                                                 |
      | DB:subbrands:is_active: id=(SELECT MAX(id) FROM subbrands)   | true                                                         |
      | DB:subbrands:imageurl: id=(SELECT MAX(id) FROM subbrands)    | https://images.unsplash.com/photo-1494790108377-be9c29b29330 |
    And verify response time is less than "3000" milliseconds

  @Subbrand20
  Scenario: SubbrandMDM:Subbrand20 - Valid values for imageurl column -randomInt and randomDouble values
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_subbrand_mdm" payload
      | JPath            | Value        |
      | data[0].name     | randomString |
      | data[0].imageurl | randomInt    |
      | data[1].name     | randomString |
      | data[1].imageurl | randomDouble |
    When I post the request with "insertMdmData_subbrand_mdm" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And I verify the data got updated as needed from DB
      | expectedColumn                                               | expectedValue |
      | DB:subbrands:name: id=(SELECT MAX(id)-1 FROM subbrands)      | randomString  |
      | DB:subbrands:is_active: id=(SELECT MAX(id)-1 FROM subbrands) | true          |
      | DB:subbrands:imageurl: id=(SELECT MAX(id)-1 FROM subbrands)  | randomString  |
      | DB:subbrands:name: id=(SELECT MAX(id) FROM subbrands)        | randomString  |
      | DB:subbrands:is_active: id=(SELECT MAX(id) FROM subbrands)   | true          |
      | DB:subbrands:imageurl: id=(SELECT MAX(id) FROM subbrands)    | randomString  |
    And verify response time is less than "3000" milliseconds

  @Subbrand21
  Scenario: SubbrandMDM:Subbrand21 - Valid values for imageurl column -randomAscii values
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_subbrand_mdm" payload
      | JPath            | Value                 |
      | data[0].name     | randomString          |
      | data[0].imageurl | randomInt             |
      | data[1].name     | randomString          |
      | data[1].imageurl | randomAsciiCharacters |
    When I post the request with "insertMdmData_subbrand_mdm" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And I verify the data got updated as needed from DB
      | expectedColumn                                               | expectedValue |
      | DB:subbrands:name: id=(SELECT MAX(id)-1 FROM subbrands)      | randomString  |
      | DB:subbrands:is_active: id=(SELECT MAX(id)-1 FROM subbrands) | true          |
      | DB:subbrands:imageurl: id=(SELECT MAX(id)-1 FROM subbrands)  | randomString  |
      | DB:subbrands:name: id=(SELECT MAX(id) FROM subbrands)        | randomString  |
      | DB:subbrands:is_active: id=(SELECT MAX(id) FROM subbrands)   | true          |
      | DB:subbrands:imageurl: id=(SELECT MAX(id) FROM subbrands)    | randomString  |
    And verify response time is less than "3000" milliseconds

  @Subbrand22
  Scenario: SubbrandMDM:Subbrand22 - Boundary length 100 characters-valid and positive
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_subbrand_mdm" payload
      | JPath            | Value                                                                                                |
      | data[0].name     | randomString                                                                                         |
      | data[0].imageurl | eQEtdZroGozDhGLmbtCvLhLNQqpjmoRVeSLNiqxSwrOJUnYoNppcCsTyLtajHRIhVdlPinoyQRQmVJXtugQHGTbJoAxIZCTBiDLB |
      | data[1].name     | randomString                                                                                         |
      | data[1].imageurl | eQEtdZroGozDhGLmbtCvLhLNQqpjmoRVeSLNiqxSwrOJUnYoNppcCsTyLtajHRIhVdlPinoyQRQmVJXtugQHGTbJoAxIZCTBiDLB |
    When I post the request with "insertMdmData_subbrand_mdm" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And I verify the data got updated as needed from DB
      | expectedColumn                                               | expectedValue                                                                                        |
      | DB:subbrands:name: id=(SELECT MAX(id)-1 FROM subbrands)      | randomString                                                                                         |
      | DB:subbrands:is_active: id=(SELECT MAX(id)-1 FROM subbrands) | true                                                                                                 |
      | DB:subbrands:imageurl: id=(SELECT MAX(id)-1 FROM subbrands)  | eQEtdZroGozDhGLmbtCvLhLNQqpjmoRVeSLNiqxSwrOJUnYoNppcCsTyLtajHRIhVdlPinoyQRQmVJXtugQHGTbJoAxIZCTBiDLB |
      | DB:subbrands:name: id=(SELECT MAX(id) FROM subbrands)        | randomString                                                                                         |
      | DB:subbrands:is_active: id=(SELECT MAX(id) FROM subbrands)   | true                                                                                                 |
      | DB:subbrands:imageurl: id=(SELECT MAX(id) FROM subbrands)    | eQEtdZroGozDhGLmbtCvLhLNQqpjmoRVeSLNiqxSwrOJUnYoNppcCsTyLtajHRIhVdlPinoyQRQmVJXtugQHGTbJoAxIZCTBiDLB |
    And verify response time is less than "3000" milliseconds

  @Subbrand23
  Scenario: SubbrandMDM:Subbrand23 - Boundary length 101 characters-invalid and negative
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_subbrand_mdm" payload
      | JPath            | Value                                                                                                 |
      | data[0].name     | randomString                                                                                          |
      | data[0].imageurl | eQEtdZroGozDhGLmbtCvLhLNQqpjmoRVeSLNiqxSwrOJUnYoNppcCsTyLtajHRIhVdlPinoyQRQmVJXtugQHGTbJoAxIZCTBiDLB1 |
      | data[1].name     | randomString                                                                                          |
      | data[1].imageurl | eQEtdZroGozDhGLmbtCvLhLNQqpjmoRVeSLNiqxSwrOJUnYoNppcCsTyLtajHRIhVdlPinoyQRQmVJXtugQHGTbJoAxIZCTBiDLB1 |
    When I post the request with "insertMdmData_subbrand_mdm" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath              | Value                                                                                                                                            |
      | Result             | false                                                                                                                                            |
      | Reason.1[0].Column | imageurl                                                                                                                                         |
      | Reason.1[0].Error  | The value eQEtdZroGozDhGLmbtCvLhLNQqpjmoRVeSLNiqxSwrOJUnYoNppcCsTyLtajHRIhVdlPinoyQRQmVJXtugQHGTbJoAxIZCTBiDLB1 should have maximum 100 letters. |
      | Reason.2[0].Column | imageurl                                                                                                                                         |
      | Reason.2[0].Error  | The value eQEtdZroGozDhGLmbtCvLhLNQqpjmoRVeSLNiqxSwrOJUnYoNppcCsTyLtajHRIhVdlPinoyQRQmVJXtugQHGTbJoAxIZCTBiDLB1 should have maximum 100 letters. |
    And verify response time is less than "3000" milliseconds

  @Subbrand24
  Scenario: SubbrandMDM:Subbrand24 - Valid data for bulk upload
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertBulkMdmData_subbrand_mdm" payload
      | JPath               | Value                 |
      | data[0].brand_id    | DB:brands:id:status=1 |
      | data[0].is_active   | 1                     |
      | data[1].brand_id    | DB:brands:id:status=1 |
      | data[1].is_active   | 1                     |
      | data[2].brand_id    | DB:brands:id:status=1 |
      | data[2].is_active   | 1                     |
      | data[3].brand_id    | DB:brands:id:status=1 |
      | data[3].is_active   | 1                     |
      | data[4].brand_id    | DB:brands:id:status=1 |
      | data[4].is_active   | 1                     |
      | data[5].brand_id    | DB:brands:id:status=1 |
      | data[5].is_active   | 1                     |
      | data[6].brand_id    | DB:brands:id:status=1 |
      | data[6].is_active   | 1                     |
      | data[7].brand_id    | DB:brands:id:status=1 |
      | data[7].is_active   | 1                     |
      | data[8].brand_id    | DB:brands:id:status=1 |
      | data[8].is_active   | 1                     |
      | data[9].brand_id    | DB:brands:id:status=1 |
      | data[9].is_active   | 1                     |
      | data[10].brand_id   | DB:brands:id:status=1 |
      | data[10].is_active  | 1                     |
      | data[11].brand_id   | DB:brands:id:status=1 |
      | data[11].is_active  | 1                     |
      | data[12].brand_id   | DB:brands:id:status=1 |
      | data[12].is_active  | 1                     |
      | data[13].brand_id   | DB:brands:id:status=1 |
      | data[13].is_active  | 1                     |
      | data[14].brand_id   | DB:brands:id:status=1 |
      | data[14].is_active  | 1                     |
      | data[15].brand_id   | DB:brands:id:status=1 |
      | data[15].is_active  | 1                     |
      | data[16].brand_id   | DB:brands:id:status=1 |
      | data[16].is_active  | 1                     |
      | data[17].brand_id   | DB:brands:id:status=1 |
      | data[17].is_active  | 1                     |
      | data[18].brand_id   | DB:brands:id:status=1 |
      | data[18].is_active  | 1                     |
      | data[19].brand_id   | DB:brands:id:status=1 |
      | data[19].is_active  | 1                     |
      | data[20].brand_id   | DB:brands:id:status=1 |
      | data[20].is_active  | 1                     |
      | data[21].brand_id   | DB:brands:id:status=1 |
      | data[21].is_active  | 1                     |
      | data[22].brand_id   | DB:brands:id:status=1 |
      | data[22].is_active  | 1                     |
      | data[23].brand_id   | DB:brands:id:status=1 |
      | data[23].is_active  | 1                     |
      | data[24].brand_id   | DB:brands:id:status=1 |
      | data[24].is_active  | 1                     |
      | data[25].brand_id   | DB:brands:id:status=1 |
      | data[25].is_active  | 1                     |
      | data[26].brand_id   | DB:brands:id:status=1 |
      | data[26].is_active  | 1                     |
      | data[27].brand_id   | DB:brands:id:status=1 |
      | data[27].is_active  | 1                     |
      | data[28].brand_id   | DB:brands:id:status=1 |
      | data[28].is_active  | 1                     |
      | data[29].brand_id   | DB:brands:id:status=1 |
      | data[29].is_active  | 1                     |
      | data[30].brand_id   | DB:brands:id:status=1 |
      | data[30].is_active  | 1                     |
      | data[31].brand_id   | DB:brands:id:status=1 |
      | data[31].is_active  | 1                     |
      | data[32].brand_id   | DB:brands:id:status=1 |
      | data[32].is_active  | 1                     |
      | data[33].brand_id   | DB:brands:id:status=1 |
      | data[33].is_active  | 1                     |
      | data[34].brand_id   | DB:brands:id:status=1 |
      | data[34].is_active  | 1                     |
      | data[35].brand_id   | DB:brands:id:status=1 |
      | data[35].is_active  | 1                     |
      | data[36].brand_id   | DB:brands:id:status=1 |
      | data[36].is_active  | 1                     |
      | data[37].brand_id   | DB:brands:id:status=1 |
      | data[37].is_active  | 1                     |
      | data[38].brand_id   | DB:brands:id:status=1 |
      | data[38].is_active  | 1                     |
      | data[39].brand_id   | DB:brands:id:status=1 |
      | data[39].is_active  | 1                     |
      | data[40].brand_id   | DB:brands:id:status=1 |
      | data[40].is_active  | 1                     |
      | data[41].brand_id   | DB:brands:id:status=1 |
      | data[41].is_active  | 1                     |
      | data[42].brand_id   | DB:brands:id:status=1 |
      | data[42].is_active  | 1                     |
      | data[43].brand_id   | DB:brands:id:status=1 |
      | data[43].is_active  | 1                     |
      | data[44].brand_id   | DB:brands:id:status=1 |
      | data[44].is_active  | 1                     |
      | data[45].brand_id   | DB:brands:id:status=1 |
      | data[45].is_active  | 1                     |
      | data[46].brand_id   | DB:brands:id:status=1 |
      | data[46].is_active  | 1                     |
      | data[47].brand_id   | DB:brands:id:status=1 |
      | data[47].is_active  | 1                     |
      | data[48].brand_id   | DB:brands:id:status=1 |
      | data[48].is_active  | 1                     |
      | data[49].brand_id   | DB:brands:id:status=1 |
      | data[49].is_active  | 1                     |
      | data[50].brand_id   | DB:brands:id:status=1 |
      | data[50].is_active  | 1                     |
      | data[51].brand_id   | DB:brands:id:status=1 |
      | data[51].is_active  | 1                     |
      | data[52].brand_id   | DB:brands:id:status=1 |
      | data[52].is_active  | 1                     |
      | data[53].brand_id   | DB:brands:id:status=1 |
      | data[53].is_active  | 1                     |
      | data[54].brand_id   | DB:brands:id:status=1 |
      | data[54].is_active  | 1                     |
      | data[55].brand_id   | DB:brands:id:status=1 |
      | data[55].is_active  | 1                     |
      | data[56].brand_id   | DB:brands:id:status=1 |
      | data[56].is_active  | 1                     |
      | data[57].brand_id   | DB:brands:id:status=1 |
      | data[57].is_active  | 1                     |
      | data[58].brand_id   | DB:brands:id:status=1 |
      | data[58].is_active  | 1                     |
      | data[59].brand_id   | DB:brands:id:status=1 |
      | data[59].is_active  | 1                     |
      | data[60].brand_id   | DB:brands:id:status=1 |
      | data[60].is_active  | 1                     |
      | data[61].brand_id   | DB:brands:id:status=1 |
      | data[61].is_active  | 1                     |
      | data[62].brand_id   | DB:brands:id:status=1 |
      | data[62].is_active  | 1                     |
      | data[63].brand_id   | DB:brands:id:status=1 |
      | data[63].is_active  | 1                     |
      | data[64].brand_id   | DB:brands:id:status=1 |
      | data[64].is_active  | 1                     |
      | data[65].brand_id   | DB:brands:id:status=1 |
      | data[65].is_active  | 1                     |
      | data[66].brand_id   | DB:brands:id:status=1 |
      | data[66].is_active  | 1                     |
      | data[67].brand_id   | DB:brands:id:status=1 |
      | data[67].is_active  | 1                     |
      | data[68].brand_id   | DB:brands:id:status=1 |
      | data[68].is_active  | 1                     |
      | data[69].brand_id   | DB:brands:id:status=1 |
      | data[69].is_active  | 1                     |
      | data[70].brand_id   | DB:brands:id:status=1 |
      | data[70].is_active  | 1                     |
      | data[71].brand_id   | DB:brands:id:status=1 |
      | data[71].is_active  | 1                     |
      | data[72].brand_id   | DB:brands:id:status=1 |
      | data[72].is_active  | 1                     |
      | data[73].brand_id   | DB:brands:id:status=1 |
      | data[73].is_active  | 1                     |
      | data[74].brand_id   | DB:brands:id:status=1 |
      | data[74].is_active  | 1                     |
      | data[75].brand_id   | DB:brands:id:status=1 |
      | data[75].is_active  | 1                     |
      | data[76].brand_id   | DB:brands:id:status=1 |
      | data[76].is_active  | 1                     |
      | data[77].brand_id   | DB:brands:id:status=1 |
      | data[77].is_active  | 1                     |
      | data[78].brand_id   | DB:brands:id:status=1 |
      | data[78].is_active  | 1                     |
      | data[79].brand_id   | DB:brands:id:status=1 |
      | data[79].is_active  | 1                     |
      | data[80].brand_id   | DB:brands:id:status=1 |
      | data[80].is_active  | 1                     |
      | data[81].brand_id   | DB:brands:id:status=1 |
      | data[81].is_active  | 1                     |
      | data[82].brand_id   | DB:brands:id:status=1 |
      | data[82].is_active  | 1                     |
      | data[83].brand_id   | DB:brands:id:status=1 |
      | data[83].is_active  | 1                     |
      | data[84].brand_id   | DB:brands:id:status=1 |
      | data[84].is_active  | 1                     |
      | data[85].brand_id   | DB:brands:id:status=1 |
      | data[85].is_active  | 1                     |
      | data[86].brand_id   | DB:brands:id:status=1 |
      | data[86].is_active  | 1                     |
      | data[87].brand_id   | DB:brands:id:status=1 |
      | data[87].is_active  | 1                     |
      | data[88].brand_id   | DB:brands:id:status=1 |
      | data[88].is_active  | 1                     |
      | data[89].brand_id   | DB:brands:id:status=1 |
      | data[89].is_active  | 1                     |
      | data[90].brand_id   | DB:brands:id:status=1 |
      | data[90].is_active  | 1                     |
      | data[91].brand_id   | DB:brands:id:status=1 |
      | data[91].is_active  | 1                     |
      | data[92].brand_id   | DB:brands:id:status=1 |
      | data[92].is_active  | 1                     |
      | data[93].brand_id   | DB:brands:id:status=1 |
      | data[93].is_active  | 1                     |
      | data[94].brand_id   | DB:brands:id:status=1 |
      | data[94].is_active  | 1                     |
      | data[95].brand_id   | DB:brands:id:status=1 |
      | data[95].is_active  | 1                     |
      | data[96].brand_id   | DB:brands:id:status=1 |
      | data[96].is_active  | 1                     |
      | data[97].brand_id   | DB:brands:id:status=1 |
      | data[97].is_active  | 1                     |
      | data[98].brand_id   | DB:brands:id:status=1 |
      | data[98].is_active  | 1                     |
      | data[99].brand_id   | DB:brands:id:status=1 |
      | data[99].is_active  | 1                     |
      | data[100].brand_id  | DB:brands:id:status=1 |
      | data[100].is_active | 1                     |
      | data[101].brand_id  | DB:brands:id:status=1 |
      | data[101].is_active | 1                     |
      | data[102].brand_id  | DB:brands:id:status=1 |
      | data[102].is_active | 1                     |
      | data[103].brand_id  | DB:brands:id:status=1 |
      | data[103].is_active | 1                     |
      | data[104].brand_id  | DB:brands:id:status=1 |
      | data[104].is_active | 1                     |
      | data[105].brand_id  | DB:brands:id:status=1 |
      | data[105].is_active | 1                     |
      | data[106].brand_id  | DB:brands:id:status=1 |
      | data[106].is_active | 1                     |
      | data[107].brand_id  | DB:brands:id:status=1 |
      | data[107].is_active | 1                     |
      | data[108].brand_id  | DB:brands:id:status=1 |
      | data[108].is_active | 1                     |
      | data[109].brand_id  | DB:brands:id:status=1 |
      | data[109].is_active | 1                     |
      | data[110].brand_id  | DB:brands:id:status=1 |
      | data[110].is_active | 1                     |
      | data[111].brand_id  | DB:brands:id:status=1 |
      | data[111].is_active | 1                     |
      | data[112].brand_id  | DB:brands:id:status=1 |
      | data[112].is_active | 1                     |
      | data[113].brand_id  | DB:brands:id:status=1 |
      | data[113].is_active | 1                     |
      | data[114].brand_id  | DB:brands:id:status=1 |
      | data[114].is_active | 1                     |
      | data[115].brand_id  | DB:brands:id:status=1 |
      | data[115].is_active | 1                     |
      | data[116].brand_id  | DB:brands:id:status=1 |
      | data[116].is_active | 1                     |
      | data[117].brand_id  | DB:brands:id:status=1 |
      | data[117].is_active | 1                     |
      | data[118].brand_id  | DB:brands:id:status=1 |
      | data[118].is_active | 1                     |
      | data[119].brand_id  | DB:brands:id:status=1 |
      | data[119].is_active | 1                     |
      | data[120].brand_id  | DB:brands:id:status=1 |
      | data[120].is_active | 1                     |
      | data[121].brand_id  | DB:brands:id:status=1 |
      | data[121].is_active | 1                     |
      | data[122].brand_id  | DB:brands:id:status=1 |
      | data[122].is_active | 1                     |
      | data[123].brand_id  | DB:brands:id:status=1 |
      | data[123].is_active | 1                     |
      | data[124].brand_id  | DB:brands:id:status=1 |
      | data[124].is_active | 1                     |
      | data[125].brand_id  | DB:brands:id:status=1 |
      | data[125].is_active | 1                     |
      | data[126].brand_id  | DB:brands:id:status=1 |
      | data[126].is_active | 1                     |
      | data[127].brand_id  | DB:brands:id:status=1 |
      | data[127].is_active | 1                     |
      | data[128].brand_id  | DB:brands:id:status=1 |
      | data[128].is_active | 1                     |
      | data[129].brand_id  | DB:brands:id:status=1 |
      | data[129].is_active | 1                     |
      | data[130].brand_id  | DB:brands:id:status=1 |
      | data[130].is_active | 1                     |
      | data[131].brand_id  | DB:brands:id:status=1 |
      | data[131].is_active | 1                     |
      | data[132].brand_id  | DB:brands:id:status=1 |
      | data[132].is_active | 1                     |
      | data[133].brand_id  | DB:brands:id:status=1 |
      | data[133].is_active | 1                     |
      | data[134].brand_id  | DB:brands:id:status=1 |
      | data[134].is_active | 1                     |
      | data[135].brand_id  | DB:brands:id:status=1 |
      | data[135].is_active | 1                     |
      | data[136].brand_id  | DB:brands:id:status=1 |
      | data[136].is_active | 1                     |
      | data[137].brand_id  | DB:brands:id:status=1 |
      | data[137].is_active | 1                     |
      | data[138].brand_id  | DB:brands:id:status=1 |
      | data[138].is_active | 1                     |
      | data[139].brand_id  | DB:brands:id:status=1 |
      | data[139].is_active | 1                     |
      | data[140].brand_id  | DB:brands:id:status=1 |
      | data[140].is_active | 1                     |
      | data[141].brand_id  | DB:brands:id:status=1 |
      | data[141].is_active | 1                     |
      | data[142].brand_id  | DB:brands:id:status=1 |
      | data[142].is_active | 1                     |
      | data[143].brand_id  | DB:brands:id:status=1 |
      | data[143].is_active | 1                     |
      | data[144].brand_id  | DB:brands:id:status=1 |
      | data[144].is_active | 1                     |
      | data[145].brand_id  | DB:brands:id:status=1 |
      | data[145].is_active | 1                     |
      | data[146].brand_id  | DB:brands:id:status=1 |
      | data[146].is_active | 1                     |
      | data[147].brand_id  | DB:brands:id:status=1 |
      | data[147].is_active | 1                     |
      | data[148].brand_id  | DB:brands:id:status=1 |
      | data[148].is_active | 1                     |
      | data[149].brand_id  | DB:brands:id:status=1 |
      | data[149].is_active | 1                     |
      | data[150].brand_id  | DB:brands:id:status=1 |
      | data[150].is_active | 1                     |
      | data[151].brand_id  | DB:brands:id:status=1 |
      | data[151].is_active | 1                     |
      | data[152].brand_id  | DB:brands:id:status=1 |
      | data[152].is_active | 1                     |
      | data[153].brand_id  | DB:brands:id:status=1 |
      | data[153].is_active | 1                     |
      | data[154].brand_id  | DB:brands:id:status=1 |
      | data[154].is_active | 1                     |
      | data[155].brand_id  | DB:brands:id:status=1 |
      | data[155].is_active | 1                     |
      | data[156].brand_id  | DB:brands:id:status=1 |
      | data[156].is_active | 1                     |
      | data[157].brand_id  | DB:brands:id:status=1 |
      | data[157].is_active | 1                     |
      | data[158].brand_id  | DB:brands:id:status=1 |
      | data[158].is_active | 1                     |
      | data[159].brand_id  | DB:brands:id:status=1 |
      | data[159].is_active | 1                     |
      | data[160].brand_id  | DB:brands:id:status=1 |
      | data[160].is_active | 1                     |
      | data[161].brand_id  | DB:brands:id:status=1 |
      | data[161].is_active | 1                     |
      | data[162].brand_id  | DB:brands:id:status=1 |
      | data[162].is_active | 1                     |
      | data[163].brand_id  | DB:brands:id:status=1 |
      | data[163].is_active | 1                     |
      | data[164].brand_id  | DB:brands:id:status=1 |
      | data[164].is_active | 1                     |
      | data[165].brand_id  | DB:brands:id:status=1 |
      | data[165].is_active | 1                     |
      | data[166].brand_id  | DB:brands:id:status=1 |
      | data[166].is_active | 1                     |
      | data[167].brand_id  | DB:brands:id:status=1 |
      | data[167].is_active | 1                     |
      | data[168].brand_id  | DB:brands:id:status=1 |
      | data[168].is_active | 1                     |
      | data[169].brand_id  | DB:brands:id:status=1 |
      | data[169].is_active | 1                     |
      | data[170].brand_id  | DB:brands:id:status=1 |
      | data[170].is_active | 1                     |
      | data[171].brand_id  | DB:brands:id:status=1 |
      | data[171].is_active | 1                     |
      | data[172].brand_id  | DB:brands:id:status=1 |
      | data[172].is_active | 1                     |
      | data[173].brand_id  | DB:brands:id:status=1 |
      | data[173].is_active | 1                     |
      | data[174].brand_id  | DB:brands:id:status=1 |
      | data[174].is_active | 1                     |
      | data[175].brand_id  | DB:brands:id:status=1 |
      | data[175].is_active | 1                     |
      | data[176].brand_id  | DB:brands:id:status=1 |
      | data[176].is_active | 1                     |
      | data[177].brand_id  | DB:brands:id:status=1 |
      | data[177].is_active | 1                     |
      | data[178].brand_id  | DB:brands:id:status=1 |
      | data[178].is_active | 1                     |
      | data[179].brand_id  | DB:brands:id:status=1 |
      | data[179].is_active | 1                     |
      | data[180].brand_id  | DB:brands:id:status=1 |
      | data[180].is_active | 1                     |
      | data[181].brand_id  | DB:brands:id:status=1 |
      | data[181].is_active | 1                     |
      | data[182].brand_id  | DB:brands:id:status=1 |
      | data[182].is_active | 1                     |
      | data[183].brand_id  | DB:brands:id:status=1 |
      | data[183].is_active | 1                     |
      | data[184].brand_id  | DB:brands:id:status=1 |
      | data[184].is_active | 1                     |
      | data[185].brand_id  | DB:brands:id:status=1 |
      | data[185].is_active | 1                     |
      | data[186].brand_id  | DB:brands:id:status=1 |
      | data[186].is_active | 1                     |
      | data[187].brand_id  | DB:brands:id:status=1 |
      | data[187].is_active | 1                     |
      | data[188].brand_id  | DB:brands:id:status=1 |
      | data[188].is_active | 1                     |
      | data[189].brand_id  | DB:brands:id:status=1 |
      | data[189].is_active | 1                     |
      | data[190].brand_id  | DB:brands:id:status=1 |
      | data[190].is_active | 1                     |
      | data[191].brand_id  | DB:brands:id:status=1 |
      | data[191].is_active | 1                     |
      | data[192].brand_id  | DB:brands:id:status=1 |
      | data[192].is_active | 1                     |
      | data[193].brand_id  | DB:brands:id:status=1 |
      | data[193].is_active | 1                     |
      | data[194].brand_id  | DB:brands:id:status=1 |
      | data[194].is_active | 1                     |
      | data[195].brand_id  | DB:brands:id:status=1 |
      | data[195].is_active | 1                     |
      | data[196].brand_id  | DB:brands:id:status=1 |
      | data[196].is_active | 1                     |
      | data[197].brand_id  | DB:brands:id:status=1 |
      | data[197].is_active | 1                     |
      | data[198].brand_id  | DB:brands:id:status=1 |
      | data[198].is_active | 1                     |
      | data[199].brand_id  | DB:brands:id:status=1 |
      | data[199].is_active | 1                     |
      | data[200].brand_id  | DB:brands:id:status=1 |
      | data[200].is_active | 1                     |
      | data[201].brand_id  | DB:brands:id:status=1 |
      | data[201].is_active | 1                     |
      | data[202].brand_id  | DB:brands:id:status=1 |
      | data[202].is_active | 1                     |
      | data[203].brand_id  | DB:brands:id:status=1 |
      | data[203].is_active | 1                     |
      | data[204].brand_id  | DB:brands:id:status=1 |
      | data[204].is_active | 1                     |
      | data[205].brand_id  | DB:brands:id:status=1 |
      | data[205].is_active | 1                     |
      | data[206].brand_id  | DB:brands:id:status=1 |
      | data[206].is_active | 1                     |
      | data[207].brand_id  | DB:brands:id:status=1 |
      | data[207].is_active | 1                     |
      | data[208].brand_id  | DB:brands:id:status=1 |
      | data[208].is_active | 1                     |
      | data[209].brand_id  | DB:brands:id:status=1 |
      | data[209].is_active | 1                     |
      | data[210].brand_id  | DB:brands:id:status=1 |
      | data[210].is_active | 1                     |
      | data[211].brand_id  | DB:brands:id:status=1 |
      | data[211].is_active | 1                     |
      | data[212].brand_id  | DB:brands:id:status=1 |
      | data[212].is_active | 1                     |
      | data[213].brand_id  | DB:brands:id:status=1 |
      | data[213].is_active | 1                     |
      | data[214].brand_id  | DB:brands:id:status=1 |
      | data[214].is_active | 1                     |
      | data[215].brand_id  | DB:brands:id:status=1 |
      | data[215].is_active | 1                     |
      | data[216].brand_id  | DB:brands:id:status=1 |
      | data[216].is_active | 1                     |
      | data[217].brand_id  | DB:brands:id:status=1 |
      | data[217].is_active | 1                     |
      | data[218].brand_id  | DB:brands:id:status=1 |
      | data[218].is_active | 1                     |
      | data[219].brand_id  | DB:brands:id:status=1 |
      | data[219].is_active | 1                     |
      | data[220].brand_id  | DB:brands:id:status=1 |
      | data[220].is_active | 1                     |
      | data[221].brand_id  | DB:brands:id:status=1 |
      | data[221].is_active | 1                     |
      | data[222].brand_id  | DB:brands:id:status=1 |
      | data[222].is_active | 1                     |
      | data[223].brand_id  | DB:brands:id:status=1 |
      | data[223].is_active | 1                     |
      | data[224].brand_id  | DB:brands:id:status=1 |
      | data[224].is_active | 1                     |
      | data[225].brand_id  | DB:brands:id:status=1 |
      | data[225].is_active | 1                     |
      | data[226].brand_id  | DB:brands:id:status=1 |
      | data[226].is_active | 1                     |
      | data[227].brand_id  | DB:brands:id:status=1 |
      | data[227].is_active | 1                     |
      | data[228].brand_id  | DB:brands:id:status=1 |
      | data[228].is_active | 1                     |
      | data[229].brand_id  | DB:brands:id:status=1 |
      | data[229].is_active | 1                     |
      | data[230].brand_id  | DB:brands:id:status=1 |
      | data[230].is_active | 1                     |
      | data[231].brand_id  | DB:brands:id:status=1 |
      | data[231].is_active | 1                     |
      | data[232].brand_id  | DB:brands:id:status=1 |
      | data[232].is_active | 1                     |
      | data[233].brand_id  | DB:brands:id:status=1 |
      | data[233].is_active | 1                     |
      | data[234].brand_id  | DB:brands:id:status=1 |
      | data[234].is_active | 1                     |
      | data[235].brand_id  | DB:brands:id:status=1 |
      | data[235].is_active | 1                     |
      | data[236].brand_id  | DB:brands:id:status=1 |
      | data[236].is_active | 1                     |
      | data[237].brand_id  | DB:brands:id:status=1 |
      | data[237].is_active | 1                     |
      | data[238].brand_id  | DB:brands:id:status=1 |
      | data[238].is_active | 1                     |
      | data[239].brand_id  | DB:brands:id:status=1 |
      | data[239].is_active | 1                     |
      | data[240].brand_id  | DB:brands:id:status=1 |
      | data[240].is_active | 1                     |
      | data[241].brand_id  | DB:brands:id:status=1 |
      | data[241].is_active | 1                     |
      | data[242].brand_id  | DB:brands:id:status=1 |
      | data[242].is_active | 1                     |
      | data[243].brand_id  | DB:brands:id:status=1 |
      | data[243].is_active | 1                     |
      | data[244].brand_id  | DB:brands:id:status=1 |
      | data[244].is_active | 1                     |
      | data[245].brand_id  | DB:brands:id:status=1 |
      | data[245].is_active | 1                     |
      | data[246].brand_id  | DB:brands:id:status=1 |
      | data[246].is_active | 1                     |
      | data[247].brand_id  | DB:brands:id:status=1 |
      | data[247].is_active | 1                     |
      | data[248].brand_id  | DB:brands:id:status=1 |
      | data[248].is_active | 1                     |
      | data[249].brand_id  | DB:brands:id:status=1 |
      | data[249].is_active | 1                     |
      | data[250].brand_id  | DB:brands:id:status=1 |
      | data[250].is_active | 1                     |
      | data[251].brand_id  | DB:brands:id:status=1 |
      | data[251].is_active | 1                     |
      | data[252].brand_id  | DB:brands:id:status=1 |
      | data[252].is_active | 1                     |
      | data[253].brand_id  | DB:brands:id:status=1 |
      | data[253].is_active | 1                     |
      | data[254].brand_id  | DB:brands:id:status=1 |
      | data[254].is_active | 1                     |
      | data[255].brand_id  | DB:brands:id:status=1 |
      | data[255].is_active | 1                     |
      | data[256].brand_id  | DB:brands:id:status=1 |
      | data[256].is_active | 1                     |
      | data[257].brand_id  | DB:brands:id:status=1 |
      | data[257].is_active | 1                     |
      | data[258].brand_id  | DB:brands:id:status=1 |
      | data[258].is_active | 1                     |
      | data[259].brand_id  | DB:brands:id:status=1 |
      | data[259].is_active | 1                     |
      | data[260].brand_id  | DB:brands:id:status=1 |
      | data[260].is_active | 1                     |
      | data[261].brand_id  | DB:brands:id:status=1 |
      | data[261].is_active | 1                     |
      | data[262].brand_id  | DB:brands:id:status=1 |
      | data[262].is_active | 1                     |
      | data[263].brand_id  | DB:brands:id:status=1 |
      | data[263].is_active | 1                     |
      | data[264].brand_id  | DB:brands:id:status=1 |
      | data[264].is_active | 1                     |
      | data[265].brand_id  | DB:brands:id:status=1 |
      | data[265].is_active | 1                     |
      | data[266].brand_id  | DB:brands:id:status=1 |
      | data[266].is_active | 1                     |
      | data[267].brand_id  | DB:brands:id:status=1 |
      | data[267].is_active | 1                     |
      | data[268].brand_id  | DB:brands:id:status=1 |
      | data[268].is_active | 1                     |
      | data[269].brand_id  | DB:brands:id:status=1 |
      | data[269].is_active | 1                     |
      | data[270].brand_id  | DB:brands:id:status=1 |
      | data[270].is_active | 1                     |
      | data[271].brand_id  | DB:brands:id:status=1 |
      | data[271].is_active | 1                     |
      | data[272].brand_id  | DB:brands:id:status=1 |
      | data[272].is_active | 1                     |
      | data[273].brand_id  | DB:brands:id:status=1 |
      | data[273].is_active | 1                     |
      | data[274].brand_id  | DB:brands:id:status=1 |
      | data[274].is_active | 1                     |
      | data[275].brand_id  | DB:brands:id:status=1 |
      | data[275].is_active | 1                     |
      | data[276].brand_id  | DB:brands:id:status=1 |
      | data[276].is_active | 1                     |
      | data[277].brand_id  | DB:brands:id:status=1 |
      | data[277].is_active | 1                     |
      | data[278].brand_id  | DB:brands:id:status=1 |
      | data[278].is_active | 1                     |
      | data[279].brand_id  | DB:brands:id:status=1 |
      | data[279].is_active | 1                     |
      | data[280].brand_id  | DB:brands:id:status=1 |
      | data[280].is_active | 1                     |
      | data[281].brand_id  | DB:brands:id:status=1 |
      | data[281].is_active | 1                     |
      | data[282].brand_id  | DB:brands:id:status=1 |
      | data[282].is_active | 1                     |
      | data[283].brand_id  | DB:brands:id:status=1 |
      | data[283].is_active | 1                     |
      | data[284].brand_id  | DB:brands:id:status=1 |
      | data[284].is_active | 1                     |
      | data[285].brand_id  | DB:brands:id:status=1 |
      | data[285].is_active | 1                     |
      | data[286].brand_id  | DB:brands:id:status=1 |
      | data[286].is_active | 1                     |
      | data[287].brand_id  | DB:brands:id:status=1 |
      | data[287].is_active | 1                     |
      | data[288].brand_id  | DB:brands:id:status=1 |
      | data[288].is_active | 1                     |
      | data[289].brand_id  | DB:brands:id:status=1 |
      | data[289].is_active | 1                     |
      | data[290].brand_id  | DB:brands:id:status=1 |
      | data[290].is_active | 1                     |
      | data[291].brand_id  | DB:brands:id:status=1 |
      | data[291].is_active | 1                     |
      | data[292].brand_id  | DB:brands:id:status=1 |
      | data[292].is_active | 1                     |
      | data[293].brand_id  | DB:brands:id:status=1 |
      | data[293].is_active | 1                     |
      | data[294].brand_id  | DB:brands:id:status=1 |
      | data[294].is_active | 1                     |
      | data[295].brand_id  | DB:brands:id:status=1 |
      | data[295].is_active | 1                     |
      | data[296].brand_id  | DB:brands:id:status=1 |
      | data[296].is_active | 1                     |
      | data[297].brand_id  | DB:brands:id:status=1 |
      | data[297].is_active | 1                     |
      | data[298].brand_id  | DB:brands:id:status=1 |
      | data[298].is_active | 1                     |
      | data[299].brand_id  | DB:brands:id:status=1 |
      | data[299].is_active | 1                     |
      | data[300].brand_id  | DB:brands:id:status=1 |
      | data[300].is_active | 1                     |
      | data[301].brand_id  | DB:brands:id:status=1 |
      | data[301].is_active | 1                     |
      | data[302].brand_id  | DB:brands:id:status=1 |
      | data[302].is_active | 1                     |
      | data[303].brand_id  | DB:brands:id:status=1 |
      | data[303].is_active | 1                     |
      | data[304].brand_id  | DB:brands:id:status=1 |
      | data[304].is_active | 1                     |
      | data[305].brand_id  | DB:brands:id:status=1 |
      | data[305].is_active | 1                     |
      | data[306].brand_id  | DB:brands:id:status=1 |
      | data[306].is_active | 1                     |
      | data[307].brand_id  | DB:brands:id:status=1 |
      | data[307].is_active | 1                     |
      | data[308].brand_id  | DB:brands:id:status=1 |
      | data[308].is_active | 1                     |
      | data[309].brand_id  | DB:brands:id:status=1 |
      | data[309].is_active | 1                     |
      | data[310].brand_id  | DB:brands:id:status=1 |
      | data[310].is_active | 1                     |
      | data[311].brand_id  | DB:brands:id:status=1 |
      | data[311].is_active | 1                     |
      | data[312].brand_id  | DB:brands:id:status=1 |
      | data[312].is_active | 1                     |
      | data[313].brand_id  | DB:brands:id:status=1 |
      | data[313].is_active | 1                     |
      | data[314].brand_id  | DB:brands:id:status=1 |
      | data[314].is_active | 1                     |
      | data[315].brand_id  | DB:brands:id:status=1 |
      | data[315].is_active | 1                     |
      | data[316].brand_id  | DB:brands:id:status=1 |
      | data[316].is_active | 1                     |
      | data[317].brand_id  | DB:brands:id:status=1 |
      | data[317].is_active | 1                     |
      | data[318].brand_id  | DB:brands:id:status=1 |
      | data[318].is_active | 1                     |
      | data[319].brand_id  | DB:brands:id:status=1 |
      | data[319].is_active | 1                     |
      | data[320].brand_id  | DB:brands:id:status=1 |
      | data[320].is_active | 1                     |
      | data[321].brand_id  | DB:brands:id:status=1 |
      | data[321].is_active | 1                     |
      | data[322].brand_id  | DB:brands:id:status=1 |
      | data[322].is_active | 1                     |
      | data[323].brand_id  | DB:brands:id:status=1 |
      | data[323].is_active | 1                     |
      | data[324].brand_id  | DB:brands:id:status=1 |
      | data[324].is_active | 1                     |
      | data[325].brand_id  | DB:brands:id:status=1 |
      | data[325].is_active | 1                     |
      | data[326].brand_id  | DB:brands:id:status=1 |
      | data[326].is_active | 1                     |
      | data[327].brand_id  | DB:brands:id:status=1 |
      | data[327].is_active | 1                     |
      | data[328].brand_id  | DB:brands:id:status=1 |
      | data[328].is_active | 1                     |
      | data[329].brand_id  | DB:brands:id:status=1 |
      | data[329].is_active | 1                     |
      | data[330].brand_id  | DB:brands:id:status=1 |
      | data[330].is_active | 1                     |
      | data[331].brand_id  | DB:brands:id:status=1 |
      | data[331].is_active | 1                     |
      | data[332].brand_id  | DB:brands:id:status=1 |
      | data[332].is_active | 1                     |
      | data[333].brand_id  | DB:brands:id:status=1 |
      | data[333].is_active | 1                     |
      | data[334].brand_id  | DB:brands:id:status=1 |
      | data[334].is_active | 1                     |
      | data[335].brand_id  | DB:brands:id:status=1 |
      | data[335].is_active | 1                     |
      | data[336].brand_id  | DB:brands:id:status=1 |
      | data[336].is_active | 1                     |
      | data[337].brand_id  | DB:brands:id:status=1 |
      | data[337].is_active | 1                     |
      | data[338].brand_id  | DB:brands:id:status=1 |
      | data[338].is_active | 1                     |
      | data[339].brand_id  | DB:brands:id:status=1 |
      | data[339].is_active | 1                     |
      | data[340].brand_id  | DB:brands:id:status=1 |
      | data[340].is_active | 1                     |
      | data[341].brand_id  | DB:brands:id:status=1 |
      | data[341].is_active | 1                     |
      | data[342].brand_id  | DB:brands:id:status=1 |
      | data[342].is_active | 1                     |
      | data[343].brand_id  | DB:brands:id:status=1 |
      | data[343].is_active | 1                     |
      | data[344].brand_id  | DB:brands:id:status=1 |
      | data[344].is_active | 1                     |
      | data[345].brand_id  | DB:brands:id:status=1 |
      | data[345].is_active | 1                     |
      | data[346].brand_id  | DB:brands:id:status=1 |
      | data[346].is_active | 1                     |
      | data[347].brand_id  | DB:brands:id:status=1 |
      | data[347].is_active | 1                     |
      | data[348].brand_id  | DB:brands:id:status=1 |
      | data[348].is_active | 1                     |
      | data[349].brand_id  | DB:brands:id:status=1 |
      | data[349].is_active | 1                     |
      | data[350].brand_id  | DB:brands:id:status=1 |
      | data[350].is_active | 1                     |
      | data[351].brand_id  | DB:brands:id:status=1 |
      | data[351].is_active | 1                     |
      | data[352].brand_id  | DB:brands:id:status=1 |
      | data[352].is_active | 1                     |
      | data[353].brand_id  | DB:brands:id:status=1 |
      | data[353].is_active | 1                     |
      | data[354].brand_id  | DB:brands:id:status=1 |
      | data[354].is_active | 1                     |
      | data[355].brand_id  | DB:brands:id:status=1 |
      | data[355].is_active | 1                     |
      | data[356].brand_id  | DB:brands:id:status=1 |
      | data[356].is_active | 1                     |
      | data[357].brand_id  | DB:brands:id:status=1 |
      | data[357].is_active | 1                     |
      | data[358].brand_id  | DB:brands:id:status=1 |
      | data[358].is_active | 1                     |
      | data[359].brand_id  | DB:brands:id:status=1 |
      | data[359].is_active | 1                     |
      | data[360].brand_id  | DB:brands:id:status=1 |
      | data[360].is_active | 1                     |
      | data[361].brand_id  | DB:brands:id:status=1 |
      | data[361].is_active | 1                     |
      | data[362].brand_id  | DB:brands:id:status=1 |
      | data[362].is_active | 1                     |
      | data[363].brand_id  | DB:brands:id:status=1 |
      | data[363].is_active | 1                     |
      | data[364].brand_id  | DB:brands:id:status=1 |
      | data[364].is_active | 1                     |
      | data[365].brand_id  | DB:brands:id:status=1 |
      | data[365].is_active | 1                     |
      | data[366].brand_id  | DB:brands:id:status=1 |
      | data[366].is_active | 1                     |
      | data[367].brand_id  | DB:brands:id:status=1 |
      | data[367].is_active | 1                     |
      | data[368].brand_id  | DB:brands:id:status=1 |
      | data[368].is_active | 1                     |
      | data[369].brand_id  | DB:brands:id:status=1 |
      | data[369].is_active | 1                     |
      | data[370].brand_id  | DB:brands:id:status=1 |
      | data[370].is_active | 1                     |
      | data[371].brand_id  | DB:brands:id:status=1 |
      | data[371].is_active | 1                     |
      | data[372].brand_id  | DB:brands:id:status=1 |
      | data[372].is_active | 1                     |
      | data[373].brand_id  | DB:brands:id:status=1 |
      | data[373].is_active | 1                     |
      | data[374].brand_id  | DB:brands:id:status=1 |
      | data[374].is_active | 1                     |
      | data[375].brand_id  | DB:brands:id:status=1 |
      | data[375].is_active | 1                     |
      | data[376].brand_id  | DB:brands:id:status=1 |
      | data[376].is_active | 1                     |
      | data[377].brand_id  | DB:brands:id:status=1 |
      | data[377].is_active | 1                     |
      | data[378].brand_id  | DB:brands:id:status=1 |
      | data[378].is_active | 1                     |
      | data[379].brand_id  | DB:brands:id:status=1 |
      | data[379].is_active | 1                     |
      | data[380].brand_id  | DB:brands:id:status=1 |
      | data[380].is_active | 1                     |
      | data[381].brand_id  | DB:brands:id:status=1 |
      | data[381].is_active | 1                     |
      | data[382].brand_id  | DB:brands:id:status=1 |
      | data[382].is_active | 1                     |
      | data[383].brand_id  | DB:brands:id:status=1 |
      | data[383].is_active | 1                     |
      | data[384].brand_id  | DB:brands:id:status=1 |
      | data[384].is_active | 1                     |
      | data[385].brand_id  | DB:brands:id:status=1 |
      | data[385].is_active | 1                     |
      | data[386].brand_id  | DB:brands:id:status=1 |
      | data[386].is_active | 1                     |
      | data[387].brand_id  | DB:brands:id:status=1 |
      | data[387].is_active | 1                     |
      | data[388].brand_id  | DB:brands:id:status=1 |
      | data[388].is_active | 1                     |
      | data[389].brand_id  | DB:brands:id:status=1 |
      | data[389].is_active | 1                     |
      | data[390].brand_id  | DB:brands:id:status=1 |
      | data[390].is_active | 1                     |
      | data[391].brand_id  | DB:brands:id:status=1 |
      | data[391].is_active | 1                     |
      | data[392].brand_id  | DB:brands:id:status=1 |
      | data[392].is_active | 1                     |
      | data[393].brand_id  | DB:brands:id:status=1 |
      | data[393].is_active | 1                     |
      | data[394].brand_id  | DB:brands:id:status=1 |
      | data[394].is_active | 1                     |
      | data[395].brand_id  | DB:brands:id:status=1 |
      | data[395].is_active | 1                     |
      | data[396].brand_id  | DB:brands:id:status=1 |
      | data[396].is_active | 1                     |
      | data[397].brand_id  | DB:brands:id:status=1 |
      | data[397].is_active | 1                     |
      | data[398].brand_id  | DB:brands:id:status=1 |
      | data[398].is_active | 1                     |
      | data[399].brand_id  | DB:brands:id:status=1 |
      | data[399].is_active | 1                     |
      | data[400].brand_id  | DB:brands:id:status=1 |
      | data[400].is_active | 1                     |
      | data[401].brand_id  | DB:brands:id:status=1 |
      | data[401].is_active | 1                     |
      | data[402].brand_id  | DB:brands:id:status=1 |
      | data[402].is_active | 1                     |
      | data[403].brand_id  | DB:brands:id:status=1 |
      | data[403].is_active | 1                     |
      | data[404].brand_id  | DB:brands:id:status=1 |
      | data[404].is_active | 1                     |
      | data[405].brand_id  | DB:brands:id:status=1 |
      | data[405].is_active | 1                     |
      | data[406].brand_id  | DB:brands:id:status=1 |
      | data[406].is_active | 1                     |
      | data[407].brand_id  | DB:brands:id:status=1 |
      | data[407].is_active | 1                     |
      | data[408].brand_id  | DB:brands:id:status=1 |
      | data[408].is_active | 1                     |
      | data[409].brand_id  | DB:brands:id:status=1 |
      | data[409].is_active | 1                     |
      | data[410].brand_id  | DB:brands:id:status=1 |
      | data[410].is_active | 1                     |
      | data[411].brand_id  | DB:brands:id:status=1 |
      | data[411].is_active | 1                     |
      | data[412].brand_id  | DB:brands:id:status=1 |
      | data[412].is_active | 1                     |
      | data[413].brand_id  | DB:brands:id:status=1 |
      | data[413].is_active | 1                     |
      | data[414].brand_id  | DB:brands:id:status=1 |
      | data[414].is_active | 1                     |
      | data[415].brand_id  | DB:brands:id:status=1 |
      | data[415].is_active | 1                     |
      | data[416].brand_id  | DB:brands:id:status=1 |
      | data[416].is_active | 1                     |
      | data[417].brand_id  | DB:brands:id:status=1 |
      | data[417].is_active | 1                     |
      | data[418].brand_id  | DB:brands:id:status=1 |
      | data[418].is_active | 1                     |
      | data[419].brand_id  | DB:brands:id:status=1 |
      | data[419].is_active | 1                     |
      | data[420].brand_id  | DB:brands:id:status=1 |
      | data[420].is_active | 1                     |
      | data[421].brand_id  | DB:brands:id:status=1 |
      | data[421].is_active | 1                     |
      | data[422].brand_id  | DB:brands:id:status=1 |
      | data[422].is_active | 1                     |
      | data[423].brand_id  | DB:brands:id:status=1 |
      | data[423].is_active | 1                     |
      | data[424].brand_id  | DB:brands:id:status=1 |
      | data[424].is_active | 1                     |
      | data[425].brand_id  | DB:brands:id:status=1 |
      | data[425].is_active | 1                     |
      | data[426].brand_id  | DB:brands:id:status=1 |
      | data[426].is_active | 1                     |
      | data[427].brand_id  | DB:brands:id:status=1 |
      | data[427].is_active | 1                     |
      | data[428].brand_id  | DB:brands:id:status=1 |
      | data[428].is_active | 1                     |
      | data[429].brand_id  | DB:brands:id:status=1 |
      | data[429].is_active | 1                     |
      | data[430].brand_id  | DB:brands:id:status=1 |
      | data[430].is_active | 1                     |
      | data[431].brand_id  | DB:brands:id:status=1 |
      | data[431].is_active | 1                     |
      | data[432].brand_id  | DB:brands:id:status=1 |
      | data[432].is_active | 1                     |
      | data[433].brand_id  | DB:brands:id:status=1 |
      | data[433].is_active | 1                     |
      | data[434].brand_id  | DB:brands:id:status=1 |
      | data[434].is_active | 1                     |
      | data[435].brand_id  | DB:brands:id:status=1 |
      | data[435].is_active | 1                     |
      | data[436].brand_id  | DB:brands:id:status=1 |
      | data[436].is_active | 1                     |
      | data[437].brand_id  | DB:brands:id:status=1 |
      | data[437].is_active | 1                     |
      | data[438].brand_id  | DB:brands:id:status=1 |
      | data[438].is_active | 1                     |
      | data[439].brand_id  | DB:brands:id:status=1 |
      | data[439].is_active | 1                     |
      | data[440].brand_id  | DB:brands:id:status=1 |
      | data[440].is_active | 1                     |
      | data[441].brand_id  | DB:brands:id:status=1 |
      | data[441].is_active | 1                     |
      | data[442].brand_id  | DB:brands:id:status=1 |
      | data[442].is_active | 1                     |
      | data[443].brand_id  | DB:brands:id:status=1 |
      | data[443].is_active | 1                     |
      | data[444].brand_id  | DB:brands:id:status=1 |
      | data[444].is_active | 1                     |
      | data[445].brand_id  | DB:brands:id:status=1 |
      | data[445].is_active | 1                     |
      | data[446].brand_id  | DB:brands:id:status=1 |
      | data[446].is_active | 1                     |
      | data[447].brand_id  | DB:brands:id:status=1 |
      | data[447].is_active | 1                     |
      | data[448].brand_id  | DB:brands:id:status=1 |
      | data[448].is_active | 1                     |
      | data[449].brand_id  | DB:brands:id:status=1 |
      | data[449].is_active | 1                     |
      | data[450].brand_id  | DB:brands:id:status=1 |
      | data[450].is_active | 1                     |
      | data[451].brand_id  | DB:brands:id:status=1 |
      | data[451].is_active | 1                     |
      | data[452].brand_id  | DB:brands:id:status=1 |
      | data[452].is_active | 1                     |
      | data[453].brand_id  | DB:brands:id:status=1 |
      | data[453].is_active | 1                     |
      | data[454].brand_id  | DB:brands:id:status=1 |
      | data[454].is_active | 1                     |
      | data[455].brand_id  | DB:brands:id:status=1 |
      | data[455].is_active | 1                     |
      | data[456].brand_id  | DB:brands:id:status=1 |
      | data[456].is_active | 1                     |
      | data[457].brand_id  | DB:brands:id:status=1 |
      | data[457].is_active | 1                     |
      | data[458].brand_id  | DB:brands:id:status=1 |
      | data[458].is_active | 1                     |
      | data[459].brand_id  | DB:brands:id:status=1 |
      | data[459].is_active | 1                     |
      | data[460].brand_id  | DB:brands:id:status=1 |
      | data[460].is_active | 1                     |
      | data[461].brand_id  | DB:brands:id:status=1 |
      | data[461].is_active | 1                     |
      | data[462].brand_id  | DB:brands:id:status=1 |
      | data[462].is_active | 1                     |
      | data[463].brand_id  | DB:brands:id:status=1 |
      | data[463].is_active | 1                     |
      | data[464].brand_id  | DB:brands:id:status=1 |
      | data[464].is_active | 1                     |
      | data[465].brand_id  | DB:brands:id:status=1 |
      | data[465].is_active | 1                     |
      | data[466].brand_id  | DB:brands:id:status=1 |
      | data[466].is_active | 1                     |
      | data[467].brand_id  | DB:brands:id:status=1 |
      | data[467].is_active | 1                     |
      | data[468].brand_id  | DB:brands:id:status=1 |
      | data[468].is_active | 1                     |
      | data[469].brand_id  | DB:brands:id:status=1 |
      | data[469].is_active | 1                     |
      | data[470].brand_id  | DB:brands:id:status=1 |
      | data[470].is_active | 1                     |
      | data[471].brand_id  | DB:brands:id:status=1 |
      | data[471].is_active | 1                     |
      | data[472].brand_id  | DB:brands:id:status=1 |
      | data[472].is_active | 1                     |
      | data[473].brand_id  | DB:brands:id:status=1 |
      | data[473].is_active | 1                     |
      | data[474].brand_id  | DB:brands:id:status=1 |
      | data[474].is_active | 1                     |
      | data[475].brand_id  | DB:brands:id:status=1 |
      | data[475].is_active | 1                     |
      | data[476].brand_id  | DB:brands:id:status=1 |
      | data[476].is_active | 1                     |
      | data[477].brand_id  | DB:brands:id:status=1 |
      | data[477].is_active | 1                     |
      | data[478].brand_id  | DB:brands:id:status=1 |
      | data[478].is_active | 1                     |
      | data[479].brand_id  | DB:brands:id:status=1 |
      | data[479].is_active | 1                     |
      | data[480].brand_id  | DB:brands:id:status=1 |
      | data[480].is_active | 1                     |
      | data[481].brand_id  | DB:brands:id:status=1 |
      | data[481].is_active | 1                     |
      | data[482].brand_id  | DB:brands:id:status=1 |
      | data[482].is_active | 1                     |
      | data[483].brand_id  | DB:brands:id:status=1 |
      | data[483].is_active | 1                     |
      | data[484].brand_id  | DB:brands:id:status=1 |
      | data[484].is_active | 1                     |
      | data[485].brand_id  | DB:brands:id:status=1 |
      | data[485].is_active | 1                     |
      | data[486].brand_id  | DB:brands:id:status=1 |
      | data[486].is_active | 1                     |
      | data[487].brand_id  | DB:brands:id:status=1 |
      | data[487].is_active | 1                     |
      | data[488].brand_id  | DB:brands:id:status=1 |
      | data[488].is_active | 1                     |
      | data[489].brand_id  | DB:brands:id:status=1 |
      | data[489].is_active | 1                     |
      | data[490].brand_id  | DB:brands:id:status=1 |
      | data[490].is_active | 1                     |
      | data[491].brand_id  | DB:brands:id:status=1 |
      | data[491].is_active | 1                     |
      | data[492].brand_id  | DB:brands:id:status=1 |
      | data[492].is_active | 1                     |
      | data[493].brand_id  | DB:brands:id:status=1 |
      | data[493].is_active | 1                     |
      | data[494].brand_id  | DB:brands:id:status=1 |
      | data[494].is_active | 1                     |
      | data[495].brand_id  | DB:brands:id:status=1 |
      | data[495].is_active | 1                     |
      | data[496].brand_id  | DB:brands:id:status=1 |
      | data[496].is_active | 1                     |
      | data[497].brand_id  | DB:brands:id:status=1 |
      | data[497].is_active | 1                     |
      | data[498].brand_id  | DB:brands:id:status=1 |
      | data[498].is_active | 1                     |
      | data[499].brand_id  | DB:brands:id:status=1 |
      | data[499].is_active | 1                     |
      | data[500].brand_id  | DB:brands:id:status=1 |
      | data[500].is_active | 1                     |
      | data[501].brand_id  | DB:brands:id:status=1 |
      | data[501].is_active | 1                     |
      | data[502].brand_id  | DB:brands:id:status=1 |
      | data[502].is_active | 1                     |
      | data[503].brand_id  | DB:brands:id:status=1 |
      | data[503].is_active | 1                     |
      | data[504].brand_id  | DB:brands:id:status=1 |
      | data[504].is_active | 1                     |
      | data[505].brand_id  | DB:brands:id:status=1 |
      | data[505].is_active | 1                     |
      | data[506].brand_id  | DB:brands:id:status=1 |
      | data[506].is_active | 1                     |
      | data[507].brand_id  | DB:brands:id:status=1 |
      | data[507].is_active | 1                     |
      | data[508].brand_id  | DB:brands:id:status=1 |
      | data[508].is_active | 1                     |
      | data[509].brand_id  | DB:brands:id:status=1 |
      | data[509].is_active | 1                     |
      | data[510].brand_id  | DB:brands:id:status=1 |
      | data[510].is_active | 1                     |
      | data[511].brand_id  | DB:brands:id:status=1 |
      | data[511].is_active | 1                     |
      | data[512].brand_id  | DB:brands:id:status=1 |
      | data[512].is_active | 1                     |
      | data[513].brand_id  | DB:brands:id:status=1 |
      | data[513].is_active | 1                     |
      | data[514].brand_id  | DB:brands:id:status=1 |
      | data[514].is_active | 1                     |
      | data[515].brand_id  | DB:brands:id:status=1 |
      | data[515].is_active | 1                     |
      | data[516].brand_id  | DB:brands:id:status=1 |
      | data[516].is_active | 1                     |
      | data[517].brand_id  | DB:brands:id:status=1 |
      | data[517].is_active | 1                     |
      | data[518].brand_id  | DB:brands:id:status=1 |
      | data[518].is_active | 1                     |
      | data[519].brand_id  | DB:brands:id:status=1 |
      | data[519].is_active | 1                     |
      | data[520].brand_id  | DB:brands:id:status=1 |
      | data[520].is_active | 1                     |
      | data[521].brand_id  | DB:brands:id:status=1 |
      | data[521].is_active | 1                     |
      | data[522].brand_id  | DB:brands:id:status=1 |
      | data[522].is_active | 1                     |
      | data[523].brand_id  | DB:brands:id:status=1 |
      | data[523].is_active | 1                     |
      | data[524].brand_id  | DB:brands:id:status=1 |
      | data[524].is_active | 1                     |
      | data[525].brand_id  | DB:brands:id:status=1 |
      | data[525].is_active | 1                     |
      | data[526].brand_id  | DB:brands:id:status=1 |
      | data[526].is_active | 1                     |
      | data[527].brand_id  | DB:brands:id:status=1 |
      | data[527].is_active | 1                     |
      | data[528].brand_id  | DB:brands:id:status=1 |
      | data[528].is_active | 1                     |
      | data[529].brand_id  | DB:brands:id:status=1 |
      | data[529].is_active | 1                     |
      | data[530].brand_id  | DB:brands:id:status=1 |
      | data[530].is_active | 1                     |
      | data[531].brand_id  | DB:brands:id:status=1 |
      | data[531].is_active | 1                     |
      | data[532].brand_id  | DB:brands:id:status=1 |
      | data[532].is_active | 1                     |
      | data[533].brand_id  | DB:brands:id:status=1 |
      | data[533].is_active | 1                     |
      | data[534].brand_id  | DB:brands:id:status=1 |
      | data[534].is_active | 1                     |
      | data[535].brand_id  | DB:brands:id:status=1 |
      | data[535].is_active | 1                     |
      | data[536].brand_id  | DB:brands:id:status=1 |
      | data[536].is_active | 1                     |
      | data[537].brand_id  | DB:brands:id:status=1 |
      | data[537].is_active | 1                     |
      | data[538].brand_id  | DB:brands:id:status=1 |
      | data[538].is_active | 1                     |
      | data[539].brand_id  | DB:brands:id:status=1 |
      | data[539].is_active | 1                     |
      | data[540].brand_id  | DB:brands:id:status=1 |
      | data[540].is_active | 1                     |
      | data[541].brand_id  | DB:brands:id:status=1 |
      | data[541].is_active | 1                     |
      | data[542].brand_id  | DB:brands:id:status=1 |
      | data[542].is_active | 1                     |
      | data[543].brand_id  | DB:brands:id:status=1 |
      | data[543].is_active | 1                     |
      | data[544].brand_id  | DB:brands:id:status=1 |
      | data[544].is_active | 1                     |
      | data[545].brand_id  | DB:brands:id:status=1 |
      | data[545].is_active | 1                     |
      | data[546].brand_id  | DB:brands:id:status=1 |
      | data[546].is_active | 1                     |
      | data[547].brand_id  | DB:brands:id:status=1 |
      | data[547].is_active | 1                     |
      | data[548].brand_id  | DB:brands:id:status=1 |
      | data[548].is_active | 1                     |
      | data[549].brand_id  | DB:brands:id:status=1 |
      | data[549].is_active | 1                     |
      | data[550].brand_id  | DB:brands:id:status=1 |
      | data[550].is_active | 1                     |
      | data[551].brand_id  | DB:brands:id:status=1 |
      | data[551].is_active | 1                     |
      | data[552].brand_id  | DB:brands:id:status=1 |
      | data[552].is_active | 1                     |
      | data[553].brand_id  | DB:brands:id:status=1 |
      | data[553].is_active | 1                     |
      | data[554].brand_id  | DB:brands:id:status=1 |
      | data[554].is_active | 1                     |
      | data[555].brand_id  | DB:brands:id:status=1 |
      | data[555].is_active | 1                     |
      | data[556].brand_id  | DB:brands:id:status=1 |
      | data[556].is_active | 1                     |
      | data[557].brand_id  | DB:brands:id:status=1 |
      | data[557].is_active | 1                     |
      | data[558].brand_id  | DB:brands:id:status=1 |
      | data[558].is_active | 1                     |
      | data[559].brand_id  | DB:brands:id:status=1 |
      | data[559].is_active | 1                     |
      | data[560].brand_id  | DB:brands:id:status=1 |
      | data[560].is_active | 1                     |
      | data[561].brand_id  | DB:brands:id:status=1 |
      | data[561].is_active | 1                     |
      | data[562].brand_id  | DB:brands:id:status=1 |
      | data[562].is_active | 1                     |
      | data[563].brand_id  | DB:brands:id:status=1 |
      | data[563].is_active | 1                     |
      | data[564].brand_id  | DB:brands:id:status=1 |
      | data[564].is_active | 1                     |
      | data[565].brand_id  | DB:brands:id:status=1 |
      | data[565].is_active | 1                     |
      | data[566].brand_id  | DB:brands:id:status=1 |
      | data[566].is_active | 1                     |
      | data[567].brand_id  | DB:brands:id:status=1 |
      | data[567].is_active | 1                     |
      | data[568].brand_id  | DB:brands:id:status=1 |
      | data[568].is_active | 1                     |
      | data[569].brand_id  | DB:brands:id:status=1 |
      | data[569].is_active | 1                     |
      | data[570].brand_id  | DB:brands:id:status=1 |
      | data[570].is_active | 1                     |
      | data[571].brand_id  | DB:brands:id:status=1 |
      | data[571].is_active | 1                     |
      | data[572].brand_id  | DB:brands:id:status=1 |
      | data[572].is_active | 1                     |
      | data[573].brand_id  | DB:brands:id:status=1 |
      | data[573].is_active | 1                     |
      | data[574].brand_id  | DB:brands:id:status=1 |
      | data[574].is_active | 1                     |
      | data[575].brand_id  | DB:brands:id:status=1 |
      | data[575].is_active | 1                     |
      | data[576].brand_id  | DB:brands:id:status=1 |
      | data[576].is_active | 1                     |
      | data[577].brand_id  | DB:brands:id:status=1 |
      | data[577].is_active | 1                     |
      | data[578].brand_id  | DB:brands:id:status=1 |
      | data[578].is_active | 1                     |
      | data[579].brand_id  | DB:brands:id:status=1 |
      | data[579].is_active | 1                     |
      | data[580].brand_id  | DB:brands:id:status=1 |
      | data[580].is_active | 1                     |
      | data[581].brand_id  | DB:brands:id:status=1 |
      | data[581].is_active | 1                     |
      | data[582].brand_id  | DB:brands:id:status=1 |
      | data[582].is_active | 1                     |
      | data[583].brand_id  | DB:brands:id:status=1 |
      | data[583].is_active | 1                     |
      | data[584].brand_id  | DB:brands:id:status=1 |
      | data[584].is_active | 1                     |
      | data[585].brand_id  | DB:brands:id:status=1 |
      | data[585].is_active | 1                     |
      | data[586].brand_id  | DB:brands:id:status=1 |
      | data[586].is_active | 1                     |
      | data[587].brand_id  | DB:brands:id:status=1 |
      | data[587].is_active | 1                     |
      | data[588].brand_id  | DB:brands:id:status=1 |
      | data[588].is_active | 1                     |
      | data[589].brand_id  | DB:brands:id:status=1 |
      | data[589].is_active | 1                     |
      | data[590].brand_id  | DB:brands:id:status=1 |
      | data[590].is_active | 1                     |
      | data[591].brand_id  | DB:brands:id:status=1 |
      | data[591].is_active | 1                     |
      | data[592].brand_id  | DB:brands:id:status=1 |
      | data[592].is_active | 1                     |
      | data[593].brand_id  | DB:brands:id:status=1 |
      | data[593].is_active | 1                     |
      | data[594].brand_id  | DB:brands:id:status=1 |
      | data[594].is_active | 1                     |
      | data[595].brand_id  | DB:brands:id:status=1 |
      | data[595].is_active | 1                     |
      | data[596].brand_id  | DB:brands:id:status=1 |
      | data[596].is_active | 1                     |
      | data[597].brand_id  | DB:brands:id:status=1 |
      | data[597].is_active | 1                     |
      | data[598].brand_id  | DB:brands:id:status=1 |
      | data[598].is_active | 1                     |
      | data[599].brand_id  | DB:brands:id:status=1 |
      | data[599].is_active | 1                     |
      | data[600].brand_id  | DB:brands:id:status=1 |
      | data[600].is_active | 1                     |
      | data[601].brand_id  | DB:brands:id:status=1 |
      | data[601].is_active | 1                     |
      | data[602].brand_id  | DB:brands:id:status=1 |
      | data[602].is_active | 1                     |
      | data[603].brand_id  | DB:brands:id:status=1 |
      | data[603].is_active | 1                     |
      | data[604].brand_id  | DB:brands:id:status=1 |
      | data[604].is_active | 1                     |
      | data[605].brand_id  | DB:brands:id:status=1 |
      | data[605].is_active | 1                     |
      | data[606].brand_id  | DB:brands:id:status=1 |
      | data[606].is_active | 1                     |
      | data[607].brand_id  | DB:brands:id:status=1 |
      | data[607].is_active | 1                     |
      | data[608].brand_id  | DB:brands:id:status=1 |
      | data[608].is_active | 1                     |
      | data[609].brand_id  | DB:brands:id:status=1 |
      | data[609].is_active | 1                     |
      | data[610].brand_id  | DB:brands:id:status=1 |
      | data[610].is_active | 1                     |
      | data[611].brand_id  | DB:brands:id:status=1 |
      | data[611].is_active | 1                     |
      | data[612].brand_id  | DB:brands:id:status=1 |
      | data[612].is_active | 1                     |
      | data[613].brand_id  | DB:brands:id:status=1 |
      | data[613].is_active | 1                     |
      | data[614].brand_id  | DB:brands:id:status=1 |
      | data[614].is_active | 1                     |
      | data[615].brand_id  | DB:brands:id:status=1 |
      | data[615].is_active | 1                     |
      | data[616].brand_id  | DB:brands:id:status=1 |
      | data[616].is_active | 1                     |
      | data[617].brand_id  | DB:brands:id:status=1 |
      | data[617].is_active | 1                     |
      | data[618].brand_id  | DB:brands:id:status=1 |
      | data[618].is_active | 1                     |
      | data[619].brand_id  | DB:brands:id:status=1 |
      | data[619].is_active | 1                     |
      | data[620].brand_id  | DB:brands:id:status=1 |
      | data[620].is_active | 1                     |
      | data[621].brand_id  | DB:brands:id:status=1 |
      | data[621].is_active | 1                     |
      | data[622].brand_id  | DB:brands:id:status=1 |
      | data[622].is_active | 1                     |
      | data[623].brand_id  | DB:brands:id:status=1 |
      | data[623].is_active | 1                     |
      | data[624].brand_id  | DB:brands:id:status=1 |
      | data[624].is_active | 1                     |
      | data[625].brand_id  | DB:brands:id:status=1 |
      | data[625].is_active | 1                     |
      | data[626].brand_id  | DB:brands:id:status=1 |
      | data[626].is_active | 1                     |
      | data[627].brand_id  | DB:brands:id:status=1 |
      | data[627].is_active | 1                     |
      | data[628].brand_id  | DB:brands:id:status=1 |
      | data[628].is_active | 1                     |
      | data[629].brand_id  | DB:brands:id:status=1 |
      | data[629].is_active | 1                     |
      | data[630].brand_id  | DB:brands:id:status=1 |
      | data[630].is_active | 1                     |
      | data[631].brand_id  | DB:brands:id:status=1 |
      | data[631].is_active | 1                     |
      | data[632].brand_id  | DB:brands:id:status=1 |
      | data[632].is_active | 1                     |
      | data[633].brand_id  | DB:brands:id:status=1 |
      | data[633].is_active | 1                     |
      | data[634].brand_id  | DB:brands:id:status=1 |
      | data[634].is_active | 1                     |
      | data[635].brand_id  | DB:brands:id:status=1 |
      | data[635].is_active | 1                     |
      | data[636].brand_id  | DB:brands:id:status=1 |
      | data[636].is_active | 1                     |
      | data[637].brand_id  | DB:brands:id:status=1 |
      | data[637].is_active | 1                     |
      | data[638].brand_id  | DB:brands:id:status=1 |
      | data[638].is_active | 1                     |
      | data[639].brand_id  | DB:brands:id:status=1 |
      | data[639].is_active | 1                     |
      | data[640].brand_id  | DB:brands:id:status=1 |
      | data[640].is_active | 1                     |
      | data[641].brand_id  | DB:brands:id:status=1 |
      | data[641].is_active | 1                     |
      | data[642].brand_id  | DB:brands:id:status=1 |
      | data[642].is_active | 1                     |
      | data[643].brand_id  | DB:brands:id:status=1 |
      | data[643].is_active | 1                     |
      | data[644].brand_id  | DB:brands:id:status=1 |
      | data[644].is_active | 1                     |
      | data[645].brand_id  | DB:brands:id:status=1 |
      | data[645].is_active | 1                     |
      | data[646].brand_id  | DB:brands:id:status=1 |
      | data[646].is_active | 1                     |
      | data[647].brand_id  | DB:brands:id:status=1 |
      | data[647].is_active | 1                     |
      | data[648].brand_id  | DB:brands:id:status=1 |
      | data[648].is_active | 1                     |
      | data[649].brand_id  | DB:brands:id:status=1 |
      | data[649].is_active | 1                     |
      | data[650].brand_id  | DB:brands:id:status=1 |
      | data[650].is_active | 1                     |
      | data[651].brand_id  | DB:brands:id:status=1 |
      | data[651].is_active | 1                     |
      | data[652].brand_id  | DB:brands:id:status=1 |
      | data[652].is_active | 1                     |
      | data[653].brand_id  | DB:brands:id:status=1 |
      | data[653].is_active | 1                     |
      | data[654].brand_id  | DB:brands:id:status=1 |
      | data[654].is_active | 1                     |
      | data[655].brand_id  | DB:brands:id:status=1 |
      | data[655].is_active | 1                     |
      | data[656].brand_id  | DB:brands:id:status=1 |
      | data[656].is_active | 1                     |
      | data[657].brand_id  | DB:brands:id:status=1 |
      | data[657].is_active | 1                     |
      | data[658].brand_id  | DB:brands:id:status=1 |
      | data[658].is_active | 1                     |
      | data[659].brand_id  | DB:brands:id:status=1 |
      | data[659].is_active | 1                     |
      | data[660].brand_id  | DB:brands:id:status=1 |
      | data[660].is_active | 1                     |
      | data[661].brand_id  | DB:brands:id:status=1 |
      | data[661].is_active | 1                     |
      | data[662].brand_id  | DB:brands:id:status=1 |
      | data[662].is_active | 1                     |
      | data[663].brand_id  | DB:brands:id:status=1 |
      | data[663].is_active | 1                     |
      | data[664].brand_id  | DB:brands:id:status=1 |
      | data[664].is_active | 1                     |
      | data[665].brand_id  | DB:brands:id:status=1 |
      | data[665].is_active | 1                     |
      | data[666].brand_id  | DB:brands:id:status=1 |
      | data[666].is_active | 1                     |
      | data[667].brand_id  | DB:brands:id:status=1 |
      | data[667].is_active | 1                     |
      | data[668].brand_id  | DB:brands:id:status=1 |
      | data[668].is_active | 1                     |
      | data[669].brand_id  | DB:brands:id:status=1 |
      | data[669].is_active | 1                     |
      | data[670].brand_id  | DB:brands:id:status=1 |
      | data[670].is_active | 1                     |
      | data[671].brand_id  | DB:brands:id:status=1 |
      | data[671].is_active | 1                     |
      | data[672].brand_id  | DB:brands:id:status=1 |
      | data[672].is_active | 1                     |
      | data[673].brand_id  | DB:brands:id:status=1 |
      | data[673].is_active | 1                     |
      | data[674].brand_id  | DB:brands:id:status=1 |
      | data[674].is_active | 1                     |
      | data[675].brand_id  | DB:brands:id:status=1 |
      | data[675].is_active | 1                     |
      | data[676].brand_id  | DB:brands:id:status=1 |
      | data[676].is_active | 1                     |
      | data[677].brand_id  | DB:brands:id:status=1 |
      | data[677].is_active | 1                     |
      | data[678].brand_id  | DB:brands:id:status=1 |
      | data[678].is_active | 1                     |
      | data[679].brand_id  | DB:brands:id:status=1 |
      | data[679].is_active | 1                     |
      | data[680].brand_id  | DB:brands:id:status=1 |
      | data[680].is_active | 1                     |
      | data[681].brand_id  | DB:brands:id:status=1 |
      | data[681].is_active | 1                     |
      | data[682].brand_id  | DB:brands:id:status=1 |
      | data[682].is_active | 1                     |
      | data[683].brand_id  | DB:brands:id:status=1 |
      | data[683].is_active | 1                     |
      | data[684].brand_id  | DB:brands:id:status=1 |
      | data[684].is_active | 1                     |
      | data[685].brand_id  | DB:brands:id:status=1 |
      | data[685].is_active | 1                     |
      | data[686].brand_id  | DB:brands:id:status=1 |
      | data[686].is_active | 1                     |
      | data[687].brand_id  | DB:brands:id:status=1 |
      | data[687].is_active | 1                     |
      | data[688].brand_id  | DB:brands:id:status=1 |
      | data[688].is_active | 1                     |
      | data[689].brand_id  | DB:brands:id:status=1 |
      | data[689].is_active | 1                     |
      | data[690].brand_id  | DB:brands:id:status=1 |
      | data[690].is_active | 1                     |
      | data[691].brand_id  | DB:brands:id:status=1 |
      | data[691].is_active | 1                     |
      | data[692].brand_id  | DB:brands:id:status=1 |
      | data[692].is_active | 1                     |
      | data[693].brand_id  | DB:brands:id:status=1 |
      | data[693].is_active | 1                     |
      | data[694].brand_id  | DB:brands:id:status=1 |
      | data[694].is_active | 1                     |
      | data[695].brand_id  | DB:brands:id:status=1 |
      | data[695].is_active | 1                     |
      | data[696].brand_id  | DB:brands:id:status=1 |
      | data[696].is_active | 1                     |
      | data[697].brand_id  | DB:brands:id:status=1 |
      | data[697].is_active | 1                     |
      | data[698].brand_id  | DB:brands:id:status=1 |
      | data[698].is_active | 1                     |
      | data[699].brand_id  | DB:brands:id:status=1 |
      | data[699].is_active | 1                     |
      | data[700].brand_id  | DB:brands:id:status=1 |
      | data[700].is_active | 1                     |
      | data[701].brand_id  | DB:brands:id:status=1 |
      | data[701].is_active | 1                     |
      | data[702].brand_id  | DB:brands:id:status=1 |
      | data[702].is_active | 1                     |
      | data[703].brand_id  | DB:brands:id:status=1 |
      | data[703].is_active | 1                     |
      | data[704].brand_id  | DB:brands:id:status=1 |
      | data[704].is_active | 1                     |
      | data[705].brand_id  | DB:brands:id:status=1 |
      | data[705].is_active | 1                     |
      | data[706].brand_id  | DB:brands:id:status=1 |
      | data[706].is_active | 1                     |
      | data[707].brand_id  | DB:brands:id:status=1 |
      | data[707].is_active | 1                     |
      | data[708].brand_id  | DB:brands:id:status=1 |
      | data[708].is_active | 1                     |
      | data[709].brand_id  | DB:brands:id:status=1 |
      | data[709].is_active | 1                     |
      | data[710].brand_id  | DB:brands:id:status=1 |
      | data[710].is_active | 1                     |
      | data[711].brand_id  | DB:brands:id:status=1 |
      | data[711].is_active | 1                     |
      | data[712].brand_id  | DB:brands:id:status=1 |
      | data[712].is_active | 1                     |
      | data[713].brand_id  | DB:brands:id:status=1 |
      | data[713].is_active | 1                     |
      | data[714].brand_id  | DB:brands:id:status=1 |
      | data[714].is_active | 1                     |
      | data[715].brand_id  | DB:brands:id:status=1 |
      | data[715].is_active | 1                     |
      | data[716].brand_id  | DB:brands:id:status=1 |
      | data[716].is_active | 1                     |
      | data[717].brand_id  | DB:brands:id:status=1 |
      | data[717].is_active | 1                     |
      | data[718].brand_id  | DB:brands:id:status=1 |
      | data[718].is_active | 1                     |
      | data[719].brand_id  | DB:brands:id:status=1 |
      | data[719].is_active | 1                     |
      | data[720].brand_id  | DB:brands:id:status=1 |
      | data[720].is_active | 1                     |
      | data[721].brand_id  | DB:brands:id:status=1 |
      | data[721].is_active | 1                     |
      | data[722].brand_id  | DB:brands:id:status=1 |
      | data[722].is_active | 1                     |
      | data[723].brand_id  | DB:brands:id:status=1 |
      | data[723].is_active | 1                     |
      | data[724].brand_id  | DB:brands:id:status=1 |
      | data[724].is_active | 1                     |
      | data[725].brand_id  | DB:brands:id:status=1 |
      | data[725].is_active | 1                     |
      | data[726].brand_id  | DB:brands:id:status=1 |
      | data[726].is_active | 1                     |
      | data[727].brand_id  | DB:brands:id:status=1 |
      | data[727].is_active | 1                     |
      | data[728].brand_id  | DB:brands:id:status=1 |
      | data[728].is_active | 1                     |
      | data[729].brand_id  | DB:brands:id:status=1 |
      | data[729].is_active | 1                     |
      | data[730].brand_id  | DB:brands:id:status=1 |
      | data[730].is_active | 1                     |
      | data[731].brand_id  | DB:brands:id:status=1 |
      | data[731].is_active | 1                     |
      | data[732].brand_id  | DB:brands:id:status=1 |
      | data[732].is_active | 1                     |
      | data[733].brand_id  | DB:brands:id:status=1 |
      | data[733].is_active | 1                     |
      | data[734].brand_id  | DB:brands:id:status=1 |
      | data[734].is_active | 1                     |
      | data[735].brand_id  | DB:brands:id:status=1 |
      | data[735].is_active | 1                     |
      | data[736].brand_id  | DB:brands:id:status=1 |
      | data[736].is_active | 1                     |
      | data[737].brand_id  | DB:brands:id:status=1 |
      | data[737].is_active | 1                     |
      | data[738].brand_id  | DB:brands:id:status=1 |
      | data[738].is_active | 1                     |
      | data[739].brand_id  | DB:brands:id:status=1 |
      | data[739].is_active | 1                     |
      | data[740].brand_id  | DB:brands:id:status=1 |
      | data[740].is_active | 1                     |
      | data[741].brand_id  | DB:brands:id:status=1 |
      | data[741].is_active | 1                     |
      | data[742].brand_id  | DB:brands:id:status=1 |
      | data[742].is_active | 1                     |
      | data[743].brand_id  | DB:brands:id:status=1 |
      | data[743].is_active | 1                     |
      | data[744].brand_id  | DB:brands:id:status=1 |
      | data[744].is_active | 1                     |
      | data[745].brand_id  | DB:brands:id:status=1 |
      | data[745].is_active | 1                     |
      | data[746].brand_id  | DB:brands:id:status=1 |
      | data[746].is_active | 1                     |
      | data[747].brand_id  | DB:brands:id:status=1 |
      | data[747].is_active | 1                     |
      | data[748].brand_id  | DB:brands:id:status=1 |
      | data[748].is_active | 1                     |
      | data[749].brand_id  | DB:brands:id:status=1 |
      | data[749].is_active | 1                     |
      | data[750].brand_id  | DB:brands:id:status=1 |
      | data[750].is_active | 1                     |
      | data[751].brand_id  | DB:brands:id:status=1 |
      | data[751].is_active | 1                     |
      | data[752].brand_id  | DB:brands:id:status=1 |
      | data[752].is_active | 1                     |
      | data[753].brand_id  | DB:brands:id:status=1 |
      | data[753].is_active | 1                     |
      | data[754].brand_id  | DB:brands:id:status=1 |
      | data[754].is_active | 1                     |
      | data[755].brand_id  | DB:brands:id:status=1 |
      | data[755].is_active | 1                     |
      | data[756].brand_id  | DB:brands:id:status=1 |
      | data[756].is_active | 1                     |
      | data[757].brand_id  | DB:brands:id:status=1 |
      | data[757].is_active | 1                     |
      | data[758].brand_id  | DB:brands:id:status=1 |
      | data[758].is_active | 1                     |
      | data[759].brand_id  | DB:brands:id:status=1 |
      | data[759].is_active | 1                     |
      | data[760].brand_id  | DB:brands:id:status=1 |
      | data[760].is_active | 1                     |
      | data[761].brand_id  | DB:brands:id:status=1 |
      | data[761].is_active | 1                     |
      | data[762].brand_id  | DB:brands:id:status=1 |
      | data[762].is_active | 1                     |
      | data[763].brand_id  | DB:brands:id:status=1 |
      | data[763].is_active | 1                     |
      | data[764].brand_id  | DB:brands:id:status=1 |
      | data[764].is_active | 1                     |
      | data[765].brand_id  | DB:brands:id:status=1 |
      | data[765].is_active | 1                     |
      | data[766].brand_id  | DB:brands:id:status=1 |
      | data[766].is_active | 1                     |
      | data[767].brand_id  | DB:brands:id:status=1 |
      | data[767].is_active | 1                     |
      | data[768].brand_id  | DB:brands:id:status=1 |
      | data[768].is_active | 1                     |
      | data[769].brand_id  | DB:brands:id:status=1 |
      | data[769].is_active | 1                     |
      | data[770].brand_id  | DB:brands:id:status=1 |
      | data[770].is_active | 1                     |
      | data[771].brand_id  | DB:brands:id:status=1 |
      | data[771].is_active | 1                     |
      | data[772].brand_id  | DB:brands:id:status=1 |
      | data[772].is_active | 1                     |
      | data[773].brand_id  | DB:brands:id:status=1 |
      | data[773].is_active | 1                     |
      | data[774].brand_id  | DB:brands:id:status=1 |
      | data[774].is_active | 1                     |
      | data[775].brand_id  | DB:brands:id:status=1 |
      | data[775].is_active | 1                     |
      | data[776].brand_id  | DB:brands:id:status=1 |
      | data[776].is_active | 1                     |
      | data[777].brand_id  | DB:brands:id:status=1 |
      | data[777].is_active | 1                     |
      | data[778].brand_id  | DB:brands:id:status=1 |
      | data[778].is_active | 1                     |
      | data[779].brand_id  | DB:brands:id:status=1 |
      | data[779].is_active | 1                     |
      | data[780].brand_id  | DB:brands:id:status=1 |
      | data[780].is_active | 1                     |
      | data[781].brand_id  | DB:brands:id:status=1 |
      | data[781].is_active | 1                     |
      | data[782].brand_id  | DB:brands:id:status=1 |
      | data[782].is_active | 1                     |
      | data[783].brand_id  | DB:brands:id:status=1 |
      | data[783].is_active | 1                     |
      | data[784].brand_id  | DB:brands:id:status=1 |
      | data[784].is_active | 1                     |
      | data[785].brand_id  | DB:brands:id:status=1 |
      | data[785].is_active | 1                     |
      | data[786].brand_id  | DB:brands:id:status=1 |
      | data[786].is_active | 1                     |
      | data[787].brand_id  | DB:brands:id:status=1 |
      | data[787].is_active | 1                     |
      | data[788].brand_id  | DB:brands:id:status=1 |
      | data[788].is_active | 1                     |
      | data[789].brand_id  | DB:brands:id:status=1 |
      | data[789].is_active | 1                     |
      | data[790].brand_id  | DB:brands:id:status=1 |
      | data[790].is_active | 1                     |
      | data[791].brand_id  | DB:brands:id:status=1 |
      | data[791].is_active | 1                     |
      | data[792].brand_id  | DB:brands:id:status=1 |
      | data[792].is_active | 1                     |
      | data[793].brand_id  | DB:brands:id:status=1 |
      | data[793].is_active | 1                     |
      | data[794].brand_id  | DB:brands:id:status=1 |
      | data[794].is_active | 1                     |
      | data[795].brand_id  | DB:brands:id:status=1 |
      | data[795].is_active | 1                     |
      | data[796].brand_id  | DB:brands:id:status=1 |
      | data[796].is_active | 1                     |
      | data[797].brand_id  | DB:brands:id:status=1 |
      | data[797].is_active | 1                     |
      | data[798].brand_id  | DB:brands:id:status=1 |
      | data[798].is_active | 1                     |
      | data[799].brand_id  | DB:brands:id:status=1 |
      | data[799].is_active | 1                     |
      | data[800].brand_id  | DB:brands:id:status=1 |
      | data[800].is_active | 1                     |
      | data[801].brand_id  | DB:brands:id:status=1 |
      | data[801].is_active | 1                     |
      | data[802].brand_id  | DB:brands:id:status=1 |
      | data[802].is_active | 1                     |
      | data[803].brand_id  | DB:brands:id:status=1 |
      | data[803].is_active | 1                     |
      | data[804].brand_id  | DB:brands:id:status=1 |
      | data[804].is_active | 1                     |
      | data[805].brand_id  | DB:brands:id:status=1 |
      | data[805].is_active | 1                     |
      | data[806].brand_id  | DB:brands:id:status=1 |
      | data[806].is_active | 1                     |
      | data[807].brand_id  | DB:brands:id:status=1 |
      | data[807].is_active | 1                     |
      | data[808].brand_id  | DB:brands:id:status=1 |
      | data[808].is_active | 1                     |
      | data[809].brand_id  | DB:brands:id:status=1 |
      | data[809].is_active | 1                     |
      | data[810].brand_id  | DB:brands:id:status=1 |
      | data[810].is_active | 1                     |
      | data[811].brand_id  | DB:brands:id:status=1 |
      | data[811].is_active | 1                     |
      | data[812].brand_id  | DB:brands:id:status=1 |
      | data[812].is_active | 1                     |
      | data[813].brand_id  | DB:brands:id:status=1 |
      | data[813].is_active | 1                     |
      | data[814].brand_id  | DB:brands:id:status=1 |
      | data[814].is_active | 1                     |
      | data[815].brand_id  | DB:brands:id:status=1 |
      | data[815].is_active | 1                     |
      | data[816].brand_id  | DB:brands:id:status=1 |
      | data[816].is_active | 1                     |
      | data[817].brand_id  | DB:brands:id:status=1 |
      | data[817].is_active | 1                     |
      | data[818].brand_id  | DB:brands:id:status=1 |
      | data[818].is_active | 1                     |
      | data[819].brand_id  | DB:brands:id:status=1 |
      | data[819].is_active | 1                     |
      | data[820].brand_id  | DB:brands:id:status=1 |
      | data[820].is_active | 1                     |
      | data[821].brand_id  | DB:brands:id:status=1 |
      | data[821].is_active | 1                     |
      | data[822].brand_id  | DB:brands:id:status=1 |
      | data[822].is_active | 1                     |
      | data[823].brand_id  | DB:brands:id:status=1 |
      | data[823].is_active | 1                     |
      | data[824].brand_id  | DB:brands:id:status=1 |
      | data[824].is_active | 1                     |
      | data[825].brand_id  | DB:brands:id:status=1 |
      | data[825].is_active | 1                     |
      | data[826].brand_id  | DB:brands:id:status=1 |
      | data[826].is_active | 1                     |
      | data[827].brand_id  | DB:brands:id:status=1 |
      | data[827].is_active | 1                     |
      | data[828].brand_id  | DB:brands:id:status=1 |
      | data[828].is_active | 1                     |
      | data[829].brand_id  | DB:brands:id:status=1 |
      | data[829].is_active | 1                     |
      | data[830].brand_id  | DB:brands:id:status=1 |
      | data[830].is_active | 1                     |
      | data[831].brand_id  | DB:brands:id:status=1 |
      | data[831].is_active | 1                     |
      | data[832].brand_id  | DB:brands:id:status=1 |
      | data[832].is_active | 1                     |
      | data[833].brand_id  | DB:brands:id:status=1 |
      | data[833].is_active | 1                     |
      | data[834].brand_id  | DB:brands:id:status=1 |
      | data[834].is_active | 1                     |
      | data[835].brand_id  | DB:brands:id:status=1 |
      | data[835].is_active | 1                     |
      | data[836].brand_id  | DB:brands:id:status=1 |
      | data[836].is_active | 1                     |
      | data[837].brand_id  | DB:brands:id:status=1 |
      | data[837].is_active | 1                     |
      | data[838].brand_id  | DB:brands:id:status=1 |
      | data[838].is_active | 1                     |
      | data[839].brand_id  | DB:brands:id:status=1 |
      | data[839].is_active | 1                     |
      | data[840].brand_id  | DB:brands:id:status=1 |
      | data[840].is_active | 1                     |
      | data[841].brand_id  | DB:brands:id:status=1 |
      | data[841].is_active | 1                     |
      | data[842].brand_id  | DB:brands:id:status=1 |
      | data[842].is_active | 1                     |
      | data[843].brand_id  | DB:brands:id:status=1 |
      | data[843].is_active | 1                     |
      | data[844].brand_id  | DB:brands:id:status=1 |
      | data[844].is_active | 1                     |
      | data[845].brand_id  | DB:brands:id:status=1 |
      | data[845].is_active | 1                     |
      | data[846].brand_id  | DB:brands:id:status=1 |
      | data[846].is_active | 1                     |
      | data[847].brand_id  | DB:brands:id:status=1 |
      | data[847].is_active | 1                     |
      | data[848].brand_id  | DB:brands:id:status=1 |
      | data[848].is_active | 1                     |
      | data[849].brand_id  | DB:brands:id:status=1 |
      | data[849].is_active | 1                     |
      | data[850].brand_id  | DB:brands:id:status=1 |
      | data[850].is_active | 1                     |
      | data[851].brand_id  | DB:brands:id:status=1 |
      | data[851].is_active | 1                     |
      | data[852].brand_id  | DB:brands:id:status=1 |
      | data[852].is_active | 1                     |
      | data[853].brand_id  | DB:brands:id:status=1 |
      | data[853].is_active | 1                     |
      | data[854].brand_id  | DB:brands:id:status=1 |
      | data[854].is_active | 1                     |
      | data[855].brand_id  | DB:brands:id:status=1 |
      | data[855].is_active | 1                     |
      | data[856].brand_id  | DB:brands:id:status=1 |
      | data[856].is_active | 1                     |
      | data[857].brand_id  | DB:brands:id:status=1 |
      | data[857].is_active | 1                     |
      | data[858].brand_id  | DB:brands:id:status=1 |
      | data[858].is_active | 1                     |
      | data[859].brand_id  | DB:brands:id:status=1 |
      | data[859].is_active | 1                     |
      | data[860].brand_id  | DB:brands:id:status=1 |
      | data[860].is_active | 1                     |
      | data[861].brand_id  | DB:brands:id:status=1 |
      | data[861].is_active | 1                     |
      | data[862].brand_id  | DB:brands:id:status=1 |
      | data[862].is_active | 1                     |
      | data[863].brand_id  | DB:brands:id:status=1 |
      | data[863].is_active | 1                     |
      | data[864].brand_id  | DB:brands:id:status=1 |
      | data[864].is_active | 1                     |
      | data[865].brand_id  | DB:brands:id:status=1 |
      | data[865].is_active | 1                     |
      | data[866].brand_id  | DB:brands:id:status=1 |
      | data[866].is_active | 1                     |
      | data[867].brand_id  | DB:brands:id:status=1 |
      | data[867].is_active | 1                     |
      | data[868].brand_id  | DB:brands:id:status=1 |
      | data[868].is_active | 1                     |
      | data[869].brand_id  | DB:brands:id:status=1 |
      | data[869].is_active | 1                     |
      | data[870].brand_id  | DB:brands:id:status=1 |
      | data[870].is_active | 1                     |
      | data[871].brand_id  | DB:brands:id:status=1 |
      | data[871].is_active | 1                     |
      | data[872].brand_id  | DB:brands:id:status=1 |
      | data[872].is_active | 1                     |
      | data[873].brand_id  | DB:brands:id:status=1 |
      | data[873].is_active | 1                     |
      | data[874].brand_id  | DB:brands:id:status=1 |
      | data[874].is_active | 1                     |
      | data[875].brand_id  | DB:brands:id:status=1 |
      | data[875].is_active | 1                     |
      | data[876].brand_id  | DB:brands:id:status=1 |
      | data[876].is_active | 1                     |
      | data[877].brand_id  | DB:brands:id:status=1 |
      | data[877].is_active | 1                     |
      | data[878].brand_id  | DB:brands:id:status=1 |
      | data[878].is_active | 1                     |
      | data[879].brand_id  | DB:brands:id:status=1 |
      | data[879].is_active | 1                     |
      | data[880].brand_id  | DB:brands:id:status=1 |
      | data[880].is_active | 1                     |
      | data[881].brand_id  | DB:brands:id:status=1 |
      | data[881].is_active | 1                     |
      | data[882].brand_id  | DB:brands:id:status=1 |
      | data[882].is_active | 1                     |
      | data[883].brand_id  | DB:brands:id:status=1 |
      | data[883].is_active | 1                     |
      | data[884].brand_id  | DB:brands:id:status=1 |
      | data[884].is_active | 1                     |
      | data[885].brand_id  | DB:brands:id:status=1 |
      | data[885].is_active | 1                     |
      | data[886].brand_id  | DB:brands:id:status=1 |
      | data[886].is_active | 1                     |
      | data[887].brand_id  | DB:brands:id:status=1 |
      | data[887].is_active | 1                     |
      | data[888].brand_id  | DB:brands:id:status=1 |
      | data[888].is_active | 1                     |
      | data[889].brand_id  | DB:brands:id:status=1 |
      | data[889].is_active | 1                     |
      | data[890].brand_id  | DB:brands:id:status=1 |
      | data[890].is_active | 1                     |
      | data[891].brand_id  | DB:brands:id:status=1 |
      | data[891].is_active | 1                     |
      | data[892].brand_id  | DB:brands:id:status=1 |
      | data[892].is_active | 1                     |
      | data[893].brand_id  | DB:brands:id:status=1 |
      | data[893].is_active | 1                     |
      | data[894].brand_id  | DB:brands:id:status=1 |
      | data[894].is_active | 1                     |
      | data[895].brand_id  | DB:brands:id:status=1 |
      | data[895].is_active | 1                     |
      | data[896].brand_id  | DB:brands:id:status=1 |
      | data[896].is_active | 1                     |
      | data[897].brand_id  | DB:brands:id:status=1 |
      | data[897].is_active | 1                     |
      | data[898].brand_id  | DB:brands:id:status=1 |
      | data[898].is_active | 1                     |
      | data[899].brand_id  | DB:brands:id:status=1 |
      | data[899].is_active | 1                     |
      | data[900].brand_id  | DB:brands:id:status=1 |
      | data[900].is_active | 1                     |
      | data[901].brand_id  | DB:brands:id:status=1 |
      | data[901].is_active | 1                     |
      | data[902].brand_id  | DB:brands:id:status=1 |
      | data[902].is_active | 1                     |
      | data[903].brand_id  | DB:brands:id:status=1 |
      | data[903].is_active | 1                     |
      | data[904].brand_id  | DB:brands:id:status=1 |
      | data[904].is_active | 1                     |
      | data[905].brand_id  | DB:brands:id:status=1 |
      | data[905].is_active | 1                     |
      | data[906].brand_id  | DB:brands:id:status=1 |
      | data[906].is_active | 1                     |
      | data[907].brand_id  | DB:brands:id:status=1 |
      | data[907].is_active | 1                     |
      | data[908].brand_id  | DB:brands:id:status=1 |
      | data[908].is_active | 1                     |
      | data[909].brand_id  | DB:brands:id:status=1 |
      | data[909].is_active | 1                     |
      | data[910].brand_id  | DB:brands:id:status=1 |
      | data[910].is_active | 1                     |
      | data[911].brand_id  | DB:brands:id:status=1 |
      | data[911].is_active | 1                     |
      | data[912].brand_id  | DB:brands:id:status=1 |
      | data[912].is_active | 1                     |
      | data[913].brand_id  | DB:brands:id:status=1 |
      | data[913].is_active | 1                     |
      | data[914].brand_id  | DB:brands:id:status=1 |
      | data[914].is_active | 1                     |
      | data[915].brand_id  | DB:brands:id:status=1 |
      | data[915].is_active | 1                     |
      | data[916].brand_id  | DB:brands:id:status=1 |
      | data[916].is_active | 1                     |
      | data[917].brand_id  | DB:brands:id:status=1 |
      | data[917].is_active | 1                     |
      | data[918].brand_id  | DB:brands:id:status=1 |
      | data[918].is_active | 1                     |
      | data[919].brand_id  | DB:brands:id:status=1 |
      | data[919].is_active | 1                     |
      | data[920].brand_id  | DB:brands:id:status=1 |
      | data[920].is_active | 1                     |
      | data[921].brand_id  | DB:brands:id:status=1 |
      | data[921].is_active | 1                     |
      | data[922].brand_id  | DB:brands:id:status=1 |
      | data[922].is_active | 1                     |
      | data[923].brand_id  | DB:brands:id:status=1 |
      | data[923].is_active | 1                     |
      | data[924].brand_id  | DB:brands:id:status=1 |
      | data[924].is_active | 1                     |
      | data[925].brand_id  | DB:brands:id:status=1 |
      | data[925].is_active | 1                     |
      | data[926].brand_id  | DB:brands:id:status=1 |
      | data[926].is_active | 1                     |
      | data[927].brand_id  | DB:brands:id:status=1 |
      | data[927].is_active | 1                     |
      | data[928].brand_id  | DB:brands:id:status=1 |
      | data[928].is_active | 1                     |
      | data[929].brand_id  | DB:brands:id:status=1 |
      | data[929].is_active | 1                     |
      | data[930].brand_id  | DB:brands:id:status=1 |
      | data[930].is_active | 1                     |
      | data[931].brand_id  | DB:brands:id:status=1 |
      | data[931].is_active | 1                     |
      | data[932].brand_id  | DB:brands:id:status=1 |
      | data[932].is_active | 1                     |
      | data[933].brand_id  | DB:brands:id:status=1 |
      | data[933].is_active | 1                     |
      | data[934].brand_id  | DB:brands:id:status=1 |
      | data[934].is_active | 1                     |
      | data[935].brand_id  | DB:brands:id:status=1 |
      | data[935].is_active | 1                     |
      | data[936].brand_id  | DB:brands:id:status=1 |
      | data[936].is_active | 1                     |
      | data[937].brand_id  | DB:brands:id:status=1 |
      | data[937].is_active | 1                     |
      | data[938].brand_id  | DB:brands:id:status=1 |
      | data[938].is_active | 1                     |
      | data[939].brand_id  | DB:brands:id:status=1 |
      | data[939].is_active | 1                     |
      | data[940].brand_id  | DB:brands:id:status=1 |
      | data[940].is_active | 1                     |
      | data[941].brand_id  | DB:brands:id:status=1 |
      | data[941].is_active | 1                     |
      | data[942].brand_id  | DB:brands:id:status=1 |
      | data[942].is_active | 1                     |
      | data[943].brand_id  | DB:brands:id:status=1 |
      | data[943].is_active | 1                     |
      | data[944].brand_id  | DB:brands:id:status=1 |
      | data[944].is_active | 1                     |
      | data[945].brand_id  | DB:brands:id:status=1 |
      | data[945].is_active | 1                     |
      | data[946].brand_id  | DB:brands:id:status=1 |
      | data[946].is_active | 1                     |
      | data[947].brand_id  | DB:brands:id:status=1 |
      | data[947].is_active | 1                     |
      | data[948].brand_id  | DB:brands:id:status=1 |
      | data[948].is_active | 1                     |
      | data[949].brand_id  | DB:brands:id:status=1 |
      | data[949].is_active | 1                     |
      | data[950].brand_id  | DB:brands:id:status=1 |
      | data[950].is_active | 1                     |
      | data[951].brand_id  | DB:brands:id:status=1 |
      | data[951].is_active | 1                     |
      | data[952].brand_id  | DB:brands:id:status=1 |
      | data[952].is_active | 1                     |
      | data[953].brand_id  | DB:brands:id:status=1 |
      | data[953].is_active | 1                     |
      | data[954].brand_id  | DB:brands:id:status=1 |
      | data[954].is_active | 1                     |
      | data[955].brand_id  | DB:brands:id:status=1 |
      | data[955].is_active | 1                     |
      | data[956].brand_id  | DB:brands:id:status=1 |
      | data[956].is_active | 1                     |
      | data[957].brand_id  | DB:brands:id:status=1 |
      | data[957].is_active | 1                     |
      | data[958].brand_id  | DB:brands:id:status=1 |
      | data[958].is_active | 1                     |
      | data[959].brand_id  | DB:brands:id:status=1 |
      | data[959].is_active | 1                     |
      | data[960].brand_id  | DB:brands:id:status=1 |
      | data[960].is_active | 1                     |
      | data[961].brand_id  | DB:brands:id:status=1 |
      | data[961].is_active | 1                     |
      | data[962].brand_id  | DB:brands:id:status=1 |
      | data[962].is_active | 1                     |
      | data[963].brand_id  | DB:brands:id:status=1 |
      | data[963].is_active | 1                     |
      | data[964].brand_id  | DB:brands:id:status=1 |
      | data[964].is_active | 1                     |
      | data[965].brand_id  | DB:brands:id:status=1 |
      | data[965].is_active | 1                     |
      | data[966].brand_id  | DB:brands:id:status=1 |
      | data[966].is_active | 1                     |
      | data[967].brand_id  | DB:brands:id:status=1 |
      | data[967].is_active | 1                     |
      | data[968].brand_id  | DB:brands:id:status=1 |
      | data[968].is_active | 1                     |
      | data[969].brand_id  | DB:brands:id:status=1 |
      | data[969].is_active | 1                     |
      | data[970].brand_id  | DB:brands:id:status=1 |
      | data[970].is_active | 1                     |
      | data[971].brand_id  | DB:brands:id:status=1 |
      | data[971].is_active | 1                     |
      | data[972].brand_id  | DB:brands:id:status=1 |
      | data[972].is_active | 1                     |
      | data[973].brand_id  | DB:brands:id:status=1 |
      | data[973].is_active | 1                     |
      | data[974].brand_id  | DB:brands:id:status=1 |
      | data[974].is_active | 1                     |
      | data[975].brand_id  | DB:brands:id:status=1 |
      | data[975].is_active | 1                     |
      | data[976].brand_id  | DB:brands:id:status=1 |
      | data[976].is_active | 1                     |
      | data[977].brand_id  | DB:brands:id:status=1 |
      | data[977].is_active | 1                     |
      | data[978].brand_id  | DB:brands:id:status=1 |
      | data[978].is_active | 1                     |
      | data[979].brand_id  | DB:brands:id:status=1 |
      | data[979].is_active | 1                     |
      | data[980].brand_id  | DB:brands:id:status=1 |
      | data[980].is_active | 1                     |
      | data[981].brand_id  | DB:brands:id:status=1 |
      | data[981].is_active | 1                     |
      | data[982].brand_id  | DB:brands:id:status=1 |
      | data[982].is_active | 1                     |
      | data[983].brand_id  | DB:brands:id:status=1 |
      | data[983].is_active | 1                     |
      | data[984].brand_id  | DB:brands:id:status=1 |
      | data[984].is_active | 1                     |
      | data[985].brand_id  | DB:brands:id:status=1 |
      | data[985].is_active | 1                     |
      | data[986].brand_id  | DB:brands:id:status=1 |
      | data[986].is_active | 1                     |
      | data[987].brand_id  | DB:brands:id:status=1 |
      | data[987].is_active | 1                     |
      | data[988].brand_id  | DB:brands:id:status=1 |
      | data[988].is_active | 1                     |
      | data[989].brand_id  | DB:brands:id:status=1 |
      | data[989].is_active | 1                     |
      | data[990].brand_id  | DB:brands:id:status=1 |
      | data[990].is_active | 1                     |
      | data[991].brand_id  | DB:brands:id:status=1 |
      | data[991].is_active | 1                     |
      | data[992].brand_id  | DB:brands:id:status=1 |
      | data[992].is_active | 1                     |
      | data[993].brand_id  | DB:brands:id:status=1 |
      | data[993].is_active | 1                     |
      | data[994].brand_id  | DB:brands:id:status=1 |
      | data[994].is_active | 1                     |
      | data[995].brand_id  | DB:brands:id:status=1 |
      | data[995].is_active | 1                     |
      | data[996].brand_id  | DB:brands:id:status=1 |
      | data[996].is_active | 1                     |
      | data[997].brand_id  | DB:brands:id:status=1 |
      | data[997].is_active | 1                     |
      | data[998].brand_id  | DB:brands:id:status=1 |
      | data[998].is_active | 1                     |
      | data[999].brand_id  | DB:brands:id:status=1 |
      | data[999].is_active | 1                     |
    When I post the request with "insertBulkMdmData_subbrand_mdm" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And I verify the data got updated as needed from DB
      | expectedColumn                                                        | expectedValue         |
      | DB:subbrands:name: id=(SELECT MAX(id)-1 FROM subbrands)               | randomString          |
      | DB:subbrands:is_active: id=(SELECT MAX(id)-1 FROM subbrands)          | true                  |
      | DB:subbrands:isvisible_retailer: id=(SELECT MAX(id)-1 FROM subbrands) | true                  |
      | DB:subbrands:erp_id: id=(SELECT MAX(id)-1 FROM subbrands)             | randomString          |
      | DB:subbrands:brand_id: id=(SELECT MAX(id)-1 FROM subbrands)           | DB:brands:id:status=1 |
      | DB:subbrands:imageurl: id=(SELECT MAX(id)-1 FROM subbrands)           | randomString          |
      | DB:subbrands:name: id=(SELECT MAX(id) FROM subbrands)                 | randomString          |
      | DB:subbrands:is_active: id=(SELECT MAX(id) FROM subbrands)            | true                  |
      | DB:subbrands:isvisible_retailer: id=(SELECT MAX(id) FROM subbrands)   | true                  |
      | DB:subbrands:erp_id: id=(SELECT MAX(id) FROM subbrands)               | randomString          |
      | DB:subbrands:brand_id: id=(SELECT MAX(id) FROM subbrands)             | DB:brands:id:status=1 |
      | DB:subbrands:imageurl: id=(SELECT MAX(id) FROM subbrands)             | randomString          |
    And verify response time is less than "3000" milliseconds

  @Subbrand25
  Scenario:Valid and active brand id
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_subbrand_mdm" payload
      | JPath            | Value                 |
      | data[0].name     | randomString          |
      | data[0].brand_id | DB:brands:id:status=1 |
      | data[1].name     | randomString          |
      | data[1].brand_id | DB:brands:id:status=1 |
    When I post the request with "insertMdmData_subbrand_mdm" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And I verify the data got updated as needed from DB
      | expectedColumn                                               | expectedValue         |
      | DB:subbrands:name: id=(SELECT MAX(id)-1 FROM subbrands)      | randomString          |
      | DB:subbrands:is_active: id=(SELECT MAX(id)-1 FROM subbrands) | true                  |
      | DB:subbrands:brand_id: id=(SELECT MAX(id)-1 FROM subbrands)  | DB:brands:id:status=1 |
      | DB:subbrands:name: id=(SELECT MAX(id) FROM subbrands)        | randomString          |
      | DB:subbrands:is_active: id=(SELECT MAX(id) FROM subbrands)   | true                  |
      | DB:subbrands:brand_id: id=(SELECT MAX(id) FROM subbrands)    | DB:brands:id:status=1 |
    And verify response time is less than "3000" milliseconds

  @Subbrand26
  Scenario:InValid and In_active brand id
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_subbrand_mdm" payload
      | JPath            | Value                 |
      | data[0].name     | randomString          |
      | data[0].brand_id | DB:brands:id:status=0 |
      | data[1].name     | randomString          |
      | data[0].brand_id | DB:brands:id:status=0 |
    When I post the request with "insertMdmData_subbrand_mdm" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | false                      |
      | Reason.1[0].Column |  brand_id|
      |  Reason.2[0].Column | brand_id |
    And verify response time is less than "3000" milliseconds
  @Subbrand27
  Scenario:InValid brand id -alphabets
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_subbrand_mdm" payload
      | JPath            | Value        |
      | data[0].name     | randomString |
      | data[0].brand_id | alphabets    |
      | data[1].name     | randomString |
      | data[1].brand_id | alpha123!@#  |
    When I post the request with "insertMdmData_subbrand_mdm" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath              | Value                                     |
      | Result             | false                                     |
      | Reason.1[0].Column | brand_id                                  |
      | Reason.1[0].Error  | The value alphabets should be numeric.    |
      | Reason.2[0].Column | brand_id                                  |
      | Reason.2[0].Error  | The value alpha123!@# should be numeric. |
    And verify response time is less than "3000" milliseconds






















